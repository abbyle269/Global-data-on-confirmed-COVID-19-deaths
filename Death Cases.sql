--Replace all Null values to 0
update 
	AbbyPortfolio..CovidDeaths 
set 
	total_deaths = 0, new_deaths = 0, new_cases_smoothed = 0, new_deaths_smoothed = 0
where 
	total_deaths is null or new_deaths is null or new_cases_smoothed is null or new_deaths_smoothed is null

--The database is about the number of confirmed deaths from COVID-19. 
--The data was collected from 49 countries and 6 continents
select 
	count(distinct continent) as Continents, count(distinct location) as Countries
from 
	AbbyPortfolio..CovidDeaths 
where 
	continent is not null 

--The information was collected from 2020-01-01 to 2021-04-30
select 
	left((min(date)),11) as StartDate, left((max(date)),11) as EndDate
from AbbyPortfolio..CovidDeaths
order by StartDate

-----------------------------------------------------------------------
--Total case vs population, shows the percentage of population infected with Covid
Select Location, date, Population, total_cases,  (total_cases/population)*100 as PercentPopulationInfected
from AbbyPortfolio..CovidDeaths
order by 1,2 

--Finding the number of death cases from each country and return the highest to lowest number 
--Using Cast function to convert some wrong data type fields to int
select location, max(cast(total_deaths as int)) as TotalDeathCount
from AbbyPortfolio..CovidDeaths
where continent is not null
group by location
order by TotalDeathCount desc

-- global numbers
-- Calculate how many total cases and death cases in global during a period of time 
select 
	DATEDIFF(day, min(date), max(date)) AS days,
	sum(new_cases) as total_cases, 
	sum(cast(new_deaths as int)) as death_cases

from AbbyPortfolio..CovidDeaths
where continent is not null
