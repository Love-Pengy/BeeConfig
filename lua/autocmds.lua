vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("LspMappings", { clear = true }),
    callback = function(args)
        local opts = { buffer = args.buf }

        vim.keymap.set('n', 'gh', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', 'go', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', 'gR', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'x' }, 'gf', vim.lsp.buf.format, opts)
        vim.keymap.set('n', 'ga', vim.lsp.buf.code_action, opts)
    end,
})

vim.cmd [[set completeopt+=menuone,noselect,popup]]
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup("LspFunctions", { clear = true }),
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)

        -- if client:supports_method('textDocument/inlayHint') then
        --   vim.lsp.inlay_hint.enable(true, {bufnr = args.buf})
        -- end

        if client:supports_method('textDocument/completion') then
            vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
        end
    end,
})


-- Templates
vim.api.nvim_create_autocmd("BufNewFile", {
    group = vim.api.nvim_create_augroup("templates", { clear = true }),
    desc = "Load template file",
    callback = function(args)
        local fname = vim.fn.fnamemodify(args.file, ":t")

        local replacements = {
            ["${1:filename}"] = fname,
            ["${2:date}"] = os.date("%b %d, %Y"),
            ["${3:year}"] = os.date("%Y"),
            ["${4:filename_cap}"] = string.upper(vim.fn.fnamemodify(args.file, "%:t:r"))
        }

        local gen_fname = "gen"
        local work_fname = "work"
        local fname_ext = vim.fn.fnamemodify(args.file, ":e")

        if fname:match "main.c" then
            work_fname = work_fname .. "_main"
            gen_fname = gen_fname .. "_main"
        end

        if (vim.fn.filereadable(vim.fn.stdpath("config") .. "/templates/" .. work_fname
                .. '.' .. fname_ext) == 1) then
            vim.cmd("0r " .. vim.fn.stdpath("config") .. "/templates/" .. work_fname
                .. '.' .. fname_ext)
        elseif (vim.fn.filereadable(vim.fn.stdpath("config") .. "/templates/" .. gen_fname
                .. '.' .. fname_ext) == 1) then
            vim.cmd("0r " .. vim.fn.stdpath("config") .. "/templates/"
                .. gen_fname .. '.' .. fname_ext)
        else
            return
        end

        for key, value in pairs(replacements) do
            vim.cmd("silent! %s/" .. key .. '/' .. value)
        end

        vim.cmd("normal! G")
    end
})
