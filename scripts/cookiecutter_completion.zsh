# Define completion function
_cookiecutter_completion() {
    local word
    word=${words[$CURRENT]}
    local completions
    completions=$(cookiecutter --completion "$word")
    reply=(${(ps:\n:)$completions})
}

# Register completion function
compctl -K _cookiecutter_completion cookiecutter
