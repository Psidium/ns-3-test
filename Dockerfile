from networkstatic/iperf3

COPY ./iperf-test1-docker.sh /iperf-test1-docker.sh
RUN chmod +x /iperf-test1-docker.sh

ENTRYPOINT ["/iperf-test1-docker.sh"]
CMD ["0.0.0.0"]
