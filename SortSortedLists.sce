//----------------------------------------------------------------------------//
// THIS FUNCTION TAKES IN TWO SORTED LISTS AND SORTS THEM AS WELL. SO, IF THE //
// SIZE OF THE FIRST LIST IS N AND THE OTHER IS M THE NEW LIST WILL BE OF     //
// SIZE N+M.                                                                  //
function lstC = SortSortedLists1(lstA, lstB)
    // GET EVERYONE'S SIZE!                                                   //
    szA = length(lstA); szB = length(lstB)
    szC = szA + szB;

    // CREATE THE CONTAINER WHERE OUR NEW LIST WILL COME OUT.                 //
    lstC = zeros(1, szC);

    // SET A LIMIT FOR THESE GUYS.                                            //
    lim = min(szA, szB);

    // START SORTING!                                                         //
    // TODO : MODIFY WITHOUT HAVING TO UPDATE LISTS!                          //
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
//----------------------------------------------------------------------------//

//----------------------------------------------------------------------------//
// THIS FUNCTION TAKES IN TWO SORTED LISTS AND SORTS THEM AS WELL. SO, IF THE //
// SIZE OF THE FIRST LIST IS N AND THE OTHER IS M THE NEW LIST WILL BE OF     //
// SIZE N+M.                                                                  //
function lstC = SortSortedLists2(lstA, lstB)
    // GET EVERYONE'S SIZE!                                                   //
    szA = length(lstA); szB = length(lstB)
    szC = szA + szB;

    // CREATE THE CONTAINER WHERE OUR NEW LIST WILL COME OUT.                 //
    lstC = zeros(1, szC);

    // SET A LIMIT FOR THESE GUYS.                                            //
    lim = min(szA, szB);
    uLim = max(szA, szB);
    // START SORTING!                                                         //
    // TODO : MODIFY WITHOUT HAVING TO UPDATE LISTS!                          //
    cc = 1; aa = 1; bb = 1;
    while aa <= lim & bb <= lim
        if lstA(aa) < lstB(bb) then
            lstC(cc) = lstA(aa)
            aa = aa + 1;
        else
            lstC(cc) = lstB(bb);
            bb = bb + 1
        end
        cc = cc + 1;
    end
    
    if aa > lim then
        lstC(cc:$) = lstB(bb:$)
    else
        lstC(cc:$) = lstA(aa:$)
    end
    
endfunction
//----------------------------------------------------------------------------//
