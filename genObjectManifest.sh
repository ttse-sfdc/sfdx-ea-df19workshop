#generate field manifests (only for initial run)
sfdx shane:object:field --api External_Id__c -l 50 -n "External ID" -t Text -o User --noindex --externalid --unique
sfdx shane:object:field --api analyticsdemo_batch_id__c -l 50 -n "Demo Data Batch ID" -t Text -o User --noindex

sfdx shane:object:field --api External_Id__c -l 50 -n "External ID" -t Text -o Account --noindex --externalid --unique
sfdx shane:object:field --api analyticsdemo_batch_id__c -l 50 -n "Demo Data Batch ID" -t Text -o Account --noindex
sfdx shane:object:field --api CreatedDate__c -n "Created Date" -t DateTime -o Account --noindex

sfdx shane:object:field --api External_Id__c -l 50 -n "External ID" -t Text -o Opportunity --noindex --externalid --unique
sfdx shane:object:field --api analyticsdemo_batch_id__c -l 50 -n "Demo Data Batch ID" -t Text -o Opportunity --noindex
sfdx shane:object:field --api CreatedDate__c -n "Created Date" -t DateTime -o Opportunity --noindex
sfdx shane:object:field --api LastModifiedDate__c -n "Last Modified Date" -t DateTime -o Opportunity --noindex
sfdx shane:object:field --api LastActivityDate__c -n "Last Activity Date" -t Date -o Opportunity --noindex
sfdx shane:object:field --api Exec_Meeting__c -n "Last Modified Date" -t Text -o Opportunity --noindex
sfdx shane:object:field --api Interactive_Demo__c -n "Last Modified Date" -t Text -o Opportunity --noindex
sfdx shane:object:field --api AccountAnnualRevenue__c -n "Last Modified Date" -t Number -o Opportunity --noindex
sfdx shane:object:field --api AccountNumberOfEmployees__c -n "Last Modified Date" -t DateTime -o Opportunity --noindex
sfdx shane:object:field --api AccountBookings__c -n "Last Modified Date" -t DateTime -o Opportunity --noindex
sfdx shane:object:field --api Competitor__c -n "Last Modified Date" -t DateTime -o Opportunity --noindex
sfdx shane:object:field --api DealSizeCategory__c -n "Last Modified Date" -t DateTime -o Opportunity --noindex
sfdx shane:object:field --api TimeToClose__c -n "Last Modified Date" -t DateTime -o Opportunity --noindex
sfdx shane:object:field --api SalesStageCount__c -n "Last Modified Date" -t DateTime -o Opportunity --noindex
sfdx shane:object:field --api Product2Name__c -n "Last Modified Date" -t DateTime -o Opportunity --noindex
sfdx shane:object:field --api Product2Family__c -n "Last Modified Date" -t DateTime -o Opportunity --noindex
sfdx shane:object:field --api Region__c -n "Last Modified Date" -t DateTime -o Opportunity --noindex