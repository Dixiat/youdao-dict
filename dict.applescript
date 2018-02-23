-- get selected text
set selectedText to "{popclip text}"

tell application "System Events"
	-- activate the search panel of Youdao dict
	-- shortcut: option + z
	key code 6 using { option down }
	delay 0.1

	-- clear input
	key code 51

	-- set selected text to clipboard
	set the clipboard to selectedText
	-- paste query into input of application
	key code 9 using {command down}

	-- check the first search result
	key code 125
	key code 76
end tell