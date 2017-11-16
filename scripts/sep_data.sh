mkdir raw
mkdir decoded
tshark -r $1 -Y "tcp" -w raw/tcp_raw.pcap
tshark -r $1 -Y "udp" -w raw/udp_raw.pcap
tshark -r $1 -Y "icmp" -w raw/icmp_raw.pcap
tshark -r $1 -Y "tcp" > decoded/tcp_decoded
tshark -r $1 -Y "udp" > decoded/udp_decoded
tshark -r $1 -Y "icmp" > decoded/icmp_decoded
