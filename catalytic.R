rk45 <- function( f, y0, t, kappa ) {

# Fourth-order Runge-Kutta method with error estimate.

#     USAGE:
#         y <- rk45(f, y0, t, args<-())

#     INPUT:
#         f     - function of x and t equal to dx/dt.  x may be multivalued,
#                 in which case it should a list or a NumPy array.  In this
#                 case f must return a NumPy array with the same dimension
#                 as x.
#         y0    - the initial condition(s).  Specifies the value of x when
#                 t <- t[0].  Can be either a scalar or a list or NumPy array
#                 if a system of equations is being solved.
#         t     - list or NumPy array of t values to compute solution at.
#                 t[0] is the the initial condition point, and the difference
#                 h<-t[i+1]-t[i] determines the step size h.
#         args  - any other parameters of the function f.

#     OUTPUT:
#         y     - NumPy array containing solution values corresponding to each
#                 entry in t array.  If a system is being solved, x will be
#                 an array of arrays.

#     NOTES:
#         This version is based on the algorithm presented in "Numerical
#         Mathematics and Computing" 6th Edition, by Cheney and Kincaid,
#         Brooks-Cole, 2008.


    # Coefficients used to compute the independent variable argument of f

    c20  <-   2.500000000000000e-01  #  1/4
    c30  <-   3.750000000000000e-01  #  3/8
    c40  <-   9.230769230769231e-01  #  12/13
    c50  <-   1.000000000000000e+00  #  1
    c60  <-   5.000000000000000e-01  #  1/2

    # Coefficients used to compute the dependent variable argument of f

    c21 <-   2.500000000000000e-01  #  1/4
    c31 <-   9.375000000000000e-02  #  3/32
    c32 <-   2.812500000000000e-01  #  9/32
    c41 <-   8.793809740555303e-01  #  1932/2197
    c42 <-  -3.277196176604461e+00  # -7200/2197
    c43 <-   3.320892125625853e+00  #  7296/2197
    c51 <-   2.032407407407407e+00  #  439/216
    c52 <-  -8.000000000000000e+00  # -8
    c53 <-   7.173489278752436e+00  #  3680/513
    c54 <-  -2.058966861598441e-01  # -845/4104
    c61 <-  -2.962962962962963e-01  # -8/27
    c62 <-   2.000000000000000e+00  #  2
    c63 <-  -1.381676413255361e+00  # -3544/2565
    c64 <-   4.529727095516569e-01  #  1859/4104
    c65 <-  -2.750000000000000e-01  # -11/40

    # Coefficients used to compute 4th order RK estimate

    a1  <-   1.157407407407407e-01  #  25/216
    a2  <-   0.000000000000000e-00  #  0
    a3  <-   5.489278752436647e-01  #  1408/2565
    a4  <-   5.353313840155945e-01  #  2197/4104
    a5  <-  -2.000000000000000e-01  # -1/5

    b1  <-   1.185185185185185e-01  #  16.0/135.0
    b2  <-   0.000000000000000e-00  #  0
    b3  <-   5.189863547758284e-01  #  6656.0/12825.0
    b4  <-   5.061314903420167e-01  #  28561.0/56430.0
    b5  <-  -1.800000000000000e-01  # -9.0/50.0
    b6  <-   3.636363636363636e-02  #  2.0/55.0

    n <- length( t )
    d <- length( y0 )
    y <- matrix( NaN , n, d)
    for (i in 1:n)
        for (j in 1:d)
            y[i,j] <- y0[j]
    
    for (i in 1:(n-1)) {
        h <- t[i+1] - t[i]
        k1 <- h * f( y[i,], t[i], kappa )
        k2 <- h * f( y[i,] + c21 * k1, t[i] + c20 * h, kappa )
        k3 <- h * f( y[i,] + c31 * k1 + c32 * k2, t[i] + c30 * h, kappa )
        k4 <- h * f( y[i,] + c41 * k1 + c42 * k2 + c43 * k3, t[i] + c40 * h, kappa )
        k5 <- h * f( y[i,] + c51 * k1 + c52 * k2 + c53 * k3 + c54 * k4, t[i] + h, kappa )
        k6 <- h * f( y[i,] + c61 * k1 + c62 * k2 + c63 * k3 + c64 * k4 + c65 * k5, t[i] + c60 * h, kappa )
        y[i+1,] <- y[i,] + a1 * k1 + a3 * k3 + a4 * k4 + a5 * k5
        y5 <- y[i,] + b1 * k1 + b3 * k3 + b4 * k4 + b5 * k5 + b6 * k6
    }
    return(y) 
}

f_catalysis <- function(y, t, kappa) {
    rhs <-rep(NaN,6) 
    rhs[1] <- -kappa[1] * y[1]
    rhs[2] <-  kappa[1] * y[1] - (kappa[2] + kappa[4] + kappa[5]) * y[2]
    rhs[3] <-  kappa[2] * y[2] - kappa[3] * y[3]
    rhs[4] <-  kappa[3] * y[3]
    rhs[5] <-  kappa[4] * y[2]
    rhs[6] <-  kappa[5] * y[2]
    return (rhs)
}
        
simulator <- function(xi, jout=4) {
    # INPUT:
    #      xi is a 5D vector
    #      jout is a flab indicating which output response the simulator returns
    #          1 : NO3
    #          2 : NO2
    #          3 : X unobserved reaction product
    #          4 : N2 (DEFAULT)
    #          5 : NH2
    #          6 : N2O
    t <- seq(0,180,length=100)
    kappa <- exp(xi) / 180.
    y <- rk45(f_catalysis, c(500., 0., 0., 0., 0., 0.), t, kappa)
    return (y[nrow(y),jout])
}
        
        