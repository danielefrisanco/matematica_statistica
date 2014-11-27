/*function fattoriale(n) {
if (n <= 1)
return 1;
return n * fattoriale(n - 1);
}
 */

function fattoriale(n) {
	var rval = 1;
	for (var i = 2; i <= n; i++)
		rval = rval * i;
	return rval;
}
function permutazione_semplice(n) {
	return permutazione(n, []);
}
function permutazione_ciclica(n) {
	return permutazione(n - 1, []);
}
/*
function permutazione(n, k1) {
return fattoriale(n) / fattoriale(k1);
}*/
function permutazione(n, ks) {
	var denominatore = 1;

	for (var i = 0; i < ks.length; i++) {
		denominatore = denominatore * fattoriale(ks[i]);
	}

	return fattoriale(n) / denominatore;
}

function disposizione_semplice(n, k) {
	var rval = 1;
	for (i = n; i >= n - k + 1; i--)
		rval *= i;
	return rval;

}
function disposizione_ripetizione(n, k) {
	var rval = 1;
	for (var i = 0; i < k; i++) {
		rval *= n;

	}
	return rval;

}
function combinazione_semplice(n, k) {
	return fattoriale(n)/(fattoriale(k)*fattoriale(n-k));

}
function combinazione_ripetizione(n, k) {
	return fattoriale(n+k-1)/(fattoriale(k)*fattoriale(n-1));

}


function catalan(n){

return (fattoriale(2*n))/(fattoriale(n+1)*fattoriale(n));
}










/*
var a = [];
a[0] = 4;
a[1] = 3;
alert("PERMUTAZIONE" + permutazione(7, a));
alert("PERMUTAZIONE_semplice" + permutazione_semplice(7)); 
alert("disposizione_semplice" + disposizione_semplice(13,8)); 
alert("disposizione_ripetizione" + disposizione_ripetizione(3, 14));
alert("combinazione_semplice" + combinazione_semplice(90,6));
alert("combinazione_ripetizione" + combinazione_ripetizione(20,2));*/
