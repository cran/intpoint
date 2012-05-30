\name{random_problem}
\alias{random_problem}
\title{
Random squared (n x n) linear programming problems are generated and solved by
 the interior point method
}
\description{
A random linear programming problem, with the form \eqn{Max Z=CX} subject to 
\eqn{AX\leq b}, \eqn{X \geq 0} is generated, using U(0,1) values for both the 
matrix \eqn{A} and the vectors \eqn{C} and \eqn{b}. Next, the interior point is 
used to solve the problem. If the number of equations (variables) is least than 
or equal to 5, the input problem is shown. 
}
\usage{
random_problem(n)
}
\arguments{
  \item{n}{
The size of the problem (number of equations and variables)
}
}

\value{
	\item{A}{The coefficient matrix A}
	\item{c}{The coefficients of the objective function}
	\item{b}{The right hand side constants}
	\item{z}{Optimum value for the objective function}
	\item{xf}{Solution vector}
	\item{n}{Number of iterations}
}
\references{
Gill, P.E., Murray, W. and Wright, M.H. (1991) \emph{Numerical Linear Algebra
and Optimization} \bold{vol. 1}, Addison-Wesley. 

Karmarkar, N. (1984) A new polynomial-time algorithm for linear programming. 
\emph{Combinatorica} \bold{4}, pp. 373-395.

Vanderbei, R.J., Meketon, M.S. and Freedman, B.A. (1986) A modification of 
Karmarkar's linear programming algorithm. \emph{Algorithmica} \bold{1}, 
pp. 395-407.
}
\author{Alejandro Quintela del Rio \email{aquintela@udc.es}}
\examples{
## generating and solving a linear programming problem with uniform (0,1)
## random values
random_problem(10)
}
\keyword{ math}
\keyword{ optimize}
