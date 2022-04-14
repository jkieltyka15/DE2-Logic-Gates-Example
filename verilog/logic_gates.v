// -----------------------------------------------------------------------------
// TOP LEVEL MODULE: Demonstrates AND, OR, XOR and NOT gates on a DE2-115 Board. 
// This module instantiates:
// - one AND gate
// - one OR gate
// - one XOR gate
// - two NOT gates
// -----------------------------------------------------------------------------
module logic_gates(SW, KEY, LEDR, LEDG);

	// define inputs
	input [1:0] SW;
	input [3:0] KEY;
	
	// define outputs
	output [1:0] LEDR;
	output [7:0] LEDG;
	
	// define internal wires
	wire andGate, orGate, xorGate, notGate_0, notGate_1;
	
	// display input on red LEDs
	assign LEDR = SW; 

	// configure logic gates
	and_gate and0 (SW[0], SW[1], andGate);
	or_gate or0 (SW[0], SW[1], orGate);
	xor_gate xor0 (SW[0], SW[1], xorGate);
	not_gate not0 (SW[0], notGate_0);
	not_gate not1 (SW[1], notGate_1);
	
	// display output on green LEDs when gate key is pressed
	assign LEDG[0] = ~KEY[0] & andGate;
	assign LEDG[2] = ~KEY[1] & orGate;
	assign LEDG[4] = ~KEY[2] & xorGate;
	assign LEDG[6] = ~KEY[3] & notGate_0;
	assign LEDG[7] = ~KEY[3] & notGate_1;
	
endmodule

// -----------------------------------------------------------------------------
// SUB-MODULE: Two-in-one-out AND gate.
// -----------------------------------------------------------------------------
module and_gate(a, b, x);

	input wire a, b;
	output wire x;
	
	assign x = a & b;
	
endmodule

// -----------------------------------------------------------------------------
// SUB-MODULE: Two-in-one-out OR gate.
// -----------------------------------------------------------------------------
module or_gate(a, b, x);

	input wire a, b;
	output wire x;
	
	assign x = a | b;
	
endmodule

// -----------------------------------------------------------------------------
// SUB-MODULE: Two-in-one-out XOR gate.
// -----------------------------------------------------------------------------
module xor_gate(a, b, x);

	input wire a, b;
	output wire x;
	
	assign x = a ^ b;
	
endmodule

// -----------------------------------------------------------------------------
// SUB-MODULE: One-in-one-out NOT gate.
// -----------------------------------------------------------------------------
module not_gate(a, x);

	input wire a;
	output wire x;
	
	assign x = ~a;
	
endmodule