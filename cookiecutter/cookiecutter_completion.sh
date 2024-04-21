# This script defines a bash function _cookiecutter_completion that will be called 
# when the user presses <TAB>. This function calls the cookiecutter command with a 
# special environment variable _COOKIECUTTER_COMPLETE=complete, which triggers the autocompletion feature in click.

# DIDN'T GIVE ERROR
# _cookiecutter_completion()
# {
#     COMPREPLY=( $( env COMP_WORDS="${COMP_WORDS[*]}" \
#                    COMP_CWORD=$COMP_CWORD \
#                    autocomplete_template ${1:-""} ) )
#     return 0
# }

# complete -F _cookiecutter_completion -o default cookiecutter;

# _cookiecutter_completions()
# {
#     local word=${COMP_WORDS[COMP_CWORD]}
#     local completions=$(cookiecutter --get-completions "$word")
#     COMPREPLY=( $(compgen -W "$completions" -- "$word") )
# }
# complete -F _cookiecutter_completions cookiecutter

_cookiecutter_completion()
{
    local word=${COMP_WORDS[COMP_CWORD]}
    local completions=$(cookiecutter --completion "$word")
    COMPREPLY=( $(compgen -W "$completions" -- "$word") )
}
complete -F _cookiecutter_completion -o default cookiecutter;