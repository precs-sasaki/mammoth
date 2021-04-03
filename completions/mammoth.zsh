if [[ ! -o interactive ]]; then
    return
fi

compctl -K _mammoth mammoth

_mammoth() {
  local words completions
  read -cA words

  if [ "${#words}" -eq 2 ]; then
    completions="$(mammoth commands)"
  else
    completions="$(mammoth completions ${words[2,-1]})"
  fi

  reply=("${(ps:\n:)completions}")
}
