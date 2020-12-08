//#include <system.h>
#include <iostream>
#include "../../system.h"
using namespace std;
class SayHello: public System{
public:
    int b = 5;
protected:
    int a = 10;
    void hello();
};