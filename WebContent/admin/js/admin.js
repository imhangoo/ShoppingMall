/**
 * 
 */

function deleteConfirm() { 
	var msg = "Are you sure to delete?"; 
	if (confirm(msg)==true){ 
		return true; 
	}else{ 
		return false; 
	} 
} 

function addCategyConfirm() { 
	var msg = "Are you sure to add this category?"; 
	if (confirm(msg)==true){ 
		return true; 
	}else{ 
		return false; 
	} 
} 