function git-prune-gone --description 'Delete all local git branches that were deleted from origin (upstream)'
    set_color yellow
    echo "This will delete ALL local git branches that are marked 'gone' (deleted from upstream)."
    echo "Branches containing the string 'backup' will be ignored."
    echo

    # Fetch the list of branches
    # set branch_list (git branch -vv | grep 'gone' | grep -v 'backup' | cut -d' ' -f3)
    set branch_list (git branch -vv | cut -d' ' -f3 | grep -v '^\*')

    # Preview branches to be deleted
    echo "Deleting the following branches:"
    set_color blue
    echo $branch_list | tr ' ' '\n' | xargs -I {} echo '  - {}'
    echo

    # Ask for confirmation
    if confirm "Proceed?"
        # Actually delete
        set_color red
        echo
        echo $branch_list | tr ' ' '\n' | xargs -I {} git branch '{}'

        set_color green
        echo
        echo "Done."
    else
        set_color red
        echo
        echo "Aborted."
    end

    set_color normal
end