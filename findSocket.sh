lolliSocket(){
    uname | grep ^Darwin$ >/dev/null && \
	   	find /var/folders/ 2>/dev/null | grep agent.sock$| tail -n 1
    uname | grep ^Linux$ >/dev/null && \
	    	lsof | grep lollipop | grep /lollipop-| sed 's/[[:space:]]/ /g'| tr -s ' '| cut -d' ' -f9 | head -n1
}
echo "export SSH_AUTH_SOCK=\$(lolliSocket)"
