SNIPPET="export PROMPT_COMMAND='history -a' && export HISTFILE=/commandhistory/.zsh_history"
echo "$SNIPPET" >> "/home/vscode/.zshrc"
# Remove Duplicates and Line Numbers
echo "alias hg='history | perl -pe \"~s/ *[0-9]+ *//\" | uniq -u | grep'" >> "/home/vscode/.zshrc"
