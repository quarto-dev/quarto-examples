
<div>

See live at
<https://quartopub.com/sites/examples/create-tabsets-panel-from-r-code>

</div>

## About this example

In this example, we are presenting several tables inside a tabset panel.
[Tabset
panels](https://quarto.org/docs/interactive/layout.html#tabset-panel)
are among [built-in component
layout](https://quarto.org/docs/interactive/layout.html) for Quarto.

Each HTML table is made using [**gt**](https://gt.rstudio.com) and shows
a subset of `dplyr::starwars` characters, based on their homeworld, one
per pane. Instead of created each tab one by one, **knitr** child
feature is leveraged to dynamically create content.

Tabset panel should be on the form

```` default
# Tables

::: {.panel-tabset}

## homeworld1 

```{r}
# code with gt table on data filtered on homeworld1
```


## homeworld2

```{r}
# same code for gt table but on data filtered on homeworld2
```


... and so on for all homeworld

:::
````

This can be done using R code directly by having the code for each pane
inside a child document, that will be rendered for each homeworld:

- `index.qmd` is the main document. It contains a chunk that will call
  `knitr::knit_child()` to render from a child document based on
  changing values

- `_child.qmd` is the child document. The `_` prefix indicates it is a
  document not to render on its own (See more [about Render Targets for
  Projecs](https://quarto.org/docs/projects/quarto-projects.html#render-targets)).
  It contains the markdown structure to create each pane:

  ```` markdown
  ## `r hw`


  ```{r}
  #| echo: false
  starwars %>%
    filter(homeworld == hw) %>%
    count(sex) %>%
    head() %>%
    gt()
  ```
  ````

Look at the source of this example for details.
