# Headings

> ### All Rendered Output will display below Markdown and HTML

To create a heading, add number signs (#) in front of a word or phrase. The number of number signs you use should correspond to the heading level. For example, to create a heading level three (<h3>), use three number signs (e.g., ### My Header).

| Markdown | HTML | 
| --- | --- |
| # Heading level 1 | <h1>Heading level 1</h1> | 
# Heading level 1
| Markdown | HTML | 
| --- | --- |
| ## Heading level 2 | <h2>Heading level 2</h2> |
## Heading level 2
| Markdown | HTML | 
| --- | --- |
| ### Heading level 3 | <h3>Heading level 3</h3> |
### Heading level 3


---

## Alternate Syntax

Alternatively, on the line below the text, add any number of == characters for heading level 1 or -- characters for heading level 2.

| Markdown | HTML | 
| --- | --- |
| Heading level 1<br>=============== | <h1>Heading level 1</h1> | 

Heading level 1
===============

| Markdown | HTML | 
| --- | --- |
| Heading level 2<br>--------------- | <h2>Heading level 2</h2> |

Heading level 2
---------------

---

## Heading Best Practices

Markdown applications don’t agree on how to handle a missing space between the number signs (#) and the heading name. For compatibility, always put a space between the number signs and the heading name.

| ✅  Do this | ❌  Don't do this |
| --- | --- |
| # Here's a Heading | #Here's a Heading |

You should also put blank lines before and after a heading for compatibility.

| ✅  Do this | ❌  Don't do this |
| --- | --- |
| Try to put a blank line before...<br><br># Heading<br><br>...and after a heading. | Without blank lines, this might not look right.<br># Heading<br>Don't do this! |
