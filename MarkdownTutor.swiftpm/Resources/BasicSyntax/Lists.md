# Lists

> ### All Rendered Output will display below Markdown and HTML

You can organize items into ordered and unordered lists.

## Ordered Lists

To create an ordered list, add line items with numbers followed by periods. The numbers don’t have to be in numerical order, but the list should start with the number one.

| Markdown | HTML | 
| --- | --- |
| 1. First item<br>2. Second item<br>3. Third item<br>4. Fourth item | <ol><br><li>First item</li><br><li>Second item</li><br><li>Third item</li><br><li>Fourth item</li><br></ol> |

1. First item
2. Second item
3. Third item
4. Fourth item

| Markdown | HTML | 
| --- | --- |
| 1. First item<br>1. Second item<br>1. Third item<br>1. Fourth item | <ol><br><li>First item</li><br><li>Second item</li><br><li>Third item</li><br><li>Fourth item</li><br></ol> |

1. First item
1. Second item
1. Third item
1. Fourth item

| Markdown | HTML | 
| --- | --- |
| 1. First item<br>8. Second item<br>3. Third item<br>5. Fourth item | <ol><br><li>First item</li><br><li>Second item</li><br><li>Third item</li><br><li>Fourth item</li><br></ol> |

1. First item
8. Second item
3. Third item
5. Fourth item

### Ordered List Best Practices

CommonMark and a few other lightweight markup languages let you use a parenthesis ()) as a delimiter (e.g., 1) First item), but not all Markdown applications support this, so it isn’t a great option from a compatibility perspective. For compatibility, use periods only.

| ✅  Do this | ❌  Don't do this |
| --- | --- |
| 1. First item<br>2. Second item | 1) First item<br>2) Second item |


## Unordered Lists

To create an unordered list, add dashes (-), asterisks (*), or plus signs (+) in front of line items. Indent one or more items to create a nested list.

| Markdown | HTML | 
| --- | --- |
| \- First item<br>\- Second item<br>\- Third item<br>\- Fourth item | <ol><br><li>First item</li><br><li>Second item</li><br><li>Third item</li><br><li>Fourth item</li><br></ol> |

- First item
- Second item
- Third item
- Fourth item

| Markdown | HTML | 
| --- | --- |
| \* First item<br>\* Second item<br>\* Third item<br>\* Fourth item | <ol><br><li>First item</li><br><li>Second item</li><br><li>Third item</li><br><li>Fourth item</li><br></ol> |

* First item
* Second item
* Third item
* Fourth item

| Markdown | HTML | 
| --- | --- |
| \+ First item<br>\+ Second item<br>\+ Third item<br>\+ Fourth item | <ol><br><li>First item</li><br><li>Second item</li><br><li>Third item</li><br><li>Fourth item</li><br></ol> |

+ First item
+ Second item
+ Third item
+ Fourth item

### Starting Unordered List Items With Numbers

If you need to start an unordered list item with a number followed by a period, you can use a backslash (\) to escape the period.

| Markdown | HTML | 
| --- | --- |
| \- 1968\\. A great year!<br>- I think 1969 was second best. | <ul><br>  <li>1968. A great year!</li><br>  <li>I think 1969 was second best.</li><br></ul> |

- 1968\. A great year!
- I think 1969 was second best.

### Unordered List Best Practices

Markdown applications don’t agree on how to handle different delimiters in the same list. For compatibility, don’t mix and match delimiters in the same list — pick one and stick with it.

| ✅  Do this | ❌  Don't do this |
| --- | --- |
| \- First item<br>\- Second item<br>\- Third item<br>- Fourth item | \+ First item<br>\* Second item<br>\- Third item<br>\+ Fourth item |

## Adding Elements in Lists

To add another element in a list while preserving the continuity of the list, indent the element four spaces or one tab, as shown in the following examples.

### Paragraphs

```
* This is the first list item.
* Here's the second list item.

    I need to add another paragraph below the second list item.

* And here's the third list item.
```

The rendered output looks like this:

* This is the first list item.
* Here's the second list item.

    I need to add another paragraph below the second list item.

* And here's the third list item.

### Blockquotes

```
* This is the first list item.
* Here's the second list item.

    > A blockquote would look great below the second list item.

* And here's the third list item.
```

The rendered output looks like this:

* This is the first list item.
* Here's the second list item.

    > A blockquote would look great below the second list item.

* And here's the third list item.


### Code Blocks

**Code blocks** are normally indented four spaces or one tab. When they’re in a list, indent them eight spaces or two tabs.

```
1. Open the file.
2. Find the following code block on line 21:

        <html>
          <head>
            <title>Test</title>
          </head>

3. Update the title to match the name of your website.
```

The rendered output looks like this:

1. Open the file.
2. Find the following code block on line 21:

        <html>
          <head>
            <title>Test</title>
          </head>

3. Update the title to match the name of your website.


### Images

```
1. Open the file containing the Linux mascot.
2. Marvel at its beauty.

    ![Tux, the Linux mascot](/assets/images/tux.png)

3. Close the file.
```

The rendered output looks like this:
1. Open the file containing the Linux mascot.
2. Marvel at its beauty.

    ![Tux, the Linux mascot](tux)

3. Close the file.

### Lists

You can nest an unordered list in an ordered list, or vice versa.

```
1. First item
2. Second item
3. Third item
    - Indented item
    - Indented item
4. Fourth item
```

The rendered output looks like this:

1. First item
2. Second item
3. Third item
    - Indented item
    - Indented item
4. Fourth item
