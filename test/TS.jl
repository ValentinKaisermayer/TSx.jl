function test_df_index_integer()
    ts = TS(df_integer_index, 1)
    @test typeof(ts) == TSx.TS
    @test ts.coredata == df_integer_index
end

function test_df_index_timetype()
    ts = TS(df_timetype_index, 1)
    @test typeof(ts) == TSx.TS
    @test ts.coredata == df_timetype_index
end

function test_df_index_symbol()
    ts = TS(df_integer_index, :Index)
    @test typeof(ts) == TSx.TS
    @test ts.coredata == df_integer_index
end

function test_df_index_string()
    ts = TS(df_integer_index, "Index")
    @test typeof(ts) == TSx.TS
    @test ts.coredata == df_integer_index
end

function test_df_index_range()
    ts = TS(df_vector, index_range)
    @test typeof(ts) == TSx.TS
    @test ts.coredata[!, :data] == df_vector[!, :data]
end

function test_vector_index_vector_integer()
    ts = TS(data_vector, index_integer)
    @test typeof(ts) == TSx.TS
    @test ts.coredata[!, :Index] == index_integer
    @test ts.coredata[!, 2] == data_vector
end

function test_vector_index_vector_timetype()
    ts = TS(data_vector, index_timetype)
    @test typeof(ts) == TSx.TS
    @test ts.coredata[!, :Index] == index_timetype
    @test ts.coredata[!, 2] == data_vector
end

function test_vector()
    ts = TS(data_vector)
    @test typeof(ts) == TSx.TS
    @test ts.coredata[!, :Index] == collect(1:length(data_vector))
    @test ts.coredata[!, 2] == data_vector
end

function test_array()
    ts = TS(data_array)
    @test typeof(ts) == TSx.TS
    @test typeof(ts.coredata) == DataFrames.DataFrame
    @test ts.coredata[!, :Index] == collect(1:size(data_vector)[1])
    @test Matrix(ts.coredata[!, Not(:Index)]) == data_array
end

# Run each test
# NOTE: Do not forget to add any new test-function created above
# otherwise that test won't run.
test_df_index_integer()
test_df_index_timetype()
test_df_index_symbol()
test_df_index_string()
test_df_index_range()
test_vector_index_vector_integer()
test_vector_index_vector_timetype()
test_vector()
test_array()
