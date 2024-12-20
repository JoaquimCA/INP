within INP.Components;

model PulsingConductorP "Indoor air virtual volume with 2D particle dispersion and one source, with one wall in XN"
  package Medium = Buildings.Media.Air(extraPropertiesNames = {"CO2"});
  parameter Units.NonSI.ParticleConductance Qven "Constant particle conductance of a space";
  parameter Modelica.Units.SI.Pressure pd(displayUnit = "Pa") "pressure drop due to ventilation";
  Buildings.Fluid.Sources.Boundary_pT bou(redeclare package Medium = Medium, T = 293.15, nPorts = 1, p = 101325 - pd) annotation(
    Placement(visible = true, transformation(origin = {26, -32}, extent = {{-72, -26}, {-52, -6}}, rotation = 0)));
  Buildings.Fluid.Sources.Boundary_pT sin(redeclare package Medium = Medium, T = 293.15, nPorts = 1, p = 101325) annotation(
    Placement(visible = true, transformation(origin = {-46, -66}, extent = {{-90, -28}, {-70, -8}}, rotation = 180)));
  //<<<<<<< Updated upstream
  //  Buildings.Fluid.Movers.Preconfigured.FlowControlled_m_flow fan(redeclare package Medium = Medium, addPowerToMedium = false, dpMax = 1e5, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, m_flow_nominal = 1.293 * Qven) annotation(
  //=======
  Buildings.Fluid.Movers.Preconfigured.FlowControlled_m_flow fan(redeclare package Medium = Medium, dpMax = 1e5, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, m_flow_nominal = 1.293*Qven) annotation(
    Placement(visible = true, transformation(origin = {-10, -30}, extent = {{0, -28}, {20, -8}}, rotation = 0)));
  Components.PulsingConductor pulsingVentilation(Q = Qven) annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-14, -14}, {14, 14}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput u annotation(
    Placement(visible = true, transformation(origin = {0, -108}, extent = {{-20, -20}, {20, 20}}, rotation = 90), iconTransformation(origin = {4, -92}, extent = {{-20, -20}, {20, 20}}, rotation = 90)));
  Modelica.Blocks.Math.Sign sign annotation(
    Placement(visible = true, transformation(origin = {-60, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.RealToBoolean realToBoolean(threshold = 0.5) annotation(
    Placement(visible = true, transformation(origin = {0, 50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Interfaces.NPort_a port_a annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-110, -10}, {-90, 10}}, rotation = 0), iconTransformation(origin = {0, 0}, extent = {{-110, -10}, {-90, 10}}, rotation = 0)));
  Interfaces.NPort_b port_b annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{90, -10}, {110, 10}}, rotation = 0), iconTransformation(origin = {0, 0}, extent = {{90, -10}, {110, 10}}, rotation = 0)));
equation
  connect(bou.ports[1], fan.port_a) annotation(
    Line(points = {{-26, -48}, {-10, -48}}, color = {0, 127, 255}));
  connect(fan.port_b, sin.ports[1]) annotation(
    Line(points = {{10, -48}, {24, -48}}, color = {0, 127, 255}));
  connect(port_a, pulsingVentilation.port_a) annotation(
    Line(points = {{-100, 0}, {-14, 0}}, color = {191, 0, 0}));
  connect(pulsingVentilation.port_b, port_b) annotation(
    Line(points = {{14, 0}, {100, 0}}, color = {191, 0, 0}));
  connect(sign.y, fan.m_flow_in) annotation(
    Line(points = {{-49, -22}, {0, -22}, {0, -36}}, color = {0, 0, 127}));
  connect(realToBoolean.y, pulsingVentilation.switch) annotation(
    Line(points = {{0, 39}, {0, 17}}, color = {255, 0, 255}));
  connect(realToBoolean.u, u) annotation(
    Line(points = {{0, 62}, {0, 78}, {-82, 78}, {-82, -72}, {0, -72}, {0, -108}}, color = {0, 0, 127}));
  connect(pulsingVentilation.port_a, port_a) annotation(
    Line(points = {{-14, 0}, {-100, 0}}, color = {191, 0, 0}));
  connect(pulsingVentilation.port_b, port_b) annotation(
    Line(points = {{14, 0}, {100, 0}}, color = {191, 0, 0}));
  connect(sign.u, u) annotation(
    Line(points = {{-72, -22}, {-82, -22}, {-82, -72}, {0, -72}, {0, -108}}, color = {0, 0, 127}));
  annotation(
    Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Ellipse(origin = {18, 6}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Ellipse(origin = {34, -10}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Ellipse(origin = {56, 2}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Ellipse(origin = {2, 44}, extent = {{-90, 92}, {90, -92}}), Rectangle(origin = {-44, 0}, lineColor = {170, 170, 0}, fillColor = {243, 243, 243}, pattern = LinePattern.None, fillPattern = FillPattern.HorizontalCylinder, extent = {{-45, 50}, {45, -50}}), Ellipse(origin = {-26, -22}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Ellipse(origin = {-60, 10}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Ellipse(origin = {-70, -4}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Ellipse(origin = {-50, 0}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Line(origin = {91.0966, -1.2346}, points = {{-90, 50}, {-90, -50}}, thickness = 0.5), Rectangle(origin = {2, 94}, fillColor = {255, 255, 255}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, extent = {{-93, 46}, {93, -46}}), Text(origin = {2, -20}, textColor = {0, 0, 255}, extent = {{-150, 120}, {150, 80}}, textString = "%name"), Line(origin = {36.8, 2.2}, points = {{-36, 43}, {54, 43}}, color = {170, 170, 0}, thickness = 3)}),
    Documentation(info = "<html>
Pulsing conductor extraction element with incorporated power demand prediction.
</html>"));
end PulsingConductorP;
