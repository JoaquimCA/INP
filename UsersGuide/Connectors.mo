within INP.UsersGuide;

class Connectors "Connectors"
  extends Modelica.Icons.Information;
  annotation(
    Documentation(info = "<html>

<p>
The INP library defines an <strong>elementary connector</strong> in the indoor air quality domain to simulate incidental nanoparticle (INP) concentrations. If any possible,
a user should utilize this connector in order that components
from the INP Library and from other libraries
can be combined without problems.
The following elementary connector is defined
(the meaning of potential, flow, and stream
variables is explained in section \"Connector Equations\" below):
</p>

<table border=\"1\" cellspacing=\"0\" cellpadding=\"1\">
<tr><td><strong>domain</strong></td>
   <td><strong>potential<br>variables</strong></td>
   <td><strong>flow<br>variables</strong></td>
   <td><strong>stream<br>variables</strong></td>
   <td><strong>connector definition</strong></td>
   <td><strong>icons</strong></td></tr>

<tr><td><strong>Indoor air<br>quality</strong></td>
   <td>Nanoparticle concentration</td>
   <td>Nanoparticle flow</td>
   <td></td>
   <td><a href=\"modelica://INP.Interfaces\">INP.Interfaces</a>
     <br>NPort_a, NPort_b, NPort_c, NPort_d</td>
   <td><img src=\"modelica://Modelica/Resources/Images/UsersGuide/ElectricalPins.png\"></td></tr>
</table>

<p>
Following Modelica Conventions, connectors are defined using the fluid shape. The variable declarations
are <strong>identical</strong>, only the icons are different in order that it is easy
to distinguish connectors of the same domain that are attached at the same
component.
</p>
</html>"));
end Connectors;
