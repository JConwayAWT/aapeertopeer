$(document).ready(function(){
  $("#listed-tutors-table").tablesorter({
    sortList: [[1, 0], [0, 0]],
    widgets: ["zebra", "filter"]
  });
});