# ``` chmod ```
## User Categories:

u (user): The file's owner. <br>
g (group): The group associated with the file. <br>
o (others): Everyone else. <br>
a (all): Applies to all (user, group, and others).

## Permission Types:
r (read): Permission to read the file. <br>
w (write): Permission to modify the file. <br>
x (execute): Permission to run the file as a program.

## Numeric Representation:
Permissions can also be represented numerically:

4: Read (r) <br>
2: Write (w) <br>
1: Execute (x)<br> 

Ex. <br>
1. ``` chmod 755 file_name``` Sets read, write, and execute for the user (owner), and read and execute for group and others. <br>
2. ```chmod u+rwx/u=rwx file_name``` grant all permission to owner


