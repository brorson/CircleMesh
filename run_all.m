function run_all()
  % This just runs both integration methods.
    
  % First run box counting repeatedly to create multiple
  % plots
  N = 50;  % Number of full sweeps to average.
  slope_box = 0;
  fprintf('=============  Box counting  =============\n')
  for i=1:N
    s = test_integrate_circle_box_count();
    slope_box = slope_box+s;
  end
  slope_box = slope_box/N;
  
  % Now do triangle integration.  Since this test algo is
  % deterministic I only need to test once.
  fprintf('=============  Integrate over triangular mesh  =============\n')  
  slope_tri = test_integrate_circle_triangle();
  
  fprintf('=============  Results  =============\n')    
  fprintf('Average slope from box counting = %f \n', slope_box)
  fprintf('Slope from integrating triangles = %f \n', slope_tri)
  
end
