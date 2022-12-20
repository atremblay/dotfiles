local status_ok, comment = pcall(require, "nvim-comment-frame")
if not status_ok then
	return
end
comment.setup({

	-- if true, <leader>cf keymap will be disabled
	disable_default_keymap = false,

	-- adds custom keymap
	multiline_keymap = "<leader>C",

	-- fill the comment frame border with this character
	fill_char = "-",

	-- width of the comment frame
	frame_width = 70,

	-- wrap the line after 'n' characters
	line_wrap_len = 66,

	-- automatically indent the comment frame based on the line
	auto_indent = true,

	-- add comment above the current line
	add_comment_above = true,
})