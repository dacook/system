# Sublime installation (ST4)

I Thought it was clever to link my User dir here. But had problems. So re-installed with out it, in case it helps.


## Package control
https://github.com/wbond/package_control
Essential, yet oddly unsupported. Do this to install it:

```python
from urllib.request import urlretrieve;urlretrieve(url="https://github.com/wbond/package_control/releases/latest/download/Package.Control.sublime-package", filename=sublime.installed_packages_path() + '/Package Control.sublime-package')
```

## Colour Theme
I use Tomorrow-Night. I may have customised it (is that what the chback file is for?), but I'm not sure, so am now just using the official one.

## Help > Search menu
Still doesn't work, try  not to use it.
https://forum.sublimetext.com/t/menus-broken-on-macos-after-using-help-search/75396

## Keymaps
See [Sublime Text - how to figure out internal command name for key binding?](https://stackoverflow.com/questions/18881872/sublime-text-how-to-figure-out-internal-command-name-for-key-binding)

# Sublime Packages
## Markdown
[MarkdownEditing](https://packagecontrol.io/packages/MarkdownEditing) is the one you want, because it's actively supported. Install with package control

## Better ruby and other plugins
I used to have some of these.
https://sublime.fnando.com/

I think I want some more.
But first, do some coding.