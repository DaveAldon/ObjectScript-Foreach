# Foreach

[![Gitter](https://img.shields.io/badge/Available%20on-Intersystems%20Open%20Exchange-00b2a9.svg)](https://openexchange.intersystems.com/package/Foreach)

The beginnings of a foreach function equivalent in ObjectScript. The syntax is limited yet makes object iteration more modular.

## Usage

This function has **three** parameters: the object we're iterating through, the string name of the method running on each element, and the optional class location of the method. Currently the objects you can iterate through are limited to Dynamic Arrays and Dynamic Objects. Json objects can only capture the value pair, not the keys yet. And globals are in the works.

Here is an example of how to call this:

```
USER>set YOUR_VARIABLE = ["some","thing"]
USER>do ##class(Iteration.Loop).Foreach(YOUR_VARIABLE,"METHODNAME")
USER>some
USER>thing
```

METHODNAME is a method you define in the same class as where you call this, or if it's in another class you need to include the class name as a third parameter of the foreach. The method you want to make and call on each iteration can look like this (it's equivalent in other languages is the code that goes inside the foreach block):

```
ClassMethod METHODNAME(pMes) As %Status
{
	write pMes, !
	return $$$OK
}
```

## Example

If you'd like to this is in action immediately, just call the "SampleMethod" function:

```
USER>write ##class(Iteration.Loop).SampleMethod()
```

This function sends a simple variable with some elements, and calls on a sample method that writes it's parameter out to the console.

## Version history
2019-09-19 - v1.0 - Initial commit of functions with features outlined in description
