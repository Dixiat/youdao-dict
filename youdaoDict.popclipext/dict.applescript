-- init chars & keycode(a-z)
set chars to "abcdefghijklmnopqrstuvwxyz"
set keycodes to { 0, 11, 8, 2,14,3, 5, 4, 34,38, 40, 37,46, 45, 31, 35, 12, 15, 1, 17, 32, 9, 13, 7, 16, 6 }

-- get selected text
set selectedText to changeCaseOfText("{popclip text}", "lower")

tell application "System Events"
	-- open the search panel of Youdao dict
	-- shortcut: option + z
	key code 6 using {option down}
	delay 0.1

	-- clear input
	key code 51
	delay 0.1

	-- type query string(hello)
	repeat with char in characters of selectedText
        set charIndex to offset of char in chars
        set keycode to item charIndex of keycodes
        key code keycode
    end repeat

	-- check the first search result
	key code 125
	key code 76
end tell

-- define functions
-- function: change case of text
on changeCaseOfText(theText, theCaseToSwitchTo)
    if theCaseToSwitchTo contains "lower" then
        set theComparisonCharacters to "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        set theSourceCharacters to "abcdefghijklmnopqrstuvwxyz"
    else if theCaseToSwitchTo contains "upper" then
        set theComparisonCharacters to "abcdefghijklmnopqrstuvwxyz"
        set theSourceCharacters to "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    else
        return theText
    end if
    set theAlteredText to ""
    repeat with aCharacter in theText
        set theOffset to offset of aCharacter in theComparisonCharacters
        if theOffset is not 0 then
            set theAlteredText to (theAlteredText & character theOffset of theSourceCharacters) as string
        else
            set theAlteredText to (theAlteredText & aCharacter) as string
        end if
    end repeat
    return theAlteredText
end changeCaseOfText