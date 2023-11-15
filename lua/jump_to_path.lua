vim.cmd([[
nnoremap <leader>tp Bvt:"fyf:lviw"lywlviw"cy:ToggleTerm<cr>:e <C-r>f<cr>:call cursor(<C-r>l, <C-r>c)<cr>
nmap <leader>te ?error:<cr>b<leader>tp
]])
--yank file into f  ^^^^^^^
--goto line num + copy it  ^^^^^^^^
--goto column num + copy it into c ^^^^^^^^
--then do the commands to go to those locations with ':e (register f)' and ':call cursor(register l, register c)'
