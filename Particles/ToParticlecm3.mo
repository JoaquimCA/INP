within INP.Particles;

model ToParticlecm3 "Conversion from degree Celsius to Kelvin"
  extends Modelica.Thermal.HeatTransfer.Icons.Conversion;
  Modelica.Blocks.Interfaces.RealInput Particlem3(unit = "1/m3") annotation(
    Placement(transformation(extent = {{-140, -20}, {-100, 20}})));
  Modelica.Blocks.Interfaces.RealOutput Particlecm3(unit = "1/cm3") annotation(
    Placement(transformation(extent = {{100, -10}, {120, 10}})));
equation
  Particlecm3 = Units.Conversions.to_cm3(Particlem3);
  annotation(
    Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Text(textColor = {64, 64, 64}, extent = {{-100, 60}, {-40, 0}}, textString = "1/m3"), Text(textColor = {64, 64, 64}, extent = {{40, 60}, {100, 0}}, textString = "1/cm3")}),
    Documentation(info = "<html>
<p>
This component converts an input signal from Particlem3 to Particlecm3
and provide it as output signal.
</p>
</html>"));
end ToParticlecm3;
