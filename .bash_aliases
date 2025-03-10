alias os_info='uname -r && cat ~/../../etc/os-release'

# lists directory aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# espressif sdk aliases
alias esp_idf_config='. $HOME/Projects/esp-idf/export.sh'
alias esp='idf.py'

# bare repo handling alias
alias gitBareRepo='git --git-dir=$HOME/bareRepo.git --work-tree=$HOME'

# git aliases
git config --global alias.co checkout
git config --global alias.sw switch
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status
git config --global alias.last 'log -1 HEAD'
git config --global alias.cleanSubs 'submodule foreach \"git submodule deinit --all\"'

#Jetson nano specific
#alias open_camera='gst-launch-1.0 v4l2src device="/dev/video0" ! xvimagesink -e'
