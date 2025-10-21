`timescale 1ns/1ps


module tb;
	
	//// Задание 1
	//reg inp; // Регистор входа
	//wire w_not_and_not_; // Соединение c точкой 1
	//wire clock; // тактовый вход
	//wire Q, Q_inv; // выходы

	//not_ u_not (.a(inp), .b(w_not_and_not_));
	//nand_ u_nand (.a(w_not_and_not_), .b(inp), .c(clock));
	//t_trigger u_t (.Clock(clock), .Q(Q), .Q_inv(Q_inv));

	//initial begin
	//	inp = 0;
	//	forever #20 inp = ~inp; // цикл: каждые 20 нс inp меняется
	//end

	//initial begin
	//	$dumpfile("out.vcd");
	//	$dumpvars(0, tb);

	//	#500 $finish; // ожидаем 500 нс и завершаем программу
	//end

	// Задание 2
	reg inp;
	wire C;
	wire Q;

	not_ u_not (.a(inp), .b(C));
	d_trigger u_t (.Clock(C), .D(inp), .Q(Q));

	initial begin
		inp = 0;
		forever #500000 inp = ~inp; // генерируем тактовые импульcы 1000Hz/50%
	end

	initial begin
		$dumpfile("out.vcd");
		$dumpvars(0, tb);
		#10000000 $finish;
	end
	
endmodule