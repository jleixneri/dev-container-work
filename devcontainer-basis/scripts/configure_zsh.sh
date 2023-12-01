# Clone zsh plugin 
# https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# replace plugin in .zshrc
sed -i "s/plugins=(git)/plugins=(zsh-autosuggestions)/g" ~/.zshrc 
