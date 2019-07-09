FROM ubuntu:16.04
LABEL MAINTAINER="Jason Stevens <jason.stevens@microsoft.com>"

RUN apt update ;\
    apt install -y apt-transport-https ca-certificates curl jq wget ;\
    wget -q -O - https://packages.cloudfoundry.org/debian/cli.cloudfoundry.org.key | apt-key add - ;\
    echo "deb https://packages.cloudfoundry.org/debian stable main" | tee /etc/apt/sources.list.d/cloudfoundry-cli.list ;\
    apt update ;\
    apt upgrade -y ;\
    update-ca-certificates
RUN apt install -y cf-cli build-essential zlibc zlib1g-dev ruby ruby-dev openssl libxslt-dev libxml2-dev libssl-dev libreadline6 libreadline6-dev libyaml-dev libsqlite3-dev sqlite3 ;\
    wget -P /tmp https://releases.hashicorp.com/terraform/0.12.3/terraform_0.12.3_linux_amd64.zip && unzip -d /usr/local/bin /tmp/terraform_0.12.3_linux_amd64.zip && rm /tmp/terraform_0.12.3_linux_amd64.zip ;\
    wget -P /usr/local/bin https://github.com/cloudfoundry/bosh-cli/releases/download/v5.5.1/bosh-cli-5.5.1-linux-amd64 && chmod ugo+x /usr/local/bin/bosh-cli-5.5.1-linux-amd64 && ln -s /usr/local/bin/bosh-cli-5.5.1-linux-amd64 /usr/local/bin/bosh ;\
    wget -O - https://github.com/concourse/concourse/releases/download/v5.3.0/fly-5.3.0-linux-amd64.tgz | tar -C /usr/local/bin -xzf - ;\
    wget -O - https://github.com/cloudfoundry-incubator/credhub-cli/releases/download/2.5.2/credhub-linux-2.5.2.tgz | tar -C /usr/local/bin -zxf - ;\
    gem install cf-uaac ;\
    wget -P /usr/local/bin https://github.com/cloudfoundry/bosh-bootloader/releases/download/v8.1.0/bbl-v8.1.0_linux_x86-64 && chmod ugo+x /usr/local/bin/bbl-v8.1.0_linux_x86-64 && ln -s /usr/local/bin/bbl-v8.1.0_linux_x86-64 /usr/local/bin/bbl
