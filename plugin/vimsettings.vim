" Vim plugin for reading Vim settings from a file in upward directories.
" Maintainer: Alexey Alexandrov <alexei.alexandrov@gmail.com>

" Exit quickly when:
" - this plugin was already loaded
" - when 'compatible' is set
" - some autocommands are already taking care of compressed files
if exists("loaded_vimsettings") || &cp
  finish
endif
let loaded_vimsettings = 1

if v:version < 700
    echoerr "vimsettings: this plugin requires vim >= 7."
    finish
endif

function! s:readVimSettings()
    " Find setting files in upper directories. Reverse the list
    " to get the closest files at the end
    let files = findfile(".vimsettings", expand("%:p:h") . ";", -1)
    call reverse(files)

    " Now source the found files in a sandbox
    for file in files
        let b:readVimSettings = 1
        exe "sandbox source" file
    endfor
endfunction

augroup vimsettings
    " Remove all vimsettings autocommands
    au!

    " Enable reading the settings for all files
    autocmd BufRead,BufNewFile * call s:readVimSettings()
augroup END
