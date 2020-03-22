# Foreach

[![Gitter](https://img.shields.io/badge/Available%20on-Intersystems%20Open%20Exchange-00b2a9.svg)](https://openexchange.intersystems.com/package/Foreach)

The beginnings of a foreach function equivalent in ObjectScript. The syntax is limited yet makes object iteration more modular.

## Prerequisites

Make sure you have [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) and [Docker desktop](https://www.docker.com/products/docker-desktop) installed.

## Installation 

Open terminal and clone/git pull the repo into any local directory

```
$ git clone git@github.com:DaveAldon/ObjectScript-Foreach.git
```

Open the terminal in this directory and run:

```
$ docker-compose build
```

3. Run the IRIS container with your project:

```
$ docker-compose up -d
```

## How to Run the Example

If you'd like to this is in action immediately, just call the "SampleMethod" function.

Open InterSystems IRIS terminal:

```
$ docker-compose exec iris iris session iris
USER>zn "IRISAPP"
IRISAPP>write ##class(Iteration.Loop).SampleMethod()
some
thing
```

This function sends a simple variable with some elements, and calls on a sample method that writes it's parameter out to the console.

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

## How to start coding

This repository is ready to code in VSCode with ObjectScript plugin.
Install [VSCode](https://code.visualstudio.com/), [Docker](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-docker) and [ObjectScript](https://marketplace.visualstudio.com/items?itemName=daimor.vscode-objectscript) plugins and open the folder in VSCode.

Right-click on **docker-compose.yml** file and click Compose Restart

Once docker will finish starting procedure and show:

```
Creating objectscript-contest-template_iris_1 ... done
```

Click on the ObjectScript status bar and select Refresh connection in the menu.
Wait for VSCode to make connection and show something like "localhost:32778[IRISAPP] - Connected"

You can start coding after that. Open **Loop.cls** in VSCode, make changes and save - the class will be compiled by IRIS on 'Save'.

## Version history

2020-03-22 - v1.1 - Compatibility with InterSystems Online Programming Contest 2020

2019-09-19 - v1.0 - Initial commit of functions with features outlined in description
