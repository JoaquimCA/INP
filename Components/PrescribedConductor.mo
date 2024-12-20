within INP.Components;

model PrescribedConductor "Lumped thermal element transporting heat without storing it"
  Units.NonSI.ParticleFlow P_flow "Particle flow rate from port_a -> port_b";
  Units.NonSI.ConcentrationDifference dN "port_a.C - port_b.C";
  parameter Units.NonSI.ParticleConductance Q "Maximum particle conductance between spaces";
  Interfaces.NPort_a port_a annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-110, -10}, {-90, 10}}, rotation = 0), iconTransformation(origin = {0, 0}, extent = {{-110, -10}, {-90, 10}}, rotation = 0)));
  Interfaces.NPort_b port_b annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{90, -10}, {110, 10}}, rotation = 0), iconTransformation(origin = {0, 0}, extent = {{90, -10}, {110, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput Qprop "Ventilation use between 0 and 1" annotation(
    Placement(visible = true, transformation(origin = {0, 90}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {0, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
equation
  dN = port_a.N - port_b.N;
  if Qprop > 0 then
    P_flow = Q*Qprop*dN;
    port_a.P_flow = P_flow;
    port_b.P_flow = -P_flow;
  else
    P_flow = 0;
    port_a.P_flow = 0;
    port_b.P_flow = 0;
  end if;
  annotation(
    Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Text(origin = {0, 22}, extent = {{-150, -80}, {150, -110}}, textString = "Q=%Q"), Ellipse(origin = {3, 44}, extent = {{-91, 94}, {91, -94}}), Line(origin = {1.13817, -0.287277}, points = {{-90, 50}, {-90, -50}}, thickness = 0.5), Rectangle(origin = {-8, 94}, fillColor = {255, 255, 255}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, extent = {{-117, 46}, {117, -46}}), Line(origin = {90.5716, -0.709597}, points = {{-90, 50}, {-90, -50}}, thickness = 0.5), Rectangle(origin = {-44, 0}, fillColor = {243, 243, 243}, pattern = LinePattern.None, fillPattern = FillPattern.HorizontalCylinder, extent = {{-45, 50}, {45, -50}}), Ellipse(origin = {-70, -4}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Ellipse(origin = {12, -2}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Ellipse(origin = {34, -10}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Ellipse(origin = {-26, -22}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Text(origin = {0, -26}, lineColor = {0, 0, 255}, extent = {{-150, 120}, {150, 80}}, textString = "%name"), Ellipse(origin = {-50, 0}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Ellipse(origin = {-60, 10}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Rectangle(origin = {79, 19}, fillColor = {255, 255, 255}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, extent = {{-18, 47}, {18, -47}}), Line(origin = {36.4, 2.6}, points = {{-36, 43}, {36, -43}}, thickness = 4)}),
    Documentation(info = "<html>
<p>
This is a model for transport of nanoparticles without storing it; see also:
<a href=\"modelica://PGNP.Components.ForcedParticleConductor\">ForcedParticleConductor</a>.
It may be used to connect two indoor air volumes. This element models the dispersion of nanoparticles without any external force (i.e. indoor air speed) and is assumed to be constant over the range of operations.
</p>
<p>
The variables of a NPort connector are the nanoparticles concentration <strong>N</strong> at the port and the nanoparticles flow rate <strong>Q_flow</strong> flowing into the component (if P_flow is positive, the particle flows into the element, otherwise it flows out of the element)
</p>
</html>"));
end PrescribedConductor;
