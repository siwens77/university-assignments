import random

text1 = open("norm_hamlet.txt", "r")
summ = 0
probability = {}

while True:
    letter1 = text1.read(1)
    if not letter1:
        break
    else:
        summ +=1
        if letter1 == " ":
            letter1 = "space"

        if letter1 not in probability:
            probability[letter1] = 1
        else:  
            probability[letter1] += 1


for letter in probability:
    probability[letter] = probability[letter] / summ

sample = ""

for i in range(50):
    sample += random.choices(list(probability.keys()), weights=list(probability.values()), k=1)[0] 
print("Zero order :", sample.replace("space", " "))