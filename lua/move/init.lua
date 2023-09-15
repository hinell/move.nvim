local	move_vert = require('move.core.vert')
local	move_hor  = require('move.core.horiz')
local	exports   = {}
		exports.commands = {
			  { "MoveLine"  ,function(e) move_vert.moveLine (tonumber(e.args)) end, { force=true, nargs=1, complete="expression", desc = "Line: move" } }
			, { "MoveHChar" ,function(e) move_hor.horzChar  (tonumber(e.args)) end, { force=true, nargs=1, complete="expression", desc = "Line: move selection" } }
			, { "MoveBlock" ,function(e) move_vert.moveBlock(tonumber(e.args), tonumber(e.line1), tonumber(e.line2)) end, { force=true, nargs=1, range="%", desc = "Line: Block: move visual block" } }
			, { "MoveHBlock",function(e) move_hor.horzBlock (tonumber(e.args)) end, { force=true, nargs=1, range="%", complete="expression", desc = "Line: move visual block horizontally" } }
			, { "MoveWord"  ,function(e) move_hor.horzWord  (tonumber(e.args:gsub("[()]", ""), 10)) end, { force=true, nargs=1, range="%", complete="expression", desc = "Line: move visual block horizontally" } }
		}
		exports.keymap = {
			  { mode = { "n" } ,"<A-Up>"		,":MoveLine  -1<CR>" , description = "Line: move up" }
			, { mode = { "n" } ,"<A-Down>"		,":MoveLine   1<CR>" , description = "Line: move down" }
			, { mode = { "n" } ,"<A-S-Left>"	,":MoveWord  -1<CR>" , description = "Line: word: move left" }
			, { mode = { "n" } ,"<A-S-Right>"	,":MoveWord   1<CR>" , description = "Line: word: move right" }

			, { mode = { "i" } ,"<A-Up>"	,"<CMD>MoveLine -1<CR>"  , description = "Line: move up" }
			, { mode = { "i" } ,"<A-Down>"	,"<CMD>MoveLine  1<CR>"  , description = "Line: move down" }
			, { mode = { "v" } ,"<A-Left>"	,":MoveHChar -1<CR>" , description = "Line: selection: move left" }
			, { mode = { "v" } ,"<A-Right>"	,":MoveHChar  1<CR>" , description = "Line: selection: move right" }

			, { mode = { "v" } ,"<A-Up>"	,":MoveBlock -1<CR>" , description = "Line: block: move up" }
			, { mode = { "v" } ,"<A-Down>"	,":MoveBlock  1<CR>" , description = "Line: block: move down " }	
			, { mode = { "x" } ,"<A-Left>"	,":MoveHBlock -1<CR>", description = "Line: block: move left" }
			, { mode = { "x" } ,"<A-Right>"	,":MoveHBlock  1<CR>", description = "Line: block: move right" }
		}
		-- foo bar bazz
		-- Setup opts
		for key,value  in pairs(exports.keymap) do
			value.opts = { noremap = true }
			exports.keymap[key] = value
		end
		
		exports.setup = function()
				local keymap = exports.keymap
				local legendary = require("legendary")
				legendary.keymaps(keymap)
		end
return exports
