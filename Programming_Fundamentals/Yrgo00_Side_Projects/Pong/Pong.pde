
float p1P, p2P; PVector ballVel,						 ballPos; int				ballSz=8,					plSpd=10;			float pSpeed=4,
speedDifault=4,speed=4,spdA=.5;int pp1			   ,pp2,p1C, p2C;boolean ai1		=true,ai2=					true; int		hmbsd2,w8; void setup()
{p1P=p2P=				 height/2;stroke 		  (255);hmbsd2	 =( height )-		ballSz/2;w8 				=width/8;	   textSize(64   );{}resBall
();/**/{}					   fullScreen		 ();}void  			  draw() {		if(ai1){if (				ballVel.x	  <0f)p1C=(		    int)(norm
((abs(abs 						(ballPos.y		 + ( w8 -			  ballPos. 		x)/ballVel.x*				ballVel.y	  ) * -1f+			 hmbsd2)*
-1+hmbsd2						 )-p1P,-1,		1)+0.5);			   else p1C 	=(int) (norm (				height/2-	 p1P,-1,1			  )+0.5);}
float p1V						 =min(max(		p1C , -					pSpeed)		,pSpeed);if(ai2				){;{;}if(	 ballVel			   .x > 0)
p2C=(int)						 ( norm ((		abs(abs					(bp().y		+( width-  w8-bp			() . x) /	 ballVel			   .x*bv()
.y )*-1 +						hmbsd2)*-1		+hmbsd2					)-p2P,-		1,1)+0.5)	;else 			p2C=(int)	 ( norm(			   height/
2-p2P,-1,					   1)+0.5f);}		ballPos					. add (		ballVel);	 float 			p2V=min (	 max(p2C
,-pSpeed)				 ,pSpeed); p1P = 		min(max					(plSpd, 	p1P+p1V),	  height 		- plSpd);	 p2P=min
(height-plSpd,max(plSpd,p2P+p2V)); if(			ballPos					.y <= (		ballSz/2)	   ||  (		ballPos.y	 >=hmbsd2		)) ballVel.y =-
ballVel.y;if(ballPos.x<w8+ballSz				){if(bp					().x>w8 	-ballSz&&		(p1P+ 		(plSpd) +	 ballSz)		>= ballPos.y &&
p1P-plSpd										-ballSz					<=bp().		y&&bv().x		 < 0){		speed  +=	 spdA;{}			   ballVel.
x=ballPos										.x -w8;					ballVel		.y=bp().y		  - p1P		; ballVel	 .mult (			    speed);
ballVel .										limit (					speed);		} else if		   (bp()	.x < 16){	 pp2++ ;				resBall
();}}else										if((bp(					).x ) >		((width -			w8)	- 	ballSz)){	 if((bp(				).x) <(
width-w8+										ballSz)					&&(p2P+ 	plSpd ) +			 ballSz >= bp().y	 && p2P-				plSpd -
ballSz <=										ballPos					.y&&bv(		).x > 0){			  {}ballVel = new	 PVector				(bp().x
-width-w8,										ballPos					.y-p2P)		;ballVel.			   mult ( speed);	 ballVel				.limit(
speed ) ;										 speed+=			   spdA; }		else if (				ballPos .x >(	  width -			   16) ) {
pp1++;{};										 resBall			   ();}}ba		(); line(				 width/2, 16,	  width/2			   ,height
-16);text										  ((pp1),width  /4,80);text(		pp2,width 	   			  -width/4,80	   );ellipse(bp  ().x,ballPos
.y,ballSz										    ,ballSz);rect((width/8			-4), p1P-				   plSpd, 4 ,		plSpd *2 ); rect( width-
width/8-4,												 p2P-plSpd,4,				plSpd*2);					} PVector			  bp() { return
ballPos ; }
PVector bv(){return ballVel;}void ba(){background(0);}void resBall(){speed=speedDifault;ballPos=new PVector(width/2, height/2);if(random(0,100)<50)ballVel=
new PVector(2,random(-4,4));else ballVel=new PVector(-2,random(-4,4));}void keyPressed(){keyCodeInput(keyCode,true);keyInput(key,true);}void keyReleased(){
keyCodeInput(keyCode,false);keyInput(key,false);}void keyCodeInput(int k,boolean b){switch(k){case UP:if(b)p2C= -10;else p2C=0;ai2=false;break;case DOWN:if
(b)p2C=10;else p2C=0;ai2=false;break;}}void keyInput(int k,boolean b){switch(k){case'w':if(b)p1C= -10;else p1C=0;ai1=false;break;case's':if(b)p1C=10;else 
p1C=0;ai1=false;break;}}