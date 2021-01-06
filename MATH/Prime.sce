/*
Created on Jun 24, 2019

Author: Victor Arjona
*/

/*
DESCRIPTION

PrimeGen TAKES IN A POSITIVE NUMBER, n, AND GENERATES ALL THE PRIMES
BETWEEN 1 AND n, INCLUDING n, AND CHECKS IF IT IS A PRIME USING
PrimeCheck1. PrimeGen2 DOES THE SAME BUT WITH PrimeCheck2.
PrimeCheck1 TAKES IN A REAL NUMBER, someN, AND CHECKS IF IT IS A
PRIME BY BRUTE FORCE. PrimeCheck2 DOES THE SAME BUT UP TO THE SQUARE
ROOT OF someN. HERE'S THE PROOF:

https://stackoverflow.com/questions/5811151/
why-do-we-check-up-to-the-square-root-of-a-prime-
number-to-determine-if-it-is-pr

PARAMETERS FOR...

PrimeCheck
    someN - LITERALLY SOME INTEGER. IT TAKES ANY INTEGER AND
            CHECKS WHETHER IT IS A PRIME OR NOT. SINCE WE ALREADY
            CHECK IF SAID NUMBER'S BIGGER THAN 1.

    opt_p_check -   THIS IS A BOOLEAN. IF IT'S TRUE, OR NOT IN AT
                    ALL, THEN IT'LL USE THE OPTIMIZED METHOD.
                    OTHERWISE, IT USES THE REGULAR METHOD.

PrimeGen
    n - THIS NUMBER IS OUR UP-TO VALUE TO CHECK FOR PRIMES.

    opt_p_check - THIS IS A BOOLEAN INPUT. TRUE BY DEFAULT, IT'LL USE
    PrimeCheck2. ELSE, IT'LL USE PrimeCheck1.

PrimePlot
    SAME AS PrimeGen

DESCRIPTION
*/

// HELPER FUNCTIONS ------------------------------------------
function bool = PrimeCheck(someN, opt_p_check)
    if ~exists("opt_p_check","local") then
        opt_p_check = %T
    end
    if opt_p_check then
        up_to = floor(sqrt(someN)) + 1
    else
        up_to = someN
    end
    for kk = 2:up_to - 1
        if modulo(someN, kk) == 0
            bool = %F
            return
        end
    end
    bool = %T
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

function prime_lst = PrimeGen(n, opt_p_check)
    if ~exists("opt_p_check", "local") then
        opt_p_check = %T
    end
    if n < 2 then
        strg = 'Prime numbers are natural numbers greater than 1.'
        disp(strg)
    end
    if n == 2 then
        prime_lst = [2]
        return
    end
    prime_lst = [2]
    curridx = 1
    for ii = 3:2:n
        if PrimeCheck(ii)
            curridx = curridx + 1
            prime_lst(curridx) = ii
        end
    end
endfunction

function PrimePlot(n, opt_p_check, rtrn_bool)
    if ~exists("opt_p_check", "local") then
        opt_p_check = %T
    end
    if ~exists("rtrn_bool", "local") then
        rtrn_bool = %F
    end
    prime_lst = PrimeGen(n, opt_p_check)
    len_prime_lst = 1:length(prime_lst)
    plot(len_prime_lst, prime_lst)
    xgrid(2)
    ylabel('Prime')
    xlabel('Index of prime')
    title('Prime plot')
endfunction
// CONTENT ---------------------------------------------------
