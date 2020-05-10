function A = tri_area_surveyers(p1, p2, p3)
  % Inputs:
  % p1, p2, p3 = vertices of triangle as 2D vectors [x, y]'
  %
  % Outputs:
  % A = computed area of triangle [p1, p2, p3]
  %
  % Area is computed using the Surveyer's triangle 
  % area formula A = (1/2)*det([ux vx; uy vy]) where
  % u = p2 - p1, and v = p3 - p1.
    
  u = p2 - p1;
  v = p3 - p1;
  S = [u(1) v(1); u(2) v(2)];
  A = abs(det(S))/2;
end

