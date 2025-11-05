
leghole = 10.5;
legheight = 25;
legwallthickness = 10;
legsupport = leghole+legwallthickness;

traysize = 180;
trayz = 5;
rimwidth = 2;
rimheight = 4;


//difference() {
//    cube([legsupport,legsupport,legheight], center = false);    
//    translate([legsupport/2,legsupport/2,legheight/2]) 
//        cube([leghole,leghole,legheight+1], center = true);
//}

difference(){
    union() {
        // tray
        cube([traysize,traysize,trayz], center=false);
        cube([traysize,rimwidth,trayz+rimheight], center = false);
        cube([rimwidth,traysize,trayz+rimheight], center = false);
        translate([0,traysize,0])
            cube([traysize+rimwidth,rimwidth,trayz+rimheight], center = false);
        translate([traysize,0,0])
            cube([rimwidth,traysize+rimwidth,trayz+rimheight], center = false);
        
        //leg supports
        cube([legsupport,legsupport,legheight], center = false);
        translate([0,traysize-legsupport+rimwidth,0]) cube([legsupport,legsupport,legheight], center = false);
        
        translate([legsupport,0,0])
        polyhedron([ 
            [0,0,0], 
            [traysize/2,0,0],  
            [0,0,legheight],
            [0,rimwidth,0], 
            [traysize/2,rimwidth,0], 
            [0,rimwidth,legheight]
        ], 
        [ [0,1,2], [5,4,3], [2,1,4,5], [0,3,4,1], [0,2,5,3] ]);
            
        translate([legsupport,traysize,0])
        polyhedron([ 
            [0,0,0], 
            [traysize/2,0,0],  
            [0,0,legheight],
            [0,rimwidth,0], 
            [traysize/2,rimwidth,0], 
            [0,rimwidth,legheight]
        ], 
        [ [0,1,2], [5,4,3], [2,1,4,5], [0,3,4,1], [0,2,5,3] ]);    
        
    }

    translate([legsupport/2,legsupport/2,legheight/2]) 
      cube([leghole,leghole,legheight+1], center = true);
    translate([legsupport/2,legsupport/2 + traysize - legsupport + rimwidth,legheight/2]) 
      cube([leghole,leghole,legheight+1], center = true);
  

}

