return{
  'Bekaboo/deadcolumn.nvim',
  config = function()
    require('deadcolumn').setup({
      blending = {
        threshold = 0.8,
        colorcode = '#000000',
        -- hlgroup = { 'NonText', 'bg' },
      },
      scope = 'visible', 
      modes = {'n', 'i'},
    })
  end, 
}
