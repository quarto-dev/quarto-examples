# Using parameters in a template partial

## TL;DR

If you are have a parameterized report the parameter values you set via `quarto::quarto_render()` or the `-P` command flag don't reach the template partial.
The solution is to add this code block:

````
```
```{r}
#| echo: false
#| output: asis
quarto::write_yaml_metadata_block(params = params)
```
```
````

## An example

A parameterized report might set `region` under the `params` metadata key:

```{.yaml filename="report.qmd"}
---
params: 
  region: Oregon
---
```

R code cells can then access `region` via `params$region`:

````
```{r}
params$region
```
````

To run the report for other regions you can either call `quarto::quarto_render()` from the R console:

```{.r filename="Terminal"}
quarto::quarto_render(
  "report.qmd", 
  execute_params = list(region="California")
)
```

Or from the command line:

```{.bash filename="Terminal}
quarto render report.qmd -P region:"California"
```

Unfortunately, the overridden values aren't automatically available to the template partial.
The solution is to add an additional code cell that outputs a metadata block which sets `params` to the values the R code cells see:

````
```{r}
#| echo: false
#| output: asis
quarto::write_yaml_metadata_block(params = params)
```
````

## Files

- `report.qmd` — front matter with `params`, plus the chunk above
- `title-block.html` — the partial, which reads `$params.region$`

## Try it

1. Render the report with the defaults:

   ```bash
   quarto render report.qmd
   ```

   The title block shows "Oregon".

2. Render the report with a new parameter value:

   ```bash
   quarto render report.qmd -P region:"California"
   ```

   The title block shows "California".

3. Remove the chunk, then do step 2 again. The title block shows the default
   value, but the body text shows the new value.

## Notes

`write_yaml_metadata_block()` is an R function, and works with the knitr
engine. For the Jupyter engine, print the same YAML block with
`display(Markdown(...))`.

Two more flags set metadata from outside the document. Neither one solves
the problem in this example. They change what the partial shows, but the R
code still reads the default from `params`. Then the title block and the body
text disagree:

- `quarto render report.qmd --metadata region:"Texas"` — the flag sets a
  top-level key. The partial reads it as `$region$`, not `$params.region$`.
- `quarto::quarto_render("report.qmd", metadata = list(region = "Texas"))` —
  the R package writes the list to a temporary file for the `--metadata-file`
  flag.

Only use these two approaches for a value that no R code reads.

[pkg]: https://quarto-dev.github.io/quarto-r/articles/dynamic-metadata.html
