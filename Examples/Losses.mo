within INP.Examples;

model Losses "Simple diffusion demo"
  extends Modelica.Icons.Example;
  parameter Units.NonSI.ParticleConcetration N_final(fixed = false) "Final Concentration";
  Sensors.NanoParticleCountingSensor concentrationSensor1 annotation(
    Placement(visible = true, transformation(origin = {-46, -8}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Components.ParticleCapacitor cabin1(N(displayUnit = "1/m3", fixed = true, start = 705032704), V = 45) annotation(
    Placement(visible = true, transformation(origin = {0, 54}, extent = {{-19, -19}, {19, 19}}, rotation = 0)));
  Components.ParticleSink particleSink(Kloss = 10.21e-6/60) annotation(
    Placement(visible = true, transformation(origin = {-44, 26}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Sources.PrescribedParticleFlow prescribedParticleFlow annotation(
    Placement(visible = true, transformation(origin = {6, -46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Pulse pulse(amplitude = 5.43e12, period = 3000, startTime = 3000) annotation(
    Placement(visible = true, transformation(origin = {-50, -46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(concentrationSensor1.port, cabin1.port) annotation(
    Line(points = {{-36, -8}, {0, -8}, {0, 35}}, color = {191, 0, 0}));
  connect(particleSink.port_a, cabin1.port) annotation(
    Line(points = {{-34, 26}, {0, 26}, {0, 36}}, color = {191, 0, 0}));
  connect(pulse.y, prescribedParticleFlow.P_flow) annotation(
    Line(points = {{-39, -46}, {-5, -46}}, color = {0, 0, 127}));
  connect(prescribedParticleFlow.port, cabin1.port) annotation(
    Line(points = {{16, -46}, {48, -46}, {48, 36}, {0, 36}}, color = {191, 0, 0}));
protected
  annotation(
    Documentation(info = "<html>
<p>
This example demonstrates the concentration response of one cabin connected by
a conducting element to a fixed concentration that varies along the time. The concentration in the room will increase due to the industrial process embedded and/or the fixed concentration.
</p>
<p>
Simulate for 600 s and plot the variables<br>
Nsensor1.N
</p>
</html>"),
    experiment(StopTime = 600.0, Interval = 0.001));
end Losses;
