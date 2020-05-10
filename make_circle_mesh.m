function [P,T] = make_circle_mesh(L)
  % This fcn returns a mesh made with L rings of triangles
    
  % Start with point at center.
%  fprintf('Building ring %d ...\n', 0)      
  r = 0;    % Radius of circle.
  off = 1;  % Offset
  x = 0;
  y = 0;
  P(off, 1) = x;
  P(off, 2) = y;
  
  %------------------------------------------------------  
  % Next ring of radius 1 -- hexagon.
%  fprintf('Building ring %d ...\n', 1)  
  r=r+1;  % Radius of ring
  N=6;  % Number of pts on ring
  for i = 0:N-1
    x = r*cos(2*pi*i/N);
    y = r*sin(2*pi*i/N);
    off = off+1;
    P(off, 1) = x;
    P(off, 2) = y;
  end
  
  
  %------------------------------------------------------
  % Now make general ring which is one larger in radius than last ring.
  % Do this L-2 times
  for j = 2:L
%    fprintf('Building ring %d ...\n', j)
    rold = r;
    r = r+1;
    
    % Plan how many pts to put on ring.
    Circold = 2*pi*rold;
    Circ = 2*pi*r;
    N = ceil(N*Circ/Circold);
    
    % Now put points onto ring.
    % This version is vectorized
    t = linspace(0, 2*pi*(N-1)/N, N)';
    x = r*cos(t);
    y = r*sin(t);
    P(off:(off+N-1), 1) = x;
    P(off:(off+N-1), 2) = y;
    off = off+N;
    
    % This version is not vectorized
%    for i = 0:N-1
%      x = r*cos(2*pi*i/N);
%      y = r*sin(2*pi*i/N);
%      off = off+1;
%      P(off, 1) = x;
%      P(off, 2) = y;
%    end
  
  end
  
  % Now divide P by r so we have a unit circle
  P = P/r;
  
  % Use Delaunay to do triangulation of points.
%  fprintf('Doing delaunay....\n')
  T = delaunay(P(:,1), P(:,2));
%  triplot(T, P(:,1), P(:,2))
%  hold on
%  axis equal
  
end
