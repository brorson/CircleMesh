function slope = test_integrate_circle_triangle()

  % Number of circle rings (layers) to test
  Ls = [3, 5, 10, 20, 50, 100, 200, 500, 1000];
  R = 1;           % Circle of radius R.
  Atrue = pi*R*R;   % True area.
 
  % Error vector
  E = zeros(size(Ls));
 
  % Return vector
  Acomp = zeros(length(Ls), 1);
  
  for i = 1:length(Ls);
    L = Ls(i);

    % Get mesh
    [P, T] = make_circle_mesh(L);

    Acomp = integrate_circle_triangle(P, T);   
    relerr = (Acomp - Atrue)/Atrue;
    fprintf('L = %d, Acomputed = %f, Atrue = %f, relerr =%e\n', L, Acomp, Atrue, relerr)
    E(i) = abs(relerr);
  end

  loglog(Ls, E, 'rx')
  hold on
  xlabel('Inverse element scale factor')
  ylabel('Relative error')
  
  pp = polyfit(log(Ls), log(E), 1);
  slope = pp(1);
  fprintf('--->  Rel error scales as N^p with p = %f\n', slope)

  
end

