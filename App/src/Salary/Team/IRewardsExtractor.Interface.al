namespace ALchemy;

interface IRewardsExtractor
{
    Access = Internal;

    procedure ExtractRewardComponent(Result: Record CalculationResult): Decimal;
}
