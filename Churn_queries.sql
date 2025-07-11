create database churn;
use churn;
CREATE TABLE customer (
	
    AccountAge INT,
    MonthlyCharges FLOAT,
    TotalCharges FLOAT,
    SubscriptionType VARCHAR(20),
    PaymentMethod VARCHAR(30),
    PaperlessBilling VARCHAR(3),
    ContentType VARCHAR(20),
    MultiDeviceAccess VARCHAR(3),
    DeviceRegistered VARCHAR(20),
    ViewingHoursPerWeek FLOAT,
    AverageViewingDuration FLOAT,
    ContentDownloadsPerMonth INT,
    GenrePreference VARCHAR(20),
    UserRating FLOAT,
    SupportTicketsPerMonth INT,
    Gender VARCHAR(10),
    WatchlistSize INT,
    ParentalControl VARCHAR(3),
    CustomerID VARCHAR(20),
    Churn INT
);

-- importing data--
load data infile "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\cleaned_data.csv"
into table customer
fields terminated by ',' enclosed by '"'
lines terminated by '\n'
ignore 1 rows;
-- checking the table--
select * from customer;
-- Total customers, churned customers, churn_rate.--
select count(*)  as total_customers,sum(case when Churn =1 then 1 else 0 end) as churned_customers,
round(((sum(case when Churn =1 then 1 else 0 end)/count(*))*100),2) as churn_rate from customer;
-- churn vs subscription type excluding unknown type--
select SubscriptionType,count(*) as total_user,sum(case when Churn=1 then 1 else 0 end) as churned,
sum(case when Churn=0 then 1 else 0 end) as retained,round((sum(case when Churn=1 then 1 else 0 end)/count(*))*100,2) as churn_rate
from customer where SubscriptionType !='unknown' group by SubscriptionType;
--  lets look into payment method vs churn  rate--
select PaymentMethod,count(*) as total_user,sum(case when Churn=1 then 1 else 0 end) as churned,
sum(case when Churn=0 then 1 else 0 end) as retained, round(((sum(case when Churn=1 then 1 else 0 end)/count(*))*100),2) as churn_rate
from customer where PaymentMethod!='unknown'
group by PaymentMethod order by count(*) desc;
-- Churn vs Content Type excluding the unknown values--
with tab1 as(select ContentType,count(*)  as total_users,sum(case when Churn =1 then 1 else 0 end) as churned,
sum(case when Churn=0 then 1 else 0 end) as retained from customer where 
ContentType !='unknown' group by ContentType)
select *,round((churned/total_users)*100,2) as churn_rate from tab1 order by total_users;
-- Churn by Genre Preerence and excluding the unknown values--
select GenrePreference,count(*) as total_users,sum(case when Churn =1 then 1 else 0 end) as churned,
sum(case when Churn=0 then 1 else 0 end) as retained,
round(((sum(case when churn=1 then 1 else 0 end)/count(*))*100),2) as churn_rate from customer where GenrePreference!='unknown' 
group by GenrePreference order by count(*);
-- Churn Rate by Average Viewing Hours per week (User Engagement).Dividing them according to their viewingHours as low medium and high--
with new_tab as(select case when  ViewingHoursPerWeek<6 then 'Low' when ViewingHoursPerWeek between 6 and 14 then 'Medium'
else 'High' end as View_bin,Churn from customer)
select View_bin,count(*) as total_users,sum(case when Churn =1 then 1 else 0 end) as churned,
sum(case when Churn=0 then 1 else 0 end) as retained,
round(((sum(case when churn=1 then 1 else 0 end)/count(*))*100),2) as churn_rate from new_tab group by View_bin;
-- The least churn_rate is among the high duration watchers--
-- Now lets see the total avg time for churned vs retained
with tab1 as(select case when Churn=1 then 'Churned' else 'Retained' end as `Status`, AverageViewingDuration  from customer)
select  Status,round(avg(AverageViewingDuration),2) as `average total time` from tab1 group by Status ;
-- --