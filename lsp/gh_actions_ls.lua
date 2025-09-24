--- https://github.com/neovim/nvim-lspconfig/blob/master/lsp/gh_actions_ls.lua

---@type vim.lsp.Config
return {
    cmd = { 'gh-actions-language-server', '--stdio' },
    filetypes = { 'yaml' },

    -- `root_dir` ensures that the LSP does not attach to all yaml files
    root_dir = function(bufnr, on_dir)
        local parent = vim.fs.dirname(vim.api.nvim_buf_get_name(bufnr))
        if
            vim.endswith(parent, '/.github/workflows')
            or vim.endswith(parent, '/.forgejo/workflows')
            or vim.endswith(parent, '/.gitea/workflows')
        then
            on_dir(parent)
        end
    end,
    handlers = {
        ['actions/readFile'] = function(_, result)
            if type(result.path) ~= 'string' then
                return nil, nil
            end
            local file_path = vim.uri_to_fname(result.path)
            if vim.fn.filereadable(file_path) == 1 then
                local f = assert(io.open(file_path, 'r'))
                local text = f:read('*a')
                f:close()

                return text, nil
            end
            return nil, nil
        end,
    },
    init_options = {}, -- needs to be present https://github.com/neovim/nvim-lspconfig/pull/3713#issuecomment-2857394868
    capabilities = {
        workspace = {
            didChangeWorkspaceFolders = {
                dynamicRegistration = true,
            },
        },
    },
}
