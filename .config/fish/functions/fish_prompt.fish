function fish_prompt -d "Write out the prompt"
        printf '%s[%s%s%s@%s%s%s:%s%s%s%s]%s> ' (set_color blue) (set_color normal) (whoami) (set_color blue) (set_color normal) (hostname|cut -d . -f 1) (set_color blue) (set_color normal) (set_color $fish_color_cwd) (prompt_pwd) (set_color blue) (set_color normal)
end
