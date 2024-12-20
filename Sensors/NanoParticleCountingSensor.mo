within INP.Sensors;

model NanoParticleCountingSensor "Nanoparticle concentration sensor in #/cm3"
  Modelica.Blocks.Interfaces.RealOutput N(unit = "1/m3") "Nanoparticle concentration as output signal" annotation(
    Placement(transformation(extent = {{90, -10}, {110, 10}})));
  Interfaces.NPort_a port annotation(
    Placement(transformation(extent = {{-110, -10}, {-90, 10}})));
  Particles.ToParticlecm3 toParticlecm3 annotation(
    Placement(visible = true, transformation(origin = {66, -56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y(unit = "1/cm3") annotation(
    Placement(visible = true, transformation(origin = {-2, -56}, extent = {{90, -10}, {110, 10}}, rotation = 0), iconTransformation(origin = {0, 50}, extent = {{90, -10}, {110, 10}}, rotation = 0)));
equation
  N = port.N;
  port.P_flow = 0;
  connect(N, toParticlecm3.Particlem3) annotation(
    Line(points = {{100, 0}, {54, 0}, {54, -56}}, color = {0, 0, 127}));
  connect(toParticlecm3.Particlecm3, y) annotation(
    Line(points = {{78, -56}, {98, -56}}, color = {0, 0, 127}));
  annotation(
    defaultComponentName = "concentrationSensor",
    Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Line(points = {{62, 0}, {90, 0}}, color = {0, 0, 255}), Line(points = {{-90, 0}, {-60, 0}}, color = {191, 0, 0}), Text(origin = {65, 132}, extent = {{126, -18}, {25, -74}}, textString = "#/m3"), Text(lineColor = {0, 0, 255}, extent = {{-150, 135}, {150, 95}}, textString = "%name"), Rectangle(origin = {1, -2}, lineThickness = 0.5, extent = {{-61, 86}, {61, -86}}, radius = 8), Rectangle(origin = {2, 41}, lineThickness = 0.5, extent = {{-44, 33}, {44, -33}}, radius = 8), Rectangle(origin = {-62, -53}, lineColor = {255, 255, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-16, 11}, {16, -11}}), Line(origin = {-39.02, -64.08}, points = {{-47, 0}, {47, 0}, {47, 0}}, thickness = 0.5), Ellipse(origin = {-81, -51}, fillPattern = FillPattern.Solid, extent = {{-5, 5}, {5, -5}}), Ellipse(origin = {-37, -55}, fillPattern = FillPattern.Solid, extent = {{-5, 5}, {5, -5}}), Ellipse(origin = {-5, -49}, fillPattern = FillPattern.Solid, extent = {{-5, 5}, {5, -5}}), Line(origin = {-40.0463, -41.5502}, points = {{-47, 0}, {47, 0}, {47, 0}}, thickness = 0.5), Text(origin = {50, 22}, extent = {{150, -22}, {30, -92}}, textString = "#/cm3"), Line(points = {{62, 0}, {90, 0}}, color = {0, 0, 255}), Line(points = {{62, 0}, {90, 0}}, color = {0, 0, 255}), Line(origin = {0.150581, 49.3977}, points = {{62, 0}, {90, 0}}, color = {0, 0, 255})}),
    Documentation(info = "<html>
<p>
This is an ideal absolute concentration sensor which returns
the concentration of the connected port in #/cm<sup>3</sup> and #/m<sup>3</sup> as an output
signal. The concentration is the average number of particles of the modal size of the process modelled.  The sensor itself has no interaction with
whatever it is connected to.
</p>
</html>"));
end NanoParticleCountingSensor;
