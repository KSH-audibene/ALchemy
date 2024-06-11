namespace ALchemy;

using Microsoft.HumanResources.Employee;

codeunit 60113 TeamBonus implements IBonusCalculator, IRewardsExtractor
{
    Access = Internal;

    procedure CalculateBonus(Employee: Record Employee; Salary: Decimal; var Parameters: Record CalculationParameters) Bonus: Decimal;
    var
        TeamController: Codeunit TeamController;
        this: Codeunit TeamBonus; // TODO BC25: This will become a built-in keyword; replace with it
    begin
        Bonus := TeamController.CalculateSubordinates(Employee."No.", Employee.TeamBonusPct, Parameters.GetProvider(), this);
    end;

    internal procedure ExtractRewardComponent(Result: Record CalculationResult): Decimal
    begin
        exit(Result.Bonus);
    end;
}
