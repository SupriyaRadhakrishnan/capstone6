function myFunction() {
  // Declare variables
  var input, filter, table, tr, td, i, txtValue;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("myTable");
  tr = table.getElementsByTagName("tr");

  // Loop through all table rows, and hide those who don't match the search query
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[2];
    if (td) {
      txtValue = td.textContent || td.innerText;
      if (txtValue.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }
  }
}

function myFunction1() {
	  // Declare variables
	  var input, filter, table, tr, td, i, txtValue;
	  input = document.getElementById("myInput1");
	  filter = input.value.toUpperCase();
	  table = document.getElementById("myTable");
	  tr = table.getElementsByTagName("tr");

	  // Loop through all table rows, and hide those who don't match the search query
	  for (i = 0; i < tr.length; i++) {
	    td = tr[i].getElementsByTagName("td")[0];
	    if (td) {
	      txtValue = td.textContent || td.innerText;
	      if (txtValue.toUpperCase().indexOf(filter) > -1) {
	        tr[i].style.display = "";
	      } else {
	        tr[i].style.display = "none";
	      }
	    }
	  }
	}
	
function convertDate(d) {
	  var p = d.split("-");
	  return +(p[0]+p[1]+p[2]);
	}

	function sortByDate() {
	  var tbody = document.querySelector("#myTable tbody");
	  // get trs as array for ease of use
	  var rows = [].slice.call(tbody.querySelectorAll("tr"));
	  
	  rows.sort(function(a,b) {
	    return convertDate(a.cells[1].innerHTML) - convertDate(b.cells[1].innerHTML);
	  });
	  
	  rows.forEach(function(v) {
	    tbody.appendChild(v); // note that .appendChild() *moves* elements
	  });
	}

	document.querySelector("button").addEventListener("click", sortByDate);