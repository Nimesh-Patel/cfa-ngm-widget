from streamlit.testing.v1 import AppTest

import ngm.widget


def test_app():
    # Cf. https://docs.streamlit.io/develop/api-reference/app-testing
    at = AppTest.from_function(ngm.widget.app)
    at.run()
    assert not at.exception
