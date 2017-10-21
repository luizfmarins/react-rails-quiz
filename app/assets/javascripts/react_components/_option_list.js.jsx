var OptionList = React.createClass({

  getInitialState: function () {
    var state = JSON.parse(this.props.presenter);
    state.selectedOption = "";
    return state;
  },

  handleOptionChange: function (changeEvent) {
    this.setState({
      selectedOption: changeEvent.target.value
    });
  },

  getSelectedOption: function () {
    return this.state.selectedOption;
  },

  handleSubmit: function (event) {
    event.preventDefault();

    console.log('You have selected:', this.state.selectedOption);
  },

  render: function () {
    var self = this;

    var optionNodes = this.state.quizOptions.map(function (op) {
      return <QuizOption opId={op.id} text={op.text}
                         handleOptionChange={self.handleOptionChange}
                         getSelectedOption={self.getSelectedOption}/>
    });

    return (
      <div>
        <form ref="form" method="post" onSubmit={this.handleSubmit}>
          {optionNodes}
          <button type="submit">Next</button>
        </form>
      </div>
    )
  }
});
