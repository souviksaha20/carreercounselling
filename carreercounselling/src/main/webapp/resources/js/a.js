$(document).ready(function() {
    $('.button').click(function(){
        var $btn = $(this),
            $step = $btn.parents('.mmodal-body'),
            stepIndex = $step.index(),
            $pag = $('.mmodal-header span').eq(stepIndex);

        if(stepIndex === 0) { step1($step, $pag); }
        else { step3($step, $pag); }

      });

      $('.onebu').click(function(){
        var $btn = $(this),
            $step = $btn.parents('.mmodal-body'),
            stepIndex = $step.index(),
            $pag = $('.mmodal-header span').eq(stepIndex);

        if(stepIndex === 0) { step1($step, $pag); }
        else { step3($step, $pag); }

      });

      $('.twobu').click(function(){
        var $btn = $(this),
            $step = $btn.parents('.mmodal-body'),
            stepIndex = $step.index(),
            $pag = $('.mmodal-header span').eq(stepIndex);

        if(stepIndex === 0) { step11($step, $pag); }
        else { step3($step, $pag); }

      });

      function step1($step, $pag){
      console.log('step1');
        // animate the step out
        $step.addClass('animate-out');

        // animate the step in
        setTimeout(function(){
          $step.removeClass('animate-out is-showing')
               .next().addClass('animate-in');
          $pag.removeClass('is-active')
                .next().addClass('is-active');
        }, 600);

        // after the animation, adjust the classes
        setTimeout(function(){
          $step.next().removeClass('animate-in')
                .addClass('is-showing');

        }, 1200);
      }

      function step11($step, $pag){
        console.log('step1');
          // animate the step out
          $step.addClass('animate-outt');

          // animate the step in
          setTimeout(function(){
            $step.removeClass('animate-outt is-showing')
                 .next().addClass('animate-in');
            $pag.removeClass('is-active')
                  .next().addClass('is-active');
          }, 600);

          // after the animation, adjust the classes
          setTimeout(function(){
            $step.next().removeClass('animate-in')
                  .addClass('is-showing');

          }, 1200);
        }

      function step3($step, $pag){
      console.log('3');

        // animate the step out
        $step.parents('.mmodal-wrap').addClass('animate-up');

        setTimeout(function(){
          $('.butonn').css('display', 'inline-block');
        }, 300);
      }

      $('.rerun-button').click(function(){
       $('.mmodal-wrap').removeClass('animate-up')
                        .find('.mmodal-body')
                        .first().addClass('is-showing')
                        .siblings().removeClass('is-showing');

        $('.mmodal-header span').first().addClass('is-active')
                                .siblings().removeClass('is-active');
       $(this).hide();
      });


});