lolliSocket(){
    lsof | grep lollipop | grep /lollipop-| sed 's/[[:space:]]/ /g'| tr -s ' '| cut -d' ' -f9
}
