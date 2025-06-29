function [dout_i, dout_q] = input_signal(INPUT_WIDTH, CHANNEL_NUM, data_i, data_q)

%% ת16����    
data_fpga_real = char(data_i);
data_fpga_imag = char(data_q);
%% 16����ת10����
data_in_real_dec = hex2dec(data_fpga_real);
data_in_imag_dec = hex2dec(data_fpga_imag);

%% ����
data_fpga_sig_i = data_in_real_dec-(data_in_real_dec>=2^(INPUT_WIDTH-1))*2^(INPUT_WIDTH);
data_fpga_sig_q = data_in_imag_dec-(data_in_imag_dec>=2^(INPUT_WIDTH-1))*2^(INPUT_WIDTH);

%% �⽻֯
dout_i = data_fpga_sig_i(1:CHANNEL_NUM:end).';
dout_q = data_fpga_sig_q(1:CHANNEL_NUM:end).';

end


