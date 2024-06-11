namespace ALchemy;

using Microsoft.HumanResources.Employee;

codeunit 60118 DefaultBaseSalaryCalculator implements IBaseSalaryCalculator
{
    procedure CalculateBaseSalary(Employee: Record Employee; var Parameters: Record CalculationParameters) Salary: Decimal;
    var
        Department: Record Department;
        DepartmentSenioritySetup: Record DepartmentSenioritySetup;
    begin
        Parameters.TestField(BaseSalary);

        Salary := Employee.BaseSalary;

        if Employee.BaseSalary = 0 then begin
            Salary := Parameters.BaseSalary;
            if Employee.DepartmentCode <> '' then begin
                Department.Get(Employee.DepartmentCode);
                Salary := Department.BaseSalary;
                if DepartmentSenioritySetup.Get(Employee.DepartmentCode, Employee.Seniority) then
                    Salary := DepartmentSenioritySetup.BaseSalary;
            end;
        end;
    end;
}
