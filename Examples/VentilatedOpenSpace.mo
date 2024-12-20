within INP.Examples;

model VentilatedOpenSpace "Simple diffusion demo"
  constant Real FlowS = 0.5;
  constant Real WallS = 0.1;
  constant Real WallC = 2;
  constant Real Corner = 3;
  extends Modelica.Icons.Example;
  parameter Units.NonSI.ParticleConcetration C_final(fixed = false) "Final Concentration";
  INP.Components.Room room(C0 = 160e9, V = 70, XE = FlowS, XW = FlowS, YN = FlowS, YS = FlowS) annotation(
    Placement(visible = true, transformation(origin = {24, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  INP.Components.Room2 room2(V = 70, XE = Corner, YS = Corner) annotation(
    Placement(visible = true, transformation(origin = {-46, 64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  INP.Components.Room2 room21(V = 70, XE = Corner, YS = Corner) annotation(
    Placement(visible = true, transformation(origin = {84, 64}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  INP.Components.Room2 room211(V = 70, XE = Corner, YS = Corner) annotation(
    Placement(visible = true, transformation(origin = {84, -56}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  INP.Components.Room2 room2111(V = 70, XE = Corner, YS = Corner) annotation(
    Placement(visible = true, transformation(origin = {-46, -56}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  INP.Components.Room3 room3(V = 70, XE = WallC, XW = WallC, YS = 0.1) annotation(
    Placement(visible = true, transformation(origin = {24, 64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  INP.Components.Room3 room31(V = 70, XE = WallC, XW = WallC, YS = WallS) annotation(
    Placement(visible = true, transformation(origin = {84, 4}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  INP.Components.Room3 room32(V = 70, XE = WallC, XW = WallC, YS = WallS) annotation(
    Placement(visible = true, transformation(origin = {-46, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  INP.Components.Room3 room33(V = 70, XE = WallC, XW = WallC, YS = WallS) annotation(
    Placement(visible = true, transformation(origin = {24, -56}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Sources.Constant const(k = 3.21e10) annotation(
    Placement(visible = true, transformation(origin = {-18, -26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  INP.Components.ForcedParticleConductor forcedParticleConductor(G = 200) annotation(
    Placement(visible = true, transformation(origin = {-82, -20}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  INP.Sources.FixedConcentration fixedConcentration(C = 10e9) annotation(
    Placement(visible = true, transformation(origin = {-82, -76}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
equation
  connect(room3.port_b, room21.port_a) annotation(
    Line(points = {{34, 63.8}, {74, 63.8}}, color = {191, 0, 0}));
  connect(room2.port_b, room3.port_a) annotation(
    Line(points = {{-36, 63.8}, {14, 63.8}}, color = {191, 0, 0}));
  connect(room21.port_b, room31.port_a) annotation(
    Line(points = {{83.8, 54}, {83.8, 49}, {83.6, 49}, {83.6, 14}}, color = {191, 0, 0}));
  connect(room31.port_b, room211.port_a) annotation(
    Line(points = {{83.8, -6}, {83.8, -41}, {84, -41}, {84, -46}}, color = {191, 0, 0}));
  connect(room32.port_a, room2111.port_b) annotation(
    Line(points = {{-46, -6}, {-46, -46}}, color = {191, 0, 0}));
  connect(room32.port_b, room2.port_a) annotation(
    Line(points = {{-45.8, 14}, {-45.8, 49}, {-46, 49}, {-46, 54}}, color = {191, 0, 0}));
  connect(room33.port_a, room211.port_b) annotation(
    Line(points = {{34, -56}, {74, -56}}, color = {191, 0, 0}));
  connect(room2111.port_a, room33.port_b) annotation(
    Line(points = {{-36.2, -56}, {13.8, -56}}, color = {191, 0, 0}));
  connect(room3.port_a1, room.port_YN) annotation(
    Line(points = {{24, 54}, {24, 14}}, color = {191, 0, 0}));
  connect(room.port_XE, room31.port_a1) annotation(
    Line(points = {{34, 4}, {74, 4}}, color = {191, 0, 0}));
  connect(room33.port_a1, room.port_YS) annotation(
    Line(points = {{24, -46}, {24, -6}}, color = {191, 0, 0}));
  connect(room32.port_a1, room.port_XW) annotation(
    Line(points = {{-36, 4}, {14, 4}}, color = {191, 0, 0}));
  connect(const.y, room.u) annotation(
    Line(points = {{-7, -26}, {14, -26}, {14, -2}}, color = {0, 0, 127}));
  connect(fixedConcentration.port, forcedParticleConductor.port_b) annotation(
    Line(points = {{-82, -66}, {-82, -30}}, color = {191, 0, 0}));
  connect(forcedParticleConductor.port_a, room32.port_a) annotation(
    Line(points = {{-82, -10}, {-82, -13}, {-46, -13}, {-46, -6}}, color = {191, 0, 0}));
initial equation

protected
  annotation(
    Documentation(info = "<html>
<p>
This example illustrates the concentration dynamics in a grid of nine interconnected indoor air volumes linked by conducting elements. All nine volumes share the same size and initial concentration. The central volume of the grid hosts an industrial process that continuously generates nanoparticles. Additionally, a ventilation system located on one side of the grid creates an asymmetrical propagation of its effects throughout the system.
</p>
</html>"),
    experiment(StopTime = 10000, Interval = 1, StartTime = 0, Tolerance = 1e-06));
end VentilatedOpenSpace;
