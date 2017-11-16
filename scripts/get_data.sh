curl ftp://ftp.bro-ids.org/enterprise-traces/hdr-traces05/ | awk '{print $9}' | while read -r line; do wget "ftp://ftp.bro-ids.org/enterprise-traces/hdr-traces05/${line}"; done;
