stakes = 4;
rails = 7;
stakewidth = 5;
railwidth = 2;
railheight = 5;
height = 200;
width = 240;
stakedepth = 50;

stakegap = (width-stakewidth) / (stakes - 1);

for (pos = [0 : stakegap : width - stakewidth]) {
    translate([pos, 0, -stakedepth]) Stake(stakewidth, height + stakedepth);
}

railgap = (height - railheight) / (rails - 1);

for (pos = [0 : railgap : height - railheight]){
    translate([0, 0, pos]) Rail(width, railheight);
}


module Stake(width, height) {
    difference() {
        cube([width, width, height]);
        translate([0,0,-width*2]) rotate([0,-45,0]) cube(width*2);
    }
}
module Rail(length, height) {
    cube([length, railwidth, height]);
}