FROM archlinux:latest
LABEL authors="David Bellotti <dbellotti@gmail.com>"

RUN pacman -Syyu --noconfirm \
      base \
      base-devel \
      diff-so-fancy \
      docker \
      docker-compose \
      fish \
      git \
      jq \
      lsd \
      neovim \
      python-pip \
      python3 \
      the_silver_searcher \
      tldr \
      tmux \
      tree \
      ttf-roboto \
      wget

RUN useradd builduser -m && passwd -d builduser && printf 'builduser ALL=(ALL) ALL\n' | tee -a /etc/sudoers
RUN sudo -u builduser bash -c \
      "cd ~ && \
      git clone https://aur.archlinux.org/yay.git && \
      cd yay && \
      makepkg -sri --noconfirm"
RUN sudo -u builduser bash -c "yay -Syyu --noconfirm heroku-cli"

RUN pip3 install --user neovim
RUN curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

RUN nvim --headless +PlugInstall +qall

COPY .config /root/.config
ADD .gitconfig /root/.gitconfig

WORKDIR /root

ENV SHELL /usr/sbin/fish

ENTRYPOINT ["fish"]
