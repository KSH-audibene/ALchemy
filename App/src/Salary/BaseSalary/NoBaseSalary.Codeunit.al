namespace ALchemy;

using Microsoft.HumanResources.Employee;

codeunit 60120 NoBaseSalary implements IBaseSalaryCalculator
{
    procedure CalculateBaseSalary(Employee: Record Employee; var Parameters: Record CalculationParameters): Decimal;
    begin
        // Making it explicit
        exit(0);
    end;
}