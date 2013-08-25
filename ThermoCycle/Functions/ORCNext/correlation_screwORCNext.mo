within ThermoCycle.Functions.ORCNext;
function correlation_screwORCNext
  input Real rp;
  input Real rpm;
  input Real p;
  output Real y;
protected
Real a0 = 0;
Real a1 = 0.8411;
Real a2 = 0.8345;
Real a3 = 3;
Real a4 = 3;
Real a5 = 0.02383;
Real a6 = 0.4827;
Real dydx_0 = 0.7924;
Real rpm_m = 3547;
Real shape_0 = 1.213;
Real x_0_0 = 3.079;
Real x_m_0 = 10;
Real y_m_0 = 0.592;
  Real rpm_star;
  Real rpm_star_m;
  Real p_star;
  Real r_star_p;
  Real x_0;
  Real dydx;
  Real shape;
  Real x_m;
  Real y_max;
  Real x;
  Real A;
  Real C;
  Real D;
  Real B;
  Real E;
algorithm
rpm_star :=(rpm - 3000)/3000;
rpm_star_m :=(rpm_m - 3000)/3000;
p_star :=(p/1e5 - 10)/10;
r_star_p :=(rp - 4)/4;
x_0 :=x_0_0 + a0*rpm_star;
dydx :=dydx_0 + a1*p_star - a2*rpm_star;
shape :=shape_0;
x_m :=x_m_0 - a3*p_star + a4*rpm_star;
y_max :=y_m_0 + a5*p_star - a6*(rpm_star - rpm_star_m)^2;
x :=rp;
A :=x_0;
C :=shape;
D :=y_max;
B :=dydx/(C*D);
E :=(B*(x_m - x_0) - tan(Modelica.Constants.pi/(2*C)))/(B*(x_m - x_0) - atan(B*(
    x_m - x_0)));
y := D*sin(C*atan(B*(x - A) - E*(B*(x - A) - atan(B*(x - A)))));
  annotation (smoothOrder = 1);
end correlation_screwORCNext;
