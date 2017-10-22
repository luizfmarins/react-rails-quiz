var QuizResult = React.createClass({
  getInitialState: function () {
    return JSON.parse(this.props.presenter);
  },

  render: function () {
    var answers = this.state.results.map(function (question) {
      return (
        <div>
          <p>{question.text}</p>
          {
            question.options.map(function (option) {
              return (
                <div>
                  {option.text} - {option.choiceNumber}
                </div>
              )
            })
          }
        </div>
      )
    });

    return (
      <div>
        <p>Result</p>
        {answers}
      </div>
    )
  }
});