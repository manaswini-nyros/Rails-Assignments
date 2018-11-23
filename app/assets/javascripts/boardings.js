	function ticket() {
  		var x=document.getElementById('id1').value;
  		document.getElementById('paname').innerHTML=x; 
  		
       var y=document.getElementById('fromid').value;
        document.getElementById('pafrom').innerHTML=y;
        var z=document.getElementById('toid').value;
        document.getElementById('pato').innerHTML=z;
        var w=document.getElementById('deid').value;
        document.getElementById('pade').innerHTML=w;

        return false; 	
     }
     function boardingpass(divName){
			var printContents = document.getElementById(divName).innerHTML;
    		 var originalContents = document.body.innerHTML;

    		 document.body.innerHTML = printContents;

    		 window.print();

     		document.body.innerHTML = originalContents;
     	}