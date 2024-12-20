within INP.Components;

model Ventilation "Lumped thermal element transporting heat without storing it"
  parameter Units.NonSI.ParticleConductance Q "Constant ventilation airflow rate";
  parameter Units.NonSI.ParticleConcetration N(start = 5e9, displayUnit = "1/m3") "Background concentration";
  Sources.FixedConcentration fixedConcentration(N = N) annotation(
    Placement(visible = true, transformation(origin = {50, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  PGNP.Interfaces.NPort_a port_a annotation(
    Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PGNP.Components.ForcedParticleConductor forcedParticleConductor(Q = Q) annotation(
    Placement(visible = true, transformation(origin = {-18, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(port_a, forcedParticleConductor.port_a) annotation(
    Line(points = {{-100, 0}, {-28, 0}}, color = {191, 0, 0}));
  connect(forcedParticleConductor.port_b, fixedConcentration.port) annotation(
    Line(points = {{-8, 0}, {40, 0}}, color = {191, 0, 0}));
  annotation(
    Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Text(origin = {-4, 4}, lineColor = {0, 0, 255}, extent = {{-150, 120}, {150, 80}}, textString = "%name"), Text(origin = {-300, 136}, extent = {{-196, -91}, {196, -125}}, textString = "Q=%Q", horizontalAlignment = TextAlignment.Right), Bitmap(origin = {-114, 54}, extent = {{0, 14}, {0, -14}}), Rectangle(origin = {1, 41}, lineThickness = 0.5, extent = {{-33, 17}, {33, -17}}, radius = 8), Rectangle(origin = {1, -2}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 0.5, extent = {{-81, 44}, {81, -44}}, radius = 8), Rectangle(origin = {-60, 0}, fillPattern = FillPattern.Solid, extent = {{-3, 23}, {3, -23}}), Ellipse(origin = {-21, -57}, fillPattern = FillPattern.Solid, extent = {{-5, 5}, {5, -5}}), Ellipse(origin = {23, -57}, fillPattern = FillPattern.Solid, extent = {{-5, 5}, {5, -5}}), Ellipse(origin = {3, -57}, fillPattern = FillPattern.Solid, extent = {{-5, 5}, {5, -5}}), Ellipse(origin = {-35, -73}, fillPattern = FillPattern.Solid, extent = {{-5, 5}, {5, -5}}), Ellipse(origin = {19, -83}, fillPattern = FillPattern.Solid, extent = {{-5, 5}, {5, -5}}), Ellipse(origin = {-7, -65}, fillPattern = FillPattern.Solid, extent = {{-5, 5}, {5, -5}}), Ellipse(origin = {39, -57}, fillPattern = FillPattern.Solid, extent = {{-5, 5}, {5, -5}}), Ellipse(origin = {-41, -55}, fillPattern = FillPattern.Solid, extent = {{-5, 5}, {5, -5}}), Ellipse(origin = {-71, -85}, fillPattern = FillPattern.Solid, extent = {{-5, 5}, {5, -5}}), Ellipse(origin = {79, -75}, fillPattern = FillPattern.Solid, extent = {{-5, 5}, {5, -5}}), Text(origin = {-300, 76}, extent = {{-195, -91}, {195, -125}}, textString = "N=%N", horizontalAlignment = TextAlignment.Right), Rectangle(origin = {-20, 0}, fillPattern = FillPattern.Solid, extent = {{-3, 23}, {3, -23}}), Rectangle(origin = {18, 0}, fillPattern = FillPattern.Solid, extent = {{-3, 23}, {3, -23}}), Rectangle(origin = {58, 0}, fillPattern = FillPattern.Solid, extent = {{-3, 23}, {3, -23}})}),
    Documentation(info = "<html>
<p>
This is a purifier that moves air and captures nanoparticles; see also:
<a href=\"modelica://PGNP.Components.ParticlePurifier\">ParticlePurifierConductor</a>.
It may be used to connect to a particle capacitor to reduce its concentration of particles. G is the air that is able to move the purifier and E its efficiency. The element also provide the quantity of nanoparticles captured during its operation.
</p>
</html>"));
end Ventilation;
