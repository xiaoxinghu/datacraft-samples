# CSV file statistic

## Usage

```bash
dcraft build inst.rb
```

## Explanation

### Files

- `inst.rb`
The instruction file, you can tweak it to do anything. Remember to run the following to make sure you didn't break anything after you tweaked it.

```bash
dcraft check inst.rb
```


- `utilities.rb` defines the data provider(`CsvSource`) and consumer(`ReportBuilder`).

### Workflow

In the `pre_build` code block, the data (`data.csv`) is generated<sup>[1](#fn1)</sup>.

The `from` part shows `datacraft` information of data provider.

The `tweak` part will tweak each row. In the example it will remove the rows that has `age` column larger than a certain number.

The `to` part tells it to use a specific class as data consumer/builder/user, whatever you call it.

The `post_build` simply outputs a string.

Then you will see the generated report file `report.txt` (and data file `data.csv`, which is generated in the very begining of the process).

## Footnotes
<a name='fn1'>1</a>: The data generation part is only for creating the scenario for this example, it is not required for real life usage.
