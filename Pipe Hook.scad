diam = 47; // pipe diameter
radius = diam/2;
claspwidth = 10; //how wide the clasp is
claspthickness = 15; //how thick the clasp is
claspouterdiam = diam + claspthickness * 2;

bracerz = 15;
bracerwidth = 20;


difference() {
    rotate([90,0,0]) cylinder(h = claspwidth, d = claspouterdiam, center = true);
    rotate([90,0,0]) cylinder(h = claspwidth + 1, d = diam, center = true);
    translate([0,0,(0- claspouterdiam/4)]) 
        cube([claspouterdiam, claspwidth + 1,claspouterdiam/2], center = true);
}
//vertical bar
translate([claspthickness/2 + radius, 0, 0 - diam/2]) 
    cube([claspthickness, claspwidth, diam], center = true);
//horizontal brace
translate([0-(radius + claspthickness), -claspwidth/2, 0 - (bracerz + diam)])
    cube([claspouterdiam + bracerwidth, claspwidth, bracerz], center = false);
//vertical hook bar
translate([radius + claspthickness + bracerwidth - claspwidth, -claspwidth/2, -diam])
    cube([claspwidth, claspwidth, diam], center = false);