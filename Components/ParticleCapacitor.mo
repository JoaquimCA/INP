within INP.Components;

model ParticleCapacitor "Lumped spatial element storing particles"
  parameter Modelica.Units.SI.Volume V "Volume of element (= m3)";
  Units.NonSI.ParticleConcetration N(start = 5e9, displayUnit = "1/m3") "Concentration of the space";
  Units.NonSI.ConcentrationSlope der_N(start = 0) "Time derivative of concentration (= der(C))";
  Interfaces.NPort_a port annotation(
    Placement(transformation(origin = {0, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
equation
  N = port.N;
  der_N = der(N);
  V*der(N) = port.P_flow;
  annotation(
    Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Text(lineColor = {0, 0, 255}, extent = {{-150, 110}, {150, 70}}, textString = "%name"), Text(extent = {{-69, 7}, {71, -24}}, textString = "%V"), Rectangle(origin = {-19, -23}, extent = {{-63, 65}, {63, -65}}), Rectangle(origin = {-19, -23}, extent = {{-63, 65}, {63, -65}}), Rectangle(origin = {31, 1}, extent = {{-63, 65}, {63, -65}}), Line(origin = {-57, 54}, points = {{-25, -12}, {25, 12}, {25, 12}}), Line(origin = {69, 54}, points = {{-25, -12}, {25, 12}, {25, 12}}), Line(origin = {69, -76}, points = {{-25, -12}, {25, 12}, {25, 12}}), Line(origin = {-57, -76}, points = {{-25, -12}, {25, 12}, {25, 12}}), Ellipse(origin = {-42, 24}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Ellipse(origin = {-42, 24}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Ellipse(origin = {-22, 32}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Ellipse(origin = {-22, 32}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Ellipse(origin = {-22, 32}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Ellipse(origin = {-22, 32}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Ellipse(origin = {-8, 20}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Ellipse(origin = {-8, 20}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Ellipse(origin = {-8, 20}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Ellipse(origin = {-8, 20}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Ellipse(origin = {28, -52}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Ellipse(origin = {28, -52}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Ellipse(origin = {28, -52}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Ellipse(origin = {20, -64}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Ellipse(origin = {76, -56}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Ellipse(origin = {62, -44}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}}), Ellipse(origin = {42, -52}, fillColor = {43, 43, 43}, fillPattern = FillPattern.Solid, extent = {{-4, 4}, {4, -4}})}),
    Documentation(info = "<html>
<p>
This is a generic model for the nanoparticles capacity of a space.
No specific geometry is assumed beyond a total volume with
uniform distribution of nanoparticles for the entire volume.
Furthermore, it is assumed that the nanoparticles capacity
is constant (independent of temperature).
</p>
<p>
The concentration N [#/cm<sup>3</sup>] of this component is a <strong>state</strong>.
A default of N = 5000 #/cm<sup>3</sup> is used as start value for initialization.
This usually means that at start of integration the concentration of this
component is 5000 particles per cm<sup>3</sup>. You may, of course, define a different
concentration as start value for initialization. Alternatively, it is possible
to set parameter <strong>steadyStateStart</strong> to <strong>true</strong>. In this case
the additional equation '<strong>der</strong>(N) = 0' is used during
initialization, i.e., the concentration C is computed in such a way that
the component starts in <strong>steady state</strong>. This is useful in cases,
where one would like to start simulation in a suitable operating
point without being forced to integrate for a long time to arrive
at this point.
</p>
<p>
Note, that parameter <strong>steadyStateStart</strong> is not available in
the parameter menu of the simulation window, because its value
is utilized during translation to generate quite different
equations depending on its setting. Therefore, the value of this
parameter can only be changed before translating the model.
</p>
<p>
This component may be used for complicated geometries where
the nanoparticles capacity V is determined by measurements. 
</html>"));
end ParticleCapacitor;
