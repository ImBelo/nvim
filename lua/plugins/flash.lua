return {
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
      modes = {
        search = {
          jump = { pos = "range", -- Jump to middle 60% of screen (not strict center)
            range = function()
              local height = vim.api.nvim_win_get_height(0)
              return {
                -- 20% from top to 80% from top (middle zone)
                min = math.floor(height * 0.2),
                max = math.floor(height * 0.8)
              }
            end,
          }
        }
      }
    },
    keys = {
      -- Enhanced 's' key (like sneak.nvim)
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash Jump" },
      
      -- Fast down (jump to middle zone)
      { "<C-d>", function()
          require("flash").jump({
            search = { forward = true, wrap = false },
            jump = { pos = "range" }
          })
        end, desc = "Jump Down (Middle Zone)" 
      },
      
      -- Fast up (jump to middle zone)
      { "<C-u>", function()
          require("flash").jump({
            search = { forward = false, wrap = false },
            jump = { pos = "range" }
          })
        end, desc = "Jump Up (Middle Zone)" 
      },
    },
  }
}
