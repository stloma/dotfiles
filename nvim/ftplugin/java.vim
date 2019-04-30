nnoremap <F8> :w <CR>:exec '!javac % && java' shellescape(expand('%:r'), 1)<cr>
