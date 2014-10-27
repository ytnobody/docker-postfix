# ytnobody/docker-postfix

A docker image that contains Postfix MTA

## How to use your own configuration file

Create your original docker image that based ytnobody/docker-postfix:latest

Example.

    FROM ytnobody/docker-postfix:latest
    MAINTAINER ytnobody <ytnobody@gmail.com>
    
    # add customized main.cf into container
    ADD main.cf /etc/postfix/main.cf
    
    # and aliases and apply it 
    ADD aliases /etc/aliases
    RUN /usr/sbin/postalias /etc/aliases

Then, docker run it.

## Exposed port

* 25/tcp
