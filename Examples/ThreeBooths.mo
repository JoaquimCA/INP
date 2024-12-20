within INP.Examples;

model ThreeBooths "Simple diffusion demo"
  extends Modelica.Icons.Example;
  package Medium = Buildings.Media.Air(extraPropertiesNames = {"CO2"});
  Modelica.Units.SI.Power P_total(fixed = false) "Total power consumption at each instant";
  Modelica.Units.SI.Power P_HVOF(fixed = false) "HVOF power consumption at each instant";
  Modelica.Units.SI.Power P_APS(fixed = false) "APS power consumption at each instant";
  Components.ParticleCapacitor booth1(N(fixed = false), V = 45) annotation(
    Placement(visible = true, transformation(origin = {-82, 82}, extent = {{-14, -14}, {14, 14}}, rotation = 0)));
  Components.ParticleCapacitor booth2(N(fixed = false), V = 102) annotation(
    Placement(visible = true, transformation(origin = {82, 82}, extent = {{-14, -14}, {14, 14}}, rotation = 0)));
  Components.ParticleCapacitor booth3(N(fixed = false), V = 84) annotation(
    Placement(visible = true, transformation(origin = {52, -70}, extent = {{-14, -14}, {14, 14}}, rotation = 0)));
  Sensors.NanoParticleCountingSensor Nsensor2 annotation(
    Placement(visible = true, transformation(origin = {58, 68}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Sensors.NanoParticleCountingSensor Nsensor3 annotation(
    Placement(visible = true, transformation(origin = {80, -84}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Sensors.NanoParticleCountingSensor Nsensor1 annotation(
    Placement(visible = true, transformation(origin = {-54, 68}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.MultiProduct multiProduct(nu = 2) annotation(
    Placement(visible = true, transformation(origin = {-56, -68}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant cm3_to_m3(k = 10^6) annotation(
    Placement(visible = true, transformation(origin = {-82, -44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.CombiTimeTable background(extrapolation = Modelica.Blocks.Types.Extrapolation.HoldLastPoint, fileName = "G:/Mi unidad/Doctorat/papers/energia/bg.txt", tableName = "tab", tableOnFile = true, timeScale = 60) annotation(
    Placement(visible = true, transformation(origin = {-82, -86}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Sources.PrescribedConcentration BG annotation(
    Placement(visible = true, transformation(origin = {-40, -44}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.CombiTimeTable ventilations(columns = 2:4, extrapolation = Modelica.Blocks.Types.Extrapolation.HoldLastPoint, fileName = "G:/Mi unidad/Doctorat/papers/energia/ven.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, tableName = "tab", tableOnFile = true, timeScale = 60) annotation(
    Placement(visible = true, transformation(origin = {-66, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Sources.PrescribedPulsingParticleFlow APS2(P_flow(displayUnit = "s-1") = 2.3e13) annotation(
    Placement(visible = true, transformation(origin = {66, 42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Sources.PrescribedPulsingParticleFlow APS3(P_flow(displayUnit = "s-1") = 2.3e13) annotation(
    Placement(visible = true, transformation(origin = {56, -44}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Sources.PrescribedPulsingParticleFlow HVOF1(P_flow(displayUnit = "s-1") = 6.08e13) annotation(
    Placement(visible = true, transformation(origin = {-62, 44}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.CombiTimeTable generations(columns = 2:4, extrapolation = Modelica.Blocks.Types.Extrapolation.HoldLastPoint, fileName = "G:/Mi unidad/Doctorat/papers/energia/gen.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, tableName = "tab", tableOnFile = true, timeScale = 60) annotation(
    Placement(visible = true, transformation(origin = {70, -2}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Sensors.NanoParticleCountingSensor NsensorBG annotation(
    Placement(visible = true, transformation(origin = {-12, -44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.RealToBoolean r2B1 annotation(
    Placement(visible = true, transformation(origin = {-38, 44}, extent = {{6, -6}, {-6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.RealToBoolean r2B3 annotation(
    Placement(visible = true, transformation(origin = {78, -44}, extent = {{6, -6}, {-6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.RealToBoolean r2B2 annotation(
    Placement(visible = true, transformation(origin = {42, 42}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Components.DividedConductorP ventAPS(Qven = 4.17, pd = 178.1*2.95) annotation(
    Placement(visible = true, transformation(origin = {22, -26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Components.PulsingConductorP ventHVOF(Qven = 2, pd = 163.4*4.6) annotation(
    Placement(visible = true, transformation(origin = {-82, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
equation
  connect(booth3.port, Nsensor3.port) annotation(
    Line(points = {{52, -84}, {70, -84}}, color = {191, 0, 0}));
  connect(Nsensor1.port, booth1.port) annotation(
    Line(points = {{-64, 68}, {-82, 68}}, color = {191, 0, 0}));
  connect(multiProduct.y, BG.N) annotation(
    Line(points = {{-49, -68}, {-39.98, -68}, {-39.98, -56}}, color = {0, 0, 127}));
  connect(cm3_to_m3.y, multiProduct.u[1]) annotation(
    Line(points = {{-71, -44}, {-62, -44}, {-62, -68}}, color = {0, 0, 127}));
  connect(background.y[1], multiProduct.u[2]) annotation(
    Line(points = {{-71, -86}, {-62, -86}, {-62, -68}}, color = {0, 0, 127}));
  connect(APS2.port, booth2.port) annotation(
    Line(points = {{76, 42}, {82, 42}, {82, 68}}, color = {191, 0, 0}));
  connect(Nsensor2.port, booth2.port) annotation(
    Line(points = {{68, 68}, {82, 68}}, color = {191, 0, 0}));
  connect(r2B2.y, APS2.switch) annotation(
    Line(points = {{49, 42}, {57, 42}}, color = {255, 0, 255}));
  connect(r2B1.y, HVOF1.switch) annotation(
    Line(points = {{-45, 44}, {-53, 44}}, color = {255, 0, 255}));
  connect(r2B3.y, APS3.switch) annotation(
    Line(points = {{72, -44}, {66, -44}}, color = {255, 0, 255}));
  connect(r2B2.u, generations.y[2]) annotation(
    Line(points = {{35, 42}, {26, 42}, {26, -2}, {59, -2}}, color = {0, 0, 127}));
  connect(generations.y[3], r2B3.u) annotation(
    Line(points = {{59, -2}, {52, -2}, {52, -28}, {94, -28}, {94, -44}, {86, -44}}, color = {0, 0, 127}));
  connect(generations.y[1], r2B1.u) annotation(
    Line(points = {{59, -2}, {-28, -2}, {-28, 44}, {-31, 44}}, color = {0, 0, 127}));
  connect(BG.port, ventAPS.port_a) annotation(
    Line(points = {{-40, -34}, {-40, -26}, {12, -26}}, color = {191, 0, 0}));
  connect(ventAPS.port_c, booth3.port) annotation(
    Line(points = {{32, -29}, {36, -29}, {36, -84}, {52, -84}}, color = {191, 0, 0}));
  connect(ventAPS.port_b, booth2.port) annotation(
    Line(points = {{32, -24}, {36, -24}, {36, 30}, {82, 30}, {82, 68}}, color = {191, 0, 0}));
  connect(ventilations.y[2], ventAPS.v) annotation(
    Line(points = {{-55, -10}, {22, -10}, {22, -16}}, color = {0, 0, 127}));
  connect(ventilations.y[3], ventAPS.u) annotation(
    Line(points = {{-55, -10}, {8, -10}, {8, -42}, {22, -42}, {22, -35}}, color = {0, 0, 127}));
  connect(NsensorBG.port, BG.port) annotation(
    Line(points = {{-22, -44}, {-28, -44}, {-28, -26}, {-40, -26}, {-40, -34}}, color = {191, 0, 0}));
  connect(APS3.port, booth3.port) annotation(
    Line(points = {{46, -44}, {36, -44}, {36, -84}, {52, -84}}, color = {191, 0, 0}));
  connect(HVOF1.port, booth1.port) annotation(
    Line(points = {{-72, 44}, {-82, 44}, {-82, 68}}, color = {191, 0, 0}));
  connect(ventHVOF.port_b, booth1.port) annotation(
    Line(points = {{-82, 30}, {-82, 68}}, color = {191, 0, 0}));
  connect(ventHVOF.port_a, BG.port) annotation(
    Line(points = {{-82, 10}, {-82, -26}, {-40, -26}, {-40, -34}}, color = {191, 0, 0}));
  connect(ventHVOF.u, ventilations.y[1]) annotation(
    Line(points = {{-72, 20}, {-38, 20}, {-38, -10}, {-54, -10}}, color = {0, 0, 127}));
  P_HVOF = ventHVOF.fan.P*10;
  P_APS = ventAPS.fan.P*10;
  P_total = P_HVOF + P_APS;
  annotation(
    Documentation(info = "<html>
<p>
This example simulates a pilot plant from LIFE NANOHEALTH project with three independent thermal spraying booths.
</p>
</html>"),
    experiment(StopTime = 32400, Interval = 1));
end ThreeBooths;
