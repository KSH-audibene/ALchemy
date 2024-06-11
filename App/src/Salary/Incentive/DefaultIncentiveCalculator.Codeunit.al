namespace ALchemy;

using Microsoft.HumanResources.Employee;

codeunit 60119 DefaultIncentiveCalculator implements IIncentiveCalculator
{
    procedure CalculateIncentive(Employee: Record Employee; Salary: Decimal; var Parameters: Record CalculationParameters) Incentive: Decimal
    var
        YearsOfTenure: Integer;
    begin
        Parameters.TestField(YearlyIncentivePct);
        YearsOfTenure := Round((Parameters.AtDate - Employee."Employment Date") / 365, 1, '<');
        Incentive := Salary * (YearsOfTenure * Parameters.YearlyIncentivePct) / 100;
    end;
}