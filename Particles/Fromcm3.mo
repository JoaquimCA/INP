within INP.Particles;

model Fromcm3 "Conversion from Kelvin to degree Celsius"
  extends Modelica.Thermal.HeatTransfer.Icons.Conversion;
  Modelica.Blocks.Interfaces.RealInput Particlecm3(unit = "1/cm3") annotation(
    Placement(transformation(extent = {{-140, -20}, {-100, 20}})));
  Modelica.Blocks.Interfaces.RealOutput Particlem3(unit = "1/m3") annotation(
    Placement(transformation(extent = {{100, -10}, {120, 10}})));
equation
  Particlem3 = Units.Conversions.from_cm3(Particlecm3);
  annotation(
    Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Text(textColor = {64, 64, 64}, extent = {{-100, 60}, {-40, 0}}, textString = "1/cm3"), Text(textColor = {64, 64, 64}, extent = {{40, 60}, {100, 0}}, textString = "1/m3")}),
    Documentation(info = "<html>
  <p>
  This component converts an input signal from Particlecm3 to Particlem3
  and provides it as output signal.
  </p>
  </html>"));
end Fromcm3;
