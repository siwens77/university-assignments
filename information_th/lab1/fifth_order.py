import random
import zero_order
import first_order
import second_order
import third_order
import fourth_order


text1 = open("norm_hamlet.txt", "r")

cond_prob= {}
norm_prob = {}
summ = 0

letter1 = text1.read(1)
letter2 = text1.read(1)
letter3= text1.read(1)
letter4= text1.read(1)
letter5= text1.read(1)

while True:

    letter6= text1.read(1)
    if not letter6:
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
        if letter5 == " ":
            letter5 = "space"
        if letter6 == " ":
            letter6 = "space"


        if letter1 not in norm_prob:
            norm_prob[letter1] = {}
        if letter2 not in norm_prob[letter1]:
            norm_prob[letter1][letter2] = {}
        if letter3 not in norm_prob[letter1][letter2]:
            norm_prob[letter1][letter2][letter3] = {}
        if letter4 not in norm_prob[letter1][letter2][letter3]:
            norm_prob[letter1][letter2][letter3][letter4] = {}
        if letter5 not in norm_prob[letter1][letter2][letter3][letter4]:
            norm_prob[letter1][letter2][letter3][letter4][letter5] = 0
        norm_prob[letter1][letter2][letter3][letter4][letter5] += 1


        if letter1 not in cond_prob:
            cond_prob[letter1] = {}
        if letter2 not in cond_prob[letter1]:
            cond_prob[letter1][letter2] = {}
        if letter3 not in cond_prob[letter1][letter2]:
            cond_prob[letter1][letter2][letter3] = {}
        if letter4 not in cond_prob[letter1][letter2][letter3]:
            cond_prob[letter1][letter2][letter3][letter4] = {}
        if letter5 not in cond_prob[letter1][letter2][letter3][letter4]:
            cond_prob[letter1][letter2][letter3][letter4][letter5] = {}
        if letter6 not in cond_prob[letter1][letter2][letter3][letter4][letter5]:
            cond_prob[letter1][letter2][letter3][letter4][letter5][letter6] = 0
        cond_prob[letter1][letter2][letter3][letter4][letter5][letter6] +=1


    letter1 = letter2
    letter2 = letter3
    letter3 = letter4
    letter4 = letter5
    letter5 = letter6


for letter1 in norm_prob:
    for letter2 in norm_prob[letter1]:
        for letter3 in norm_prob[letter1][letter2]:
            for letter4 in norm_prob[letter1][letter2][letter3]:
                for letter5 in norm_prob[letter1][letter2][letter3][letter4]:
                    norm_prob[letter1][letter2][letter3][letter4][letter5]= norm_prob[letter1][letter2][letter3][letter4][letter5] / (summ-4)

for letter in cond_prob:
    for letter2 in cond_prob[letter]:
        for letter3 in cond_prob[letter][letter2]:
            for letter4 in cond_prob[letter][letter2][letter3]:
                for letter5 in cond_prob[letter][letter2][letter3][letter4]:
                    for letter6 in cond_prob[letter][letter2][letter3][letter4][letter5]:
                        cond_prob[letter][letter2][letter3][letter4][letter5][letter6] = cond_prob[letter][letter2][letter3][letter4][letter5][letter6] / (summ-5)


for letter1 in cond_prob:
    for letter2 in cond_prob[letter1]:
        for letter3 in cond_prob[letter1][letter2]:
            for letter4 in cond_prob[letter1][letter2][letter3]:
                for letter5 in cond_prob[letter1][letter2][letter3][letter4]:
                    for letter6 in cond_prob[letter1][letter2][letter3][letter4][letter5]:
                        cond_prob[letter1][letter2][letter3][letter4][letter5][letter6] = cond_prob[letter1][letter2][letter3][letter4][letter5][letter6] / norm_prob[letter1][letter2][letter3][letter4][letter5]


first_letter = random.choices(list(zero_order.probability.keys()), weights=list(zero_order.probability.values()), k=1)[0]
sample = first_letter
second_letter = random.choices(list(first_order.cond_prob[first_letter].keys()), weights=list(first_order.cond_prob[first_letter].values()), k=1)[0]
sample += second_letter
third_letter = random.choices(list(second_order.cond_prob[first_letter][second_letter].keys()), weights=list(second_order.cond_prob[first_letter][second_letter].values()), k=1)[0]
sample += third_letter
fourth_letter = random.choices(list(third_order.cond_prob[first_letter][second_letter][third_letter].keys()), weights=list(third_order.cond_prob[first_letter][second_letter][third_letter].values()), k=1)[0]
sample += fourth_letter
fifth_letter = random.choices(list(fourth_order.cond_prob[first_letter][second_letter][third_letter][fourth_letter].keys()), weights=list(fourth_order.cond_prob[first_letter][second_letter][third_letter][fourth_letter].values()), k=1)[0]
sample += fifth_letter

for i in range(50):
    next_letter = random.choices(list(cond_prob[first_letter][second_letter][third_letter][fourth_letter][fifth_letter].keys()), weights=list(cond_prob[first_letter][second_letter][third_letter][fourth_letter][fifth_letter].values()), k=1)[0]
    sample += next_letter
    first_letter = second_letter
    second_letter = third_letter
    third_letter = fourth_letter
    fourth_letter = fifth_letter
    fifth_letter = next_letter
print("Fifth order :", sample.replace("space", " "))