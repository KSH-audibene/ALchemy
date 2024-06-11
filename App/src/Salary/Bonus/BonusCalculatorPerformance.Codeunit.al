namespace ALchemy;

using Microsoft.HumanResources.Employee;
using Microsoft.Finance.GeneralLedger.Account;
using Microsoft.Finance.GeneralLedger.Ledger;

codeunit 60108 BonusCalculatorPerformance implements IBonusCalculator
{
    procedure CalculateBonus(Employee: Record Employee; Salary: Decimal; var Parameters: Record CalculationParameters) Bonus: Decimal;
    var
        GLAccount: Record "G/L Account";
        GLEntry: Record "G/L Entry";
        Income: Decimal;
        Expense: Decimal;
        Profit: Decimal;
    begin
        GLEntry.SetRange("Posting Date", Parameters.StartingDate, Parameters.EndingDate);

        GLAccount.Get(Parameters.IncomeAccountNo);
        GLEntry.SetFilter("G/L Account No.", GLAccount.Totaling);
        GLEntry.CalcSums(Amount);
        Income := GLEntry.Amount;

        GLAccount.Get(Parameters.ExpenseAccountNo);
        GLEntry.SetFilter("G/L Account No.", GLAccount.Totaling);
        GLEntry.CalcSums(Amount);
        Expense := GLEntry.Amount;

        Profit := Income - Expense;
        if (Profit > 0) then
            Bonus := (Employee.PerformanceBonusPct / 100) * Profit;
    end;
}