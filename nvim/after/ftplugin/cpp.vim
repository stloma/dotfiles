setlocal tabstop=2
setlocal shiftwidth=2
setlocal softtabstop=2
setlocal textwidth=80
setlocal noexpandtab
nnoremap <F8> :w<CR>:exec '!g++ -w % && ./a.out'<CR>


abbr pv for (auto el : V) cout << el << " ";<CR>cout << endl;<ESC>
abbr _cpp #include <iostream><CR><CR>using namespace std;<CR><CR>int main() {<CR>}<ESC>O
