/*
Created on Jul 10, 2019

Author: Victor Arjona
*/

/*
DESCRIPTION


DESCRIPTION
*/
// HELPER FUNCTIONS ------------------------------------------
function [nnum1, nnum2] = Simplify(num1, num2)
    smol = int(min(num1, num2))
    nnum1 = num1
    nnum2 = num2
    for ii = 2:smol
        while (modulo(nnum1, ii) == 0) && (modulo(nnum2, ii) == 0)
            nnum1 = nnum1/ii
            nnum2 = nnum2/ii
        end
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

// CONTENT ---------------------------------------------------

// APPROXIMATING PI BY CALCULATING THE NUMBER OF PSEUDO-RANDOM
// GENRERATED POINTS THAT FALL INTO A QUARTER OF A CIRCLE OF
// RADIUS 1 AND THE 1X1 SQUARE, QUANTITY MULTIPLIED BY 4.
function pi_approx = ApproxPi(n)
    all_pts = rand(n, 2)
    pts_in_cir = all_pts(sum(all_pts.^2, 'c') <= 1, :)
    
    all_len = size(all_pts)(1)
    cir_len = size(pts_in_cir)(1)
    [top, bottom] = Simplify(4.0*cir_len, all_len)
    pi_approx = top/bottom
endfunction
