function Callout(el)
  if quarto.doc.isFormat("html") then
    -- Set default collapse to true if unset
    if not el.collapse then
      el.collapse = true
    end
    return el
  end
end