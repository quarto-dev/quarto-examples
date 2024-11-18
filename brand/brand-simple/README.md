# brand-simple


<https://examples.quarto.pub/brand-simple/>

This is a simple example of using
[**brand.yml**](https://posit-dev.github.io/brand-yml/) across a range
of Quarto supported formats.

The project is a website with a homepage, `index.qmd`, that is rendered
to multiple formats: `html`, `revealjs`, and `typst`, and a dashboard,
`dashboard.qmd`.

The brand information stored in `_brand.yml` is:

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

To preview locally, run:

``` bash
quarto preview
```
