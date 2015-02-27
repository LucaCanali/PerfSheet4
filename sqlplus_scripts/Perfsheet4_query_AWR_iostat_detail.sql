--
-- Perfsheet4_query_AWR_iostat_detail.sql -> Extracts data from dba_hist_iostat_detail. This provides details on the I/O operations performed by Oracle, 
-- computes delta values and rates (delta value over delta time) aggregating over function and filetype.
-- output is in csv format
--
-- Usage:
--   Run the script from sql*plus connected as a priviledged user (need to be able to read AWR tables)
--   Can run it over sql*net from client machine or locally on db server
--   Customize the file perfsheet4_definitions.sql before running this, in particular define there the interval of analysis

@@Perfsheet4_definitions.sql

set termout on
prompt 
prompt Dumping AWR data to file Perfsheet4_AWR_iostat_detail_&myfilesuffix..csv, please wait
prompt 
set termout off

spool Perfsheet4_AWR_iostat_detail_&myfilesuffix..csv


select cast(min(sn.begin_interval_time) over (partition by sn.dbid,sn.snap_id) as date) snap_time,  --workaround to uniform snap_time over all instances in RAC
	--ss.dbid,  --uncomment if you have multiple dbid in your AWR
	sn.instance_number,
	io.function_name,
	io.filetype_name,
    round((io.small_read_reqs - lag(io.small_read_reqs) over (partition by io.dbid,io.instance_number,io.function_name,io.filetype_name order by sn.snap_id nulls first)) /
              (extract(hour from END_INTERVAL_TIME-begin_interval_time)*3600
              -extract(hour from sn.snap_timezone - lag(sn.snap_timezone) over (partition by io.dbid,io.instance_number,io.function_name,io.filetype_name order by sn.snap_id nulls first) )*3600 
              --deals with daylight savings time change
              + extract(minute from END_INTERVAL_TIME-begin_interval_time)* 60
              + extract(second from END_INTERVAL_TIME-begin_interval_time)),2 ) Rate_small_read_reqs,
    round((io.large_read_megabytes - lag(io.large_read_megabytes) over (partition by io.dbid,io.instance_number,io.function_name,io.filetype_name order by sn.snap_id nulls first)) /
              (extract(hour from END_INTERVAL_TIME-begin_interval_time)*3600
              -extract(hour from sn.snap_timezone - lag(sn.snap_timezone) over (partition by io.dbid,io.instance_number,io.function_name,io.filetype_name order by sn.snap_id nulls first) )*3600 
              --deals with daylight savings time change
              + extract(minute from END_INTERVAL_TIME-begin_interval_time)* 60
              + extract(second from END_INTERVAL_TIME-begin_interval_time)),2 ) Rate_large_read_megabytes,
    round((io.small_write_reqs - lag(io.small_write_reqs) over (partition by io.dbid,io.instance_number,io.function_name,io.filetype_name order by sn.snap_id nulls first)) /
              (extract(hour from END_INTERVAL_TIME-begin_interval_time)*3600
              -extract(hour from sn.snap_timezone - lag(sn.snap_timezone) over (partition by io.dbid,io.instance_number,io.function_name,io.filetype_name order by sn.snap_id nulls first) )*3600 
              --deals with daylight savings time change
              + extract(minute from END_INTERVAL_TIME-begin_interval_time)* 60
              + extract(second from END_INTERVAL_TIME-begin_interval_time)),2 ) Rate_small_write_reqs,
    round((io.large_write_megabytes - lag(io.large_write_megabytes) over (partition by io.dbid,io.instance_number,io.function_name,io.filetype_name order by sn.snap_id nulls first)) /
              (extract(hour from END_INTERVAL_TIME-begin_interval_time)*3600
              -extract(hour from sn.snap_timezone - lag(sn.snap_timezone) over (partition by io.dbid,io.instance_number,io.function_name,io.filetype_name order by sn.snap_id nulls first) )*3600 
              --deals with daylight savings time change
              + extract(minute from END_INTERVAL_TIME-begin_interval_time)* 60
              + extract(second from END_INTERVAL_TIME-begin_interval_time)),2 ) Rate_large_write_megabytes,
    round((io.wait_time - lag(io.wait_time) over (partition by io.dbid,io.instance_number,io.function_name,io.filetype_name order by sn.snap_id nulls first)) /
              (extract(hour from END_INTERVAL_TIME-begin_interval_time)*3600
              -extract(hour from sn.snap_timezone - lag(sn.snap_timezone) over (partition by io.dbid,io.instance_number,io.function_name,io.filetype_name order by sn.snap_id nulls first) )*3600 
              --deals with daylight savings time change
              + extract(minute from END_INTERVAL_TIME-begin_interval_time)* 60
              + extract(second from END_INTERVAL_TIME-begin_interval_time)),2 ) Rate_wait_time
from dba_hist_iostat_detail io,
     dba_hist_snapshot sn
where
  sn.snap_id = io.snap_id
 and sn.dbid = io.dbid
 and sn.instance_number = io.instance_number
 and sn.begin_interval_time &delta_time_where_clause
order by sn.snap_id;

spool off
