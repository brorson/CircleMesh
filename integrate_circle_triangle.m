function A = integrate_circle_triangle(P, T)
  % Integrate area of triangle-meshed circle.  Inputs:
  % P, T = point, triangle representation of mesh.

  % Perform integration by summing over triangles T
  A = 0;
  N = size(T, 1);
  for idx = 1:N
    % For each triangle, get the three vertices
    p1 = P(T(idx, 1), :)';
    p2 = P(T(idx, 2), :)';
    p3 = P(T(idx, 3), :)';
    % Compute area using Surveyer's Area Formula
    At = tri_area_surveyers(p1, p2, p3);
    A = A + At;
  end
  
end
