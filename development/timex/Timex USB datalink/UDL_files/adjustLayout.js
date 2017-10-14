function adjustLayout()
{
  // Get natural heights
  var cHeight = xHeight("cContent");
  var lHeight = xHeight("lContent");
  var rHeight = xHeight("rContent");

  // Find the maximum height
  var maxHeight = Math.max(cHeight, Math.max(lHeight, rHeight));

  // Assign maximum height to all columns
  xHeight("content2col",maxHeight);
  xHeight("content", maxHeight);
  xHeight("left", maxHeight);
  xHeight("right", maxHeight);

  // Show the footer
  xShow("footer");
}

window.onload = function()
{
  xAddEventListener(window, "resize", adjustLayout, false);
  adjustLayout();
}	
