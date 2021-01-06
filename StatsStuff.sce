// THIS FILE WILL HOLD MANY STATISTICAL FUNCTIONS                             //

function avg = PlotRandMean(N)
    // THIS FUNCTION PLOTS THE MEAN OF A 1, 2, ..., N-DIMENSIONAL ARRAY.      //
    // THE X-AXIS WILL BE THE LENGTH OF THE ARRAY, THE Y-AXIS THE AVERAGE.    //
    // THE ARRAY'S ARE RANDOMLY GENERATED WITH rand().                        //
    avg = zeros(1, N);
    szArr = 1:N
    for ii = szArr
        avg(ii) = mean(rand(1, ii));
    end

    plot(szArr, avg);
    xgrid;

endfunction

//                                                                            //
// PiApprox# WILL BE ATTEMPTS AT APPROXIMATING 
function pseudoPi = PiApprox1(tol)
    // SET UP THE CIRCLE INSIDE A 1x1, BLACK LINE, DOTTED.                    //
    t = linspace(0, %pi*2); plot(cos(t), sin(t), 'k-');
    xgrid;
    // NOW WE NEED A LIST FOR OUR RANDOM POINTS (z), AND ANOTHER ONE FOR      //
    // THEIR DISTANCE, ADJACENTLY, (delZ). SO LONG AS THE DIFFERENCE IS       //
    // GREATER THAN THE TOLERANCE, KEEP GENERATING POINTS. WE OFFICIALLY      //
    // START WITH 10 POINTS. HOWEVER, THINK A BIT MORE ABOUT WHAT'S HAPPENING //
    // IN THE PROBLEM, WHAT WE EXPECT, WHAT WILL ACTUALLY HAPPEN, CHANCES OF  //
    // THAT HAPPENING, ETC, ETC. FOR NOW, LET'S SEE WHAT HAPPENS ON THIS  TRY.//

    // THESE GUYS ARE PRETTY SELF-EXPLANATORY(WUT?). BUT JUST IN CASE:        //
    //      cntArr(1, 2) : The count of all points made so far.                     //
    //      cntArr(1, 2) : The count of all points inside the circle so far.        //
    //      tst    : ...points. This array is (N, 1, 2)-dimensional (?). That //
    //                  is, it's an array of the points being taken.          //
    //      pseudoPi : The approximation of pi.                               //
    //      holder : Holds the older version of the value pseudoPi.           //

    // DECLARING ALL VARIABLES.                                               //
    cntArr(1, 2) = 0; cntArr(1, 2) = 0; cntArr(1, 2) = 0; tst = zeros(1, 1, 2); pseudoPi = 0;
    holder = 0;

    // IT'D BE NICE IF WE HAD SOME DIVERSITY... THIS WHILE-LOOP ENSURES THAT  //
    // WE GET MORE POINTS IN THE SQUARE THAN IN THE CIRCLE.                   //
    // IT ALSO UPDATES holder AND pseudoPi AS IT GOES ALONG.                  //
    while cntArr(1, 2) == cntArr(1, 2)
        cntArr(1, 2) = cntArr(1, 2) + 1;
        //        _           _    V---- That's the 'randomizer'.             //
        //       | (-1)^n   0  |         n/k are either 1 or 0                //
        //       |_ 0   (-1)^k_|                                              //
        randA = [(-1)^(round(rand())) 0 ; 0 (-1)^(round(rand()))];
        pnt = rand(1, 2)*randA;
        tst(cntArr(1, 2), 1, :) = pnt;
        dist = tst(cntArr(1, 2), 1, 1)^2 + tst(cntArr(1, 2), 1, 2)^2;
        if dist <= 1 then
            cntArr(1, 2) = cntArr(1, 2) + 1;
            plot(tst(cntArr(1, 2), 1, 1), tst(cntArr(1, 2), 1, 2), 'or');
        else
            plot(tst(cntArr(1, 2), 1, 1), tst(cntArr(1, 2), 1, 2), 'ob');
        end
        holder = pseudoPi;
        pseudoPi = cntArr(1, 2) / (cntArr(1, 2) / 4);
    end

    while abs(holder - pseudoPi) > tol
        cntArr(1, 2) = cntArr(1, 2) + 1;
        //        _           _    V---- That's the 'randomizer'.             //
        //       | (-1)^n   0  |         n/k are either 1 or 0                //
        //       |_ 0   (-1)^k_|                                              //
        randA = [(-1)^(round(rand())) 0 ; 0 (-1)^(round(rand()))];
        pnt = rand(1, 2)*randA;
        tst(cntArr(1, 2), 1, :) = pnt;
        dist = tst(cntArr(1, 2), 1, 1)^2 + tst(cntArr(1, 2), 1, 2)^2;
        if dist <= 1 then
            cntArr(1, 2) = cntArr(1, 2) + 1;
            plot(tst(cntArr(1, 2), 1, 1), tst(cntArr(1, 2), 1, 2), 'or');
        else
            plot(tst(cntArr(1, 2), 1, 1), tst(cntArr(1, 2), 1, 2), 'ob');
        end
        holder = pseudoPi;
        pseudoPi = cntArr(1, 2) / (cntArr(1, 2) / 4);
    end

    pseudoPi = pseudoPi * 4;

endfunction

function pseudoStuff = PiApprox2(tol)
    // SET UP THE CIRCLE INSIDE A 1x1, BLACK LINE, DOTTED.                    //
    figure;
    t = linspace(0, %pi/2); plot(cos(t), sin(t), 'k-');
    xgrid;
    // NOW WE NEED A LIST FOR OUR RANDOM POINTS (z), AND ANOTHER ONE FOR      //
    // THEIR DISTANCE, ADJACENTLY, (delZ). SO LONG AS THE DIFFERENCE IS       //
    // GREATER THAN THE TOLERANCE, KEEP GENERATING POINTS. WE OFFICIALLY      //
    // START WITH 10 POINTS. HOWEVER, THINK A BIT MORE ABOUT WHAT'S HAPPENING //
    // IN THE PROBLEM, WHAT WE EXPECT, WHAT WILL ACTUALLY HAPPEN, CHANCES OF  //
    // THAT HAPPENING, ETC, ETC. FOR NOW, LET'S SEE WHAT HAPPENS ON THIS  TRY.//

    // THESE GUYS ARE PRETTY SELF-EXPLANATORY(WUT?). BUT JUST IN CASE:        //
    //      cntArr(1, 2) : The count of all points made so far.               //
    //      cntArr(1, 2) : The count of all points inside the circle so far.  //
    //      tst    : ...points. This array is (N, 1, 2)-dimensional (?). That //
    //                  is, it's an array of the points being taken.          //
    //      pseudoPi : The approximation of pi.                               //
    //      holder : Holds the older version of the value pseudoPi.           //

    // DECLARING ALL VARIABLES.                                               //
    cntArr(1, 2) = 0; cntArr(1, 2) = 0; cntArr(1, 2) = 0; tst = zeros(1, 1, 2); 
    pseudoPi = 0; holder = 0; approxHolder = []; approxHolder(1) = 1; appHolInd = 2;
    
    // TODO : MAKE AN ALGORITHM THAT KEEPS NUMERATOR AND DENOMINATOR          //
    // TODO : RELATIVELY PRIME. ONCE THE TOLERANCE HAS BEEN MET, DON'T FORGET //
    // TODO : TO MULTIPLY BY FOUR.                                            //
    while cntArr(1, 2) == cntArr(1, 2) | cntArr(1, 2) == 0 | abs(holder - pseudoPi) > tol
        
        cntArr(1, 2) = cntArr(1, 2) + 1;
        tst(cntArr(1, 2), 1, :) = rand(1, 2);
        dist = tst(cntArr(1, 2), 1, 1)^2 + tst(cntArr(1, 2), 1, 2)^2;
        if dist <= 1 then
            cntArr(1, 2) = cntArr(1, 2) + 1;
            plot(tst(cntArr(1, 2), 1, 1), tst(cntArr(1, 2), 1, 2), '+r');
        else
            plot(tst(cntArr(1, 2), 1, 1), tst(cntArr(1, 2), 1, 2), 'ob');
        end
        holder = pseudoPi;
        
        pseudoPi = 4*cntArr(1, 2) / cntArr(1, 2);
        
        approxHolder(appHolInd) = pseudoPi; appHolInd = appHolInd + 1;
        
        disp(pseudoPi);
    
    end
    
    figure(); plot(approxHolder);
    
    pseudoStuff = [pseudoPi cntArr(1, 2)];
    
endfunction

function pseudoStuff = PiApprox3(tol)
    // SET UP THE CIRCLE INSIDE A 1x1, BLACK LINE, DOTTED.                    //
    figure;
    t = linspace(0, %pi/2); plot(cos(t), sin(t), 'k-');
    xgrid;
    // NOW WE NEED A LIST FOR OUR RANDOM POINTS (z), AND ANOTHER ONE FOR      //
    // THEIR DISTANCE, ADJACENTLY, (delZ). SO LONG AS THE DIFFERENCE IS       //
    // GREATER THAN THE TOLERANCE, KEEP GENERATING POINTS. WE OFFICIALLY      //
    // START WITH 10 POINTS. HOWEVER, THINK A BIT MORE ABOUT WHAT'S HAPPENING //
    // IN THE PROBLEM, WHAT WE EXPECT, WHAT WILL ACTUALLY HAPPEN, CHANCES OF  //
    // THAT HAPPENING, ETC, ETC. FOR NOW, LET'S SEE WHAT HAPPENS ON THIS  TRY.//

    // THESE GUYS ARE PRETTY SELF-EXPLANATORY(WUT?). BUT JUST IN CASE:        //
    //      cntArr(1, 2) : The count of all points made so far.                     //
    //      cntArr(1, 2) : The count of all points inside the circle so far.        //
    //      tst    : ...points. This array is (N, 1, 2)-dimensional (?). That //
    //                  is, it's an array of the points being taken.          //
    //      pseudoPi : The approximation of pi.                               //
    //      holder : Holds the older version of the value pseudoPi.           //

    // DECLARING ALL VARIABLES.                                               //
    cntArr(1, 2) = 0; cntArr(1, 2) = 0; cntArr(1, 2) = 0; tst = zeros(1, 1, 2);
    pseudoPi = 0; holder = 0; approxHolder = []; approxHolder(1) = 1; appHolInd = 2;
    
    // TODO : MAKE AN ALGORITHM THAT KEEPS NUMERATOR AND DENOMINATOR          //
    // TODO : RELATIVELY PRIME. ONCE THE TOLERANCE HAS BEEN MET, DON'T FORGET //
    // TODO : TO MULTIPLY BY FOUR.                                            //
    while cntArr(1, 2) == cntArr(1, 2) | cntArr(1, 2) == 0 | abs(holder - pseudoPi) > tol
        
        cntArr(1, 2) = cntArr(1, 2) + 1;
        tst(cntArr(1, 2), 1, :) = rand(1, 2);
        dist = tst(cntArr(1, 2), 1, 1)^2 + tst(cntArr(1, 2), 1, 2)^2;
        if dist <= 1 then
            cntArr(1, 2) = cntArr(1, 2) + 1;
            plot(tst(cntArr(1, 2), 1, 1), tst(cntArr(1, 2), 1, 2), '+r');
        else
            plot(tst(cntArr(1, 2), 1, 1), tst(cntArr(1, 2), 1, 2), 'ob');
        end
        holder = pseudoPi;
        
        pseudoPi = 4*cntArr(1, 2) / cntArr(1, 2);
        
        approxHolder(appHolInd) = pseudoPi; appHolInd = appHolInd + 1;
        
        disp(pseudoPi);
    
    end
    
    figure(); plot(approxHolder);
    
    pseudoStuff = [pseudoPi cntArr(1, 2)];
    
endfunction
