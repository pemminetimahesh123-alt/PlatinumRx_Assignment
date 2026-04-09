def convert_minutes(minutes):
    hours = minutes // 60
    mins = minutes % 60
    
    if hours == 1:
        return f"{hours} hr {mins} minutes"
    else:
        return f"{hours} hrs {mins} minutes"

print(convert_minutes(130))