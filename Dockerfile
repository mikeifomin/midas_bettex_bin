FROM mikeifomin/midas_wallet_base:v1-zeromq-dev

WORKDIR /usr/local/bin

COPY ./bettexd .
COPY ./bettex-cli .

RUN chmod +x ./* && \
    ln bettexd walletd && \
    ln bettex-cli wallet-cli

VOLUME ["/root/.bettex"]
EXPOSE 31470

RUN walletd --help || exit $(($? == 127))
