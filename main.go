package main

import (
	"fmt"
	"unicode"
    "strings"
    "strconv"
    "bufio"
    "os"
)

const DEBUG = false

func assert(cond bool, msg string) {
	if !cond {
		panic(msg)
	}
}

const (
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
	LOAD     = iota
	STORE    = iota
	SYSCALL0 = iota
	SYSCALL1 = iota
	SYSCALL2 = iota
	SYSCALL3 = iota
	SYSCALL4 = iota
	SYSCALL5 = iota
	SYSCALL6 = iota
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

const (
	WORD = iota
	INT  = iota
	STR  = iota
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

func simulate_little_endian_linux(program Program)                     {}
func generate_nasm_linux_x86_64(program Program, out_file_path string) {}

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
                        token:     i,
                    }
                } else {
                    ch <- LineToken{
                        col:       col,
                        tokenType: INT,
                        token:     text_of_token,
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
	col := 1

	tokens := []Token{}

	for scanner.Scan() {
		line := strings.Split(scanner.Text(), "//")
		for lt := range lex_line(line[0]) {
            fmt.Println(lt)
			tokens = append(tokens, Token{
				typ: lt.tokenType,
				loc: Loc{
					path:   file_path,
					line:   row,
					column: col,
				},
				value: lt.token,
			})
		}
	}

	return tokens
}

func main() {
	tokens := lex_file("examples/hello-world.porth")
    for token := range tokens {
        fmt.Println(token)
    }
}
