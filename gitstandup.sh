function yesterworkday() 
{ 
    if [[ "1" == "$(date +%u)" ]]
    then 
        echo "last friday"
    else
        echo "yesterday"
    fi
}

git log --since "$(yesterworkday)" --author "$(git config user.name)" --oneline
