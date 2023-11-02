
require('hlchunk').setup({
indent = {
        enable = true,
        chars = {
            "․",
            "⁚",
            "⁖",
           -- "⁘",
           -- "⁙",
    },
    style = {
        "#666666",
        "#555555",
        "#444444",
         vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("Whitespace")), "fg", "gui"),
    },
}






})
