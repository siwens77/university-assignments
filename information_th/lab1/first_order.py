import random
import zero_order


text1 = open("norm_hamlet.txt", "r")
cond_prob= {}
norm_prob = {}
summ = 0

letter1 = text1.read(1)

while True:
    letter2 = text1.read(1)
    if not letter2:
        break
    else:
        summ +=1
        if letter1 == " ":
            letter1 = "space"
        if letter2 == " ":
            letter2 = "space"

        if letter1 not in norm_prob:
            norm_prob[letter1] = 1
        else:  
            norm_prob[letter1] += 1

        if letter1 in cond_prob:
            if letter2 in cond_prob[letter1]:
                cond_prob[letter1][letter2] += 1
            else:
                cond_prob[letter1][letter2] = 1
        else:
            cond_prob[letter1] = {letter2: 1}
    letter1 = letter2


for letter in norm_prob:
    norm_prob[letter] = norm_prob[letter] / summ

for letter in cond_prob:
    for letter2 in cond_prob[letter]:
        cond_prob[letter][letter2] = cond_prob[letter][letter2] / (summ-1)


for letter1 in cond_prob:
    for letter2 in cond_prob[letter1]:
        cond_prob[letter1][letter2] = cond_prob[letter1][letter2] / norm_prob[letter1]


first_letter = random.choices(list(zero_order.probability.keys()), weights=list(zero_order.probability.values()), k=1)[0]
sample = first_letter

for i in range(50):
    second_letter = random.choices(list(cond_prob[first_letter].keys()), weights=list(cond_prob[first_letter].values()), k=1)[0]
    sample += second_letter
    first_letter = second_letter
    

print("First order :", sample.replace("space", " "))