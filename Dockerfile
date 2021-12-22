FROM fedora:32

ENV SYSTEMD_IGNORE_CHROOT=1

# https://docs.oracle.com/en-us/iaas/Content/Compute/Tasks/manage-plugins.htm#install-agent
RUN curl 'https://objectstorage.us-phoenix-1.oraclecloud.com/p/-VOLFC0_me9TRHlsK9wLQihmRZe4-UjzinOrAvIORZhqZbPoH1P6cSocD1GFwvZW/n/imagegen/b/agents/o/oracle-cloud-agent-1.18.0-6194.el8.x86_64.rpm' -o /tmp/oracle-cloud-agent.rpm && \
    dnf -y --setopt=tsflags=nodocs install file systemd /tmp/oracle-cloud-agent.rpm && \
    dnf clean all

CMD /usr/libexec/oracle-cloud-agent/agent