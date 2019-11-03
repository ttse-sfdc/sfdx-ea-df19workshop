#create scratch org
sfdx force:org:create -s -f config/project-scratch-def.json --targetdevhubusername admin@pmmtech.dev

#sfdx shane:object:field --api External_Id__c -l 50 -n "External ID" -t Text -o Account --noindex
#sfdx shane:object:field --api CreatedDate__c -n "External ID" -t DateTime -o Account --noindex
#sfdx shane:object:field --api analyticsdemo_batch_id__c -l 50 -n "Demo Data Batch ID" -t Text -o Account --noindex



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