within INP.Components;

model Room2X "Indoor air virtual volume with 2D particle dispersion and one source, with two walls XW and YN"
  parameter Modelica.Units.SI.Volume V "Volum of the virtual space";
  parameter Units.NonSI.ParticleConductance Qa "Constant particle conductance of a space";
  parameter Units.NonSI.ParticleConductance Qb "Constant particle conductance of a space";
  PGNP.Components.ParticleCapacitor particleCapacitor(V = V) annotation(
    Placement(visible = true, transformation(origin = {0, 40}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
  PGNP.Components.ParticleConductor particleConductorA(Q = Qa) annotation(
    Placement(visible = true, transformation(origin = {48, 2.22045e-16}, extent = {{-14, -14}, {14, 14}}, rotation = 0)));
  PGNP.Components.ParticleConductor particleConductorB(Q = Qb) annotation(
    Placement(visible = true, transformation(origin = {-2.22045e-16, -48}, extent = {{-14, -14}, {14, 14}}, rotation = -90)));
  Interfaces.NPort_a port_a annotation(
    Placement(visible = true, transformation(origin = {0, -102}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -98}, extent = {{-110, -10}, {-90, 10}}, rotation = 0)));
  Interfaces.NPort_b port_b annotation(
    Placement(visible = true, transformation(origin = {98, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PGNP.Sensors.NanoParticleCountingSensor concentrationSensor annotation(
    Placement(visible = true, transformation(origin = {-52, -1.9984e-15}, extent = {{14, -14}, {-14, 14}}, rotation = 0)));
  PGNP.Interfaces.NPort_a port_x annotation(
    Placement(visible = true, transformation(origin = {-100, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, -98}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(particleConductorA.port_a, particleCapacitor.port) annotation(
    Line(points = {{34, 0}, {0, 0}, {0, 24}}, color = {191, 0, 0}));
  connect(particleConductorA.port_b, port_b) annotation(
    Line(points = {{62, 0}, {100, 0}}, color = {191, 0, 0}));
  connect(particleCapacitor.port, particleConductorB.port_a) annotation(
    Line(points = {{0, 24}, {0, -34}}, color = {191, 0, 0}));
  connect(particleConductorB.port_b, port_a) annotation(
    Line(points = {{0, -62}, {0, -102}}, color = {191, 0, 0}));
  connect(concentrationSensor.port, particleCapacitor.port) annotation(
    Line(points = {{-38, 0}, {0, 0}, {0, 24}}, color = {191, 0, 0}));
  connect(port_x, concentrationSensor.port) annotation(
    Line(points = {{-100, -100}, {-20, -100}, {-20, 0}, {-38, 0}}, color = {191, 0, 0}));
  annotation(
    Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Text(origin = {-4, 18}, lineColor = {0, 0, 255}, extent = {{-150, 120}, {150, 80}}, textString = "%name"), Ellipse(origin = {66, 12}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Ellipse(origin = {40, 34}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Ellipse(origin = {46, -32}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Ellipse(origin = {-60, 10}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Ellipse(origin = {-32, -40}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Ellipse(origin = {-6, 32}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Ellipse(origin = {8, -22}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Line(origin = {0, 0.375655}, points = {{100, 99.6243}, {-100, 99.6243}, {-100, -100.376}, {-100, -100.376}}), Text(origin = {-14, 112}, extent = {{0, 0}, {-100, -100}}, textString = "X")}),
    Documentation(info = "<html>
This is a model of one indoor air volume with one industrial process that generates nanoparticles. The dispersion of nanoparticles is simulated in a cartesian way. This model represents a corner of a room.
</html>"));
end Room2X;
