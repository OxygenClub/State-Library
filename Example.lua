local State = {
    Values = {}
}

function State:Create(Key, InitValue, Callback)
    Callback = Callback or function() end
    
    local StateTbl = {
        ["Key"] = Key,
        ["Value"] = InitValue,
        ["Callback"] = Callback,
    }
    
    State.Values[StateTbl.Key] = StateTbl
    
    StateTbl.Callback(StateTbl.Value, StateTbl.Key)
    
    function StateTbl:Update(NewValue)
        StateTbl.Value = NewValue
        
        -- // Callback
        StateTbl.Callback(StateTbl.Value, StateTbl.Key)
    end
    
    function StateTbl:SetCallback(NewCallback)
        -- // Setting new callback
        StateTbl.Callback = NewCallback 
    end
    
    function StateTbl:SetKey(NewKey)
        -- // Removes old key
        State.Values[StateTbl.Key] = nil
        
        -- // Changes key from table
        StateTbl.Key = NewKey

        -- // Inserts new key
        State.Values[StateTbl.Key] = StateTbl
    end
    
    return StateTbl
end
    
function State:Update(Key, Value)
    if State.Values[Key] then
        local StateTbl = State.Values[Key]
        
        StateTbl:Update(Value)
    else
        print("Invalid key: ", Key)
    end
end

function State:SetCallback(Key, Callback)
    if State.Values[Key] then
        local StateTbl = State.Values[Key]
        
        StateTbl:SetCallback(Callback)
    else
        print("Invalid key: ", Key)
    end
end

function State:SetKey(Key, NewKey)
    if State.Values[Key] then
        local StateTbl = State.Values[Key]
        
        StateTbl:SetKey(NewKey)
    else
        print("Invalid key: ", Key)
    end
end

local NewState = State:Create("Hello", 50, function(Value, Key)
    print("Value: ", Value, "Key: ", Key)
end)    

-- // This will automatically callback when you update.
NewState:Update("Bye!!")

NewState:SetCallback(function(Value, Key)
    print("Our new callback has been called!!", "Value: ", Value, "Key: ", Key)
end)

-- // Calling our new callback!!
NewState:Update("Bye!!")

NewState:SetKey("Funneh Key")

NewState:Update("Bye!!")

-- // All of these above are all the same but you have to input the key.

State:Update("Funneh Key", function() end)

State:SetKey("Funneh Key", "Even Funnehier Key")

State:SetCallback("Even Funnehier Key", function(Value, Key)
    print("Our even newer callback has been called!!", "Value: ", Value, "Key: ", Key)
end)

State:Update("Even Funnehier Key", "Bye!!")

return State
