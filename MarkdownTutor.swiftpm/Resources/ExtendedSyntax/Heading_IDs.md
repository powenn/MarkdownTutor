# Heading IDs

> ### All Rendered Output will display below Markdown and HTML

Many Markdown processors support custom IDs for **headings** — some Markdown processors automatically add them. Adding custom IDs allows you to link directly to headings and modify them with CSS. To add a custom heading ID, enclose the custom ID in curly braces on the same line as the heading.

`### My Great Heading {#custom-id}`

The HTML looks like this:

`<h3 id="custom-id">My Great Heading</h3>`

## Linking to Heading IDs

You can link to headings with custom IDs in the file by creating a **standard link** with a number sign (#) followed by the custom heading ID. These are commonly referred to as anchor links.

| Markdown | HTML | 
| --- | --- |
| \[Heading IDs\](\#heading-ids) | <a href="#heading-ids">Heading IDs</a> |

[Heading IDs](#heading-ids)

Other websites can link to the heading by adding the custom heading ID to the full URL of the webpage (e.g, \[Heading IDs\](https://www.markdownguide.org/extended-syntax#heading-ids)).
