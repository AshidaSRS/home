#!/bin/bash

#Uso
function usage() {
  echo "majik [OPTION][ARG...]" >&2
  echo "majik -d [COMPRESSED FILE]" >&2
  echo "majik -c [COMPRESSING FILES]" >&2
  echo "majik -h" >&2
}


#Buscador de extensiones
function extFinder() {
  path=${ruta%/*}
  file=${ruta##*/}
  base=${file%%.*}
  ext=${file#*.}
}
#Descompresor en funcion de la extension
function extractor() {
  case $ext in 
    tar.gz)
      mkdir -p "$base"
      echo "Ejecutando 'tar -xzvf ' al archivo $file"
      tar -xzvf "$file" -C "$base"
    ;;
    tar)
      mkdir -p "$base"
      echo "Ejecutando 'tar -xvf ' al archivo $file"
      tar -xvf "$file" -C "$base"
    ;;
    zip)
      mkdir -p "$base"
      echo "Ejecutando 'unzip' al archivo $file"
      unzip "$file" -d "$base" 
    ;;
    7z)
      mkdir -p "$base"
      echo "Ejecutando '7za x -o' al archivo $file"
      7za x -o "$base" "$file" 
    ;;
    rar)
      mkdir -p "$base"
      echo "Ejecutando 'unrar x' al archivo $file"
      unrar x -inul "$file" "$base"
    ;;
    tgz)
      mkdir -p "$base"
      echo "Ejecutando 'tar -xvzf' al archivo $file"
      tar -xvzf "file" -C "$base"
    ;;
    tar.bz2)
      mkdir -p "$base"
      echo "Ejecutando 'tar jxvf' al archivo $file"
      tar jxvf "$file" -C "$base"
    ;;
    bz2)
      mkdir -p "$base"
      mv "$file" "$base"
      cd "$base"
      echo "Ejecutando 'bzip2 -d' al archivo $file"
      bzip2 -d "$file"
    ;;
    gz)
      mkdir -p "$base"
      mv "$file" "$base"
      cd "$base"
      echo "Ejecutando 'gzip -d' al archivo $file"
      gzip -d "$file"
    ;;
    lha)
      mkdir -p "$base"
      echo "Ejecutando 'lha x' al archivo $file"
      lha x w="$base""$file" 
    ;;
    arj)
      mkdir -p "$base"
      mv "$file" "$base"
      cd "$base"
      echo "Ejecutando 'arj x' al archivo $file"
      arj x "$file"
    ;;
    zoo)
      mkdir -p "$base"
      mv "$file" "$base"
      cd "$base"
      echo "Ejecutando 'zoo x' al archivo $file"
      zoo x "$file"
    ;;
  esac
}

#Función que comprime no mas
function compresor() {
  echo "En construcción" >&2
  echo "$OPTARG"
  while [[ $# > 0 ]] ; do
        echo "\$1 = $1"
        shift
done

}


while getopts ":d:c:h" opt; do
  case $opt in
    d)
      echo "Descomprimiendo... $OPTARG" >&2
      ruta="$OPTARG"
      extFinder
      extractor
      ;;
    c)
      echo "Comprimiendo... $OPTARG" >&2
      compresor
      ;;
    h)
      echo "man:" >&2
      usage
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      usage
      ;;
  esac
done
