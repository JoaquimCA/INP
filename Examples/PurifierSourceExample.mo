within INP.Examples;

model PurifierSourceExample "Simple diffusion demo"
  extends Modelica.Icons.Example;
  parameter Units.NonSI.ParticleConcetration C_final(fixed = false) "Final Concentration";
  Components.ParticleCapacitor zone(N(displayUnit = "1/m3", fixed = true, start = 1e11), V = 1800) annotation(
    Placement(visible = true, transformation(origin = {1, 27}, extent = {{-19, -19}, {19, 19}}, rotation = 0)));
  Sensors.NanoParticleCountingSensor concentrationSensor annotation(
    Placement(visible = true, transformation(origin = {-32, -12}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Components.Purifier purifier(E = 100, Q = 1) annotation(
    Placement(visible = true, transformation(origin = {42, -12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Sources.FixedConcentration source(N = 1e11) annotation(
    Placement(visible = true, transformation(origin = {-38, -66}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Components.ParticleConductor particleConductor(Q = 0.1) annotation(
    Placement(visible = true, transformation(origin = {0, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
equation
  connect(zone.port, concentrationSensor.port) annotation(
    Line(points = {{1, 8}, {1, -12}, {-23, -12}}, color = {191, 0, 0}));
  connect(zone.port, purifier.port_a) annotation(
    Line(points = {{1, 8}, {1, -12}, {31, -12}}, color = {191, 0, 0}));
  connect(source.port, particleConductor.port_a) annotation(
    Line(points = {{-28, -66}, {0, -66}, {0, -48}}, color = {191, 0, 0}));
  connect(particleConductor.port_b, zone.port) annotation(
    Line(points = {{0, -28}, {0, -10}, {1, -10}, {1, 8}}, color = {191, 0, 0}));
initial equation

protected
  annotation(
    Documentation(info = "<html>
<p>
This example demonstrates how can be used the component <a href=\"modelica://IAQ.Components.Purifier\">Purifier</a> in a scenario with a NP-emitting process. The example show a volum of air that has an initial concentration. The purifier cleans the air while the generation increases the concentration.
</p>
<p>
Simulate for 7200 s and plot the variables<br>
purifier.CumalatedParticles, concentrationSensor.N
</p>
</html>"),
    experiment(StopTime = 7200.0, Interval = 0.1));
end PurifierSourceExample;
