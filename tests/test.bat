if defined QLIC_KC (
        where q
        echo QHOME:%QHOME%
        echo CD:%CD%
        dir q.k
        pip -q install -r tests\requirements.txt
	jupyter nbconvert --allow-errors --to notebook --execute --ExecutePreprocessor.timeout=60 --output tests/test.out kdb+Notebooks.ipynb
	jupyter nbconvert --to notebook --execute --ExecutePreprocessor.timeout=60 --output test.out examples/html_display.ipynb
        pytest -rx tests\test_jupyterq.py
)
