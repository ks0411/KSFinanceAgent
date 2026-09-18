using KSFinanceAgent.Core.Configuration;
using Xunit;

namespace KSFinanceAgent.Tests;

public sealed class OrchestratorOptionsTests
{
    [Fact]
    public void HistoryIsBoundedByDefault() =>
        Assert.Equal(20, new OrchestratorOptions().MaxHistoryMessages);

    [Theory]
    [InlineData(-1)]
    [InlineData(0)]
    [InlineData(1)]
    [InlineData(2)]
    public void HistoryLimitMustFitAWholeNativeTurn(int limit) =>
        Assert.Throws<ArgumentOutOfRangeException>(() =>
            new OrchestratorOptions { MaxHistoryMessages = limit });
}
