setlocal tabstop=4
setlocal shiftwidth=4
setlocal softtabstop=4
setlocal textwidth=80
setlocal noexpandtab
nnoremap <F8> :w<CR>:exec '!g++ -w % && ./a.out'<CR>
