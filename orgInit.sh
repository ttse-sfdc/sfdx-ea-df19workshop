#create scratch org
sfdx force:org:create -s -f config/project-scratch-def.json --targetdevhubusername terry@dev.hub

#install Wow Demo packages
sfdx force:package:install --package 04tf4000003KZ8R
sfdx force:package:install --package 04t2E000003SP1i
sfdx shane:analytics:dataset:upload -f data/analytics/UX_SAMPLE_DATA.csv -m data/analytics/UX_SAMPLE_DATA.json -n UX_SAMPLE_DATA

#install Data Catalog Package
sfdx force:package:install --package 04t4T000001liUw

#push custom fields
sfdx force:source:push -f

#prep unique Username in User csv
TIMESTAMP=$(date "+%Y%m%d%H%M%S")
sed "s/{TIMESTAMP}/"$TIMESTAMP"/g" data/core/User.csv > data/core/User_Load.csv

#load csvs into core objects
sfdx force:data:bulk:upsert -s UserRole -f data/core/UserRole.csv -i Name
sfdx force:data:bulk:upsert -s User -f data/core/User_Load.csv -i External_Id__c
sfdx force:data:bulk:upsert -s Account -f data/core/Account.csv -i External_Id__c -w 2
sfdx force:data:bulk:upsert -s Opportunity -f data/core/Opportunity.csv -i External_Id__c -w 2

#create min records for Sales Analytics
sfdx force:data:record:create -s Task -v "Subject='Call'"
sfdx force:data:record:create -s Event -v "Subject='Call' DurationInMinutes='1' ActivityDateTime='2019-01-01'"

#create Sales Analytics app
sfdx analytics:app:create -f analytics/sales-analytics-template-values.json

sfdx force:user:password:generate

sfdx force:user:display

#open org
sfdx force:org:open