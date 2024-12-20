within INP.Interfaces;

partial connector NPort "Concentration port for 1-dim. particle transfer"
  Units.NonSI.ParticleConcetration N "Port concentration";
  flow Units.NonSI.ParticleFlow P_flow "Particle flow at port";
  annotation(
    Documentation(info = "<html>
Generic particle port from which the component connectors are derived.
</html>"));
end NPort;
