# Colors
WHITE="%F{255}"
CYAN="%F{81}"
BLUE="%F{33}"
RESET="%f"

# Username@Host
PROMPT="${WHITE}%n@%m "

# Full PWD with ~
PROMPT+="${CYAN}%~ "

# Git segment (branch if in repo)
PROMPT+='${BLUE}$(git_prompt_info)'

# Final prompt symbol
PROMPT+="${WHITE}% ${RESET}"

# Configure git info formatting
ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX=") "
ZSH_THEME_GIT_PROMPT_DIRTY="*"
ZSH_THEME_GIT_PROMPT_CLEAN=""