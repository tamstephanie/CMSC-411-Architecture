#include <stdio.h>

int main() {
  // hard-coded "matrices"
  int A[4] = {1, 2, 3, 4};
  int B[4] = {9, 8, 7, 6};

  // C = AB
  int C = 0;
  for (int i = 0; i < 4; i++)
    C += A[i] * B[i];
  printf ("C = %d\n", C);

  // D = BA
  int D[4][4];
  for (int i = 0; i < 4; i++) {
    for (int j = 0; j < 4; j++) {
      D[i][j] = B[i] * A[j];
    }
  }

  // output matrix
  printf("D = ");
  for (int i = 0; i < 4; i++) {
    for (int j = 0; j < 4; j++) {
      printf("%d ", D[i][j]);
    }
    printf("\n    ");
  }
  printf("\n");

  return 0;
}
