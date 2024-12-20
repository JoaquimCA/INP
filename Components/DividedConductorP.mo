within INP.Components;

model DividedConductorP "Indoor air virtual volume with 2D particle dispersion and one source, with one wall in XN"
  package Medium = Buildings.Media.Air(extraPropertiesNames = {"CO2"});
  parameter Units.NonSI.ParticleConductance Qven "Constant particle conductance of a space";
  parameter Modelica.Units.SI.Pressure pd(displayUnit = "Pa") "pressure drop due to ventilation";
  Buildings.Fluid.Sources.Boundary_pT bou(redeclare package Medium = Medium, T = 293.15, nPorts = 1, p = 101325 - pd) annotation(
    Placement(visible = true, transformation(origin = {-20, -32}, extent = {{-72, -26}, {-52, -6}}, rotation = 0)));
  Buildings.Fluid.Sources.Boundary_pT sin(redeclare package Medium = Medium, T = 293.15, nPorts = 1, p = 101325) annotation(
    Placement(visible = true, transformation(origin = {-104, -66}, extent = {{-90, -28}, {-70, -8}}, rotation = 180)));
  Buildings.Fluid.Movers.Preconfigured.FlowControlled_m_flow fan(redeclare package Medium = Medium, addPowerToMedium = false, dpMax = 1e5, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, m_flow_nominal = 1.293*Qven) annotation(
    Placement(visible = true, transformation(origin = {-62, -30}, extent = {{0, -28}, {20, -8}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput u annotation(
    Placement(visible = true, transformation(origin = {0, -108}, extent = {{-20, -20}, {20, 20}}, rotation = 90), iconTransformation(origin = {4, -92}, extent = {{-20, -20}, {20, 20}}, rotation = 90)));
  Interfaces.NPort_a port_a annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-110, -10}, {-90, 10}}, rotation = 0), iconTransformation(origin = {0, 0}, extent = {{-110, -10}, {-90, 10}}, rotation = 0)));
  Interfaces.NPort_b port_b annotation(
    Placement(visible = true, transformation(origin = {0, 16}, extent = {{90, -10}, {110, 10}}, rotation = 0), iconTransformation(origin = {2, 20}, extent = {{90, -10}, {110, 10}}, rotation = 0)));
  Components.PrescribedConductor ven1(Q = Qven) annotation(
    Placement(visible = true, transformation(origin = {51, 16}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput v annotation(
    Placement(visible = true, transformation(origin = {0, 108}, extent = {{20, -20}, {-20, 20}}, rotation = 90), iconTransformation(origin = {2, 116}, extent = {{20, -20}, {-20, 20}}, rotation = 90)));
  Interfaces.NPort_b port_c annotation(
    Placement(visible = true, transformation(origin = {0, -16}, extent = {{90, -10}, {110, 10}}, rotation = 0), iconTransformation(origin = {2, -26}, extent = {{90, -10}, {110, 10}}, rotation = 0)));
  Components.PrescribedConductor ven2(Q = Qven) annotation(
    Placement(visible = true, transformation(origin = {51, -16}, extent = {{-15, 15}, {15, -15}}, rotation = 0)));
  Modelica.Blocks.Logical.Or or_input annotation(
    Placement(visible = true, transformation(origin = {2, -2}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.RealToBoolean r2B1(threshold = 0.1) annotation(
    Placement(visible = true, transformation(origin = {20, 50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Math.RealToBoolean r2B2(threshold = 0.1) annotation(
    Placement(visible = true, transformation(origin = {20, -46}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  Modelica.Blocks.Math.BooleanToReal B2r annotation(
    Placement(visible = true, transformation(origin = {-30, -2}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
equation
  connect(bou.ports[1], fan.port_a) annotation(
    Line(points = {{-72, -48}, {-62, -48}}, color = {0, 127, 255}));
  connect(fan.port_b, sin.ports[1]) annotation(
    Line(points = {{-42, -48}, {-34, -48}}, color = {0, 127, 255}));
  connect(ven1.port_b, port_b) annotation(
    Line(points = {{66, 16}, {100, 16}}, color = {191, 0, 0}));
  connect(port_c, ven2.port_b) annotation(
    Line(points = {{100, -16}, {66, -16}}, color = {191, 0, 0}));
  connect(ven2.port_a, port_a) annotation(
    Line(points = {{36, -16}, {-58, -16}, {-58, 0}, {-100, 0}}, color = {191, 0, 0}));
  connect(ven1.port_a, port_a) annotation(
    Line(points = {{36, 16}, {-58, 16}, {-58, 0}, {-100, 0}}, color = {191, 0, 0}));
  connect(v, ven1.Qprop) annotation(
    Line(points = {{0, 108}, {0, 76}, {51, 76}, {51, 34}}, color = {0, 0, 127}));
  connect(u, ven2.Qprop) annotation(
    Line(points = {{0, -108}, {0, -72}, {52, -72}, {52, -34}}, color = {0, 0, 127}));
  connect(or_input.u1, r2B1.y) annotation(
    Line(points = {{14, -2}, {20, -2}, {20, 40}}, color = {255, 0, 255}));
  connect(or_input.u2, r2B2.y) annotation(
    Line(points = {{14, -10}, {20, -10}, {20, -35}}, color = {255, 0, 255}));
  connect(r2B2.u, u) annotation(
    Line(points = {{20, -58}, {20, -72}, {0, -72}, {0, -108}}, color = {0, 0, 127}));
  connect(or_input.y, B2r.u) annotation(
    Line(points = {{-8, -2}, {-18, -2}}, color = {255, 0, 255}));
  connect(B2r.y, fan.m_flow_in) annotation(
    Line(points = {{-40, -2}, {-52, -2}, {-52, -36}}, color = {0, 0, 127}));
  connect(r2B1.u, v) annotation(
    Line(points = {{20, 62}, {20, 76}, {0, 76}, {0, 108}}, color = {0, 0, 127}));
  annotation(
    Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Ellipse(origin = {34, -10}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Ellipse(origin = {2, 44}, extent = {{-90, 92}, {90, -92}}), Rectangle(origin = {-44, 0}, lineColor = {170, 170, 0}, fillColor = {243, 243, 243}, pattern = LinePattern.None, fillPattern = FillPattern.HorizontalCylinder, extent = {{-45, 50}, {45, -50}}), Ellipse(origin = {-26, -22}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Ellipse(origin = {-60, 10}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Ellipse(origin = {-70, -4}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Ellipse(origin = {-50, 0}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Line(origin = {91.0966, -1.2346}, points = {{-90, 50}, {-90, -50}}, thickness = 0.5), Rectangle(origin = {-8, 92}, fillColor = {255, 255, 255}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, extent = {{-117, 44}, {117, -44}}), Text(origin = {2, -24}, lineColor = {0, 0, 255}, extent = {{-150, 120}, {150, 80}}, textString = "%name"), Line(origin = {36.4, 2.6}, points = {{-36, 41}, {24, -29}}, color = {170, 170, 0}, thickness = 3), Ellipse(origin = {12, -2}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}})}),
    Documentation(info = "<html>
Variable conductor extraction element able to split the airflow rate in two with a single power demand prediction.
</html>"));
end DividedConductorP;
