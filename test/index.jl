ts = TS(df_timetype_index)

@test index(ts) == df_timetype_index[!, :Index]
