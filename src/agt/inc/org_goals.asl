// plan to execute organisational goals

// Example:
// +!site_prepared      // the goal (introduced by the organisational obligation)
   // <- prepareSite.   // simulation of the action (in GUI artifact)

// +!site_prep_contracted          <- !create_auction_artifact("SitePreparation", 2000).
+!get_site_prepared             <- prepareSite.
+!prep_site_paid                <- !pay_for_task("SitePreparation", "hsh_group").

+!floors_laid                   <- layFloors.
+!floor_paid                    <- !pay_for_task("Floors", "hsh_group").

+!walls_built                   <- buildWalls.
+!walls_paid                    <- !pay_for_task("Walls", "hsh_group").

+!roof_built                    <- buildRoof.
+!roof_paid                     <- !pay_for_task("Roof", "hsh_group").

+!windows_fitted                <- fitWindows.
+!doors_fitted                  <- fitDoors.
+!windows_doors_paid            <- !pay_for_task("WindowsDoors", "hsh_group").

+!electrical_system_installed   <- installElectricalSystem.
+!electrical_paid               <- !pay_for_task("ElectricalSystem", "hsh_group").

+!plumbing_installed            <- installPlumbing.
+!plumbing_paid                 <- !pay_for_task("Plumbing", "hsh_group").

+!exterior_painted              <- paintExterior.
+!exterior_paint_paid           <- !pay_for_task("Painting", "hsh_group").

+!interior_painted              <- paintInterior.
+!interior_paint_paid           <- !pay_for_task("Painting", "hsh_group").
