# certauth
A Command Line Driven Certificate Authority to secure resources
<br>
<br>
This Container runs EASYRSA. This is a lightweight Certificate Authrotiy Program<br>
<br>
This container contains no (0) configuration for the CA itself. So you will need to configure EASYRSA to your desired setup.<br>
All software is installed (Nano, OpenSSL, and EASYRSA). <br>
To keep this secure we didnt include a way to SSH directly to the container which can/could be added if desirected by using the docker files we have in this repository and editing the Dockerfile file to add installing openssh-server and exposing the ssh port.<br>
<br>
We should be updating this container in the docker repo on a quarterly basis, the version will be displayed for example as mtdocker4600/certauth:2022-01 02 03 04.<br>
<br>
