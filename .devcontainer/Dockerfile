FROM alpine:latest

RUN apk add --no-cache shadow bash zsh curl jq git openssh-client gpg less nano starship ruby && \
    echo "eval \"\$(starship init zsh)\"" >>/root/.zshrc && \
    chsh -s /bin/zsh

CMD zsh
