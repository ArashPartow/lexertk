#
# *****************************************************************
# *                 Simple C++ Lexer Toolkit Library              *
# *                                                               *
# * Author: Arash Partow (2001)                                   *
# * URL:  http://www.partow.net/programming/lexertk/index.html    *
# *                                                               *
# * Copyright notice:                                             *
# * Free use of the Simple C++ Lexer Toolkit Library is permitted *
# * under the guidelines and in accordance with the MIT License.  *
# * http://www.opensource.org/licenses/MIT                        *
# *                                                               *
# *****************************************************************
#


COMPILER         = -c++
OPTIMIZATION_OPT = -O2
BASE_OPTIONS     = -ansi -pedantic-errors -Wall -Wextra -Werror -Wno-long-long
OPTIONS          = $(BASE_OPTIONS) $(OPTIMIZATION_OPT) -o
LINKER_OPT       = -L/usr/lib -lstdc++

BUILD_LIST+=lexertk_examples

all: $(BUILD_LIST)

lexertk_examples: lexertk_examples.cpp lexertk.hpp
	$(COMPILER) $(OPTIONS) lexertk_examples lexertk_examples.cpp $(LINKER_OPT)

strip_bin:
	strip -s lexertk_examples

valgrind_check:
	valgrind --leak-check=full --show-reachable=yes --track-origins=yes --log-file=lexertk_examples.log -v ./lexertk_examples

clean:
	rm -f core.* *~ *.o *.bak *stackdump gmon.out *.gcda *.gcno *.gcnor *.gch
