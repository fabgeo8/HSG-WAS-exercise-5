// personal assistant agent 

/* Task 2 Start of your solution */

best_option(vibrating) :- rank(0) .
best_option(natural_light) :- rank(1).
best_option(artificial_light) :- rank(2).
rank(0).

/* Task 2 Start of your solution */
start_plan
+!start : true <-
    .print("Started the programm");
    !upcoming_event("now").

@awake_upcoming_plan
+upcoming_event(State) : upcoming_event("now") & owner_state("awake") <-
    .print("Enjoy your event").

@wake_up_user_with_al_plan
+upcoming_event(State) : upcoming_event("now") & owner_state("asleep") & best_option("al") <-
    .print("Starting wake-up routine with artificial light");
    turnOnLights;
    +owner_state(State) & State == "awake".
    
@wake_up_user_with_nl_plan
+upcoming_event(State) : upcoming_event("now") & owner_state("asleep") & best_option("nl") <-
    .print("Starting wake-up routine with natural light");
    raiseBlinds;
    +owner_state(State) & State == "awake".

@wake_up_user_with_vib_plan
+upcoming_event(State) : upcoming_event("now") & owner_state("asleep") & best_option("vib") <-
    .print("Starting wake-up routine with vibration");
    setVibrationsMode;
    +owner_state(State) & State == "awake".

@errorhandling
+upcoming_event(State) : true <-
    .print(errorhandling).

@show_best_option_plan
+best_option(Option) : true <-
    .print("Best option is ", Option).
    

@show_blinds_state_plan
+blinds(State) : true <-
    .print("Blinds are ", State).

@show_lights_state_plan
+lights(State) : true <-
    .print("Lights are ", State).

@show_mattress_state_plan
+mattress(State) : true <-
    .print("Mattress is ", State).

@show_owner_state_plan
+owner_state(State) : true <-
    .print("Owner is ", State).



/* Task 2 End of your solution */

/* Import behavior of agents that work in CArtAgO environments */
{ include("$jacamoJar/templates/common-cartago.asl") }