namespace ALchemy;

table 60108 CalculationResult
{
    TableType = Temporary;

    fields
    {
        field(1; Salary; Decimal) { }
        field(2; Bonus; Decimal) { }
        field(3; Incentive; Decimal) { }
    }

    procedure Write(Writer: Interface ISalaryWriter)
    begin
        Writer.WriteSalary(Rec);
    end;
}
