return{
  "scalameta/nvim-metals",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",
  },
  ft = { "scala", "sbt", },
  opts = function()
    local metals_config = require("metals").bare_config()
    metals_config.settings = {
      showImplicitArguments = true,
      javaHome = os.getenv("JAVA_HOME"),
      excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },
      serverVersion = "1.6.1",
      bloopJvmProperties = {"-Xmx2G"}, -- Custom JVM args for Bloop
    }

    metals_config.coursier = {"coursier"}

    metals_config.init_options.statusBarProvider = "off"

    metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()
    metals_config.on_attach = function(client, bufnr)

      local map = vim.keymap.set
      local opts = { buffer = bufnr }
      map("n", "gd", function() vim.lsp.buf.definition() end, opts)
      map("n", "K", function() vim.lsp.buf.hover() end, opts)
    end

    return metals_config
  end,
  config = function(self, metals_config)
    local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
    vim.api.nvim_create_autocmd("FileType", {
      pattern = self.ft,
      callback = function()
        require("metals").initialize_or_attach(metals_config)
      end,
      group = nvim_metals_group,
    })
  end
}
