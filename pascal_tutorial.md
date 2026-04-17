---
title: Tutorial sul Pascal
author: Mariano Bono
date: 2021/11/01
...

# Tutorial sul Pascal

Questo documento contiene una breve panoramica sul linguaggio di
programmazione Pascal, illustrando la struttura, i costrutti, le strutture di
controllo e i tipi di dati tipici del linguaggio.

# Basi del linguaggio

## Hello world

Partiamo il classico programma `hello world` scritto in Pascal. Questo codice
non fa altro che stampare a video la stringa di testo `hello, world`.

`hello.pas`
```pascal
{hello.pas: write the string "hello, world"}
program hello;
begin
  writeln('hello, world');
end;
```

Analizziamo il programma riga per riga: alla prima troviamo un commento, il
testo scritto tra `(* *)` oppure tra `{ }` viene completamente ignorato dal
compilatore; la riga 2 indica l'inizio del programma con la parola chiave
`program` seguita dal nome del programma (`hello`); le righe 3 e 5
definiscono l'inizio e la fine del blocco principale del programma; tra le
parole chiave `begin` e `end` vanno inserite le istruzioni che verranno
eseguite; La riga 4 è quella che stampa a video la stringa `hello, world`, il
comando `writeln('testo da stampare')` scrive a video tutto quello che si
trova tra gli apici.

## Struttura del programma

Un programma Pascal si divide generalmente in tre parti: intestazione, blocco
delle dichiarazioni e blocco delle istruzioni.

L'intestazione comincia con la parola chiave `program` seguita dal nome del
programma e terminata da un punto e virgola.

```pascal
program <nome_programma>;
```

Il blocco delle dichiarazioni definisce i vari dati che si usano nel programma
e contiene: etichette (`label`), costanti (`const`), tipi definiti dall'utente
(`type`), variabili (`var`), procedure (`procedure`) e funzioni (`function`).

Il blocco delle istruzioni contiene le istruzioni che il programma deve
eseguire una volta avviato.

Ricapitolando abbiamo la seguente struttura:

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

Anche se è possibile scambiare l'ordine di alcuni elementi nel blocco delle
dichiarazioni è consigliabile non farlo e rispettare l'ordine predefinito.

TIP: Per ricordarsi facilmente l'ordine corretto basta memorizzare la frase 'La
Cosa Tre Volte Più Facile': le iniziali di ogni parola coincidono con un
elemento del programma (`label`, `const`, `type`, `var`, `procedure` e
`function`).

## Parole riservate

Il Pascal ha una serie di parole riservate che non possono essere utilizzate
come identificatori.

Le parole riservate del Pascal ANSI sono mostrate nella tabella seguente.

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

## Identificatori

Un identificatore è il nome che si assegna ad una parte di un programma Pascal
quale può essere una variabile, una costante, una funzione, una procedura, o
una etichetta.

Un identificatore è costituito da una sequenza qualsiasi di lettere e cifre,
purché il primo carattere sia una lettera. Non sono ammessi spazi o caratteri
diversi da numeri e lettere con l'unica eccezione del carattere underscore
`_`.  Il Pascal è case-insensitive quindi non distingue tra maiuscole e
minuscole.

.alcuni esempi sugli identificatori
```pascal
pippo Pippo21 Pippo34 {identificatori validi}
PIPPO pippo Pippo {rappresentano tutti lo stesso identificatore}
12Pippo {non valido in quanto inizia con un numero}
```

## Tipi di dato

In Pascal distinguiamo tra tipi di dati semplici e strutturati; vediamo quali
sono:

* Dati di tipo semplice:
  * Tipi Standard 
    * Integer
    * Real
    * Char
    * Boolean
  * Tipi dichiarati
    * Enumerati
    * Sottocampi
* Dati di tipo stringa
* Dati strutturati
  * Record 
  * Array
  * Set
  * File
* Dati di tipo puntatore

## Letterali

### Numeri

Distinguiamo tra numeri interi e reali.

I numeri interi sono una sequenza di cifre eventualmente preceduta dal segno.

.numeri interi validi
```pascal
124
2345
-34
+22
```

I numeri reali contengono un punto decimale oppure un esponente o entrambi
utilizzando la notazione esponenziale in base 10 dove al posto del 10 si
utilizza il simbolo `E`.

.numeri reali validi
```pascal
12.3
434.44 
-342.454 
+56.33 
12.4E2 {12.4x10\^2} 
8.5E-2 {8.5x10\^-2}
```

### Caratteri

Un carattere è rappresentato da un qualsiasi carattere alfanumerico tra apici:

```pascal
'a' 'b' 'c' '1' '0'
```

### Stringhe

Una stringa è una sequenza di caratteri alfanumerici racchiusa tra apici.

```pascal
'Io sono una stringa di testo'
```

### Letterali booleani

Esistono due letterali booleani e sono `true` e `false`.

### Costanti

Una costante è un oggetto che rimane sempre con lo stesso valore per tutta la
durata del programma.

La struttura per dichiarare una costante è la seguente:

```pascal
const <identificatore> = <valore>;
```

.esempio
```pascal
const settimana = 7;
const ore = 24;
```

### Variabili

Le variabili sono degli oggetti che possono assumere valori di un certo tipo;
durante l'esecuzione del programma il loro valore può essere modificato ma il
tipo di dato deve rimanere lo stesso (una variabile `integer` può memorizzare
solo dati di tipo intero).

Le variabili vanno dichiarate nel seguente modo:

```pascal
var <var1>,<var2>, ... : <tipo di dato>;
```

.esempio
```pascal
var nome: string; var numero: integer;
```

### Operatore di assegnazione

Dopo avere dichiarato una variabile ad essa possiamo assegnare un
valore; per farlo ricorriamo all'operatore di assegnazione.

.assegnazione
```pascal
<nome_variabile> := <espressione>;
```

Un'espressione può essere una costante dello stesso tipo della variabile o una
espressione complessa il cui risultato è dello stesso tipo della variabile.

.esempi
```pascal
var n: integer; {dichiarazione}
 ...
n := 10; {assegnazione semplice}
n := (10 + 2) \* 5; {assegnazione complessa}
```

# Tipi di dati semplici

## Numeri

I numeri interi in Pascal sono rappresentati dal tipo `integer`, mentre i numeri
in virgola mobile sono del tipo `real`.

I seguenti operatori sono supportati:

* `+`: addizione
* `-`: sottrazione
* `*`: moltiplicazione
* `/`: divisione
* `div`: divisione intera
* `mod`:  resto della divisone intera

Questi sono operatori binari (richiedono due operandi) che operano su dati di
tipo numerico; la divisione `/` genera un dato `real`, mentre gli operatori
`div` e `mod` operano su `integer` e generano un dato di tipo `integer`.

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

## Caratteri

Il tipo di dato carattere in Pascal è indicato dalla parola chiave `char`. Una
variabile di tipo `char` può assumere il valore di uno dei 255 caratteri
definiti dal codice ASCII.

Il carattere può essere assegnato direttamente come letterale (come abbiamo
visto un letterale di tipo carattere è un qualsiasi carattere alfanumerico
contenuto tra apici) o direttamente con il suo valore numerico attraverso la
funzione `chr`.

```pascal
var c: char;
...
c := 'A';
c := chr(65);
```

In questo esempio entrambe le operazioni di assegnazione producono lo stesso
risultato.

## Stringhe

Le stringhe di caratteri in Pascal rappresentano un tipo di dato proprio del
linguaggio: il tipo `string`. Come abbiamo visto una stringa è una qualsiasi
sequenza di caratteri racchiusa tra apici `''`.

.dichiarazione e assegnazione di una stringa
```pascal
var str: string; ... str := 'hello, world';
```

Una variabile cosi dichiarata può contene al massimo una stringa di 255
caratteri, ma è possibile dichiarare stringhe con un'ampiezza minore usando la
seguente forma.

```pascal
var str: string\[10\]; {contiene stringhe di max 10 caratteri}
```

L'operatore di concatenazione `+` permette di fondere più stringhe in una sola.

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

## Tipi di dato `boolean` e operatori logici

In Pascal i valori booleani formano un vero e proprio tipo di dato
contrassegnato dall'identificatore `boolean`. Gli operatori booleani sono
`and`, `or` e `not`; sono operatori che restituiscono un dato di tipo
`boolean` secondo le seguenti tabelle di verità.

| Primo operando | Secondo Operando |Operatore `and`| Operatore `or` |
|----------------|------------------|---------------|----------------|
| `false`        | `false`          | `false`       |`false`         |
| `false`        | `true`           | `false`       | `true`         | 
| `true`         | `false`          | `false`       | `true`         |
| `true`         | `true`           | `true`        | `true`         |

| Operando | Operatore `not`|
|----------|----------------|
| `false`  | `true`         |
| `true`   | `false`        |

Osserviamo che l'operazione di `and` restituisce un valore vero solo se
entrambi gli operandi sono veri; l'operatore `or` restituisce un valore vero
se almeno uno dei due operandi è vero; l'operatore `not` inverte il predicato.

## Operatori logici

Sono operatori che confrontano due espressioni e restituiscono un valore
booleano (`true` o `false`).

* Maggiore: `>`
* Maggiore uguale: `>=`
* Minore: `<`
* Minore uguale: `<=`
* Uguale: `=`
* Diverso: `<>`

È possibile confrontare tra di loro numeri numeri (anche `integer` con
`real`), stringhe, caratteri, dati booleani (`false` è minore di `true`) e
caratteri con stringhe. Per stringhe e caratteri viene rispettato l'ordine
lessicografico. Non è possibile confrontare stringhe e caratteri con dati
numerici.

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
  c := ('h' \<'world'); 
end.
```

## Condizione

Una condizione è un espressione booleana: nel caso più semplice è una
variabile o un letterale di tipo `boolean`, ma può anche essere un espressione
complessa formata da operatori booleani e logici. In ogni caso una condizione
o è `true` o è `false`.

```pascal
(10 \< 20) and (a \> b);
```

# Input e output

I comandi principali per le operazioni di input/output sono due: `read` e
`write`; il primo legge i dati dal file `input` mentre il secondo scrive sul
file `output`. I file `input` e `output` sono associati di default alla
tastiera e allo schermo, ma si può cambiare l'associazione di default
legandoli a file reali o ad altri dispositivi.

```pascal
read(var1, var2, ...);
write(exp1, exp2, ...);
```

Il comando `read` legge i dati dallo standard input e li memorizza nelle
variabili indicate; i tipi ammessi sono `char`, `string`, `integer` e `real`.
Nello standard input i dati sono separati da uno o più spazi o da un carattere
di fine riga (che si ottiene digitanto `invio` quando lo standard input è la
tastiera).

Il comando `write` stampa sullo standard output la lista di dati indicata;
possono essere passate variabili, costanti o espressioni di tipo `string`,
`char`, `integer` o `real`.

Esistono due varianti di `read` e `write` che sono rispettivamente `writeln` e
`readln`; il primo stampa il carattere `EOL` (end of line) dopo i dati, mentre
il secondo dopo avere letto i dati si sposta alla riga successiva (dopo il
carattere `EOL`).

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

## Formattazione dell'output

È possibile formattare l'output inserendo lo spazio che un certo dato deve
occupare sullo schermo utilizzando la seguente forma.

```pascal
write(exp:spazio);
```

Se il dato necessita di più spazio la formattazione viene ignorata, mentre nel
caso in cui il dato richiede meno spazio, questo viene preservato e il dato
viene allineato a destra.

Per i dati `real` è possibile specificare un ulteriore campo per indicare
quante cifre dopo la virgola stampare.

```pascal
write(exp:spazio:cifre decimali);
```

Il codice seguente chiarisce il concetto.

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

# Strutture di controllo

## Costrutto di scelta: `if`

Il costrutto `if` consente di eseguire un blocco di codice solo se una
condizione risulta vera.

```pascal
if (<condizione>) then
  <blocco>
```

Esiste la variante `if .. else` in cui se la condizione risulta `false` allora
viene eseguito il blocco alternativo.

```pascal
if (<condizione>) then
  <blocco>
else
  <blocco alternativo>
```

Diversi `if .. else` si possono annidare dando luogo al costrutto `if .. else
if` che consente di effettuare scelte multiple.

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

L'ultimo `else` si riferisce sempre all'ultima occorrenza di `if`.

WARNING: L'ultima istruzione prima della parola chiave `else` non deve essere
terminata dal punto e virgola.

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

## Scelta multipla: `case`

La struttura `case` permette di effettuare una scelta multipla in base al
risultato di una espressione oppure al contenuto di una variabile. La forma
della struttura di controllo `case` è la seguente :

```pascal
case (espressione o variabile) of
  listavalori1: (blocco1)
  listavalori2: (blocco2)
  ...
  listavalorin: (bloccon)
  else (bloccoelse)
end;
```

Viene valutato il valore dell'espressione o della variabile e viene cercato il
corrispondente valore tra quelli indicati nelle varie liste; se il valore
viene trovato allora viene eseguito il blocco di codice corrispondente
altrimenti viene eseguito il blocco `else`. Il blocco `else` è opzionale; in
questo caso se il valore non viene trovato allora non viene eseguito nessun
blocco di codice e l'esecuzione prosegue senza problemi.

Scelta multipla usando una variabile:

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

Scelta multipla usando il risultato di una espressione:

```pascal
case (i mod 9) of
	1,2,3,7,8:
		writeln('blocco1');
	4,5,6:
		writeln('blocco2');
end;
```

Un semplice menu:

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

## Ciclo `while`

La struttura `while` esegue un blocco di codice in maniera ciclica fino a
quando la variabile o l'espressione di controllo rimane `true`.

```pascal
while (<espressione booleana>) do
	<blocco>
```

Conteggio da 1 a 10:

```pascal
i := 1;

while (i <= 10) do
begin
	writeln(i);
	inc(i);
end;
```

NOTE: le procedure `inc(var n: integer)` e `dec(var n: integer)` incrementano
e decrementano di uno la variabile fornita come argomento.

Stampa la tabellina del 3:

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

## Ciclo `repeat`

Il ciclo `repeat` è simile al ciclo `while` con la grossa differenza che
la condizione di uscita dal ciclo viene valutata alla fine dello stesso
per cui il ciclo viene eseguito almeno una volta.

```pascal
repeat
	<blocco>
until <condizione>;
```

Il blocco di codice viene eseguito finché la condizione non è vera.  Vediamo
il conteggio da uno a dieci con il ciclo `repeat`.

Conteggio da 1 a 10:

```pascal
i := 1;

repeat
begin
	writeln(i);
	inc(i);
end;
until (i > 10);
```

## Ciclo `for`

La struttura `for` esegue un loop un numero prestabilito di volte.


```pascal
for <variabile> := <viniziale> to <vfinale> do
	<blocco>
```

La variabile indicata assume tutti i valori tra <viniziale> e <vfinale>
incrementando ogni volta di 1; il numero di loop eseguito è <vfinale> -
<viniziale> + 1.

La seguente variante decrementa di 1 la variabile di controllo.

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

# Procedure e funzioni

Il Pascal offre due tipi di subroutine: `procedure` e `function`.

Dal punto di vista concettuale le `procedure` sono utilizzate quando il
sottoprogramma deve eseguire delle azioni, le `function` invece sono
usate per fornire il risultato di un elaborazione.

Dichiarazione di `procedure` e `function`:

```pascal
procedure <nome>(<lista parametri>);
	<corpo della procedura>

function <nome>(<lista parametri>):<tipo restituito>;
    <corpo della funzione>
```

## Struttura dei sottoprogrammi

Un sottoprogramma Pascal ha la stessa struttura di un programma generico.

Struttura di una `procedure`:

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

Struttura di una `function`:

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

La cosa che si nota immediatamente è che all'interno dei sottoprogrammi è
possibile definirne altri.

Per invocare un sottoprogramma si utilizza la seguente forma:

```pascal
<procedura>(<parametri>);
<var> := <funzione>(<parametri>);
```

Due semplici subroutine:

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

## Valore restituito da una `function`

Abbiamo visto che una funzione restituisce un valore di uscita; il metodo per
assegnare il valore di uscita dall'interno della funzione è il seguente:

```pascal
<nome_funzione> := <valore_uscita>;
```

`function` che restituisce il quadrato di un numero:

```pascal
function sqr(a: integer): integer;
begin
	sqr := a * a;
end;
```

## Parametri

La lista dei parametri è una lista di identificatori raggruppata per
tipo.

```pascal
(p1, p2, ...: tipo1; pJ, pK, ...: tipo2; ...);
```

All'interno del sottoprogramma i parametri possono essere utilizzati
all'interno di espressioni come se fossero delle variabili.

Esistono due tipi di parametri: parametri valore e parametri variabile.

Per i parametri valore viene fatta una copia locale (all'interno del
sottoprogramma) e quindi eventuali modifiche al parametro non hanno effetto al
di fuori del sottoprogramma.

I parametri variabile invece sono passati direttamente al sottoprogramma e
quindi ogni modifica ad esso si riflette anche all'esterno del sottoprogramma.

Per dichiarare un parametro variabile si utilizza la parola chiave `var`.

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

Output di `parametri.pas`:

```
local a = 100
local b = 25
local c = 125
global a = 10
global b = 5
global c = 125
```

I valori di `a` e `b` vengono modificati all'interno di `foo`, ma questa
modifica rimane locale alla `procedure`; al contrario le modifiche a `c` sono
globali.

Facciamo un altra distinzione tra parametri formali e parametri attuali: i
parametri formali sono quelli dichiarati nell'intestazione, quelli attuali
invece sono i parametri forniti al momento dell'invocazione. I parametri
attuali devono rispettare i tipi dei parametri formali, inoltre i parametri
attuali possono essere passati anche come costanti e non devono rispettare i
nomi dei parametri formali.

Esempi validi di invocazione di `foo`:

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

# Dati strutturati

## Array

Un `array` (vettore) può essere visto come come una lista consecutiva di
dati dello stesso tipo a cui è possibile accedere tramite un indice.

```pascal
(a1, a2, a3, ... ,aN)
```

Per dichiarare un vettore si usa la seguente notazione.

```pascal
var <nome>: array [<range_indice>] of <tipo_di_dato>;
```

Il campo `<range indice>` indica valori iniziali e finali dell'indice;
la dimensione del vettore si calcola quindi:

```pascal
<valore finale> - <valore iniziale> + 1
```

Il tipo di un vettore può essere uno qualunque dei tipi semplici o anche
un tipo definito dall'utente (lo vedremo in seguito).

Gli elementi dell'indice devo appartenere ad un tipo ordinale (in cui è
possibile stabilire una relazione di ordine tra gli elementi):
`integer`, `char`, sottocampo o `enum`.

Alcuni vettori validi:

```pascal
var	a: array [1..100] of integer;
	b: array ['a'..'d'] of integer;
	giorni: array [1..7] of string;
```

Per accedere ad un singolo elemento del vettore si usa la forma:

```pascal
<nome_vettore>[<indice>]
```

È possibile assegnare un array ad un altro facendone cosi una copia
esatta.

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

### Array multidimensionali

È possibile definire array a due o più dimensioni. Un array bidimensionale
può essere pensato come una tabella o una matrice.

Dichiarazione di `array` multidimensionali:

```pascal
var <nome>: array [<range1>, ... ,<rangeN>] of <tipo>
```

Per accedere ad un singolo dato del vettore si usa la notazione:

```pascal
<nome>[<i1>, <i2>, ... ,<iN>]
```

Se due vettori hanno le stesse dimensioni è possibile l'operazione di
assegnazione.

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

La parola chiave `type` consente di dare un nome ad un tipo di dato definito
dall'utente (ovvero rinominare un tipo già esistente) ed utilizzare questo
nome all'interno del programma.

```pascal
type int_array = array [1..100] of integer;
...
var a: int_array;
begin
	a[1] := 10;
end.
```

## Record

Attraverso il meccanismo dei `record` il Pascal ci consente di costruire dei
tipi di dati complessi che sono formati da più campi.

La struttura generale di un record è la seguente.

```pascal
record
	<campo>: <tipo>;
	<campo>: <tipo>;
	...
end;
```

Per accedere ad un certo campo si utilizza la notazione `<nome>.<campo>`.

Possiamo ad esempio pensare di volere manipolare i dati di un utente; i dati
di questo utente sono: nome, cognome e userid. La struttura dati
corrispondente può essere creata nel seguente modo.

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

Se si devono manipolare molti campi di un `record` può essere utile la parola
chiave `with` che ci consente di non specificare ogni volta il nome del
record.

```pascal
with mario do
begin
	nome := 'Mario';
	cognome := 'Rossi';
	uid := 001;
end;
```

### Record varianti

Un `record` che varia la sua struttura a seconda del valore di un suo campo
(campo discriminatore) viene chiamato `record` variante; la forma generale è
la seguente:

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

Un `record` può avere una sola parte variante ed essa deve essere dichiarata
sempre alla fine dopo la parte fissa.

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

Concludiamo con un piccolo esempio.

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

## Insiemi

Il Pascal permette di gestire il modello matematico degli insiemi con un
particolare tipo di dato, chiamato appunto `set` (insieme). Diciamo
innanzitutto che gli insiemi possono contenere elementi di un certo tipo; i
tipi possibili nel `set` del Pascal sono: interi, caratteri e enumerati. La
dichiarazione di un insieme ha la seguente struttura.

```pascal
set of <tipo>;
```

La prima cosa da imparare per operare con i dati di tipo `set` è
l'inizializzazione di un insieme, cioè come fare ad assegnare gli elementi ad
un insieme; l'operazione è molto semplice e si esegue nel seguente modo:

```pascal
<insieme> := [(lista dei dati)] ;
```

Dichiarazione e inizializzazione di alcuni insiemi:

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

Se abbiamo molti elementi consecutivi è possibile usare la notazione
`[<inizio>..<fine>]`, come si vede dall'esempio.

Le corrispondenti operazioni matematiche sugli insiemi sono effettuate da vari
operatori binari: l'operatore di unione `+`, quello di intersezione `*` e
quello di differenza tra insiemi `-`.

Operazioni sugli insiemi:

```pascal
var a,b,c: insiemeinteri;

...

a := [1,3] + [4,7]; (* a = [1,3,4,7] *)
b := [1,2,3] * [2,5,6]; (* b = [2] *)
a := [1,2,3,4];
b := [1,3];
c := a-b; (* a = [2,4] *)
```

Per stabilire se un elemento appartiene o no ad un insieme si usa l'operatore
di appartenenza `in`. Questo operatore restituisce un valore booleano, `true`
se l'elemento appartiene all'insieme, `false` nel caso contrario.

Appartenenza ad un insieme:

```pascal
var a: insiemeinteri;
    ris: boolean;


a := [1,2,3,4];

ris := 3 in a;  (*true*)
ris := 10 in a; (*false*)
```

Tra due insiemi è possibile effettuare un confronto per stabilire se gli
insiemi sono uguali, diversi oppure se uno dei 2 è sottoinsieme dell'altro. La
seguente tabella riassume gli operatori corrispondenti.

|       |                                                                    |
|-------|--------------------------------------------------------------------|
|`=`	|restituisce `true` se i due insiemi sono uguali                     |
|`<>`	|restituisce `true` se i due insiemi sono diversi.                   |
|`<=`	|restituisce `true` se il primo insieme è sottoinsieme del secondo.  |
|`>=`	|restituisce `true` se il secondo insieme è sottoinsieme del primo.  |

```pascal
var a: insiemeinteri;
    ris: boolean;
...
a := [1..10];
ris := [1,2] <= a;   (*true;*)
ris := [11,12] <= a; (*false*)
```

## Tipi enumerati

Un tipo enumerato consiste in una sequenza ordinata di identificatori.  Il
tipo cosi definito è un tipo ordinale ed è possibile effettuare il confronto
tra questi valori ed utilizzarli come indici per gli `array`.

Il tipo enumerato viene definito in questo modo.

```pascal
type <nome_tipo> = (<valore1>, <valore2> ...);
```

Vediamo un esempio.

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

## Sottocampi

Per sottocampo si intende un tipo di dato che include solo una porzione dei
possibili valori di un dato semplice ordinato.

Il dato si definisce nel seguente modo.

```pascal
type <nome> = <v_iniziale> .. <v_finale>;
```

Ad esempio.

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

# File

## File ad accesso diretto

Innanzi tutto dobbiamo chiarire due aspetti dei file: l'organizzazione e il
metodo di accesso.

L'organizzazione indica come il file è disposto fisicamente sul disco. Ci sono
due tipi di organizzazione: quella sequenziale e quella random; come si capisce
nell'organizzazione sequenziale tutti gli elementi sono appunto disposti in
modo sequenziale uno dietro l'altro; quelli ad accesso random invece sono disposti in
modo non sequenziale. Diciamo subito che tutti i file gestiti dal Pascal sono
organizzati in maniera sequenziale. 

Il metodo di accesso invece è il modo con cui si accede ai file, e come
abbiamo visto nella lezione precedente sono due: accesso sequenziale e diretto.
Nel primo metodo per accedere all'elemento i bisogna leggere tutti gli i-1
elementi precedenti, invece con l'accesso diretto è possibile leggere
direttamente l'elemento desiderato. Il Pascal ANSI prevede solo l'uso di file
sequenziali ad accesso sequenziale, quelli visti nella lezione precedente, ma
quasi tutte le implementazioni prevedono anche l'uso di file sequenziali ad
accesso diretto che andiamo ad analizzare adesso.

## File sequenziali ad accesso diretto

I file di questo tipo si comportano esattamente come quelli visti in
precedenza, quindi tutte le fasi sono uguali e gestite dalle stesse procedure
e funzioni, l'unica differenza sta in una procedura che è in grado di muovere
la testina sulla posizione desiderata; la procedura si chiama seek ed ha la
seguente forma:

```pascal
procedure seek (var nomeinterno: file; posizione: integer);
```

Ricordiamo che le posizioni cominciano da 0 a n-1, dove n è la
dimensione del file.

Vediamo ora due funzioni utili per la gestione dei file in Pascal:

```pascal
function filesize (var nomeinterno: file): integer;
function pos(var nomeinterno: file): integer;
```

Come si intuisce `filesize` restituisce la dimensione del file, invece `pos`
restituisce la posizione corrente della testina. Con questo concludiamo il
discorso sui file; in seguito analizzeremo i file di testo. Concludiamo con un
programma completo che analizza meglio il funzionamento dei file:

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

## File di testo

Il Pascal permette anche di usare i file di testo, che formano un tipo
indicato con il nome `text`. I file di tipo `text` si comportano come dei file
di caratteri quindi scrivere `var f : text` è equivalente a scrivere `var f:
file of char`.

i file di testo si comportano come tutti gli altri file e di conseguenza
valgono tutte le cose dette in precedenza su di essi. C'è invece da dire che i
file di testo hanno in più due funzioni che ne permettono l'elaborazione;
vediamole subito:

```pascal
procedure readln ( var nomeinterno: text);
procedure writeln( var nomeinterno: text);
```

La procedura `writeln` inserisce nel file il carattere di `eoln` (end of line)
che indica la fine di una riga; di conseguenza la procedura `readln` salta il
carattere di `eoln` e porta la testina all'inizio della nuova riga. Per sapere
se la testina si trova o no su un carattere di `eoln` ci viene in aiuto la
funzione `eoln(f)` che restituisce `true` se la testina è su un carattere di
`eoln` o `false` nel caso contrario.

```pascal
function eoln(var t:text) : boolean;
```

Esempi:

```pascal
(1) var f: text; ...
(2) assign(f,'prova.txt');
(3) rewrite(f);
(4) write(f,'d');
(5) writeln(f);
(6) close(f);
```

in questo esempio si vede come creare (2), aprire in scrittura un file di
testo (3), come scrivere un carattere (4) e come mettere un marcatore di
`eoln` con la procedura `writeln` (5) ; infine con l'istruzione (6) chiudiamo
il file e marchiamo con un `eof`.

Esempi:

```pascal
(1) var f: text;
        c: char;
...
(2) assign(f,'prova.txt');
(3) reset(f);
(4) read(f,c);
(5) close(f);
```

qui invece vediamo come leggere un carattere da un file di testo (4).

mostriamo ora un programma completo :

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

in questo programma sono molto importanti i due cicli `while` che
mostrano come effettuare un ciclo di lettura o di scrittura su un file
di testo.

# Puntatori

Semplificando possiamo pensare alla memoria di un computer come ad una
lista contigua di celle di memoria; ognuna di queste celle è
identificata da un indirizzo univoco.

Il Pascal consente attraverso l'uso degli operatori `^` e `@` di
utilizzare gli indirizzi delle variabili. In particolare l'operatore di
indirizzo `@` restituisce l'indirizzo associato ad una variabile, mentre
l'operatore `^` consente di accedere alla locazione di memoria indicata
da un indirizzo.

Per utilizzare un puntatore bisogna prima definirne il tipo attraverso
la seguente notazione.

```pascal
^<tipo>
```

Questo definisce un puntatore ad una variabile di tipo `<tipo>`.
Ovviamente si può anche definire il tipo del puntatore attraverso
`type`.

```pascal
type <nome_tipo_puntatore> = ^<tipo>
```

Vediamo un esempio per capire il funzionamento.

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

L'output prodotto è il seguente.

```
num = 20
p1^ = 20
p2^ = 20
num = 30
```

# Memoria dinamica

La memoria può essere allocata/deallocata dinamicamente a runtime (durante
l'esecuzione del programma) grazie alle funzioni di sistema `new` e `dispose`.

La funzione `new(<puntatore>)` alloca lo spazio e lo rende accessibile
attraverso il puntatore (la quantità di memoria allocata dipende dal tipo del
puntatore), mentre `dispose(<puntatore>)` si occupa di liberare lo spazio,
rendendolo nuovamente disponibile per successive allocazioni.  È importante
liberare la memoria quando non serve più in quanto la memoria utilizzata per
l'allocazione dinamica (conosciuta con il nome di *heap*) è limitata ed il
Pascal non la pulisce automaticamente.

Vediamo un esempio che sfrutta i puntatori e la memoria dinamica per creare
una lista concatenata; da notare l'utilizzo del valore `NIL` che rappresenta
il valore nullo per i puntatori; se un puntatore è `NIL` non punta a nulla.

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

L'output è il seguente.

```
l1^.value = 10
l1^.next^.value = 20
```
