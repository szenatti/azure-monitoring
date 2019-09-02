Kusto Query 

CPU 

Perf  
| where ObjectName == "Processor" and CounterName == "% Processor Time" and TimeGenerated > ago(4h) 
| summarize AVGPROCESSOR = avg(CounterValue) by bin(TimeGenerated, 5m), Computer
| sort by AVGPROCESSOR desc
| render timechart 


Memory
Perf  
| where ObjectName == "Memory" and CounterName == "Available MBytes" and TimeGenerated > ago(4h) 
| summarize AVGMEMORY = avg(CounterValue) by bin(TimeGenerated, 5m), Computer
| sort by AVGMEMORY desc
| render timechart


Disk Reads

Perf 
| where CounterName == "Disk Reads/sec" and ObjectName == "LogicalDisk" and TimeGenerated > ago(4h) 
| summarize AvgReadsDiskIO = avg(CounterValue) by bin(TimeGenerated, 5m), Computer
| sort by AvgReadsDiskIO desc
| render timechart 

Disk Writes

Perf 
| where CounterName == "Disk Writes/sec" and ObjectName == "LogicalDisk" and TimeGenerated > ago(4h) 
| summarize AvgDiskWritesIO = avg(CounterValue) by bin(TimeGenerated, 5m), Computer
| sort by AvgDiskWritesIO desc
| render timechart 

Heartbeat Monitoring 

Heartbeat
| summarize max(TimeGenerated) by Computer
| where max_TimeGenerated < ago(1m)
| count 
