
See live at <https://examples.quarto.pub/html-math/>

## About this example

In this example, we are presenting how to change the default math method
MathJax 3 to custom Mathjax 2 - which can be useful is support for
newline with `\\` in equation is desired (as this is still [something to
be done in Mathajx 3](https://github.com/mathjax/MathJax/issues/2312))

### How to configure math ?

This can be done through the `html-math-method` in HTML format. Doc is
here:
https://quarto.org/docs/output-formats/html-basics.html#latex-equations

So inserting this YAML will change the default Mathjax library used:

``` yaml
format:
  html:
    html-math-method:
      method: mathjax
      url: "https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.9/latest.js?config=TeX-MML-AM_CHTML"
```
