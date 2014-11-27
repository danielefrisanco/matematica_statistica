/*2014 DANIELE FRISANCO*/ 


function potenza(x, y) {
	var rval = 1;
	for (var i = 0; i < y; i++) {
		rval *= x;

	}
	return rval;

}
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
	/*var rval = 1;
	for (var i = 0; i < k; i++) {
	rval *= n;

	} return rval; */
	return potenza(n, k);

}
function combinazione_semplice(n, k) {
	return fattoriale(n) / (fattoriale(k) * fattoriale(n - k));

}
function combinazione_ripetizione(n, k) {
	return fattoriale(n + k - 1) / (fattoriale(k) * fattoriale(n - 1));

}

function catalan(n) {

	return (fattoriale(2 * n)) / (fattoriale(n + 1) * fattoriale(n));
}

function coefficienti_binomiali(a, b, n) {

	var vettore_coefficienti = [];

	for (var i = 0; i <= n; i++) {
		vettore_coefficienti[i] = combinazione_semplice(n, i);
	}
	return vettore_coefficienti;

}
