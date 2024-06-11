namespace ALchemy;

using Microsoft.HumanResources.Employee;

interface IBaseSalaryCalculator
{
    procedure CalculateBaseSalary(Employee: Record Employee; var Parameters: Record CalculationParameters): Decimal;
}