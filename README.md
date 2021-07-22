# PerfSheet4 - A tool for Oracle RDBMS performance analysis

PerfSheet4 provides a graphical interface to extract and visualize Oracle workload and performance metrics using MS Excel as a front end.
Oracle metrics are extracted from AWR repository (note this requires the dyagnostic pack licensing).
Metrics are visualized using Excel pivot charts.
  
Author: Luca.Canali@cern.ch  
Created: March 2013, updated June 2016. Latest minor updates: October 2019  
Tested: tested using Excel 365 and Excel 2016 on Windows 10  
Note: an alternative version of this tool, that runs in the browser (so does not require Excel) is [PerfSheet.js](https://github.com/LucaCanali/PerfSheet.js)

Get started:

- download the repo and open PerfSheet4_v3.7.3 in Excel
- get started with the provided examples:
  - use "Load" to import csv files from the example_data folder
  - use "Plot" to display data and experiment with the pre-defined graphs 
- run it on you Oracle DBs: gather AWR data and generate the plots:
  - option 1: run the AWR data extraction queries from Excel.  
    For this you will need the Oracle instant client and ODBC driver installed on the machine running PerfSheet4
     - to install the ODBC driver, download from [Oracle instant client downloads](https://www.oracle.com/database/technologies/instant-client/downloads.html)
     - run `odbc_install.exe` (note you will need a 64 bit odbc if you use Excel 64 bit).
     - configure "ODBC name" in the PerfSheet4 interface (check the name using the ODBC Data Source Administrator in Windows)
  - option 2: extract AWR data from your DBs into csv files using the sqlplus scripts provided
     - browser the sqlplus_scripts directory and run the script/scripts of interest
     - from the PerfSheet4 interface, use "Load" button to load the csv file for visualization with PerfSheet4. 
- **Getting started video: http://youtu.be/sdvx4zB-fvo**

Blog entry: https://db-blog.web.cern.ch/blog/luca-canali/2015-02-latest-updates-perfsheet4-tool-oracle-awr-data-mining-and-visualization  

Contents:  

| Script name             | Short description
| ----------------------- | ------------------------------------------------------------------------------------------------------------
| **[PerfSheet4_v3.7.3](PerfSheet4_v3.7.3.xlsm)**| **Main version of PerfSheet4. Tested with Excel 365 and 2016 on Windows 10.**
| [PerfSheet4_v3.7.3_noActivex_Controls](PerfSheet4_v3.7.3_noActivex_Controls.xlsm) | A lightweight version of PerfSheet4 modified by removing Activex Controls. This makes it easier to run on older versions of Excel and/or if there are compatility problems with Excel Activex controls.
| [PerfSheet4_v3.7.2_HPS](PerfSheet4_v3.7.2_HPS.xlsm) | Customized version by Hans-Peter and Mark Sloot. This version adds a filter mask to the UI. It also adds three more pre-defined queries, including a query for Statspack.
| [sqlplus_scripts](sqlplus_scripts) | Folder with example SQL scripts to extract data from AWR into csv files.
| [example_data](example_data) | A few example csv files with AWR data.


Screen shots:

![Example PerfSheet4 interface](http://3.bp.blogspot.com/-Vd5j72FpdIU/VOJWn6i37HI/AAAAAAAAEoM/N8MBLUhnmQI/s1600/blog_PerfSheet4_v37.png)  

![Example PerfSheet4 PivotChart](http://3.bp.blogspot.com/-RwUARWt1gNk/VN5osDj-rYI/AAAAAAAAEns/O1l_kbKhEtc/s1600/blog_perfsheet4_v37_graph_IO%2B_annotated.png)  


