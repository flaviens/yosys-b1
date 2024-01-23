# Mis-optimization in Yosys

Tested with `Yosys 0.37+21 (git sha1 3d9e44d18, clang 10.0.0-4ubuntu1 -fPIC -Os)`.
I confirmed the mismatch with simulations with Icarus Verilog (in this repository) and independently also with Verilator.

How to reproduce:
```bash
bash run.sh
```

This will:
1. Create `top_opt.sv`, the optimized version of `top_noopt.sv`.
2. Run a simple simulation of `top_opt.sv` and `top_noopt.sv` with Icarus Verilog.
3. Report a mismatch.

Expected output (the output should not be affected by the optimizations):
```bash
No optimization:
Output bit 32: 0.
After optimization:
Output bit 32: 0.
```

Actual output:
```bash
No optimization:
Output bit 32: 0.
After optimization:
Output bit 32: 1.
```
