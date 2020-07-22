# Strikethrough for SILE

A simple package which adds a strikethrough command, `\strike`.

![](https://raw.githubusercontent.com/ctrlcctrlv/sile-strike/master/examples/strike.png)

```tex
\begin[papersize=50mm x 30mm]{document}
\script[src=packages/strike]
\noindent \strike{I am the}\strike[height=0.5zw]{ Eggman}

\noindent \strike[n=double]{They are the Eggmen}

\noindent \strike[n=triple]{I am the walrus}

\noindent Goo goo g'joob
\end{document}
```
