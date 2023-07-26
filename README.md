# State-Library
State library for LUA

# Docummentation

```lua
table State:Create(string Key, (string, int, boolean, table, function, instance) InitValue, function Callback)
```
Table Properties

```lua
void table:Update((string, int, boolean, table, function, instance) NewValue)
```

```lua
void table:SetCallback(function NewCallback)
```

```lua
void table:SetKey(string NewKey)
```

```lua
(string, int, boolean, table, function, instance) table:GetValue(void)
```

-------

```lua
void State:Update(string Key, (string, int, boolean, table, function, instance) Value)
```

```lua
void State:SetCallback(string Key, function Callback)
```

```lua
void State:SetKey(string Key, string NewKey)
```

```lua
(string, int, boolean, table, function, instance) State:GetValue(string Key)
```
