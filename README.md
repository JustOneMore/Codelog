Codelog
=======

(Linux &amp; Bash) Lets you "log" snippets or fragments of text from the shell in a fast way.


What you should know and do?
=====================

1. First of all, enter to the file "codelog.sh".

2. Once then, change the value of the variable "carpeta_general" in order to let it pointing to 
the folder in which you want (and you are allowed by the permissions of the system) the files 
to be saved.

3. The program is called with this syntax:
  a) bash codelog.sh -l: for listing all the folders and files
  b) bash codelog.sh ["folder/folder/folder"] ["file-without-extension"]: for adding a file. 
     Codelog automatically adds ".txt" to the file, so you should not have to worry about it.

4. Put this program in one of the folders that you can use to execute files in one command for
a more comfortable usage ("/usr/bin", for example).

5. You are done! Open a terminal and type the name of the file with which you saved it! It is
cool!
