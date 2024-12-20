within INP;

package Particles "Components with Celsius input and/or output"
  extends Modelica.Icons.VariantsPackage;
  annotation(
    Documentation(info = "<html>
<p>
The components of this package are provided for the convenience of
people working mostly with #/cm<sup>3</sup> units, since all models
in package PGNP are based on #/m<sup>3</sup> units.
</p>
<p>
Note, that in package <code>IAQ.Units.Conversions</code>, functions are provided
to convert between the units #/cm<sup>3</sup> and #/m<sup>3</sup>. These functions allow, e.g., a direct conversion
of units at all places where #/m<sup>3</sup> is required as parameter.
Example:
</p>
<blockquote><pre>
<strong>import</strong> Modelica.Units.Conversions.from_cm3;
IAQ.ParticleCapacitor C(C0 = from_cm3(5000));
</pre></blockquote>
</html>"));
end Particles;
