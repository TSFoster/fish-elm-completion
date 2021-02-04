# Fish completions for Elm 0.19

[Fisher](https://github.com/jorgebucaran/fisher) plugin to add completions for `elm`, including packages.

```
> elm #TAB#
bump  (figure out the next version number based on API changes)  make                 (compile Elm code into JS or HTML)
diff                                       (detect API changes)  publish  (publish your package at package.elm-lang.org)
init                                        (start Elm project)  reactor         (start a local server on your computer)
install              (fetch packages from package.elm-lang.org)  repl       (open up an interactive programming session)


> elm install TSFoster/#TAB#
…ster/elm-bytes-extra  …ster/elm-envfile  …ster/elm-md5   …ster/elm-tuple-extra
…ster/elm-compare      …ster/elm-heap     …ster/elm-sha1  …ster/elm-uuid
```

## Installation

Fisher install instructions can be found on the [Fisher README](https://github.com/jorgebucaran/fisher/blob/main/README.md).

```fish
fisher install TSFoster/fish-elm-completion
```

## Prior art

Elm 0.18 completions were provided by [ohanhi/fish-elm-completions](https://github.com/ohanhi/fish-elm-completions) (and [TSFoster/fish-elm-completions](https://github.com/TSFoster/fish-elm-completions)).
