OUT		= freetron
SRC		= ${wildcard *.cpp}
OBJ		= ${SRC:.cpp=.o}

CC		= g++
CFLAGS		:= -g -funroll-loops -O3 -std=c++11 -Wall ${CFLAGS}

CFLAGS		+= $(shell GraphicsMagick++-config --cppflags --cxxflags)
LDFLAGS		+= $(shell GraphicsMagick++-config --ldflags --libs)

PREFIX		?= /usr/local
MANPREFIX	?= ${PREFIX}/share/man

all: ${OUT}

${OUT}: ${OBJ}
	${CC} -o $@ ${OBJ} ${LDFLAGS}

.cpp.o:
	${CC} -c -o $@ $< ${CFLAGS}

install:
	install -Dm755 ${OUT} ${DESTDIR}${PREFIX}/bin/freetron
	
uninstall:
	rm -f ${DESTDIR}${PREFIX}/bin/freetron

clean:
	#${MAKE} -C test clean
	${RM} ${OUT} ${OBJ}

.PHONY: all tests install uninstall clean
