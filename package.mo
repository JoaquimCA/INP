package INP "Library of 1-dimensional particle transfer with lumped elements"
  extends Modelica.Icons.Package;
  annotation(
    Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Ellipse(origin = {64, 64}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Ellipse(origin = {16, 20}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Ellipse(origin = {-20, 88}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Ellipse(origin = {64, 64}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Ellipse(origin = {-1, 33}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-7, 7}, {7, -7}}), Ellipse(origin = {11, 71}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-7, 7}, {7, -7}}), Ellipse(origin = {-13, -27}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-19, 19}, {19, -19}}), Ellipse(origin = {38, -40}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-10, 10}, {10, -10}}), Ellipse(origin = {-37, -69}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-7, 7}, {7, -7}}), Ellipse(origin = {27, 41}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-7, 7}, {7, -7}}), Ellipse(origin = {63, -69}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-7, 7}, {7, -7}}), Ellipse(origin = {66, -36}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Ellipse(origin = {-76, -42}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Ellipse(origin = {-51, 49}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-19, 19}, {19, -19}}), Ellipse(origin = {65, 17}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-19, 19}, {19, -19}}), Ellipse(origin = {-59, 1}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-7, 7}, {7, -7}})}),
    Documentation(info = "<html>
<p>
<img src=\"modelica://INP/Resources/Images/Logos/Modelica_Libraries.svg\" width=\"250\">
</p>

<p>
The package <strong>INP</strong> is a <strong>standardized</strong> and <strong>free</strong> package
that is developed by the \"<strong>Group of Research and Innovation in Construction (GRIC) from Universitat Politècnica de Catalunya (UPC)</strong>\", in the framework of LIFE NANOHEALTH project (<a href=\"https://webgate.ec.europa.eu/life/publicWebsite/project/details/5727\">LIFE20 ENV/ES/000187</a>) funded by LIFE program.</p>

<p>
<img src=\"modelica://INP/Resources/Images/Logos/Nanohealth.png\" width=\"250\">
</p>

<p>
Its development is coordinated with the Modelica&reg; language from the
Modelica Association, see <a href=\"https://www.Modelica.org\">https://www.Modelica.org</a>.
It provides model components in indoor air quality domain to simulate process-generated nanoparticles in industrial environments that are based on standardized interface definitions.
<p>
For an introduction, have especially a look at:
</p>
<ul>
<li> <a href=\"modelica://Modelica.UsersGuide.Overview\">Overview</a>
  provides an overview of the Modelica Standard Library
  inside the <a href=\"modelica://Modelica.UsersGuide\">User's Guide</a>.</li>
<li><a href=\"modelica://Modelica.UsersGuide.ReleaseNotes\">Release Notes</a>
 summarizes the changes of new versions of this package.</li>
<li> <a href=\"modelica://INP.UsersGuide.Contact\">Contact</a>
  lists the contributors of the INP Library.</li>
<li> The <strong>Examples</strong> packages in the various libraries, demonstrate
  how to use the components of the corresponding sublibrary.</li>
</ul>

<p>
This version of the Modelica Standard Library consists of
</p>
<ul>
<li><strong>27</strong> component models and blocks, and</li>
<li><strong>11</strong> example models</li>
</ul>
<p>
that are directly usable (= number of public, non-partial, non-internal and non-obsolete classes). It is fully compliant
to <a href=\"https://modelica.org/documents/ModelicaSpec34.pdf\">Modelica Specification version 3.4</a>
and it has been tested with Modelica tools from different vendors.
</p>

<p>
<strong>Licensed by LIFE NANOHEALTH consortium under the 3-Clause BSD License</strong><br>
Copyright &copy; 2022-2024, LIFE NANOHEALTH consortium and <a href=\"modelica://Modelica.UsersGuide.Contact\">contributors</a>.
</p>

<p>
<em>This Modelica package is <u>free</u> software and the use is completely at <u>your own risk</u>; it can be redistributed and/or modified under the terms of the 3-Clause BSD license. For license conditions (including the disclaimer of warranty) visit <a href=\"https://modelica.org/licenses/modelica-3-clause-bsd\">https://modelica.org/licenses/modelica-3-clause-bsd</a>.</em>
</p>
</html>"),
    uses(Modelica(version = "4.0.0"), Buildings(version = "10.0.0"), PhotoVoltaics(version = "2.0.0")));
end INP;
