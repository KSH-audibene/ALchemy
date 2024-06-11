namespace ALchemy;

using Microsoft.HumanResources.Employee;

codeunit 60100 SalaryCalculate
{
    procedure CalculateSalary(var Employee: Record Employee; ParametersProvider: Interface IParametersProvider) Result: Record CalculationResult
    var
        Parameters: Record CalculationParameters;
        BaseSalaryCalculator: Interface IBaseSalaryCalculator;
        SeniorityScheme: Interface ISeniorityScheme;
        BonusCalculator: Interface IBonusCalculator;
        IncentiveCalculator: Interface IIncentiveCalculator;
    begin
        Parameters.Initialize(ParametersProvider);

        BaseSalaryCalculator := Employee.SalaryType;
        SeniorityScheme := Employee.Seniority;
        BonusCalculator := SeniorityScheme.GetBonusCalculator(Employee);
        IncentiveCalculator := SeniorityScheme.GetIncentiveCalculator(Employee);

        Result := CalculateSalary(Employee, Parameters, BaseSalaryCalculator, BonusCalculator, IncentiveCalculator);
    end;

    internal procedure CalculateSalary(var Employee: Record Employee; var Parameters: Record CalculationParameters; BaseSalaryCalculator: Interface IBaseSalaryCalculator; BonusCalculator: Interface IBonusCalculator; IncentiveCalculator: Interface IIncentiveCalculator) Result: Record CalculationResult
    var
        Salary: Decimal;
        Bonus: Decimal;
        Incentive: Decimal;
    begin
        Salary := BaseSalaryCalculator.CalculateBaseSalary(Employee, Parameters);
        Bonus := BonusCalculator.CalculateBonus(Employee, Salary, Parameters);
        Incentive := IncentiveCalculator.CalculateIncentive(Employee, Salary, Parameters);

        Result.Salary := Salary;
        Result.Bonus := Bonus;
        Result.Incentive := Incentive;
    end;
}
