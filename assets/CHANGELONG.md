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
#### FILENAME
- File for the alterations currently mentioned.
##### section
- Each bit of code is within a labeled section of code in each file. Put
the section which your code belongs to. If there is no section in the file
you worked with (it is not an assembly file,) then simply type "main."
Here is a mark-down template for your pull-request:

```markdown
### pull-request
- **Github-username**
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
While we do not need the ability to use any commands, we need to be able to
pass them in our arrays and parse them into components. Basic system protocols
for activating the REPL, and compiling to an output file via command-line args.

### lya_core
- **emmettgb**
This PR draws the planned type system out  in front of us on paper, so it
gives a clear idea of what we need to write when it comes to bits and bytes. The
syntax also demonstrates well the possibilities of this paradigm, being defined
 from abstract collections of things, and reading into a high-performance
 programming language.
#### core/leya.lya
##### Type System
- Created the type system section, added char and array types.
- **Not Functional**
Created the very abstract type system, the point of all of this PR is
to get a skeleton of code that we want to execute and define everything correct
this is essential for testing.
##### Essentials
- Added return()
- **Not Functional**
Added return, does not really do anything.
#### core/leya.lya
##### Types
- Added some template function calls.
- **Not Functional**
##### Base Types
- Added print function.
- Added Int64
- **Not Functional**
Print function uses syscall with position of val's alias in memory.
##### Operators
- Added some template function calls.
- **Not Functional**

### skeleton
- **emmettgb**
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
