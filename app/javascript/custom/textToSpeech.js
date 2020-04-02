document.addEventListener("turbolinks:load", function() {
  var tts = document.querySelector('meta[name=tts]')
  
  if (tts.getAttribute('controller') == 'words' && tts.getAttribute('action') == 'show') {
    var synth = window.speechSynthesis;

    var inputForm = document.querySelector('form');
    var dataToRead = document.querySelector('#word_title').textContent
    var voiceSelect = document.querySelector('select');

    var rate = document.querySelector('#rate');
    var rateValue = document.querySelector('.rate-value');

    var voices = [];
    
    function populateVoiceList() {
      if (voices.length == 0) {
        if(typeof speechSynthesis === 'undefined') {
          return;
        }
        
        voices = synth.getVoices()
  
        for(i = 0; i < voices.length ; i++) {
          if (voices[i].lang.includes('en')) {
            var option = document.createElement('option');
            option.textContent = voices[i].name;
        
            option.setAttribute('data-lang', voices[i].lang);
            option.setAttribute('data-name', voices[i].name);
            voiceSelect.appendChild(option);
          }
        }
      } else {
        voices = voices
      }
    }

    populateVoiceList();

    if (speechSynthesis.onvoiceschanged !== undefined) {
      speechSynthesis.onvoiceschanged = populateVoiceList;
    }

    inputForm.onsubmit = function(event) {
      event.preventDefault();

      var utterThis = new SpeechSynthesisUtterance(dataToRead);
      var selectedOption = voiceSelect.selectedOptions[0].getAttribute('data-name');
      
      for(i = 0; i < voices.length ; i++) {
        if(voices[i].name === selectedOption) {
          utterThis.voice = voices[i];
        }
      }
      utterThis.rate = rate.value;
      synth.speak(utterThis);
    }
    
    rate.onchange = function() {
      rateValue.textContent = rate.value;
    }
  }
  
})