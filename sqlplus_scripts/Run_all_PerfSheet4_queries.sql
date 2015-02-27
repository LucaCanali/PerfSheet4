--
-- Run_all_PerfSheet4_queries.sql - this is part of PerfSheet4. It is a wrapper script to the AWR extraction queries
-- Luca Canali, last modified Feb 2015
--

-- Usage:
--   Run the script from sql*plus connected as a priviledged user (need to be able to read AWR tables)
--   Can run it over sql*net from client machine or locally on db server
--   Customize the file perfsheet4_definitions.sql before running this, in particular define there the interval of analysis
--

@@Perfsheet4_query_AWR_sysmetric.sql
@@Perfsheet4_query_AWR_Waitclass_and_CPU.sql
@@Perfsheet4_query_AWR_service_stat.sql
@@Perfsheet4_query_AWR_sysstat.sql
@@Perfsheet4_query_AWR_system_event.sql
@@Perfsheet4_query_AWR_iostat_detail.sql
@@Perfsheet4_query_AWR_ioevent_histogram.sql
@@Perfsheet4_query_AWR_top3_waitevent_and_CPU.sql

exit
