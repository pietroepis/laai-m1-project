include "globals.mzn";

var 0..11: h;
var 0..59: m;
var 0..59: s;
var 0..360: h_degree;
var 0..360: m_degree;
var 0..360: s_degree;

constraint h_degree = (h * 30);
constraint m_degree = (m * 6);
constraint s_degree = (s * 6);
constraint abs(h_degree - m_degree) = 120;
constraint abs(h_degree - s_degree) = 120;
constraint abs(m_degree - s_degree) = 120;

solve satisfy;