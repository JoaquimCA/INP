within INP.Components;

model Room3X "Indoor air virtual volume with 2D particle dispersion and one source, with one wall in XN"
  parameter Modelica.Units.SI.Volume V "Volum of the virtual space";
  parameter Units.NonSI.ParticleConductance Qa "Constant particle conductance of a space";
  parameter Units.NonSI.ParticleConductance Qb "Constant particle conductance of a space";
  parameter Units.NonSI.ParticleConductance Qc "Constant particle conductance of a space";
  Components.ParticleCapacitor particleCapacitor(V = V) annotation(
    Placement(visible = true, transformation(origin = {22, 28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Components.ParticleConductor particleConductorA(Q = Qb) annotation(
    Placement(visible = true, transformation(origin = {50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Components.ParticleConductor particleConductorB(Q = Qa) annotation(
    Placement(visible = true, transformation(origin = {-40, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Components.ParticleConductor particleConductorC(Q = Qc) annotation(
    Placement(visible = true, transformation(origin = {2, -42}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  Interfaces.NPort_a port_a annotation(
    Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 0}, extent = {{-110, -10}, {-90, 10}}, rotation = 0)));
  Interfaces.NPort_b port_b annotation(
    Placement(visible = true, transformation(origin = {98, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Interfaces.NPort_a port_c annotation(
    Placement(visible = true, transformation(origin = {0, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -100}, extent = {{-110, -10}, {-90, 10}}, rotation = 0)));
  PGNP.Sensors.NanoParticleCountingSensor concentrationSensor annotation(
    Placement(visible = true, transformation(origin = {-26, 32}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Interfaces.NPort_a port_x annotation(
    Placement(visible = true, transformation(origin = {-100, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, -98}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(particleConductorA.port_a, particleCapacitor.port) annotation(
    Line(points = {{40, 0}, {22, 0}, {22, 18}}, color = {191, 0, 0}));
  connect(particleConductorA.port_b, port_b) annotation(
    Line(points = {{60, 0}, {100, 0}}, color = {191, 0, 0}));
  connect(particleCapacitor.port, particleConductorB.port_a) annotation(
    Line(points = {{22, 18}, {-30, 18}, {-30, 0}}, color = {191, 0, 0}));
  connect(particleConductorB.port_b, port_a) annotation(
    Line(points = {{-50, 0}, {-100, 0}}, color = {191, 0, 0}));
  connect(particleConductorC.port_b, port_c) annotation(
    Line(points = {{2, -52}, {2, -77}, {0, -77}, {0, -100}}, color = {191, 0, 0}));
  connect(particleCapacitor.port, particleConductorC.port_a) annotation(
    Line(points = {{22, 18}, {2, 18}, {2, -32}}, color = {191, 0, 0}));
  connect(concentrationSensor.port, particleCapacitor.port) annotation(
    Line(points = {{-16, 32}, {8, 32}, {8, 18}, {22, 18}}, color = {191, 0, 0}));
  connect(port_x, particleConductorB.port_a) annotation(
    Line(points = {{-100, -100}, {-30, -100}, {-30, 0}}, color = {191, 0, 0}));
  annotation(
    Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Text(origin = {-4, 18}, lineColor = {0, 0, 255}, extent = {{-150, 120}, {150, 80}}, textString = "%name"), Ellipse(origin = {66, 12}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Ellipse(origin = {40, 34}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Ellipse(origin = {46, -32}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Ellipse(origin = {-60, 10}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Ellipse(origin = {-32, -40}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Ellipse(origin = {-6, 32}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Ellipse(origin = {8, -22}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Line(origin = {0, 100}, points = {{-100, 0}, {100, 0}}), Text(origin = {-14, 112}, extent = {{0, 0}, {-100, -100}}, textString = "X")}),
    Documentation(info = "<html>
This is a model of one indoor air volume with one industrial process that generates nanoparticles. The dispersion of nanoparticles is simulated in a cartesian way. This model represents the part of the room in contact with a wall.
</html>"));
end Room3X;
