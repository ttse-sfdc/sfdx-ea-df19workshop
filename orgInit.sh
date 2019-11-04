#create scratch org
sfdx force:org:create -s -f config/project-scratch-def.json --targetdevhubusername admin@pmmtech.dev

#sfdx shane:object:field --api External_Id__c -l 50 -n "External ID" -t Text -o User --noindex --externalid --unique
#sfdx shane:object:field --api analyticsdemo_batch_id__c -l 50 -n "Demo Data Batch ID" -t Text -o User --noindex

#sfdx shane:object:field --api External_Id__c -l 50 -n "External ID" -t Text -o Account --noindex --externalid --unique
#sfdx shane:object:field --api analyticsdemo_batch_id__c -l 50 -n "Demo Data Batch ID" -t Text -o Account --noindex
#sfdx shane:object:field --api CreatedDate__c -n "Created Date" -t DateTime -o Account --noindex

#sfdx shane:object:field --api External_Id__c -l 50 -n "External ID" -t Text -o Opportunity --noindex --externalid --unique
#sfdx shane:object:field --api analyticsdemo_batch_id__c -l 50 -n "Demo Data Batch ID" -t Text -o Opportunity --noindex
#sfdx shane:object:field --api CreatedDate__c -n "Created Date" -t DateTime -o Opportunity --noindex
#sfdx shane:object:field --api LastModifiedDate__c -n "Last Modified Date" -t DateTime -o Opportunity --noindex
#sfdx shane:object:field --api LastActivityDate__c -n "Last Activity Date" -t Date -o Opportunity --noindex
#sfdx shane:object:field --api Exec_Meeting__c -n "Last Modified Date" -t Text -o Opportunity --noindex
#sfdx shane:object:field --api Interactive_Demo__c -n "Last Modified Date" -t Text -o Opportunity --noindex
#sfdx shane:object:field --api AccountAnnualRevenue__c -n "Last Modified Date" -t Number -o Opportunity --noindex
#sfdx shane:object:field --api AccountNumberOfEmployees__c -n "Last Modified Date" -t DateTime -o Opportunity --noindex
#sfdx shane:object:field --api AccountBookings__c -n "Last Modified Date" -t DateTime -o Opportunity --noindex
#sfdx shane:object:field --api Competitor__c -n "Last Modified Date" -t DateTime -o Opportunity --noindex
#sfdx shane:object:field --api DealSizeCategory__c -n "Last Modified Date" -t DateTime -o Opportunity --noindex
#sfdx shane:object:field --api TimeToClose__c -n "Last Modified Date" -t DateTime -o Opportunity --noindex
#sfdx shane:object:field --api SalesStageCount__c -n "Last Modified Date" -t DateTime -o Opportunity --noindex
#sfdx shane:object:field --api Product2Name__c -n "Last Modified Date" -t DateTime -o Opportunity --noindex
#sfdx shane:object:field --api Product2Family__c -n "Last Modified Date" -t DateTime -o Opportunity --noindex
#sfdx shane:object:field --api Region__c -n "Last Modified Date" -t DateTime -o Opportunity --noindex

sfdx force:source:push -f

sfdx force:data:bulk:upsert -s UserRole -f data/core/UserRole.csv -i Name
sfdx force:data:bulk:upsert -s User -f data/core/User.csv -i External_Id__c
sfdx force:data:bulk:upsert -s Account -f data/core/Account.csv -i External_Id__c
sfdx force:data:bulk:upsert -s Opportunity -f data/core/Opportunity.csv -i External_Id__c

#create min records for Sales Analytics
sfdx force:data:record:create -s Account -v "Name=Acme"
sfdx force:data:record:create -s Task -v "Subject='Call'"
sfdx force:data:record:create -s Event -v "Subject='Call' DurationInMinutes='1' ActivityDateTime='2019-01-01'"
sfdx force:data:record:create -s Opportunity -v "Name='100k Deal' StageName='Prospecting' CloseDate='2019-12-30'"
sfdx force:data:record:update -s Opportunity -w "Name='100k Deal'" -v "StageName='Qualification'"
sfdx force:data:record:update -s Opportunity -w "Name='100k Deal'" -v "StageName='Needs Analysis'"

#create Sales Analytics app
sfdx analytics:app:create -f analytics/sales-analytics-template-values.json

#check app creation status

#Overwrite Opportunities dataset
sfdx shane:analytics:dataset:upload -f data/analytics/OpportunityShape.csv -m data/analytics/OpportunityShape.json -n opportunity -a Sales_Analytics

#open org
sfdx force:org:open





KEY              VALUE
───────────────  ────────────────────────────────────────────────────────────────────────────────────────────────────────────────
Access Token     00D0U000000DZlx!AQsAQDq_kGn8AOVat2RSsqlEwqSzR72jHRkbmV8v9B2sdDtmo8N9.XT7lL0e2zhCEpVS8FDDaEJKZon6GeTRf38fEsw7NL1f
Client Id        PlatformCLI
Created By       admin@pmmtech.dev
Created Date     2019-11-03T05:00:20.000+0000
Dev Hub Id       admin@pmmtech.dev
Edition          Developer
Expiration Date  2019-11-10
Id               00D0U000000DZlxUAG
Instance Url     https://nosoftware-ability-4398-dev-ed.cs97.my.salesforce.com/
Org Name         EA DF19 Workshop SFDX
Password         J3H0R@q^9u
Status           Active
Username         test-bbjbpnjgnb3u@example.com