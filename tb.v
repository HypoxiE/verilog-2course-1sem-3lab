`timescale 1ns/1ps


module tb;
	
	// Задание 1
	reg inp; // Регистор входа
	wire w_not_and_not_; // Провод между 
	wire clock;
	wire Q, Q_inv;

	not_ u_not (.a(inp), .b(w_not_and_not_));
	nand_ u_nand (.a(w_not_and_not_), .b(inp), .c(clock));
	t_trigger u_t (.Clock(clock), .Q(Q), .Q_inv(Q_inv));

	initial begin
		inp = 0;
		forever #5 inp = ~inp;
	end

	initial begin
		$dumpfile("out.vcd");
		$dumpvars(0, tb);

		#100 $finish;
	end
	
endmodule