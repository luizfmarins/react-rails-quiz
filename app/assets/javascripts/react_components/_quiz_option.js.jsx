var QuizOption = React.createClass({
  render: function () {
    return (
      <div>
        <input type="radio" name="quizOption" value={this.props.opId}
               checked={this.props.getSelectedOption() === this.props.opId}
               onChange={this.props.handleOptionChange}>
          {this.props.text}
        </input>
      </div>
    )
  }
});