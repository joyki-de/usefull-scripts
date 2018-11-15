#! /bin/bash
case "$(pidof Ark | wc -w)" in
0)
~/ark-start.sh
;;
1)
;;
esac
