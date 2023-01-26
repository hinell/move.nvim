local   move_vert = require('move.core.vert')
local   move_hor = require('move.core.horiz')
local   exports = {}
		exports.commands = {
			  { "MoveLine"  ,function(e) move_vert.moveLine (tonumber(e.args)) end, { force=true, nargs=1, complete="expression", desc = "Line: move" } }
			, { "MoveHChar" ,function(e) move_hor.horzChar  (tonumber(e.args)) end, { force=true, nargs=1, complete="expression", desc = "Line: move selection" } }
			, { "MoveBlock" ,function(e) move_vert.moveBlock(tonumber(e.args), tonumber(e.line1), tonumber(e.line2)) end, { force=true, nargs=1, range="%", desc = "Line: Block: move visual block" } }
			, { "MoveHBlock",function(e) move_hor.horzBlock (tonumber(e.args)) end, { force=true, nargs=1, range="%", complete="expression", desc = "Line: move visual block horizontally" } }
		}
		exports.keymaps = {
			  { { "n" } ,":MoveLine  -1<CR>"         ,cb = move_vert.moveLine  ,"Line: move up (Plugin move)" }
			, { { "n" } ,":MoveLine   1<CR>"         ,cb = move_vert.moveLine  ,"Line: move down (Plugin move)" }
			, { { "i" } ,"<ESC>:MoveLine -1<CR>gi"   ,cb = move_vert.moveLine  ,"Line: move up (Plugin move)" }
			, { { "i" } ,"<ESC>:MoveLine  1<CR>gi"   ,cb = move_vert.moveLine  ,"Line: move down (Plugin move)" }
			, { { "v" } ,":MoveHChar -1<CR>"         ,cb = move_hor.horzChar   ,"Line: Selection: move left (Plugin move)" }
			, { { "v" } ,":MoveHChar  1<CR>"         ,cb = move_hor.horzChar   ,"Line: Selection: move right (Plugin move)" }
			, { { "x" } ,":MoveHBlock -1<CR>"        ,cb = move_hor.horzBlock  ,"Line: Block: move left (Plugin move)" }
			, { { "x" } ,":MoveHBlock  1<CR>"        ,cb = move_hor.horzBlock  ,"Line: Block: move right (Plugin move)" }

			, { { "v" } ,":MoveBlock -1<CR>"         ,cb = move_vert.moveBlock ,"Line: Block: move up (Plugin move)" }
			, { { "v" } ,":MoveBlock  1<CR>"         ,cb = move_vert.moveBlock ,"Line: Block: move down  (Plugin move)" }	
		}
		exports.setup = function()
				local keymaps = exports.keymaps
				local opts = { noremap = true } 
				require("legendary").setup({
					keymaps = {
						  { mode = keymaps[1][1] ,"<A-Up>"		,keymaps[1][2], description = keymaps[1][3], opts = opts }
						, { mode = keymaps[2][1] ,"<A-Down>"	,keymaps[2][2], description = keymaps[2][3], opts = opts }
						, { mode = keymaps[3][1] ,"<A-Up>"		,keymaps[3][2], description = keymaps[3][3], opts = opts }
						, { mode = keymaps[4][1] ,"<A-Down>"	,keymaps[4][2], description = keymaps[4][3], opts = opts }
						, { mode = keymaps[5][1] ,"<A-Left>"	,keymaps[5][2], description = keymaps[5][3], opts = opts }
						, { mode = keymaps[6][1] ,"<A-Right>"	,keymaps[6][2], description = keymaps[6][3], opts = opts }
						, { mode = keymaps[7][1] ,"<A-Left>"	,keymaps[7][2], description = keymaps[7][3], opts = opts }
						, { mode = keymaps[8][1] ,"<A-Right>"	,keymaps[8][2], description = keymaps[8][3], opts = opts }
						
						, { mode = keymaps[9 ][1] ,"<A-Up>"		,keymaps[9 ][2], description = keymaps[9 ][3], opts = opts }
						, { mode = keymaps[10][1] ,"<A-Down>"	,keymaps[10][2], description = keymaps[10][3], opts = opts }
					}
				})
		end
return exports
