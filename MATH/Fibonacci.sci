/*
Created on Jun 24, 2019

Author: Victor Arjona
*/

/*
DESCRIPTION

DESCRIPTION
*/
// HELPER FUNCTIONS ------------------------------------------

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
//----------------------------------------------------------------------------//
function nu = FibnacciNumberGenerator(N)
    if N < 1 then
        disp("Bruh, you ain''t going no where")
        abort
    elseif N <= 2 then
        nu = 1
        return
    end
    f1 = 1
    f2 = 1
    for ii = 3:N
        f1 = f2
        f2 = nu
        nu = f1 + f2
     end
endfunction

function fibs = FibonacciListGenerator(N)
    if N < 1 then
        disp("Bruh, you ain''t going no where")
        abort
    elseif N < 2 then
        fibs = [1]
        return
    end
    fibs = [1, 1]
    if N == 2 then
        return
    else
        for ii = 3:N
            fibs(ii) = fibs(ii - 1) + fibs(ii - 2)
        end
    end
endfunction

function fn = FibonacciLA1(N)
    fn = [1; 1]
    fi_mx = [1, 1; 1, 0]
    for ii = 2:N - 1
        fn = fi_mx*fn
    end
endfunction
// CONTENT ---------------------------------------------------
