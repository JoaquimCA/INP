within INP.Examples;

model ForcedVentilation "Simple diffusion demo"
  extends Modelica.Icons.Example;
  parameter Units.NonSI.ParticleConcetration N_final(fixed = false) "Final Concentration";
  Components.ParticleCapacitor particleCapacitor(V = 45) annotation(
    Placement(visible = true, transformation(origin = {-8, 42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Sensors.NanoParticleCountingSensor concentrationSensor annotation(
    Placement(visible = true, transformation(origin = {18, -46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Pulse pulse(amplitude = 5.43e12, period = 3600, startTime = 1000) annotation(
    Placement(visible = true, transformation(origin = {-66, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Sources.PrescribedParticleFlow prescribedParticleFlow annotation(
    Placement(visible = true, transformation(origin = {-30, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Components.ForcedParticleConductor forcedParticleConductor1(Q = 2) annotation(
    Placement(visible = true, transformation(origin = {20, -16}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Sources.FixedConcentration fixedConcentration(N = 5e9) annotation(
    Placement(visible = true, transformation(origin = {68, -16}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Sources.FixedConcentration Exterior(N = 5e9) annotation(
    Placement(visible = true, transformation(origin = {68, 14}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Components.ForcedParticleConductor forcedParticleConductor(Q = 2) annotation(
    Placement(visible = true, transformation(origin = {20, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(pulse.y, prescribedParticleFlow.P_flow) annotation(
    Line(points = {{-55, 14}, {-40, 14}}, color = {0, 0, 127}));
  connect(forcedParticleConductor1.port_b, particleCapacitor.port) annotation(
    Line(points = {{10, -16}, {-8, -16}, {-8, 32}}, color = {191, 0, 0}));
  connect(fixedConcentration.port, forcedParticleConductor1.port_a) annotation(
    Line(points = {{58, -16}, {30, -16}}, color = {191, 0, 0}));
  connect(prescribedParticleFlow.port, forcedParticleConductor.port_a) annotation(
    Line(points = {{-20, 14}, {10, 14}}, color = {191, 0, 0}));
  connect(forcedParticleConductor.port_a, concentrationSensor.port) annotation(
    Line(points = {{10, 14}, {-8, 14}, {-8, -46}, {8, -46}}, color = {191, 0, 0}));
  connect(forcedParticleConductor.port_b, Exterior.port) annotation(
    Line(points = {{30, 14}, {58, 14}}, color = {191, 0, 0}));
  connect(particleCapacitor.port, forcedParticleConductor.port_a) annotation(
    Line(points = {{-8, 32}, {-8, 14}, {10, 14}}, color = {191, 0, 0}));
initial equation

protected
  annotation(
    Documentation(info = "<html>
<p>
This example demonstrates the concentration response of a cabin where an industrial process that generates nanoparticles takes place. The indoor air is exhausted to the outdoors, and clean air comes from the indoor of the factory. Nanoparticles are generated by pulses.
</p>
<p>
Particles increase when the pulse is active, at it is reduced to the factory background when the pulse is off.
</p>
<p>
Simulate for 10000 s and plot the variables<br>
concentrationSensor.toParticlecm3.Particlecm3
</p>
</html>"),
    experiment(StopTime = 10000, Interval = 1, StartTime = 0, Tolerance = 1e-06),
    Diagram,
    Icon);
end ForcedVentilation;