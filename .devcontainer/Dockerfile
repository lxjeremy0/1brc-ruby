FROM alpine:latest

RUN apk add --no-cache shadow bash zsh curl jq git openssh-client gpg less nano starship ruby \
        ruby-dev make build-base linux-headers && \
    echo "eval \"\$(starship init zsh)\"" >>/root/.zshrc && \
    chsh -s /bin/zsh && \
    gem install bundler

CMD zsh
