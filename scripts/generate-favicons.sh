#!/bin/bash

# create a set of images in common resolutions for favicon and app icon images

INPUT_FILE="$1"
if [[ ! -f "$INPUT_FILE" ]]; then
  echo "The file '$INPUT_FILE' does not exist"
  exit 1
fi

if [[ "$2" == "" ]]; then

  OUT_DIR="$(pwd)/favicon"
  echo "Using default output directory: $OUT_DIR"

else
  
  if [[ ! -d "$(dirname $2)" ]]; then
    echo "The parent directory of $2 does not exist."
    exit 1;
  fi
  OUT_DIR="$2"
  echo "Using custom output directory: $OUT_DIR"

fi

if [[ ! -d "$OUT_DIR" ]]; then
  mkdir -p $OUT_DIR
fi

SIZES="16 24 32 57 70 80 144 150 152 167 180 228 310"

function createFaviconIco {

  convert "$INPUT_FILE" -bordercolor white -border 0 \
      \( -clone 0 -resize 16x16 \) \
      \( -clone 0 -resize 32x32 \) \
      \( -clone 0 -resize 48x48 \) \
      \( -clone 0 -resize 64x64 \) \
      -delete 0 -alpha off -colors 256 "$OUT_DIR/favicon.ico"

}

function createFavicon {
  
  SIZE="$1"
  
  if [[ $var =~ ^-?[0-9]+$ ]]; then
    echo "The size parameter is expected to be an integer"
  fi

  convert -resize "$SIZE"x"$SIZE" "$INPUT_FILE" -background transparent "$OUT_DIR"/favicon-"$SIZE"x"$SIZE".png

}

createFaviconIco
for SIZE in $SIZES; do
  createFavicon $SIZE
done
