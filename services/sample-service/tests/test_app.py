from services.sample_service.app import app as flask_app


def test_index_response():
    client = flask_app.test_client()
    resp = client.get('/')
    assert resp.status_code == 200
    data = resp.get_json()
    assert data.get('service') == 'sample-service'
    assert data.get('status') == 'ok'
