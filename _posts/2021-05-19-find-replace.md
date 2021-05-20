---
layout: single
classes: wide
lang: en
categories: [linux]
tags: [cli]
title: "Find-replace in multiple files recursively from Linux command line"
---

It is a 2-steps process issued in one command from a terminal. (1) Use `grep` to find occurrences of the search-term, then (2) `sed` to replace with a new word. (`xargs` pipes the output of `grep` to `sed`.)

```sh
grep -rli 'old-word' * | xargs -i@ sed -i 's/old-word/new-word/g' @
```

An example: when you move your personal github.io page to a project page, then {% raw %}`{{ site.baseurl }}`{% endraw %} should be specified at your Jekyll's `_config.yml`. Otherwise links will not work. So you can use the following command from your project folder to keep your links alive:

![snippet]({{ site.baseurl }}/assets/img/21-05-19-find-replace/find-replace.svg)

## Notes

- Thanks for the tip to [this thread](https://stackoverflow.com/a/20721292) on SO.
