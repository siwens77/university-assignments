import random
import zero_order
import first_order
import second_order


text1 = open("norm_hamlet.txt", "r")

cond_prob= {}
norm_prob = {}
summ = 0

letter1 = text1.read(1)
letter2 = text1.read(1)
letter3= text1.read(1)

while True:

    letter4= text1.read(1)
    if not letter4:
        break


    else:
        summ +=1
        if letter1 == " ":
            letter1 = "space"
        if letter2 == " ":
            letter2 = "space"
        if letter3 == " ":
            letter3 = "space"
        if letter4 == " ":
            letter4 = "space"


        if letter1 not in norm_prob:
            norm_prob[letter1] = {}
        if letter2 not in norm_prob[letter1]:
            norm_prob[letter1][letter2] = {}
        if letter3 not in norm_prob[letter1][letter2]:
            norm_prob[letter1][letter2][letter3] = 0
        norm_prob[letter1][letter2][letter3] += 1


        if letter1 not in cond_prob:
            cond_prob[letter1] = {}
        if letter2 not in cond_prob[letter1]:
            cond_prob[letter1][letter2] = {}
        if letter3 not in cond_prob[letter1][letter2]:
            cond_prob[letter1][letter2][letter3] = {}
        if letter4 not in cond_prob[letter1][letter2][letter3]:
            cond_prob[letter1][letter2][letter3][letter4] = 0
        cond_prob[letter1][letter2][letter3][letter4] +=1


    letter1 = letter2
    letter2 = letter3
    letter3 = letter4


for letter1 in norm_prob:
    for letter2 in norm_prob[letter1]:
        for letter3 in norm_prob[letter1][letter2]:
            norm_prob[letter1][letter2][letter3]= norm_prob[letter1][letter2][letter3] / (summ-2)

for letter in cond_prob:
    for letter2 in cond_prob[letter]:
        for letter3 in cond_prob[letter][letter2]:
            for letter4 in cond_prob[letter][letter2][letter3]:
                cond_prob[letter][letter2][letter3][letter4] = cond_prob[letter][letter2][letter3][letter4] / (summ-3)


for letter1 in cond_prob:
    for letter2 in cond_prob[letter1]:
        for letter3 in cond_prob[letter1][letter2]:
            for letter4 in cond_prob[letter1][letter2][letter3]:
                cond_prob[letter1][letter2][letter3][letter4] = cond_prob[letter1][letter2][letter3][letter4] / norm_prob[letter1][letter2][letter3]


first_letter = random.choices(list(zero_order.probability.keys()), weights=list(zero_order.probability.values()), k=1)[0]
sample = first_letter
second_letter = random.choices(list(first_order.cond_prob[first_letter].keys()), weights=list(first_order.cond_prob[first_letter].values()), k=1)[0]
sample += second_letter
third_letter = random.choices(list(second_order.cond_prob[first_letter][second_letter].keys()), weights=list(second_order.cond_prob[first_letter][second_letter].values()), k=1)[0]
sample += third_letter

for i in range(50):
    next_letter = random.choices(list(cond_prob[first_letter][second_letter][third_letter].keys()), weights=list(cond_prob[first_letter][second_letter][third_letter].values()), k=1)[0]
    sample += next_letter
    first_letter = second_letter
    second_letter = third_letter
    third_letter = next_letter
print("Third order :", sample.replace("space", " "))