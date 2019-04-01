char *join(char *str1, char *str2) {
    char *temp;
    temp = (char *)malloc(strlen(str1) + strlen(str2) + 1);
    sprintf(temp, "%s%s", str1, str2);
    return temp;
}