# thorn

A CommonDoc extension for entering special characters.

# Overview

Most input methods allow the user to insert characters in different alphabets
and accented or modified versions of the same, but these are different for
everyone and often the user will end up looking up a character by name.

Thorn is a tool for inserting Unicode characters by an ASCII name, the way TeX
allows users to insert the letters α and þ with the commands `\alpha` and `\th`,
respectively.

Simply put, it defines a macro that maps a string to a Unicode character.

# Usage

To insert a character by name, use the `l` macro (For 'letter'). The content of
that macro should be a single text node.

For example, in VerTeX:

```tex
\l{alpha} => α
```

# List of Characters

# Sources

The following were consulted in the elaboration of this list:

* [Special Characters][latex-special] chapter in the LaTeX wikibook.
* The [list of XML/HTML entities][entities].
* The [Comprehensive LaTeX Symbol List][symbols].

[latex-special]: https://en.wikibooks.org/wiki/LaTeX/Special_Characters
[entities]: https://en.wikipedia.org/wiki/List_of_XML_and_HTML_character_entity_references
[symbols]: http://ctan.mirror.rafal.ca/info/symbols/comprehensive/symbols-a4.pdf

# License

Copyright (c) 2015 Fernando Borretti

Licensed under the MIT License.
