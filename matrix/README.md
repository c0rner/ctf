# MATRIX
```
Welcome to the M A T R I X
Can you make it out alive?
.....snip.....snip.....snip.....snip.....
Congratulations, you made it!
Have a flag!
picoCTF{y0uv3_3sc4p3d_th3_m4ze...f0r_n0w-***REDACTED***}
```

## Introduction
___!!! CAUTION, This repository contains tooling I built while solving the MATRIX challenge.  If you wish to solve this entirely on your own STOP reading now !!!___

This is __not__ a writeup.  You will not find the flag here, however the contents will nudge you in the right direction.
Personally I found this challenge fun and I recommend you give it a try without any hints.

- Competition: picoMini by redpwn (2021)
- Challenge: [MATRIX](https://play.picoctf.org/practice/challenge/221)
- Author: Asphyxia
- Points: 500

## Hints
Below you will find hints that will help you solve this should you be stuck.

<details><summary>Hint 1</summary>
  
## How do I move?
Directions are given using u (up), d (down), l (left), and r (right).

</details>
<details><summary>Hint 2</summary>
  
## MATRIX cpu
MATRIX challenge exists in a virtual 16bit cpu with a limited instruction set.  It has a stack and separate FIFO memory storage. 

</details>
<details><summary>Hint 3</summary>
  
## MATRIX cpu implementation
This repo contains an implementation of MATRIX cpu in Rust.  The implementation can do disassembly and single step bytecode.
</details>
<details><summary>Hint 4</summary>
  
## MATRIX bytecode disassembly
Disassembled and annotated bytecode is available [here](extra/bytecode.asm)

</details>
<details><summary>Hint 5</summary>
  
## How does it work?
Key to solving the challenge requires you to understand how the variables `a`, `b` and `c`, as seen in bytecode disassembly, interact with and modify code flow.

</details>
<details><summary>Hint 6</summary>
  
## A working path.. almost
The [path](extra/path.txt) I used to solve the challenge with one minor modification.
</details>