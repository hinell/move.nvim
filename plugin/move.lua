local   cpo = vim.opt.cpoptions
        vim.cmd("set cpo&vim")
local	commands = require("move").commands

		if not vim.g.move_nvim_loaded then
			for k, command in ipairs(commands) do
				vim.api.nvim_create_user_command(command[1], command[2], command[3])
			end
		end

		vim.opt.cpoptions = cpo
		vim.g.move_nvim_loaded = true
