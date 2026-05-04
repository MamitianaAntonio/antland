if status is-interactive
    set -g fish_greeting ""
end

oh-my-posh init fish --config ~/.cache/oh-my-posh/themes/space.omp.json | source
