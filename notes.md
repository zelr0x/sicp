## Numeric Tricks
### Avoid overflow when computing `(x * y) % m`
```python
(x * y) % m == ((x % m) * (y % m)) % m
```

