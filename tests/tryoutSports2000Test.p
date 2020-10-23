block-level on error undo, throw.

using OpenEdge.Core.Assert.

@Test.
procedure testIfSports2000Connected:
    def var lDbConnected as logical no-undo.

    run src/tryoutSports2000.p(output lDbConnected).
    Assert:IsTrue(lDbConnected).
end procedure.
