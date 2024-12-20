within INP.Examples;

model BoothExample "Simple diffusion demo"
  constant Real Q1 = 0.47;
  constant Real Q2 = 0.33;
  constant Real vol = 1452;
  extends Modelica.Icons.Example;
  parameter Units.NonSI.ParticleConcetration C_final(fixed = false) "Final Concentration";
  Components.ParticleCapacitor cabin(V = 100) annotation(
    Placement(visible = true, transformation(origin = {40, 22}, extent = {{-14, -14}, {14, 14}}, rotation = 0)));
  Components.ParticleConductor ventilation(Q = 1) annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Sources.FixedConcentration background(N = 10000e6) annotation(
    Placement(visible = true, transformation(origin = {-50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Sources.PrescribedParticleFlow source annotation(
    Placement(visible = true, transformation(origin = {0, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant emission_factor(k = 1e14) annotation(
    Placement(visible = true, transformation(origin = {-50, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Sensors.NanoParticleCountingSensor sensor annotation(
    Placement(visible = true, transformation(origin = {62, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(background.port, ventilation.port_a) annotation(
    Line(points = {{-40, 0}, {-10, 0}}, color = {191, 0, 0}));
  connect(ventilation.port_b, cabin.port) annotation(
    Line(points = {{10, 0}, {40, 0}, {40, 8}}, color = {191, 0, 0}));
  connect(source.port, cabin.port) annotation(
    Line(points = {{10, -40}, {40, -40}, {40, 8}}, color = {191, 0, 0}));
  connect(emission_factor.y, source.P_flow) annotation(
    Line(points = {{-39, -40}, {-10, -40}}, color = {0, 0, 127}));
  connect(sensor.port, source.port) annotation(
    Line(points = {{52, -40}, {10, -40}}, color = {191, 0, 0}));
initial equation

protected
  annotation(
    Documentation(info = "<html>
<p>
This example demonstrates the concentration response of an isolated cabin containing a constant generation process, a sensor, and a ventilation system.
</p>
</html>"),
    experiment(StopTime = 10000, Interval = 1, StartTime = 0, Tolerance = 1e-06));
end BoothExample;
