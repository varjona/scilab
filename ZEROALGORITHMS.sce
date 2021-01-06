// ZEROALGORITHMS TRIES TO APPROXIMATE THE VALUE x_N SUCH THAT f(x_N) = 0.    //

//----------------------------------------------------------------------------//
// NewtonMethod DOES THIS ASSUMING WE KNOW THE DERIVATIVE.                    //
function xN = NewtonMethod(f, fP, sqrRtOf, x0, tol)
    
    // DISPLAY FIRST GUESS                                                    //
    disp(x0)
    
    // GENERATE THE NEXT GUESS AND DISPLAY IT.                                //
    xN = x0 - (f(x0) - sqrRtOf)/fP(x0)
    disp(xN)
    
    // WHILE THE DISTANCE TO OUR APPROXIMATIONS ARE HIGHER THAN OUR TOLERANCE,//
    // KEEP GENERATING NEW APPROXIMATIONS.                                    //
    while abs(x0 - xN) > tol
        x0 = xN
        xN = x0 - (f(x0) - sqrRtOf)/fP(x0)
        disp(xN)
    end
    
    disp('THIS IS THE CLOSEST VALUE:')
    disp(xN)
    
endfunction

//----------------------------------------------------------------------------//
// SecantMethod DOES THE SAME THING AS NewtonMethod, WITHOUT HAVING THE       //
// DERIVATIVE READILY AVAILABLE. INSTEAD, WE APPROXIMATE THE DERIVATIVE       //
// USING THE SECANT SECANT LINE.                                              //
function SecantMethod(f, xL, xH, tol)
    
    if abs(f(xL)) > abs(f(xH)) then
        disp(xH);
    else
        disp(xL);
    end
    
    xN
    
endfunction

function BisectionMethod(f, x0)
    
    
endfunction

function TesterNewton()
    function y = Ff(x)
        y = x.^2
    endfunction
    function yP = FPrime(x)
        yP = 2.*x
    endfunction
    
    NewtonMethod(Ff, FPrime, 2, 2,.0000001)
endfunction
