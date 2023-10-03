#!/usr/bin/env bash

# Check if fish is installed and accessible
if command -v fish >/dev/null; then
	echo "Fish detected on \$PATH."
else
	echo "Error: Fish not detected on \$PATH. Install it first."
	echo
	echo "Exiting."
	exit 1
fi

readonly fish_path=$(which fish)

# Add fish to /etc/shells
if grep -q "$fish_path" /etc/shells; then
	echo "Fish detected in /etc/shells."
else
	echo "Adding fish to /etc/shells at $fish_path."
	echo "  Sudo is required - you may be prompted for your password."
	echo
	echo "$fish_path" | sudo tee -a /etc/shells >/dev/null
fi

# Change user default shell
if [[ $SHELL == "$fish_path" ]]; then
	echo "Fish is already the default shell."
else
	echo "Setting user shell to $fish_path."
	echo "  You may be prompted for your password."
	echo "  IMPORTANT: Ensure you are changing shell for your user (not for root!)"
	echo
	chsh -s $fish_path
fi
