function id=center2id(center)

th = center(1); ph = center(2);
if th == 0 && ph == 0
    id = 1;
elseif th == pi/2 && ph == 0
    id = 2;
elseif (th == pi || th == -pi)  && ph == 0
    id = 3;
elseif th == -pi/2 && ph == 0
    id = 4;
elseif th == 0 && ph == -pi/2
    id = 5;
elseif th == 0 && ph == pi/2
    id = 6;
end