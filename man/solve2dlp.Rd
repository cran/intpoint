\name{solve2dlp}
\alias{solve2dlp}
\title{
Graphical solution of a two-dimensional linear programming problem. The 
sequence of points calculated by the interior point method is also shown, 
by request. 
}
\description{
The graphical method for solving linear programming problems in two variables is
 implemented. The lines corresponding to the constraints are drawn; next, the 
 coordinates of the corner points of the feasible region are computed, 
 and the objective function is evaluated to obtain the optimal value. 
 Finally, the objective function is drawn over the optimal point. If the 
 interior point algorithm is loaded, then the sequence of points obtained by 
 this method are shown.
 Details:
   1. Graph the feasible region.
   2. Compute the coordinates of the corner points.
   3. Substitute the coordinates of the corner points into the objective 
   function to see which gives the optimal value. This point is the solution
    to the linear programming problem.
   4. If the feasible region is not bounded, this method can be misleading: 
   optimal solutions always exist when the feasible region is bounded, but may 
   or may not exist when the feasible region is unbounded. 
      If the feasible region is unbounded, we are minimizing the objective 
      function, and its coefficients are non-negative, then a solution exists, 
      so this method yields the solution. 
}
\usage{
solve2dlp(t = 1, c = NULL, bA = NULL, A = NULL, bm = NULL, m = NULL,
 bM = NULL, M = NULL, z = 1, ip = 1, e = 1e-04, a1 = 1, a2 = 0.97)
}

\arguments{
  \item{t}{
Type of problem. Put 1 in the case of a maximization problem, and -1 if it is a 
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
  \item{z}{
Put 0 if you only want to show the feasible region, not the solution. 
Default is 1
}
  \item{ip}{
Put 1 if you want to solve the problem by the interior point method, and 0 if
 not. The sequence of calculated points is displayed. Default is 1
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

\value{
The graphical solution to the linear programming problem. Lines corresponding 
to the constrain are coloured in green, the corner points in blue and the 
optimal point (if there exists) in magenta (with the objective function in
 blue). The sequence of interior points is drawn in red. 
}
\references{
Murty, K.G. (1983) \emph{ Linear Programming}, Wiley.

Karmarkar, N. (1984) A new polynomial-time algorithm for linear programming. 
\emph{Combinatorica} \bold{4}, pp. 373-395.

Vanderbei, R.J., Meketon, M.S. and Freedman, B.A. (1986) A modification of 
Karmarkar's linear programming algorithm. \emph{Algorithmica} \bold{1}, 
pp. 395-407.
}
\author{Alejandro Quintela del Rio \email{aquintela@udc.es}
}
\examples{
# Max Z  = x2
# Subject to  2x1 - x2  = -2
#	         x1 + 2x2  = 8
#       	   x1, x2   >= 0
c=c(3,2)
M1=c(2,-1)
bM1=-2
m1=c(1,2)
bm1=8
solve2dlp(t=1, m=m1, bm=bm1, M=M1, bM=bM1, c=c, z=0, ip=0)

# A unbounded problem
#Z = x1 + 2x2
# Subject to  x1 + x2 = 1
#		x2 = 4
#		x1, x2 =0

m1<-c(0,1)
bm1<-4
M1<-c(1,1)
bM1<-1
c<-c(1,2)
solve2dlp(t=1, m=m1, bm=bm1, M=M1, bM=bM1, c=c, z=1, ip=1)

# a problem with several constraints
m1<-rbind(c(1,0), c(1,2),c(0,1))
bm1<-c(5,10,4)
c=c(1,3)
solve2dlp(t=1, m=m1, bm=bm1, c=c, z=1, ip=1)



}
\keyword{ math }
\keyword{ optimize }
