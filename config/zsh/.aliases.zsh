back() {
	local string=""
	for i in {1..$1}
		string+=$(printf "../")
	cd $string
}

newscript() {
	touch $1 && chmod +x $1
}

alias \
	sl="ls" \
	tmux="tmux -f ${XDG_CONFIG_HOME}/tmux/tmux.conf" \
	jlremote="jupyter lab --no-browser --port=9876" \
	vi="vim"

