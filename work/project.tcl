set projDir "C:/Users/Peng Hiang/Documents/mojo/io/work/planAhead"
set projName "io"
set topName top
set device xc6slx9-2tqg144
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/Peng Hiang/Documents/mojo/io/work/verilog/mojo_top_0.v" "C:/Users/Peng Hiang/Documents/mojo/io/work/verilog/reset_conditioner_1.v" "C:/Users/Peng Hiang/Documents/mojo/io/work/verilog/edge_detector_2.v" "C:/Users/Peng Hiang/Documents/mojo/io/work/verilog/multi_seven_seg_3.v" "C:/Users/Peng Hiang/Documents/mojo/io/work/verilog/multi_dec_ctr_4.v" "C:/Users/Peng Hiang/Documents/mojo/io/work/verilog/counter_5.v" "C:/Users/Peng Hiang/Documents/mojo/io/work/verilog/test_fsm_refactor_6.v" "C:/Users/Peng Hiang/Documents/mojo/io/work/verilog/test_auto_clock_7.v" "C:/Users/Peng Hiang/Documents/mojo/io/work/verilog/test_input_8.v" "C:/Users/Peng Hiang/Documents/mojo/io/work/verilog/counter_9.v" "C:/Users/Peng Hiang/Documents/mojo/io/work/verilog/seven_seg_10.v" "C:/Users/Peng Hiang/Documents/mojo/io/work/verilog/decoder_11.v" "C:/Users/Peng Hiang/Documents/mojo/io/work/verilog/decimal_counter_12.v" "C:/Users/Peng Hiang/Documents/mojo/io/work/verilog/test_input_8.v"]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set ucfSources [list "C:/Users/Peng\ Hiang/Documents/mojo/io/constraint/test_io.ucf" "C:/Program\ Files/Mojo\ IDE/library/components/io_shield.ucf" "C:/Program\ Files/Mojo\ IDE/library/components/mojo.ucf"]
import_files -fileset [get_filesets constrs_1] -force -norecurse $ucfSources
set_property -name {steps.bitgen.args.More Options} -value {-g Binary:Yes -g Compress} -objects [get_runs impl_1]
set_property steps.map.args.mt on [get_runs impl_1]
set_property steps.map.args.pr b [get_runs impl_1]
set_property steps.par.args.mt on [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1
wait_on_run synth_1
launch_runs -runs impl_1
wait_on_run impl_1
launch_runs impl_1 -to_step Bitgen
wait_on_run impl_1
