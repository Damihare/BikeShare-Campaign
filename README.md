# BikeShare-Campaign
Marketing Campaign to convert casual riders to annual members

Google Analytics Capstone Project using Cyclistic (Divvy) bike data

This Case Study was completed as part of the Google Data Analytics Professional Certificate.

Objective (Ask Phase)
Identify how annual members and casual riders use Cyclistic bikes differently to create an effective digital marketing campaign to convert casual riders into annual members.

Prepare Phase
1. Download 12 months of 2021 data from website: https://www.divvybikes.com/system-data
2. Identify columns with null values and discrepancies in column formatting, and cell values
3. Turn the worksheets into tables and name them (for data manipulation in Excel)
4. Check duplicates in ID column
5. Separate the downloaded CSV files from the  converted CSV to XLS files in two folders.

Process Phase
1. Create a column "ride_length" to identify the trip length, this will also help to identify anomalies in the data, i.e., if a trip is 0 or less than 0.
2. The 2nd column will be "day_of_week" to identify the day of the week travelled.
3. The third column will be "month" to identified the month of the trip when the 12 month data are consolidated. 

Analyse Phase
1. The 12 month data is consolidated into a table using T-SQL on the MS SQL Server
2. Then the following are identified:
3. Avg. ride length per member type
4. Avg. ride length per member type per day of the week.
5. Number of rides per member typer per day of the week.
6. Identify distinct count of riders per member type.
7. Max ride length per member type
8. Day of the week with the most travel 
9. Most frequented dock station
10. Preferred bike type 

Share Phase
Visualisations were created using Tableau. Published here https://public.tableau.com/views/BikeRideCampaign/Avg_TripLength_per_day_of_week?:language=en-US&:display_count=n&:origin=viz_share_link

Act Phase
I would hope for the opportunity to present the following business findings:
1. There are more casual riders who spend more time riding regardless of day of the week or month of the year; therefore, encouraging them to switch over to the annual membership as a cost saving measure would be primary suggestion for the campaign.
2. I would focus my ad space on the most frequented stops and start dock stations
3. I will also mention a plan to increase their preferred bike type in the campaign.
4. Overall there are no significant behavioral patterns between annual and casual users save that casual riders ride more and longer. 
