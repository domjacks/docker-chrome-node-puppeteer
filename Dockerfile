FROM public.ecr.aws/docker/library/centos:7
# Required by Amazon
VOLUME /var/lib/docker
# Setup
RUN yum update -y
# Install python 3.6
RUN yum -y install python36 python36-pip python36-devel && yum clean all
# Install Node
RUN  curl -sL https://rpm.nodesource.com/setup_12.x | bash - \
    && yum install -y git nodejs \
    && npm i -g npm@6 \
    && npm i -g n \
    && n 12 \
    && yum clean all
# Install build tools
RUN yum -y install bzip2 gcc-c++ make && yum clean all
# Install Chrome
RUN curl -sL https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm -o chrome.rpm \
    && yum localinstall -y chrome.rpm \
    && yum clean all \
    && rm chrome.rpm

ADD . /tmp/puppeteer/
WORKDIR /tmp/puppeteer/
RUN npm i

CMD npm test
