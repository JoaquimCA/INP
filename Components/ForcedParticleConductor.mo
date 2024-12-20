within INP.Components;

model ForcedParticleConductor "Lumped thermal element transporting heat without storing it"
  Units.NonSI.ParticleFlow P_flow "Particle flow rate from port_a -> port_b";
  Units.NonSI.ConcentrationDifference dN "port_a.C - port_b.C";
  parameter Units.NonSI.ParticleConductance Q "Constant particle conductance of a space";
public
  Interfaces.NPort_a port_a annotation(
    Placement(transformation(extent = {{-110, -10}, {-90, 10}})));
  Interfaces.NPort_b port_b annotation(
    Placement(transformation(extent = {{90, -10}, {110, 10}})));
equation
  dN = port_a.N;
  port_a.P_flow = P_flow;
  port_b.P_flow = -P_flow;
  P_flow = Q*dN;
  annotation(
    Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(fillColor = {243, 243, 243}, pattern = LinePattern.None, fillPattern = FillPattern.HorizontalCylinder, extent = {{-90, 70}, {90, -70}}), Line(points = {{-90, 70}, {-90, -70}}, thickness = 0.5), Line(points = {{90, 70}, {90, -70}}, thickness = 0.5), Text(textColor = {0, 0, 255}, extent = {{-150, 120}, {150, 80}}, textString = "%name"), Text(extent = {{-150, -80}, {150, -110}}, textString = "G=%G"), Ellipse(origin = {56, 2}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Ellipse(origin = {42, 2}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Ellipse(origin = {34, -10}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Ellipse(origin = {-60, 10}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Ellipse(origin = {-34, -4}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Ellipse(origin = {-14, 10}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Ellipse(origin = {4, -2}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Ellipse(lineColor = {191, 0, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-40, 40}, {40, -40}}), Line(points = {{-20, -4}, {20, -4}, {0, -16}}, color = {191, 0, 0}), Line(points = {{-20, 4}, {20, 4}, {0, 14}}, color = {191, 0, 0})}),
    Documentation(info = "<html>
<p>
This is a model for transport of nanoparticles without storing it; see also:
<a href=\"modelica://PGNP.Components.ParticleConductor\">ParticleConductor</a>.
It may be used to connect two indoor air volumes. This element models the forced movement of nanoparticles due to a forced ventilation (i.e. local exhaust ventilation) and is assumed to be constant over the range of operations.
</p>
</html>"));
end ForcedParticleConductor;
