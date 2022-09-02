options dlcreatedir; 
libname repodata "/home/&sysuserid/devops/Data-Management/data"; 
libname DM_SRC "/workshop/datamanagement/data"; 

 
  /* Set MSGLEVEL to I to write messages from FCOPY to the log. */
options msglevel=i;

filename src "/home/&sysuserid/devops/Data-Management/data/catcode.csv";
filename dest "/workshop/datamanagement/data/catcode.csv";



   /* Copy the records of SRC to DEST. */
data _null_;
   length msg $ 384;
   rc=fcopy('src', 'dest');
   if rc=0 then
      put 'Copied SRC to DEST.';
   else do;
      msg=sysmsg();
      put rc= msg=;
   end;
run;