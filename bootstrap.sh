#!/bin/bash

# -----------------------------------------------------------------------------
# usage
# -----------------------------------------------------------------------------

_usage_function() {
read -r -d '' _usage_string <<EOF
Usage:
  ./bootstrap.sh [-h|--help]
  ./bootstrap.sh [-u|--username <username>]
  ./bootstrap.sh [-n|--name <name>]
                 [-e|--email <email>]
                 [-g|--github <github>]
                 [-i|--irssi <irssi>]

Options:
  -h, --help
    print this help message
  -u, --username <username>
    set user name (defaults to "$USER")
  -n, --name <name>
    set full name (defaults to "Andy Weidenbaum")
  -e, --email <email>
    set email address (defaults to "archbaum@gmail.com")
  -g, --github <github>
    set GitHub username (defaults to "atweiden")
  -i, --irssi <irssi>
    set irssi username (defaults to "atweiden")
EOF
echo "$_usage_string"
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    -h|--help)
      _usage_function
      exit 0
      ;;
    -u|--username)
      _username="$2"
      # shift past argument and value
      shift
      shift
      ;;
    -n|--name)
      _name="$2"
      shift
      shift
      ;;
    -e|--email)
      _email="$2"
      shift
      shift
      ;;
    -g|--github)
      _github="$2"
      shift
      shift
      ;;
    -i|--irssi)
      _irssi="$2"
      shift
      shift
      ;;
    *)
      # unknown option
      _usage_function
      exit 1
      ;;
  esac
done


# -----------------------------------------------------------------------------
# settings
# -----------------------------------------------------------------------------

username="${_username:-$USER}"         # User    (yay)
name="${_name:-Andy Weidenbaum}"       # Name    (GitHub/AUR)
email="${_email:-archbaum@gmail.com}"  # Email   (GitHub/AUR)
github="${_github:-atweiden}"          # Account (GitHub)
irssi="${_irssi:-atweiden}"            # Account (IRC)


# -----------------------------------------------------------------------------
# dirs
# -----------------------------------------------------------------------------

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
mkdir -p "$HOME/.src"      \
         "$HOME/Desktop"   \
         "$HOME/Documents" \
         "$HOME/Downloads" \
         "$HOME/Graphics"  \
         "$HOME/Music"     \
         "$HOME/Projects"


# -----------------------------------------------------------------------------
# rsync
# -----------------------------------------------------------------------------

# rsync options
_rsync_opts=()

# exclude files
_rsync_opts+=('--exclude=.git'
              '--exclude=.hg'
              '--exclude=.subgit'
              '--exclude=bootstrap.sh'
              '--exclude=fetch-pgp-keys.sh'
              '--exclude=README.txt'
              '--exclude=UNLICENSE')

# copy directories recursively
_rsync_opts+=('--recursive')

# copy symlinks as symlinks
_rsync_opts+=('--links')

# preserve permissions
_rsync_opts+=('--perms')

# backup files in ~/.local/share/dotfiles
_rsync_opts+=('--backup'
              "--backup-dir=$HOME/.local/share/dotfiles")

# output numbers in a more human-readable format
_rsync_opts+=('--human-readable')

# print information showing the progress of the transfer
_rsync_opts+=('--progress')

rsync --verbose "${_rsync_opts[@]}" "$DIR/" "$HOME"


# -----------------------------------------------------------------------------
# vim
# -----------------------------------------------------------------------------

# clone plugins for vim 8 package management
"$HOME/.vim/pack/install.sh"


# -----------------------------------------------------------------------------
# makepkg
# -----------------------------------------------------------------------------

sed -i "s#yourname#$name#"         "$HOME/.config/pacman/makepkg.conf"
sed -i "s#youremail#$email#"       "$HOME/.config/pacman/makepkg.conf"


# -----------------------------------------------------------------------------
# yay
# -----------------------------------------------------------------------------

sed -i "s#yourusername#$username#" "$HOME/.config/yay/config.json"


# -----------------------------------------------------------------------------
# github
# -----------------------------------------------------------------------------

sed -i "s#yourname#$name#"         "$HOME/.config/git/config"
sed -i "s#youremail#$email#"       "$HOME/.config/git/config"
sed -i "s#yourgithubacct#$github#" "$HOME/.config/git/config"
sed -i "s#yourname#$name#"         "$HOME/.config/hg/hgrc"
sed -i "s#youremail#$email#"       "$HOME/.config/hg/hgrc"


# -----------------------------------------------------------------------------
# irssi
# -----------------------------------------------------------------------------

sed -i "s#yourname#$irssi#"        "$HOME/.config/irssi/config"


# -----------------------------------------------------------------------------
# permissions
# -----------------------------------------------------------------------------

chmod 700 "$HOME/.gnupg" "$HOME/.ssh"

# vim: set filetype=sh foldmethod=marker foldlevel=0 nowrap:
