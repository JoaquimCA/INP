within INP.Examples;

model PurifierExample "Simple diffusion demo"
  constant Real airflow = 1;
  extends Modelica.Icons.Example;
  parameter Units.NonSI.ParticleConcetration N_final(fixed = false) "Final Concentration";
  Components.ParticleCapacitor cabin1(N(displayUnit = "1/m3", fixed = true, start = 1e11), V = 1800) annotation(
    Placement(visible = true, transformation(origin = {1, 27}, extent = {{-19, -19}, {19, 19}}, rotation = 0)));
  Sensors.NanoParticleCountingSensor concentrationSensor annotation(
    Placement(visible = true, transformation(origin = {-32, -12}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Components.Purifier purifier(E = 100, Q = airflow) annotation(
    Placement(visible = true, transformation(origin = {42, -12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(cabin1.port, concentrationSensor.port) annotation(
    Line(points = {{1, 8}, {1, -12}, {-23, -12}}, color = {191, 0, 0}));
  connect(cabin1.port, purifier.port_a) annotation(
    Line(points = {{1, 8}, {1, -12}, {31, -12}}, color = {191, 0, 0}));
initial equation

protected
  annotation(
    Documentation(info = "<html>
<p>
This example demonstrates how can be used the component <a href=\"modelica://IAQ.Components.Purifier\">Purifier</a>. The example show a volume of air that has an initial concentration. The purifier cleans the indoor air until the space does not have more particles. The concentration in the room will be redyced due to the air purifier action.
</p>
<p>
Simulate for 200 s and plot the variables<br>
purifier.CumalatedParticles, concentrationSensor.N
</p>
</html>"),
    experiment(StopTime = 3600.0, Interval = 0.001));
end PurifierExample;
