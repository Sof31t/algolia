class Form extends React.Component {

  constructor(props) {
    super(props);
    this.state = {
      nameValue: "",
      imageValue: "",
      linkValue: "",
      categoryValue: "",
      rankValue: 1
    };

    this.handleInputChange = this.handleInputChange.bind(this);
  }

  handleInputChange(event) {
    const target = event.target;
    const value = target.value;
    const name = target.name;

    this.setState({
      [name]: value
    });
  }

  handleClick(e) {
    e.preventDefault();
    var name = this.state.nameValue;
    $.ajax({
      url: '/api/1/apps',
      type: 'POST',
      dataType: 'json',
      data: {
        name: name,
        image: this.state.imageValue,
        link: this.state.linkValue,
        category: this.state.categoryValue,
        rank: this.state.rankValue
      },
      success: (response) => {
        swal({
          title: 'Created!',
          text: 'Your app has been created successfuly.',
          type: 'success',
          showConfirmButton: false,
          allowOutsideClick: false,
          timer: 2000
        }).then(
          function () {window.location.replace("/?q="+name);},
          // handling the promise rejection
          function (dismiss) {
            if (dismiss === 'timer') {
              window.location.replace("/?q="+name);
            }
          }
        )
      },
      error: function(){
        swal(
          '¯\_(ツ)_/¯',
          'An unknown error Happened.',
          'error'
        )
      }
    });
  }

  render() {
    return <div id="new_app">
            <div className="media-left"></div>
              <div className="media-body">
              <h4 className="media-heading">
                <button type="button" className="close" id="hide">
                  <i className="fa fa-times" aria-hidden="true"></i>
                </button>
              </h4>
                <form className="form-horizontal">
                  <div className="form-group">
                    <div className="col-xs-1">
                      <label htmlFor="app_name">Name</label>
                    </div>
                    <div className="col-xs-6">
                      <input name="nameValue" value={this.state.nameValue}
                      onChange={this.handleInputChange} type="text"
                      className="form-control" required="required"
                      placeholder="Entre app name"/>
                    </div>
                  </div>
                  <div className="form-group">
                    <div className="col-xs-1">
                      <label htmlFor="app_name">Image url</label>
                    </div>
                    <div className="col-xs-6">
                      <input name="imageValue" value={this.state.imageValue}
                      onChange={this.handleInputChange} type="text"
                      className="form-control" pattern="https?://.+"
                      required="required" placeholder="http(s)://…"/>
                    </div>
                  </div>
                  <div className="form-group">
                    <div className="col-xs-1">
                      <label htmlFor="app_name">Link</label>
                    </div>
                    <div className="col-xs-6">
                      <input name="linkValue" value={this.state.linkValue}
                      onChange={this.handleInputChange} type="text"
                      className="form-control" pattern="https?://.+"
                      required="required" placeholder="http(s)://…"/>
                    </div>
                  </div>
                  <div className="form-group">
                    <div className="col-xs-1">
                      <label htmlFor="app_name">Category</label>
                    </div>
                    <div className="col-xs-6">
                      <input name="categoryValue" value={this.state.categoryValue}
                      onChange={this.handleInputChange} type="text"
                      className="form-control" required="required"
                      placeholder="Entre a category"/>
                    </div>
                  </div>
                  <div className="form-group">
                    <div className="col-xs-1">
                      <label htmlFor="app_rank">Rank</label>
                    </div>
                    <div className="col-xs-6">
                      <input name="rankValue" value={this.state.rankValue}
                      onChange={this.handleInputChange} type="number" min="1"
                      className="form-control" required="required" />
                    </div>
                  </div>
                  <div className="form-group">
                    <div className="col-xs-offset-6 col-xs-2">
                      <button type="submit" className="btn btn-primary"
                      onClick={this.handleClick.bind(this)}>Create</button>
                    </div>
                  </div>
                </form>
              </div>
            </div>
  }
}
