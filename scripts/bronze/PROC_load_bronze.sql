/*
===============================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
===============================================================================
Script Purpose:
    This stored procedure loads data into the 'bronze' schema from external CSV files. 
    It performs the following actions:
    - Truncates the bronze tables before loading data.
    - Uses the `BULK INSERT` command to load data from csv Files to bronze tables.

Parameters:
    None. 
	  This stored procedure does not accept any parameters or return any values.

Usage Example:
    EXEC bronze.load_bronze;
===============================================================================
*/
	CREATE OR ALTER PROCEDURE bronze.load_bronze AS
	BEGIN
	BEGIN TRY
	PRINT '===============================';
	PRINT 'Loading Bronze Layer';
	PRINT '===============================';
	PRINT '------------------------------'
	PRINT 'Loading CRM Tables'
	PRINT '------------------------------'
	TRUNCATE TABLE bronze.crm_cust_info
	BULK INSERT bronze.crm_cust_info
	FROM 'C:\Users\ushad\OneDrive\Desktop\SQL SERVER PROJECT\source_crm\cust_info.csv'
	WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
	);
	--SELECT * 
	--FROM bronze.crm_cust_info
	PRINT '------------------------------'
	PRINT 'Loading CRM Tables'
	PRINT '------------------------------'
	TRUNCATE TABLE bronze.crm_prd_info
	BULK INSERT bronze.crm_prd_info
	FROM 'C:\Users\ushad\OneDrive\Desktop\SQL SERVER PROJECT\source_crm\prd_info.csv'
	WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
	);
	PRINT '------------------------------'
	PRINT 'Loading CRM Tables'
	PRINT '------------------------------'
	TRUNCATE TABLE bronze.crm_sales_details
	BULK INSERT bronze.crm_sales_details
	FROM 'C:\Users\ushad\OneDrive\Desktop\SQL SERVER PROJECT\source_crm\sales_details.csv'
	WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
	);
	PRINT '------------------------------'
	PRINT 'Loading ERP Tables'
	PRINT '------------------------------'
	TRUNCATE TABLE bronze.erp_cust_az12
	BULK INSERT bronze.erp_cust_az12
	FROM 'C:\Users\ushad\OneDrive\Desktop\SQL SERVER PROJECT\source_erp\cust_az12.csv'
	WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
	);
	PRINT '------------------------------'
	PRINT 'Loading ERP Tables'
	PRINT '------------------------------'
	TRUNCATE TABLE bronze.erp_LOC_A101
	BULK INSERT bronze.erp_LOC_A101
	FROM 'C:\Users\ushad\OneDrive\Desktop\SQL SERVER PROJECT\source_erp\LOC_A101.csv'
	WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
	);
	PRINT '------------------------------'
	PRINT 'Loading ERP Tables'
	PRINT '------------------------------'
	TRUNCATE TABLE bronze.erp_px_cat_g1v2
	BULK INSERT bronze.erp_px_cat_g1v2
	FROM 'C:\Users\ushad\OneDrive\Desktop\SQL SERVER PROJECT\source_erp\px_cat_g1v2.csv'
	WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
	);
	END TRY
	BEGIN CATCH
	PRINT '====================='
	PRINT 'ERROR OCCURED WHILE LOADING BRONZE LAYER'
	PRINT 'ERROR MESSAGE'+ ERROR_MESSAGE();
	PRINT 'ERROR NUMBER'+ CAST(ERROR_NUMBER() AS NVARCHAR);
	PRINT '====================='
	END CATCH
	END
