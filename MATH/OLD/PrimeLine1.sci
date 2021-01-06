
// PrimeLine1 IS AN ATTEMPT AT IMPOSING A LINE y = mx + b, WHERE x IS A       //
// NATURAL NUMBER AND y IS THE OUTPUT SUCH THAT IT IS CLOSE TO SOME PRIME     //
// NUMBER. THUS WE TRY TO SEE THE PATTERN OF THE CHANGE OF OUR SLOPE, m, AND  //
// THE Y-INT, b. WE QUICKLY SEE AN INTERESTING PATTERN!                       //
// SO FAR, m IS A THAT COULD PROBABLY BE MODELED AS A LINEAR COMBINATION OF   //
// NATURAL LOGARITHM WITH A DEGREE ONE POLYNOMIAL ON THE INSIDE:              //
// m(n) = K*ln(P_{1}(n)) + b (??)                                             //

// Y-INT, b, COULD BE MODELED AS A LINE AS WELL, AS SHOWN IN THE GRAPH:       //
// b(n) = p*n + b                                                             //
function sol = PrimeLine1(N)
    
    // GENERATE THE PRIME NUMBERS                                             //
    prmNums = PrimeGenOPT(N)';
    
    // WHAT IS THE SIZE OF THE PRIME LIST?                                    //
    szP = length(prmNums);
    
    // GENERATE AN ARRAY FROM 1 TO THE SIZE OF THE PRIME LIST AND TRANSPOSE   //
    // IT                                                                     //
    x = 1:szP; x = x';
    
    // MAKE A COLLECTOR ARRAY MINUS ONE TO COLLECT THE SLOPE AND Y-INTs       //
    sol = zeros(2, szP-1);
    
    // GENERATE THE MATRIX TO MAKE DO GET A LEAST SQUARES SOLUTION TO THE     //
    // PROBLEM. READ BELOW.                                                   //
    // THE FIRST ROW DOES A LEAST SQUARES APPROXIMATION TO THE SLOPE. FIRST   //
    // ELEMENT IS THE LEAST SQUARES APPROX BETWEEN THE 1ST-2ND PRIME NUMBERS, //
    // SECOND ELEMENT THE L-S APPROX OF THE SLOPE FOR THE 1ST-3RD, ..., THE   //
    // nTH ELEMENT IS THE L-S APPROX BETWEEN THE 1ST-(n+1)TH ELEMENT.         //
    // SIMILARLY THE SECOND ROW IS THE APPROXIMATION FOR THE Y-INT.           //
    // TODO : For PrimeLine2, go backwards as described in your board. ADD    //
    // TODO : CORRECT NOTES LATER!                                            //
    // TODO : DOES ADDING THAT INFORMATION MAKE THE APPROXIMATION BETTER?     //
    // TODO : WHAT CHANGES? IS IT USEFUL BY ITSELF AND/OR WITH THE PREVIOUS   //
    // TODO : APPROXIMATION?                                                  //
    for ii = 2:szP
        A = [x(1:ii) ones(ii, 1)];
        tA = A';
        B = tA*A;
        sol(1:$, ii-1) = inv(B)*tA*prmNums(1:ii);
    end
    
    // PLOT EVERYTHING! ALSO, ADD LABELS AND WHATNOT                          //
    plot(sol(1, 1:$));
    figure
    plot(sol(2, 1:$));
    
endfunction
//----------------------------------------------------------------------------//
//----------------------------------------------------------------------------//