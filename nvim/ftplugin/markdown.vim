setlocal shiftwidth=4
setlocal tabstop=4
setlocal softtabstop=4

nnoremap <F8> :call MarkdownToPdf()<cr>
imap <leader><leader><space> $\Rightarrow$
imap <leader><leader>l \begin{center}\rule{0.9\textwidth}{.4pt}\end{center}<ESC>F9

function! MarkdownToPdf()
  let l:out = '/src/out'
  let l:in = '/src/in'

  let l:templatename = 'eisvogel.tex'
  let l:templatedir = l:in . "/" . l:templatename
  let l:filename = l:out . "/" . fnameescape(expand('%:t'))
  let l:pdfout = l:out . "/" . fnameescape(expand('%:t:r')) . ".pdf"
  let l:pdfname = fnameescape(expand('%:p:r')) . ".pdf"
  let l:containername = 'arch-pandoc'

  let l:pwd = fnameescape(expand('%:p:h'))
  let l:outvol = fnameescape(expand('%:p:h')) . ":/src/out"
  let l:invol = "/home/lockwood/.config/pandoc:/src/in"

  execute "!docker run --rm
        \ -v" l:outvol"
        \ -v" l:invol"
        \ " l:containername "
        \ --from markdown --template" l:templatedir"
        \ --listings -o" l:pdfout l:filename
  execute "!qpdfview" l:pdfname
endfunction


