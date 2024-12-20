within INP.Examples;

model FourVolumes "Simple diffusion demo"
  extends Modelica.Icons.Example;
  parameter Real C_final(final quantity = "Concentration", final unit = "1/m3", fixed = false) "Projected final Concentation";
  Components.ParticleCapacitor vol1(V = 15, N(start = 3500, fixed = true)) annotation(
    Placement(visible = true, transformation(origin = {-77, 71}, extent = {{-19, -19}, {19, 19}}, rotation = 0)));
  Components.ParticleCapacitor vol2(V = 15, N(start = 1000, fixed = true)) annotation(
    Placement(visible = true, transformation(origin = {79, 73}, extent = {{-19, -19}, {19, 19}}, rotation = 0)));
  Components.ParticleCapacitor vol3(N(fixed = true, start = 10000), V = 15) annotation(
    Placement(visible = true, transformation(origin = {-61, -49}, extent = {{-19, -19}, {19, 19}}, rotation = 0)));
  Components.ParticleCapacitor vol4(N(fixed = true, start = 20000), V = 15) annotation(
    Placement(visible = true, transformation(origin = {63, -45}, extent = {{-19, -19}, {19, 19}}, rotation = 0)));
  Components.ParticleConductor conduction1(Q = 10) annotation(
    Placement(visible = true, transformation(origin = {2, 40}, extent = {{-14, -14}, {14, 14}}, rotation = 0)));
  Components.ParticleConductor conduction2(Q = 10) annotation(
    Placement(visible = true, transformation(origin = {2, -80}, extent = {{-14, -14}, {14, 14}}, rotation = 0)));
  Components.ParticleConductor conduction3(Q = 10) annotation(
    Placement(visible = true, transformation(origin = {-78, 4}, extent = {{-14, -14}, {14, 14}}, rotation = -90)));
  Components.ParticleConductor conduction4(Q = 10) annotation(
    Placement(visible = true, transformation(origin = {80, 6}, extent = {{-14, -14}, {14, 14}}, rotation = -90)));
  Sensors.NanoParticleCountingSensor Nsensor1 annotation(
    Placement(visible = true, transformation(origin = {-46, 72}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Sensors.NanoParticleCountingSensor Nsensor2 annotation(
    Placement(visible = true, transformation(origin = {44, 74}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Sensors.NanoParticleCountingSensor Nsensor4 annotation(
    Placement(visible = true, transformation(origin = {28, -44}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Sensors.NanoParticleCountingSensor Nsensor3 annotation(
    Placement(visible = true, transformation(origin = {-18, -46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(vol1.port, conduction1.port_a) annotation(
    Line(points = {{-77, 52}, {-77, 40}, {-12, 40}}, color = {191, 0, 0}));
  connect(conduction1.port_b, vol2.port) annotation(
    Line(points = {{16, 40}, {79, 40}, {79, 54}}, color = {191, 0, 0}));
  connect(vol1.port, Nsensor1.port) annotation(
    Line(points = {{-77, 52}, {-56, 52}, {-56, 72}}, color = {191, 0, 0}));
  connect(vol2.port, Nsensor2.port) annotation(
    Line(points = {{79, 54}, {79, 53}, {54, 53}, {54, 74}}, color = {191, 0, 0}));
  connect(vol3.port, Nsensor3.port) annotation(
    Line(points = {{-61, -68}, {-35.5, -68}, {-35.5, -46}, {-28, -46}}, color = {191, 0, 0}));
  connect(vol4.port, Nsensor4.port) annotation(
    Line(points = {{63, -64}, {63, -65}, {38, -65}, {38, -44}}, color = {191, 0, 0}));
  connect(vol3.port, conduction2.port_a) annotation(
    Line(points = {{-61, -68}, {-61, -80}, {-12, -80}}, color = {191, 0, 0}));
  connect(conduction2.port_b, vol4.port) annotation(
    Line(points = {{16, -80}, {63, -80}, {63, -64}}, color = {191, 0, 0}));
  connect(conduction4.port_b, vol4.port) annotation(
    Line(points = {{80, -8}, {80, -64}, {64, -64}}, color = {191, 0, 0}));
  connect(conduction3.port_b, vol3.port) annotation(
    Line(points = {{-78, -10}, {-78, -68}, {-61, -68}}, color = {191, 0, 0}));
  connect(conduction4.port_a, vol2.port) annotation(
    Line(points = {{80, 20}, {80, 54}}, color = {191, 0, 0}));
  connect(conduction3.port_a, vol1.port) annotation(
    Line(points = {{-78, 18}, {-78, 37}, {-77, 37}, {-77, 52}}, color = {191, 0, 0}));
initial equation
  C_final = (vol1.N*vol1.V + vol2.N*vol2.V + vol3.N*vol3.V + vol4.N*vol4.V)/(vol1.V + vol2.V + vol3.V + vol4.V);
  annotation(
    Documentation(info = "<html>
<p>
This example demonstrates the concentration response of four indoor air volumes connected by a conducting element. The four volumes have the same volume but with different initial concentration(N1=3500 [particles/m<sup>3</sup>], N2= 1000 [particles/m<sup>3</sup>], N3= 10000 [particles/m<sup>3</sup>] and N4= 20000 [particles/m<sup>3</sup>]). The volumes with the higher concentrations will reduced its concentration while the volumes with the lower concentration will rise up.
They will each asymptotically approach the calculated concentration  (<strong>N_final_particles/cm<sup>3</sup></strong>) that results from dividing the total initial number of particles in the system by the sum of volumes of each element.
</p>
<p>
Simulate for 10 s and plot the variables<br>
Nsensor1.N, Nsensor2.N, Nsensor3.N, Nsensor4.N, C_final
</p>
</html>"),
    experiment(StopTime = 10.0, Interval = 0.001));
end FourVolumes;
