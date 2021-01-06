/*
Created on Aug 1, 2019

Author: Victor Arjona
*/

/*
DESCRIPTION

ReimannInt.sce APPROXIMATES THE AREA UNDER THE CURVE. THIS IS AN ATTEMPT
AT DOING SO WITH VARIOUS REIMANN SUMS: LEFT, RIGHT, MIDPOINT RULE,
TRAPEZOID RULE, AND, EVENTUALLY, SIMPSON'S RULE.

TODO:
THIS IS OLD. COMPARE TO THE PYTHON VERSION AND SIMPLIFY!

DESCRIPTION
*/
// HELPER FUNCTIONS ------------------------------------------
function edgs = XInputs(edges_lst, int_type)
    if ~exists("int_type", "local") then
        int_type = 'ms'
    end
    edgs = edges_lst
    inputs = []
    if int_type == 'ms' then
        len_lst = len(edges_lst)
        inputs = edges_lst(1:len_lst - 1) + edges_lst(2:len_lst)
        inputs = 0.5*inputs
    elseif int_type == 'rs' then
        inputs = edges_lst(2:len_lst)
    elseif int_type == 'ls' then
        inputs = edges_lst(1:len_lst - 1)
    elseif int_type == 'ts' then
        inputs = edgs
    end
endfunction
// HELPER FUNCTIONS ------------------------------------------

// TABLE OF CONTENTS -----------------------------------------
//	1
//		1.1
//		1.2

// TABLE OF CONTENTS -----------------------------------------

// CONTENT ---------------------------------------------------
//	1
//		1.1
//		1.2

function Reimann(f, x_lo, x_hi, tol, int_type, plt)

endfunction





function intApprox = ReimannLS(f, xLo, xHi, tol)
    // GET FIRST APPROXIMATION AND ADD A COUNTER.                             //
    intApprox(1) = (xHi - xLo)*f(xLo);
    cnt = 2;
    
    // DO A SECOND APPROXIMATION. NOW WE HAVE SOMETHING TO COMPARE TO OUR     //
    // tol!                                                                   //
    xS = linspace(xLo, xHi, cnt + 1);
    intApprox(cnt) = (xS(cnt) - xS(cnt - 1))*(f(xS(cnt-1)) + f(xS(cnt)));
    
    // START GENERATING APPROXIMATIONS!                                       //
    while abs(intApprox(cnt) - intApprox(cnt-1)) > tol
        cnt = cnt + 1;
        xS = linspace(xLo, xHi, cnt + 1);
        dx = abs(xS(1) - xS(2));
        intApprox(cnt) = 0;
        for ii = 1:cnt
            intApprox(cnt) = intApprox(cnt) + f(xS(ii));
        end
        intApprox(cnt) = intApprox(cnt)*dx;
    end
    
    plot((1:length(intApprox))', intApprox); xgrid;
    
endfunction

function intApprox = ReimannRS(f, xLo, xHi, tol)
    // GET FIRST APPROXIMATION AND ADD A COUNTER.                             //
    intApprox(1) = (xHi - xLo)*f(xHi);
    cnt = 2;
    
    // DO A SECOND APPROXIMATION. NOW WE HAVE SOMETHING TO COMPARE TO OUR     //
    // tol!                                                                   //
    xS = linspace(xLo, xHi, cnt + 1);
    intApprox(cnt) = (xS(cnt) - xS(cnt - 1))*(f(xS(cnt)) + f(xS(cnt + 1)));
    
    // START GENERATING APPROXIMATIONS!                                       //
    while abs(intApprox(cnt) - intApprox(cnt-1)) > tol
        cnt = cnt + 1;
        xS = linspace(xLo, xHi, cnt + 1);
        dx = abs(xS(1) - xS(2));
        intApprox(cnt) = 0;
        for ii = 1:cnt
            intApprox(cnt) = intApprox(cnt) + f(xS(ii+1));
        end
        intApprox(cnt) = intApprox(cnt)*dx;
    end
    
    plot((1:length(intApprox))', intApprox); xgrid;
    
endfunction

function intApprox = ReimannMR(f, xLo, xHi, tol)
    // GET FIRST APPROXIMATION AND ADD A COUNTER.                             //
    intApprox(1) = (xHi - xLo)*f((xLo + xHi)/2);
    cnt = 2;
    
    // DO A SECOND APPROXIMATION. NOW WE HAVE SOMETHING TO COMPARE TO OUR     //
    // tol!                                                                   //
    xS = linspace(xLo, xHi, cnt + 1);
    intApprox(cnt) = (xS(cnt) - xS(cnt - 1))*(f((xS(1) + xS(2))/2) + f((xS(2) + xS(3))/2));
    
    // START GENERATING APPROXIMATIONS!                                       //
    while abs(intApprox(cnt) - intApprox(cnt-1)) > tol
        cnt = cnt + 1;
        xS = linspace(xLo, xHi, cnt + 1);
        dx = abs(xS(1) - xS(2));
        intApprox(cnt) = 0;
        for ii = 1:cnt
            intApprox(cnt) = intApprox(cnt) + f((xS(ii) + xS(ii+1))/2);
        end
        intApprox(cnt) = intApprox(cnt)*dx;
    end
    
    plot((1:length(intApprox))', intApprox); xgrid;
    
endfunction

function intApprox = TrapRule(f, xLo, xHi, tol)
    // GET FIRST APPROXIMATION AND ADD A COUNTER.                             //
    intApprox(1) = (xHi - xLo)*(f(xLo) + f(xHi))/2;
    cnt = 2;
    
    // DO A SECOND APPROXIMATION. NOW WE HAVE SOMETHING TO COMPARE TO OUR     //
    // tol!                                                                   //
    xS = linspace(xLo, xHi, cnt + 1);
    intApprox(cnt) = (xS(2) - xS(1))*(f(xS(1)) + 2*f(xS(2)) + f(xS(3)))/2;
    
    // START GENERATING APPROXIMATIONS!                                       //
    while abs(intApprox(cnt) - intApprox(cnt-1)) > tol
        cnt = cnt + 1;
        xS = linspace(xLo, xHi, cnt + 1);
        dx = abs(xS(1) - xS(2));
        intApprox(cnt) = 0;
        for ii = 1:cnt
            intApprox(cnt) = intApprox(cnt) + (f(xS(ii)) + f(xS(ii+1)))/2;
        end
        intApprox(cnt) = intApprox(cnt)*dx;
    end
    
    plot((1:length(intApprox))', intApprox); xgrid;
    
endfunction

function rInt = ReimannMaster(f, xLo, xHi, tol)
    // START WITH TWO APPROXIMATIONS, ONE WITH 1 RECTANGLE, THE OTHER WITH    //
    // 2 RECTANGLES.                                                          //
    rInt(1) = ReimannLS(f, xLo, xHi);
    cnt = 2;
    xS = linspace(xLo, xHi, cnt + 1);
    for ii = 1:cnt
        rInt(cnt) = ReimannLS(f, xS(ii), xS(ii + 1));
    end
    
    while abs(rInt(cnt-1) - rInt(cnt)) > tol
        cnt = cnt + 1;
        xS = linspace(xLo, xHi, cnt+1);
        rInt(cnt) = 0;
        for ii = 1:cnt
            rInt(cnt) = rInt(cnt) + ReimannLS(f, xS(ii), xS(ii+1));
        end
    end
    
    plot(1:cnt, rInt); xgrid;
endfunction
// CONTENT ---------------------------------------------------
