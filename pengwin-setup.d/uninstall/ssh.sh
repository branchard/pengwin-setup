#!/bin/bash

source $(dirname "$0")/uninstall-common.sh

ssh_rgx='^[^#]*\bALL=NOPASSWD: /usr/bin/start-ssh'

function main()
{

echo "Uninstalling SSH server"

echo "Cleaning sudoers modification..."
sudo_clean_file "/etc/sudoers" "$ssh_rgx"

sudo_rem_file "/usr/bin/start-ssh"
sudo_rem_file "/etc/profile.d/start-ssh.sh"

remove_package "ssh"

}

if show_warning "SSH server" "$@" ; then
	main "$@"
fi
