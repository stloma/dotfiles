function! customFunctions#GetBackground(group)
  redir => highlight
  silent execute 'silent highlight ' . a:group
  redir END

  let link_matches = matchlist(highlight, 'links to \(\S\+\)')
  if len(link_matches) > 0 " follow the link
    return gitgutter#highlight#get_background_colors(link_matches[1])
  endif

  let ctermbg = gitgutter#highlight#match_highlight(highlight, 'ctermbg=\([0-9A-Za-z]\+\)')
  let guibg   = gitgutter#highlight#match_highlight(highlight, 'guibg=\([#0-9A-Za-z]\+\)')
  return [guibg, ctermbg]
endfunction

function! customFunctions#HLNext (blinktime)
    set invcursorline
    redraw
    exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
    set invcursorline
    redraw
endfunction
