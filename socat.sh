# A tls tunnel for egel.dev since that's a .dev domain.
# 
# # get snap
# 
# > sudo dnf install snapd
# 
# To install classic snap (needed or a 'device not yet seeded' error)
# 
# > sudo ln -s /var/lib/snapd/snap /snap
# 
# Optionally, also installed the store.
# 
# > sudo snap install snap-store
# 
# # get certbot
# 
# > sudo snap install --classic certbot
# 
# Also, I really don't like this step
# 
# > sudo ln -s /snap/bin/certbot /usr/bin/certbot
# 
# # get certificate
# 
# > sudo certbot certonly --standalone
# 
# Output: 
# 
# Please enter the domain name(s) you would like on your certificate (comma and/or
# space separated) (Enter 'c' to cancel): egel.dev
# Requesting a certificate for egel.dev
# 
# Successfully received certificate.
# Certificate is saved at: /etc/letsencrypt/live/egel.dev/fullchain.pem
# Key is saved at:         /etc/letsencrypt/live/egel.dev/privkey.pem
# This certificate expires on 2024-10-03.
# These files will be updated when the certificate renews.
# Certbot has set up a scheduled task to automatically renew this certificate in the background.
# 
# Make sure the certificates are being served.
#
# visit https://crt.sh/?q=egel.dev with a browser.
#
# Make the certificates readable.
#
# > sudo chmod 755 -R /etc/letsencrypt/{live,archive}
#
# # use socat
#

socat OPENSSL-LISTEN:1443,cert=/etc/letsencrypt/live/egel.dev/fullchain.pem,key=/etc/letsencrypt/live/egel.dev/privkey.pem,cafile=/etc/letsencrypt/live/egel.dev/fullchain.pem,verify=0,reuseaddr,fork TCP4-CONNECT:192.168.2.7:1480
