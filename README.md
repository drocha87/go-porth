# Go Porth (Naive 1x1 Go translation from `porth.py sim`)

** This translation is based on commit #5da80c1 **

The idea was not to write "idiomatic Go". I tried to translate 1x1 without any fancy modification to the original code. It was a relly cool experience.

The main project is hosted in [Porth](https://github.com/tsoding/porth)

My very fast computer specs:

```txt
CPU: Intel Celeron N3050 (2) @ 2.160GHz
GPU: Intel Atom/Celeron/Pentium Processor x5-E8000/J3xxx/N3xxx
Memory: 1859MiB / 3852MiB
```

Native porth simulator

```sh
$ ./porth.py sim examples/rule110.porth
...
real    0m4,876s
user    0m4,769s
sys     0m0,048s
```

Go Porth simulator

```sh
$ go build -o porth main.go
$ ./porth sim examples/rule110.porth
...
real    0m0,026s
user    0m0,017s
sys     0m0,007s
```

I know that the comparation is very silly, but it is what it is, I also know that the language is meant to be self hosted, but again I enjoyed the exercise.

# Tests

```sh
~/projects/go-porth$ ./test.py
[INFO] Testing ./tests/bitwise.porth
[CMD] ./porth sim ./tests/bitwise.porth
[INFO] Testing ./tests/arithmetics.porth
[CMD] ./porth sim ./tests/arithmetics.porth
[INFO] Testing ./tests/comparison.porth
[CMD] ./porth sim ./tests/comparison.porth
[INFO] Testing ./tests/memory.porth
[CMD] ./porth sim ./tests/memory.porth
[INFO] Testing ./tests/control-flow.porth
[CMD] ./porth sim ./tests/control-flow.porth
[INFO] Testing ./tests/stack.porth
[CMD] ./porth sim ./tests/stack.porth

Simulation failed: 0
```

