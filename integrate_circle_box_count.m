function A = integrate_circle_box_count(x0, y0, N)
  % This fcn uses box counting to get the area of unit radius circle.
  % N is the number of cells to make in the x and y 
  % directions.
  % [x0, y0] are variables which offset the circle.
  % This version is non-vectorized since the vectorized
  % version can't go above 1e5 due to memory constraints.

  R = 1;  % Unit circle
    
  x = linspace(-1.5, 1.5, N);
  y = linspace(-1.5, 1.5, N);
  dx = x(2) - x(1);
  dy = y(2) - y(1);

  A = 0;         % Initialize A
  for ix = 1:N
    for iy = 1:N
      rx = x(ix)-x0;
      ry = y(iy)-y0;
      p = rx*rx + ry*ry;
      if (p*p < R*R)
        A = A + dx*dy;
      end
    end
  end

end
