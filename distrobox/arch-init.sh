
sudo pacman-key --init
sudo pacman-key --populate archlinux
sudo pacman -Sy --noconfirm archlinux-keyring

sudo pacman -Syu --noconfirm \
    neovim \
    zsh \
    git \
    ripgrep \
    fd \
    curl \
    jq \
    python \
    python-pip \
    go \
    zsh \
    eza \
    bat \
    tmux \
    npm \
    nodejs \
    nano \
    net-tools \
    gdb \
    gcc \
    nasm \
    ghidra \
    pwndbg \
    binwalk \
    zellij \
    xclip


# install rust with defaults
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
rustup component add rust-analyzer

curl -LsSf https://astral.sh/uv/install.sh | env UV_NO_MODIFY_PATH=1 sh

python -m pip install --no-input pyright ruff black isort --break-system-packages

# gopls install
go install golang.org/x/tools/gopls@latest

# Install for IDA Pro fonts
sudo pacman -Syu --noconfirm --needed \
    ttf-dejavu \
    ttf-liberation \
    noto-fonts \
    noto-fonts-cjk \
    freetype2 \
    fontconfig

# bash -c "$(curl -fsSL https://gef.blah.cat/sh)"

# makepkg -si on sasquatch

sudo chsh -s /usr/bin/zsh $USER
