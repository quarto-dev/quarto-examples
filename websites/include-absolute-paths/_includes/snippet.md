::: callout

This is a callout in an include block.

<!--
Note that the following sub-include would behave unintuitively 
if it had used a relative path instead of an absolute path.

With a relative path, the path would be resolved relative to
the original .qmd, instead of relative to the path of this file.
Sometimes, the relative include _is_ what you want to do, so that
different directories can have different includes. See the
`include-absolute-paths` example.
 -->

{{< include /_includes/sub-include.md >}}

:::