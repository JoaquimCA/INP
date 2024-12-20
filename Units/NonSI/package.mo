within INP.Units;

package NonSI "Type definitions of non SI and other units"
  extends Modelica.Icons.Package;
  annotation(
    Documentation(info = "<html>
<p>
This package provides predefined types, such as <strong>ParticleConcentration</strong> (number of particles per meter cubic), <strong>ParticleFlow</strong> (Particles per second) or <strong>ParticleConductance</strong> (Particle air flow),
which are in common use but are not part of the international standard on
units according to ISO 31-1992 \"General principles concerning quantities,
units and symbols\" and ISO 1000-1992 \"SI units and recommendations for
the use of their multiples and of certain other units\".</p>
<p>If possible, the types in this package should not be used. Use instead
types of package <code>Modelica.Units.SI</code>. For more information on units, see also
the book of Francois Cardarelli <strong>Scientific Unit Conversion - A
Practical Guide to Metrication</strong> (Springer 1997).</p>
</html>"),
    Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}), graphics = {Ellipse(extent = {{-10, 10}, {10, -10}}, lineColor = {128, 128, 128}, fillColor = {128, 128, 128}, fillPattern = FillPattern.Solid), Ellipse(extent = {{-60, 10}, {-40, -10}}, lineColor = {128, 128, 128}, fillColor = {128, 128, 128}, fillPattern = FillPattern.Solid), Ellipse(extent = {{40, 10}, {60, -10}}, lineColor = {128, 128, 128}, fillColor = {128, 128, 128}, fillPattern = FillPattern.Solid)}));
end NonSI;
