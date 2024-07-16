
# About these examples

This folder contains examples about producing HTML and PDF document from same .qmd source. 

- **How to use plotly in Python when outputing to HTML and PDF**: [live example](https://examples.quarto.pub/py-plotly-in-pdf/) - [source](py-plotly-in-pdf.qmd)


## Requirements

This examples requirement Python. You can install the required packages by running:

```bash
python -m venv venv
source venv/bin/activate # or venv\Scripts\activate on Windows
python -m pip install -r requirements.txt
```

Then run Quarto

```bash
quarto render .\py-plotly-in-pdf.qmd
```
