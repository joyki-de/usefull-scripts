#!/bin/bash

declare -r checksum_file="/tmp/blocklists/checksums.txt"

if [ ! -d /tmp/blocklists ]; then
  mkdir /tmp/blocklists
fi
if [ ! -f $checksum_file ]; then
  touch $checksum_file
fi

declare -A blocklist_urls
blocklist_urls["blocklistde_v4"]="ipv4|https://ipv64.net/blocklists/ipv64_blocklist_v4_blocklistde_all.txt"
blocklist_urls["blocklistde_v6"]="ipv6|https://ipv64.net/blocklists/ipv64_blocklist_v6_blocklistde_all.txt"
blocklist_urls["spamhaus_v4"]="ipv4|https://ipv64.net/blocklists/ipv64_blocklist_v4_spamhaus_drop.txt"
blocklist_urls["spamhaus_v6"]="ipv6|https://ipv64.net/blocklists/ipv64_blocklist_v6_spamhaus_drop.txt"
blocklist_urls["dshield_v4"]="ipv4|https://ipv64.net/blocklists/ipv64_blocklist_v4_dshield1.txt"
blocklist_urls["dshield_v6"]="ipv6|https://ipv64.net/blocklists/ipv64_blocklist_v6_dshield1.txt"
blocklist_urls["tor_nodes_v4"]="ipv4|https://ipv64.net/blocklists/ipv64_blocklist_v4_tor_all.txt"
blocklist_urls["tor_nodes_v6"]="ipv6|https://ipv64.net/blocklists/ipv64_blocklist_v6_tor_all.txt"

function update_blocklist() {
  local key=$1
  local category=$2
  local url=$3

  local ipset_list="blocked_ips_$key"
  local ip_list_file="/tmp/blocklists/$key.txt"

  echo "----------------------------------------"

  echo "Check if $key blocklist needs to be updated..."
  
  local checksum=$(curl -s $url | shasum -a 256 | cut -d ' ' -f 1)
  local old_checksum=$(grep $key $checksum_file | cut -d ' ' -f 2)

  echo "Checksum:     $checksum"
  echo "Old checksum: $old_checksum"

  if [ ! -f $ip_list_file ] || [ "$checksum" != "$old_checksum" ]; then

    echo "Updating $key blocklist..."

    curl -s $url > $ip_list_file

    if ipset list $ipset_list &>/dev/null; then
      echo "Deleting old $key blocklist..."
      if [ "$category" == "ipv6" ]; then
        ip6tables -D INPUT -m set --match-set $ipset_list src -j DROP
      else
        iptables -D INPUT -m set --match-set $ipset_list src -j DROP
      fi
      sleep 1
      ipset destroy $ipset_list
      sleep 1
    fi

    echo "Creating new $key blocklist..."
    if [ "$category" == "ipv6" ]; then
      ipset create $ipset_list hash:net family inet6
    else
      ipset create $ipset_list hash:net family inet
    fi

    while IFS= read -r line; do
      if ! ipset test $ipset_list $line &>/dev/null; then
        ipset add $ipset_list $line
      fi
    done < $ip_list_file

    echo "Adding $key blocklist to iptables..."
    if [ "$category" == "ipv6" ]; then
      ip6tables -A INPUT -m set --match-set $ipset_list src -j DROP
    else
      iptables -A INPUT -m set --match-set $ipset_list src -j DROP
    fi

    echo "Updating checksum..."
    sed -i -E "s/($key) [a-f0-9]+/\1 $checksum/g;t" $checksum_file

  else
    echo "$key blocklist is up to date."
  fi
}

for key in "${!blocklist_urls[@]}"; do
  url_info=${blocklist_urls[$key]}
  category=$(echo $url_info | cut -d '|' -f 1)
  url=$(echo $url_info | cut -d '|' -f 2)

  update_blocklist $key $category $url
done