# Line Breaks

> ### All Rendered Output will display below Markdown and HTML

To create a line break or new line (\<br>), end a line with two or more spaces, and then type return.

| Markdown | HTML | 
| --- | --- |
| This is the first line.<br>And this is the second line. | \<p>This is the first line.\<br><br>And this is the second line.\</p> |

This is the first line.<br>And this is the second line.

## Line Break Best Practices

You can use two or more spaces (commonly referred to as “trailing whitespace”) for line breaks in nearly every Markdown application, but it’s controversial. It’s hard to see trailing whitespace in an editor, and many people accidentally or intentionally put two spaces after every sentence. For this reason, you may want to use something other than trailing whitespace for line breaks. If your Markdown application [supports HTML](https://www.markdownguide.org/basic-syntax/#html), you can use the \<br> HTML tag.

For compatibility, use trailing white space or the \<br> HTML tag at the end of the line.

There are two other options I don’t recommend using. CommonMark and a few other lightweight markup languages let you type a backslash (\\) at the end of the line, but not all Markdown applications support this, so it isn’t a great option from a compatibility perspective. And at least a couple lightweight markup languages don’t require anything at the end of the line — just type return and they’ll create a line break.

| ✅  Do this | ❌  Don't do this |
| --- | --- |
| First line with two spaces after.  <br>And the next line.<br><br>First line with the HTML tag after.\<br><br>And the next line. | First line with a backslash after.\\<br>And the next line.<br><br>First line with nothing after.<br>And the next line. |

