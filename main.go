package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"strings"
	"unicode"
)

// TODO: remove it from this file
// ** Very basic stack implementation **
type Stack []int

func (s *Stack) Append(op int) {
	*s = append(*s, op)
}

func (s *Stack) Pop() int {
	l := len(*s)
	if l <= 0 {
		panic("[ERROR] stack underflow")
	}
	value := (*s)[l-1]
	*s = (*s)[:l-1]
	return value
}

var DEBUG = false

func assert(cond bool, msg string) {
	if !cond {
		panic(msg)
	}
}

// class OpType(Enum):
const (
	_        = iota
	PUSH_INT = iota
	PUSH_STR = iota
	PLUS     = iota
	MINUS    = iota
	MOD      = iota
	EQ       = iota
	GT       = iota
	LT       = iota
	GE       = iota
	LE       = iota
	NE       = iota
	SHR      = iota
	SHL      = iota
	BOR      = iota
	BAND     = iota
	PRINT    = iota
	IF       = iota
	END      = iota
	ELSE     = iota
	DUP      = iota
	DUP2     = iota
	SWAP     = iota
	DROP     = iota
	OVER     = iota
	WHILE    = iota
	DO       = iota
	MEM      = iota
	//  TODO: implement typing for load/store operations
	LOAD         = iota
	STORE        = iota
	SYSCALL0     = iota
	SYSCALL1     = iota
	SYSCALL2     = iota
	SYSCALL3     = iota
	SYSCALL4     = iota
	SYSCALL5     = iota
	SYSCALL6     = iota
	OPTYPE_COUNT = iota
)

type Loc struct {
	path   string
	line   int
	column int
}

type Op struct {
	typ   int
	loc   Loc
	value interface{}
	jmp   int
}

type Program = []Op

// class TokenType(Enum):
const (
	_                = iota
	WORD             = iota
	INT              = iota
	STR              = iota
	TOKEN_TYPE_COUNT = iota
)

type Token struct {
	typ   int
	loc   Loc
	value interface{}
}

const (
	STR_CAPACITY = 640000
	MEM_CAPACITY = 640000
)

func simulate_little_endian_linux(program Program) {
	stack := Stack{}

	assert(OPTYPE_COUNT == 37, "Exhaustive op handling in simulate_little_endian_linux")

	mem := make([]byte, STR_CAPACITY+MEM_CAPACITY)

	str_offsets := make(map[int]*int)
	str_size := 0

	ip := 0
	l := len(program)
	for ip < l {
		op := program[ip]
		switch op.typ {
		case PUSH_INT:
			assert(op.value != nil, "This could be a bug in the compilation step")
			stack.Append(op.value.(int))
			ip += 1

		case PUSH_STR:
			assert(op.value != nil, "This could be a bug in the compilation step")
			bs := op.value.(string)
			n := len(bs)
			stack.Append(n)
			if str_offsets[ip] == nil {
				index := str_size
				str_offsets[ip] = &index
				for i, ch := range bs {
					mem[i+str_size] = byte(ch)
				}
				str_size += n
				assert(str_size <= STR_CAPACITY, "String buffer overflow")
			}
			stack.Append(*str_offsets[ip])
			ip += 1

		case PLUS:
			a := stack.Pop()
			b := stack.Pop()
			stack.Append(a + b)
			ip += 1

		case MINUS:
			a := stack.Pop()
			b := stack.Pop()
			stack.Append(b - a)
			ip += 1

		case MOD:
			a := stack.Pop()
			b := stack.Pop()
			stack.Append(b % a)
			ip += 1

		case EQ:
			a := stack.Pop()
			b := stack.Pop()
			if a == b {
				stack.Append(1)
			} else {
				stack.Append(0)
			}
			ip += 1

		case GT:
			a := stack.Pop()
			b := stack.Pop()
			if b > a {
				stack.Append(1)
			} else {
				stack.Append(0)
			}
			ip += 1

		case LT:
			a := stack.Pop()
			b := stack.Pop()
			if b < a {
				stack.Append(1)
			} else {
				stack.Append(0)
			}
			ip += 1

		case GE:
			a := stack.Pop()
			b := stack.Pop()
			if b >= a {
				stack.Append(1)
			} else {
				stack.Append(0)
			}
			ip += 1

		case LE:
			a := stack.Pop()
			b := stack.Pop()
			if b <= a {
				stack.Append(1)
			} else {
				stack.Append(0)
			}
			ip += 1

		case NE:
			a := stack.Pop()
			b := stack.Pop()
			if b != a {
				stack.Append(1)
			} else {
				stack.Append(0)
			}
			ip += 1

		case SHR:
			a := stack.Pop()
			b := stack.Pop()
			stack.Append(int(b >> a))
			ip += 1

		case SHL:
			a := stack.Pop()
			b := stack.Pop()
			stack.Append(int(b << a))
			ip += 1

		case BOR:
			a := stack.Pop()
			b := stack.Pop()
			stack.Append(int(a | b))
			ip += 1

		case BAND:
			a := stack.Pop()
			b := stack.Pop()
			stack.Append(int(a & b))
			ip += 1

		case IF:
			a := stack.Pop()
			if a == 0 {
				assert(op.jmp != 0, "This could be a bug in the compilation step")
				ip = op.jmp
			} else {
				ip += 1
			}

		case ELSE:
			assert(op.jmp != 0, "This could be a bug in the compilation step")
			ip = op.jmp

		case END:
			assert(op.jmp != 0, "This could be a bug in the compilation step")
			ip = op.jmp

		case PRINT:
			a := stack.Pop()
			fmt.Printf("%d\n", a)
			ip += 1

		case DUP:
			a := stack.Pop()
			stack.Append(a)
			stack.Append(a)
			ip += 1

		case DUP2:
			b := stack.Pop()
			a := stack.Pop()
			stack.Append(a)
			stack.Append(b)
			stack.Append(a)
			stack.Append(b)
			ip += 1

		case SWAP:
			a := stack.Pop()
			b := stack.Pop()
			stack.Append(a)
			stack.Append(b)
			ip += 1

		case DROP:
			stack.Pop()
			ip += 1

		case OVER:
			a := stack.Pop()
			b := stack.Pop()
			stack.Append(b)
			stack.Append(a)
			stack.Append(b)
			ip += 1

		case WHILE:
			ip += 1

		case DO:
			a := stack.Pop()
			if a == 0 {
				assert(op.jmp != 0, "This could be a bug in the compilation step")
				ip = op.jmp
			} else {
				ip += 1
			}

		case MEM:
			stack.Append(STR_CAPACITY)
			ip += 1

		case LOAD:
			addr := stack.Pop()
			byt := mem[addr]
			stack.Append(int(byt))
			ip += 1

		case STORE:
			value := stack.Pop()
			addr := stack.Pop()
			mem[addr] = byte(value & 0xFF)
			ip += 1

		case SYSCALL0:
			syscall_number := stack.Pop()
			if syscall_number == 39 {
				stack.Append(os.Getpid())
			} else {
				assert(false, fmt.Sprintf("unknown syscall number %d", syscall_number))
			}
			ip += 1

		case SYSCALL1:
			panic("not implemented")

		case SYSCALL2:
			panic("not implemented")

		case SYSCALL3:
			syscall_number := stack.Pop()
			arg1 := stack.Pop()
			arg2 := stack.Pop()
			arg3 := stack.Pop()
			if syscall_number == 1 {
				fd := arg1
				buf := arg2
				count := arg3
				// s = mem[buf:buf+count].decode('utf-8')
				s := string(mem[buf : buf+count])
				if fd == 1 {
					str, err := strconv.Unquote(`"` + s + `"`)
					if err != nil {
						// panic(fmt.Sprintf("cannot decode escaped characters in string %s", s))
						fmt.Print(s)
					} else {
						fmt.Print(str)
					}
				} else if fd == 2 {
					fmt.Fprintf(os.Stderr, "%s", s)
				} else {
					assert(false, fmt.Sprintf("unknown file descriptor %d", fd))
				}
				stack.Append(count)
			} else {
				assert(false, fmt.Sprintf("unknown syscall number %d", syscall_number))
			}
			ip += 1

		case SYSCALL4:
			panic("not implemented")

		case SYSCALL5:
			panic("not implemented")

		case SYSCALL6:
			panic("not implemented")

		default:
			panic("unreachable")
		}
	}
}

var BUILTIN_WORDS = map[string]int{
	"+":        PLUS,
	"-":        MINUS,
	"mod":      MOD,
	"print":    PRINT,
	"=":        EQ,
	">":        GT,
	"<":        LT,
	">=":       GE,
	"<=":       LE,
	"!=":       NE,
	"shr":      SHR,
	"shl":      SHL,
	"bor":      BOR,
	"band":     BAND,
	"if":       IF,
	"end":      END,
	"else":     ELSE,
	"dup":      DUP,
	"2dup":     DUP2,
	"swap":     SWAP,
	"drop":     DROP,
	"over":     OVER,
	"while":    WHILE,
	"do":       DO,
	"mem":      MEM,
	".":        STORE,
	",":        LOAD,
	"syscall0": SYSCALL0,
	"syscall1": SYSCALL1,
	"syscall2": SYSCALL2,
	"syscall3": SYSCALL3,
	"syscall4": SYSCALL4,
	"syscall5": SYSCALL5,
	"syscall6": SYSCALL6,
}

func compile_token_to_op(token Token) Op {
	assert(TOKEN_TYPE_COUNT == 4, "Exhaustive token handling in compile_token_to_op")
	switch token.typ {
	case WORD:
		typ := BUILTIN_WORDS[token.value.(string)]
		if typ != 0 {
			return Op{
				typ:   typ,
				loc:   token.loc,
				value: nil,
				jmp:   0,
			}
		}

	case INT:
		return Op{
			typ:   PUSH_INT,
			loc:   token.loc,
			value: token.value,
			jmp:   0,
		}

	case STR:
		return Op{
			typ:   PUSH_STR,
			loc:   token.loc,
			value: token.value,
			jmp:   0,
		}

	}
	panic("unreachable")
}

func compile_tokens_to_program(tokens []Token) Program {
	stack := Stack{}

	program := Program{}
	for _, token := range tokens {
		program = append(program, compile_token_to_op(token))
	}

	assert(OPTYPE_COUNT == 37, "Exhaustive ops handling in compile_tokens_to_program. Keep in mind that not all of the ops need to be handled in here. Only those that form blocks.")
	for ip, op := range program {
		switch op.typ {
		case IF:
			stack.Append(ip)

		case ELSE:
			if_ip := stack.Pop()
			if program[if_ip].typ != IF {
				loc := program[if_ip].loc
				fmt.Printf(
					"%s:%d:%d: ERROR: `else` can only be used in `if`-blocks",
					loc.path, loc.line, loc.column)
				os.Exit(1)
			}
			program[if_ip].jmp = ip + 1
			stack.Append(ip)

		case END:
			block_ip := stack.Pop()
			if program[block_ip].typ == IF || program[block_ip].typ == ELSE {
				program[block_ip].jmp = ip
				program[ip].jmp = ip + 1
			} else if program[block_ip].typ == DO {
				assert(program[block_ip].jmp != 0, "")
				program[ip].jmp = program[block_ip].jmp
				program[block_ip].jmp = ip + 1
			} else {
				loc := program[block_ip].loc
				fmt.Printf(
					"%s:%d:%d: ERROR: `end` can only close `if`, `else` or `do` blocks for now",
					loc.path, loc.line, loc.column)
				os.Exit(1)
			}

		case WHILE:
			stack.Append(ip)

		case DO:
			while_ip := stack.Pop()
			program[ip].jmp = while_ip
			stack.Append(ip)

			// 		default:
			// 			panic("unreachable")
		}
	}

	if len(stack) > 0 {
		loc := program[stack.Pop()].loc
		fmt.Printf(
			"%s:%d:%d: ERROR: unclosed block",
			loc.path, loc.line, loc.column)
		os.Exit(1)
	}

	return program
}

func find_col(line string, start int, predicate func(r rune) bool) int {
	for start < len(line) && !predicate(rune(line[start])) {
		start += 1
	}
	return start
}

type LineToken struct {
	col       int
	tokenType int
	token     interface{}
}

func lex_line(line string) <-chan LineToken {
	ch := make(chan LineToken)
	go func(line string) {
		defer close(ch)

		notSpace := func(r rune) bool { return !unicode.IsSpace(r) }

		col := find_col(line, 0, notSpace)
		for col < len(line) {
			if line[col] == '"' {
				col_end := find_col(line, col+1, func(r rune) bool { return r == '"' })
				assert(line[col_end] == '"', "")
				text_of_token := line[col+1 : col_end]
				ch <- LineToken{
					col:       col,
					tokenType: STR,
					token:     text_of_token,
				}
				col = find_col(line, col_end+1, notSpace)
			} else {
				col_end := find_col(line, col, unicode.IsSpace)
				text_of_token := line[col:col_end]

				i, err := strconv.Atoi(text_of_token)
				if err != nil {
					ch <- LineToken{
						col:       col,
						tokenType: WORD,
						token:     text_of_token,
					}
				} else {
					ch <- LineToken{
						col:       col,
						tokenType: INT,
						token:     i,
					}
				}
				col = find_col(line, col_end, notSpace)
			}
		}
	}(line)
	return ch
}

func lex_file(file_path string) []Token {
	file, err := os.Open(file_path)
	assert(err == nil, "could not open file")

	scanner := bufio.NewScanner(file)
	scanner.Split(bufio.ScanLines)

	row := 1

	tokens := []Token{}

	for scanner.Scan() {
		line := strings.Split(scanner.Text(), "//")
		for lt := range lex_line(line[0]) {
			tokens = append(tokens, Token{
				typ: lt.tokenType,
				loc: Loc{
					path:   file_path,
					line:   row,
					column: lt.col,
				},
				value: lt.token,
			})
		}
		row += 1
	}

	return tokens
}

func compile_file_to_program(file_path string) Program {
	return compile_tokens_to_program(lex_file(file_path))
}

// func cmd_call_echoed(args []string) {
// 	// TODO: has go somethings like shlex.quote?
// 	fmt.Printf("[CMD] %s", strings.Join(args, " "))
// 	cmd := exec.Command(args[0], args[1:]...)
// 	if err := cmd.Run(); err != nil {
// 		panic(err)
// 	}
// }

func usage(compiler_name string) {
	fmt.Printf("Usage: %s [OPTIONS] <SUBCOMMAND> [ARGS]\n", compiler_name)
	fmt.Println("  OPTIONS:")
	fmt.Println("    -debug                Enable debug mode.")
	fmt.Println("  SUBCOMMAND:")
	fmt.Println("    sim <file>            Simulate the program")
	fmt.Println("    com [OPTIONS] <file>  Compile the program")
	fmt.Println("      OPTIONS:")
	fmt.Println("        -r                  Run the program after successful compilation")
	fmt.Println("        -o <file|dir>       Customize the output path")
	fmt.Println("    help                  Print this help to stdout and exit with 0 code")
}

func main() {
	assert(len(os.Args) >= 1, "")
	compiler_name := os.Args[0]
	argv := os.Args[1:]

	for len(argv) > 0 {
		if argv[0] == "-debug" {
			DEBUG = true
			argv = argv[1:]
		} else {
			break
		}
	}

	if DEBUG {
		fmt.Println("[INFO] Debug mode is enabled")
	}

	if len(argv) < 1 {
		usage(compiler_name)
		fmt.Println("[ERROR] no subcommand is provided")
		os.Exit(1)
	}

	subcommand := argv[0]
	argv = argv[1:]

	switch subcommand {
	case "sim":
		if len(argv) < 1 {
			usage(compiler_name)
			fmt.Println("[ERROR] no input file is provided for the simulation")
			os.Exit(1)
		}
		program_path := argv[0]
		program := compile_file_to_program(program_path)
		simulate_little_endian_linux(program)

	case "com":
		fmt.Println("[ERROR]: if you want to compile you porth file use the original implementation in `https://github.com/tsoding/porth`")
		os.Exit(1)

	case "help":
		usage(compiler_name)
		os.Exit(1)

	default:
		usage(compiler_name)
		fmt.Printf("[ERROR] unknown subcommand %s\n", subcommand)
		os.Exit(1)
	}
}
