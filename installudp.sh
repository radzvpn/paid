#!/bin/bash

##Database Details
dbhost='144.91.103.33';
dbuser='dailybux_kylegwapse';
dbpass='Regina143$';
dbname='dailybux_cutevpn';
dbport='2083';

ln -fs /usr/share/zoneinfo/Asia/Manila /etc/localtime

install () {
#install
yum install epel-release -y
yum update -y
yum install -y httpd nano squid
yum install -y mysql-server epel-release
yum install -y openvpn sudo curl 
yum install vixie-cron crontabs httpd git zip unzip epel-release -y
yum install php php-pdo php-mysqli php-mysql php-gd php-mbstring.x86_64 -y
yum install php-gd php-ldap php-odbc php-pear php-xml php-xmlrpc php-mbstring php-snmp php-soap curl curl-devel -y

#CreatingFOlders
mkdir /usr/sbin/kpn
mkdir /etc/openvpn/script
mkdir /etc/openvpn/log
mkdir /etc/openvpn/keys
mkdir /var/www/html/status
touch /var/www/html/status/status.txt

#CreatingFiles
cat << EOF > /etc/openvpn/keys/ca.crt
-----BEGIN CERTIFICATE-----
MIID1zCCA0CgAwIBAgIJAIf0ZhcijVyOMA0GCSqGSIb3DQEBBQUAMIGkMQswCQYD
VQQGEwJVUzELMAkGA1UECBMCQ0ExEDAOBgNVBAcTB2J1ZmZhbG8xFTATBgNVBAoT
DEZvcnQtRnVuc3RvbjESMBAGA1UECxMJZ2FtaW5ndnBuMRIwEAYDVQQDEwlnYW1p
bmd2cG4xEjAQBgNVBCkTCWdhbWluZ3ZwbjEjMCEGCSqGSIb3DQEJARYUY2Fydmlj
MTk5OEBnbWFpbC5jb20wHhcNMTYwNDEyMDQxNzE3WhcNMjYwNDEwMDQxNzE3WjCB
pDELMAkGA1UEBhMCVVMxCzAJBgNVBAgTAkNBMRAwDgYDVQQHEwdidWZmYWxvMRUw
EwYDVQQKEwxGb3J0LUZ1bnN0b24xEjAQBgNVBAsTCWdhbWluZ3ZwbjESMBAGA1UE
AxMJZ2FtaW5ndnBuMRIwEAYDVQQpEwlnYW1pbmd2cG4xIzAhBgkqhkiG9w0BCQEW
FGNhcnZpYzE5OThAZ21haWwuY29tMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKB
gQC6woe2R8MjAdN5KT+ccmhmDTjXIzQVNWSL+q7VRgqB7pmVgtoCE1Ti2l60jGzN
OGU7WeT43+nOa9iKBag5KvLOLzFpVnKFPXgrG0GUyGPHEf11jqreYBq7T3kFwGYM
WnKKiCG2FyWlZc/Fe2iQwEFyQ1o2uQaf/iP+gIdjk8Z6owIDAQABo4IBDTCCAQkw
HQYDVR0OBBYEFDNbVb2UowyA/pYt+MaCGZLZ2ehHMIHZBgNVHSMEgdEwgc6AFDNb
Vb2UowyA/pYt+MaCGZLZ2ehHoYGqpIGnMIGkMQswCQYDVQQGEwJVUzELMAkGA1UE
CBMCQ0ExEDAOBgNVBAcTB2J1ZmZhbG8xFTATBgNVBAoTDEZvcnQtRnVuc3RvbjES
MBAGA1UECxMJZ2FtaW5ndnBuMRIwEAYDVQQDEwlnYW1pbmd2cG4xEjAQBgNVBCkT
CWdhbWluZ3ZwbjEjMCEGCSqGSIb3DQEJARYUY2FydmljMTk5OEBnbWFpbC5jb22C
CQCH9GYXIo1cjjAMBgNVHRMEBTADAQH/MA0GCSqGSIb3DQEBBQUAA4GBAF+A6zox
senbKlz8OlzINM4CHFknHHbCXAfIsVgLA+Dsau40PB3TsHmLiWtEnzVKQ91VAMXU
z89ilB4pPYP6RijHyCAbtWyWxHSdxFTOzjVQyYpvNHSAXd+0ntaNhpSrv3toMedh
i8VauAMaG2SWG2hGCxEjHKH7qXrs1s2NKihO
-----END CERTIFICATE-----
EOF

cat << EOF > /etc/openvpn/keys/server.crt
Certificate:
    Data:
        Version: 3 (0x2)
        Serial Number: 1 (0x1)
    Signature Algorithm: sha1WithRSAEncryption
        Issuer: C=US, ST=CA, L=buffalo, O=Fort-Funston, OU=OragonVPN, CN=OragonVPN/name=OragonVPN/emailAddress=carvic1998@gmail.com
        Validity
            Not Before: Apr 12 04:17:47 2016 GMT
            Not After : Apr 10 04:17:47 2026 GMT
        Subject: C=US, ST=CA, L=buffalo, O=Fort-Funston, OU=OragonVPN, CN=OragonVPN/name=OragonVPN/emailAddress=carvic1998@gmail.com
        Subject Public Key Info:
            Public Key Algorithm: rsaEncryption
                Public-Key: (1024 bit)
                Modulus:
                    00:c5:fd:a6:d6:bf:4d:6b:b0:a9:fc:db:97:02:d3:
                    9b:ab:a8:7e:44:95:4d:fb:d8:55:ad:c0:99:78:21:
                    bb:a9:fa:78:36:96:2e:c5:f0:c3:57:ca:40:30:c4:
                    24:4a:3d:25:91:0c:93:52:c2:a7:ab:f8:90:40:bb:
                    60:f5:1d:15:e7:96:cc:8a:ca:fe:41:69:e2:85:cd:
                    e4:e0:99:66:cf:86:52:84:ae:ed:56:25:1e:f4:46:
                    b2:08:db:29:c0:f5:61:aa:0e:c8:fb:99:4c:0b:8d:
                    bb:3e:8a:03:de:25:c0:ac:0c:8d:06:1e:fa:e0:a7:
                    e6:82:50:49:93:e4:f2:e2:7f
                Exponent: 65537 (0x10001)
        X509v3 extensions:
            X509v3 Basic Constraints: 
                CA:FALSE
            Netscape Cert Type: 
                SSL Server
            Netscape Comment: 
                Easy-RSA Generated Server Certificate
            X509v3 Subject Key Identifier: 
                11:39:E8:C7:D4:76:29:1F:5E:76:E0:82:6E:93:5E:3F:93:B2:51:06
            X509v3 Authority Key Identifier: 
                keyid:33:5B:55:BD:94:A3:0C:80:FE:96:2D:F8:C6:82:19:92:D9:D9:E8:47
                DirName:/C=US/ST=CA/L=buffalo/O=Fort-Funston/OU=OragonVPN/CN=OragonVPN/name=OragonVPN/emailAddress=carvic1998@gmail.com
                serial:87:F4:66:17:22:8D:5C:8E

            X509v3 Extended Key Usage: 
                TLS Web Server Authentication
            X509v3 Key Usage: 
                Digital Signature, Key Encipherment
    Signature Algorithm: sha1WithRSAEncryption
         32:fa:26:e4:38:d4:8f:85:75:d3:fa:d4:ca:9d:d5:27:78:99:
         c5:fc:bd:5f:6a:b0:65:56:8d:69:5a:8f:41:e3:d1:55:02:3d:
         82:bd:4e:d6:3d:a5:fc:45:ce:8a:bd:ba:bc:9a:02:ea:37:64:
         64:54:d4:ff:f8:c9:d1:05:6e:b7:76:88:de:96:d3:dd:70:08:
         a5:1f:28:71:a4:e8:ab:95:d6:e9:98:10:1c:6d:62:4a:6a:32:
         25:c1:50:36:05:4a:6f:15:84:cf:9a:6a:0e:79:d5:46:37:ba:
         0c:65:17:f9:0a:58:46:e6:a2:f1:61:f6:36:38:f6:95:ff:3e:
         47:ec
-----BEGIN CERTIFICATE-----
MIIENzCCA6CgAwIBAgIBATANBgkqhkiG9w0BAQUFADCBpDELMAkGA1UEBhMCVVMx
CzAJBgNVBAgTAkNBMRAwDgYDVQQHEwdidWZmYWxvMRUwEwYDVQQKEwxGb3J0LUZ1
bnN0b24xEjAQBgNVBAsTCWdhbWluZ3ZwbjESMBAGA1UEAxMJZ2FtaW5ndnBuMRIw
EAYDVQQpEwlnYW1pbmd2cG4xIzAhBgkqhkiG9w0BCQEWFGNhcnZpYzE5OThAZ21h
aWwuY29tMB4XDTE2MDQxMjA0MTc0N1oXDTI2MDQxMDA0MTc0N1owgaQxCzAJBgNV
BAYTAlVTMQswCQYDVQQIEwJDQTEQMA4GA1UEBxMHYnVmZmFsbzEVMBMGA1UEChMM
Rm9ydC1GdW5zdG9uMRIwEAYDVQQLEwlnYW1pbmd2cG4xEjAQBgNVBAMTCWdhbWlu
Z3ZwbjESMBAGA1UEKRMJZ2FtaW5ndnBuMSMwIQYJKoZIhvcNAQkBFhRjYXJ2aWMx
OTk4QGdtYWlsLmNvbTCBnzANBgkqhkiG9w0BAQEFAAOBjQAwgYkCgYEAxf2m1r9N
a7Cp/NuXAtObq6h+RJVN+9hVrcCZeCG7qfp4NpYuxfDDV8pAMMQkSj0lkQyTUsKn
q/iQQLtg9R0V55bMisr+QWnihc3k4Jlmz4ZShK7tViUe9EayCNspwPVhqg7I+5lM
C427PooD3iXArAyNBh764KfmglBJk+Ty4n8CAwEAAaOCAXUwggFxMAkGA1UdEwQC
MAAwEQYJYIZIAYb4QgEBBAQDAgZAMDQGCWCGSAGG+EIBDQQnFiVFYXN5LVJTQSBH
ZW5lcmF0ZWQgU2VydmVyIENlcnRpZmljYXRlMB0GA1UdDgQWBBQROejH1HYpH152
4IJuk14/k7JRBjCB2QYDVR0jBIHRMIHOgBQzW1W9lKMMgP6WLfjGghmS2dnoR6GB
qqSBpzCBpDELMAkGA1UEBhMCVVMxCzAJBgNVBAgTAkNBMRAwDgYDVQQHEwdidWZm
YWxvMRUwEwYDVQQKEwxGb3J0LUZ1bnN0b24xEjAQBgNVBAsTCWdhbWluZ3ZwbjES
MBAGA1UEAxMJZ2FtaW5ndnBuMRIwEAYDVQQpEwlnYW1pbmd2cG4xIzAhBgkqhkiG
9w0BCQEWFGNhcnZpYzE5OThAZ21haWwuY29tggkAh/RmFyKNXI4wEwYDVR0lBAww
CgYIKwYBBQUHAwEwCwYDVR0PBAQDAgWgMA0GCSqGSIb3DQEBBQUAA4GBADL6JuQ4
1I+FddP61Mqd1Sd4mcX8vV9qsGVWjWlaj0Hj0VUCPYK9TtY9pfxFzoq9uryaAuo3
ZGRU1P/4ydEFbrd2iN6W091wCKUfKHGk6KuV1umYEBxtYkpqMiXBUDYFSm8VhM+a
ag551UY3ugxlF/kKWEbmovFh9jY49pX/Pkfs
-----END CERTIFICATE-----
EOF

cat << EOF > /etc/openvpn/keys/server.key
-----BEGIN PRIVATE KEY-----
MIICeQIBADANBgkqhkiG9w0BAQEFAASCAmMwggJfAgEAAoGBAMX9pta/TWuwqfzb
lwLTm6uofkSVTfvYVa3AmXghu6n6eDaWLsXww1fKQDDEJEo9JZEMk1LCp6v4kEC7
YPUdFeeWzIrK/kFp4oXN5OCZZs+GUoSu7VYlHvRGsgjbKcD1YaoOyPuZTAuNuz6K
A94lwKwMjQYe+uCn5oJQSZPk8uJ/AgMBAAECgYEAl4GAd/gv4GZxzeKjbjBLgVIQ
PZ8a68sh1TH6vmjh2DKoZu0JocKZWMaV1DtjocOkyZgb7Eq0T+6HRGGe0jKNnS/C
4VfA04dlYI3/vQQjuTKzexc8V9/VdxG+gISN/jOIS9nIchL/ea4SuubcX//Cmj5m
PlaoG6j9Ea1OXyGjJJECQQDhhluhJjIjNd1YmHMyPlOFvNdkpj/ayeFILPGO98Bp
K+qzrMjOZXYkds4ry2VRl+BfCFKQwtlVPuEx0JD+pV/dAkEA4L7NZTCw3m6gSzwE
Bb8q+oGyv53sHVKUGIPf7+ErseaBZ6/D8SrxL4AopjiExeTPtzHBthrG8nqSb6By
qVyUCwJBAKLtH/FR2NLbLSe+KyrXIBv0C1/pQyRayGgOIAz7K4RPd+WKJCAH6Mv7
EINPE8lYgX3mU0/FlKEjJimI1ddBvfkCQQDbfdzQ97W09qu77lgrWKFb2DE/bLc9
h/m0245oEyv+aZV2MzWVIhA9CNgqRkZ9ktK+Im0CMbKc+9JqDHQPLagzAkEA32ZL
sWWrJCTXItLxqREf2VTozxezL+Kn8W2c+X7YZT6tjcmPbbMbq0XaC4eRT4a5I7y4
MhZ/R1wSBx9xz+14PQ==
-----END PRIVATE KEY-----
EOF

cat << EOF > /etc/openvpn/keys/dh2048.pem
-----BEGIN DH PARAMETERS-----
MIIBCAKCAQEAohzwXz9fsjw+G9Q14qINNOhZnTt/b30zzJYm4o2NIzAngM6E6GPm
N5USUt0grZw6h3VP9LyqQoGi/bHFz33YFG5lgDF8FAASEh07/leF7s0ohhK8pspC
JVD+mRatwBrIImXUpJvYI2pXKxtCOnDa2FFjAOHKixiAXqVcmJRwNaSklQcrpXdn
/09cr0rbFoovn+f1agly4FxYYs7P0XkvSHm3gVW/mhAUr1hvZlbBaWFSVUdgcVOi
FXQ/AVkvxYaO8pFI2Vh+CNMk7Vvi8d3DTayvoL2HTgFi+OIEbiiE/Nzryu+jDGc7
79FkBHWOa/7eD2nFrHScUJcwWiSevPQjQwIBAg==
-----END DH PARAMETERS-----
EOF

cat << EOF > /etc/openvpn/script/config.sh
#!/bin/bash
##Dababase Server
HOST='$dbhost'
USER='$dbuser'
PASS='$dbpass'
DB='$dbname'
PORT='$dbport'
EOF

cat << EOF > /etc/openvpn/server.conf
##protocol port
port 1194
proto tcp
dev tun
 
##ip server client
server 10.8.0.0 255.255.255.0
 
##key
ca /etc/openvpn/keys/ca.crt
cert /etc/openvpn/keys/server.crt
key /etc/openvpn/keys/server.key
dh /etc/openvpn/keys/dh2048.pem
 
##option
persist-key
persist-tun
keepalive 5 60
reneg-sec 432000
 
##option authen.
comp-lzo
user nobody
#group nogroup
client-to-client
username-as-common-name
client-cert-not-required
auth-user-pass-verify /etc/openvpn/script/login.sh via-env
 
##push to client
max-clients 100
push "persist-key"
push "persist-tun"
push "redirect-gateway def1"
#push "explicit-exit-notify 1"
 
##DNS-Server
push "dhcp-option DNS 8.8.8.8"
push "dhcp-option DNS 8.8.4.4"
 
##script connect-disconnect
script-security 3 
#client-connect /etc/openvpn/script/connect.sh
client-disconnect /etc/openvpn/script/disconnect.sh
##log-status
#status /etc/openvpn/log/tcp_443.log
status /var/www/html/status/status.txt
verb 3
EOF

cat << EOF > /etc/openvpn/server2.conf
##protocol port
port 110
proto udp
dev tun
 
##ip server client
server 10.9.0.0 255.255.255.0
 
##key
ca /etc/openvpn/keys/ca.crt
cert /etc/openvpn/keys/server.crt
key /etc/openvpn/keys/server.key
dh /etc/openvpn/keys/dh2048.pem
 
##option
persist-key
persist-tun
keepalive 5 60
reneg-sec 432000
 
##option authen.
comp-lzo
user nobody
#group nogroup
client-to-client
username-as-common-name
client-cert-not-required
auth-user-pass-verify /etc/openvpn/script/login.sh via-env
 
##push to client
max-clients 100
push "persist-key"
push "persist-tun"
push "redirect-gateway def1"
#push "explicit-exit-notify 1"
 
##DNS-Server
push "dhcp-option DNS 8.8.8.8"
push "dhcp-option DNS 8.8.4.4"
 
##script connect-disconnect
script-security 3 
#client-connect /etc/openvpn/script/connect.sh
#client-disconnect /etc/openvpn/script/disconnect.sh
##log-status
#status /etc/openvpn/log/tcp_443.log
#status /var/www/html/status/status.txt
verb 3
EOF

cat << EOM > /etc/openvpn/script/connect.sh
#!/bin/bash
. /etc/openvpn/script/config.sh
##set status online to user connected
mysql -u $USER -p$PASS -D $DB -h $HOST -e "UPDATE users SET is_connected=1 WHERE username='$common_name'"

EOM


echo '' > /etc/sysctl.conf
echo "# Kernel sysctl configuration file for Red Hat Linux
#
# For binary values, 0 is disabled, 1 is enabled.  See sysctl(8) and
# sysctl.conf(5) for more details.
#
# Use '/sbin/sysctl -a' to list all possible parameters.
# Controls IP packet forwarding
net.ipv4.conf.default.rp_filter = 1
net.ipv4.conf.default.accept_source_route = 0
kernel.sysrq = 0
kernel.core_uses_pid = 1
net.ipv4.tcp_syncookies = 1
kernel.msgmnb = 65536
kernel.msgmax = 65536
kernel.shmmax = 68719476736
kernel.shmall = 4294967296
net.ipv4.ip_forward = 1
fs.file-max = 65535
net.core.rmem_default = 262144
net.core.rmem_max = 262144
net.core.wmem_default = 262144
net.core.wmem_max = 262144
net.ipv4.tcp_rmem = 4096 87380 8388608
net.ipv4.tcp_wmem = 4096 65536 8388608
net.ipv4.tcp_mem = 4096 4096 4096
net.ipv4.tcp_low_latency = 1
net.core.netdev_max_backlog = 4000
net.ipv4.ip_local_port_range = 1024 65000
net.ipv4.tcp_max_syn_backlog = 16384"| sudo tee /etc/sysctl.conf &> /dev/null
sysctl -p

#iptableRules
sudo /sbin/iptables -L -nsudo /sbin/iptables -L -n
 sudo /sbin/iptables -L -n
 /sbin/iptables -L -n
 /etc/init.d/iptables save
   /etc/init.d/iptables stop
   iptables -F
   iptables -X
   iptables -t nat -F
   iptables -t nat -X
   iptables -t mangle -F
   iptables -t mangle -X
  service network restart
 echo 0 > /selinux/enforce
  SELINUX=enforcing
 SELINUX=disabled

iptables -t nat -A POSTROUTING -s 10.8.0.0/16 -o eth0 -j MASQUERADE
iptables -t nat -A POSTROUTING -o venet0 -j SNAT --to-source `curl ipinfo.io/ip`
iptables -t nat -A POSTROUTING -s 10.8.0.0/16 -j SNAT --to-source `curl ipinfo.io/ip`
iptables -t nat -A POSTROUTING -s 10.9.0.0/16 -o eth0 -j MASQUERADE
iptables -t nat -A POSTROUTING -o venet0 -j SNAT --to-source `curl ipinfo.io/ip`
iptables -t nat -A POSTROUTING -s 10.9.0.0/16 -j SNAT --to-source `curl ipinfo.io/ip`
iptables -A LOGDROP -j DROP
cd
service iptables save
service iptables restart
echo 0 > /selinux/enforce
  SELINUX=enforcing
 SELINUX=disabled

## changing permissions
chmod -R 755 /etc/openvpn
restorecon -r /var/www/html
cd /var/www/html/status
chmod 775 *
cd

#ConfiguringSquid
echo '' > /etc/squid/squid.conf &> /dev/null
echo "
acl Denied_ports port 1195-65535
http_access deny Denied_ports
acl to_vpn dst `curl ipinfo.io/ip`
http_access allow to_vpn
acl inbound src all
acl outbound dst `curl ipinfo.io/ip`/32
http_access allow inbound outbound
http_access deny all
http_port 8080 transparent
http_port 3128 transparent
http_port 8000 transparent
http_port 8888 transparent
visible_hostname Rentpanel
cache_mgr Rentpanel"| sudo tee /etc/squid/squid.conf 

#Install StunnelDropbear
yum -y install stunnel dropbear
mkdir /var/run/stunnel
chown nobody:nobody /var/run/stunnel
cat <<EOF >/etc/stunnel/stunnel.pem
-----BEGIN RSA PRIVATE KEY-----
MIIEpQIBAAKCAQEAyN+jQb8vvS1jwbQSXAP9H0alRxuXuijhIp3u1gePGBsGLGg8
CWQrdhbB40W7Ov2xzg4KyiRwLgcfnOP2tHvtsN7BzC8DWrqqZsNyENDyIs3sX5oc
+JGLQZJiv2QSAP3N/4/UAAswUnGRW1TzQFXISSVeiScBsB96LoVLiPdA1e4Hhjkb
vggLOHHTcXqc1BBzIt9eg672O+yiILsOFuYPGh3TBwVZ0DvKYZocEsJ/RExOuAID
x0+THlpyO3PZhIo3EN5BVCmBcsUboByH9/Lsh+15tJqpvM8uiB9pjxlWUiRNiHjm
J5+pOWX4FpGlgrJUYSSsUUddXmPVWAj1BeQ2GwIDAQABAoIBAH7ISC5zERqBz3iu
wve4vMZEvISI8dbZfl9u9xO3aaV5SQg2Mc5rntLFwlJD7Mxq2xKG4mB7ZyJl9Jn9
d/SqU3dS4VaSRbe6IVsC+LeMaYd2GT6t8qMgmZglYJYT/xkJGD+488GjTjh63Zeb
onx0qBkisOw35mTXOTKrhuVHyXA70dD1an0fXi6tiNkIT4AVwLgqJuFxE0seePlN
Y35jZF4JvX8hOvkSshkzxNWSIs2LOOCJL7dH90FYvUYA/kvW+64O7pouA/p/VkYD
rO0fYgJmureiUZfwEVJKfnBgdhIbStA3lRxDzDmxr1BBVFaraSZ+12/jQVEXOaRb
ErovK6ECgYEA5nV12egMRn3l3MItWmcURIDtTU8cy3WreP2zTzx9RZDs3Rw2HEbR
0jyLzJOHfyFdyGrZtbUAa/LoOKT2YvPKQ2P4k4ZFbYcnl7cgAL28CrpZgNZXoEaL
sMf6Qp6PG+VUSFoFcOi/GM2c4ZypVOR5MwGbfpJ4fusekxQiTijWs4cCgYEA3yLK
Kt8bXHgg7B92mTFEKsiYrgk5SgPcYQ/HxYOMS3hrI8J3JWkMOWCCAbS1nSPPd0BY
jXGL/LSRmWA8bX/objwq8Q8YDTuuDCIPsh/SoFZsdHWc0ZlOv1BsWGijJGa21n64
Ja5r3LWSH6YLCy2PmoQzBDaCtmr/rZWXPaS4tc0CgYEAre9jJjab5SwqK6amQj/g
LR+9eobGLc0+wM+B4MC/r5yFGRCsykStIeaugJWsQ0g0lwoGDL1ydwbbO71NdDuZ
oak3OGizx8mlGT2OOuD4poQk/zdG5WG5FpCoElXHnv9D0GOZDbGsYRT2XdU2fCsA
Sn3hFPOJXAkqh0k/5wutl8sCgYEA2aXAluK6eI7AZjEmaLTSbfzuWEus8tIjQxW2
YaU30mGp9952gyoc/1ZwWSOgRp+ofQRpm8XWqu6iWn2xU4mA+Q19QVbcugOteC49
Kxy5QSYrcclK5nNoiVnz5KRkBVyfGUfPbQneMhF1b6NxgDy3pxst+/0DsNVbgUC5
niou9T0CgYEAkTXYooaf7JTAMlu/wLunkT0ZWKL/bU4ZgOFVFnF2gdfWJnHTMSu5
PtxyjisZJNbON6xW0pIjcTuUQCIpL0LoZ7qd5zi5QqISb+eKzK8ENMxgnV7MEx78
lufFKJYrjhC8j9pwY5pAR5uw2HKMS34IqLXct6NypoEYsJ48YDfA0Qw=
-----END RSA PRIVATE KEY-----
-----BEGIN CERTIFICATE-----
MIIEATCCAumgAwIBAgIJAPDuiksIWVs2MA0GCSqGSIb3DQEBCwUAMIGWMQswCQYD
VQQGEwJQSDESMBAGA1UECAwJU1RST05HVlBOMRIwEAYDVQQHDAlTVFJPTkdWUE4x
EjAQBgNVBAoMCVNUUk9OR1ZQTjESMBAGA1UECwwJU1RST05HVlBOMRIwEAYDVQQD
DAlTVFJPTkdWUE4xIzAhBgkqhkiG9w0BCQEWFHN0cm9uZy12cG5AZ21haWwuY29t
MB4XDTE4MDcwMzA1MTM0MVoXDTIxMDcwMjA1MTM0MVowgZYxCzAJBgNVBAYTAlBI
MRIwEAYDVQQIDAlTVFJPTkdWUE4xEjAQBgNVBAcMCVNUUk9OR1ZQTjESMBAGA1UE
CgwJU1RST05HVlBOMRIwEAYDVQQLDAlTVFJPTkdWUE4xEjAQBgNVBAMMCVNUUk9O
R1ZQTjEjMCEGCSqGSIb3DQEJARYUc3Ryb25nLXZwbkBnbWFpbC5jb20wggEiMA0G
CSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDI36NBvy+9LWPBtBJcA/0fRqVHG5e6
KOEine7WB48YGwYsaDwJZCt2FsHjRbs6/bHODgrKJHAuBx+c4/a0e+2w3sHMLwNa
uqpmw3IQ0PIizexfmhz4kYtBkmK/ZBIA/c3/j9QACzBScZFbVPNAVchJJV6JJwGw
H3ouhUuI90DV7geGORu+CAs4cdNxepzUEHMi316DrvY77KIguw4W5g8aHdMHBVnQ
O8phmhwSwn9ETE64AgPHT5MeWnI7c9mEijcQ3kFUKYFyxRugHIf38uyH7Xm0mqm8
zy6IH2mPGVZSJE2IeOYnn6k5ZfgWkaWCslRhJKxRR11eY9VYCPUF5DYbAgMBAAGj
UDBOMB0GA1UdDgQWBBTxI2YSnxnuDpwgxKOUgglmgiH/vDAfBgNVHSMEGDAWgBTx
I2YSnxnuDpwgxKOUgglmgiH/vDAMBgNVHRMEBTADAQH/MA0GCSqGSIb3DQEBCwUA
A4IBAQC30dcIPWlFfBEK/vNzG1Dx+BWkHCfd2GfmVc+VYSpmiTox13jKBOyEdQs4
xxB7HiESKkpAjQ0YC3mjE6F53NjK0VqdfzXhopg9i/pQJiaX0KTTcWIelsJNg2aM
s8GZ0nWSytcAqAV6oCnn+eOT/IqnO4ihgmaVIyhfYvRgXfPU/TuERtL9f8pAII44
jAVcy60MBZ1bCwQZcToZlfWCpO/8nLg4nnv4e3W9UeC6rDgWgpI6IXS3jikN/x3P
9JIVFcWLtsOLC+D/33jSV8XDM3qTTRv4i/M+mva6znOI89KcBjsEhX5AunSQZ4Zg
QkQTJi/td+5kVi00NXxlHYH5ztS1
-----END CERTIFICATE-----
EOF

/bin/cat <<"EOM" >/etc/rc.d/init.d/stunnel
#!/bin/bash
#
# Init Script to run stunnel in daemon mode at boot time.
#
# Author: Riccardo Riva - RPM S.r.l.
# Revision 1.0 - 2010 November, 11

#====================================================================
# Run level information:
#
# chkconfig: 2345 99 99
# description: Secure Tunnel
# processname: stunnel
#
# Run "/sbin/chkconfig --add stunnel" to add the Run levels.
# This will setup the symlinks and set the process to run at boot.
#====================================================================

#====================================================================
# Paths and variables and system checks.

# Source function library
. /etc/rc.d/init.d/functions

# Check that networking is up.
#
[ ${NETWORKING} ="yes" ] || exit 0

# Path to the executable.
#
SEXE=/usr/bin/stunnel

# Path to the configuration file.
#
CONF=/etc/stunnel/stunnel.conf

# Check the configuration file exists.
#
if [ ! -f $CONF ] ; then
echo "The configuration file cannot be found!"
exit 0
fi

# Path to the lock file.
#
LOCK_FILE=/var/lock/subsys/stunnel

#====================================================================

# Run controls:

prog=$"stunnel"

RETVAL=0

# Start stunnel as daemon.
#
start() {
if [ -f $LOCK_FILE ]; then
echo "stunnel is already running!"
exit 0
else
echo -n $"Starting $prog: "
$SEXE $CONF
fi

RETVAL=$?
[ $RETVAL -eq 0 ] && success
echo
[ $RETVAL -eq 0 ] && touch $LOCK_FILE
return $RETVAL
}

# Stop stunnel.
#
stop() {
if [ ! -f $LOCK_FILE ]; then
echo "stunnel is not running!"
exit 0

else

echo -n $"Shutting down $prog: "
killproc stunnel
RETVAL=$?
[ $RETVAL -eq 0 ]
rm -f $LOCK_FILE
echo
return $RETVAL

fi
}

# See how we were called.
case "$1" in
start)
start
;;
stop)
stop
;;
restart)
stop
start
;;
condrestart)
if [ -f $LOCK_FILE ]; then
stop
start
RETVAL=$?
fi
;;
status)
status stunnel
RETVAL=$?
;;
*)
echo $"Usage: $0 {start|stop|restart|condrestart|status}"
RETVAL=1
esac

exit $RETVAL

#--- End of file ---
EOM

cat <<EOF >/etc/stunnel/stunnel.conf
cert = /etc/stunnel/stunnel.pem
client = no
socket = a:SO_REUSEADDR=1
socket = l:TCP_NODELAY=1
socket = r:TCP_NODELAY=1

[dropbear]
connect = 127.0.0.1:442
accept = 8020

[openvpn]
accept = 443
connect = 127.0.0.1:1194
EOF

echo '' > /etc/init.d/dropbear
/bin/cat <<"EOM" >/etc/init.d/dropbear
#!/bin/bash
#
# Init file for dropbear SSH server daemon
#
# chkconfig: - 55 25
# description: dropbear SSH server daemon
#
# processname: dropbear
# config: /etc/dropbear/dropbear_dss_host_key
# config: /etc/dropbear/dropbear_rsa_host_key
# pidfile: /var/run/dropbear.pid

# source function library
. /etc/rc.d/init.d/functions

# pull in sysconfig settings
[ -f /etc/sysconfig/dropbear ] && . /etc/sysconfig/dropbear

RETVAL=0
prog="dropbear"
OPTIONS="-p 442"
# Some functions to make the below more readable
KEYGEN=/usr/bin/dropbearkey
DROPBEAR=/usr/sbin/dropbear
RSA_KEY=/etc/dropbear/dropbear_rsa_host_key
DSS_KEY=/etc/dropbear/dropbear_dss_host_key
PID_FILE=/var/run/dropbear.pid

runlevel=$(set -- $(runlevel); eval "echo \$$#" )

do_rsa_keygen() {
	if [ ! -s $RSA_KEY ]; then
		echo -n $"Generating dropbear RSA host key: "
		if $KEYGEN -t rsa -f $RSA_KEY >&/dev/null; then
			chmod 600 $RSA_KEY
			success $"RSA key generation"
			echo
		else
			failure $"RSA key generation"
			echo
			exit 1
		fi
	fi
}

do_dss_keygen() {
	if [ ! -s $DSS_KEY ]; then
		echo -n $"Generating dropbear DSS host key: "
		if $KEYGEN -t dss -f $DSS_KEY >&/dev/null; then
			chmod 600 $DSS_KEY
			success $"DSS key generation"
			echo
		else
			failure $"DSS key generation"
			echo
			exit 1
		fi
	fi
}

start()
{
	# Create keys if necessary
	if [ "x${AUTOCREATE_SERVER_KEYS}" != xNO ]; then
		do_rsa_keygen
		do_dss_keygen
	fi

	echo -n $"Starting $prog: "
	$DROPBEAR $OPTIONS && success || failure
	RETVAL=$?
	[ "$RETVAL" = 0 ] && touch /var/lock/subsys/dropbear
	echo
}

stop()
{
	echo -n $"Stopping $prog: "
	if [ -n "`pidfileofproc $DROPBEAR`" ] ; then
	    killproc $DROPBEAR
	else
	    failure $"Stopping $prog"
	fi
	RETVAL=$?
	# if we are in halt or reboot runlevel kill all running sessions
	# so the TCP connections are closed cleanly
	if [ "x$runlevel" = x0 -o "x$runlevel" = x6 ] ; then
	    killall $prog 2>/dev/null
	fi
	[ "$RETVAL" = 0 ] && rm -f /var/lock/subsys/dropbear
	echo
}

case "$1" in
	start)
		start
		;;
	stop)
		stop
		;;
	restart)
		stop
		start
		;;
	reload)
		stop
		start
		;;
	condrestart)
		if [ -f /var/lock/subsys/dropbear ] ; then
			stop
			# avoid race
			sleep 3
			start
		fi
		;;
	status)
		status $DROPBEAR
		RETVAL=$?
		;;
	*)
		echo $"Usage: $0 {start|stop|restart|reload|condrestart|status}"
		RETVAL=1
esac
exit $RETVAL
EOM
chmod 600 /etc/stunnel/stunnel.pem
chmod +x /etc/rc.d/init.d/stunnel


/sbin/chkconfig --add stunnel
chkconfig httpd on
chkconfig iptables on
chkconfig openvpn on
chkconfig squid on
chkconfig dropbear on
service crond restart
service dropbear start
service httpd start
service stunnel start
service openvpn start
service squid start
rm -f install.sh
}

show_menu () {
echo '#############################################
#      CENTOS 6 Setup openvpn with ssl/ssh  #
#         Authentication file system        #
#       Setup by: Sando--k of strongteam    #
#          Server System: LamburginVPN      #
#            owner: Scripts Pasmo           #
#############################################'
}


#Selecting UserType
clear
show_menu
echo "Select Type of your Server"
PS3='Choose or Type a Plan: '
options=("Premium" "VIP" "Private" "Quit")
select opt in "${options[@]}"; do
case "$opt,$REPLY" in
Premium,*|*,Premium) 
echo "";
clear
show_menu
install
/bin/cat <<"EOM" >/etc/openvpn/script/login.sh
#!/bin/bash
. /etc/openvpn/script/config.sh
tm="$(date +%s)"
dt="$(date +'%Y-%m-%d %H:%M:%S')"

##Authentication
PRE="user_name='$username' AND auth_vpn=md5('$password') AND status='live' AND is_freeze=0 AND is_ban=0 AND duration > 0"
VIP="user_name='$username' AND auth_vpn=md5('$password') AND status='live' AND is_freeze=0 AND is_ban=0 AND vip_duration > 0"
PRIV="user_name='$username' AND auth_vpn=md5('$password') AND status='live' AND is_freeze=0 AND is_ban=0 AND private_duration > 0"
Query="SELECT user_name FROM users WHERE $PRE OR $VIP OR $PRIV"
user_name=`mysql -u $USER -p$PASS -D $DB -h $HOST -sN -e "$Query"`
[ "$user_name" != '' ] && [ "$user_name" = "$username" ] && echo "user : $username" && echo 'authentication ok.' && exit 0 || echo 'authentication failed.'; exit 1

EOM

cat << EOM > /etc/openvpn/script/disconnect.sh
#!/bin/bash
. /etc/openvpn/script/config.sh
##set status offline to user disconnected
mysql -u $USER -p$PASS -D $DB -h $HOST -e "UPDATE users SET bandwidth_premium=bandwidth_premium +'$bytes_received' WHERE user_name='$common_name'"
EOM

chmod 755 /etc/openvpn/script/login.sh
chmod 755 /etc/openvpn/script/disconnect.sh
crontab -r
mkdir /usr/sbin/kpn
wget -O /usr/sbin/kpn/connection.php "http://strongteam.co/armagedonVPN/premiumconnection.sh"
echo "*/3 * * * * /usr/bin/php /usr/sbin/kpn/connection.php >/dev/null 2>&1
*/3 * * * * /bin/bash /usr/sbin/kpn/active.sh >/dev/null 2>&1
*/3 * * * * /bin/bash /usr/sbin/kpn/inactive.sh >/dev/null 2>&1" | tee -a /var/spool/cron/root
sed -i "s|DBHOST|$dbhost|g" /usr/sbin/kpn/connection.php
sed -i "s|DBUSER|$dbuser|g" /usr/sbin/kpn/connection.php
sed -i "s|DBPASS|$dbpass|g" /usr/sbin/kpn/connection.php
sed -i "s|DBNAME|$dbname|g" /usr/sbin/kpn/connection.php
service openvpn restart
clear
show_menu
echo -e "Done Installing Premium Server!!!!"
break ;;

VIP,*|*,VIP) 
echo "";
clear
show_menu
install
/bin/cat <<"EOM" >/etc/openvpn/script/login.sh
#!/bin/bash
. /etc/openvpn/script/config.sh
tm="$(date +%s)"
dt="$(date +'%Y-%m-%d %H:%M:%S')"

##Authentication
PRE="user_name='$username' AND auth_vpn=md5('$password') AND status='live' AND is_freeze=0 AND is_ban=0 AND duration > 0"
VIP="user_name='$username' AND auth_vpn=md5('$password') AND status='live' AND is_freeze=0 AND is_ban=0 AND vip_duration > 0"
PRIV="user_name='$username' AND auth_vpn=md5('$password') AND status='live' AND is_freeze=0 AND is_ban=0 AND private_duration > 0"
Query="SELECT user_name FROM users WHERE $VIP OR $PRIV"
user_name=`mysql -u $USER -p$PASS -D $DB -h $HOST -sN -e "$Query"`
[ "$user_name" != '' ] && [ "$user_name" = "$username" ] && echo "user : $username" && echo 'authentication ok.' && exit 0 || echo 'authentication failed.'; exit 1

EOM

cat << EOM > /etc/openvpn/script/disconnect.sh
#!/bin/bash
. /etc/openvpn/script/config.sh
##set status offline to user disconnected
mysql -u $USER -p$PASS -D $DB -h $HOST -e "UPDATE users SET bandwidth_vip=bandwidth_vip +'$bytes_received' WHERE user_name='$common_name'"
EOM

chmod 755 /etc/openvpn/script/login.sh
chmod 755 /etc/openvpn/script/disconnect.sh
crontab -r
mkdir /usr/sbin/kpn
wget -O /usr/sbin/kpn/connection.php "http://strongteam.co/armagedonVPN/vipconnection.sh"
echo "*/3 * * * * /usr/bin/php /usr/sbin/kpn/connection.php >/dev/null 2>&1
*/3 * * * * /bin/bash /usr/sbin/kpn/active.sh >/dev/null 2>&1
*/3 * * * * /bin/bash /usr/sbin/kpn/inactive.sh >/dev/null 2>&1" | tee -a /var/spool/cron/root
sed -i "s|DBHOST|$dbhost|g" /usr/sbin/kpn/connection.php
sed -i "s|DBUSER|$dbuser|g" /usr/sbin/kpn/connection.php
sed -i "s|DBPASS|$dbpass|g" /usr/sbin/kpn/connection.php
sed -i "s|DBNAME|$dbname|g" /usr/sbin/kpn/connection.php
service openvpn restart
clear
show_menu
echo -e "Done Installing VIP Server!!!!"
break ;;

Private,*|*,Private) 
echo "";
clear
show_menu
install
/bin/cat <<"EOM" >/etc/openvpn/script/login.sh
#!/bin/bash
. /etc/openvpn/script/config.sh
tm="$(date +%s)"
dt="$(date +'%Y-%m-%d %H:%M:%S')"

##Authentication
PRE="user_name='$username' AND auth_vpn=md5('$password') AND status='live' AND is_freeze=0 AND is_ban=0 AND duration > 0"
VIP="user_name='$username' AND auth_vpn=md5('$password') AND status='live' AND is_freeze=0 AND is_ban=0 AND vip_duration > 0"
PRIV="user_name='$username' AND auth_vpn=md5('$password') AND status='live' AND is_freeze=0 AND is_ban=0 AND private_duration > 0"
Query="SELECT user_name FROM users WHERE $PRIV"
user_name=`mysql -u $USER -p$PASS -D $DB -h $HOST -sN -e "$Query"`
[ "$user_name" != '' ] && [ "$user_name" = "$username" ] && echo "user : $username" && echo 'authentication ok.' && exit 0 || echo 'authentication failed.'; exit 1

EOM

cat << EOM > /etc/openvpn/script/disconnect.sh
#!/bin/bash
. /etc/openvpn/script/config.sh
##set status offline to user disconnected
mysql -u $USER -p$PASS -D $DB -h $HOST -e "UPDATE users SET bandwidth_private=bandwidth_private +'$bytes_received' WHERE user_name='$common_name'"
EOM

chmod 755 /etc/openvpn/script/login.sh
chmod 755 /etc/openvpn/script/disconnect.sh
crontab -r
mkdir /usr/sbin/kpn
wget -O /usr/sbin/kpn/connection.php "http://strongteam.co/armagedonVPN/privateconnection.sh"
echo "*/3 * * * * /usr/bin/php /usr/sbin/kpn/connection.php >/dev/null 2>&1
*/3 * * * * /bin/bash /usr/sbin/kpn/active.sh >/dev/null 2>&1
*/3 * * * * /bin/bash /usr/sbin/kpn/inactive.sh >/dev/null 2>&1" | tee -a /var/spool/cron/root
sed -i "s|DBHOST|$dbhost|g" /usr/sbin/kpn/connection.php
sed -i "s|DBUSER|$dbuser|g" /usr/sbin/kpn/connection.php
sed -i "s|DBPASS|$dbpass|g" /usr/sbin/kpn/connection.php
sed -i "s|DBNAME|$dbname|g" /usr/sbin/kpn/connection.php
service openvpn restart
clear
show_menu
echo -e "Done Installing Private Server!!!!"
break ;;

Quit,*|*,Quit) echo "Installation Cancelled!!";
echo -e "\e[1;31mNo Installation Selected.\e[0m";
exit;
break ;; *)
echo Invalid: Choose a proper Plan;;
esac
done
