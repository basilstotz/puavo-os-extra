#include <stdio.h>

main()
{
  setuid(0);
  system("/opt/v4l2loopback/install.sh");
}
