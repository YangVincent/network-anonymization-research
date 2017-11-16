
# Notes
### Bro
#### Useful links:
* Bro Infographic: http://gauss.ececs.uc.edu/Courses/c5155/pdf/bro_log_vars.pdf
* [Instructions on how to run bro](https://www.bro.org/sphinx/quickstart/#reading-packet-capture-pcap-files)

#### Instructions
# **How to capture and anonymize network data**
1. Capturing data: Use `tcpdump` [guide](http://inst.eecs.berkeley.edu/~ee122/fa06/projects/tcpdump-6up.pdf)
2. Install TCPurify. Type `brew install tcpurify.rb`, as the original is deleted. `tcpurify.rb` is
in `/setup`
3. Generate the data - `sudo tcpdump -w 0001.pcap -i eth0`. To customize this, check out the above guide.
4. Now, we want to anonymize `0001.pcap`. Use `tcpurify -t -f 0001.pcap none > out`. Be sure to not `cat` out. The
binary may make your terminal freeze. If you want to investigate, use `xxd out`.
5. Make two directories $orig, $anon - one for each of the instances we want to analyze. Move our
files correspondingly.
6. Use `bro -r <filename>` where `<filename>` can be `0001.pcap` or `out`. This will create `*.log` files. 
7. Compare the output files.

# **How to separate network data to TCP, UDP, ICMP**
1. Install tshark (Wireshark on Mac)
2. Find abbreviations of protocols that we can specify with tshark:
`tshark -G protocols | grep <protocol name>`
The abbreviations we are interested in: tcp, udp, icmp
3. Run tshark on pcap file specifying which protocol we want to filter out using display filter (-Y). Save raw data (pcap) and decoded data.
	1. `tshark -r <pcap file name> -Y <protocol abbreviation> -w <name of output file to save raw data>`
	2. `tshark -r <pcap file name> -Y <protocol abbreviation> > <name of output file to save decoded data>`

# **Explanation of Scripts:**
* NOTE: Remember to run `chmod +x <script name>` before running the script.
* get_data.sh: Downloads all trace files from the LBNL website. Run this script in the directory where you want to save all the trace files. Run as follows: `./get_data.sh`
* sep_data.sh: Separates trace file into tcp, udp, and icmp datasets. Saves resulting 3 raw pcap files in a new directory called "raw" and the decoded version of the files in a new directory called "decoded". Run as follows: `./sep_data.sh <pcap file name>`


#### General information
* Bro can be installed with `brew install bro`
* It is an IDS - intrusion detection system.
* It can take live packets or packet dumps (pcap = packet capture)
* Bro outputs 3 main files: conn.log (connections), notice.log (weird, bad, or interesting), and weird.log. The log files' meanings are in the 
infographic.
* The difference between bro and snort is that snort uses pattern detection; bro uses
far more. 

### Anonymization
* TCPurify - (works)
* IPsumdump - (can't figure out how to use this with pcap files currently)


# Other links:
[Tutorial 1](https://www.inet.tu-berlin.de/fileadmin/fg234_teaching/SS13/IM_SS13/im13_02_appmix_intro.pdf)

### Separating network data to TCP, UDP, ICMP:
* Wireshark
* tShark

### Network Datasets
* LBL: http://www.icir.org/enterprise-tracing/links.html
* Davis

### Information from Somdutta:
I used LBNL data available on their site and UCD network data. Go to "Download traces" in this link, http://www.icir.org/enterprise-tracing/Overview.html. This data set had been anonymized before they were posted online. They used tcpmkpub to anonymize the posted data. Click on "Papers"  to access the paper, "The Devil and Packet Trace Anonymization".

The anonymization tools that I used are TCPurify ( https://web.archive.org/web/20140203210616/irg.cs.ohiou.edu/~eblanton/tcpurify/ ) and IPsumdump ( http://read.seas.harvard.edu/~kohler/ipsumdump/ ). The README file of TCPurify talks about anonymizing network data two ways. I have used the "nullify" option. I think another student had found that the "table" version has bugs in it.

From each non-anonymized file I extracted 3 sets of data based on protocol. The protocols are TCP, ICMP and UDP. To do this I used tShark. As discussed in the meeting, I noticed that the output file of tShark was recognised by IPsumdump. I used Editcap to convert to a PCAP format and noticed that IPsumdump could process this. You guys could test this if works without using Editcap.

I ran the anonymization tools mentioned above on each of these non-anonymized files. I ran Snort on both the non-anonymized and anonymized version of the files. I used all default rules for Snort version 2.9.7.0. I passed the anonymized and non-anonmized files through Snort and found the number of false positives, false negatives and true positives. I also analyzed Snort rules for which the alerts were generated and the network packets for which the alerts were generated.

In order to analyze the effect of anonymization on security analysis, sensitivity (true positives / (true positives + false negatives)) and the ratio of false positives to true positives ( false +ves / true +positives) were calculated and conclusion is derived based on these values.
