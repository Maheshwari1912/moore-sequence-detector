# moore-sequence-detector

**Aim of the Moore Sequence Detector**

The aim of this Moore finite state machine (FSM) sequence detector is to identify a specific sequence of bits in an input stream and produce an output signal (out=1) when the sequence is detected. 

The Verilog code detects the sequence "1101" and operates based on the Moore machine model, where the output depends only on the present state, not the input.

**Introduction to Moore FSM**

A Moore finite state machine (FSM) is a type of sequential circuit where the output depends only on the present state, regardless of the input. 

This makes Moore machines more stable compared to Mealy machines, where the output depends on both the present state and the input.

**In this sequence detector:**

State transitions occur on the rising edge of the clock (clk).

A reset (rst) initializes the FSM to the starting state (s0).

Output (out) is updated based on the state, making it a pure Moore machine.

**Working of the Moore Sequence Detector**

The FSM transitions through five states (s0 to s4) to detect the "1101" sequence in the input (in):

**State Transition Explanation**

**s0 (Initial State):**

If in = 1, move to s1 (potential start of sequence).

If in = 0, remain in s0.

**s1 (First '1' detected):**

If in = 1, move to s2 (second '1' detected).

If in = 0, return to s0.

**s2 (Second '1' detected):**

If in = 0, move to s3 (third bit '0' detected).

If in = 1, stay in s2.

**s3 (Third bit '0' detected):**

If in = 1, move to s4 (fourth bit '1' detected, sequence completed).

If in = 0, return to s0.

**s4 (Sequence "1101" detected):**

out = 1 to indicate detection.

If in = 1, transition to s2 (potential next sequence start).

If in = 0, return to s0.

**Summary of FSM Functionality**

Detects the "1101" sequence.

Uses five states (s0 to s4).

**Moore Machine Design:** Output depends only on present state (s4 → out = 1).

Resets on rst = 1 to reinitialize detection.

**simulation results:**

![image](https://github.com/user-attachments/assets/67168eb8-5e62-487c-80fc-8d1a3fcf2de8)
