set_false_path -from [get_cells -hier -filter {(NAME =~ INST_CLK_DIVIDER_BIKE/*) && IS_SEQUENTIAL}] -to *

set_false_path -from [get_cells -hier -filter {(NAME =~ PULSE_SHAPE_REED/*) && IS_SEQUENTIAL}] -to *
set_false_path -from * -to [get_cells -hier -filter {(NAME =~ PULSE_SHAPE_REED/*) && IS_SEQUENTIAL}]

set_false_path -from [get_cells -hier -filter {(NAME =~ PULSE_SHAPE_MODE/*) && IS_SEQUENTIAL}] -to *
set_false_path -from * -to [get_cells -hier -filter {(NAME =~ PULSE_SHAPE_MODE/*) && IS_SEQUENTIAL}]

set_false_path -from [get_cells -hier -filter {(NAME =~ FDRE_CIRC*) && IS_SEQUENTIAL}] -to *
set_false_path -from * -to [get_cells -hier -filter {(NAME =~ FDRE_CIRC*) && IS_SEQUENTIAL}]