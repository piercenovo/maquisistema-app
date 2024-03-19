String getPokemonImage(String url) {
  // Dividir la URL en partes utilizando '/'
  List<String> partes = url.split('/');

  // Obtener el segmento entre el último y penúltimo slash
  String segmento = partes[partes.length - 2];

  return 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$segmento.png';
}

String getPokemonImageSecondary(String url) {
  return 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$url.png';
}

String getPokemonIndex(String url) {
  // Dividir la URL en partes utilizando '/'
  List<String> partes = url.split('/');

  // Obtener el segmento entre el último y penúltimo slash
  String segmento = partes[partes.length - 2];

  return segmento;
}

String firstLetterCapital(String cadena) {
  if (cadena.isEmpty) {
    return cadena;
  }
  return cadena[0].toUpperCase() + cadena.substring(1);
}
