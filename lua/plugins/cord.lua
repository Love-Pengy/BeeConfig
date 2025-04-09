-- Do the following for vesktop using flatpak:
--  https://github.com/flathub/dev.vencord.Vesktop?tab=readme-ov-file#discord-rich-presence
return{
  'vyfor/cord.nvim',
  build = ':Cord update',
  --opts = {}
  config = function()
    require('cord').setup{
      buttons = {
        {
          label = function(opts)
            return opts.repo_url and 'View Repository' or 'My Website'
          end,

          url = function(opts)
            return opts.repo_url or 'https://github.com/Love-Pengy'
          end
        }
      },
      idle = {
        details = function(opts)
          return string.format('Taking a break from %s', opts.workspace)
        end
      },
      text = {
        editing = function(opts)
          return string.format('Editing %s', opts.filename, opts.cursor_line)
        end,

        workspace = function(opts)
          return string.format('Line %s', opts.cursor_line)
        end
      },
    }
  end
}
