
 add_fsm_encoding \
       {CMD_FIFO_TO_WB_MASTER.current_state} \
       { }  \
       {{000 000} {001 001} {010 010} {011 011} {100 100} {101 101} {110 110} {111 111} }

 add_fsm_encoding \
       {LCD_MEM_CONTROL.state} \
       { }  \
       {{0000 0010} {0001 0011} {0010 0100} {0011 0101} {0100 0110} {0101 0111} {0110 1000} {0111 0001} {1000 0000} }

 add_fsm_encoding \
       {LCD_CONTROLLER.wb_if_state} \
       { }  \
       {{000 000} {001 001} {010 010} {011 011} {100 100} {101 101} }
