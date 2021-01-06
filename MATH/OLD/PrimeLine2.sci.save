
// PrimeLine2 IS AN ATTEMPT AT IMPOSING A LINE y = mx + b, WHERE x IS A       //
// NATURAL NUMBER AND y IS THE OUTPUT SUCH THAT IT IS CLOSE TO SOME PRIME     //
// NUMBER. THUS WE TRY TO SEE THE PATTERN OF THE CHANGE OF OUR SLOPE, m, AND  //
// THE Y-INT, b. WE QUICKLY SEE AN INTERESTING PATTERN!                       //
// SO FAR, m LOOKS LIKE A FUNCTION THAT COULD PROBABLY BE MODELED AS A LINEAR //
// COMBINATION OF A NATURAL LOGRITHM WITH A DEGREE ONE POLY:                  //
//          m = K*ln(p(n)) + d  | p(n) A D1 POLYNOMIAL                        //
//                              | K,d REAL                                    //
// Y-INT, b, COULD BE MODELED AS A LINE AS WELL, AS SHOWN IN THE GRAPH:       //
//          b(n) = p*n + q                                                    //
// TODO : IS THERE A CURVE ON b(n) ??                                         //
function sol = PrimeLine2(N)
    
    // GENERATE THE PRIME NUMBERS                                             //
    prmNums = PrimeGenOPT(N)';
    
    // WHAT IS THE SIZE OF THE PRIME LIST?                                    //
    szP = length(prmNums);
    
    // GENERATE AN ARRAY FROM 1 TO THE SIZE OF THE PRIME LIST AND TRANSPOSE   //
    // IT                                                                     //
    x = 1:szP; x = x';
    
    // MAKE A COLLECTOR ARRAY x MINUS ONE TO COLLECT THE SLOPE AND Y-INTs     //
    sol = zeros(2, szP-1);
    
    // sol HAS 2 ROWS, AND szP - 1 COLUMNS (VERIFIED). FIRST ROW CONTAINS THE //
    // SLOPE OF THE L-S APPROXS. FIRST COL, THE SLOPE BETWEEN 1ST AND 2ND     //
    // PNTS. SECOND COL, L-S SLOPE APPROX BETWEEN 1ST THROUGH 3RD POINTS. 
    // THIRD COL, ..., szP-1TH COL, L-S SLOPE APPROX BETWEEN 1ST THROUGH      //
    // szPTH POINT. SAME IDEA FOR SECOND ROW OF sol, BUT WITH Y-INT APPROX.   //
    // TODO : For PrimeLine2, go backwards as described in your board. ADD    //
    // TODO : CORRECT NOTES LATER!                                            //
    // TODO : DOES ADDING THAT INFORMATION MAKE THE APPROXIMATION BETTER?     //
    // TODO : WHAT CHANGES? IS IT USEFUL BY ITSELF AND/OR WITH THE PREVIOUS   //
    // TODO : APPROXIMATIONS?                                                 //
    for ii = 2:szP
        A = [x(1:ii) ones(ii, 1)];
        tA = A';
        B = tA*A;
        sol(1:$, ii-1) = inv(B)*tA*prmNums(1:ii);
    end
    
    // 
    plot(sol(1, 1:$));
    figure
    plot(sol(2, 1:$));
    
endfunction
//----------------------------------------------------------------------------//
//----------------------------------------------------------------------------//
