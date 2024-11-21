{
    "type": "MySQLNotebook",
    "version": "1.0",
    "caption": "Script",
    "content": "DROP TABLE IF EXISTS PETRESCUE;\n\nCREATE TABLE PETRESCUE (\n    ID INTEGER NOT NULL,\n    ANIMAL VARCHAR(20),\n    QUANTITY INTEGER,\n    COST DECIMAL(6,2),\n    RESCUEDATE DATE,\n    PRIMARY KEY (ID)\n);\n\nINSERT INTO PETRESCUE (ID, ANIMAL, QUANTITY, COST, RESCUEDATE) VALUES \n    (1,'Cat',9,450.09,'2018-05-29'),\n    (2,'Dog',3,666.66,'2018-06-01'),\n    (3,'Dog',1,100.00,'2018-06-04'),\n    (4,'Parrot',2,50.00,'2018-06-04'),\n    (5,'Dog',1,75.75,'2018-06-10'),\n    (6,'Hamster',6,60.60,'2018-06-11'),\n    (7,'Cat',1,44.44,'2018-06-11'),\n    (8,'Goldfish',24,48.48,'2018-06-14'),\n    (9,'Dog',2,222.22,'2018-06-15');\n\n\n# AGGREGATION FUNCTION\n#1. For this query, we will use the function SUM(COLUMN_NAME). The output of this query will be the total value of all elements in the column. The query for this question can be written as:\n\nSELECT SUM(COST) FROM PETRESCUE;\n\n#2.You can further assign a label to the query SUM_OF_COST.\n\nSELECT SUM(COST) AS SUM_OF_COST FROM PETRESCUE;\n\n# For this query, we will use the function MAX(COLUMN_NAME). The output of this query will be the maximum value of all elements in the column. The query for this question can be written as:\n\nSELECT MAX(QUANTITY) FROM PETRESCUE;\n\n# The query can easily be changed to display the minimum quantity using the MIN function instead.\n\nSELECT MIN(QUANTITY) FROM PETRESCUE;\n\n#3.  Write a query that displays the average cost of animals rescued.\n\nSELECT AVG(COST) FROM PETRESCUE;\n\n\n# Scalar Functions and String Functions\n# 1. Write a query that displays the rounded integral cost of each rescue.\n\nSELECT ROUND(COST) FROM PETRESCUE;\n\n# In case the question was to round the value to 2 decimal places, the query would change to:\n\nSELECT ROUND(COST, 2) FROM PETRESCUE;\n\n# 2. Write a query that displays the length of each animal name.\n# For this query, we will use the function LENGTH(COLUMN_NAME). The output of this query will be the length of each element in the column. The query for this question can be written as:\n\nSELECT LENGTH(ANIMAL) FROM PETRESCUE;\n\n# 3. Write a query that displays the animal name in each rescue in uppercase.\n# For this query, we will use the function UCASE(COLUMN_NAME). The output of this query will be each element in the column in upper case letters. The query for this question can be written as:\n\nSELECT UCASE(ANIMAL) FROM PETRESCUE;\n\n# Just as easily, the user could ask for a lower case representation, and the query would be changed to:\n\nSELECT LCASE(ANIMAL) FROM PETRESCUE;\n\n\n# Data Functions\n# 1. Write a query that displays the rescue date.\n# For this query, we will use the function DAY(COLUMN_NAME). The output of this query will be only the DAY part of the date in the column. The query for this question can be written as:\n\nSELECT DAY(RESCUEDATE) FROM PETRESCUE;\n\n# In case the query was asking for MONTH of rescue, the query would change to:\n\nSELECT MONTH(RESCUEDATE) FROM PETRESCUE;\n\n# In case the query was asking for YEAR of rescue, the query would change to:\n\nSELECT YEAR(RESCUEDATE) FROM PETRESCUE;\n\n# Animals rescued should see the vet within three days of arrival. Write a query that displays the third day of each rescue.\n# For this query, we will use the function DATE_ADD(COLUMN_NAME, INTERVAL Number Date_element). Here, the quantity in Number and in Date_element will combine to form the interval to be added to the date in the column. For the given question, the query would be:\n\nSELECT DATE_ADD(RESCUEDATE, INTERVAL 3 DAY) FROM PETRESCUE;\n\n# If the question was to add 2 months to the date, the query would change to:\n\nSELECT DATE_ADD(RESCUEDATE, INTERVAL 2 MONTH) FROM PETRESCUE;\n\n# Similarly, we can retrieve a date before the one given in the column by a given number using the function DATE_SUB. By modifying the same example, the following query would provide the date 3 days before the rescue.\n\nSELECT DATE_SUB(RESCUEDATE, INTERVAL 3 DAY) FROM PETRESCUE;\n\n# If the question was to add 2 months to the date, the query would change to:\n\nSELECT DATE_ADD(RESCUEDATE, INTERVAL 2 MONTH) FROM PETRESCUE;\n\n# Similarly, we can retrieve a date before the one given in the column by a given number using the function DATE_SUB. By modifying the same example, the following query would provide the date 3 days before the rescue.\n\nSELECT DATE_SUB(RESCUEDATE, INTERVAL 3 DAY) FROM PETRESCUE;\n\n# Write a query that displays the length of time the animals have been rescued, for example, the difference between the current date and the rescue date.\n# For this query, we will use the function DATEDIFF(Date_1, Date_2). This function calculates the difference between the two given dates and gives the output in number of days. For the given question, the query would be:\n\nSELECT DATEDIFF(CURRENT_DATE, RESCUEDATE) FROM PETRESCUE;\n\n# CURRENT_DATE is also an inbuilt function that returns the present date as known to the server.\n# To present the output in a YYYY-MM-DD format, another function FROM_DAYS(number_of_days)can be used. This function takes a number of days and returns the required formatted output. The query above would thus be modified to\n\nSELECT FROM_DAYS(DATEDIFF(CURRENT_DATE, RESCUEDATE)) FROM PETRESCUE;\n\n\n# Practice Problem\n# 1. Write a query that displays the average cost of rescuing a single dog. Note that the cost per dog would not be the same in different instances.\n\nSELECT AVG(COST/QUANTITY) FROM PETRESCUE WHERE ANIMAL = 'Dog';\n\n# 2. Write a query that displays the animal name in each rescue in uppercase without duplications.\n\nSELECT DISTINCT UPPER(ANIMAL) FROM petrescue;\n\n# 3. Write a query that displays all the columns from the PETRESCUE table where the animal(s) rescued are cats. Use cat in lowercase in the query.\n\nSELECT * FROM petrescue\nWHERE LOWER(ANIMAL)= 'cat';\n\n# 4. Write a query that displays the number of rescues in the 5th month.\n\nSELECT SUM(QUANTITY) \nFROM petrescue\nWHERE MONTH(RESCUEDATE) = '05';\n\n# 5. The rescue shelter is supposed to find good homes for all animals within 1 year of their rescue. Write a query that displays the ID and the target date.\n\nSELECT ID, DATE_ADD(RESCUEDATE, INTERVAL 1 YEAR) FROM petrescue;\n",
    "options": {
        "tabSize": 4,
        "insertSpaces": true,
        "indentSize": 4,
        "defaultEOL": "CRLF",
        "trimAutoWhitespace": true
    },
    "viewState": null,
    "contexts": [
        {
            "state": {
                "start": 1,
                "end": 139,
                "language": "mysql",
                "result": {
                    "type": "text",
                    "text": [
                        {
                            "type": 5,
                            "index": -1,
                            "content": "✓ SQL Script execution completed in 255ms. 28 statements executed successfully.",
                            "language": "ansi"
                        }
                    ]
                },
                "currentHeight": 300,
                "currentSet": 1,
                "statements": [
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 0,
                            "length": 31
                        },
                        "contentStart": 1,
                        "state": 0
                    },
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 31,
                            "length": 165
                        },
                        "contentStart": 33,
                        "state": 0
                    },
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 196,
                            "length": 413
                        },
                        "contentStart": 198,
                        "state": 0
                    },
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 609,
                            "length": 249
                        },
                        "contentStart": 826,
                        "state": 0
                    },
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 858,
                            "length": 110
                        },
                        "contentStart": 921,
                        "state": 0
                    },
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 968,
                            "length": 229
                        },
                        "contentStart": 1161,
                        "state": 0
                    },
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 1197,
                            "length": 137
                        },
                        "contentStart": 1298,
                        "state": 0
                    },
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 1334,
                            "length": 105
                        },
                        "contentStart": 1407,
                        "state": 0
                    },
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 1439,
                            "length": 153
                        },
                        "contentStart": 1558,
                        "state": 0
                    },
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 1592,
                            "length": 134
                        },
                        "contentStart": 1689,
                        "state": 0
                    },
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 1726,
                            "length": 291
                        },
                        "contentStart": 1980,
                        "state": 0
                    },
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 2017,
                            "length": 310
                        },
                        "contentStart": 2291,
                        "state": 0
                    },
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 2327,
                            "length": 144
                        },
                        "contentStart": 2435,
                        "state": 0
                    },
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 2471,
                            "length": 295
                        },
                        "contentStart": 2728,
                        "state": 0
                    },
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 2766,
                            "length": 122
                        },
                        "contentStart": 2848,
                        "state": 0
                    },
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 2888,
                            "length": 120
                        },
                        "contentStart": 2969,
                        "state": 0
                    },
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 3008,
                            "length": 449
                        },
                        "contentStart": 3398,
                        "state": 0
                    },
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 3457,
                            "length": 142
                        },
                        "contentStart": 3538,
                        "state": 0
                    },
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 3599,
                            "length": 280
                        },
                        "contentStart": 3820,
                        "state": 0
                    },
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 3879,
                            "length": 142
                        },
                        "contentStart": 3960,
                        "state": 0
                    },
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 4021,
                            "length": 280
                        },
                        "contentStart": 4242,
                        "state": 0
                    },
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 4301,
                            "length": 435
                        },
                        "contentStart": 4679,
                        "state": 0
                    },
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 4736,
                            "length": 393
                        },
                        "contentStart": 5061,
                        "state": 0
                    },
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 5129,
                            "length": 234
                        },
                        "contentStart": 5301,
                        "state": 0
                    },
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 5363,
                            "length": 147
                        },
                        "contentStart": 5465,
                        "state": 0
                    },
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 5510,
                            "length": 201
                        },
                        "contentStart": 5660,
                        "state": 0
                    },
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 5711,
                            "length": 144
                        },
                        "contentStart": 5787,
                        "state": 0
                    },
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 5855,
                            "length": 225
                        },
                        "contentStart": 6016,
                        "state": 0
                    },
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 6080,
                            "length": 1
                        },
                        "contentStart": 6079,
                        "state": 3
                    }
                ]
            },
            "data": []
        },
        {
            "state": {
                "start": 1,
                "end": 139,
                "language": "mysql",
                "currentSet": 1,
                "statements": [
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 0,
                            "length": 31
                        },
                        "contentStart": 1,
                        "state": 0
                    },
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 31,
                            "length": 165
                        },
                        "contentStart": 33,
                        "state": 0
                    },
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 196,
                            "length": 413
                        },
                        "contentStart": 198,
                        "state": 0
                    },
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 609,
                            "length": 249
                        },
                        "contentStart": 826,
                        "state": 0
                    },
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 858,
                            "length": 110
                        },
                        "contentStart": 921,
                        "state": 0
                    },
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 968,
                            "length": 229
                        },
                        "contentStart": 1161,
                        "state": 0
                    },
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 1197,
                            "length": 137
                        },
                        "contentStart": 1298,
                        "state": 0
                    },
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 1334,
                            "length": 105
                        },
                        "contentStart": 1407,
                        "state": 0
                    },
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 1439,
                            "length": 153
                        },
                        "contentStart": 1558,
                        "state": 0
                    },
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 1592,
                            "length": 134
                        },
                        "contentStart": 1689,
                        "state": 0
                    },
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 1726,
                            "length": 291
                        },
                        "contentStart": 1980,
                        "state": 0
                    },
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 2017,
                            "length": 310
                        },
                        "contentStart": 2291,
                        "state": 0
                    },
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 2327,
                            "length": 144
                        },
                        "contentStart": 2435,
                        "state": 0
                    },
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 2471,
                            "length": 295
                        },
                        "contentStart": 2728,
                        "state": 0
                    },
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 2766,
                            "length": 122
                        },
                        "contentStart": 2848,
                        "state": 0
                    },
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 2888,
                            "length": 120
                        },
                        "contentStart": 2969,
                        "state": 0
                    },
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 3008,
                            "length": 449
                        },
                        "contentStart": 3398,
                        "state": 0
                    },
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 3457,
                            "length": 142
                        },
                        "contentStart": 3538,
                        "state": 0
                    },
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 3599,
                            "length": 280
                        },
                        "contentStart": 3820,
                        "state": 0
                    },
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 3879,
                            "length": 142
                        },
                        "contentStart": 3960,
                        "state": 0
                    },
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 4021,
                            "length": 280
                        },
                        "contentStart": 4242,
                        "state": 0
                    },
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 4301,
                            "length": 435
                        },
                        "contentStart": 4679,
                        "state": 0
                    },
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 4736,
                            "length": 393
                        },
                        "contentStart": 5061,
                        "state": 0
                    },
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 5129,
                            "length": 234
                        },
                        "contentStart": 5301,
                        "state": 0
                    },
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 5363,
                            "length": 147
                        },
                        "contentStart": 5465,
                        "state": 0
                    },
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 5510,
                            "length": 201
                        },
                        "contentStart": 5660,
                        "state": 0
                    },
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 5711,
                            "length": 144
                        },
                        "contentStart": 5787,
                        "state": 0
                    },
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 5855,
                            "length": 225
                        },
                        "contentStart": 6016,
                        "state": 0
                    },
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 6080,
                            "length": 1
                        },
                        "contentStart": 6079,
                        "state": 3
                    }
                ]
            },
            "data": []
        }
    ]
}