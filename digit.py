def dig_pow(n,p):
    digits = [int(d) for d in str(n)]

    total  = sum(digits[i]**(p+i) for i in range(len(digits)))

    return total // n if total % n == 0 else -1
    for i in range(i,len(n)):
        n[i] ** p + n[i+1]

