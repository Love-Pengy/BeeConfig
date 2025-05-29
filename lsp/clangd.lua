return {
  cmd = {
    'clangd',
    '--clang-tidy',
    '--header-insertion=iwyu',
    '--completion-style=detailed',
    '--fallback-style=none',
    '--function-arg-placeholders=false',
  },
  root_markers = { '.clangd', 'compile_commands.json', 'compile_flags.txt' },
  filetypes = { 'c', 'h', 'cpp' },
}
