function [sol] = LeastSquaresTest(x, y, boo)
    // This program tries to find m, b, both real numbers, such that y = mx + b
    // is a line with the least error for all of these points.
    //
    // Our inputs are x and y, both column vectors of the same size
    // representing our values for the x-axis, and y representing our
    // y values corresponding to x. boo is a boolean. If true, graphs 
    // will be generated.
    //
    // The output, sol, is a 2x2 matrix. The first row gives us the slope, m
    // and the second row gives us our b, the y-intercept. This program goes
    // about calculating these 2 sets of answers with two data manipulations.
    // The first one's the classic Least Squares approach. The second is our
    // a tester. Both give us good answers!
    //                     _      _  _ _    _  _
    // m*x1 + b = y1      | x1   1 || m |    | y1 |
    //      .             |    .   ||_b_|    | .  |      Az = y
    //      .        ==>  |    .   |      == | .  | ==>  Where A: Nx2 Matrix (1)
    //      .             |    .   |  ^      | .  |            z: 2x1 Vector (2)
    // m*xN + b = yN.     |_xN   1_|  |      |_yN_|            y: Nx1 Vector (3)
    //                        ^       |         ^
    //                        1       2         3
    // -----------------------------------------------------------------------//
    // --------------------------------TODOs----------------------------------//
    //  1 - Update definitions. "a", "b", and "c" are now gone and have been
    //      replaced with "x" and "y".
    //      DONE
    //
    
    //--------------------------------OLD-------------------------------------//
    /*
    // Generate our x values from a, b, and c. Must be a column vector!
    x = linspace(a, b, c)';
    // Make another vertical column, same size as x. This vector will hold 
    y = zeros(c, 1);
    //--------------------------------OLD-------------------------------------//
    */
    
    // Length of both x and y.s
    vLen = length(x)
    
    // Generate our column vector of 1s, for the second column of our matrix, A.
    uni = ones(vLen, 1);
    
    // Now, generate our A matrix, composed of our linspace, x, as our first
    // column, and the uni column vector as our second column. Might as well
    // generate our transpose while we're at it!
    A = [x uni]; tA = A';
    
    // Our first solution, "sol1", is generated the traditional way.
    sol1 = inv(tA*A)*tA*y;
    
    // When I thought of this I thought "this is weird", so I called the x
    // vector "weird x", thus the variable name "wX". It's just the vector x
    // backwards.
    wX = x($:-1:1);
    
    // So I had to remake the tA matrix too, and called it "trippy A". Thus,
    // "tA" remains. It is composed of "wX" and uni as the column vectors.
    tA = [wX uni]';
    
    // "sol2" contains the solution that this weird way does. And it works!
    // It'd be interesting to see when it doesn't...!
    sol2 = inv(tA*A)*tA*y;
    
    // "sol" is the output of this program. The first column is "sol1", and the
    // second column is "sol2".
    sol = [sol1 sol2];
    
    lgnd = ['GTruth', 'W/Error', 'Reg L-S', 'Weird L-S']';
    
    if boo then
        plot(x, [tru, y, sol1(1).*x + sol1(2), sol2(1).*x + sol2(2)]);
        xgrid;
    end
    
endfunction

function LeastSquaresAnalysis()
    // This program generates our x-linspace, from -2 to 15, split up
    // 50 times. The real answer is yT = 2x - 1. What we have is
    // yE = yT + e, e being some error.
    
    // x-vals
    x = linspace(-2, 15, 50)';
    
    // Vector length
    vLen = length(x)
    
    // yT
    yT = 2.*x - 1;
    
    // yE
    yE = yT + cos(%pi*rand(vLen, 1));
    
    /*
    // Plot shit out.
    plot(x, [yE, yT])
    xgrid;
    */
    
    // Containers for our regular and weird answers.
    wAns = []; rAns = [];
    
    for ii = 2:vLen
        xIn = x(1:ii);
        yIn = yE(1:ii);
        holdAns = LeastSquaresTest(xIn, yIn, %F)
        
        rAns = [rAns holdAns(:, 1)];
        wAns = [wAns holdAns(:, 2)];
    end
    
    rAns = rAns';
    wAns = wAns';
    
    ansErr = abs(rAns - wAns);
    
    disp(rAns);
    
    xV = [0:length(rAns(1,:)) - 1];
    
    figure();
    plot(xV, rAns(1, :));
    figure();
    plot(xV, wAns(1, :));

    endfunction
