# How To Contribute
Thank you for your contributions to the Leya project. There are several easy
ways in which you may contribute to this project:
- Install Leya
- Learn Leya
- Share Leya
- Report issues
- Help write Leya
- Write Leya's ecosystem
Now we will go into the guidelines and details for each of these methods:
## Install Leya
You can install Leya by downloading the pre-compiled binaries, or by
building from source yourself. In Leya's current state, there are no
binaries available, so you will have to assemble Leya yourself. This
process is automated, you simply need to source devtools/compile_load.sh
## Learn Leya
Leya has high-level syntax with low, level imperative interfaces. What is
cool about this methodology is that it can provide a very iterative
programming experience with some very high-level syntax. I am writing
this markdown before the compiler has been built, but the syntax
should ultimately come out to look like this, for example.
```julia
function hello_world
  print "Hello!"
end

type normal
  mean float
  std float
end
# comment
function mean x array
  define int summation sum x
  define int len length x
  return / summation len
end
```
This language is in a lot of ways, Julia-based. The idea is to do some
of the things the Julia language has accomplished off a much more Lisp-like framework. JIT compilation and multiple dispatch will be combined
with array (list) syntax, where everything is data. In the future, you
will be able to refer to the Leya documentation for more information.
However, for now, this is the best we are going to have.
## Share Leya
Share the language with your friends! Speak out about the cool things you
like about the language, and have fun!
## Report issues
Reporting bugs can help us speed up development, given that they do not
find themselves. You may report issues in the "issues" section here on
Github.
## Help write Leya
Know x64 Assembly? Want to try your hand at a cool project? Help write this programming language! This is certainly a cool project, as the
Leya programming language seeks out to do a lot of new things, as well
as combine old things! Additionally, if you do not work in Assembly,
most of Leya is composed of itself, so you can get to work helping along
with the base of the language.
## Write Leya's ecosystem
With a language comes a strong need for an ecosystem. It would be very
helpful to work on the ecosystem that surrounds the language. Leya is
a general-purpose high-level programming languages, so packages built
for it may as well do essentially anything!
