
## Notes
#### Bro
##### Useful links:
* Bro Infographic: http://gauss.ececs.uc.edu/Courses/c5155/pdf/bro_log_vars.pdf
* [Instructions on how to run bro](https://www.bro.org/sphinx/quickstart/#reading-packet-capture-pcap-files)

##### Instructions
* Get pcap data; run `bro -r <packetfile>`
* This will create `*.log` files. 

##### General information
* Bro can be installed with `brew install bro`
* It is an IDS - intrusion detection system.
* It can take live packets or packet dumps (pcap = packet capture)
* Bro outputs 3 main files: conn.log (connections), notice.log (weird, bad, or interesting), and weird.log. The log files' meanings are in the 
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

#### Information from Somdutta:
I used LBNL data available on their site and UCD network data. Go to "Download traces" in this link, http://www.icir.org/enterprise-tracing/Overview.html. This data set had been anonymized before they were posted online. They used tcpmkpub to anonymize the posted data. Click on "Papers"  to access the paper, "The Devil and Packet Trace Anonymization".

The anonymization tools that I used are TCPurify ( https://web.archive.org/web/20140203210616/irg.cs.ohiou.edu/~eblanton/tcpurify/ ) and IPsumdump ( http://read.seas.harvard.edu/~kohler/ipsumdump/ ). The README file of TCPurify talks about anonymizing network data two ways. I have used the "nullify" option. I think another student had found that the "table" version has bugs in it.

From each non-anonymized file I extracted 3 sets of data based on protocol. The protocols are TCP, ICMP and UDP. To do this I used tShark. As discussed in the meeting, I noticed that the output file of tShark was recognised by IPsumdump. I used Editcap to convert to a PCAP format and noticed that IPsumdump could process this. You guys could test this if works without using Editcap.

I ran the anonymization tools mentioned above on each of these non-anonymized files. I ran Snort on both the non-anonymized and anonymized version of the files. I used all default rules for Snort version 2.9.7.0. I passed the anonymized and non-anonmized files through Snort and found the number of false positives, false negatives and true positives. I also analyzed Snort rules for which the alerts were generated and the network packets for which the alerts were generated.

In order to analyze the effect of anonymization on security analysis, sensitivity (true positives / (true positives + false negatives)) and the ratio of false positives to true positives ( false +ves / true +positives) were calculated and conclusion is derived based on these values.
