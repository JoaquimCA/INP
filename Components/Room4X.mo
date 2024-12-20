within INP.Components;

model Room4X "Indoor air virtual volume with 2D particle dispersion and one source"
  parameter Modelica.Units.SI.Volume V "Volum of the virtual space";
  parameter Units.NonSI.ParticleConductance Qa "Constant particle conductance of a space";
  parameter Units.NonSI.ParticleConductance Qb "Constant particle conductance of a space";
  parameter Units.NonSI.ParticleConductance Qc "Constant particle conductance of a space";
  parameter Units.NonSI.ParticleConductance Qd "Constant particle conductance of a space";
  PGNP.Components.ParticleCapacitor particleCapacitor(V = V) annotation(
    Placement(visible = true, transformation(origin = {0, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Components.ParticleConductor particleConductorA(Q = Qa) annotation(
    Placement(visible = true, transformation(origin = {-62, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Components.ParticleConductor particleConductorB(Q = Qb) annotation(
    Placement(visible = true, transformation(origin = {50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Components.ParticleConductor particleConductorC(Q = Qc) annotation(
    Placement(visible = true, transformation(origin = {0, -52}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  PGNP.Components.ParticleConductor particleConductorD(Q = Qd) annotation(
    Placement(visible = true, transformation(origin = {0, 62}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Interfaces.NPort_a port_a annotation(
    Placement(visible = true, transformation(origin = {-98, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Interfaces.NPort_b port_b annotation(
    Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Interfaces.NPort_c port_c annotation(
    Placement(visible = true, transformation(origin = {0, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PGNP.Interfaces.NPort_d port_d annotation(
    Placement(visible = true, transformation(origin = {0, 100}, extent = {{-10, 10}, {10, -10}}, rotation = 0), iconTransformation(origin = {0, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PGNP.Sensors.NanoParticleCountingSensor concentrationSensor annotation(
    Placement(visible = true, transformation(origin = {40, -34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Interfaces.NPort_a port_x annotation(
    Placement(visible = true, transformation(origin = {-100, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, -98}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(particleConductorA.port_a, port_a) annotation(
    Line(points = {{-72, 0}, {-98, 0}}, color = {191, 0, 0}));
  connect(particleConductorD.port_b, port_d) annotation(
    Line(points = {{0, 72}, {0, 100}}, color = {191, 0, 0}));
  connect(particleConductorB.port_b, port_b) annotation(
    Line(points = {{60, 0}, {100, 0}}, color = {191, 0, 0}));
  connect(particleConductorC.port_b, port_c) annotation(
    Line(points = {{0, -62}, {0, -100}}, color = {191, 0, 0}));
  connect(particleConductorC.port_a, particleCapacitor.port) annotation(
    Line(points = {{0, -42}, {0, -21}, {-12, -21}, {-12, -2}}, color = {191, 0, 0}));
  connect(particleConductorB.port_a, particleCapacitor.port) annotation(
    Line(points = {{40, 0}, {20, 0}, {20, -2}, {-12, -2}}, color = {191, 0, 0}));
  connect(particleConductorA.port_b, particleCapacitor.port) annotation(
    Line(points = {{-52, 0}, {-26, 0}, {-26, -2}, {-12, -2}}, color = {191, 0, 0}));
  connect(particleConductorD.port_a, particleCapacitor.port) annotation(
    Line(points = {{0, 52}, {0, 0}}, color = {191, 0, 0}));
  connect(concentrationSensor.port, port_d) annotation(
    Line(points = {{30, -34}, {0, -34}, {0, 100}}, color = {191, 0, 0}));
  connect(port_x, particleConductorA.port_b) annotation(
    Line(points = {{-100, -100}, {-52, -100}, {-52, 0}}, color = {191, 0, 0}));
  annotation(
    Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Ellipse(origin = {66, 12}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Ellipse(origin = {40, 34}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Ellipse(origin = {-6, 32}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Ellipse(origin = {-32, -40}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Ellipse(origin = {-60, 10}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Ellipse(origin = {8, -22}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Ellipse(origin = {46, -32}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Text(origin = {-14, 112}, extent = {{0, 0}, {-100, -100}}, textString = "X")}),
    Documentation(info = "<html>
<p>
This is a model of one indoor air volume with one industrial process that generates nanoparticles. The dispersion of nanoparticles is simulated in a cartesian way.
</html>"));
end Room4X;
