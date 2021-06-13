
if [[ -f ~/.bashrc ]]; then
  source ~/.bashrc
fi



for file in ~/.{aliases,function}; do
 [[ -r "$file" ]] && [[ -f "$file" ]] && source "$file";
done
unset file
