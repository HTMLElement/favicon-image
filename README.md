# favicon-image

Favicon web component that works across devices and resolutions.

## Install

```bash
bower install --save HTMLElement/favicon-image
```

## Usage

```html
<html>
  <head>
    <link rel="import" href="favicon-image.html">
  </head>
  <body>
    <favicon-image path="app/images/favicon/"></favicon-image>
  </body>
</html>
```

## Generate Favicons

When the ImageMagick command `convert` is available on your system, you may use the helper script to batch generate favicons from a larger source file. In your main project folder, you can run for example:

```bash
./bower_components/favicon-image/scripts/generate-favicons.sh /path/to/square-original-file.png app/images/favicons
```

## References

- https://github.com/audreyr/favicon-cheat-sheet

## License

The MIT License

This Element was forked from the [Polymer 0.3 component favicon-image](https://github.com/janantala/favicon-image) created by [Jan Antala](http://www.janantala.com)
