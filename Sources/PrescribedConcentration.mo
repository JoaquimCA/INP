within INP.Sources;

model PrescribedConcentration "Variable temperature boundary condition in Kelvin"
  Interfaces.NPort_b port annotation(
    Placement(transformation(extent = {{90, -10}, {110, 10}})));
  Modelica.Blocks.Interfaces.RealInput N(unit = "1/m3") annotation(
    Placement(transformation(extent = {{-140, -20}, {-100, 20}})));
equation
  port.N = N;
  annotation(
    Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(fillColor = {159, 159, 223}, pattern = LinePattern.None, fillPattern = FillPattern.Backward, extent = {{-100, 100}, {100, -100}}), Line(points = {{-102, 0}, {64, 0}}, color = {191, 0, 0}, thickness = 0.5), Text(extent = {{0, 0}, {-100, -100}}, textString = "N"), Text(lineColor = {0, 0, 255}, extent = {{-150, 150}, {150, 110}}, textString = "%name"), Polygon(lineColor = {191, 0, 0}, fillColor = {191, 0, 0}, fillPattern = FillPattern.Solid, points = {{50, -20}, {50, 20}, {90, 0}, {50, -20}})}),
    Documentation(info = "<html>
<p>
This model represents a variable nanoparticle concentration boundary condition.
The concentration in [#/m<sup>3</sup>] is given as input signal <strong>N</strong>
to the model. The effect is that an instance of this model acts as
an infinite reservoir able to absorb or generate as much particles
as required to keep the concentration at the specified value.
</p>
</html>"));
end PrescribedConcentration;
