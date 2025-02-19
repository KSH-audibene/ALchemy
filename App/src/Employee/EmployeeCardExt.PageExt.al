namespace ALchemy;

using Microsoft.HumanResources.Employee;

pageextension 60100 EmployeeCardExt extends "Employee Card"
{
    layout
    {
        addafter(General)
        {
            group(Salary)
            {
                Caption = 'Salary';

                group(CoreSalary)
                {
                    Caption = 'Core Salary';

                    field(DepartmentCode; Rec.DepartmentCode)
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the department code for the employee.';
                    }

                    field(EmployeeType; Rec.Seniority)
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the type (position) of the employee.';
                    }

                    field(SalaryType; Rec.SalaryType)
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the type of salary calculation for the employee.';
                    }
                }

                group(CommissionSalary)
                {
                    Caption = 'Commission Salary';
                    Editable = Rec.SalaryType = SalaryType::Commission;

                    field(CommissionBonusPct; Rec.CommissionBonusPct)
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the commission bonus percentage for the employee.';
                    }
                }

                group(TargetSalary)
                {
                    Caption = 'Target Salary';
                    Editable = Rec.SalaryType = SalaryType::Target;

                    field(RevenueTarget; Rec.TargetRevenue)
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the revenue target for the employee.';
                    }

                    field(MaximumBonus; Rec.MaximumTargetBonus)
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the maximum bonus for the employee.';
                    }

                    field(MaximumMalus; Rec.MaximumTargetMalus)
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the maximum malus for the employee.';
                    }
                }
            }

        }
    }

    actions
    {
        addlast(Processing)
        {
            action(PreviewSalary)
            {
                Caption = 'Preview Salary';
                Image = Calculate;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ApplicationArea = All;
                ToolTip = 'Calculates and previews the salary for this employee on the current date.';

                trigger OnAction()
                begin
                    Rec.PreviewSalary();
                end;
            }
        }
    }
}
