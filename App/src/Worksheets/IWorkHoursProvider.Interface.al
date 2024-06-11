namespace ALchemy;

using Microsoft.HumanResources.Employee;

interface IWorkHoursProvider
{
    procedure CalculateHours(Employee: Record Employee; var Parameters: Record CalculationParameters): Decimal;
}
