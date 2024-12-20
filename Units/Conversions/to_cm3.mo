within INP.Units.Conversions;

function to_cm3 "Convert from cubic metre to cubic centimetre"
  extends Modelica.Units.Icons.Conversion;
    input Units.NonSI.ParticleConcetration m3 "Particles per cubic metre";
    output Units.NonSI.Particles_cm cm3 "Particles per cubic centimetre";
  algorithm
    cm3 := m3/1000000;
    annotation(
      Inline = true,
      Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Text(extent = {{-20, 100}, {-100, 58}}, textString = "m/s"), Text(extent = {{100, -50}, {-18, -100}}, textString = "cm2")}));
end to_cm3;
