\name{interior_point}
\alias{interior_point}
\title{Solves a linear programming problem using the interior point method
}
\description{
This function solves a linear programming problem using a modification of 
Karmarkar's linear programming algorithm, developed by Vanderbei, Meketon and 
Freedman (1986). This algorithm uses a recentered projected gradient
approach without a priori knowledge of the optimal objective function value. 
}
\usage{
interior_point(t, c, bA = NULL, A = NULL, bm = NULL, m = NULL, 
bM = NULL, M = NULL, e = 1e-04, a1 = 1, a2 = 0.97)
}
\arguments{
  \item{t}{
Type of problem. Put 1 if it is a maximization problem, and -1 if it is a 
minimization one.
}
  \item{c}{
The vector corresponding to the coefficients of the objective function
}
  \item{bA}{
The vector corresponding to the right hand side constants (with =)
}
  \item{A}{
The coefficients of the problem constraints matrix A (with =)
}
  \item{bm}{
The vector corresponding to the right hand side constants (with <=)
}
  \item{m}{
The coefficients of the problem constraints matrix A (with <=)
}
  \item{bM}{
The vector corresponding to the right hand side constants (with >=)
}
  \item{M}{
The coefficients of the problem constraints matrix A (with >=)
}
  \item{e}{
The value of \eqn{\epsilon}. Default is 1e-04
}
  \item{a1}{
The value of \eqn{\alpha_1}. Default is 1
}
  \item{a2}{
The value of \eqn{\alpha_2}. Default is 0.97
}
}
\details{
The function is defined in the form that we only need to put the values used in 
the problem. For example, for 
a linear programming problem in the form:
\tabular{l}{
Maximize \eqn{Z=c_{1}x_{1}+c_{2}x_{2}+...+c_{n}x_{n}} \cr 
subject to \cr
\eqn{a_{11}x_{1}+a_{12}x_{2}+...a_{1n}x_{n}\leq b_{1}}  \cr
\eqn{a_{21}x_{1}+a_{22}x_{2}+...a_{2n}x_{n}\leq b_{2}}  \cr
\eqn{...} \cr 
\eqn{a_{m1}x_{1}+a_{m2}x_{2}+...a_{mn}x_{n}\leq b_{m}} 
}
that is, all the restrictions are inequality in the form \dQuote{\eqn{\leq }}, 
we need only to specify the vector bm and the vector(s) corresponding to the
 row(s) of A. 
}
\value{
a  list with the values
\item{Z }{The optimum value of the objective function}
\item{xf}{The solution vector}
\item{n}{The number of iterations to solve the problem}
}
\references{
Gill, P.E., Murray, W. and Wright, M.H. (1991) \emph{Numerical Linear Algebra 
and Optimization} \bold{vol. 1}, Addison-Wesley. 

Karmarkar, N. (1984) A new polynomial-time algorithm for linear programming.
 \emph{Combinatorica} \bold{4},
pp. 373-395.

Vanderbei, R.J., Meketon, M.S. and Freedman, B.A. (1986) A modification of 
Karmarkar's linear programming
algorithm. \emph{Algorithmica} \bold{1}, pp. 395-407.
}
\author{
Alejandro Quintela del Rio \email{aquintela@udc.es}
}

\examples{
##
c<-c(1,3,-2)
bA<-c(25,30)
A<-array(4,c(2,3))
A[1,2]<-8;A[1,3]<-6;A[2,1]<-7;A[2,2]<-5;A[2,3]<-9
interior_point(-1,c,bA,A)

##
c<-c(1,2)
bm<-c(4)
bM<-c(1)
m<-array(1,c(1,2))
m[1,1]<-0
M<-array(1,c(1,2))
interior_point(1,c,bm=bm,m=m,bM=bM,M=M)

##
#  This example is taken from Exercise 7.5 of Gill, Murray,
#  and Wright (1991).

enj <- c(200, 6000, 3000, -200)
fat <- c(800, 6000, 1000, 400)
vitx <- c(50, 3, 150, 100)
vity <- c(10, 10, 75, 100)
vitz <- c(150, 35, 75, 5)
interior_point(1,c=enj, m=fat, bm=13800, M=rbind(vitx, vity, vitz),
bM = c(600, 300, 550))
}
\keyword{ math }
\keyword{ optimize }
