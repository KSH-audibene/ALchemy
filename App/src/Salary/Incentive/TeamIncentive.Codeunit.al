namespace ALchemy;

using Microsoft.HumanResources.Employee;

codeunit 60114 TeamIncentive implements IIncentiveCalculator, IRewardsExtractor
{
    Access = Internal;

    procedure CalculateIncentive(Employee: Record Employee; Salary: Decimal; var Parameters: Record CalculationParameters) Incentive: Decimal
    var
        TeamController: Codeunit TeamController;
        this: Codeunit TeamIncentive; // TODO BC25: This will become a built-in keyword; replace with it
    begin
        Incentive := TeamController.CalculateSubordinates(Employee."No.", Employee.TeamIncentivePct, Parameters.GetProvider(), this);
    end;

    internal procedure ExtractRewardComponent(Result: Record CalculationResult): Decimal
    begin
        exit(Result.Incentive);
    end;
}
