//----------------------------------------------------------------------------//
// PLOT CPU TIME IT TAKES FOR "F" TO SORT THE DAMN THING.                     //
// TODO : REDO SortTest TO TAKE IN AS MANY FUNCTIONS AS WE WANT!              //
function [timeCnt1, timeCnt2] = SortTest(F1, F2, N, skip, varargin) // REWRITE!                    //
    // IF N < 2 THEN DON'T EVEN BOTHER.                                       //
    if N < 2
        disp('Too small of an N, dummy.');
        abort;
    end

    // MAKE AN ARRAY THAT CONTAINS THE NUMBER THAT REPRESENTS THE NUMBER OF   //
    // RANDOMLY GENERATED NUMBERS... EXCUSE THE REDUNDANCIES.                 //
    if modulo(N-2, skip) == 0 then
        impNum = floor((N-2)/skip);
    else
        impNum = floor((N-2)/skip)+1;
    end

    start = 2;
    ranNums = zeros(1, impNum+1); ranNums(1) = start; ranNums(impNum+1) = N
    for ii = 2:impNum
        start = start + skip;
        ranNums(ii) = start;
    end

    // MAKE AN ARRAY TO COLLECT TIME IT TOOK TO PROCESS THE SORTING.          //
    timeCnt1 = zeros(impNum+1, 2);
    timeCnt2 = zeros(impNum+1, 2);

    // START COLLECTING THE TIME IT TOOK!                                     //
    for kk = 1:length(ranNums)
        timer();
        F1(rand(1, ranNums(kk)));
        timeCnt1(1, kk) = timer();

        timer();
        F2(rand(1, ranNums(kk)));
        timeCnt(2, kk) = timer();
    end

    // PLOT THE DAMN THING.                                                   //
    plot(ranNums', [timeCnt1, timeCnt2]);
    xgrid;
    xlabel('Number of elements to sort', 'fontsize', 3);
    ylabel('Time it took to sort', 'fontsize', 3);
    
//    for ii = 1:impNum
//        plot( [ranNums(ii) ranNums(ii)] , [0 timeCnt(ii)], 'r')
//    end

endfunction
//----------------------------------------------------------------------------//
//----------------------------------------------------------------------------//
