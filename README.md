# Ref:
http://www.biostat.jhsph.edu/~rpeng/docs/interface.pdf

# Git repo url:
https://github.com/jiandai/tstRPac

# Note

- Run ```R CMD SHLIB hello.c```
which creates both hello.o and hello.so in the same folder in the unix env

- Start R and run
```
> dyn.load('hello.so')
> .C('hello',as.integer(4))
Hello!
Hello!
Hello!
Hello!
[[1]]
[1] 4
```

Interestingly, there is a diff in the output by running
```
> .C('hello',4)
[[1]]
[1] 4
```

tst.R
```
dyn.load('../src/hello.so')
hello.R <-function(n) .C('hello',as.integer(n))
hello.R(3)
```

```Rscript tst.R```

```
Hello!
Hello!
Hello!
[[1]]
[1] 3
```
