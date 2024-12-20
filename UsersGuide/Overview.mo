within INP.UsersGuide;

class Overview "Overview of Modelica Library"
  extends Modelica.Icons.Information;
  annotation(
    Documentation(info = "<html>
<p>
The INP Library is based on a reduced order model principals of nanoparticles in indoor air environments. The library is based on mass-balance equation (see equation 1), and includes all components to model 1-dimensional nanoparticles transfer with lumped elements.
</p>

<p>
Eq 1:
</p>
<p>
<img src=\"modelica://INP/Resources/Images/UsersGuide/EQ1.png\">
</p>

<p>
The basic components of the INP library are:
</p>

<table border=\"1\" cellspacing=\"0\" cellpadding=\"2\">
<tr><th>Library Components</th> <th>Description</th></tr>

<tr><td>
 <img src=\"modelica://INP/Resources/Images/UsersGuide/Capacitor.png\">
 </td>
 <td>
 <a href=\"modelica://INP.Components.ParticleCapacitor\">Particle Capacitor</a><br>
 An ideal volume of indoor air where nanoparticles can be stored.
 </td>
</tr>

<tr><td>
 <img src=\"modelica://INP/Resources/Images/UsersGuide/Conductor.png\">
 </td>
 <td>
 <a href=\"modelica://INP.Components.ParticleConductor\">ParticleConductor</a><br>
 Particle conductor that simulates in 1-dimension the diffusion of contaminant between two indoor air volumes.
 </td>
</tr>

<tr><td>
 <img src=\"modelica://INP/Resources/Images/UsersGuide/ForcedParticleConductor.png\">
 </td>
 <td>
 <a href=\"modelica://INP.Components.ForcedParticleConductor\">ForcedParticleConductor</a><br>
 Particle conductor that simulates in 1-dimension a forced movement of air between two indoor air volumes.
 </td>
</tr>

<tr><td>
 <img src=\"modelica://INP/Resources/Images/UsersGuide/NanoParticleCountingSensor.png\">
 </td>
 <td>
 <a href=\"modelica://INP.Sensors.NanoParticleCountingSensor\">NanoParticleCountingSensor</a><br>
 Ideal sensor to display the nanoparticles concentration in one volume of air.
 </td>
</tr>

<tr><td>
 <img src=\"modelica://INP/Resources/Images/UsersGuide/FixedConcentration.png\">
 </td>
 <td>
 <a href=\"modelica://INP.Sources.FixedConcentration\">FixedConcentration</a><br>
 Component that fixes the concentration and provides the required Particles flow to keep the concentration at the desired value.
 </td>
</tr>

<tr><td width=\"100\">
 <img src=\"modelica://INP/Resources/Images/UsersGuide/PrescribedConcentration.png\">
 </td>
 <td>
 <a href=\"modelica://INP.Sources.PrescribedConcentration\">PrescribedConcentration</a><br>
 Component that fixes the concentration and provides the required Particles flow to keep the concentration at the desired value. The desired value is a Real input, in this way the Concentration can change along the time.
 </td>
</tr>

<tr><td>
 <img src=\"modelica://INP/Resources/Images/UsersGuide/PrescribedParticleFlow.png\">
 </td>
 <td>
 <a href=\"modelica://INP.Sources.PrescribedParticleFlow\">PrescribedParticleFlow</a><br>
 Component that generates a flux of particules according to an input (Real Value). This element simulates de INP generation in high-energy processes such as burning fuels, plasma cutting, welding, metal grinding and ceramic tile firing.
 </td>
</tr>

</table>
<p>
Combining the basic components of the INP library it is possible to create complex components such as:
</p>
<table border=\"1\" cellspacing=\"0\" cellpadding=\"2\">
<tr><th>Library Components</th> <th>Description</th></tr>

<tr><td>
 <img src=\"modelica://INP/Resources/Images/UsersGuide/Room.png\">
 </td>
 <td>
 <a href=\"modelica://INP.Components.ParticleCapacitor\">Room</a><br>
 An ideal indoor air volume to simulate 2-Dimension dispersion of nanoparticles.
 </td>
</tr>
</table>
</html>"));
end Overview;
