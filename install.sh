# Install and source nix
git clone https://github.com/eZaplachi/nix && sudo mv nix ~/etc

curl -L https://nixos.org/nix/install | sudo sh

. ~/.nix-profile/etc/profile.d/nix.sh

# Install Packages
nix-env -iA \
	nixpkgs.fish \
	nixpkgs.git \
  nixpkgs.gcc \
  nixpkgs.gnumake \
	nixpkgs.neovim \
	nixpkgs.nodejs \
	nixpkgs.nodePackages.pnpm \
	nixpkgs.python3Full \
	nixpkgs.python3Packages.pip \
	nixpkgs.rustup \
  nixpkgs.go \
  nixpkgs.lua \
  nixpkgs.luajit \
  nixpkgs.luajitPackages.luarocks-nix \
  nixpkgs.php82 \
  nixpkgs.php82Packages.composer \
  nixpkgs.zulu \
	nixpkgs.tmux \
	nixpkgs.fzf \
	nixpkgs.ripgrep \
  nixpkgs.fd \
	nixpkgs.bat \
	nixpkgs.stow \
	nixpkgs.gh \
	nixpkgs.unzip \
	nixpkgs.universal-ctags

# Stow sotfiles
stow git
stow nvim
stow fish
stow tmux

# Neovim setup
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

cd ~/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim
make
cd ~
# Set switch to shell
command -v fish | sudo tee -a /etc/shells
#sudo sed s/required/sufficient/g -i /etc/pam.d/chsh # PAM auth failed workaround
#sudo chsh -s $(which fish) $USER


# Fish shell setup
git clone https://github.com/oh-my-fish/plugin-foreign-env.git

fish

# Misc
gh auth login
