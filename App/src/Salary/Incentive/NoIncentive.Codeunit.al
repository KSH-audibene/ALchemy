namespace ALchemy;

using Microsoft.HumanResources.Employee;

codeunit 60112 NoIncentive implements IIncentiveCalculator
{
    procedure CalculateIncentive(Employee: Record Employee; Salary: Decimal; var Parameters: Record CalculationParameters): Decimal
    begin
        // Making it explicit
        exit(0);
    end;
}
