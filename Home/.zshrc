# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias cl="clear"
alias cdf="cd ~/Projects/Freelance/"
alias cdp="cd ~/Projects/Personal/"
alias coffee="killall -9 CoffeeTalk.exe"
alias cpugovernor="cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor"
alias dev="npm run dev"
alias download_album="yt-dlp -x --audio-format mp3 --audio-quality 0 --embed-metadata --embed-thumbnail --write-info-json --write-thumbnail"
alias download_vid="yt-dlp -f 'bestvideo[height=720]+bestaudio' --merge-output-format mp4"
alias ff="fastfetch"
alias ffarch="fastfetch --config ~/.config/fastfetch/arch.jsonc"
alias ff-full="fastfetch --config ~/.config/fastfetch/groups.jsonc"
alias ffmin="fastfetch --config ~/.config/fastfetch/minimal.jsonc"
alias ffmini="fastfetch --config ~/.config/fastfetch/mini.jsonc"
alias ffos="fastfetch --config ~/.config/fastfetch/os.jsonc"
alias icat="kitten icat --scale-up"
alias icatgif="kitty +kitten icat --transfer-mode file ~/Pictures/Frieren/Frieren.gif"
alias lg="lazygit"
alias nc="ncmpcpp"
alias nv="nvim"
alias setwal="feh --bg-fill"
alias syu="paru -Syu"
alias syy="paru -Syy"
alias test="npm test"
alias tm="tmux"
alias tmks="tmux kill-server"
alias tmls="tmux ls"
alias x="exit"

# Using Neovim as the default text editor
export EDITOR=nvim

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Huh?
embed_cover() {
    cover=$(ls *.jpg | head -n 1)  # Ambil gambar JPG pertama di folder
    if [ -z "$cover" ]; then
        echo "Cover.jpg not found!"
        return 1
    fi

    for file in *.mp3; do
        new_file="new_$file"  # Buat nama baru dengan prefix "new_"

        ffmpeg -i "$file" -i "$cover" -map 0:a -map 1:v -c:v mjpeg \
            -metadata:s:v title="Album Art" -metadata:s:v comment="Cover (front)" \
            -c:a copy "$new_file"

        if [ $? -eq 0 ]; then  # Jika ffmpeg sukses
            rm "$file"  # Hapus file lama
            mv "$new_file" "$file"  # Ubah nama file baru agar tetap sama dengan yang lama
            echo "Successfully added cover to: $file"
        else
            echo "Failed to process: $file"
        fi
    done

    echo "Done! Now all songs got cover album."
}

# Make and change directory
mkc() {
  mkdir $1
  cd $1
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
