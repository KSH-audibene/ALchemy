namespace ALchemy;

using Microsoft.HumanResources.Employee;

interface IBonusCalculator
{
    procedure CalculateBonus(Employee: Record Employee; Salary: Decimal; var Parameters: Record CalculationParameters): Decimal;
}
