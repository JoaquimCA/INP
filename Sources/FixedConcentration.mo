within INP.Sources;

model FixedConcentration "Fixed concentration boundary condition in #/cm3"
  parameter Units.NonSI.ParticleConcetration N;
  Interfaces.NPort_b port annotation(
    Placement(transformation(extent = {{90, -10}, {110, 10}})));
equation
  port.N = N;
  annotation(
    Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Text(textColor = {0, 0, 255}, extent = {{-150, 150}, {150, 110}}, textString = "%name"), Text(extent = {{-150, -110}, {150, -140}}, textString = "N=%N"), Rectangle(fillColor = {159, 159, 223}, pattern = LinePattern.None, fillPattern = FillPattern.Backward, extent = {{-100, 100}, {100, -100}}), Text(origin = {2, 0}, extent = {{0, 0}, {-100, -100}}, textString = "N"), Line(points = {{-52, 0}, {56, 0}}, color = {191, 0, 0}, thickness = 0.5), Polygon(lineColor = {191, 0, 0}, fillColor = {191, 0, 0}, fillPattern = FillPattern.Solid, points = {{50, -20}, {50, 20}, {90, 0}, {50, -20}})}),
    Documentation(info = "<html>
<p>
This model defines a fixed nanoparticle concentration N at its port in #/m<sup>3</sup>,
i.e., it defines a fixed concentration as a boundary condition.
</p>
</html>"));
end FixedConcentration;
