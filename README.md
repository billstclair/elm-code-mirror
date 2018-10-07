# Code Mirror Custom Element Example

This is a simple demonstration of using [HTML Custom Elements](https://developer.mozilla.org/en-US/docs/Web/Web_Components/Using_custom_elements) in Elm.

Inspired by [Luke Westby](https://github.com/lukewestby)'s [Elm Europe talk](https://youtu.be/tyFe9Pw6TVE). The JavaScript custom element code is almost a verbatim copy.

To run it:

```bash
$ git clone git@github.com:billstclair/elm-code-mirror.git
$ cd elm-code-mirror
$ elm make Main.elm --output site/elm.js
$ elm reactor
```

Then aim your browser at http://localhost:8000/site/index.html

The code is live at [xossbow.com/elm-code-mirror](https://xossbow.com/elm-code-mirror/).

[custom-elements.txt](custom-elements.txt) is my notes while watching the talk.

Bill St. Clair, 7 October 2018
