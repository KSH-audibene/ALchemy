namespace ALchemy;

table 60104 CalculationParameters
{
    TableType = Temporary;

    fields
    {
        field(2; BaseSalary; Decimal) { }
        field(3; MinimumHours; Decimal) { }
        field(4; OvertimeThreshold; Decimal) { }
        field(5; YearlyIncentivePct; Decimal) { }
        field(6; IncomeAccountNo; Code[20]) { }
        field(7; ExpenseAccountNo; Code[20]) { }
        field(8; AtDate; Date) { }
        field(9; StartingDate; Date) { }
        field(10; EndingDate; Date) { }
    }

    var
        _provider: Interface IParametersProvider;

    procedure Initialize(Provider: Interface IParametersProvider)
    begin
        Rec := Provider.GetParameters();
        _provider := Provider;
    end;

    procedure GetProvider(): Interface IParametersProvider
    begin
        exit(_provider);
    end;
}
