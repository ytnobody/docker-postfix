FROM ytnobody/ubuntu-jp
MAINTAINER ytnobody <ytnobody@gmail.com>

## install postfix
RUN apt-get install postfix -y --force-yes

## install syslog-ng for output log of postfix
RUN apt-get install syslog-ng syslog-ng-core -y --force-yes

## then, avoid a security issue | see http://d.hatena.ne.jp/tyru/20140522/run_syslog_ng_docker
RUN sed -i 's/system();/unix-dgram("\/dev\/log");/' /etc/syslog-ng/syslog-ng.conf

## add run script
ADD run /usr/local/bin/run
RUN chmod +x /usr/local/bin/run

EXPOSE 25

## run !
CMD ["/usr/local/bin/run"]
