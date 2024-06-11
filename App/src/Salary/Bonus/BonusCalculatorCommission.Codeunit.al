namespace ALchemy;

using Microsoft.HumanResources.Employee;
using Microsoft.Sales.Receivables;
using Microsoft.Finance.GeneralLedger.Journal;

codeunit 60103 BonusCalculatorCommission implements IBonusCalculator
{
    procedure CalculateBonus(Employee: Record Employee; Salary: Decimal; var Parameters: Record CalculationParameters) Bonus: Decimal;
    var
        CustLedgEntry: Record "Cust. Ledger Entry";
    begin
        Employee.TestField("Salespers./Purch. Code");

        CustLedgEntry.SetRange("Posting Date", Parameters.StartingDate, Parameters.EndingDate);
        CustLedgEntry.SetRange("Salesperson Code", Employee."Salespers./Purch. Code");
        CustLedgEntry.SetFilter("Document Type", '%1|%2', "Gen. Journal Document Type"::Invoice, "Gen. Journal Document Type"::"Credit Memo");
        CustLedgEntry.CalcSums("Profit (LCY)");
        Bonus := (Employee.CommissionBonusPct / 100) * CustLedgEntry."Profit (LCY)";
    end;
}
