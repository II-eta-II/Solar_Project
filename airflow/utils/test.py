from airflow.models import Variable

my_dict = Variable.get("LINE_CNANNEL_SECRET")
print(my_dict)