$(document).ready(function(){
  $("#all-session-reviews-table").tablesorter({
    sortList: [[1, 0]],
    widgets: ["zebra","filter"]
  });
});