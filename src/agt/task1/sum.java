package task1;
import jason.*;
import jason.asSyntax.*;
import jason.asSemantics.*;

public class sum extends DefaultInternalAction {
    @Override
    public Object execute( TransitionSystem ts, Unifier un, Term[] args ) throws Exception {
        try {
            // 1. gets the arguments as typed terms
            NumberTerm p1 = (NumberTerm)args[0];
            NumberTerm p2 = (NumberTerm)args[1];
            // 2. calculates the distance
            double r = p1.solve() + p2.solve();

            return r;

        } catch (ClassCastException e) {
            throw new JasonException("The internal action `sum`"+
            "has received arguments that are not numbers!");
        } catch (Exception e) {
            throw new JasonException("Error in `sum`");
        }
    }
}
