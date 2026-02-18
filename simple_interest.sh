#!/bin/bash

# Simple Interest Calculator
# This script calculates simple interest based on user input.

# Prompt user for input
echo "Simple Interest Calculator"
read -p "Enter Principal amount: " principal
read -p "Enter Rate of Interest (% per year): " rate
read -p "Enter Time period (in years): " time

# Validate inputs are numbers
re='^[0-9]+([.][0-9]+)?$'

if ! [[ $principal =~ $re && $rate =~ $re && $time =~ $re ]]; then
  echo "Error: Please enter valid numeric values."
  exit 1
fi

# Calculate simple interest
simple_interest=$(echo "scale=2; ($principal * $rate * $time) / 100" | bc)

total_amount=$(echo "scale=2; $principal + $simple_interest" | bc)

# Display results
echo "\n----- Result -----"
echo "Principal      : $principal"
echo "Rate (%)       : $rate"
echo "Time (years)   : $time"
echo "Simple Interest: $simple_interest"
echo "Total Amount   : $total_amount"