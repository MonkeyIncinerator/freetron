/*
 * Code to read the values
 */

#ifndef H_READ
#define H_READ

#include <map>
#include <cmath>
#include <vector>
#include <string>
#include <Magick++.h>

#include <iostream>

#include "options.h"
#include "image.h"
#include "math.h"

using namespace std;
using namespace Magick;

// Determine ID number from boxes 2-11
unsigned int findID(Pixels& img, const vector< vector<unsigned int> >& boxes,
	const unsigned int& max_x, const unsigned int& max_y,
	const unsigned int& box_width, Image& image);

// Find x value of filled circle aligned with a point (x,y)
vector<unsigned int> findFilled(Pixels& img,
	const unsigned int& x,      const unsigned int& y,
        const unsigned int& stop_x, const unsigned int& max_y,
	const unsigned int& box_width, Image& image);

#endif
