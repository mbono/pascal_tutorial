---
title: Pascal Tutorial
author: Mariano Bono
...

# Pascal Tutorial

This document contains a brief overview of the Pascal programming language,
illustrating the structure, constructs, control structures, and typical data
types of the language.

Language: **English** | [Italian version](it/)

Repository: [mbono/pascal_tutorial](https://github.com/mbono/pascal_tutorial)

Available formats: [PDF](pascal_tutorial.pdf), [EPUB](pascal_tutorial.epub),
[Text](pascal_tutorial.txt).

# Language Basics

## Hello world

Let's start with the classic `hello world` program written in Pascal. This code
simply prints the text string `hello, world` to the screen.

`hello.pas`
```pascal
{hello.pas: write the string "hello, world"}
program hello;
begin
  writeln('hello, world');
end;
```

Let's analyze the program line by line: on the first line we find a comment,
text written between `(* *)` or between `{ }` is completely ignored by the
compiler; line 2 indicates the start of the program with the keyword `program`
followed by the program name (`hello`); lines 3 and 5 define the beginning and
end of the main block of the program; between the keywords `begin` and `end`
you insert the instructions that will be executed; Line 4 is the one that
prints the string `hello, world` to the screen, the command `writeln('text to
print')` writes to the screen everything found between the quotes.

## Program Structure

A Pascal program is generally divided into three parts: header, declaration
block, and instruction block.

The header begins with the keyword `program` followed by the program name and
terminated by a semicolon.

```pascal
program <nome_programma>;
```

The declaration block defines the various data used in the program and
contains: labels (`label`), constants (`const`), user-defined types (`type`),
variables (`var`), procedures (`procedure`), and functions (`function`).

The instruction block contains the instructions that the program must execute
once started.

In summary, we have the following structure:

```pascal
{intestazione}
program nome_programma;
{dichiarazioni}
label
const
type
var
procedure
function
begin
{istruzioni}
end;
{fine del programma}
```

Although it is possible to swap the order of some elements in the declaration
block, it is advisable not to do so and respect the predefined order.

TIP: To easily remember the correct order, just memorize this sequence of the
first letters of each section: L-C-T-V-P-F (`label`, `const`, `type`, `var`,
`procedure`, and `function`).

## Reserved Words

Pascal has a series of reserved words that cannot be used as identifiers.

The reserved words of ANSI Pascal are shown in the following table.

|            |           |         |            |
|------------|-----------|---------|------------|
|`and`       |`array`    |`begin`  |`case`      |
|`const`     |`div`      |`do`     |`downto`    |
|`else`      |`end`      |`file`   |`for`       |
|`forward`   |`function` |`goto`   |`if`        |
| `in`       |`label`    |`mod`    |`nil`       |
|`not`       |`of`       |`or`     |`packed`    |
|`procedure` |`program`  |`record` |`repeat`    |
|`set`       |`then`     |`to`     |`type`      |
|`until`     |`var`      |`while`  |`with`      |

## Identifiers

An identifier is the name assigned to a part of a Pascal program which can be a
variable, constant, function, procedure, or label.

An identifier consists of any sequence of letters and digits, provided that the
first character is a letter. Spaces or characters other than numbers and
letters are not allowed, with the only exception of the underscore character
`_`. Pascal is case-insensitive, so it does not distinguish between uppercase
and lowercase letters.

.some examples of identifiers
```pascal
pippo Pippo21 Pippo34 {valid identifiers}
PIPPO pippo Pippo {all represent the same identifier}
12Pippo {not valid as it starts with a number}
```

## Data Types

In Pascal, we distinguish between simple and structured data types; let's see
what they are:

* Simple type data:
  * Standard Types
    * Integer
    * Real
    * Char
    * Boolean
  * Declared Types
    * Enumerated
    * Subranges
* String type data
* Structured data
  * Record
  * Array
  * Set
  * File
* Pointer type data

## Literals

### Numbers

We distinguish between integer and real numbers.

Integer numbers are a sequence of digits, optionally preceded by a sign.

.valid integer numbers
```pascal
124
2345
-34
+22
```

Real numbers contain a decimal point or an exponent or both, using exponential
notation in base 10 where the symbol `E` is used instead of 10.

.valid real numbers
```pascal
12.3
434.44 
-342.454 
+56.33 
12.4E2 {12.4x10\^2} 
8.5E-2 {8.5x10\^-2}
```

### Characters

A character is represented by any alphanumeric character between quotes:

```pascal
'a' 'b' 'c' '1' '0'
```

### Strings

A string is a sequence of alphanumeric characters enclosed in quotes.

```pascal
'I am a text string'
```

### Boolean Literals

There are two boolean literals: `true` and `false`.

### Constants

A constant is an object that always remains with the same value throughout the
duration of the program.

The structure for declaring a constant is as follows:

```pascal
const <identifier> = <value>;
```

.example
```pascal
const settimana = 7;
const ore = 24;
```

### Variables

Variables are objects that can assume values of a certain type; during program
execution their value can be modified but the data type must remain the same (an
`integer` variable can only store integer type data).

Variables must be declared in the following way:

```pascal
var <var1>,<var2>, ... : <data type>;
```

.example
```pascal
var name: string; var number: integer;
```

### Assignment Operator

After declaring a variable, we can assign a value to it; to do this we use the
assignment operator.

.assignment
```pascal
<variable_name> := <expression>;
```

An expression can be a constant of the same type as the variable or a complex
expression whose result is of the same type as the variable.

.examples
```pascal
var n: integer; {declaration}
 ...
n := 10; {simple assignment}
n := (10 + 2) * 5; {complex assignment}
```

# Simple Data Types

## Numbers

Integer numbers in Pascal are represented by the `integer` type, while floating
point numbers are of type `real`.

The following operators are supported:

* `+`: addition
* `-`: subtraction
* `*`: multiplication
* `/`: division
* `div`: integer division
* `mod`: remainder of integer division

These are binary operators (they require two operands) that operate on numeric
data types; the `/` division generates a `real` data, while the `div` and `mod`
operators work on `integer` and generate an `integer` data type.

`numeri.pas`
```pascal
program numeri;
var a, b, c, d: integer; 
r: real; 
begin 
  a := 12;
  writeln('a =', a); 
  b := 23; 
  writeln('b =', b); 
  c := -25; 
  writeln('c =', c); 
  d := a + c; {d = 12 -25 = -13} 
  writeln('d =', d); 
  d := b - c; {d = 23 - (-25) = 48} 
  writeln('d =', d); 
  d := b div 2; {23 div 2 = 11 divisione intera} 
  writeln('d =', d); 
  d := b mod 2; {1 è il resto di prima} 
  writeln('d =', d); 
  r := b / 2; {r = 23 / 2 =11.5 divisione reale}
  writeln('r =', r); 
end.
```

## Characters

The character data type in Pascal is indicated by the keyword `char`. A
variable of type `char` can take the value of one of the 255 characters defined
by the ASCII code.

The character can be assigned directly as a literal (as we have seen, a
character literal is any alphanumeric character contained between quotes) or
directly with its numeric value through the `chr` function.

```pascal
var c: char;
...
c := 'A';
c := chr(65);
```

In this example, both assignment operations produce the same result.

## Strings

Character strings in Pascal represent a specific data type of the language:
the `string` type. As we have seen, a string is any sequence of characters
enclosed in quotes `''`.

.declaration and assignment of a string
```pascal
var str: string; ... str := 'hello, world';
```

A variable declared this way can contain a string of up to 255 characters, but
it is possible to declare strings with a smaller size using the following form.

```pascal
var str: string[10]; {contiene stringhe di max 10 caratteri}
```

The concatenation operator `+` allows you to merge multiple strings into one.

`stringhe.pas`
```pascal
program stringhe; 
var s1,s2,s3: string; 
begin 
  s1 := 'rossi'; 
  s2 := ''; {stringa vuota} 
  s3 := 'carlo'; 
  s2 := s3 + ' ' + s1; {s2='carlo rossi'}
  writeln(s2); 
end.
```

## `boolean` Data Type and Logical Operators

In Pascal, boolean values form a true data type marked by the identifier
`boolean`. The boolean operators are `and`, `or`, and `not`; they are
operators that return a `boolean` data according to the following truth tables.

| First operand | Second operand |`and` operator| `or` operator |
|----------------|------------------|---------------|----------------|
| `false`        | `false`          | `false`       |`false`         |
| `false`        | `true`           | `false`       | `true`         | 
| `true`         | `false`          | `false`       | `true`         |
| `true`         | `true`           | `true`        | `true`         |

| Operand | `not` operator|
|----------|----------------|
| `false`  | `true`         |
| `true`   | `false`        |

We observe that the `and` operation returns a true value only if both operands
are true; the `or` operator returns a true value if at least one of the two
operands is true; the `not` operator inverts the predicate.

## Logical Operators

These are operators that compare two expressions and return a boolean value
(`true` or `false`).

* Greater than: `>`
* Greater than or equal: `>=`
* Less than: `<`
* Less than or equal: `<=`
* Equal: `=`
* Not equal: `<>`

It is possible to compare numbers (even `integer` with `real`), strings,
characters, boolean data (`false` is less than `true`), and characters with
strings. For strings and characters, lexicographic order is respected. It is
not possible to compare strings and characters with numeric data.

```pascal
program bool; 
var a,b,c: boolean; 
begin 
  a := (12 < 15); {T} 
  a := true; {T} 
  a := false; {F} 
  b := (12 < 10); {F} 
  c := a and b; {T and F = F} 
  c := a or b; {T or F = T} 
  c := not(a and b); {a and b = F; not(false) = T}
  c := ('a' < 'b'); {T} 
  c := ('hello' < 'world'); {T} 
  c := ('h' <'world'); 
end.
```

## Condition

A condition is a boolean expression: in the simplest case it is a variable or
literal of type `boolean`, but it can also be a complex expression formed by
boolean and logical operators. In any case, a condition is either `true` or
`false`.

```pascal
(10 < 20) and (a > b);
```

# Input and Output

The main commands for input/output operations are two: `read` and `write`; the
first reads data from the `input` file while the second writes to the `output`
file. The `input` and `output` files are by default associated with the
keyboard and screen, but you can change the default association by binding them
to real files or other devices.

```pascal
read(var1, var2, ...);
write(exp1, exp2, ...);
```

The `read` command reads data from standard input and stores it in the
indicated variables; the allowed types are `char`, `string`, `integer`, and
`real`. In standard input, data are separated by one or more spaces or by an
end-of-line character (which is obtained by pressing `enter` when standard
input is the keyboard).

The `write` command prints the indicated data list to standard output;
variables, constants, or expressions of type `string`, `char`, `integer`, or
`real` can be passed.

There are two variants of `read` and `write` which are `writeln` and `readln`
respectively; the first prints the `EOL` (end of line) character after the
data, while the second, after reading the data, moves to the next line (after
the `EOL` character).

```pascal
program io;
var i: integer;
	r: real; c: char;
	s: string;
begin
	writeln; {stampa una riga vuota}
	write('inserisci un numero intero :');
	readln(i);
	writeln('hai inserito : ', i);
	writeln;
	write('inserisci un numero reale :');
	readln(r);
	writeln('hai inserito ', r);
	writeln('hai inserito : ', r:3:4);
	writeln;
	write('inserisci un carattere :');
	readln(c);
	writeln('hai inserito : ',c);
	writeln;
	write('inserisci una stringa :');
	readln(s);
	writeln('hai inserito : ',s);
	writeln;
	write('inserimento multiplo di intero e reale :');
	readln(i,r);
	writeln('hai inserito : ',i,' ',r);
end.
```

## Output Formatting

It is possible to format the output by inserting the space that a certain piece
of data must occupy on the screen using the following form.

```pascal
write(exp:spazio);
```

If the data needs more space, the formatting is ignored, while if the data
requires less space, this is preserved and the data is right-aligned.

For `real` data, it is possible to specify an additional field to indicate how
many digits after the decimal point to print.

```pascal
write(exp:spazio:cifre decimali);
```

The following code clarifies the concept.

```pascal
program formatted_io;
var a1,a2,a3,a4,a5,a6: integer;
begin
	a1 := 10;
	a2 := 334;
	a3 := 2103;
	a4 := 0;
	a5 := 46;
	a6 := 555;
	{testo non formattato}
	writeln('tabella:');
	writeln(a1, ' ', a2, ' ', a3);
	writeln(a4, ' ', a5, ' ', a6);
	writeln;
	{testo formattato}
	writeln('tabella:');
	writeln(a1:6, a2:6, a3:6); {6 colonne per dato}
	writeln(a4:6, a5:6, a6:6);
end.
```

# Control Structures

## Selection Construct: `if`

The `if` construct allows you to execute a block of code only if a condition is
true.

```pascal
if (<condizione>) then
  <blocco>
```

There is the `if .. else` variant where if the condition is `false` then the
alternative block is executed.

```pascal
if (<condizione>) then
  <blocco>
else
  <blocco alternativo>
```

Different `if .. else` can be nested giving rise to the `if .. else if`
construct which allows you to make multiple choices.

```pascal
if (<condizione>) then
  <blocco>
else if (<condizione>) then
  <blocco 2>
else if (<condizione>) then
  <blocco 3>
...
else
  <blocco alternativo>
```

The last `else` always refers to the last occurrence of `if`.

WARNING: The last instruction before the `else` keyword must not be terminated
with a semicolon.

```pascal
program if_else;
var a,b: integer;
begin
	writeln('inserisci due numeri: ');
	readln(a, b);
	if (a < b) then
		writeln(a, ' < ', b)
	else if (a = b) then
		writeln(a, ' = ', b)
	else
		writeln(a, ' > ', b);
end.
```

## Multiple Selection: `case`

The `case` structure allows you to make a multiple choice based on the result
of an expression or the content of a variable. The form of the `case` control
structure is as follows:

```pascal
case (expression or variable) of
  value_list1: (block1)
  value_list2: (block2)
  ...
  value_listn: (blockn)
  else (else_block)
end;
```

The value of the expression or variable is evaluated and the corresponding
value is searched for among those indicated in the various lists; if the value
is found then the corresponding code block is executed, otherwise the `else`
block is executed. The `else` block is optional; in this case, if the value is
not found, then no code block is executed and execution continues without
problems.

Multiple selection using a variable:

```pascal
case (i) of
	1,2,3,4,5:
		writeln('i <= 5');
	6:
		writeln('i = 6');
	7,8:
		writeln('i = 7 or i = 8');
	else
		writeln('i out of range 1..8');
end;
```

Multiple selection using the result of an expression:

```pascal
case (i mod 9) of
	1,2,3,7,8:
		writeln('blocco1');
	4,5,6:
		writeln('blocco2');
end;
```

A simple menu:

`simple_menu.pas`

```pascal

program simple_menu;
var scelta: integer;
begin
	writeln(' menu principale : ');
	writeln;
	writeln('1. opzione a');
	writeln('2. opzione b');
	writeln('3. opzione c');
	writeln;
	write('Cosa scegli? (1..3): ');
	readln(scelta);
	case (scelta) of
	1:
		writeln('hai scelto l''opzione a !!');
	2:
		writeln('hai scelto l''opzione b !!');
	3:
		writeln('hai scelto l''opzione c !!')
	else
		writeln ('errore : la scelta effettuata non è corretta !!!!');
	end;
end.
```

## `while` Loop

The `while` structure executes a code block cyclically as long as the control
variable or expression remains `true`.

```pascal
while (<boolean expression>) do
	<block>
```

Count from 1 to 10:

```pascal
i := 1;

while (i <= 10) do
begin
	writeln(i);
	inc(i);
end;
```

NOTE: the procedures `inc(var n: integer)` and `dec(var n: integer)` increment
and decrement by one the variable provided as argument.

Print the 3 times table:

`tabellina.pas`

```pascal

program tabellina;
var i: integer;
begin
	writeln('tabellina 3');
	i := 1;
	while (i <= 10) do
	begin
		writeln(3 * i);
		inc(i);
	end;
end.
```

## `repeat` Loop

The `repeat` loop is similar to the `while` loop with the big difference that
the exit condition from the loop is evaluated at the end of it, so the loop is
executed at least once.

```pascal
repeat
	<blocco>
until <condizione>;
```

The code block is executed until the condition is true. Let's see counting from
one to ten with the `repeat` loop.

Count from 1 to 10:

```pascal
i := 1;

repeat
begin
	writeln(i);
	inc(i);
end;
until (i > 10);
```

## `for` Loop

The `for` structure executes a loop a predetermined number of times.


```pascal
for <variabile> := <viniziale> to <vfinale> do
	<blocco>
```

The indicated variable takes all values between <viniziale> and <vfinale>,
incrementing by 1 each time; the number of loops executed is <vfinale> -
<viniziale> + 1.

The following variant decrements the control variable by 1.

```pascal
for <variabile> := <v1> downto <v2> do
	<blocco>
```

Conteggio da 1 a 10:

```pascal
for i := 1 to 10 do
	writeln(i);
```

Conteggio da 10 a 1:

```pascal
for i := 10 downto 1 do
	writeln(i);
```

# Procedures and Functions

Pascal offers two types of subroutines: `procedure` and `function`.

From a conceptual point of view, `procedure` are used when the subprogram must
perform actions, while `function` are used to provide the result of a
processing.

Declaration of `procedure` and `function`:

```pascal
procedure <nome>(<lista parametri>);
	<corpo della procedura>

function <nome>(<lista parametri>):<tipo restituito>;
    <corpo della funzione>
```

## Subprogram Structure

A Pascal subprogram has the same structure as a generic program.

Structure of a `procedure`:

```pascal
procedure <nome>(<parametri>);
	{dichiarazioni}
	label
	const
	type
	var
	procedure
	function
begin
	{istruzioni}
end.
```

Structure of a `function`:

```pascal
function <nome>(<parametri>): <tipo restituito>;
	{dichiarazioni}
	label
	const 
	type
	var
	procedure
	function
begin
	{istruzioni}
end.
```

What is immediately noticeable is that within subprograms it is possible to
define others.

To invoke a subprogram, the following form is used:

```pascal
<procedura>(<parametri>);
<var> := <funzione>(<parametri>);
```

Two simple subroutines:

```pascal
function somma(a, b: integer): integer;
begin
	somma := a + b;
end;

procedure stampa_somma(a, b: integer);
begin
	writeln(a, ' + ', b, ' = ', a + b);
end;
...
begin
	n := somma(10, 20);
	stampa_somma(10, 20);
end.
```

## Value Returned by a `function`

We have seen that a function returns an output value; the method to assign the
output value from inside the function is as follows:

```pascal
<nome_funzione> := <valore_uscita>;
```

`function` that returns the square of a number:

```pascal
function sqr(a: integer): integer;
begin
	sqr := a * a;
end;
```

## Parameters

The parameter list is a list of identifiers grouped by type.

```pascal
(p1, p2, ...: tipo1; pJ, pK, ...: tipo2; ...);
```

Within the subprogram, parameters can be used in expressions as if they were
variables.

There are two types of parameters: value parameters and variable parameters.

For value parameters, a local copy is made (inside the subprogram) and
therefore any changes to the parameter have no effect outside the subprogram.

Variable parameters, on the other hand, are passed directly to the subprogram
and therefore any change to it is also reflected outside the subprogram.

To declare a variable parameter, the keyword `var` is used.

`parametri.pas`

```pascal
program parametri;
procedure foo(a,b: integer; var c: integer);
{a e b sono parametri valore mentre c è variabile}
begin
	a := a * a;	{modifica locale}
	writeln('local a = ', a);
	b := b * b;	{modifica locale}
	writeln('local b = ', b);
	c := a + b;	{modifica globale}
	writeln('local c = ', c);
end;
var a, b, c: integer;
begin
	a := 10;
	b := 5;
	c := 0;
	foo(a, b, c);
	writeln('global a = ', a);
	writeln('global b = ', b);
	writeln('global c = ', c);
end.
```

Output of `parametri.pas`:

```
local a = 100
local b = 25
local c = 125
global a = 10
global b = 5
global c = 125
```

The values of `a` and `b` are modified inside `foo`, but this change remains
local to the `procedure`; on the contrary, changes to `c` are global.

Let's make another distinction between formal parameters and actual parameters:
formal parameters are those declared in the header, while actual ones are the
parameters provided at the time of invocation. Actual parameters must respect
the types of formal parameters, additionally actual parameters can also be
passed as constants and do not have to respect the names of formal parameters.

Valid examples of invocation of `foo`:

```pascal
var a, b, c, d, e: integer;
begin
	a := 10;
	b := 20;
	foo(a, b, c);
	foo(10, 20, c); {stesso risultato di prima}
	d := 40;
	e := 30;
	foo(e, d, a);
	foo(10 + 2, b, e);
end.
```

# Structured Data

## Array

An `array` (vector) can be seen as a consecutive list of data of the same type
that can be accessed via an index.

```pascal
(a1, a2, a3, ... ,aN)
```

To declare an array, the following notation is used.

```pascal
var <name>: array [<index_range>] of <data_type>;
```

The `<range indice>` field indicates the initial and final values of the index;
the size of the array is therefore calculated as:

```pascal
<final value> - <initial value> + 1
```

The type of an array can be any of the simple types or even a user-defined type
(we will see this later).

The index elements must belong to an ordinal type (in which it is possible to
establish an order relationship between elements): `integer`, `char`, subrange,
or `enum`.

Some valid arrays:

```pascal
var	a: array [1..100] of integer;
	b: array ['a'..'d'] of integer;
	giorni: array [1..7] of string;
```

To access a single element of the array, the form is used:

```pascal
<nome_vettore>[<indice>]
```

It is possible to assign one array to another, thus making an exact copy.

`vettori.pas`
```pascal
program vettori;
var a,b: array [1..10] of integer;
	i: integer;
begin
	randomize;
	for i := 1 to 10 do begin
		a[i] := random(100);
		writeln('a[',i,'] = ',a[i]);
	end;
	b := a;
	for i := 1 to 10 do a[i] := 0;
	writeln;
	for i := 1 to 10 do
		writeln('a[', i,'] = ', a[i]);
	writeln;
	for i := 1 to 10 do
		writeln('b[', i,'] = ', b[i]);
end.
```

### Multidimensional Arrays

It is possible to define arrays with two or more dimensions. A two-dimensional
array can be thought of as a table or matrix.

Declaration of multidimensional `array`:

```pascal
var <nome>: array [<range1>, ... ,<rangeN>] of <tipo>
```

To access a single element of the array, the notation is used:

```pascal
<nome>[<i1>, <i2>, ... ,<iN>]
```

If two arrays have the same dimensions, the assignment operation is possible.

```pascal
program vettori_multi;
const
	n = 10;
	p=10;
var
	m : array[1..n, 1..p] of integer;
	i,j: integer;
begin
	randomize;
	for i := 1 to p do begin
		for j := 1 to n do begin
			m[i,j] := random(100)+1;
			write(m[i,j]:4);
		end;
		writeln;
	end;
end.
```

## `type`

The keyword `type` allows you to give a name to a user-defined data type (i.e.,
rename an existing type) and use this name within the program.

```pascal
type int_array = array [1..100] of integer;
...
var a: int_array;
begin
	a[1] := 10;
end.
```

## Record

Through the `record` mechanism, Pascal allows us to construct complex data
types that are formed by multiple fields.

The general structure of a record is as follows.

```pascal
record
	<campo>: <tipo>;
	<campo>: <tipo>;
	...
end;
```

To access a certain field, the notation `<nome>.<campo>` is used.

For example, we can think of wanting to manipulate a user's data; this user's
data are: name, surname, and userid. The corresponding data structure can be
created in the following way.

```pascal
type utente =
	record
		nome: string;
		cognome: string;
		uid: integer;
	end;

...
var mario: utente;
...
mario.nome := 'Mario';
mario.cognome := 'Rossi';
mario.uid := 001;
```

If you need to manipulate many fields of a `record`, the keyword `with` can be
useful as it allows us not to specify the record name every time.

```pascal
with mario do
begin
	nome := 'Mario';
	cognome := 'Rossi';
	uid := 001;
end;
```

### Variant Records

A `record` that varies its structure according to the value of one of its
fields (discriminator field) is called a variant `record`; the general form is
as follows:

```pascal
record
	<campo>: <tipo>;
	<campo>: <tipo>;
	<campo>: <tipo>;
	...
	case <campo>: <tipo> of
	<val1>: (campi aggiuntivi);
	<val2>: (campi aggiuntivi);
end;
```

A `record` can have only one variant part and it must always be declared at the
end after the fixed part.

```pascal
type utente = record
	nome: string;
	cognome: string;
	case coniugato: boolean of
	true:(
		moglie: string;
		nfigli: integer;
	);
end;
```

We conclude with a small example.

`record_demo.pas`

```pascal

program record_demo;

type utente = record
	nome: string;
	cognome: string;
	uid: integer;
end;

var mario, luca: utente;
	{un record si può anche specificare direttamente senza bisogno di
	definire il tipo con type}
	gianni: record
		nome: string;
		cognome: string;
		uid: integer;
		case coniugato: boolean of
		true:(
			moglie: string;
			nfigli: integer;
			);
	end;

begin
	mario.nome := 'Mario';
	mario.cognome := 'Rossi';
	mario.uid := 001;

	{utilizzo di with}
	with luca do begin
		nome := 'Luca';
		cognome := 'Verdi';
		uid := 002;
	end;

	writeln('nome: ' + mario.nome);
	writeln('nome: ' + luca.nome);

	gianni.nome := 'Gianni';
	gianni.coniugato := true;
	gianni.moglie := 'Maria';
	gianni.nfigli := 3;

	writeln('nome: ' + gianni.nome);
	writeln(gianni.nome + ' e'' sposato con ' + gianni.moglie);

	luca := mario;	{assegnazione}
	writeln('nome: ' + luca.nome);
	writeln('cognome: ' + luca.cognome);
end.
```

## Sets

Pascal allows you to manage the mathematical model of sets with a particular
data type, called precisely `set`. First of all, let's say that sets can
contain elements of a certain type; the possible types in Pascal's `set` are:
integers, characters, and enumerations. The declaration of a set has the
following structure.

```pascal
set of <tipo>;
```

The first thing to learn to work with `set` type data is the initialization of
a set, that is, how to assign elements to a set; the operation is very simple
and is performed as follows:

```pascal
<insieme> := [(lista dei dati)] ;
```

Declaration and initialization of some sets:

```pascal
type insiemeinteri = set of integer;
     cifre=0..9;
     insiemecifre = set of cifre;
     insiemelettere = set of char;
     insiememinuscole = set of 'a'..'z';
     maiuscole = 'A'..'Z';
     insiememaiuscole = set of maiuscole;
     colori = (giallo , verde , rosso );
     insiemecolori = set of colori ;

...

var a,b : insiemeinteri;
    c : insiemecolori;

a := [1,2,3,5,12,56];
b := [10..100];
c := [giallo , rosso];
```

If we have many consecutive elements, it is possible to use the notation
`[<inizio>..<fine>]`, as can be seen from the example.

The corresponding mathematical operations on sets are performed by various
binary operators: the union operator `+`, the intersection operator `*`, and
the set difference operator `-`.

Operations on sets:

```pascal
var a,b,c: insiemeinteri;

...

a := [1,3] + [4,7]; (* a = [1,3,4,7] *)
b := [1,2,3] * [2,5,6]; (* b = [2] *)
a := [1,2,3,4];
b := [1,3];
c := a-b; (* a = [2,4] *)
```

To determine whether an element belongs to a set or not, the membership
operator `in` is used. This operator returns a boolean value, `true` if the
element belongs to the set, `false` otherwise.

Membership in a set:

```pascal
var a: insiemeinteri;
    ris: boolean;


a := [1,2,3,4];

ris := 3 in a;  (*true*)
ris := 10 in a; (*false*)
```

Between two sets it is possible to make a comparison to determine whether the
sets are equal, different, or whether one of the two is a subset of the other.
The following table summarizes the corresponding operators.

|       |                                                                    |
|-------|--------------------------------------------------------------------|
|`=`	|returns `true` if the two sets are equal                            |
|`<>`	|returns `true` if the two sets are different.                       |
|`<=`	|returns `true` if the first set is a subset of the second.          |
|`>=`	|returns `true` if the second set is a subset of the first.          |

```pascal
var a: insiemeinteri;
    ris: boolean;
...
a := [1..10];
ris := [1,2] <= a;   (*true;*)
ris := [11,12] <= a; (*false*)
```

## Enumerated Types

An enumerated type consists of an ordered sequence of identifiers. The type
thus defined is an ordinal type and it is possible to compare these values and
use them as indices for `array`.

The enumerated type is defined in this way.

```pascal
type <nome_tipo> = (<valore1>, <valore2> ...);
```

Let's see an example.

`enum_demo.pas`

```pascal

program enum_demo;

type giorni = (lunedi, martedi, mercoledi, giovedi, venerdi, sabato, domenica);

var g1, g2: giorni;
	a: array [lunedi .. domenica] of integer;

begin
	g1 := lunedi;
	g2 := sabato;

	if (g1 < g2) then
		writeln('g1 < g2')
	else
		writeln('g1 >= g2');

	a[lunedi] := 10;
	a[martedi] := 20;
end.
```

## Subranges

A subrange is a data type that includes only a portion of the possible values
of a simple ordered data.

The data is defined in the following way.

```pascal
type <nome> = <v_iniziale> .. <v_finale>;
```

For example.

```pascal
program subrange;

type
	lettere = 'a' .. 'z';
	cifre = 0 .. 9;

var
	l: lettere;
	n: cifre;
begin
	l := 'a';
	n := 2;

	writeln(l);
	writeln(n);
end.
```

# Files

## Direct Access Files

First of all, we must clarify two aspects of files: organization and access
method.

Organization indicates how the file is physically arranged on disk. There are
two types of organization: sequential and random; as can be understood, in
sequential organization all elements are arranged sequentially one after
another; those with random access are arranged in a non-sequential way. Let's
say immediately that all files managed by Pascal are organized sequentially.

The access method, on the other hand, is the way in which files are accessed,
and as we have seen in the previous lesson, there are two: sequential and
direct access. In the first method, to access element i, you have to read all
i-1 preceding elements, while with direct access it is possible to read the
desired element directly. ANSI Pascal only provides for the use of sequential
files with sequential access, those seen in the previous lesson, but almost all
implementations also provide for the use of sequential files with direct access
which we are going to analyze now.

## Sequential Files with Direct Access

Files of this type behave exactly like those seen previously, so all phases are
the same and managed by the same procedures and functions, the only difference
lies in a procedure that is able to move the head to the desired position; the
procedure is called seek and has the following form:

```pascal
procedure seek (var nomeinterno: file; posizione: integer);
```

Let's remember that positions start from 0 to n-1, where n is the file size.

Now let's see two useful functions for file management in Pascal:

```pascal
function filesize (var nomeinterno: file): integer;
function pos(var nomeinterno: file): integer;
```

As can be guessed, `filesize` returns the size of the file, while `pos`
returns the current position of the head. With this we conclude the discussion
on files; later we will analyze text files. We conclude with a complete program
that better analyzes the operation of files:

```pascal
program files;
var
	f: file of integer;
	num: integer;
begin
	writeln('inserire una serie di numeri ');
	writeln('per fermarsi inserite 0 ');
	(*creazione ed apertura in scrittura del file*)
	assign(f, 'dati.dat');
	rewrite(f);
	(*inserimento dei dati*)
	writeln;
	write('inserisci numero : ');
	readln(num);
	while (num <> 0) do begin
		write(f, num);
		write('inserisci numero : ');
		readln(num);
	end;
	(*chiusura del file*)
	close(f);
	(*apertura in lettura e lettura dei dati*)
	reset(f);
	writeln;
	writeln('hai inserito ', filesize(f), ' numeri');
	writeln;
	writeln('lettura dei dati memorizzati :');
	while (not eof(f)) do begin
		read(f, num);
		writeln(num);
	end;
	close(f);
end.
```

## Text Files

Pascal also allows you to use text files, which form a type indicated by the
name `text`. Files of type `text` behave like character files so writing `var
f : text` is equivalent to writing `var f: file of char`.

Text files behave like all other files and consequently everything said
previously about them is valid. There is however to say that text files have
two additional functions that allow their processing; let's see them
immediately:

```pascal
procedure readln ( var nomeinterno: text);
procedure writeln( var nomeinterno: text);
```

The `writeln` procedure inserts the `eoln` (end of line) character in the file
which indicates the end of a line; consequently the `readln` procedure skips
the `eoln` character and brings the head to the beginning of the new line. To
know whether the head is on an `eoln` character or not, the function `eoln(f)`
helps us, which returns `true` if the head is on an `eoln` character or `false`
otherwise.

```pascal
function eoln(var t:text) : boolean;
```

Examples:

```pascal
(1) var f: text; ...
(2) assign(f,'prova.txt');
(3) rewrite(f);
(4) write(f,'d');
(5) writeln(f);
(6) close(f);
```

In this example you can see how to create (2), open a text file for writing
(3), how to write a character (4) and how to put an `eoln` marker with the
`writeln` procedure (5); finally with instruction (6) we close the file and
mark it with an `eof`.

Examples:

```pascal
(1) var f: text;
        c: char;
...
(2) assign(f,'prova.txt');
(3) reset(f);
(4) read(f,c);
(5) close(f);
```

Here instead we see how to read a character from a text file (4).

We now show a complete program:

```pascal
program prova_text;
uses crt;
var
	t: text;
	c: char;
begin
	(*creazione e apertura in scrittura*)
	assign(t,'testo.txt');
	rewrite(t);
	(*fase di scrittura testo*)
	writeln('inserire un testo (premere esc per terminare)');
	writeln;
	c:= readkey;
	(* #27 e #13 corrispondono a esc ed invio*)
	while (c <> #27) do begin
		if ( c = #13) then begin
			writeln(t);
			writeln;
		end
		else begin
			write(t,c);
			write(c);
		end;
		c := readkey;
	end;
	close(t);
	(*apertura in lettura*)
	reset(t);
	(*lettura del testo*)
	writeln;
	writeln('il testo inserito è il seguente :');
	writeln;
	while (not eof(t)) do begin
		if (eoln(t)) then begin
			readln(t);
			writeln;
		end
		else begin
			read(t,c);
			write(c);
		end;
	end;
	close(t);
end.
```

In this program, the two `while` loops are very important which show how to
perform a read or write loop on a text file.

# Pointers

Simplifying, we can think of a computer's memory as a contiguous list of memory
cells; each of these cells is identified by a unique address.

Pascal allows through the use of the `^` and `@` operators to use variable
addresses. In particular, the address operator `@` returns the address
associated with a variable, while the `^` operator allows you to access the
memory location indicated by an address.

To use a pointer, you must first define its type through the following
notation.

```pascal
^<tipo>
```

This defines a pointer to a variable of type `<tipo>`. Obviously, you can also
define the pointer type through `type`.

```pascal
type <nome_tipo_puntatore> = ^<tipo>
```

Let's see an example to understand the operation.

```pascal
program pointer_demo2;

type
	pint = ^integer;	{definisce un puntatore ad integer}

var
	num: integer;
	p1, p2: pint;		{dichiarazione dei puntatori}
	p3: ^integer;		{dichiarazione diretta senza ricorrere a type}

begin
	num := 20;
	writeln('num = ', num);
	p1 := @num;		{p1 contiene l'indirizzo di num}
	writeln('p1^ = ', p1^);	{p1^ ci consente di accedere all'indirizzo
				contenuto nel puntatore}
	p2 := p1;		{sia p1 che p2 puntano a num}
	writeln('p2^ = ', p2^);

	p1^ := 30;		{modifichiamo num attraverso il suo puntatore}
	writeln('num = ', num);
end.
```

The output produced is the following.

```
num = 20
p1^ = 20
p2^ = 20
num = 30
```

# Dynamic Memory

Memory can be allocated/deallocated dynamically at runtime (during program
execution) thanks to the system functions `new` and `dispose`.

The function `new(<puntatore>)` allocates space and makes it accessible through
the pointer (the amount of memory allocated depends on the type of the
pointer), while `dispose(<puntatore>)` takes care of freeing the space, making
it available again for subsequent allocations. It is important to free memory
when it is no longer needed as the memory used for dynamic allocation (known as
the *heap*) is limited and Pascal does not clean it automatically.

Let's see an example that uses pointers and dynamic memory to create a linked
list; note the use of the value `NIL` which represents the null value for
pointers; if a pointer is `NIL` it points to nothing.

```pascal
program pointer_demo;

type
	list = ^cell;
	cell = record
		value: integer;
		next: list;
	end;

var
	l1, l2: list;
begin
	new(l1);
	l1^.value := 10;
	l1^.next := NIL;
	writeln('l1^.value = ', l1^.value);

	new(l2);
	l2^.value := 20;
	l2^.next := NIL;

	l1^.next := l2;
	writeln('l1^.next^.value = ', l1^.next^.value);

	dispose(l1);
	dispose(l2);
end.
```

The output is the following.

```
l1^.value = 10
l1^.next^.value = 20
```
