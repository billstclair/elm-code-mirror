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

# Compatibility

The [Custom Elements Registry](https://developer.mozilla.org/en-US/docs/Web/API/CustomElementRegistry) is still a fairly new part of the web browser DOM. It isn't supported by all browsers, as outlined in the compatibility table on that page.

In particular, Microsoft Internet Explorer and Edge do not support custom elements. There's a polyfill, and I included that in `site/lib/custom-elements.min.js`, but it didn't make the example work in IE on my Windows machine, though it DID make it work in Firefox on my Mac desktop, without setting `dom.webcomponents.customelements.enabled` true in `about:config` (the polyfill isn't necessary, if you do that). I commented out the inclusion of the polyfill in `site/index.html`. Use it if you wish.

Bill St. Clair, 7 October 2018
