function createAllValidations(validations, form_prefix) {
	for (var attr_name in validations) {
	 	var attribute = validations[attr_name]
	 	for (var validation in attribute) {
	 		switch (validation) {
	 			case "format": 
	 				validates_format_of(attr_name, attribute[validation], form_prefix)
	 				break;
	 			case "length":
	 				validates_length_of(attr_name, attribute[validation], form_prefix)
	 				break;
	 			case "numericality":
	 				validates_numericality_of(attr_name, attribute[validation], form_prefix)
	 				break;
	 			default:
	 				//alert(validation);
	 		}	
	 	}
	 }
}


function registerListener(form_prefix, field, method) {
	new Form.Element.EventObserver(form_prefix + '_'+ field, method);	
}

function validates_numericality_of(attribute, options, form_prefix) {
	if(options.integer_only) {
		registerListener(form_prefix, attribute, checkInteger)
	} else {
		registerListener(form_prefix, attribute, checkFloat)	
	}
	
}

function checkInteger(event) {
	if(event.value.match(/^\d+$/)) {
		alert("number entered")
	} else {
		alert("enter a number...")
	}	
}

function checkFloat(event) {
	if(event.value.match(/^\d+$|^[\d]+\.[\d]+$/)) {
		alert("number entered")
	} else {
		alert("enter a number...")
	}
}

function validates_acceptance_of(attribute, options, form_prefix) {
	
}

function validates_associated(attribute, options, form_prefix) {
	
}
function validates_confirmation_of(attribute, options, form_prefix) {
	
}
function validates_exclusion_of(attribute, options, form_prefix) {
	
}
function validates_format_of(attribute, options, form_prefix) {
	//alert("format")
}
function validates_inclusion_of(attribute, options, form_prefix) {
	
}
//#validates_size_of   Alias #validates_length_of
function validates_length_of(attribute, options, form_prefix) {
	//alert("length")
}

function validates_presence_of(attribute, options, form_prefix) {
	
}

function validates_uniqueness_of(attribute, options, form_prefix) {
	
}