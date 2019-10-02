# PerfSheet4

A tool for Oracle performance analysts.  
It provides a simplified interface to extract and visualize Oracle AWR data using Excel pivot charts.  
Author: Luca.Canali@cern.ch 
Created: March 2013, updated June 2016, latest minor updates October 2019  

Get started:

- download the repo and open PerfSheet4_v3.7.3 in Excel
- play with the provided examples:
  - use "Load" to import csv files from the example_data folder
  - use "Plot" to display data and experiment with the pre-defined graphs 
- gather AWR data from your DBs for visualization:
  - option 1: run the queries from Excel, you will need Oracle instant client and ODBC driver installed
  - option 2: extract AWR data for visualization from your DBs using isqlplus and the scripts provided in sqlplus_scripts folder
- **Getting started video: http://youtu.be/sdvx4zB-fvo**

Blog entry: https://db-blog.web.cern.ch/blog/luca-canali/2015-02-latest-updates-perfsheet4-tool-oracle-awr-data-mining-and-visualization  
Note: a version of this tool that runs in the browser (no need for Exvel) is PerfSheet.js at https://github.com/LucaCanali/PerfSheet.js  

Contents:  

| Script name             | Short description
| ----------------------- | ------------------------------------------------------------------------------------------------------------
| [PerfSheet4_v3.7.3](PerfSheet4_v3.7.3.xlsm)| Main version of PerfSheet4. Tested with Excel 2016 on Windows 10.
| [PerfSheet4_v3.7.3_noActivex_Controls](PerfSheet4_v3.7.3_noActivex_Controls.xlsm) | A lightweight version of PerfSheet4 modified by removing Activex Controls. This makes it easier to run on older versions of Excel and/or if there are compatility problems with Excel Activex controls.
| [PerfSheet4_v3.7.2_HPS](PerfSheet4_v3.7.2_HPS.xlsm) | Customized version by Hans-Peter and Mark Sloot. This version adds a filter mask to the UI. It also adds three more pre-defined queries, including a query for Statspack.
| [sqlplus_scripts](sqlplus_scripts) | Folder with example SQL scripts to extract data from AWR into csv files.
| [example_data](example_data) | A few example csv files with AWR data.


Screen shots:

![Example PerfSheet4 interface](http://3.bp.blogspot.com/-Vd5j72FpdIU/VOJWn6i37HI/AAAAAAAAEoM/N8MBLUhnmQI/s1600/blog_PerfSheet4_v37.png)  

![Example PerfSheet4 PivotChart](http://3.bp.blogspot.com/-RwUARWt1gNk/VN5osDj-rYI/AAAAAAAAEns/O1l_kbKhEtc/s1600/blog_perfsheet4_v37_graph_IO%2B_annotated.png)  


