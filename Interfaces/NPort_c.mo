within INP.Interfaces;

connector NPort_c "Concentration port for 1-dim. particle transfer (filled rectangular icon)"
  extends NPort;
  annotation(
    defaultComponentName = "port_a",
    Documentation(info = "<html>
<p>This connector is used for 1-dimensional particle flow between components.
The variables in the connector are:</p>
<blockquote><pre>
N       Particle concentration in [#/m<sup>3</sup>].
P_flow  Particle flow rate in [#].
</pre></blockquote>
<p>According to the Modelica sign convention, a <strong>positive</strong> particle flow
rate <strong>P_flow</strong> is considered to flow <strong>into</strong> a component. This
convention has to be used whenever this connector is used in a model
class.</p>
<p>Note, that the two connector classes <strong>NPort_a</strong>, <strong>NPort_b</strong>, <strong>NPort_c</strong> and <strong>NPort_d</strong> are identical with the only exception of the different
<strong>icon layout</strong>.</p></html>"),
    Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(lineColor = {85, 170, 255}, fillColor = {85, 170, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}})}),
    Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(lineColor = {85, 170, 255}, fillColor = {85, 170, 255}, fillPattern = FillPattern.Vertical, extent = {{-50, 50}, {50, -50}}), Text(textColor = {85, 170, 255}, extent = {{-120, 120}, {100, 60}}, textString = "%name")}));
end NPort_c;
