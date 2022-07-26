FROM ethereum/client-go:latest

COPY config.json /root
COPY password.txt /root
COPY keystore /root/keystore
COPY ./entrypoint.sh .
RUN chmod +x ./start.sh
ENTRYPOINT ["./start.sh"]