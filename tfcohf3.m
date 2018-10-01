function varargout = tfcohf3(x,y,nfft,spec_win,sm_win1, sm_win2,tstep,fs)
% TFCOHF3 Time-frequency coherency
% Estimates the complex coherency coefficients using Fourier decomposition 
% of vector X and vector Y. The cross and auto spectra are smoothed with 
% non-identical smoothing windows (sm_win1 and sm_win2).
%
% Time-frequency coherency is computed by smoothing the cross- and autospectra
% using a smoothing kernel specficied by SM_WIN. The cross- and autospectra
% are estimated using Welch's periodogram method. Signals are dived into overlapping
% sections, each of which is detrended and windowed by the SPEC_WIN parameter,
% then zero padded to length NFFT. TSTEP defines the number of samples the
% window is slided forward. The spectra X, Y, and XY are estimated for each
% segment.Spectral coefficients are then smoothed for the estimation of 
% time-frequency coherency using identical smoothing windows.
%
% ARGUMENTS:
%           x           --  signal 1 (vector)
%           y           --  signal 2 (vector)
%           nfft        --  length of fft, zero-padded if spec_win has less
%                           than n points
%           spec_win    --  length of window in samples used for spectral
%                           decomposition (Hamming window)
%           sm_win1     --  length of window used for smoothing the cross
%                           spectrum (Gauss window)
%           sm_win2     --  length of window used for smoothing the auto
%                           spectra (Gauss window)
%           tstep       --  number of samples the window is slided forward
%           fs          --  sample frequeny
%
% If length(sm_win)==1 it specifies the length of the smoothing window in 
% seconds. If length(sm_win)==2 sm_win(1) specifies the height of the kernel 
% in hertz and sm_win(2) the width of the kernel in seconds. Otherwise 
% sm_win specifies the actual smoothing kernel.
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
% >>sm_win1 = [2,1.5]; sm_win2 = [100 5];
% >>tfcohf3(x,y,nfft,spec_win,sm_win1,sm_win2,tstep,fs)
%   
% Time-frequency coherency between two signals sampled at 200 Hz of 30s 
% duration for which synchronization jumps from 20 to 40 Hz. Data is 
% decomposed using a 1s window. Cross spectrum is smoothed over an 
% time-frequency area of 2Hz by 1.5s and the auto spectra over an 
% time-frequency area of 100Hz by 5s.
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
% See also FFT CONV

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

% smooth cross spectrum using sm_win1
if numel(sm_win1) == 1;
    window = gausswin(round(sm_win1*fs/tstep));
elseif numel(sm_win1) == 2
    window = gausswin(round(sm_win1(1)*nfft/fs))*gausswin(round(sm_win1(2)*fs/tstep))';
else
    window = sm_win1;
end
window = window/sum(window(:));

if length(window)==numel(window)
    for f = 1:size(X,1)
        XY(f,:) = conv(XY(f,:),window,'same');
    end
else
    XY = conv2(XY,window,'same');
end
    
% smooth auto spectra using sm_win2
if numel(sm_win2) == 1;
    window = gausswin(round(sm_win2*fs/tstep));
elseif numel(sm_win2) == 2
    window = gausswin(round(sm_win2(1)*nfft/fs))*gausswin(round(sm_win2(2)*fs/tstep))';
else
    window = sm_win2;
end
window = window/sum(window(:));

if length(window)==numel(window)
    for f = 1:size(X,1)
        X(f,:) = conv(X(f,:),window,'same');
        Y(f,:) = conv(Y(f,:),window,'same');
    end
else
    X = conv2(X,window,'same');
    Y = conv2(Y,window,'same');
end

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
