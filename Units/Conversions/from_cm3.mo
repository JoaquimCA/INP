within INP.Units.Conversions;

function from_cm3 "Convert from square centimetre to square metre"
extends Modelica.Units.Icons.Conversion;
  input Units.NonSI.Particles_cm cm3 "Value in square centimetre";
  output Units.NonSI.ParticleConcetrationArea m3 "Value in square metre";
algorithm
  m3 := 0.0000001*cm3;
  annotation(
    Inline = true,
    Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Text(extent = {{2, 100}, {-100, 58}}, textString = "cm2"), Text(extent = {{100, -50}, {-16, -98}}, textString = "m/s")}));
end from_cm3;
