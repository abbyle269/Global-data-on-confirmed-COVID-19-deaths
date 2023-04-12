-- Name 2 joined tables and select columns 
with PopulationVsVaccines (continent, location, date, population, new_vaccinations, TotalVaccineByLocation)
as
(
--Joining 2 tables CovidDeaths and CovidVaccinations by using 2 alias Table1 and Table 2
select 
	Table1.continent, Table1.location, Table1.date, Table1.population,
	Table2.new_vaccinations, 
	--Count total new vaccinations based on locations
	(sum(convert(int, Table2.new_vaccinations)) 
	over (Partition by Table1.location order by Table1.Date)) as TotalVaccineByLocation
	
from 
	AbbyPortfolio..CovidDeaths Table1
join
	AbbyPortfolio..CovidVaccinations Table2
on 
	Table1.location = Table2.location
and Table1.date = Table2.date

where Table1.continent is not null 
and Table2.new_vaccinations is not null
--order by location, date
)
select *, (TotalVaccineByLocation/population)*100 as Population_Vs_Vaccines
from PopulationVsVaccines