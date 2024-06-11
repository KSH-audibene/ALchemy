codeunit 60102 BonusCalculatorTimesheet implements IBonusCalculator
{
    procedure CalculateBonus(Employee: Record Employee; Salary: Decimal; var Parameters: Record CalculationParameters) Bonus: Decimal;
    var
        WorkHoursProvider: Interface IWorkHoursProvider;
        WorkHours: Decimal;
    begin
        Parameters.TestField(MinimumHours);
        Parameters.TestField(OvertimeThreshold);
        Employee.TestField("Resource No.");

        WorkHoursProvider := Employee.GetWorkHoursProvider();
        WorkHours := WorkHoursProvider.CalculateHours(Employee, Parameters);

        if WorkHours < Parameters.MinimumHours then
            Bonus := -Salary * (1 - WorkHours / Parameters.MinimumHours)
        else
            if (WorkHours > Parameters.OvertimeThreshold) then
                Bonus := Salary * (WorkHours / Parameters.OvertimeThreshold - 1);
    end;
}
