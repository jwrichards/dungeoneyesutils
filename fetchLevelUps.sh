if [[ -z "$1" ]]; then
        read -p "Dungeon: " -r dungeon
else
        dungeon=$1
fi
if [[ -z "$2" ]];then
        read -p "Character: " -r char
else
        char=$2
fi
levelupsPage=$(curl https://dungeoneyes.com/dungeon-$dungeon-$char-level-up/)
levelupsText=$(grep 'has-medium' <<<$levelupsPage | tail -1)
levelupsClean=$(sed 's:<br><br>:<br>:g' <<<$levelupsText | sed 's:\<br\>:\\n:g' | sed 's:<em><strong>::g' | sed 's:<strong><em>::g' | sed 's:><::g' | sed 's:</strong/em>::g' | sed 's:</em/strong>::g')
echo -e "$levelupsClean" | grep "^>"

#as a 1-liner
#read -p "Dungeon: " -r dungeon;read -p "Character: " -r char;levelups=$(curl https://dungeoneyes.com/dungeon-$dungeon-$char-level-up/ | grep 'has-medium' | tail -1 | sed 's:<br><br>:<br>:g' | sed 's:\<br\>:\\n:g' | sed 's:<em><strong>::g' | sed 's:<strong><em>::g' | sed 's:><::g' | sed 's:</strong/em>::g' | sed 's:</em/strong>::g') && echo -e $levelups | grep "^>"
