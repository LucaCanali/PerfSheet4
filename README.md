# PerfSheet4

A tool for DBAs and Oracle performance analysts.It provides a simplified interface to extract and visualize Oracle AWR data using Excel pivot charts.  
Author: Luca.Canali@cern.ch  
Created: March 2013, latest updates June 2016  

Blog entry: http://externaltable.blogspot.ch/2015/02/latest-updates-to-perfsheet4-tool-for.html  
Note: see also PerfSheet.js at https://github.com/LucaCanali/PerfSheet.js

Contents:

| Script name             | Short description
| ----------------------- | ------------------------------------------------------------------------------------------------------------
| [PerfSheet4_v3.7.2](PerfSheet4_v3.7.2.xlsm)| Main version of PerfSheet4. Run with Excel, versions 2010, 2013, 2016. Windows 7/8.1/10.
| [PerfSheet4_v3.7.2_noActivex_Controls](PerfSheet4_v3.7.2_noActivex_Controls.xlsm) | A lightweight version of PerfSheet4 modified by removing Activex Controls. This makes it easier to run on older versions of Excel and/or if there are compatility problems with Excel Activex controls.
| [PerfSheet4_v3.7.2_HPS](PerfSheet4_v3.7.2_HPS.xlsm) | Customized version by Hans-Peter and Mark Sloot. This vesion adds a filter mask to the UI. It also adds three more pre-defined queries, including a query for Statspack.
| [sqlplus_scripts](sqlplus_scripts) | Folder with example SQL scripts to extract data from AWR into csv files.
| [example_data](example_data) | A few example csv files with AWR data.

- **Getting started video: http://youtu.be/sdvx4zB-fvo**

![Example PerfSheet4 interface](http://3.bp.blogspot.com/-Vd5j72FpdIU/VOJWn6i37HI/AAAAAAAAEoM/N8MBLUhnmQI/s1600/blog_PerfSheet4_v37.png)
![Example PerfSheet4 PivotChart](http://3.bp.blogspot.com/-RwUARWt1gNk/VN5osDj-rYI/AAAAAAAAEns/O1l_kbKhEtc/s1600/blog_perfsheet4_v37_graph_IO%2B_annotated.png)


