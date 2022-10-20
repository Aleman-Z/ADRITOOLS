function idx = myFind( x )
     allIdx = 1:numel(x) ;
     idx = allIdx(x ~= 0) ;
     idx=idx.';
 end