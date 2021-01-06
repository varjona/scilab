//----------------------------------------------------------------------------//
// MergeSort PLAYS THE "DIVIDE AND CONQUER" GAME BY SPLITTING THE LIST UP,    //
// SORTING IT, THEN SORTING SEVERAL SMALL SORTED GROUPS OVER AND OVER.        //
function xToSort = MergeSort1(xToSort)
    // MAKE SURE THERE ARE AT LEAST 2 ELEMENTS IN THE ARRAY TO SORT. THE      //
    // ARRAY HAS TO BE 1xN OR Nx1, WHERE N >= 2.                              //
    
    // SIZE OF ARRAY.                                                         //
    szX = size(xToSort);
    
    // DISCARD IF IT IS EMPTY, 1x1, OR MULTIDIMENSIONAL.                      //
    if min(szX) ~= 1 | size(szX, 1) ~= 1 then
        disp('I isn''t stupid.');
        abort;
    end
    
    // RECORD THE SIZE OF THE ARRAY.                                          //
    szX = max(szX);
    
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
    
    // FIRST, WE'RE STARTING WITH EACH LIST BEING OF LENGTH 1.                //
    // AND ALSO WHAT THE LENGTH OF A PAIR OF ADJACENT LISTS WOULD BE.         //
    lstSz = 1;
    probSz = 2*lstSz;
    
    // HOW MANY PAIRS OF PROBLEMS DO WE HAVE? THAT IS, WE NEED AT LEAST A     //
    // PAIR, EACH WITH A LENGTH OF lstSz. OTHERWISE, WE CAN'T DO THIS.       //
    // TODO : WILL ELABORATE MORE IN THE FUTURE.                              //
    while probSz <= szX
        // NOW WE CAN THINK OF WHAT TO DO ASSUMING WE HAVE AT LEAST 1 PAIR    //
        // OF LISTS WITH EACH WITH A LENGTH OF lstSz.                        //
        // GET THE SUBSECTION THAT CONTAIN BOTH LISTS.                        //
        // NOW, GO THROUGH EACH PAIR!                                         //
        
        for ii = 1:probSz:szX
            // CONCENTRATE ON THAT CHUNK KNOWING.                             //
            chunk = xToSort(ii:ii + probSz);
            
            lstA = chunk(1:lstSz);
            lstB = chunk(lstSz + 1:$)
            
            // EACH CHUNK
            xToSort(ii:ii + lstSz) = SortSortedLists1(lstA, lstB);
        end
        
        // WHAT IF THERE WERE LEFTOVERS?                                      //
         mod = modulo(probSz, szX);
        if mod ~= 0 then
            
            
        else
            
        end
            
        end
    end
    
endfunction
