## Data warehouse serverless or DW as a service

technologies hides under the hood
-Borg
-Colossus
-Jupiter
-Dremel

Dremel: Execution engine
-A query engine
-its orchestrates your query by breaking that in pieces and compiles the results (root server, mixers, leaf nodes)
-Transform your query in an tree of executions
-each leaf of the tree calls `slots` and each one work to read data from Colossus
-the branches of the tree calls `mixers` 
