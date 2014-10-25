function githel -a command
  set -l count (count $argv)

  if test $count -eq 0
    __githel_usage
    return
  end

  switch $command
    case show
      ssh githel ./show_repos
    case create
      __githel_create $count $argv
    case remote
      __githel_remote $count $argv
    case '*'
      __githel_usage
  end
end

function __githel_create -a count command
  if test $count -eq 1
    __githel_usage
    return
  end

  set -l params $argv[3..-1]
  ssh githel ./create_repo $params
end

function __githel_remote -a count command second
  if test $count -eq 1
    __githel_usage
    return
  end

  set -l params $argv[3..-1]

  if test $second = 'create'
    if test $count -eq 2
      __githel_usage
      return
    end

    set -e params[1]
    set -l count (math $count - 1)
    __githel_create $count create $params
  end

  set -l remote (ruby -e "puts 'githel:' << File.join(ARGV) << '.git'" $params)
  echo adding remote `$remote` as name `hel`
  git remote add hel $remote
end

function __githel_usage
  echo "usage:
    githel show
    githel create Path To Repository repo_name
    githel remote [create] Path To Repository repo_name"
  echo
end
