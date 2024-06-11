codeunit 60116 MonthlySalaryWriter implements ISalaryWriter
{
    var
        _monthlySalary: Record MonthlySalary;
        _employee: Record Employee;
        _atDate: Date;
        _writeToDatabase: Boolean;

    procedure Initialize(Employee: Record Employee; AtDate: Date)
    begin
        Initialize(Employee, AtDate, true);
    end;

    procedure Initialize(Employee: Record Employee; AtDate: Date; WriteToDatabase: Boolean)
    begin
        _employee := Employee;
        _atDate := AtDate;
        _writeToDatabase := WriteToDatabase;
    end;

    procedure GetMonthlySalary(): Record MonthlySalary
    begin
        exit(_monthlySalary);
    end;

    procedure WriteSalary(CalculationResult: Record CalculationResult)
    var
        MonthlySalary: Record MonthlySalary;
    begin
        MonthlySalary.EmployeeNo := _employee."No.";
        MonthlySalary.Date := _atDate;
        MonthlySalary.Salary := CalculationResult.Salary;
        MonthlySalary.Bonus := CalculationResult.Bonus;
        MonthlySalary.Incentive := CalculationResult.Incentive;

        if _writeToDatabase then
            MonthlySalary.Insert(false);

        _monthlySalary := MonthlySalary;
    end;
}
