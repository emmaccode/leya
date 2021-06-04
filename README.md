<div align = "center">
  <img src = "https://github.com/emmettgb/leya/blob/repl-command/assets/Leya_Round.png"
  width = 500 height = 500>
  </img>
</div>

#  leya
The Leya programming language is a high-level imperative functional
programming language. Leya works by being built off a base of syscalls and
basic functionality that resides within elements of different arrays. Everything
in Leya consists of arrays atop arrays. Each array is a command followed by
parameters.
## Future Plans
You make look at the localized
[TODO.MD](https://github.com/emmettgb/leya/blob/repl-command/assets/CONTRIBUTING.md)
 list and
[CHANGELOG.MD](https://github.com/emmettgb/leya/blob/repl-command/assets/CHANGELOG.md) in order to get a
better idea of the direction of the language, and what we are working on at this
time. However, here is a list of the things that are exciting and planned for
this language:
- Command parsing (Objective #1)
- Store the currently defined lya in memory. The memory of course also needs to
accessible, and hold the number of bytes for each defined alias.
- JIT Compilation. Compile future data while executing old data.
- Multiple Dispatch. Function lookups are defined with the types of their
arguments.
- Syscalls. This language can act as an interface to standard kernel calls.
This will be the backbone to structuring the language in itself. For example,
consider the base defining the following print function:
```julia
function print x string
  define int n len x
  syscall 1 1 x n
end
```
The leya compiler handles the memory for us, that is the primary objective of
the language itself. The language stores definitions in aliased portions of
stack. Here we pass those syscalls in order to call the future _scall: code:
```assembly
_scall:
mov rax, arg1
mov rdi, arg2
mov rsi, arg3
mov rdx, arg4
syscall
```
Of course, there is also support for basic operations.
## Contributing
There are so many different ways that you can help better the Leya language.
All of the following could help:
- Learn Leya
- Share Leya
- Report bugs/issues
- Commit code! \
You may read more on contributing to the Leya language in
[CONTRIBUTING.MD](https://github.com/emmettgb/leya/blob/repl-command/assets/CONTRIBUTING.md)
## 0.0.1
