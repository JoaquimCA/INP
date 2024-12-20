within INP.Icons;

model PrescribedConcentration "Icon of prescribed concentration source"
  extends FixedConcentration;
  annotation(
    Icon(graphics = {Line(points = {{-100, 0}, {-42, 0}}, color = {191, 0, 0})}),
    Documentation(info = "<html>
<p>
This icon represents a prescribed concentration source model.
</p>
</html>"));
end PrescribedConcentration;
