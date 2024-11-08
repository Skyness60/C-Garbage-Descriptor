# Garbage Descriptor en C

Ce projet implémente un garbage descriptor (GD) en C. Ce garbage descriptor est conçu pour gérer les fds en ajoutant, supprimant et libérant des pointeurs, ce qui aide à prévenir les fds qui sont pas close.

## Fonctionnalités

- **Ajout de fd** : 
  - La fonction `add_fd` permet d'ajouter un fd à la collection. Si le tableau de fd est plein, il est redimensionné automatiquement. Si le tableau de descripteurs de fichiers atteint 1024, il ne sera pas ajouté,
    et il faudra attendre le prochain clear.

- **Libération de Mémoire** : 
  - `clear_fds` close tous les fd actuellement stockés dans le garbage descriptor, réinitialisant ainsi sa capacité et son compte et free ainsi la trash.

- **Initialisation** : 
  - `init_garbage_descriptor` initialise le collecteur avec une capacité initiale.

- **Close fd** : 
  - `close_fd` permet de supprimer un fd spécifique du collecteur. Le FD (descripteur de fichier) est initialisé à -1, ce qui reste présent dans la collection.

- **Debugging** : 
  - `debug_gd` affiche l'état actuel du garbage descriptor, y compris la capacité et le nombre de fd.

## Init Makefile for your project

```M̀akefile
LINKLIBS = -L./garbage_descriptor -lgarbage_descriptor
```
```M̀akefile
$(NAME) : $(OBJ)
	@make -C ./garbage_descriptor --no-print-directory
 ```
```M̀akefile
fclean:	clean
@make fclean -C ./garbage_descriptor --no-print-directory
```
