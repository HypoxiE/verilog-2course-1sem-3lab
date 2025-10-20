module and_(
	input wire a,
	input wire b,
	output wire c
);
	assign c = a & b;
endmodule

module or_(
	input wire a,
	input wire b,
	output wire c
);
	assign c = a | b;
endmodule

module not_(
	input wire a,
	output wire b
);
	assign b = ~a;
endmodule

module nand_(
	input wire a,
	input wire b,
	output wire c
);
	assign c = ~(a & b);
endmodule