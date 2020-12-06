# jknobman-mod

This is a collection of patches for JKnobMan.

Given that JKnobMan is distributed as binary-only, as of 1.3.3 at the time of this writing, the source is not available.
Instead of being diff files, the patches are developed with the help of AspectJ.

- `KnobmanXdgConfig.aj`: this modifies the file locations such that the INI file will be relocated in the XDG config directory (`~/.config/JKnobMan/`).
