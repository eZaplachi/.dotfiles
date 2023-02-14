# Add fenv to path
set fish_function_path $fish_function_path ~/plugin-foreign-env/functions

# Source Nix setup script
fenv source ~/.nix-profile/etc/profile.d/nix.sh

alias ls="la -A"
alias vim="nvim"
