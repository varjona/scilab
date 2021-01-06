//----------------------------------------------------------------------------//
// THIS ALGORITHM APPROXIMATES THE SOLUTION TO THE FUNCTION:                  //
// z' = Az + b, WHERE z' IS AN Nx1, A IS AN NxN, AND z AND b ARE LIKE z'.     //
// WE ACCEPT A MATRIX, A, AN EXTRA VECTOR, b, AND OUR STEP, h. ULTIMATELY,    //
// WE END UP WITH SOMETHING LIKE THIS:                                        //
// z_{n+1} = (I + hA)z_{n} + h*b, z_0 = [x_0]                                 //
//                                      [y_0]                                 //
// OH, YEAH... ALSO OUR z_0 THE BOUNDS TO t. WE'RE ASSUMING x(t) AND y(t).    //
function zApprox = Approx(A, b,z0, h, lowB, upperB)
    // WE WILL NEED AN IDENTITY MATRIX THE SIZE OF A. ALSO, MIGHT AS WELL     //
    // MAKE AN hA AND hb. ALSO, WE'RE ASSUMING A IS SQUARE.                   //
    szA = length(A);
    I = eyes(szA, szA);
    hA = h*A;
    hb = h*b;
endfunction
//----------------------------------------------------------------------------//
//----------------------------------------------------------------------------//
