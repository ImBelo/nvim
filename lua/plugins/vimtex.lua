return{
  'lervag/vimtex',
  ft = 'tex', -- Lazy-load only for .tex files
  config = function()
    -- This is a minimal config. See :h vimtex-options for more.
    vim.g.vimtex_view_method = 'zathura' -- Use Zathura PDF viewer (best for Linux)

    vim.g.vimtex_compiler_method = 'latexmk' -- The standard compiler
    vim.g.vimtex_compiler_latexmk = { build_dir = 'build' } -- Keep your dir clean
    vim.g.vimtex_syntax_conceal = { -- Controls how LaTeX code is "concealed" to look nicer
      accents = 1,
      cites = 1,
      fences = 1,
      greek = 1,
      math_bounds = 1,
      math_delimiters = 1,
      math_fracs = 1,
      math_super_sub = 1,
      math_symbols = 1,
      sections = 0,
      styles = 1,
    }
    vim.g.vimtex_quickfix_mode = 0 -- Don't open quickfix window automatically on error
  end
}
