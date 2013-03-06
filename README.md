# Config

## Vim

### Adding submodules for Pathogen

```
$ git submodule add https://github.com/example/<vim-plugin>.git vim/bundle/<vim-plugin>
$ git add .
$ git commit -m "Add submodule <vim-plugin>"
```

### Cloning & Submodules
Remember to run:

```
$ git submodule update --init
```

after cloning.