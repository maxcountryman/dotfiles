source $HOME/.cargo/env

set -g fish_user_paths "/usr/local/opt/llvm/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/openssl@1.1/bin" $fish_user_paths

starship init fish | source

set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH

source "$HOME/.homesick/repos/homeshick/homeshick.fish"

source /Users/max/.docker/init-fish.sh || true # Added by Docker Desktop

# pnpm
set -gx PNPM_HOME "/Users/max/Library/pnpm"
set -gx PATH "$PNPM_HOME" $PATH
# pnpm end