%%----- Docu for *all* sparse vector classes ----------
\name{sparseVector-class}
\docType{class}
\title{Sparse Vector Classes}
\alias{sparseVector-class}
% sub classes
\alias{dsparseVector-class}
\alias{isparseVector-class}
\alias{lsparseVector-class}
\alias{nsparseVector-class}
\alias{zsparseVector-class}
\alias{xsparseVector-class}% the class union
%% Group methods
\alias{Arith,sparseVector,sparseVector-method}
\alias{Arith,dsparseVector,dsparseVector-method}
\alias{-,dsparseVector,missing-method}
\alias{!,sparseVector-method}
\alias{Logic,sparseVector,sparseVector-method}
\alias{Logic,lsparseVector,lsparseVector-method}
\alias{Logic,nsparseVector,nsparseVector-method}
\alias{Ops,ANY,sparseVector-method}
\alias{Ops,sparseVector,ANY-method}
\alias{Ops,sparseVector,sparseVector-method}
\alias{Ops,sparseVector,atomicVector-method}
\alias{Ops,atomicVector,sparseVector-method}
\alias{Ops,Matrix,sparseVector-method}
\alias{Ops,sparseVector,Matrix-method}
\alias{Arith,ddenseMatrix,sparseVector-method}
\alias{Arith,dgeMatrix,sparseVector-method}
\alias{Arith,sparseVector,ddenseMatrix-method}
\alias{Arith,sparseVector,dgeMatrix-method}
\alias{Logic,dMatrix,sparseVector-method}
\alias{Logic,lMatrix,sparseVector-method}
\alias{Logic,nMatrix,sparseVector-method}
\alias{Logic,sparseVector,dMatrix-method}
\alias{Logic,sparseVector,lMatrix-method}
\alias{Logic,sparseVector,nMatrix-method}
\alias{Math,sparseVector-method}
\alias{Math2,dsparseVector-method}% or (dsparseVector, numeric) & (dsparseVector,missing) ?
\alias{Math2,sparseVector-method}
\alias{Summary,sparseVector-method}
\alias{Summary,nsparseVector-method}
%% non-group :
%\alias{solve,..} --> solve-methods.Rd
%\alias{\%*\%,..} --> matrix-products.Rd
\alias{coerce,ANY,sparseVector-method}
\alias{coerce,ANY,nsparseVector-method}
\alias{coerce,CsparseMatrix,sparseVector-method}
\alias{coerce,TsparseMatrix,sparseVector-method}
\alias{coerce,sparseMatrix,sparseVector-method}
\alias{coerce,diagonalMatrix,sparseVector-method}
\alias{coerce,atomicVector,sparseVector-method}
\alias{coerce,atomicVector,dsparseVector-method}
\alias{coerce,sparseVector,integer-method}
\alias{coerce,sparseVector,logical-method}
\alias{coerce,sparseVector,numeric-method}
\alias{coerce,sparseVector,vector-method}
\alias{coerce,sparseVector,Matrix-method}
\alias{coerce,sparseVector,sparseMatrix-method}
\alias{coerce,sparseVector,CsparseMatrix-method}
\alias{coerce,sparseVector,TsparseMatrix-method}
\alias{coerce,nsparseVector,lsparseVector-method}
\alias{coerce,nsparseVector,dsparseVector-method}
\alias{coerce,nsparseVector,isparseVector-method}
\alias{coerce,nsparseVector,zsparseVector-method}
\alias{coerce,xsparseVector,dsparseVector-method}
\alias{coerce,xsparseVector,isparseVector-method}
\alias{coerce,xsparseVector,lsparseVector-method}
\alias{coerce,xsparseVector,zsparseVector-method}
\alias{coerce,xsparseVector,nsparseVector-method}
%
\alias{as.logical,sparseVector-method}
\alias{as.numeric,sparseVector-method}
\alias{as.vector,sparseVector-method}
\alias{dim<-,sparseVector-method}
\alias{is.na,nsparseVector-method}
\alias{is.na,sparseVector-method}
\alias{is.finite,nsparseVector-method}
\alias{is.finite,sparseVector-method}
\alias{is.infinite,nsparseVector-method}
\alias{is.infinite,sparseVector-method}
\alias{length,sparseVector-method}
\alias{mean,sparseVector-method}
\alias{rep,sparseVector-method}
\alias{show,sparseVector-method}
\alias{t,sparseVector-method}
\alias{toeplitz,sparseVector-method}
%
\alias{head,sparseVector-method}
\alias{tail,sparseVector-method}
\alias{[,sparseVector,index,ANY,ANY-method}
\alias{[,sparseVector,lsparseVector,ANY,ANY-method}
\alias{[,sparseVector,nsparseVector,ANY,ANY-method}
\alias{[<-,sparseVector,index,missing,replValue-method}
\alias{[<-,sparseVector,sparseVector,missing,replValue-method}
% also indexing in "traditional" vectors:
%R_FIXME \alias{[<-,atomicVector,sparseVector,missing,replValue-method}
%R_FIXME  \alias{[,atomicVector,lsparseVector,ANY,ANY-method}
%R_FIXME  \alias{[,atomicVector,nsparseVector,ANY,ANY-method}
%
\description{Sparse Vector Classes: The virtual mother class
  \code{"sparseVector"} has the five actual daughter classes
   \code{"dsparseVector"}, \code{"isparseVector"},
   \code{"lsparseVector"}, \code{"nsparseVector"}, and
   \code{"zsparseVector"}, where we've mainly implemented methods for
   the \code{d*}, \code{l*} and \code{n*} ones.
}
\section{Slots}{
  \describe{
    \item{\code{length}:}{class \code{"numeric"} - the \code{\link{length}}
     of the sparse vector.  Note that \code{"numeric"} can be
     considerably larger than the maximal \code{"integer"},
     \code{\link{.Machine}$integer.max}, on purpose.}

    \item{\code{i}:}{class \code{"numeric"} - the (1-based) indices of
      the non-zero entries.  Must \emph{not} be \code{NA} and strictly
      sorted increasingly.

      Note that \code{"integer"} is \dQuote{part of} \code{"numeric"},
      and can (and often will) be used for non-huge sparseVectors.}

    \item{\code{x}:}{(for all but \code{"nsparseVector"}):
      the non-zero entries.  This is of class \code{"numeric"} for class
      \code{"dsparseVector"},  \code{"logical"} for class
      \code{"lsparseVector"}, etc.

      Note that \code{"nsparseVector"}s have no \code{x} slot.
      Further, mainly for ease of method definitions, we've defined the
      class union (see \code{\link{setClassUnion}}) of all sparse vector
      classes which \emph{have} an \code{x} slot, as class \code{"xsparseVector"}.
      }
  }
}
\section{Methods}{
  \describe{
    \item{length}{\code{signature(x = "sparseVector")}: simply extracts
      the \code{length} slot.}
    \item{show}{\code{signature(object = "sparseVector")}: The
      \code{\link{show}} method for sparse vectors prints
      \emph{\dQuote{structural}} zeroes as \code{"."} using the
      non-exported \code{prSpVector} function which allows further
      customization such as replacing \code{"."} by \code{" "} (blank).

      Note that \code{\link{options}(max.print)} will influence how many
      entries of large sparse vectors are printed at all.}
    \item{as.vector}{\code{signature(x = "sparseVector", mode = "character")}
      coerces sparse vectors to \dQuote{regular}, i.e., atomic vectors.
      This is the same as \code{as(x, "vector")}.}
    \item{as}{..: see \code{coerce} below}
    \item{coerce}{\code{signature(from = "sparseVector", to = "sparseMatrix")}, and}
    \item{coerce}{\code{signature(from = "sparseMatrix", to = "sparseVector")},
      etc: coercions to and from sparse matrices (\code{\linkS4class{sparseMatrix}}) are
      provided and work analogously as in standard \R, i.e., a vector is
      coerced to a 1-column matrix.}
    \item{dim<-}{\code{signature(x = "sparseVector", value = "integer")}
      coerces a sparse vector to a sparse Matrix, i.e., an object
      inheriting from \code{\linkS4class{sparseMatrix}}, of the
      appropriate dimension.}
    \item{head}{\code{signature(x = "sparseVector")}: as with \R's
      (package \pkg{util}) \code{\link{head}}, \code{head(x,n)} (for
      \eqn{n >= 1}) is equivalent to \code{x[1:n]}, but here can be much
      more efficient, see the example.}
    \item{tail}{\code{signature(x = "sparseVector")}: analogous to
      \code{\link{head}}, see above.}
    \item{toeplitz}{\code{signature(x = "sparseVector")}: as
      \code{\link[stats]{toeplitz}(x)}, produce the \eqn{n \times n}
      Toeplitz matrix from \code{x}, where \code{n = length(x)}.}
    \item{rep}{\code{signature(x = "sparseVector")} repeat \code{x},
      with the same argument list \code{(x, times, length.out, each,
	...)} as the default method for rep().}

    \item{Ops}{\code{signature(e1 = "sparseVector", e2 = "*")}: define
      arithmetic, compare and logic operations, (see
      \code{\link[=S4groupGeneric]{Ops}}).}
    \item{Summary}{\code{signature(x = "sparseVector")}: define
      all the \code{\link[=S4groupGeneric]{Summary}} methods.}
    \item{[}{\code{signature(x = "atomicVector", i = ...)}: not only can you
      subset (aka \emph{\dQuote{index into}}) sparseVectors \code{x[i]}
      using sparseVectors \code{i}, but we also support efficient
      subsetting of traditional vectors \code{x} by logical sparse
      vectors (i.e., \code{i} of class \code{"nsparseVector"} or
      \code{"lsparseVector"}).}
    \item{is.na, is.finite, is.infinite}{\code{(x = "sparseVector")}, and}
    \item{is.na, is.finite, is.infinite}{\code{(x = "nsparseVector")}:
      return \code{\link{logical}} or \code{"nsparseVector"} of the same
      length as \code{x}, indicating if/where \code{x} is
      \code{\link{NA}} (or \code{NaN}), finite or infinite, entirely
      analogously to the corresponding base \R functions.}
  }
}
\seealso{
  \code{\link{sparseVector}()} for friendly construction of sparse
  vectors (apart from \code{as(*, "sparseVector")}).
}
%\author{Martin}
\examples{
getClass("sparseVector")
getClass("dsparseVector")
getClass("xsparseVector")# those with an 'x' slot

sx <- c(0,0,3, 3.2, 0,0,0,-3:1,0,0,2,0,0,5,0,0)
(ss <- as(sx, "sparseVector"))

ix <- as.integer(round(sx))
(is <- as(ix, "sparseVector"))
## an "isparseVector" (!)

## rep() works too:
(ri <- rep(is, length.out= 25))

## Using `dim<-`  as in base R :
r <- ss
dim(r) <- c(4,5) # becomes a sparse Matrix:
r
## or coercion (as as.matrix() in base R):
as(ss, "Matrix")
stopifnot(all(ss == print(as(ss, "CsparseMatrix"))))

## currently has "non-structural" FALSE -- printing as ":"
(lis <- is & FALSE)
(nn <- is[is == 0]) # all "structural" FALSE

## NA-case
sN <- sx; sN[4] <- NA
(svN <- as(sN, "sparseVector"))

v <- as(c(0,0,3, 3.2, rep(0,9),-3,0,-1, rep(0,20),5,0),
         "sparseVector")
v <- rep(rep(v, 50), 5000)
set.seed(1); v[sample(v@i, 1e6)] <- 0
str(v)
% Formal class 'dsparseVector' [package "Matrix"] with 3 slots
%   ..@ x     : num [1:250000] 3.2 -1 -3 3 5 3.2 -3 3 -1 5 ...
%   ..@ length: int 9500000
%   ..@ i     : int [1:250000] 4 16 52 155 189 194 204 231 244 265 ...
system.time(for(i in 1:4) hv <- head(v, 1e6))
##   user  system elapsed
##  0.033   0.000   0.032
system.time(for(i in 1:4) h2 <- v[1:1e6])
##   user  system elapsed
##  1.317   0.000   1.319

stopifnot(identical(hv, h2),
          identical(is | FALSE, is != 0),
	  validObject(svN), validObject(lis), as.logical(is.na(svN[4])),
	  identical(is^2 > 0,	is & TRUE),
	  all(!lis), !any(lis), length(nn@i) == 0, !any(nn), all(!nn),
	  sum(lis) == 0, !prod(lis), range(lis) == c(0,0))

## create and use the t(.) method:
t(x20 <- sparseVector(c(9,3:1), i=c(1:2,4,7), length=20))
(T20 <- toeplitz(x20))
stopifnot(is(T20, "symmetricMatrix"), is(T20, "sparseMatrix"),
	  identical(unname(as.matrix(T20)),
                    toeplitz(as.vector(x20))))
}
\keyword{classes}
