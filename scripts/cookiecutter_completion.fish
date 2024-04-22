# Define completion function
function _cookiecutter_completion
    set -l word (commandline -t)
    set completions (cookiecutter --completion "$word")
    for completion in $completions
        echo $completion
    end
end

# Register completion function
complete -f -c cookiecutter -a '(_cookiecutter_completion)'
