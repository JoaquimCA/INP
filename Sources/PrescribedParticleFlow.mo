within INP.Sources;

model PrescribedParticleFlow "Prescribed particle flow boundary condition"
  parameter Units.NonSI.LinearConcentrationCoefficient alpha = 0 "Concentration coefficient of particle flow rate";
  Modelica.Blocks.Interfaces.RealInput P_flow(unit = "s-1") annotation(
    Placement(transformation(origin = {-100, 0}, extent = {{20, -20}, {-20, 20}}, rotation = 180)));
  Interfaces.NPort_b port annotation(
    Placement(transformation(extent = {{90, -10}, {110, 10}})));
equation
  port.P_flow = -P_flow;
  annotation(
    Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Text(lineColor = {0, 0, 255}, extent = {{-150, 100}, {150, 60}}, textString = "%name"), Line(origin = {5, 0}, points = {{-85, 0}, {85, 0}, {85, 0}}), Rectangle(origin = {10, 0}, fillPattern = FillPattern.Solid, extent = {{-70, 10}, {70, -10}}), Ellipse(origin = {-6, 18}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Ellipse(origin = {-20, 26}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Ellipse(origin = {-44, 24}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Ellipse(origin = {44, 24}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Ellipse(origin = {26, 16}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Ellipse(origin = {14, 34}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Ellipse(origin = {68, 52}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Ellipse(origin = {62, 18}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Ellipse(origin = {-58, 46}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Ellipse(origin = {48, -30}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Ellipse(origin = {24, -22}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Ellipse(origin = {0, -28}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Ellipse(origin = {-20, -18}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Ellipse(origin = {-14, -42}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Ellipse(origin = {-40, -24}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Ellipse(origin = {70, -20}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Ellipse(origin = {-70, -82}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Ellipse(origin = {12, -72}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Ellipse(origin = {70, -54}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}})}),
    Documentation(info = "<html>
<p>
This model allows a specified amount of particles flow rate to be \"injected\"
into a system at a given port.  The amount of particles
is given by the input signal P_flow into the model. The particle flows into the
component to which the component PrescribedParticleFlow is connected,
if the input signal is positive.
</p>
</html>"),
    Diagram(coordinateSystem(extent = {{-120, 20}, {120, -20}})));
end PrescribedParticleFlow;
