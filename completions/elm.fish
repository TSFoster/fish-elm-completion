function __fish_elm_at_stage
  [ (count (commandline -opc)) -eq $argv[1] ]
  and return 0
  return 1
end

function __fish_elm_using_command
  contains (commandline -opc)[2] $argv
end


# elm command completion

complete --command=elm --condition='__fish_elm_at_stage 1' --arguments='repl' --description='open up an interactive programming session' --no-files
complete --command=elm --condition='__fish_elm_at_stage 1' --arguments='init' --description='start Elm project' --no-files
complete --command=elm --condition='__fish_elm_at_stage 1' --arguments='reactor' --description='start a local server on your computer' --no-files
complete --command=elm --condition='__fish_elm_at_stage 1' --arguments='make' --description='compile Elm code into JS or HTML'
complete --command=elm --condition='__fish_elm_at_stage 1' --arguments='install' --description='fetch packages from package.elm-lang.org' --no-files
complete --command=elm --condition='__fish_elm_at_stage 1' --arguments='bump' --description='figure out the next version number based on API changes' --no-files
complete --command=elm --condition='__fish_elm_at_stage 1' --arguments='diff' --description='detect API changes' --no-files
complete --command=elm --condition='__fish_elm_at_stage 1' --arguments='publish' --description='publish your package at package.elm-lang.org' --no-files


# elm repl options

complete --command=elm --condition='__fish_elm_using_command repl' --long-option=interpreter --require-parameter --description='supply path to an alternate JS interpreter'
complete --command=elm --condition='__fish_elm_using_command repl' --long-option=no-colors --no-files --description='turn off the colors in the REPL'


# elm reactor options

complete --command=elm --condition='__fish_elm_using_command reactor' --long-option=port --require-parameter --description='the port of the server (default: 8000)'


# elm make options

complete --command=elm --condition='__fish_elm_using_command make' --long-option=debug --description='turn on the time-travelling debugger'
complete --command=elm --condition='__fish_elm_using_command make' --long-option=optimize --description='turn on optimizations to make code smaller and faster'
complete --command=elm --condition='__fish_elm_using_command make' --long-option=output --description='specify the name of the resulting JS file'
complete --command=elm --condition='__fish_elm_using_command make' --long-option=report --description='specify output format for errors' --arguments=json
complete --command=elm --condition='__fish_elm_using_command make' --long-option=docs --description='generate a JSON file of documentation for a package'


# elm install/diff package completion

# Based on https://github.com/ohanhi/fish-elm-completions
function __fish_elm_package_all_packages
  set -q XDG_CACHE_HOME
  and set __fish_elm_package_list_path $XDG_CACHE_HOME/elm-packages.txt
  or set __fish_elm_package_list_path ~/.cache/elm-packages.txt
  mkdir -p (dirname $__fish_elm_package_list_path)

  # Based on https://github.com/eeue56/elm-bash-completion/
  set _week_in_secs 604800
  set _current_time (date +%s)

  set _package_list_time 0
  [ -f $__fish_elm_package_list_path ] 2>/dev/null
  and set _package_list_time (date -r $__fish_elm_package_list_path +%s)

  [ $_current_time -gt (math "$_package_list_time + $_week_in_secs") ]
  and curl 'https://package.elm-lang.org/all-packages' -sS | string match --all --regex '[^"]*/[^"]*' >$__fish_elm_package_list_path

  [ -f $__fish_elm_package_list_path ]
  cat $__fish_elm_package_list_path
end

complete --command=elm --condition='__fish_elm_using_command install diff' --arguments='(__fish_elm_package_all_packages)'
