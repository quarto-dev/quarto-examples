

See live at <https://examples.quarto.pub/collapse-callout/>

## About this example

This document shows how to make callouts collapsible by default using a Lua filters since 1.3 has introduced new [Custom AST nodes](https://quarto.org/docs/prerelease/1.3/ast.html#example-callouts).

``` lua
function Callout(el)
  if quarto.doc.isFormat("html") then
    -- Set default collapse to true if unset
    if not el.collapse then
      el.collapse = true
    end
    return el
  end
end
```
