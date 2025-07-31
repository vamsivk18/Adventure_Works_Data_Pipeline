CREATE DATABASE SCOPED CREDENTIAL cred_vamsi
WITH IDENTITY = 'Managed Identity'
GO
CREATE EXTERNAL DATA SOURCE AzureDataLakeSilver
WITH
  ( LOCATION = 'https://st4adworks.dfs.core.windows.net/silver/' ,
    CREDENTIAL = cred_vamsi 
  ) ;
   
CREATE EXTERNAL DATA SOURCE AzureDataLakeGold
WITH
  ( LOCATION = 'https://st4adworks.dfs.core.windows.net/gold/' ,
    CREDENTIAL = cred_vamsi 
  ) ;

CREATE EXTERNAL FILE FORMAT parquet_format
WITH
(  
    FORMAT_TYPE = PARQUET,
    DATA_COMPRESSION = 'org.apache.hadoop.io.compress.SnappyCodec'
)



