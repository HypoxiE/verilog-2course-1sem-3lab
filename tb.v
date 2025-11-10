`timescale 1ns/1ps


module tb;
	
	//// Задание 1
	reg inp; // Регистор входа
	wire t_1; // Последовательные соединения инверторов
	wire clock; // тактовый вход
	wire Q, Q_inv; // выходы

	not_ u_not_1 (.a(inp), .b(t_1));
	nand_ u_nand (.a(t_1), .b(inp), .c(clock));
	t_trigger u_t (.Clock(clock), .Q(Q), .Q_inv(Q_inv));

	initial begin
		inp = 0;
		forever #500000 inp = ~inp; // цикл: каждые 0.5 ms inp меняется
	end

	initial begin
		$dumpfile("out.vcd");
		$dumpvars(0, tb);

		#10000000 $finish; // ожидаем 10 4ms и завершаем программу
	end

	// Задание 2
	//reg inp;
	//wire C;
	//wire Q;

	//not_ u_not (.a(inp), .b(C));
	//d_trigger u_t (.Clock(C), .D(inp), .Q(Q));

	//initial begin
	//	inp = 0;
	//	forever #500000 inp = ~inp; // генерируем тактовые импульcы 1000Hz/50%
	//end

	//initial begin
	//	$dumpfile("out.vcd");
	//	$dumpvars(0, tb);
	//	#10000000 $finish;
	//end
	
endmodule



// весь код
//module tb;
//	reg inp; // Регистр входа
//	wire t_1; // Последовательные соединения инверторов
//	wire clock; // тактовый вход
//	wire Q, Q_inv; // выходы
//	not_ u_not_1 (.a(inp), .b(t_1));
//	nand_ u_nand (.a(t_1), .b(inp), .c(clock));
//	t_trigger u_t (.Clock(clock), .Q(Q), .Q_inv(Q_inv));
//	initial begin
//		inp = 0;
//		forever #500000 inp = ~inp; // цикл: каждые 0.5 ms inp меняется
//	end
//	initial begin
//		$dumpfile("out.vcd");
//		$dumpvars(0, tb);

//		#10000000 $finish; // ожидаем 10 ms и завершаем программу
//	end
//endmodule
//module not_(input wire a, output wire b);
//	assign #10 b = ~a; // симулируем задержку 10нс
//endmodule
//module nand_(input wire a, input wire b, output wire c);
//	assign #1 c = ~(a & b); // симулируем задержку 1нс
//endmodule
//module t_trigger (input  wire Clock, output reg  Q, output wire Q_inv);
//    assign Q_inv = ~Q;
//	initial Q = 0;
//    always @(posedge Clock) begin
//    	Q <= Q_inv;
//    end
//endmodule
