cufft1D <- function(x, inverse=FALSE,so.path='../src/fft.so')
{
  if(!is.loaded("cufft")) {
    dyn.load(so.path)
  }
  n <- length(x)
  rst <- .C("cufft",
  as.integer(n),
  as.integer(inverse),
  as.double(Re(z)),
  as.double(Im(z)),
  re=double(length=n),
  im=double(length=n))
  rst <- complex(real = rst[["re"]], imaginary = rst[["im"]])
  return(rst)
}

num <- 4
z <- complex(real = stats::rnorm(num), imaginary = stats::rnorm(num))
cpu <- fft(z)
cpu
gpu <- cufft1D(z)
gpu
cpu <- fft(z, inverse=T)
cpu
gpu <- cufft1D(z, inverse=T)
gpu
