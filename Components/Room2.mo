within INP.Components;

model Room2 "Indoor air virtual volume with 2D particle dispersion and one source, with two walls XW and YN"
  parameter Modelica.Units.SI.Volume V "Volum of the virtual space";
  parameter Units.NonSI.ParticleConductance XE "Constant particle conductance of a space";
  parameter Units.NonSI.ParticleConductance YS "Constant particle conductance of a space";
  Components.ParticleCapacitor particleCapacitor(V = V) annotation(
    Placement(visible = true, transformation(origin = {22, 28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Components.ParticleConductor particleConductor1(Q = XE) annotation(
    Placement(visible = true, transformation(origin = {50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Components.ParticleConductor particleConductor21(Q = YS) annotation(
    Placement(visible = true, transformation(origin = {0, -54}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Interfaces.NPort_a port_a annotation(
    Placement(visible = true, transformation(origin = {0, -102}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -98}, extent = {{-110, -10}, {-90, 10}}, rotation = 0)));
  Interfaces.NPort_b port_b annotation(
    Placement(visible = true, transformation(origin = {98, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PGNP.Sensors.NanoParticleCountingSensor concentrationSensor annotation(
    Placement(visible = true, transformation(origin = {-38, 18}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
equation
  connect(particleConductor1.port_a, particleCapacitor.port) annotation(
    Line(points = {{40, 0}, {22, 0}, {22, 18}}, color = {191, 0, 0}));
  connect(particleConductor1.port_b, port_b) annotation(
    Line(points = {{60, 0}, {100, 0}}, color = {191, 0, 0}));
  connect(particleCapacitor.port, particleConductor21.port_a) annotation(
    Line(points = {{22, 18}, {0, 18}, {0, -44}}, color = {191, 0, 0}));
  connect(particleConductor21.port_b, port_a) annotation(
    Line(points = {{0, -64}, {0, -102}}, color = {191, 0, 0}));
  connect(concentrationSensor.port, particleCapacitor.port) annotation(
    Line(points = {{-28, 18}, {22, 18}}, color = {191, 0, 0}));
  annotation(
    Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Text(origin = {-4, 18}, lineColor = {0, 0, 255}, extent = {{-150, 120}, {150, 80}}, textString = "%name"), Ellipse(origin = {66, 12}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Ellipse(origin = {40, 34}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Ellipse(origin = {46, -32}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Ellipse(origin = {-60, 10}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Ellipse(origin = {-32, -40}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Ellipse(origin = {-6, 32}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Ellipse(origin = {8, -22}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Line(origin = {0, 0.375655}, points = {{100, 99.6243}, {-100, 99.6243}, {-100, -100.376}, {-100, -100.376}})}),
    Documentation(info = "<html>
This is a model of one indoor air volume with one industrial process that generates nanoparticles. The dispersion of nanoparticles is simulated in a cartesian way. This model represents a corner of a room.
</html>"));
end Room2;
