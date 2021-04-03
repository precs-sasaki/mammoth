function __fish_mammoth_needs_command
  set cmd (commandline -opc)
  if [ (count $cmd) -eq 1 -a $cmd[1] = 'mammoth' ]
    return 0
  end
  return 1
end

function __fish_mammoth_using_command
  set cmd (commandline -opc)
  if [ (count $cmd) -gt 1 ]
    if [ $argv[1] = $cmd[2] ]
      return 0
    end
  end
  return 1
end

complete -f -c mammoth -n '__fish_mammoth_needs_command' -a '(mammoth commands)'
for cmd in (mammoth commands)
  complete -f -c mammoth -n "__fish_mammoth_using_command $cmd" -a "(mammoth completions $cmd)"
end
