namespace ALchemy;

using Microsoft.HumanResources.Employee;

codeunit 60101 TeamController
{
    Access = Internal;

    procedure CalculateSubordinates(EmployeeNo: Code[20]; Percentage: Decimal; ParametersProvider: Interface IParametersProvider; RewardsExtractor: Interface IRewardsExtractor) Result: Decimal;
    var
        SubordinateEmployee: Record Employee;
        MonthlySalary: Record MonthlySalary;
        CalculationResult: Record CalculationResult;
        AtDate: Date;
    begin
        AtDate := ParametersProvider.GetParameters().AtDate;
        SubordinateEmployee.SetRange("Manager No.", EmployeeNo);
        if SubordinateEmployee.FindSet() then
            repeat
                MonthlySalary.Reset();
                MonthlySalary.SetRange(EmployeeNo, SubordinateEmployee."No.");
                MonthlySalary.SetRange(Date, AtDate);
                if MonthlySalary.FindFirst() then
                    CalculationResult := MonthlySalary.ToCalculationResult()
                else
                    CalculationResult := SubordinateEmployee.CalculateSalary(ParametersProvider);
                Result += RewardsExtractor.ExtractRewardComponent(CalculationResult);
            until SubordinateEmployee.Next() = 0;
        Result := Result * (Percentage / 100);
    end;
}
