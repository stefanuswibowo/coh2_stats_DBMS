# Not all data are created equal: Challenges of importing CSV file to MySQL Workbench

Despite it may seems simple, importing CSV file into MySQL could be difficult sometimes. Especially when the data imported contain several unique traits.

Here, the data from [**Coh2Stats**](http://www.coh2-stats.com/) is **mined into CSV file using Excel and imported into MySQL workbench**. [**Coh2Stats**](http://www.coh2-stats.com/) is a database of Company of Heroes 2 Game. The game itself was build based on world war 2 event and the database comprise of value of weapons, unit, etc. on their attack points, range, etc. *Fig.1*


**The challenges that was faced during the process was:**
- Keep foreign key within the data-set during data import process *Fig.2*
- Adhere -secure-priv-file default function which limited access to data import *Fig.3*
- Manage unique character within the data-set (here: utf8mb4 character set) *Fig.4*

**Goal of the demonstrated experiment:**
- User recognize the basic problem of using CSV dataset
- User able to transport data from a web into MySQL

**Fig.1**
![Screen1](https://i.imgur.com/mYTUzCV.jpg)

**Fig.2**
![Screen2](https://i.imgur.com/YYngVJq.jpg)

**Fig.3**
![Screen3](https://i.imgur.com/tZJtEO0.jpg)

**Fig.4**
![Screen4](https://i.imgur.com/VqHVxn7.jpg)

# Index

- [Data Treatment](https://github.com/stefanuswibowo/coh2_stats_DBMS#Data_Treatment)
- [Making Database & Tabel](https://github.com/stefanuswibowo/coh2_stats_DBMS#Making_Database_&_Tabel)
- [Keeping The Foreign Key](https://github.com/stefanuswibowo/coh2_stats_DBMS#Keeping_The_Foreign_Key)
- [Adhere -secure-priv-file](https://github.com/stefanuswibowo/coh2_stats_DBMS#Adhere_-secure-priv-file)
- [Manage Unique Character](https://github.com/stefanuswibowo/coh2_stats_DBMS#Manage_Unique_Character)

**Tools & Databases used in this experiment demonstration:**
- [Coh2Stats](http://www.coh2-stats.com/small_arms) *Database*
- [Microsoft Excel 2016](https://products.office.com/en/excel) *Tools*
- [MySQL 8.0](https://dev.mysql.com/downloads/workbench/) *Tools*

**Compatibility**

The method is compatible for any OS as long the tools and database mentioned above can be accessed. However, the tutorial here was shown based on Windows 10 OS

# Data_Treatment

[[Back to top]](https://github.com/stefanuswibowo/coh2_stats_DBMS#index)

The input for this project was limited to only weapons data, which means that there are four datasets that being imported:
- small arms
- ballistic weapons
- explosive weapons
- flame throwers

During the process, the data from web was being copied into excel and then being saved as CSV. The addition within excel is as below:
- The data of side was abbreviated in order to put the database in third normalization form, ex: (Oberkommando as OB)
- The type of weapon was included as an abbreviation, ex: (SM_AR for Small Arms)

The final result of CSV can be accessed on folder data above.


# Making_Database_&_Tables

[[Back to top]](https://github.com/stefanuswibowo/coh2_stats_DBMS#index)

The coding of databases and tables was provided in COH_2_DATABASE, user need to execute the code one by one. (*Fig.5*) The diagram of connection of each table was provided in *Fig.6*.

**Fig.5**
![Screen5](https://i.imgur.com/toN8xPd.jpg)

**Fig.6**
![Screen6](https://i.imgur.com/qGbXMV8.jpg)


# Keeping_The_Foreign_Key

[[Back to top]](https://github.com/stefanuswibowo/coh2_stats_DBMS#index)

During data import, if we set a colums as foreign key, the dataset can't be downloaded as seen in *Fig.2*. To solve the problem, user can use several coding algorithm, the simplest is by setting the checking algorithm into 0(zero) before start importing the CSV file. (Red mark in *Fig.7*)

**Fig.7**
![Screen7](https://i.imgur.com/ZAZWuOM.jpg)


# Adhere_-secure-priv-file

[[Back to top]](https://github.com/stefanuswibowo/coh2_stats_DBMS#index)

-secure-priv-file is a built-in function within MySQL Workbench environmemt, the purpose of this function is to increase the privacy of database that we used. To address the issue, there are commonly 2 approaches:
- by moving the file to priv-directory
- by disabling the function itself through startup
The author choose the first approach since it is way more simpler. To find the directory, user need to input code in *Fig.8*.

**Fig.8**
![Screen8](https://i.imgur.com/RHIdxTk.jpg)

The *C:/ProgramData/MySQL/MySQL Server 8.0/Uploads* has been recognized as a common directory to save the file. If user are confused with how to do the execution, please follow this link:
:video_camera: [Directory_Finder_Code](https://www.youtube.com/watch?v=w8cAuN3G4H0&t=86s)


# Manage_Unique_Character

[[Back to top]](https://github.com/stefanuswibowo/coh2_stats_DBMS#index)

Within the database, some unique character might existed, this character are commonly not recognized to the ASCII system, such as umlaut (vowel sound). To adhere these, user need to entry a character set within the extraction progress (*Fig.9*). 

**Fig.9**
![Screen9](https://i.imgur.com/8ZngVcW.jpg)

# Result of the Progress
One of the result of the progress can be seen in *Fig.10*.

**Fig.10**
![Screen10](https://i.imgur.com/YHMS2b2.jpg)
  
 ## Module/Protocol Developer Contacts
 - Stefanus Satrio Hadi Wibowo (stefanus.satrio@student.i3l.ac.id)

