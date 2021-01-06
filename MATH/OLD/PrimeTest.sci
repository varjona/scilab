
//----------------------------------------------------------------------------//
// PrimeTest PLOTS THE TIME IT TOOK FOR BOTH OF THE PRIME GENERATORS TO FIND  //
// THE PRIMES IN THEIR RESPECTIVE BLOCK.                                      //
function primeTime = PrimeTest(n, skip)
    // SINCE WE WANT TO TEST HOW FAST THESE ALGORITHMS ARE IN CONTRAST TO     //
    // THEMSELVES, WE NEED AN ARRAY THAT INPUTS THE "up to" NUMBER IN EACH    //
    // PrimeGen PROGRAM.                                                      //
    
    // HOW MANY TIMES DOES skip FIT FROM 2 TO n?                              //
    if modulo(n-2, skip) == 0 then
        impNum = floor((n-2)/skip);
    else
        impNum = floor((n-2)/skip)+1;
    end
    
    // GENERATE THE upTo ARRAY. THIS WILL ALSO SERVE AS OUR x-axis VALUES.    //
    start = 2;
    upTo = zeros(impNum+1, 1); upTo(1) = start; upTo(impNum+1) = n;
    for ii = 2:impNum
        start = start + skip;
        upTo(ii) = start;
    end
    
    // GENERATE THE TIME COLLECTOR.                                           //
    primeTime = zeros(impNum + 1, 2);
    
    // START COLLECTING TIMES.                                                //
    for kk = 1:length(upTo)
        N = upTo(kk);
        
        // FIRST FOR THE OLD VERSION.                                         //
        timer();
        PrimeGenOLD(N);
        primeTime(kk,1) = timer();
        
        // THEN FOR THE OPTIMIZED VERSION.                                    //
        timer();
        PrimeGenOPT(N);
        primeTime(kk, 2) = timer();
    end
    
    // PLOT THESE SUCKAS.                                                     //
    plot(upTo, primeTime);
    xgrid;
    legend('Crappy PrimeGen','Optimized PrimeGen');
    
endfunction
//----------------------------------------------------------------------------//
//----------------------------------------------------------------------------//

