within INP.Components;

model Room6X "Indoor air virtual volume with 2D particle dispersion and one source"
  parameter Modelica.Units.SI.Volume V "Volum of the virtual space";
  parameter Units.NonSI.ParticleConductance Qa "Constant particle conductance of a space";
  parameter Units.NonSI.ParticleConductance Qb "Constant particle conductance of a space";
  parameter Units.NonSI.ParticleConductance Qc "Constant particle conductance of a space";
  parameter Units.NonSI.ParticleConductance Qd "Constant particle conductance of a space";
  parameter Units.NonSI.ParticleConductance Qe "Constant particle conductance of a space";
  parameter Units.NonSI.ParticleConductance Qf "Constant particle conductance of a space";
  PGNP.Components.ParticleCapacitor particleCapacitor(V = V) annotation(
    Placement(visible = true, transformation(origin = {-42, 36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Components.ParticleConductor particleConductorA(Q = Qa) annotation(
    Placement(visible = true, transformation(origin = {-62, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PGNP.Components.ParticleConductor particleConductorB(Q = Qb) annotation(
    Placement(visible = true, transformation(origin = {54, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PGNP.Components.ParticleConductor particleConductorC(Q = Qc) annotation(
    Placement(visible = true, transformation(origin = {-32, -60}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  PGNP.Components.ParticleConductor particleConductorD(Q = Qd) annotation(
    Placement(visible = true, transformation(origin = {50, 62}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  PGNP.Components.ParticleConductor particleConductorE(Q = Qe) annotation(
    Placement(visible = true, transformation(origin = {44, -56}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  PGNP.Components.ParticleConductor particleConductorF(Q = Qf) annotation(
    Placement(visible = true, transformation(origin = {-68, 64}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Interfaces.NPort_a port_a annotation(
    Placement(visible = true, transformation(origin = {-98, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Interfaces.NPort_b port_b annotation(
    Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Interfaces.NPort_c port_c annotation(
    Placement(visible = true, transformation(origin = {-60, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-60, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Interfaces.NPort_d port_d annotation(
    Placement(visible = true, transformation(origin = {-60, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-60, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Interfaces.NPort_c port_e annotation(
    Placement(visible = true, transformation(origin = {62, -98}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {62, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Interfaces.NPort_d port_f annotation(
    Placement(visible = true, transformation(origin = {60, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {60, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PGNP.Sensors.NanoParticleCountingSensor concentrationSensor annotation(
    Placement(visible = true, transformation(origin = {-22, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PGNP.Interfaces.NPort_a port_x annotation(
    Placement(visible = true, transformation(origin = {-100, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, -98}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(particleConductorA.port_a, port_a) annotation(
    Line(points = {{-72, 0}, {-98, 0}}, color = {191, 0, 0}));
  connect(concentrationSensor.port, particleCapacitor.port) annotation(
    Line(points = {{-32, 0}, {-32, 26}, {-42, 26}}, color = {191, 0, 0}));
  connect(particleConductorD.port_b, port_f) annotation(
    Line(points = {{50, 72}, {50, 81}, {60, 81}, {60, 100}}, color = {191, 0, 0}));
  connect(particleConductorD.port_a, particleConductorB.port_a) annotation(
    Line(points = {{50, 52}, {50, 26}, {44, 26}, {44, 0}}, color = {191, 0, 0}));
  connect(particleConductorC.port_b, port_c) annotation(
    Line(points = {{-32, -70}, {-60, -70}, {-60, -100}}, color = {191, 0, 0}));
  connect(port_e, particleConductorE.port_a) annotation(
    Line(points = {{62, -98}, {44, -98}, {44, -66}}, color = {85, 170, 255}));
  connect(particleConductorE.port_b, particleConductorB.port_a) annotation(
    Line(points = {{44, -46}, {44, 0}}, color = {191, 0, 0}));
  connect(particleConductorC.port_a, concentrationSensor.port) annotation(
    Line(points = {{-32, -50}, {-32, 0}}, color = {191, 0, 0}));
  connect(port_d, particleConductorF.port_b) annotation(
    Line(points = {{-60, 100}, {-60, 87}, {-68, 87}, {-68, 74}}, color = {85, 170, 255}));
  connect(particleConductorF.port_a, particleCapacitor.port) annotation(
    Line(points = {{-68, 54}, {-68, 26}, {-42, 26}}, color = {191, 0, 0}));
  connect(particleConductorA.port_b, concentrationSensor.port) annotation(
    Line(points = {{-52, 0}, {-32, 0}}, color = {191, 0, 0}));
  connect(particleConductorB.port_b, port_b) annotation(
    Line(points = {{64, 0}, {100, 0}}, color = {191, 0, 0}));
  connect(particleConductorB.port_a, particleCapacitor.port) annotation(
    Line(points = {{44, 0}, {6, 0}, {6, 26}, {-42, 26}}, color = {191, 0, 0}));
  connect(port_x, particleConductorC.port_a) annotation(
    Line(points = {{-100, -100}, {-78, -100}, {-78, -50}, {-32, -50}}, color = {191, 0, 0}));
  annotation(
    Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Ellipse(origin = {46, -32}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Ellipse(origin = {66, 12}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Ellipse(origin = {-32, -40}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Ellipse(origin = {8, -22}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Ellipse(origin = {-60, 10}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Ellipse(origin = {40, 34}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Ellipse(origin = {-6, 32}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Text(origin = {-14, 112}, extent = {{0, 0}, {-100, -100}}, textString = "X")}),
    Documentation(info = "<html>
<p>
This is a model of one indoor air volume with one industrial process that generates nanoparticles. The dispersion of nanoparticles is simulated in a cartesian way.
</html>"));
end Room6X;
