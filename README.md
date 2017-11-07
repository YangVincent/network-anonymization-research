
## Notes
#### Bro
##### Useful links:
* ![Bro Infographic](http://gauss.ececs.uc.edu/Courses/c5155/pdf/bro_log_vars.pdf) (link: http://gauss.ececs.uc.edu/Courses/c5155/pdf/bro_log_vars.pdf)
* [Instructions on how to run bro](https://www.bro.org/sphinx/quickstart/#reading-packet-capture-pcap-files)

##### Instructions
* Get pcap data; run `bro -r <packetfile>`

##### General information
* Bro can be installed with `brew install bro`
* It is an IDS - intrusion detection system.
* It can take live packets or packet dumps (pcap = packet capture)
* Bro outputs 3 main files: conn.log (connections), stats.log, and weird.log. The log files' meanings are in the 
infographic.
* The difference between bro and snort is that snort uses pattern detection; bro uses
far more. 

#### Anonymization
* TCPurify
* IPsumdump

#### Separating network data to TCP, UDP, ICMP:
* Wireshark
* tShark

#### Network Datasets
* LBL: http://www.icir.org/enterprise-tracing/links.html
* Davis

