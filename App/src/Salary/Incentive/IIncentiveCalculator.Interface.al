namespace ALchemy;

using Microsoft.HumanResources.Employee;

interface IIncentiveCalculator
{
    procedure CalculateIncentive(Employee: Record Employee; Salary: Decimal; var Parameters: Record CalculationParameters): Decimal
}
