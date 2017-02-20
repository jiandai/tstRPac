# test 1
dyn.load('../src/hello.so')
hello.R <-function(n) .C('hello',as.integer(n))
hello.R(3)

# test 2
dyn.load('../src/add.so')
x<-5
y<-11
z<-as.integer(1)
.C('add',as.integer(x),as.integer(y),z)
z
