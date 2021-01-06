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
    else // OTHERWISE, GO ALL OUT AND USE THE BACK-N-FORWARD APPROACH!        //
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
