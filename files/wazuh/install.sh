#!/bin/bash
#
apt install python3.12-venv net-tools -y
python3 -m venv /var/ossec/.venv
/var/ossec/.venv/bin/pip3 install docker==7.1.0 urllib3==1.26.20 requests==2.32.2

#cp DockerListener /var/ossec/wodles/docker/DockerListener

cat <<EOF >> /var/ossec/etc/ossec.conf

<ossec_config>
<wodle name="docker-listener">
  <disabled>no</disabled>
</wodle>
</ossec_config>
EOF

systemctl restart wazuh-agent
