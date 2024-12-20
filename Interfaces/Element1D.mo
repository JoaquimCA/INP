within INP.Interfaces;

partial model Element1D "Partial particle transfer element with two CPort connectors that does not store particles"
  Units.NonSI.ParticleFlow P_flow "Particle flow rate from port_a -> port_b";
  Units.NonSI.ConcentrationDifference dN "port_a.C - port_b.C";
public
  NPort_a port_a annotation(
    Placement(transformation(extent = {{-110, -10}, {-90, 10}})));
  NPort_b port_b annotation(
    Placement(transformation(extent = {{90, -10}, {110, 10}})));
equation
  dN = port_a.N - port_b.N;
  port_a.P_flow = P_flow;
  port_b.P_flow = -P_flow;
  annotation(
    Documentation(info = "<html>
<p>
This partial model contains the basic connectors and variables to
allow particle transfer models to be created that <strong>do not store particles</strong>.
This model defines and includes equations for the concentration
drop across the element, <strong>dN</strong>, and the particle flow rate
through the element from port_a to port_b, <strong>P_flow</strong>.
</p>
<p>
By extending this model, it is possible to write simple
constitutive equations for many types of particle transfer components.
</p>
</html>"));
end Element1D;
