# This script defines a bash function _cookiecutter_completion that will be called 
# when the user presses <TAB>. This function calls the cookiecutter command with a 
# special environment variable _COOKIECUTTER_COMPLETE=complete, which triggers the autocompletion feature in click.
_cookiecutter_completion()
{
    COMPREPLY=( $( env COMP_WORDS="${COMP_WORDS[*]}" \
                   COMP_CWORD=$COMP_CWORD \
                   _COOKIECUTTER_COMPLETE=complete $1 ) )
    return 0
}

complete -F _cookiecutter_completion -o default cookiecutter;