# Changelog
This changelog details every change made to the Leya compiler. If you are
contributing, make sure to take notes of the following guidelines for
filling out this changelog. If you have not already, also read CONTRIBUTING.md.
## Status Key-words
- **Not Implemented**
Not implemented means that this portion of code is outlined for use,
but has not been written in yet.
- **Incomplete**
This portion of code does some of the things described, but not all of
the things described.
- **Not Functional**
This portion of code needs work, as something is wrong with it.
- **Complete**
This function, in its current state is able usable.
- **Not Updated Functional**
Labeled for an update that has yet to occur. Still works.
- **Not Updated Not Functional**
Labeled for an update that has yet to occur. Broken.
- **Bugged?**
This portion of code is thought to be bugged.
- **Bugged**
This portion of code is definitely bugged.
## Pull-requests:
Unless you are a maintainer, your pull-requests should always be to the
latest branch of Leya in terms of versions. For example, the latest version
of Leya is 0.0.1, your changes should be pull requested to the 0.0.1 branch.
When it comes to this changelog, write your changes under a commit name.
The commit name should be a level 3 heading. It should be within the version's
section, which is a level 2 heading. It should also have a short description
of the pull-request
 After that, code is separated into a
heirarchy with Leya. \
Consider our _start_repl call. This call is contained
inside of the leya.asm file. Our next heading below our pull-request should
be a level 4 heading,
## VERSION
You will not need to touch this heading, unless you are a maintainer.
### PULL REQUEST HEADING
- Commit description, what functionality or feature does this commit add?
Add your Github username. below this commit heading as a bullet point.
Beneath that, we will add your commit number in our next changelog update.
#### FILENAME
- File for the alterations currently mentioned.
##### section
- Each bit of code is within a labeled section of code in each file. Put
the section which your code belongs to. If there is no section in the file
you worked with (it is not an assembly file,) then simply type "main."
Here is a mark-down template for your pull-request:
```
### pull-request
- **Github-username** \
- #prnum (you likely will not need to add this.) \
pull-request description.
#### modified-file
##### modified-section
- modification
- **status key-word**
Description of function intention, include blockers, issues, etc.
##### next-section
- modification
- **status key-word**
Description of function intention, include blockers, issues, etc.
```
# Changes
Here is a list of all the changes that have been made to Leya. One
exception to note is that you do not need to put modifications to the
changelog inside of the changelog. Write the full path from repository
head for a file if it **is not**
## 0.0.1
0.0.1 should show the basics of the compiler. By this point, a basic
interpreter for array-types should be made with some basic functionality.
While we do not need the ability to use any commands, we need to be able to pass them in our arrays and parse them into components. Basic system protocols for activating the REPL, and compiling to an output file via command-line args.
### replcommand
- **emmettgb**
- #2 \
This commit creates a more formulated skeleton for interpretation,
and completes the repl logic presented from #1, skeleton. It also adds
a base (though 64-bytes for now) for putting code into memory.

#### leya.asm
##### DATA
- Added definitions for key-words:
function, define, type, raise, syscall, exit, end, and " "
- Added argument allocation.
- Added reserve section, .bss.
- .bss section holds lya allocation
##### START
- updated start subroutine call to a jump.
In the future, this will be a je depending on command-line arguments.
**Not Updated Functional** \
##### REPL
- _repl now performs an exit check from an exit value set in memory.
If this value is ever stored as 1, the process will end. It calls
_prompt, and then _repl_input for the read step. Then it calls interpret
after moving the input data into RSI. After which it then calls _return.
**Complete**
##### INTERPRETER
- Added _next_byte, _parse, _return, and _compile functions. This is
mostly just skeleton.
**Complete**
#### CONTRIBUTING.MD
- Finsished writing all sections, at least to some extent until
the project has more wind behind it. **Complete**
#### TODO.MD
- Added TODO.md. This file's purpose will be to outline what
needs to be done next in the project. Hope that was obvious.
#### README.MD
- Updated README, with assets/Leya_Round.png and new description.
----
### skeleton
- **emmettgb**
- #1 \
This commit creates a basic skeleton for the entire repository. This
includes the core, assets such as this changelog, and changes to the
development tools included with the core.
#### leya.asm
##### DATA
- Added .data section
- Added memory reserving for REPL printout (Leya)
- Added memory reserving for REPL prompt (Leya >)
- Added .text section
##### START
- Added _start
**Not Updated Functional** \
 main function, checks if argument provided.
 If no argument is provided, jumps to _start_repl.
 passable args:
v======+======+======+===================================================v
| arg1 | arg2 | arg3 |    does:                                          |
+======+======+======+===================================================+
| -v   |      |      | Prints out version information.                   |
+------+------+------+---------------------------------------------------+
| -o   | uri1 | uri2 | Compiles file-input. arg2 is the file we want     |
|      |      |      | to compile, arg2 is the output filename.          |
L------+------+------+--------------------------------------------------w
##### REPL
- Added _start_repl
**Not Updated Functional**
 Allocates data for REPL, calls _repl_printout:, followed by _repl. On ret
 from repl, will ret to _start. Start will then call syscall 60 (exit).
- Added _repl_printout
**Complete**
; Prints leya header, returns to _start_repl:.
- Added _repl
**Not Updated Functional**
 Prints prompt by calling _show_prompt:
 takes input, calls _parse:, on ret, checks for change in
 exit flag. If the exit flag has not been changed, then jumps to itself.
- Added _prompt
**Complete**
##### INTERPRETER
Prints prompt, returns to _repl
- Added _parse
**Not Implemented**
Parses array of input code, fills registry and data, then returns to
either _REPL or _RUN
#### devtools/compile_load.sh
##### main
- Added compile_load.sh
This is a basic Bash script that will automatically compile, link,
and then run leya.
**Complete**
#### assets/Leya_Round.png
##### main
- Added Leya logo
**Complete**
#### assets/CONTRBUTING.md
##### main
- Added contributing.md
- Need to write contributing guidelines.
##### How to contribute
- Added ways to contribute
**Not Updated Functional**
