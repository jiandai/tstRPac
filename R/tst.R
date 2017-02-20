dyn.load('../src/hello.so')
hello.R <-function(n) .C('hello',as.integer(n))
hello.R(3)
