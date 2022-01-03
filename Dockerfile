#### This is a command line driven certificate authority container ##
## 
## Set the base
FROM ubuntu
##
## Lets Set Container Information as well as some basic arguments
## Label The System
### Labels That will Change
LABEL org.opencontainers.image.created="1/3/2022"
LABEL org.opencontainers.image.version="2022-01"
### Static Labels
LABEL org.opencontainers.image.authors="MTCode4600 Code Administrator"
LABEL org.opencontainers.image.documentation="https://github.com/MTCode4600/certauth"
LABEL org.opencontainers.image.source="https://github.com/MTCode4600/certauth"
LABEL org.opencontainers.image.licenses="GPL v3 - See Ubuntu & EASYRSA Official Sites for their respective licensing"
LABEL org.opencontainers.image.title="Certificate Authroity SSL Administration"
LABEL org.opencontainers.image.description="Ubuntu Focal Base plus EASYRSA to have a cerficate authority to secure their infastructure details on how to configure EASYRSA can be found at https://www.digitalocean.com/community/tutorials/how-to-set-up-and-configure-a-certificate-authority-ca-on-ubuntu-20-04"
LABEL org.opencontainers.image.base.name="ubuntu"
## Tell ubuntu not to ask any questions
ARG DEBIAN_FRONTEND=noninteractive
## I cant expose a file in the docker build as a volume so this is just as well.
## Lets get DDClient Installed
RUN apt update && apt install -y easy-rsa
RUN mkdir /ssl && chmod 700 /ssl
RUN ln -s /usr/share/easy-rsa/* /ssl
RUN cd /ssl && easyrsa init-pki
COPY vars /ssl/vars
## Copy the scripts needed to launch and log the system
RUN mkdir /home/scripts
COPY entrypoint.sh /home/scripts/entrypoint.sh
RUN chmod 777 /home/scripts/entrypoint.sh
RUN touch /var/log/entrypoint.log
## Lets do some clean up before we let everyone have fun
RUN apt -y autoremove
RUN apt clean
RUN apt-get autoremove --yes
## Yes this will most likely make APT brake but thats why I update this frequently. (once every 3 months so expect 4 a yr Jan. Apr. July & Oct unless Security Issues Arise)
## I suggest using Docker-Compose to run this setup so that you can maintain better version controls. Versions will be named mtdocker4600/ddclient:year-##
RUN rm -rf /var/lib/{apt,dpkg,cache,log}/
## Lets get the party started
CMD /home/scripts/entrypoint.sh