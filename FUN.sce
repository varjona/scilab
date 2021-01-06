function col = RandomWalk1(sP, K, N)
    A = [rand()*(-1)^round(rand()), rand()*(-1)^round(rand()); rand()*(-1)^round(rand()), rand()*(-1)^round(rand())]
    col = zeros(2, N); col(:, 1) = sP;
    for ii = 2:N
        col(:, ii) = K*rand()*A*col(:, ii-1);
    end
    
endfunction
