within INP.Examples;

model BoothTwoFlows "Simple diffusion demo"
  extends Modelica.Icons.Example;
  parameter Units.NonSI.ParticleConcetration C_final(fixed = false) "Final Concentration";
  Sensors.NanoParticleCountingSensor boothSensor annotation(
    Placement(visible = true, transformation(origin = {-66, 48}, extent = {{12, -12}, {-12, 12}}, rotation = 0)));
  Components.ParticleCapacitor booth(N(displayUnit = "1/m3", fixed = true, start = 6e10), V = 102) annotation(
    Placement(visible = true, transformation(origin = {-17, 77}, extent = {{-14, -14}, {14, 14}}, rotation = 0)));
  Components.PulsingConductor pulsingVentilation(Q = 6*4.0842) annotation(
    Placement(visible = true, transformation(origin = {0, 10}, extent = {{-14, -14}, {14, 14}}, rotation = 90)));
  Modelica.Blocks.Sources.CombiTimeTable genPulses(extrapolation = Modelica.Blocks.Types.Extrapolation.HoldLastPoint, fileName = "G:/La meva unitat/Doctorat/Campanyes/TM Comas/r_comas2.txt", tableName = "tab", tableOnFile = true, timeScale = 60) annotation(
    Placement(visible = true, transformation(origin = {80, 28}, extent = {{10, 10}, {-10, -10}}, rotation = -90)));
  Modelica.Blocks.Math.RealToBoolean real2BoolVentilation(threshold = 0.5) annotation(
    Placement(visible = true, transformation(origin = {-44, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.CombiTimeTable venPulses(extrapolation = Modelica.Blocks.Types.Extrapolation.HoldLastPoint, fileName = "G:/La meva unitat/Doctorat/Campanyes/TM Comas/ven_comas.txt", tableName = "tab", tableOnFile = true, timeScale = 60) annotation(
    Placement(visible = true, transformation(origin = {-82, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Sources.PrescribedPulsingParticleFlow generation(N_ref = 0.005, P_flow(displayUnit = "s-1") = 2.3e13) annotation(
    Placement(visible = true, transformation(origin = {32, 62}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.RealToBoolean real2BoolSource(threshold = 0.5) annotation(
    Placement(visible = true, transformation(origin = {68, 62}, extent = {{-10, 10}, {10, -10}}, rotation = 180)));
  Components.PulsingConductor door(Q = 0.0173) annotation(
    Placement(visible = true, transformation(origin = {44, 8}, extent = {{14, -14}, {-14, 14}}, rotation = -90)));
  Modelica.Blocks.Math.RealToBoolean real2BoolDoor(threshold = 0.5) annotation(
    Placement(visible = true, transformation(origin = {80, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.CombiTimeTable doorPulses(extrapolation = Modelica.Blocks.Types.Extrapolation.HoldLastPoint, fileName = "G:/La meva unitat/Doctorat/Campanyes/TM Comas/door_comas.txt", tableName = "tab", tableOnFile = true, timeScale = 60) annotation(
    Placement(visible = true, transformation(origin = {80, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Sensors.NanoParticleCountingSensor bgSensor annotation(
    Placement(visible = true, transformation(origin = {-44, -22}, extent = {{12, -12}, {-12, 12}}, rotation = 0)));
  Modelica.Blocks.Sources.CombiTimeTable background(extrapolation = Modelica.Blocks.Types.Extrapolation.HoldLastPoint, fileName = "G:/La meva unitat/Doctorat/Campanyes/TM Comas/bg_comas_2min.txt", tableName = "tab", tableOnFile = true, timeScale = 120) annotation(
    Placement(visible = true, transformation(origin = {-78, -84}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.MultiProduct multiProduct(nu = 2) annotation(
    Placement(visible = true, transformation(origin = {-32, -68}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant cm3_to_m3(k = 10^6) annotation(
    Placement(visible = true, transformation(origin = {-78, -52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Sources.PrescribedConcentration bgConcentration annotation(
    Placement(visible = true, transformation(origin = {44, -32}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
equation
  connect(boothSensor.port, booth.port) annotation(
    Line(points = {{-54, 48}, {-17, 48}, {-17, 63}}, color = {191, 0, 0}));
  connect(pulsingVentilation.port_b, booth.port) annotation(
    Line(points = {{0, 24}, {0, 40}, {-17, 40}, {-17, 63}}, color = {191, 0, 0}));
  connect(real2BoolVentilation.y, pulsingVentilation.switch) annotation(
    Line(points = {{-33, 10}, {-17, 10}}, color = {255, 0, 255}));
  connect(venPulses.y[1], real2BoolVentilation.u) annotation(
    Line(points = {{-71, 10}, {-56, 10}}, color = {0, 0, 127}));
  connect(genPulses.y[1], real2BoolSource.u) annotation(
    Line(points = {{80, 39}, {80, 62}}, color = {0, 0, 127}));
  connect(real2BoolSource.y, generation.switch) annotation(
    Line(points = {{57, 62}, {41, 62}}, color = {255, 0, 255}));
  connect(door.port_b, booth.port) annotation(
    Line(points = {{44, 22}, {44, 40}, {-17, 40}, {-17, 63}}, color = {191, 0, 0}));
  connect(real2BoolDoor.y, door.switch) annotation(
    Line(points = {{80, -18}, {80, 8}, {61, 8}}, color = {255, 0, 255}));
  connect(doorPulses.y[1], real2BoolDoor.u) annotation(
    Line(points = {{80, -68}, {80, -42}}, color = {0, 0, 127}));
  connect(generation.port, booth.port) annotation(
    Line(points = {{22, 62}, {-17, 62}, {-17, 63}}, color = {191, 0, 0}));
  connect(background.y[1], multiProduct.u[1]) annotation(
    Line(points = {{-66, -84}, {-38, -84}, {-38, -68}}, color = {0, 0, 127}));
  connect(cm3_to_m3.y, multiProduct.u[2]) annotation(
    Line(points = {{-67, -52}, {-38, -52}, {-38, -68}}, color = {0, 0, 127}));
  connect(pulsingVentilation.port_a, bgConcentration.port) annotation(
    Line(points = {{0, -4}, {0, -22}, {44, -22}}, color = {191, 0, 0}));
  connect(bgSensor.port, bgConcentration.port) annotation(
    Line(points = {{-32, -22}, {44, -22}}, color = {191, 0, 0}));
  connect(door.port_a, bgConcentration.port) annotation(
    Line(points = {{44, -6}, {44, -22}}, color = {191, 0, 0}));
  connect(multiProduct.y, bgConcentration.N) annotation(
    Line(points = {{-24, -68}, {44, -68}, {44, -44}}, color = {0, 0, 127}));
protected
  annotation(
    Documentation(info = "<html>
<p>
This example demonstrates the concentration response of one cabin with varying INP generation and airflows due to mechanical ventilation and door opening, connecting the cabin to a fixed concentration that varies along time and acts as background. The concentration in the room will increase due to the industrial process embedded or the fixed concentration while airflow between them exists.
</p>
<p>
Load your txt files to simulate specific routines and background concentrations.
</p>
</html>"),
    experiment(StopTime = 600.0, Interval = 0.001));
end BoothTwoFlows;
