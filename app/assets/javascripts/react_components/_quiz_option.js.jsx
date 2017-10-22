var QuizOption = React.createClass({
  isChecked: function () {
    return this.props.getSelectedOption() == this.props.opId;
  },

  render: function () {
    return (
      <div>
        <input type="radio" name="quizOption" value={this.props.opId}
               checked={this.isChecked()}
               onChange={this.props.handleOptionChange}>
          {this.props.text}
        </input>
      </div>
    )
  }
});