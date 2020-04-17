* Simulate

  Run the commands:

  iverilog -o tb_alu lib.v alu.v tb_alu.v
  vvp tb_alu
  
  Above commands should produce the tb_alu.vcd file.

* View waveforms

  Run the command:

  gtkwave tb_alu.vcd

  Navigate the module hierarchy in the upper left window. Select
  signals to be viewed in the lower left window. To view the selected
  waveforms, drag and drop them into the panel on the left of the
  window on the right.

* Testbench

  The inputs to the alu can be changed by modifying the test vectors
  specified on lines 14 to 21 of tb_alu.v. Additional test vectors can
  also be added. Be sure to change value of TESTVECS on line 2 if
  number of test vectors is modified.

* Tips

  - Use ctrl+click or shift+click to select multiple signals for drag
    and drop in the lower left window

  - On the toolbar to the left of the '+' button is the 'zoom fit'
    button. Use it to fit the entire length of the waveforms into the
    waveform window. The '+' and '-' buttons can be used to zoom in
    and out.

  - Right clicking on symbol names in the left panel of the waveform
    window can be used to change the format of the signals, and also
    group signals together.
  
  - Double clicking on vector symbol names in the left panel of the
    waveform window shows individual waveform for each signal forming
    the vector.
  
  - After resimulating (re-executing iverilog and vvp) it is not
    necessary to close and restart gtkwave. The updated VCD file can
    be loaded into the currently running gtkwave by selecting the
    'Reload Waveform' entry under the File menu (keystroke:
    shift+ctrl+r).
