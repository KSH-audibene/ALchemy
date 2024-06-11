codeunit 60115 MonthlyParametersProvider implements IParametersProvider
{
    var
        _parameters: Record CalculationParameters;

    procedure Initialize(Setup: Record SalarySetup; AtDate: Date)
    begin
        _parameters.BaseSalary := Setup.BaseSalary;
        _parameters.MinimumHours := Setup.MinimumHours;
        _parameters.OvertimeThreshold := Setup.OvertimeThreshold;
        _parameters.YearlyIncentivePct := Setup.YearlyIncentivePct;
        _parameters.IncomeAccountNo := Setup.IncomeAccountNo;
        _parameters.ExpenseAccountNo := Setup.ExpenseAccountNo;
        _parameters.AtDate := AtDate;
        _parameters.StartingDate := CalcDate('<CM+1D-1M>', AtDate);
        _parameters.EndingDate := CalcDate('<CM>', AtDate);
    end;

    procedure GetParameters(): Record CalculationParameters
    begin
        exit(_parameters);
    end;
}
