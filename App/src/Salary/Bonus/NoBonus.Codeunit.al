namespace ALchemy;

using Microsoft.HumanResources.Employee;

codeunit 60111 NoBonus implements IBonusCalculator
{
    procedure CalculateBonus(Employee: Record Employee; Salary: Decimal; var Parameters: Record CalculationParameters): Decimal;
    begin
        // Making it explicit
        exit(0);
    end;
}
