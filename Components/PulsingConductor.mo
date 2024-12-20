within INP.Components;

model PulsingConductor "Lumped thermal element transporting heat without storing it"
  Units.NonSI.ParticleFlow P_flow "Particle flow rate from port_a -> port_b";
  Units.NonSI.ConcentrationDifference dN "port_a.C - port_b.C";
  parameter Units.NonSI.ParticleConductance Q "Constant particle conductance of a space";
  Modelica.Blocks.Interfaces.BooleanInput switch "true => ventilation connected, false => isolated space" annotation(
    Placement(visible = true, transformation(origin = {0, 90}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {0, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
  Interfaces.NPort_a port_a annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-110, -10}, {-90, 10}}, rotation = 0), iconTransformation(origin = {0, 0}, extent = {{-110, -10}, {-90, 10}}, rotation = 0)));
  Interfaces.NPort_b port_b annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{90, -10}, {110, 10}}, rotation = 0), iconTransformation(origin = {0, 0}, extent = {{90, -10}, {110, 10}}, rotation = 0)));
equation
  dN = port_a.N - port_b.N;
  if switch then
    P_flow = Q*dN;
    port_a.P_flow = P_flow;
    port_b.P_flow = -P_flow;
  else
    P_flow = 0;
    port_a.P_flow = 0;
    port_b.P_flow = 0;
  end if;
  annotation(
    Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Text(origin = {0, 20}, extent = {{-150, -80}, {150, -110}}, textString = "Q=%Q"), Ellipse(origin = {3, 44}, extent = {{-91, 94}, {91, -94}}), Line(origin = {1.13817, -0.287277}, points = {{-90, 50}, {-90, -50}}, thickness = 0.5), Rectangle(origin = {-8, 96}, fillColor = {255, 255, 255}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, extent = {{-117, 48}, {117, -48}}), Line(origin = {90.5716, -0.709597}, points = {{-90, 50}, {-90, -50}}, thickness = 0.5), Rectangle(origin = {-44, 0}, fillColor = {243, 243, 243}, pattern = LinePattern.None, fillPattern = FillPattern.HorizontalCylinder, extent = {{-45, 50}, {45, -50}}), Ellipse(origin = {-70, -4}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Rectangle(origin = {48, 47}, pattern = LinePattern.None, fillPattern = FillPattern.Vertical, extent = {{-47, 3}, {47, -3}}), Ellipse(origin = {18, 6}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Ellipse(origin = {34, -10}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Ellipse(origin = {-26, -22}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Text(origin = {0, -20}, lineColor = {0, 0, 255}, extent = {{-150, 120}, {150, 80}}, textString = "%name"), Ellipse(origin = {56, 2}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Ellipse(origin = {-50, 0}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Ellipse(origin = {-60, 10}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}})}),
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
end PulsingConductor;
