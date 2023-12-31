if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -g fish_greeting

set -xg PATH $PATH "$HOME/go/bin"
set -xg PATH $PATH "/home/user/repos/git-fuzzy/bin"
# set -xg PATH="/home/user/repos/nodejs/node-v14.17.3-linux-x64/bin:$PATH"
fish_add_path "$HOME/bin"
fish_add_path "/home/user/.cargo/bin"

set -xg PYTHONPATH "/home/user/repos/me-kitchen/xcore_tests"
set -xg CXX "/usr/bin/g++-10"
set -xg CC "/usr/bin/gcc-10"
set -xg EDITOR "nvim"

set -xg AUTOTEST_LOG_LEVEL_STDOUT "debug"
set -xg XCORE_ENV_PATH "/home/user/repos/xcore_env"
set -xg APP_LOGS_DIR "~/kitchen/run-core/data/logs"

set -xg CPLUS_INCLUDE_PATH "/usr/include/c++/10:/usr/include/x86_64-linux-gnu/c++/10:/usr/local/include:/usr/include/x86_64-linux-gnu:/usr/include:/usr/include/c++/10/backward"

alias gs='git status'
alias gb='git branch'
alias jfmt='python3 -m json.tool'
alias mebuild='cmake --build . --target=all -j8'
alias targets='cmake --build . --target=help'
alias metest="ctest -j 8 -E .*perf.*"
alias tgclienttool='python3.10 /home/user/repos/me-kitchen/xcore_tests/tg_client_tool/json-client.py'
alias gitfiles='git diff-tree --no-commit-id --name-only -r'
alias bell='echo -e \\a'
alias ll='exa -lh'
alias rebase_updated_develop='git fetch ; git rebase origin/develop'

starship init fish | source
