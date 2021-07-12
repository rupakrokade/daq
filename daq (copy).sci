global out_old temp_old
out_old=0.0;
function [heat,temp]=daq(a)
    global out_old
    out = readserial(handl)
    //disp(out)
    out=strtod(out)
    
    if isnan(out)
        out=out_old
    end
    
        if out<1
        out=out_old
    end
    
    round_out=round(out)
    //pause
    if round_out>out
        heat=round_out-1
    else
        heat=round_out
    end
    
    temp=(out-heat)*100
    
    if temp==0
        temp=temp_old
    end
    
    temp_old=temp
    out_old=out
endfunction
