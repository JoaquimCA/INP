within INP.Examples;

model TwoVolumes "Simple diffusion demo"
  extends Modelica.Icons.Example;
  parameter Units.NonSI.ParticleConcetration N_final(fixed = false) "Projected final concentration";
  Components.ParticleCapacitor vol1(V = 15, N(start = 3500, fixed = true)) annotation(
    Placement(visible = true, transformation(extent = {{-100, 32}, {-40, 92}}, rotation = 0)));
  Components.ParticleCapacitor vol2(V = 15, N(start = 1000, fixed = true)) annotation(
    Placement(visible = true, transformation(extent = {{40, 32}, {100, 92}}, rotation = 0)));
  Components.ParticleConductor conduction(G = 10) annotation(
    Placement(transformation(extent = {{-30, -20}, {30, 40}})));
  Sensors.NanoParticleCountingSensor Nsensor1 annotation(
    Placement(visible = true, transformation(extent = {{-66, -80}, {-26, -40}}, rotation = 0)));
  Sensors.NanoParticleCountingSensor Nsensor2 annotation(
    Placement(visible = true, transformation(extent = {{64, -80}, {24, -40}}, rotation = 0)));
equation
  connect(vol1.port, conduction.port_a) annotation(
    Line(points = {{-70, 62}, {-70, 10}, {-30, 10}}, color = {191, 0, 0}));
  connect(conduction.port_b, vol2.port) annotation(
    Line(points = {{30, 10}, {70, 10}, {70, 32}}, color = {191, 0, 0}));
  connect(vol1.port, Nsensor1.port) annotation(
    Line(points = {{-70, 62}, {-70, -60}, {-66, -60}}, color = {191, 0, 0}));
  connect(vol2.port, Nsensor2.port) annotation(
    Line(points = {{70, 32}, {70, -60}, {64, -60}}, color = {191, 0, 0}));
initial equation
  N_final = (vol1.N*vol1.V + vol2.N*vol2.V)/(vol1.V + vol2.V);
  annotation(
    Documentation(info = "<html>
<p>
This example demonstrates the concentration response of two indoor air volumes connected by a conducting element. The two volumes have the same volume but with different initial concentration(N1=3500 [particles/m<sup>3</sup>], N2= 1000 [particles/m<sup>3</sup>]). The volume with the higher concentration will reduced its concentration while the volume with the lower concentration will rise up.
They will each asymptotically approach the calculated concentration <strong>N_final_particles/m<sup>3</sup></strong> (<strong>N_final_particles/cm<sup>3</sup></strong>) that results from dividing the total initial number of particles in the system by the sum of volumes of each element.
</p>
<p>
Simulate for 10 s and plot the variables<br>
Nsensor1.N, Nsensor2.N, N_final
</p>
</html>"),
    experiment(StopTime = 10.0, Interval = 0.001));
end TwoVolumes;
