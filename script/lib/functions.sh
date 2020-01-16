warn() {
    printf "\r  [ \033[38;5;214mWARN\033[0m ] $1\n"
}

info() {
    printf "\r  [ \033[00;34mINFO\033[0m ] $1\n"
}

user() {
    printf "\r  [ \033[00;33m????\033[0m ] $1\n"
}

success() {
    printf "\r\033[2K  [ \033[00;32mGOOD\033[0m ] $1\n"
}

fail() {
    printf "\r\033[2K  [ \033[00;31mFAIL\033[0m ] $1\n"
}
