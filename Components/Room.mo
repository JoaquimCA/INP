within INP.Components;

model Room "Indoor air virtual volume with 2D particle dispersion and one source"
  parameter Units.NonSI.ParticleConcetration N0 "Initial concentration";
  parameter Modelica.Units.SI.Volume V "Volum of the virtual space";
  parameter Units.NonSI.ParticleConductance XW "Constant particle conductance of a space";
  parameter Units.NonSI.ParticleConductance XE "Constant particle conductance of a space";
  parameter Units.NonSI.ParticleConductance YS "Constant particle conductance of a space";
  parameter Units.NonSI.ParticleConductance YN "Constant particle conductance of a space";
  PGNP.Components.ParticleCapacitor particleCapacitor(N(displayUnit = "1/m3", start = N0), V = V) annotation(
    Placement(visible = true, transformation(origin = {-42, 36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Components.ParticleConductor particleConductor(Q = XW) annotation(
    Placement(visible = true, transformation(origin = {-62, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Components.ParticleConductor particleConductor1(Q = XE) annotation(
    Placement(visible = true, transformation(origin = {50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Components.ParticleConductor particleConductor21(Q = YS) annotation(
    Placement(visible = true, transformation(origin = {0, -52}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  PGNP.Sources.PrescribedParticleFlow prescribedParticleFlow(N_ref = 150000e6) annotation(
    Placement(visible = true, transformation(origin = {-52, -44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput u annotation(
    Placement(visible = true, transformation(origin = {-106, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-98, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  ParticleConductor particleConductor211(Q = YN) annotation(
    Placement(visible = true, transformation(origin = {0, 62}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Interfaces.NPort_a port_XW annotation(
    Placement(visible = true, transformation(origin = {-98, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Interfaces.NPort_b port_XE annotation(
    Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Interfaces.NPort_c port_YS annotation(
    Placement(visible = true, transformation(origin = {0, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Interfaces.NPort_d port_YN annotation(
    Placement(visible = true, transformation(origin = {0, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PGNP.Sensors.NanoParticleCountingSensor concentrationSensor annotation(
    Placement(visible = true, transformation(origin = {-22, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(u, prescribedParticleFlow.P_flow) annotation(
    Line(points = {{-106, -60}, {-74, -60}, {-74, -44}, {-62, -44}}, color = {0, 0, 127}));
  connect(prescribedParticleFlow.port, particleCapacitor.port) annotation(
    Line(points = {{-42, -44}, {-42, 26}}, color = {191, 0, 0}));
  connect(particleConductor.port_a, port_XW) annotation(
    Line(points = {{-72, 0}, {-98, 0}}, color = {191, 0, 0}));
  connect(particleConductor211.port_b, port_YN) annotation(
    Line(points = {{0, 72}, {0, 100}}, color = {191, 0, 0}));
  connect(particleConductor1.port_b, port_XE) annotation(
    Line(points = {{60, 0}, {100, 0}}, color = {191, 0, 0}));
  connect(particleConductor21.port_b, port_YS) annotation(
    Line(points = {{0, -62}, {0, -100}}, color = {191, 0, 0}));
  connect(particleConductor21.port_a, particleCapacitor.port) annotation(
    Line(points = {{0, -42}, {0, -23}, {-42, -23}, {-42, 26}}, color = {191, 0, 0}));
  connect(particleConductor1.port_a, particleCapacitor.port) annotation(
    Line(points = {{40, 0}, {0, 0}, {0, 26}, {-42, 26}}, color = {191, 0, 0}));
  connect(particleConductor.port_b, particleCapacitor.port) annotation(
    Line(points = {{-52, 0}, {-42, 0}, {-42, 26}}, color = {191, 0, 0}));
  connect(particleConductor211.port_a, particleCapacitor.port) annotation(
    Line(points = {{0, 52}, {0, 26}, {-42, 26}}, color = {191, 0, 0}));
  connect(concentrationSensor.port, particleCapacitor.port) annotation(
    Line(points = {{-32, -4}, {-32, 26}, {-42, 26}}, color = {191, 0, 0}));
  annotation(
    Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Ellipse(origin = {66, 12}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Ellipse(origin = {-6, 32}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Ellipse(origin = {-60, 10}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Ellipse(origin = {-32, -40}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Ellipse(origin = {40, 34}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Ellipse(origin = {46, -32}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Ellipse(origin = {8, -22}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}})}),
    Documentation(info = "<html>
<p>
This is a model of one indoor air volume with one industrial process that generates nanoparticles. The dispersion of nanoparticles is simulated in a cartesian way.
</html>"));
end Room;
