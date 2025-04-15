# brand-simple-dark-mode


<https://examples.quarto.pub/brand-simple-dark-mode/>

This is a simple example of using
[**brand.yml**](https://posit-dev.github.io/brand-yml/) across a range
of Quarto supported formats with both a `light` and `dark` brand.

The project is a website with a homepage, `index.qmd`, that is rendered
to multiple formats: `html`, `revealjs`, and `typst`, and a dashboard,
`dashboard.qmd`.

Light and dark brand files are specified in `_quarto.yml`:

``` yaml
brand:
  light: _brand.yml
  dark: _brand-dark.yml
```

Where the `light` brand information is stored in `_brand.yml`:

``` yaml
color:
  palette:
    dark-grey: "#222222"
    blue: "#ddeaf1"
  background: blue
  foreground: dark-grey
  primary: black

logo: 
  medium: logo.png

typography:
  fonts:
    - family: Jura
      source: google
  base: Jura
  headings: Jura
```

And the `dark` brand information is stored in `_brand-dark.yml`:

``` yaml
color:
  palette:
    dark-grey: "#222222"
    blue: "#ddeaf1"
  background: dark-grey
  foreground: blue
  primary: white

logo: 
  medium: logo.png

typography:
  fonts:
    - family: Jura
      source: google
  base: Jura
  headings: Jura
```

To preview locally, run:

``` bash
quarto preview
```
