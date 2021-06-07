# devenv

just some easy-to-access files to set up my environment from anywhere.

## vimrc  

add the .vimrc file in any custom directory with vim plug in the same directory under autoload.

``` 
~ 
│ 
└───.customdir 
    │   .vimrc  
    │   .bashrc   
    │   
    └───autoload     
        │   plug.vim 
``` 

then add an alias with `vim -Nu ~/.customdir/.vimrc`, run `:PlugInstall` in the first use.
The whole directory is portable once plugins are installed.
