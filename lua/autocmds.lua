vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("LspMappings", {clear = true}),
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

vim.cmd[[set completeopt+=menuone,noselect,popup]]
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup("LspFunctions", {clear = true}),
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)

        -- if client:supports_method('textDocument/inlayHint') then
        --   vim.lsp.inlay_hint.enable(true, {bufnr = args.buf})
        -- end

        if client:supports_method('textDocument/completion') then
            vim.lsp.completion.enable(true, client.id, args.buf, {autotrigger = true})
        end

    end,
})


-- FIXME: This should depend on each specific file's work and gen alternatives just in case ~ BEF
local fptrc = io.open(vim.fn.stdpath("config") .. "/templates/work_main.c")
local fptrh = io.open(vim.fn.stdpath("config") .. "/templates/work.h")

-- Templates
vim.api.nvim_create_autocmd("BufNewFile", {
    group = vim.api.nvim_create_augroup("templates", { clear = true }),
    desc = "Load template file",
        callback = function(args)
            -- fnamemodify with `:t` gets the tail of the file path: the actual filename
            -- See :help fnamemodify
            local fname = vim.fn.fnamemodify(args.file, ":t")
            local fname_noext = vim.fn.expand("%:t:r")

            -- FIXME: fix this mess ~ BEF
            if fname:match "main.c" then
                vim.cmd("0r " .. vim.fn.stdpath("config") .. (fptrc and "/templates/work_main.c" or "/templates/main.c"))
            elseif fname:match "%.c$" then
                vim.cmd("0r " .. vim.fn.stdpath("config") .. (fptrc and "/templates/work_gen.c" or "/templates/gen.c"))
            elseif fname:match "%.h$" then
                vim.cmd("0r " .. vim.fn.stdpath("config") .. (fptrh and "/templates/work.h" or "/templates/gen.h"))
            elseif fname:match "%.sh$" then
                vim.cmd("0r " .. vim.fn.stdpath("config") .. (fptrh and "/templates/work.sh" or "/templates/gen.sh"))
            elseif fname:match "%.yaml$" then
                vim.cmd("0r " .. vim.fn.stdpath("config") .. (fptrh and "/templates/work.yaml" or "/templates/gen.yaml"))
            elseif fname:match "%.py$" then
                vim.cmd("0r " .. vim.fn.stdpath("config") .. (fptrh and "/templates/work.py" or "/templates/gen.py"))
            elseif fname:match "%.md$" then
                vim.cmd("0r " .. vim.fn.stdpath("config") .. "/templates/gen.md")
            elseif fname:match "%.lua$" then
                vim.cmd("0r " .. vim.fn.stdpath("config") .. (fptrh and "/templates/work.lua" or "/templates/gen.lua"))
            end

            -- FIXME: no fr fix this mess ~ BEF
            -- We making devs cry with this one 💯
            vim.cmd("silent! %s/${1:filename}/" .. fname)
            vim.cmd("silent! %s/${2:date}/" .. os.date("%b %d, %Y"))
            vim.cmd("silent! %s/${3:year}/" .. os.date("%Y"))
            vim.cmd("silent! %s/${4:filename_cap}/" .. string.upper(fname_noext))
        end
})
