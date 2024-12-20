within INP.Units;

package Conversions "Conversion functions to/from non SI units and type definitions of non SI units"
  extends Modelica.Icons.Package;
  annotation(
    Documentation(info = "<html>
<p>This package provides conversion functions from the non SI Units
defined in package <code>Modelica.Units.NonSI</code> to the
corresponding SI Units defined in package <code>Modelica.Units.SI</code> and vice
versa. It is recommended to use these functions in the following
way (note, that all functions have one Real input and one Real output
argument):</p>
<blockquote><pre>
<strong>import</strong> Modelica.Units.SI;
<strong>import</strong> Modelica.Units.Conversions.{from_degC, from_deg, from_rpm};
 ...
<strong>parameter</strong> SI.Temperature     T   = from_degC(25);   // convert 25 degree Celsius to kelvin
<strong>parameter</strong> SI.Angle           phi = from_deg(180);   // convert 180 degree to radian
<strong>parameter</strong> SI.AngularVelocity w   = from_rpm(3600);  // convert 3600 revolutions per minutes
                                                 // to radian per seconds
</pre></blockquote>

</html>"),
    Icon(graphics = {Polygon(points = {{80, 0}, {20, 20}, {20, -20}, {80, 0}}, lineColor = {191, 0, 0}, fillColor = {191, 0, 0}, fillPattern = FillPattern.Solid), Line(points = {{-80, 0}, {20, 0}}, color = {191, 0, 0})}));
end Conversions;
