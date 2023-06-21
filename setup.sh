#! /bin/bash

set -Eeuo pipefail;

dotfiles_repo_path="${HOME}/dotfiles";
file_list=$(ls -A ${dotfiles_repo_path});

echo "Setting up dotfiles...";
echo "";

for file_name in ${file_list}; do
	if [[ ${file_name:0:1} != "." ]]; then
		continue;
	fi;
	if [[ ${file_name} == ".git" ]]; then
		continue;
	fi;

	if [[ ! -f "${HOME}/${file_name}" ]]; then
		ln --symbolic ${dotfiles_repo_path}/${file_name} ${HOME}/${file_name};
		echo "Symlinked ${file_name}!";
	else
		echo "Skipped symlinking ${file_name} as it already exists.";
	fi;
done;

echo "";
echo "Dotfiles setup done!";

