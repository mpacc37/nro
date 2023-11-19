#include <iostream>
#include <cmath>

using namespace std;

double arc(double x, double n) {
    double suma = 0;

    for (int i = 0; i < n; i++) {
        suma += pow(-1, i) * pow(x, 2 * i + 1) / (2 * i + 1);
    }

    return suma;
}

int main() {
    double sp_meja = 0;
    double zg_meja = M_PI_4;

    int tocke = 1000;
    double xi[tocke];

    for (int i = 0; i < tocke; i++) {
        xi[i] = static_cast<double>(i) * M_PI / (4 * (tocke - 1));
    }

    double suma = 0;
    for (int i = 1; i < tocke - 1; i++) {
        suma += exp(3 * xi[i]) * arc(xi[i] / 2, 10);
    }

    double integral_trapezna = (zg_meja - sp_meja) / (2 * tocke) * (2 * suma + exp(3 * sp_meja) * arc(sp_meja / 2, 10) + exp(3 * zg_meja) * arc(zg_meja / 2, 10));


    std::cout << integral_trapezna << std::endl;

    return 0;
}