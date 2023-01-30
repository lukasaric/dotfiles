set_symlink() {
  path="$1"
  symlink_path="$2"
  should_overwrite_all="$3"
  if [ ! -e "$symlink_path" ] || [ "$should_overwrite_all" = "1" ]; then
    echo "will be created $path $symlink_path $should_overwrite_all"
    rm -rf "$symlink_path"
    ln -sv "$path" "$symlink_path"
  fi
}

######## Creating symlinks
should_overwrite_all=0
read -p "Do you want to overwrite existing files in your home dirrectory? [y/n] " -e force

if [[ $force =~ ^[Yy]$ ]]; then
  echo "Existing config files will be overwritten!"
  should_overwrite_all=1
else
  echo "Existing config files will not be overwritten!"
  should_overwrite_all=0
fi

if [ ! -f "$SELF_PATH/.zshenv" ]; then
  touch "$SELF_PATH/.zshenv"
fi

echo "Creating symlinks"
nvim_src="$SELF_PATH/.config/nvim"
nvim_dest="$HOME/.config/nvim"

kitty_src="$SELF_PATH/.config/kitty"
kitty_dest="$HOME/.config/kitty"

karabiner_src"$SELF_PATH/.config/karabiner"
karabiner_dest="$HOME/.config/karabiner"

zshrc_src="$SELF_PATH/.zshrc"
zshrc_dest="$HOME/.zshrc"

tmux_conf_src="$SELF_PATH/.tmux.conf"
tmux_conf_dest="$HOME/.tmux.conf"

set_symlink "$nvim_src" "$nvim_dest" "$should_overwrite_all"
set_symlink "$kitty_src" "$kitty_dest" "$should_overwrite_all"
set_symlink "$karabiner_src" "$karabiner_dest" "$should_overwrite_all"
set_symlink "$zshrc_src" "$zshrc_dest" "$should_overwrite_all"
set_symlink "$tmux_conf_src" "$tmux_conf_dest" "$should_overwrite_all"
