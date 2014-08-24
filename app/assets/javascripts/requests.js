$(document).ready(function(){
  $("#outgoing-requests-table").tablesorter({
    sortList: [[1, 0]],
    widgets: ["zebra"]
  });

  $("#incoming-requests-table").tablesorter({
    sortList: [[1, 0]],
    widgets: ["zebra"]
  });
});