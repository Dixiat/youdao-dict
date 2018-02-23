-- init chars & keycode([a-z] & space)
set chars to "abcdefghijklmnopqrstuvwxyz ABCDEFGHIJKLMNOPQRSTUVWXYZ"
set keycodes to { 0, 11, 8, 2, 14, 3, 5, 4, 34, 38, 40, 37, 46, 45, 31, 35, 12, 15, 1, 17, 32, 9, 13, 7, 16, 6, 49 }

-- get selected text
set selectedText to "{popclip text}"

tell application "System Events"
	-- open the search panel of Youdao dict
	-- shortcut: option + z
	key code 6 using { option down }
	delay 0.1

	-- clear input
	key code 51
	delay 0.1

	-- type query string(hello)
	repeat with char in characters of selectedText
		considering case
			set charIndex to offset of char in chars
		end considering

		if charIndex > 27 then
			set charIndex to charIndex mod 27
			set keycode to item charIndex of keycodes
			key code keycode using { shift down }
		else
			set keycode to item charIndex of keycodes
			key code keycode
		end if
	end repeat

	-- check the first search result
	key code 125
	key code 76
end tell