within INP.Examples;

model OpenSpace "Simple diffusion demo"
  extends Modelica.Icons.Example;
  parameter Units.NonSI.ParticleConcetration C_final(fixed = false) "Final Concentration";
  Components.Room room(C0 = 1.5e11, V = 90, XE = 2, XW = 2, YN = 2, YS = 2) annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Pulse pulse(amplitude = 3.6e8, period = 6000, startTime = 0) annotation(
    Placement(visible = true, transformation(origin = {-48, -28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Components.Room2 room2(V = 90, XE = 0.1, YS = 0.1) annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Components.Room2 room21(V = 90, XE = 0.1, YS = 0.1) annotation(
    Placement(visible = true, transformation(origin = {90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Components.Room2 room211(V = 90, XE = 0.1, YS = 0.1) annotation(
    Placement(visible = true, transformation(origin = {90, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Components.Room2 room2111(V = 90, XE = 0.1, YS = 0.1) annotation(
    Placement(visible = true, transformation(origin = {-90, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Components.Room3 room3(V = 90, XE = 0.1, XW = 0.1, YS = 0.1) annotation(
    Placement(visible = true, transformation(origin = {0, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Components.Room3 room31(V = 90, XE = 0.1, XW = 0.1, YS = 0.1) annotation(
    Placement(visible = true, transformation(origin = {90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Components.Room3 room32(V = 90, XE = 0.1, XW = 0.1, YS = 0.1) annotation(
    Placement(visible = true, transformation(origin = {-90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Components.Room3 room33(V = 90, XE = 0.1, XW = 0.1, YS = 0.1) annotation(
    Placement(visible = true, transformation(origin = {0, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
equation
  connect(room3.port_b, room21.port_a) annotation(
    Line(points = {{10, 90}, {80, 90}}, color = {191, 0, 0}));
  connect(room2.port_b, room3.port_a) annotation(
    Line(points = {{-80, 90}, {-10, 90}}, color = {191, 0, 0}));
  connect(room21.port_b, room31.port_a) annotation(
    Line(points = {{90, 80}, {90, 10}}, color = {191, 0, 0}));
  connect(room31.port_b, room211.port_a) annotation(
    Line(points = {{90, -10}, {90, -80}}, color = {191, 0, 0}));
  connect(room32.port_a, room2111.port_b) annotation(
    Line(points = {{-90, -10}, {-90, -80}}, color = {191, 0, 0}));
  connect(room32.port_b, room2.port_a) annotation(
    Line(points = {{-90, 10}, {-90, 80}}, color = {191, 0, 0}));
  connect(room33.port_a, room211.port_b) annotation(
    Line(points = {{10, -90}, {80, -90}}, color = {191, 0, 0}));
  connect(room2111.port_a, room33.port_b) annotation(
    Line(points = {{-80, -90}, {-10, -90}}, color = {191, 0, 0}));
  connect(room3.port_a1, room.port_YN) annotation(
    Line(points = {{0, 80}, {0, 10}}, color = {191, 0, 0}));
  connect(room.port_XE, room31.port_a1) annotation(
    Line(points = {{10, 0}, {80, 0}}, color = {191, 0, 0}));
  connect(room33.port_a1, room.port_YS) annotation(
    Line(points = {{0, -80}, {0, -10}}, color = {191, 0, 0}));
  connect(room32.port_a1, room.port_XW) annotation(
    Line(points = {{-80, 0}, {-10, 0}}, color = {191, 0, 0}));
  connect(room.u, pulse.y) annotation(
    Line(points = {{-10, -6}, {-26, -6}, {-26, -28}, {-36, -28}}, color = {0, 0, 127}));
initial equation

protected
  annotation(
    Documentation(info = "<html>
<p>
This example demonstrates the concentration response of a grid of nine indoor air volumes connected by conducting elements. The nine volumes have the same volume and initial concentration. The volum in the middle of the grid have an industrial process that generates nanoparticles with a pulse function with a period of 3000s (50% the pulse is on on and 50% of the pulse is off). The concentration will rise in the grid (there is no incoming clean air).
</p>
<p>
Simulate for 10000 s and plot the variables<br>
Room.ParticleCapacitor.N, Room2.ParticleCapacitor.N, Room21.ParticleCapacitor.N, Room211.ParticleCapacitor.N, Room211.ParticleCapacitor.N, Room3.ParticleCapacitor.N, Room31.ParticleCapacitor.N, Room32.ParticleCapacitor.N, Room33.ParticleCapacitor.N   
</p>
</html>"),
    experiment(StopTime = 10000, Interval = 1, StartTime = 0, Tolerance = 1e-06));
end OpenSpace;
