// Common code for the organisational part of the system

task_roles("SitePreparation",  [site_prep_contractor]).
task_roles("Floors",           [bricklayer]).
task_roles("Walls",            [bricklayer]).
task_roles("Roof",             [roofer]).
task_roles("WindowsDoors",     [window_fitter, door_fitter]).
task_roles("Plumbing",         [plumber]).
task_roles("ElectricalSystem", [electrician]).
task_roles("Painting",         [painter]).

+!contract(Task,GroupName)
    : task_roles(Task,Roles)
   <- !in_ora4mas;
      lookupArtifact(GroupName, GroupId);
      for ( .member( Role, Roles) ) {
         adoptRole(Role)[artifact_id(GroupId)];
         focus(GroupId)
      }.

// Pay and receive for tasks

+!pay_for_task(Task,GroupName) : task_roles(Task,Roles) & balance(B)
   <-
   ?task(Task)[artifact_id(ArtId)];
   ?currentWinner(Ag)[artifact_id(ArtId)];
   ?currentBid(Price)[artifact_id(ArtId)];
   -+balance(B-Price);
   .send(Ag,tell,service_paid(Me, Price));
   println("*** Payment of ", Price, " for ", Task, " to ", Ag,  ". Balance:  ", B-Price, "***");
   .

+service_paid(House_Owner, Price)[source(House_Owner)]: balance(B)
    <-
    -+balance(B+Price);
    println("I just got paid ", Price, " by ", House_Owner);
    .

// ========

-!contract(Service,GroupName)[error(E),error_msg(Msg),code(Cmd),code_src(Src),code_line(Line)]
   <- .print("Failed to sign the contract for ",Service,"/",GroupName,": ",Msg," (",E,"). command: ",Cmd, " on ",Src,":", Line).

+!in_ora4mas : in_ora4mas.
+!in_ora4mas : .intend(in_ora4mas)
   <-
   // .wait({+in_ora4mas},100,_);
   !in_ora4mas;
   .

@lin[atomic]
+!in_ora4mas
   <- joinWorkspace("ora4mas",_);
      +in_ora4mas.

{ include("$jacamoJar/templates/common-moise.asl") }
{ include("$jacamoJar/templates/org-obedient.asl") }
