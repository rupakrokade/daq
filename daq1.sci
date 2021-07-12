global in_old temp_old
in_old=0.0;
in_save=0;
valve_save=0;
function [in,valve]=daq(a)
    //dummy=10;
    global in_old
    in = readserial(handl)
    //disp(in)
    in=strtod(in)
    
    if isnan(in)
        in=in_old
    end
    
        if in<1
        in=in_old
    end
    
    in_old=in

    valve=a
    writeserial(handl,ascii(valve))
    in_save=[in_save;in]
    valve_save=[valve_save;valve]
    
    epoch=getdate('s');
    dt=getdate();
    ms=dt(10);
    epoch=(epoch*1000)+ms;
    
    A = [epoch,in,valve];

    fdfh = file('open','data.txt','unknown');
    
    file('last', fdfh)
    
    write(fdfh,A,'(7(f15.1,3x))');
    
    file('close', fdfh);
endfunction
