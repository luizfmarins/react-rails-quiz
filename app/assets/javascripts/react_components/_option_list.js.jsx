var OptionList = React.createClass({

  getInitialState: function () {
    var state = JSON.parse(this.props.presenter);
    state.selectedOption = "";

    console.log(state);
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
  },

  buttonText: function () {
    return this.state.isFinalQuestion ? "Done" : "Next";
  },

  render: function () {
    var self = this;

    var optionNodes = this.state.quizQuestions[this.state.questionIndex].quizOptions.map(function (op) {
      return <QuizOption opId={op.id} text={op.text}
                         handleOptionChange={self.handleOptionChange}
                         getSelectedOption={self.getSelectedOption}/>
    });

    return (
      <div>
        <form ref="form" action={this.state.form.action} method="get" onSubmit={this.handleSubmit}>
          {optionNodes}
          <input type="hidden" name="questionIndex" value={this.state.questionIndex} />
          <button type="submit">{this.buttonText()}</button>
        </form>
      </div>
    )
  }
});
