var QuizOption = React.createClass({
  render: function () {
    return (
      <div>
        <input type="radio" name = "quizOption" value={this.props.opId}>{this.props.text}</input>
      </div>
    )
  }
});