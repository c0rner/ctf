//! picoMini by redpwn 2021 - MATRIX 500 points
//! -------------------------------------------
//! MATRIX cpu implementation
//! https://github.com/c0rner
//!
//! Challenge author: Asphyxia
//! Category: Reverse engineering

use std::env;
use std::vec;

/// Instruction set of MATRIX cpu
enum Inst {
    Nop = 0x00,
    Break,
    Copy = 0x10,
    Pop,
    Add,
    Sub,
    Swap,
    Store = 0x20,
    Fetch,
    Jump = 0x30,
    Jumpz = 0x31,
    Jumpnz,
    Jumplt0,
    Jumplt1,
    Pushb = 0x80,
    Pushw,
    In = 0xc0,
    Out,
}

impl From<u8> for Inst {
    fn from(val: u8) -> Self {
        match val {
            0x00 => Inst::Nop,
            0x01 => Inst::Break,
            0x10 => Inst::Copy,
            0x11 => Inst::Pop,
            0x12 => Inst::Add,
            0x13 => Inst::Sub,
            0x14 => Inst::Swap,
            0x20 => Inst::Store,
            0x21 => Inst::Fetch,
            0x30 => Inst::Jump,
            0x31 => Inst::Jumpz,
            0x32 => Inst::Jumpnz,
            0x33 => Inst::Jumplt0,
            0x34 => Inst::Jumplt1,
            0x80 => Inst::Pushb,
            0x81 => Inst::Pushw,
            0xc0 => Inst::In,
            0xc1 => Inst::Out,
            _ => unimplemented!("instruction: 0x{:x}", val as u8),
        }
    }
}

/// MATRIX cpu
struct Cpu {
    code: Vec<u8>,
    pc: u16,
    stack: Vec<i16>,
    mem: Vec<i16>,
    input: Vec<u8>,
}

impl Cpu {
    pub fn new(code: Vec<u8>) -> Cpu {
        let stack = Vec::new();
        let mem = Vec::new();
        Cpu {
            pc: 0,
            code,
            stack,
            mem,
            input: Vec::new(),
        }
    }

    /// Reset cpu with new input sequence
    pub fn reset(&mut self, data: Vec<u8>) {
        self.pc = 0;
        self.stack.clear();
        self.mem.clear();
        self.input = data;
    }

    /// Run cpu cycle
    pub fn tick(&mut self, result: &mut i16) -> bool {
        let mut pc = self.pc as usize;
        let mut status: bool = true;

        let inst = self.code[pc];
        pc += 1;
        match Inst::from(inst) {
            Inst::Nop => (),
            Inst::Break => {
                *result = self.stack.pop().unwrap();
                status = false;
                // println!("break");
            }
            Inst::Copy => {
                let val = self.stack.pop().unwrap();
                self.stack.push(val);
                self.stack.push(val);
                // println!("copy (0x{:02x})", val);
            }
            Inst::Pop => {
                let _ = self.stack.pop();
                // println!("pop");
            }
            Inst::Add => {
                let rhs = self.stack.pop().unwrap();
                let lhs = self.stack.pop().unwrap();
                self.stack.push(lhs.wrapping_add(rhs));
                // println!("add 0x{:02x}, 0x{:02x}", lhs, rhs);
            }
            Inst::Sub => {
                let rhs = self.stack.pop().unwrap();
                let lhs = self.stack.pop().unwrap();
                self.stack.push(lhs.wrapping_sub(rhs));
                // println!("sub 0x{:02x}, 0x{:02x}", lhs, rhs);
            }
            Inst::Swap => {
                let val1 = self.stack.pop().unwrap();
                let val2 = self.stack.pop().unwrap();
                self.stack.push(val1);
                self.stack.push(val2);
                // println!("swap 0x{:02x}, 0x{:02x}", &val1, &val2);
            }
            Inst::Store => {
                let val = self.stack.pop().unwrap();
                self.mem.push(val);
                // println!("store (0x{:02x})", val);
            }
            Inst::Fetch => {
                let val = self.mem.pop().unwrap();
                self.stack.push(val);
                // println!("fetch (0x{:02x})", val);
            }
            Inst::Jump => {
                let offset = self.stack.pop().unwrap();
                // println!("jump 0x{:04x}", offset);
                pc = offset as usize;
            }
            Inst::Jumpz => {
                let offset = self.stack.pop().unwrap();
                let val = self.stack.pop().unwrap();
                // println!("jumpz 0x{:04x} (0x{:02x})", offset, val);
                if val == 0 {
                    pc = offset as usize;
                }
            }
            Inst::Jumpnz => {
                let offset = self.stack.pop().unwrap();
                let val = self.stack.pop().unwrap();
                //println!("jumpnz 0x{:04x} (0x{:02x})", offset, val);
                if val != 0 {
                    pc = offset as usize;
                }
            }
            Inst::Jumplt0 => {
                let offset = self.stack.pop().unwrap();
                let val = self.stack.pop().unwrap();
                //println!("jumplt0 0x{:04x} (0x{:02x})", offset, val);
                if val < 0 {
                    pc = offset as usize;
                }
            }
            Inst::Jumplt1 => {
                let offset = self.stack.pop().unwrap();
                let val = self.stack.pop().unwrap();
                //println!("jumplt1 0x{:04x} (0x{:02x})", offset, val);
                if val < 1 {
                    pc = offset as usize;
                }
            }
            Inst::Pushb => {
                let oper = self.code[pc] as u8;
                self.stack.push(oper as i16);
                // println!("push 0x{:02x}", oper);
                pc += 1;
            }
            Inst::Pushw => {
                let oper = i16::from_le_bytes(self.code[pc..pc + 2].try_into().unwrap());
                self.stack.push(oper);
                // println!("push 0x{:04x}", oper);
                pc += 2;
            }
            Inst::In => {
                let c = match self.input.pop() {
                    Some(c) => c,
                    None => 0,
                };
                self.stack.push(c as i16);
                // println!("in ({})", c as char);
            }
            Inst::Out => {
                let val = self.stack.pop().unwrap();
                print!("{}", (val as u8) as char)
            }
        };
        self.pc = pc as u16;
        status
    }

    pub fn disasm(&mut self, pc: usize, num: usize) -> Option<usize> {
        let mut pc = pc;
        let mut num = num;

        while num > 0 && pc < self.code.len() {
            num -= 1;
            print!("{:04x}  ", pc);
            let inst = self.code[pc];
            pc += 1;
            match Inst::from(inst) {
                Inst::Nop => println!("nop"),
                Inst::Break => println!("break"),
                Inst::Copy => println!("copy"),
                Inst::Pop => println!("pop"),
                Inst::Add => println!("add"),
                Inst::Sub => println!("sub"),
                Inst::Swap => println!("swap"),
                Inst::Store => println!("store"),
                Inst::Fetch => println!("fetch"),
                Inst::Jump => println!("jump"),
                Inst::Jumpz => println!("jumpz"),
                Inst::Jumpnz => println!("jumpnz"),
                Inst::Jumplt0 => println!("jumplt0"),
                Inst::Jumplt1 => println!("jumplt1"),
                Inst::Pushb => {
                    let oper = self.code[pc] as u8;
                    println!("push 0x{:02x} ({})", oper, oper as char);
                    pc += 1;
                }
                Inst::Pushw => {
                    let oper = u16::from_le_bytes(self.code[pc..pc + 2].try_into().unwrap());
                    println!("push 0x{:04x}", oper);
                    pc += 2;
                }
                Inst::In => println!("in"),
                Inst::Out => println!("out"),
            };
        }
        Some(pc)
    }
}

fn main() {
    let args: Vec<String> = env::args().collect();

    if args.len() < 2 {
        println!("Directions needed..  u,d,l,r");
        return;
    }
    let input: String = args[1].chars().rev().collect();
    let path: Vec<u8> = Vec::from(input);

    let bytecode: Vec<u8> = include!("bytecode.txt");
    let mut cpu = Cpu::new(bytecode);
    let mut result: i16 = 0;
    cpu.reset(path);
    cpu.pc = 0x75; // Skip welcome message
    loop {
        // "breakpoint"
        if cpu.pc == 0xf7 {
            print!(
                "\nPC: {:04x}\tStack: {:?}\nMemory: {:?}\nOpcode: ",
                cpu.pc, cpu.stack, cpu.mem,
            );
            cpu.disasm(cpu.pc as usize, 1);
        }
        if !cpu.tick(&mut result) {
            break;
        }
    }

    if result == 0 {
        println!("Winner winner chicken dinner!");
    }
}
