#temp directory for working files
mkdir sfdx_temp

#create scratch org
sfdx force:org:create -s -f config/project-scratch-def.json -d 14 -s -w 60

#install Wow Demo packages
sfdx force:package:install --package 04tf4000003KZ8R
sfdx force:package:install --package 04t2E000003SP1i

#install Design Workshop package
sfdx force:package:install --package 04t2E000003SPDH

#install Data Catalog Package
sfdx force:package:install --package 04t4T000001liUw

#push custom fields
sfdx force:source:push -f

#prep unique Username in User csv
sed "s/{TIMESTAMP}/$(date "+%Y%m%d%H%M%S")/g" data/core/User.csv > sfdx_temp/User_Load.csv

#load csvs into core objects
sfdx force:data:bulk:upsert -s UserRole -f data/core/UserRole.csv -i Name -w 2
sfdx force:data:bulk:upsert -s User -f sfdx_temp/User_Load.csv -i External_Id__c -w 2
sfdx force:data:bulk:upsert -s Account -f data/core/Account.csv -i External_Id__c -w 5
sfdx force:data:bulk:upsert -s Opportunity -f data/core/Opportunity.csv -i External_Id__c -w 5

#create min records for Sales Analytics
sfdx force:data:record:create -s Task -v "Subject='Call'"
sfdx force:data:record:create -s Event -v "Subject='Call' DurationInMinutes='1' ActivityDateTime='2019-01-01'"

#create Sales Analytics app
sfdx analytics:app:create -f analytics/sales-analytics-template-values.json

#upload any Analytics datasets
sfdx shane:analytics:dataset:upload -f data/analytics/UX_SAMPLE_DATA.csv -m data/analytics/UX_SAMPLE_DATA.json -n UX_SAMPLE_DATA
sfdx shane:analytics:dataset:upload -f data/analytics/UX_SAMPLE_DATA.csv -m data/analytics/UX_SAMPLE_DATA.json -n Sample_UX_Workshop

#clean up
rm -rf sfdx_temp

sfdx force:user:password:generate

sfdx force:user:display

#open org
sfdx force:org:open -p /analytics/wave/wave.apexp#home