return {
  "sphamba/smear-cursor.nvim",

  opts = {
    smear_between_buffers = true,
    smear_between_neighbor_lines = true,
    -- Increase these values to reduce pixelation on small diagonal moves
    min_horizontal_distance_smear = 2,  -- Default is probably 1
    min_vertical_distance_smear = 2,    -- Default is probably 1
    scroll_buffer_space = false,
    legacy_computing_symbols_support = false,
    smear_insert_mode = true,
  },
}
