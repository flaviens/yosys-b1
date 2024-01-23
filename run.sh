# Optimize.
VERILOG_INPUT=top_noopt.sv VERILOG_OUTPUT=top_opt.sv yosys -c yosys_script.ys

# Prepare Icarus.
mkdir -p icarus_obj_dir_noopt && rm -f icarus_obj_dir_noopt/Vtop && iverilog -g2012 -o icarus_obj_dir_noopt/Vtop top_noopt.sv tb_icarus.sv
mkdir -p icarus_obj_dir_opt && rm -f icarus_obj_dir_opt/Vtop && iverilog -g2012 -o icarus_obj_dir_opt/Vtop top_opt.sv tb_icarus.sv

# Run the simulations, which are unexpectedly different.
echo
echo "No optimization":
vvp icarus_obj_dir_noopt/Vtop 
echo "After optimization":
vvp icarus_obj_dir_opt/Vtop 
