let wiki = {}
let wiki.path = '~/vimwiki/'
let wiki.nested_syntaxes = {'python': 'python', 'c++': 'cpp'}
let g:vimwiki_list = [wiki]

setlocal spell
highlight SpellBad guifg=#9c637a
