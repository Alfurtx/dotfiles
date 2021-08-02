## DOTFILES

#### IMPORTANTE
como la idea principal de este proyecto es dejarlo todo en el dotfiles y hacer todo lonks desde .config hasta este directorio, es muy importante no borrar este directorio, el cual seguramente se guarde en $HOME/proyectos/dotfiles

**TODO**
- [ ] utilizar un "version de control" para saber que paquetes hay instalados (ej. pacmanity)
- [ ] configurar todo el .zshrc para que todos los archivos de configuracion se guarden en .config
- [ ] configurar el .config para que todos los archivos/directorios que haya en un .config sean links a los archivos en el dotfiles
- [ ] cambiar install script para poder instalar todo mejor
- [ ] añadir script para crear links y archivos de configuracion facilmente si deseo cambiar, borrar o añadir algun programa que lo requiera
- [ ] añadir 'export ZDOTDIR=~/.config/zsh' a /etc/zsh/zshenv (si este archivo no exite, crealo y pon eso)
