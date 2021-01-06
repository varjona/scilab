// MORE INFORMATION ON:                                                       //
// https://en.wikipedia.org/wiki/Sorting_algorithm#Popular_sorting_algorithms //
//----------------------------------------------------------------------------//

//----------------------------------------------------------------------------//
// INSERTION SORT                                                             //
function xToSort = InsertionSortALPHA(xToSort)
    // MAKE SURE THERE ARE AT LEAST 2 ELEMENTS IN THE ARRAY TO SORT. THE      //
    // ARRAY HAS TO BE 1xN OR Nx1, WHERE N >= 2.                              //
    // SIZE OF ARRAY IN QUESTION.
    szX = size(xToSort);
    // DISCARD IF IT IS EMPTY, 1x1, OR MULTIDIMENSIONAL                       //
    if min(szX) ~= 1 | size(szX, 1) ~= 1 then
        disp('I isn''t stupid.');
        abort;
    end

    // LET'S SAY WE'RE GOOD. TAKE THE LENGTH OF THE ARRAY.                    //
    szX = max(szX);

    // CREATE USEFUL PARAMETERS:                                              //

    // THIS BOOLEAN TURNS TRUE WHEN WE HAVE MADE A SWAP. INITIATED TO         //
    // TRUE BECAUSE WE'RE ASSUMING SWAPS WILL BE MADE.                        //
    swpBool = %T;

    // BEGIN SORTING!                                                         //
    while swpBool == %T
        // THIS COUNTER IS USED TO COUNT HOW MANY SWAPS WERE MADE, AND IT IS  //
        // USED TO CHANGE swpBool IN THE CASE THAT THERE HAS BEEN AT LEAST    //
        // ONE SWAP.
        swpCnt = 0;
        for ii = 1:szX-1
            if xToSort(ii) > xToSort(ii+1)
                // SWAP!                                                      //
                daKeeper = xToSort(ii);
                xToSort(ii) = xToSort(ii+1);
                xToSort(ii+1) = daKeeper;

                // WE SWAPPED! UPDATE swpCnt!                                 //
                swpCnt = swpCnt+1;
            end
        end
        // WAS THERE A SWAP? THEN CHANGE swpBool!                             //
        if swpCnt > 1
            swpBool = %T;
        else
            swpBool = %F;
        end
    end

endfunction
//----------------------------------------------------------------------------//
//----------------------------------------------------------------------------//

//----------------------------------------------------------------------------//
// MODIFIED VERSION OF InsertionSortALPHA. THIS ONE GOES BACK AND FORWARD     //
// UNTIL SORTING IS DONE. WILL IT BE FASTER? LET'S SEE...                     //
// FYI, IT IS FASTER THAN REGULAR InsertionSort! THOUGH STILL O(n^2).         //
function xToSort = InsertionSortBETA(xToSort)
    // MAKE SURE THERE ARE AT LEAST 2 ELEMENTS IN THE ARRAY TO SORT. THE      //
    // ARRAY HAS TO BE 1xN OR Nx1, WHERE N >= 2.                              //
    // SIZE OF ARRAY IN QUESTION.
    szX = size(xToSort);
    // DISCARD IF IT IS EMPTY, 1x1, OR MULTIDIMENSIONAL                       //
    if min(szX) ~= 1 | size(szX, 1) ~= 1 then
        disp('I isn''t stupid.');
        abort;
    end
    // LET'S SAY WE'RE GOOD. TAKE THE LENGTH OF THE ARRAY.                    //
    szX = max(szX);
    // START SETTING UP USEFUL PARAMETERS.                                    //
    // THIS BOOLEAN TURNS TRUE WHEN WE HAVE MADE A SWAP. INITIATED TO         //
    // TRUE BECAUSE WE'RE ASSUMING SWAPS WILL BE MADE.                        //
    swpBool = %T;
    // SAY WE'RE SMALLER THAN 4 ELEMENTS... JUST DO INSERTION SORT.           //
    if szX < 4 then
        while swpBool == %T
            // THIS COUNTER IS USED TO COUNT HOW MANY SWAPS WERE MADE, AND    //
            // IT IS USED TO CHANGE swpBool IN THE CASE THAT THERE HAS BEEN   //
            // AT LEAST ONE SWAP.                                             //
            swpCnt = 0;
            for ii = 1:szX-1
                if xToSort(ii) > xToSort(ii+1)
                    // SWAP!                                                  //
                    daKeeper = xToSort(ii);
                    xToSort(ii) = xToSort(ii+1);
                    xToSort(ii+1) = daKeeper;
                    // WE SWAPPED! UPDATE swpCnt!                             //
                    swpCnt = swpCnt+1;
                end
            end
            // WAS THERE A SWAP? THEN CHANGE swpBool!                         //
            if swpCnt > 1
                swpBool = %T;
            else
                swpBool = %F;
            end
        end
    else
        while swpBool == %T
            // THIS COUNTER IS USED TO COUNT HOW MANY SWAPS WERE MADE, AND    //
            // IT IS USED TO CHANGE swpBool IN THE CASE THAT THERE HAS BEEN   //
            // AT LEAST ONE SWAP.                                             //
            swpCnt = 0;
            for ii = 1:szX-1
                if xToSort(ii) > xToSort(ii+1)
                    // SWAP!                                                  //
                    daKeeper = xToSort(ii);
                    xToSort(ii) = xToSort(ii+1);
                    xToSort(ii+1) = daKeeper;
                    // WE SWAPPED! UPDATE swpCnt!                             //
                    swpCnt = swpCnt+1;
                end
            end
            for ii = szX:-1:2
                if xToSort(ii) < xToSort(ii-1)
                    // SWAP!                                                  //
                    daKeeper = xToSort(ii);
                    xToSort(ii) = xToSort(ii-1);
                    xToSort(ii-1) = daKeeper;
                    // WE SWAPPED! UPDATE swpCnt!                             //
                    swpCnt = swpCnt+1;
                end
            end
            // WAS THERE NO SWAP? THEN CHANGE swpBool!                        //
            if swpCnt == 0
                swpBool = %F;
            end
        end
    end
endfunction
//----------------------------------------------------------------------------//
//----------------------------------------------------------------------------//

//----------------------------------------------------------------------------//
// MergeSort PLAYS THE "DIVIDE AND CONQUER" GAME BY SPLITTING THE LIST UP,    //
// SORTING IT, THEN SORTING SEVERAL SMALL SORTED GROUPS OVER AND OVER.        //
function xToSort = MergeSort(xToSort)
    // MAKE SURE THERE ARE AT LEAST 2 ELEMENTS IN THE ARRAY TO SORT. THE      //
    // ARRAY HAS TO BE 1xN OR Nx1, WHERE N >= 2.                              //

    // SIZE OF ARRAY IN QUESTION.                                             //
    szX = size(xToSort);

    // DISCARD IF IT IS EMPTY, 1x1, OR MULTIDIMENSIONAL.                      //
    if min(szX) ~= 1 | size(szX, 1) ~= 1 then
        disp('I isn''t stupid.');
        abort;
    end

    // RECORD THE SIZE OF THE ARRAY.                                          //
    szX = max(szX);

    // DEPENDING ON WHETHER THE ARRAY IS EVEN OR ODD, SORT OUT IN PARIS.      //
    // IF ODD, LEAVE LAST ONE ALONE. THIS IS THE PRELIMINARY SORT.            //
    // TODO : MAYBE MAKE THE LAST GROUP A GROUP OF 3?                         //
    // MIGHT NOT BE WORTH DOING THE LAST ONE A GROUP OF 3... KEEP IT NORMAL.  //
    if modulo(szX, 2) == 1 then
        pairs = szX - 1;
        // RECORD WHETHER THE LIST IS EVEN OR NOT!                            //
        evenBool = %F;
    else
        pairs = szX;
        // RECORD WHETHER THE LIST IS EVEN OR NOT!                            //
        evenBool = %T;
    end

    // DO PRELEMINARY SORT!                                                   //
    for ii = 1:2:pairs
        if xToSort(ii) > xToSort(ii+1) then
            keeper = xToSort(ii);
            xToSort(ii) = xToSort(ii+1);
            xToSort(ii+1) = keeper;
        end
    end

    //------------------------------------------------------------------------//
    // SortSortedLists DOES EXACTLY WHAT IT IMPLIES... IT SORTS LISTS THAT    //
    // HAVE ALREADY BEEN SORTED. THIS IS TO BE USED IN CONJUNCTION WITH       //
    // MergeSort.                                                             //
    function lstC = SortSortedLists1(lstA, lstB)
        // GET EVERYONE'S SIZE!                                               //
        szA = length(lstA); szB = length(lstB)
        szC = szA + szB;

        // CREATE THE CONTAINER WHERE OUR NEW LIST WILL COME OUT.             //
        lstC = zeros(1, szC);

        // SET A LIMIT FOR THESE GUYS.                                        //
        lim = min(szA, szB);

        // START SORTING!                                                     //
        // TODO : MODIFY WITHOUT HAVING TO UPDATE LISTS!                      //
        cc = 1;
        while isempty(lstA) == %F & isempty(lstB) == %F
            if lstA(1)< lstB(1) then
                lstC(cc) = lstA(1);
                lstA = lstA(2:$);
            else
                lstC(cc) = lstB(1);
                lstB = lstB(2:$);
            end
            cc = cc + 1;
        end

        if isempty(lstA) then
            lstC(cc:$) = lstB;
        else
            lstC(cc:$) = lstA;
        end

    endfunction
    //------------------------------------------------------------------------//
    //------------------------------------------------------------------------//

    // NOW SORT BY GROUPING!                                                  //
    // HOW MANY GROUPS DO WE HAVE?                                        //
    lftOvrGrps = ceil(szX/2);
    base = 2;

    // WHILE WE HAVE MORE THAN TWO LEFT OVER GROUPS, KEEP SORTING.        //
    while lftOverGrps >=2
        if evenBool == %T then
        end
    end

endfunction
//----------------------------------------------------------------------------//
//----------------------------------------------------------------------------//

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
