return {
    cmd          = {
        'pylsp',
    },
    filetypes    = { 'python' },
    root_markers = { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", "Pipfile",
        ".venv" },
    settings     = {
        pylsp = {
            plugins = {
                -- Linter options
                pycodestyle = {
                    enabled = false
                },
                pylint = {
                    enabled = true,
                    args = {
                        "--max-line-length=100",
                        "--init-hook",
                        "import sys; sys.path.append('.')"
                        -- "--disable=missing-module-docstring",
                        -- "--disable=wrong-import-order"
                    }
                },
                -- Formatter options
                black = {
                    enabled = true,
                    args = {
                        "--line-length 100"
                    }
                },
                -- Type checker
                pylsp_mypy = {
                    enabled = true
                },
                -- Auto-completion options
                jedi_completion = {
                    enabled = true,
                    fuzzy = true
                },
                -- Import sorting
                pyls_isort = {
                    enabled = false
                },
            }
        }
    }
}
