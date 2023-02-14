# Install and source nix
curl -L https://nixos.org/nix/install | sudo sh

. ~/.nix-profile/etc/profile.d/nix.sh

# Install Packages
nix-env -iA \
	nixpkgs.fish \
        nixpkgs.git \
        nixpkgs.gcc \
        nixpkgs.lua \
        nixpkgs.luajit \
        nixpkgs.luajitPackages.luarocks-nix \
        nixpkgs.nodejs \
	nixpkgs.nodePackages.pnpm \
        nixpkgs.php82 \
        nixpkgs.php82Packages.composer \
        nixpkgs.python3Full \
	nixpkgs.python3Packages.pip \
	nixpkgs.rustup \
        nixpkgs.go \
        nixpkgs.zulu \
	nixpkgs.tmux \
	nixpkgs.bat \
	nixpkgs.fzf \
	nixpkgs.ripgrep \
        nixpkgs.fd \
        nixpkgs.gnumake \
	nixpkgs.stow \
	nixpkgs.gh \
	nixpkgs.unzip \
	nixpkgs.neovim \
	nixpkgs.universal-ctags

# Set switch to shell
command -v fish | sudo tee -a /etc/shells
#sudo sed s/required/sufficient/g -i /etc/pam.d/chsh # PAM auth failed workaround
#sudo chsh -s $(which fish) $USER


# Fish shell setup
cp -f nix-env.fish/conf.d/nix-env.fish fish/.config/fish/conf.d

# Stow dotfiles
stow bash
stow fish
stow git
stow nvim
stow tmux

# Neovim setup
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

cd ~/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim
make
cd ~

fish

# Misc
gh auth login
