Class Iteration.Loop
{

/// Example of how to use the foreach functionality
ClassMethod SampleMethod() As %Status
{
	try {
		set message = {}
		set message.sampleelement = "Dynamic 1"
		set message.anothersample = "Dynamic 2"

		// Pass the object, the function we want run, and our class location to the foreach
		do ..Foreach(.message, "Action")
	}
	catch(e) {
		write "SampleMethod error" _e.Name
	}
	return $$$OK
}

// Some method that we call on each iteration
ClassMethod Action(pMes) As %Status
{
	try {
		write pMes, !
	}
	catch(e) {
		write "Foreach action error: " _e.Name
	}
	return $$$OK
}

/// Takes in our dynamic object or array, the string value name of the function we want to run on
/// each iteration, and an optional value of the class location of our method that's being run on each
/// iteration.
ClassMethod Foreach(ByRef pVal, pFunc, pClass As %String = "") As %Status
{
	if 'pClass { set pClass = $this }
	try {
		if $classname(pVal) = "%Library.DynamicObject" {
			// We get the key value pairs from our dynamic object
			set tIter = pVal.%GetIterator()
			if tIter = "" throw
			// Loop through these values and add to our query depending on their contents
			while tIter.%GetNext(.key, .value) {
				// We pass the value to the action
				// TODO: Add ability to capture value and key in a friendly way
				do $classmethod(pClass, pFunc, value)
			}
		}
		else {
			return $classname(pVal)
		}
	}
	catch (e) {

		try {
			// Element position init
		    set tStruct=""
		    // Loop through the array
		    for {
			    set tStruct=$order(pVal(tStruct))
			    quit:tStruct=""
			    // Perform our action method on each element
			    do $classmethod(pClass, pFunc, pVal(tStruct))
			}
		}
		catch (e) {
			write "Foreach error " _e.Name
		}

		w e.Name
	}
	return $$$OK
}

}
