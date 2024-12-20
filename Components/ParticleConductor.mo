within INP.Components;

model ParticleConductor "Lumped thermal element transporting heat without storing it"
  extends Interfaces.Element1D;
  parameter Units.NonSI.ParticleConductance Q "Constant particle conductance of a space";
equation
  P_flow = Q*dN;
  annotation(
    Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(fillColor = {243, 243, 243}, pattern = LinePattern.None, fillPattern = FillPattern.HorizontalCylinder, extent = {{-90, 70}, {90, -70}}), Line(points = {{-90, 70}, {-90, -70}}, thickness = 0.5), Line(points = {{90, 70}, {90, -70}}, thickness = 0.5), Text(textColor = {0, 0, 255}, extent = {{-150, 120}, {150, 80}}, textString = "%name"), Text(extent = {{-150, -80}, {150, -110}}, textString = "Q=%Q"), Ellipse(origin = {56, 2}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Ellipse(origin = {42, 2}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Ellipse(origin = {34, -10}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Ellipse(origin = {-60, 10}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Ellipse(origin = {-34, -4}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Ellipse(origin = {-14, 10}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Ellipse(origin = {4, -2}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}})}),
    Documentation(info = "<html>
<p>
This is a model for transport of nanoparticles without storing it; see also:
<a href=\"modelica://PGNP.Components.ForcedParticleConductor\">ForcedParticleConductor</a>.
It may be used to connect two indoor air volumes. This element models the dispersion of nanoparticles without any external force (i.e. indoor air speed) and is assumed to be constant over the range of operations.
</p>
<p>
The variables of a NPort connector are the nanoparticles concentration <strong>N</strong> at the port and the nanoparticles flow rate <strong>Q_flow</strong> flowing into the component (if P_flow is positive, the particle flows into the element, otherwise it flows out of the element)
</p>
</html>"));
end ParticleConductor;
