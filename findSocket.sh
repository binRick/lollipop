lolliSocket(){
    lsof | grep lollipop | grep /lollipop-| sed 's/[[:space:]]/ /g'| tr -s ' '| cut -d' ' -f9 | head -n1
}
echo "export SSH_AUTH_SOCK=\$(lolliSocket)"
