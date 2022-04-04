# macbook recovery scripts

NOTE that this does not backup data, just keys and provides scripts to install brew, etc

# backup

run the ./backup.sh script to backup ssh and gnupg keys to onedrive

# recover

* install xcode (you put a copy of Xcode_13.2.1.xip somewhere handy, right? try ~/onedrive/backup/xcode.txt)
* https://brew.sh/ - /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
* brew install git ansible
* git clone https://github.com/davidcoles/macbook.git && cd mabook && make playbook

