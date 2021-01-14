FROM eshamster/cl-base:2.5.1

ADD ./test.sh /root
RUN ros install ccl-bin && \
    ros install rove

ENTRYPOINT ["/root/test.sh"]
