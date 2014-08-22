$(document).ready(function(){
  $("#all-users-table").tablesorter({
    sortList: [[1, 0],[0, 0]],
    widgets: ["zebra"]
  });
});