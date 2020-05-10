function slope = test_integrate_circle_box_count()
  % This fcn computes the area of a unit circle by counting the number
  % of boxes inside the circle.  It does this for increasing
  % number of boxes (i.e. progressively finer grid).
  
  % Number of boxes along each side.
  Ns = [10, 20, 30, 50, 100, 200, 300, 500, 1000];

  E = zeros(size(Ns));
  
  M = 1;   % Number of trials to run for each N
  R = 1;    % Radius of circle
  Atrue = pi*R*R;   % True area

  for i=1:length(Ns)
    N = Ns(i);  % Number of boxes to try

    % Perform average over slightly different center [x, y] values.
    Acomp = 0;
    for j = 1:M
      x0 = .45*(2*rand()-1);
      y0 = .45*(2*rand()-1);
      Atrial = integrate_circle_box_count(x0, y0, N);
      Acomp = Acomp + Atrial;    % Accumulate computed area to gather statistics.
    end

    Acomp = Acomp/M;    % Get average.
    relerr = (Acomp - Atrue)/Atrue;
    fprintf('N = %d, Acomputed = %f, Atrue = %f, relerr =%e\n', N, Acomp, Atrue, relerr)
    E(i) = abs(relerr);
  end
  
  loglog(Ns, E, 'bo')
  hold on
  xlabel('Number of boxes')
  ylabel('Relative error')
  
  pp = polyfit(log(Ns), log(E), 1);
  slope = pp(1);
  fprintf('--->  Rel error scales as N^p with p = %f\n', slope)

end
