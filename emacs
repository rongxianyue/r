Echo area
      CS:CH-FR  BUF      POS LINE   (MAJOR MINOR)
CS describes the character set of the text in the buffer (*note
Coding Systems::).  If it is a dash (‘-’), that indicates no special
character set handling (with the possible exception of end-of-line
conventions, described in the next paragraph).  ‘=’ means no conversion
whatsoever, and is usually used for files containing non-textual data.
Other characters represent various “coding systems”—for example, ‘1’
represents ISO Latin-1.

   On frames created for ‘emacsclient’ (*note Invoking emacsclient::),
the next character is ‘@’.  This indication is typical for frames of an
Emacs process running as a daemon (*note Emacs Server::).

The character after CH is normally a dash (‘-’).  However, if
‘default-directory’ (*note File Names::) for the current buffer is on a
remote machine, ‘@’ is displayed instead.
   FR gives the selected frame name (*note Frames::).  It appears only
on text terminals.  The initial frame’s name is ‘F1’.

   Some features are listed together with the minor modes whenever they
are turned on, even though they are not really minor modes.  ‘Narrow’
means that the buffer being displayed has editing restricted to only a
portion of its text (*note Narrowing::).  ‘Def’ means that a keyboard
macro is currently being defined (*note Keyboard Macros::).


Instead of using the mouse, you can also invoke the first menu bar
item by pressing <F10> (to run the command ‘menu-bar-open’).  You can
then navigate the menus with the arrow keys or with ‘C-b’, ‘C-f’
(left/right), ‘C-p’, and ‘C-n’ (up/down).  To activate a selected menu
item, press <RET>; to cancel menu navigation, press ‘C-g’ or ‘<ESC>
<ESC> <ESC>’.  (However, note that when Emacs was built with a GUI
toolkit, the menus are drawn and controlled by the toolkit, and the key
sequences to cancel menu navigation might be different from the above
description.)

   Typing the help character (‘C-h’ or <F1>) after a prefix key displays
a list of the commands starting with that prefix.  The sole exception to
this rule is <ESC>: ‘<ESC> C-h’ is equivalent to ‘C-M-h’, which does
something else entirely.  You can, however, use <F1> to display a list
of commands starting with <ESC>.

   If the value of the variable ‘confirm-kill-emacs’ is non-‘nil’, ‘C-x
C-c’ assumes that its value is a predicate function, and calls that
function.  If the result of the function call is non-‘nil’, the session
is killed, otherwise Emacs continues to run.  One convenient function to
use as the value of ‘confirm-kill-emacs’ is the function ‘yes-or-no-p’.
The default value of ‘confirm-kill-emacs’ is ‘nil’.

   To kill Emacs without being prompted about saving, type ‘M-x
kill-emacs’.
   If the value of the variable ‘confirm-kill-processes’ is ‘nil’, ‘C-x
C-c’ does not ask for confirmation before killing subprocesses started
by Emacs.  The value is ‘t’ by default.

in most shells, you can
resume Emacs after suspending it with the shell command ‘%emacs’.


‘M-g c’
     Read a number N and move point to buffer position N.  Position 1 is
     the beginning of the buffer.

‘M-g <TAB>’
     Read a number N and move to column N in the current line.  Column 0
     is the leftmost column.  If called with a prefix argument, move to
     the column number specified by the argument’s numeric value.

‘C-x C-n’
     Use the current column of point as the “semipermanent goal column”
     for ‘C-n’ and ‘C-p’ (‘set-goal-column’) in the current buffer.
     When a semipermanent goal column is in effect, those commands
     always try to move to this column, or as close as possible to it,
     after moving vertically.  The goal column remains in effect until
     canceled.

‘C-u C-x C-n’
     Cancel the goal column.  Henceforth, ‘C-n’ and ‘C-p’ try to
     preserve the horizontal position, as usual.

‘C-x C-o’
     Delete all but one of many consecutive blank lines
     (‘delete-blank-lines’).

‘M-=’
     Display the number of lines, words, and characters that are present
     in the region (‘count-words-region’).  *Note Mark::, for
     information about the region.



   Emacs normally disallows most commands that use the minibuffer while
the minibuffer is active.  To allow such commands in the minibuffer, set
the variable ‘enable-recursive-minibuffers’ to ‘t’.

   When not active, the minibuffer is in ‘minibuffer-inactive-mode’, and
clicking ‘mouse-1’ there shows the ‘*Messages*’ buffer.  If you use a
dedicated frame for minibuffers, Emacs also recognizes certain keys
there, for example ‘n’ to make a new frame.

‘M-v’
‘<PageUp>’
‘<prior>’
     Typing ‘M-v’, while in the minibuffer, selects the window showing
     the completion list (‘switch-to-completions’).  This paves the way
     for using the commands below.  <PageUp> or <prior> does the same.

   If ‘completion-cycle-threshold’ is non-‘nil’, completion commands can
cycle through completion alternatives.  Normally, if there is more than
one completion alternative for the text in the minibuffer, a completion
command completes up to the longest common substring.  If you change
‘completion-cycle-threshold’ to ‘t’, the completion command instead
completes to the first of those completion alternatives; each subsequent
invocation of the completion command replaces that with the next
completion alternative, in a cyclic manner.  If you give
‘completion-cycle-threshold’ a numeric value N, completion commands
switch to this cycling behavior only when there are N or fewer
alternatives.

‘basic’
     A matching completion alternative must have the same beginning as
     the text in the minibuffer before point.  Furthermore, if there is
     any text in the minibuffer after point, the rest of the completion
     alternative must contain that text as a substring.

‘M-r REGEXP <RET>’
     Move to an earlier item in the minibuffer history that matches
     REGEXP (‘previous-matching-history-element’).
‘M-s REGEXP <RET>’
     Move to a later item in the minibuffer history that matches REGEXP
     (‘next-matching-history-element’).

‘C-x <ESC> <ESC>’
     Re-execute a recent minibuffer command from the command history
     (‘repeat-complex-command’).
‘M-x list-command-history’
     Display the entire command history, showing all the commands ‘C-x
     <ESC> <ESC>’ can repeat, most recent first.

   Incremental search does not, strictly speaking, use the minibuffer.
Therefore, although it behaves like a complex command, it normally does
not appear in the history list for ‘C-x <ESC> <ESC>’.  You can make
incremental search commands appear in the history by setting
‘isearch-resume-in-command-history’ to a non-‘nil’ value.  *Note
Incremental Search::.



‘C-h a TOPICS <RET>’
     This searches for commands whose names match the argument TOPICS.
     The argument can be a keyword, a list of keywords, or a regular
     expression (*note Regexps::).  *Note Apropos::.With a prefix argument,
     search for noninteractive functions too.

‘C-h i d m emacs <RET> i TOPIC <RET>’
     This searches for TOPIC in the indices of the Emacs Info manual,
     displaying the first match found.  Press ‘,’ to see subsequent
     matches.  You can use a regular expression as TOPIC.

‘C-h b’
     Display all active key bindings; minor mode bindings first, then
     those of the major mode, then global bindings
     (‘describe-bindings’).

‘C-h i d m emacs <RET> s TOPIC <RET>’
     Similar, but searches the _text_ of the manual rather than the
     indices.

‘C-h p’
     This displays the available Emacs packages based on keywords.

‘C-h d TOPICS <RET>’
     Display the commands and variables whose documentation matches
     TOPICS (‘apropos-documentation’).
‘C-h e’
     Display the ‘*Messages*’ buffer (‘view-echo-area-messages’).

‘C-h h’
     Display the ‘HELLO’ file, which shows examples of various character
     sets.

‘C-h l’
     Display a description of your last 300 keystrokes (‘view-lossage’).
‘C-h m’
     Display documentation of the current major mode and minor modes
     (‘describe-mode’).

‘C-h o SYMBOL’
     Display documentation of the Lisp symbol named SYMBOL
     (‘describe-symbol’).  This will show the documentation of all kinds
     of symbols: functions, variables, and faces.

‘C-h s’
     Display the contents of the current “syntax table”
     (‘describe-syntax’).  The syntax table says which characters are
     opening delimiters, which are parts of words, and so on.  *Note
     Syntax Tables: (elisp)Syntax Tables, for details.

‘C-h w COMMAND <RET>’
     Show which keys run the command named COMMAND (‘where-is’).
‘C-h C CODING <RET>’
     Describe the coding system CODING (‘describe-coding-system’).

‘C-h F COMMAND <RET>’
     Enter Info and go to the node that documents the Emacs command
     COMMAND (‘Info-goto-emacs-command-node’).
‘C-h I METHOD <RET>’
     Describe the input method METHOD (‘describe-input-method’).
‘C-h K KEY’
     Enter Info and go to the node that documents the key sequence KEY
     (‘Info-goto-emacs-key-command-node’).
‘C-h L LANGUAGE-ENV <RET>’
     Display information on the character sets, coding systems, and
     input methods used in language environment LANGUAGE-ENV
     (‘describe-language-environment’).
‘C-h S SYMBOL <RET>’
     Display the Info documentation on symbol SYMBOL according to the
     programming language you are editing (‘info-lookup-symbol’).
‘C-h .’
     Display the help message for a special text area, if point is in
     one (‘display-local-help’).  (These include, for example, links in
     ‘*Help*’ buffers.)

If the minibuffer prompt for ‘C-h f’ shows the function
name from the buffer as the default, it means that name is defined as a
Lisp function.  Type ‘C-g’ to cancel the ‘C-h f’ command if you don’t
really want to view the documentation.

‘M-x apropos’
     Search for functions and variables.  Both interactive functions
     (commands) and noninteractive functions can be found by this.

‘M-x apropos-user-option’
     Search for user-customizable variables.  With a prefix argument,
     search for non-customizable variables too.

‘M-x apropos-variable’
     Search for variables.  With a prefix argument, search for
     customizable variables only.

‘M-x apropos-value’
     Search for variables whose values match the specified pattern.
     With a prefix argument, search also for functions with definitions
     matching the pattern, and Lisp symbols with properties matching the
     pattern.

‘C-h d’
     Search for functions and variables whose documentation strings
     match the specified pattern (‘apropos-documentation’).

   When you specify more than one word in the apropos pattern, a name
must contain at least two of the words in order to match.  Thus, if you
are looking for commands to kill a chunk of text before point, you could
try ‘C-h a kill back backward behind before <RET>’.  The real command
name ‘kill-backward’ will match that; if there were a command
‘kill-text-before’, it would also match, since it contains two of the
specified words.

   If the variable ‘apropos-do-all’ is non-‘nil’, most apropos commands
behave as if they had been given a prefix argument.  There is one
exception: ‘apropos-variable’ without a prefix argument will always
search for all variables, no matter what the value of ‘apropos-do-all’
is.

 Help Mode Commands
‘C-c C-c’
     Show all documentation about the symbol at point
     (‘help-follow-symbol’).
‘C-c C-f’
     Go forward to the next help topic (‘help-go-forward’).
‘C-c C-b’
     Go back to the previous help topic (‘help-go-back’).

If you specify just ‘C-u’ as the prefix argument, ‘C-h
i’ prompts for the name of a documentation file, so you can browse a
file which doesn’t have an entry in the top-level Info menu.




part2

‘C-x C-x’
     Set the mark at point, and activate it; then move point where the
     mark used to be (‘exchange-point-and-mark’).

   Instead of setting the mark in order to operate on a region, you can
also use it to remember a position in the buffer (by typing ‘C-<SPC>
C-<SPC>’), and later jump back there (by typing ‘C-u C-<SPC>’).

   The command ‘C-x C-x’ (‘exchange-point-and-mark’) exchanges the
positions of point and the mark.  ‘C-x C-x’ is useful when you are
satisfied with the position of point but want to move the other end of
the region (where the mark is).  Using ‘C-x C-x’ a second time, if
necessary, puts the mark at the new position with point back at its
original position.  Normally, if the mark is inactive, this command
first reactivates the mark wherever it was last set, to ensure that the
region is left highlighted.  However, if you call it with a prefix
argument, it leaves the mark inactive and the region unhighlighted; you
can use this to jump to the mark in a manner similar to ‘C-u C-<SPC>’.

   Finally, you can set the mark by holding down the shift key while
typing certain cursor motion commands (such as ‘S-<RIGHT>’, ‘S-C-f’,
‘S-C-n’, etc.).  This is called “shift-selection”.  It sets the mark at
point before moving point, but only if there is no active mark set via
shift-selection.

   Many commands that insert text, such as ‘C-y’ (‘yank’), set the mark
at the other end of the inserted text, without activating it.  This lets
you easily return to that position (*note Mark Ring::).

   Under X, every time the active region changes, Emacs saves the text
in the region to the “primary selection”.  This lets you insert that
text into other X applications with ‘mouse-2’ clicks.  *Note Primary
Selection::.

‘C-M-@’
     Set mark after end of following balanced expression (‘mark-sexp’).
     This does not move point.
‘M-h’
     Move point to the beginning of the current paragraph, and set mark
     at the end (‘mark-paragraph’).
‘C-M-h’
     Move point to the beginning of the current defun, and set mark at
     the end (‘mark-defun’).
‘C-x C-p’
     Move point to the beginning of the current page, and set mark at
     the end (‘mark-page’).

   ‘M-@’ (‘mark-word’) sets the mark at the end of the next word (*note
Words::, for information about words).  Repeated invocations of this
command extend the region by advancing the mark one word at a time.  As
an exception, if the mark is active and located before point, ‘M-@’
moves the mark backwards from its current position one word at a time.

Convert case with ‘C-x C-l’ or ‘C-x C-u’ (*note Case::).
   • Undo changes within it using ‘C-u C-/’ (*note Undo::).
   • Replace text within it using ‘M-%’ (*note Query Replace::).
   • Indent it with ‘C-x <TAB>’ or ‘C-M-\’ (*note Indentation::).
   • Fill it as text with ‘M-x fill-region’ (*note Filling::).
Check the spelling of words within it with ‘M-$’ (*note
     Spelling::).
   • Evaluate it as Lisp code with ‘M-x eval-region’ (*note Lisp
     Eval::).
   • Save it in a register with ‘C-x r s’ (*note Registers::).


   Other commands always operate on the region, and have no default
behavior.  Such commands usually have the word ‘region’ in their names,
like ‘C-w’ (‘kill-region’) and ‘C-x C-u’ (‘upcase-region’).  If the mark
is inactive, they operate on the “inactive region”—that is, on the text
between point and the position at which the mark was last set (*note
Mark Ring::).  To disable this behavior, change the variable
‘mark-even-if-inactive’ to ‘nil’.  Then these commands will instead
signal an error if the mark is inactive.

   The command ‘C-x C-<SPC>’ (‘pop-global-mark’) jumps to the buffer and
position of the latest entry in the global ring.  It also rotates the
ring, so that successive uses of ‘C-x C-<SPC>’ take you to earlier
buffers and mark positions.



‘M-\’
     Delete spaces and tabs around point (‘delete-horizontal-space’).
     With a prefix argument, this only deletes
spaces and tab characters before point.

‘M-<SPC>’
     Delete spaces and tabs around point, leaving one space
     (‘just-one-space’).

‘M-^’
     Join two lines by deleting the intervening newline, along with any
     indentation following it (‘delete-indentation’).


   The command ‘delete-duplicate-lines’ searches the region for
identical lines, and removes all but one copy of each.  Normally it
keeps the first instance of each repeated line, but with a ‘C-u’ prefix
argument it keeps the last.  With a ‘C-u C-u’ prefix argument, it only
searches for adjacent identical lines.  This is a more efficient mode of
operation, useful when the lines have already been sorted.  With a ‘C-u
C-u C-u’ prefix argument, it retains repeated blank lines.

‘C-k’ with an argument of zero kills the text before point on the
current line.

‘C-x <DEL>’
     Kill back to beginning of sentence (‘backward-kill-sentence’).
     *Note Sentences::.
‘M-k’
     Kill to the end of the sentence (‘kill-sentence’).
‘C-M-k’
     Kill the following balanced expression (‘kill-sexp’).  *Note
     Expressions::.
‘M-z CHAR’
     Kill through the next occurrence of CHAR (‘zap-to-char’).

‘C-M-w’
     Cause the following command, if it is a kill command, to append to
     the previous kill (‘append-next-kill’).  *Note Appending Kills::.
As usual, the kill is appended
to the previous killed text if the command kills forward, and prepended
if the command kills backward.

   The actual contents of the kill ring are stored in a variable named
‘kill-ring’; you can view the entire contents of the kill ring with ‘C-h
v kill-ring’.

‘M-x view-register <RET> R’
     Display a description of what register R contains.

   All of the commands that prompt for a register will display a preview
window that lists the existing registers (if there are any) after a
short delay.  To change the length of the delay, customize
‘register-preview-delay’.  To prevent this display, set that option to
‘nil’.  You can explicitly request a preview window by pressing ‘C-h’ or
<F1>.

‘C-x r <SPC> R’
     Record the position of point and the current buffer in register R
     (‘point-to-register’).
‘C-x r j R’
     Jump to the position and buffer saved in register R
     (‘jump-to-register’).

‘C-x r s R’
     Copy region into register R (‘copy-to-register’).
‘C-x r i R’
     Insert text from register R (‘insert-register’).
‘M-x append-to-register <RET> R’
     Append region to text in register R.

     When register R contains text, you can use ‘C-x r +’
     (‘increment-register’) to append to that register.  Note that
     command ‘C-x r +’ behaves differently if R contains a number.
     *Note Number Registers::.

‘M-x prepend-to-register <RET> R’
     Prepend region to text in register R.

‘C-u C-x r s R’, the same command with a prefix
argument, copies the text into register R and deletes the text from the
buffer as well; you can think of this as moving the region text into the
register.

   When you are collecting text using ‘append-to-register’ and
‘prepend-to-register’, you may want to separate individual collected
pieces using a separator.  In that case, configure a
‘register-separator’ and store the separator text in to that register.
For example, to get double newlines as text separator during the
collection process, you can use the following setting.

     (setq register-separator ?+)
     (set-register register-separator "\n\n")

‘C-u NUMBER C-x r n R’
     Store NUMBER into register R (‘number-to-register’).
‘C-u NUMBER C-x r + R’
     If R contains a number, increment the number in that register by
     NUMBER.  Note that command ‘C-x r +’ (‘increment-register’) behaves
     differently if R contains text.  *Note Text Registers::.
‘C-x r i R’
     Insert the number from register R into the buffer.

   ‘C-x r i’ is the same command used to insert any other sort of
register contents into the buffer.  ‘C-x r +’ with no numeric argument
increments the register value by 1; ‘C-x r n’ with no numeric argument
stores zero in the register.

     (set-register ?z '(file . "/gd/gnu/emacs/19.0/src/ChangeLog"))

puts the file name shown in register ‘z’.

  ‘C-x C-k x R’ (‘kmacro-to-register’)
stores the last keyboard macro in register R.

‘C-x r m <RET>’
     Set the bookmark for the visited file, at point.

‘C-x r m BOOKMARK <RET>’
     Set the bookmark named BOOKMARK at point (‘bookmark-set’).

‘C-x r M BOOKMARK <RET>’
     Like ‘C-x r m’, but don’t overwrite an existing bookmark.

‘C-x r b BOOKMARK <RET>’
     Jump to the bookmark named BOOKMARK (‘bookmark-jump’).

‘C-x r l’
     List all bookmarks (‘list-bookmarks’).
Type
‘C-h m’ in the bookmark buffer for more information about its special
editing commands.

‘M-x bookmark-save’
     Save all the current bookmark values in the default bookmark file.



   The number of lines of overlap left by these scroll commands is
controlled by the variable ‘next-screen-context-lines’, whose default
value is 2.  You can supply the commands with a numeric prefix argument,
N, to scroll by N lines;

   Some users like scroll commands to keep point at the same screen
position, so that scrolling back to the same screen conveniently returns
point to its original position.  You can enable this behavior via the
variable ‘scroll-preserve-screen-position’.  If the value is ‘t’, Emacs
adjusts point to keep the cursor at the same screen position whenever a
scroll command moves it off-window, rather than moving it to the topmost
or bottommost line.  With any other non-‘nil’ value, Emacs adjusts point
this way even if the scroll command leaves point in the window.

   ‘C-M-l’ (‘reposition-window’) scrolls the current window
heuristically in a way designed to get useful information onto the
screen.  For example, in a Lisp file, this command tries to get the
entire current defun onto the screen if possible.

‘C-x <’
     Scroll text in current window to the left (‘scroll-left’).
‘C-x >’
     Scroll to the right (‘scroll-right’).

‘C-x n n’
     Narrow down to between point and mark (‘narrow-to-region’).
‘C-x n w’
     Widen to make the entire buffer accessible again (‘widen’).
‘C-x n p’
     Narrow down to the current page (‘narrow-to-page’).
‘C-x n d’
     Narrow down to the current defun (‘narrow-to-defun’).

   You can get information on what part of the buffer you are narrowed
down to using the ‘C-x =’ command.  *Note Position Info::.

   ‘M-x view-buffer’ prompts for an existing Emacs buffer, switches to
it, and enables View mode.  ‘M-x view-file’ prompts for a file and
visits it with View mode enabled.

To use Follow mode, go to a frame with just one window, split it into two side-by-side
windows using ‘C-x 3’, and then type ‘M-x follow-mode’.

   To see what faces are currently defined, and what they look like,
type ‘M-x list-faces-display’.  With a prefix argument, this prompts for
a regular expression, and displays only faces with names matching that
regular expression (*note Regexps::).

To view a list of color names, type ‘M-x
list-colors-display’.

To increase the height of the default face in the current buffer, type
‘C-x C-+’ or ‘C-x C-=’.  To decrease it, type ‘C-x C--’.  To restore the
default (global) face height, type ‘C-x C-0’.

The final key of these commands may be repeated without the leading
‘C-x’.  For instance, ‘C-x C-= C-= C-=’ increases the face height by
three steps.

To hide lines in the current buffer, type ‘C-x $’
(‘set-selective-display’) with a numeric argument N.  Then lines with at
least N columns of indentation disappear from the screen.

As a special exception, entering <RET> when the search string is
empty launches nonincremental search

   After exiting a search, you can search for the same string again by
typing just ‘C-s C-s’.

   If a search is failing and you ask to repeat it by typing another
‘C-s’, it starts again from the beginning of the buffer.  Repeating a
failing reverse search with ‘C-r’ starts again from the end.  This is
called “wrapping around”, and ‘Wrapped’ appears in the search prompt
once this has happened.  If you keep on going past the original starting
point of the search, it changes to ‘Overwrapped’, which means that you
are revisiting matches that you have already seen.

   To edit the current search string in the minibuffer without replacing
it with items from the search ring, type ‘M-e’ or click ‘mouse-1’ in the
minibuffer.  Type <RET>, ‘C-s’ or ‘C-r’ to finish editing the string and
search for it.  Type ‘C-f’ or ‘<RIGHT>’ to add to the search string
characters following point from the buffer from which you started the
search.

   ‘C-w’ (‘isearch-yank-word-or-char’) appends the next character or
word at point to the search string.

   Similarly, ‘M-s C-e’ (‘isearch-yank-line’) appends the rest of the
current line to the search string.

   ‘C-M-w’ (‘isearch-del-char’) deletes the last character from the
search string, and ‘C-M-y’ (‘isearch-yank-char’) appends the character
after point to the search string.

File: emacs.info,  Node: Special Isearch,  Next: Not Exiting Isearch,  Prev: Error in Isearch,  Up: Incremental Search

15.1.5 Special Input for Incremental Search
-------------------------------------------

In addition to characters described in the previous subsections, some of
the other characters you type during incremental search have special
effects.  They are described here.

   To toggle lax space matching (*note lax space matching: Lax Search.),
type ‘M-s <SPC>’.

   To toggle case sensitivity of the search, type ‘M-c’ or ‘M-s c’.
*Note case folding: Lax Search.  If the search string includes
upper-case letters, the search is case-sensitive by default.

   To toggle whether or not the search will consider similar and
equivalent characters as a match, type ‘M-s '’.  *Note character
folding: Lax Search.  If the search string includes accented characters,
that disables character folding during that search.

   To toggle whether or not invisible text is searched, type ‘M-s i’
(‘isearch-toggle-invisible’).  *Note Outline Search::.

   To toggle between non-regexp and regexp incremental search, type
‘M-r’ or ‘M-s r’ (‘isearch-toggle-regexp’).  *Note Regexp Search::.

   To toggle symbol mode, type ‘M-s _’.  *Note Symbol Search::.

   To search for a newline character, type ‘C-j’ as part of the search
string.

   To search for non-ASCII characters, use one of the following methods:

   • Type ‘C-q’, followed by a non-graphic character or a sequence of
     octal digits.  This adds a character to the search string, similar
     to inserting into a buffer using ‘C-q’ (*note Inserting Text::).
     For example, ‘C-q C-s’ during incremental search adds the
     ‘control-S’ character to the search string.

   • Type ‘C-x 8 <RET>’, followed by a Unicode name or code-point in
     hex.  This adds the specified character into the search string,
     similar to the usual ‘insert-char’ command (*note Inserting
     Text::).

   • Use an input method (*note Input Methods::).  If an input method is
     enabled in the current buffer when you start the search, the same
     method will be active in the minibuffer when you type the search
     string.  While typing the search string, you can toggle the input
     method with ‘C-\’ (‘isearch-toggle-input-method’).  You can also
     turn on a non-default input method with ‘C-^’
     (‘isearch-toggle-specified-input-method’), which prompts for the
     name of the input method.  When an input method is active during
     incremental search, the search prompt includes the input method
     mnemonic, like this:

          I-search [IM]:

     where IM is the mnemonic of the active input method.  Any input
     method you enable during incremental search remains enabled in the
     current buffer afterwards.

   Typing ‘M-s o’ in incremental search invokes ‘isearch-occur’, which
runs ‘occur’ with the current search string.  *Note occur: Other
Repeating Search.

   Typing ‘M-%’ in incremental search invokes ‘query-replace’ or
‘query-replace-regexp’ (depending on search mode) with the current
search string used as the string to replace.  A negative prefix argument
means to replace backward.  *Note Query Replace::.

   Typing ‘M-<TAB>’ in incremental search invokes ‘isearch-complete’,
which attempts to complete the search string using the search ring (the
previous search strings you used) as a list of completion alternatives.
*Note Completion::.  In many operating systems, the ‘M-<TAB>’ key
sequence is captured by the window manager; you then need to rebind
‘isearch-complete’ to another key sequence if you want to use it (*note
Rebinding::).

   You can exit the search while leaving the matches for the last search
string highlighted on display.  To this end, type ‘M-s h r’
(‘isearch-highlight-regexp’), which will run ‘highlight-regexp’ (*note
Highlight Interactively::) passing it the regexp derived from the last
search string and prompting you for the face to use for highlighting.
To remove the highlighting, type ‘M-s h u’ (‘unhighlight-regexp’).

   When incremental search is active, you can type ‘C-h C-h’
(‘isearch-help-map’) to access interactive help options, including a
list of special key bindings.  These key bindings are part of the keymap
‘isearch-mode-map’ (*note Keymaps::).


   Incidentally, if you are in the ‘*scratch*’ buffer and want the value
returned by an expression to appear in the ‘*scratch*’ buffer itself
rather than in the echo area, type ‘C-u C-x C-e’ instead of ‘C-x C-e’.
This causes the value returned to appear after the expression.  The
buffer will look like this:

     (buffer-name)"*scratch*"



part4

