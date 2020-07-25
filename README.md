# BoxGen
## Introduction
BoxGen is a simple shell script that creates headers like these:
```
------------------------------------------------
| Name: BoxGen                                 |
| Version: 0.2                                 |
| Author: RandomContributor                    |
| Use case: Source code headers like this one. |
| Status: Unfinished                           |
------------------------------------------------
```
## Usage
$ `./boxgen.sh "Line 1." "Line 2." "This is a longer line." "This one is shorter."`
Outputs:
```
--------------------------
| Line 1.                |
| Line 2.                |
| This is a longer line. |
| This one is shorter.   |
--------------------------
```

You can add as many lines as you wish.

## Customization
You can customize your textbox with the variables in the script, these are the defaults as of now:
```
PAD=0
TOPC='-'
LFTC='|'
RIGC='|'
BOTC='-'
```
The PAD variable specifies how many lines of padding should be output:
```
---------
| PAD=0 |
---------

---------
|       |
| PAD=1 |
|       |
---------

---------
|       |
|       |
| PAD=2 |
|       |
|       |
---------
```
The other variables specify the borders of the box:
```
------------
| TOPC='-' |
| LFTC='|' |
| RIGC='|' |
| BOTC='-' |
------------

!!!!!!!!!!!!!
< TOPC='!'  >
< LFTC='>'  >
< RIGC='>'  >
< BOTC='¡'  >
¡¡¡¡¡¡¡¡¡¡¡¡¡

```
I think you get the point. 
