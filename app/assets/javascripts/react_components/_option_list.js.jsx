var OptionList = React.createClass({
  getInitialState: function () {
    return JSON.parse(this.props.presenter);
  },

  render: function () {
    var optionNodes = this.state.quizOptions.map(function (op) {
      return <QuizOption opId={op.id} text={op.text}/>
    });

    return (
      <div>
        <form action="">
          {optionNodes}
        </form>
      </div>
    )
  }
});
