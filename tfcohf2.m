function varargout = tfcohf2(x,y,nfft,spec_win,tstep,fs)
% TFCOHF2 Time-frequency coherency
% Estimates the complex coherency coefficients using Fourier decomposition 
% of vector X and vector Y. Only the auto spectra are smoothed with 
% using the temporal ensemble average.
%
% The cross- and autospectra are estimated using Welch's periodogram method. 
% Signals are dived into overlapping sections, each of which is detrended 
% and windowed by the SPEC_WIN parameter, then zero padded to length NFFT. 
% TSTEP defines the number of samples the window is slided forward. The 
% spectra X, Y, and XY are estimated for each segment. The temporal cross
% spectrum is than normalized by the ensemble averaged auto spectra. 
%
% ARGUMENTS:
%           x           --  signal 1 (vector)
%           y           --  signal 2 (vector)
%           nfft        --  length of fft, zero-padded if spec_win has less
%                           than n points
%           spec_win    --  length of window in samples used for spectral
%                           decomposition (Hamming window)
%           tstep       --  number of samples the window is slided forward
%           fs          --  sample frequeny
%
%
% OUTPUTS:
%           C           --  complex valued time-frequency coherency
%                           [N,M] matrix with N frequencies and M
%                           time-points
%           F           --  frequency vector
%           T           --  time vector
%
% Note that due to the use of non-identical smoothing windows the resulting
% time-frequency coherency is not bound to [0,1].
% If no outputs are specified, time-frequency coherency is plotted.
%
% EXAMPLE:
% >>fs = 200; spec_win = fs; nfft = fs*3; tstep = fs/5;
% >>x1 = sin(2*pi*20*(1:fs*10)/fs); x2 = sin(2*pi*40*(1:fs*10)/fs);
% >>x = [x1,x1,x2]+randn(1,fs*30)/20; y = [x1,x2,x2]+randn(1,fs*30)/20;
% >>tfcohf2(x,y,nfft,spec_win,tstep,fs)
%   
% Time-frequency coherency between two signals sampled at 200 Hz of 30s 
% duration for which synchronization jumps from 20 to 40 Hz. Data is 
% decomposed using a 1s window. 
%
% Please cite the following paper when using this code:
% Mehrkanoon S, Breakspear M, Daffertshofer A, Boonstra TW (2013). Non-
% identical smoothing operators for estimating time-frequency interdependence 
% in electrophysiological recordings. EURASIP Journal on Advances in Signal 
% Processing 2013, 2013:73. doi:10.1186/1687-6180-2013-73
%
% T.W. Boonstra and S. Mehrkanoon          9-October-2012
% Systems Neuroscience Group, UNSW, Australia.
%
% See also FFT

if length(spec_win)==1
    wl = spec_win;
else
    wl = length(spec_win);
end

% Zero-padding of signal
x_new = zeros(length(x)+wl,1);
y_new = x_new;
x_new(fix(wl/2):fix(wl/2)+length(x)-1) = x;
y_new(fix(wl/2):fix(wl/2)+length(x)-1) = y;

% Compute Fourier coefficients
if rem(nfft,2),    % nfft odd
    select = [1:(nfft+1)/2];
else
    select = [1:nfft/2+1];   % include DC AND Nyquist
end

X = zeros(length(select),fix(length(x)/tstep)+1);
Y = X;

if length(spec_win)==1
    window = hamming(spec_win);
else
    window = spec_win;
end
index = 1:wl;
for k = 1:fix(length(x)/tstep)+1
    temp = fft(detrend(x_new(index),'constant').*window,nfft);
    X(:,k) = temp(select);
    temp = fft(detrend(y_new(index),'constant').*window,nfft);
    Y(:,k) = temp(select);
    
    index = index+tstep;
end

% compute cross and auto spectra
XY = X .* conj(Y);
X = abs(X).^2;
Y = abs(Y).^2;

% only smooth the autospectra 
X = repmat(mean(X,2),1,size(X,2));
Y = repmat(mean(Y,2),1,size(X,2));
    
% compute tfcoh
Cxy = XY./sqrt(X.*Y);

% if no output arguments plot results
if nargout == 1
    varargout{1} = Cxy;
elseif nargout == 3;
    varargout{1} = Cxy;
    varargout{2} = (select - 1)'*fs/nfft;
    varargout{3} = [1:tstep:length(x)]/fs;
else
    figure
    freq = (select - 1)'*fs/nfft;
    time = [1:tstep:length(x)]/fs;
    
    subplot(2,1,1)
    imagesc(time,freq,abs(Cxy))
    title('time-frequency coherency')
    xlabel('time [s]')
    ylabel('frequency [Hz]')
    
        subplot(2,1,2)
    imagesc(time,freq,tanh(abs(Cxy)))
    title('tanh of coherency')
    xlabel('time [s]')
    ylabel('frequency [Hz]')
end
