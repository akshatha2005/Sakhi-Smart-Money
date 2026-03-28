// All UI strings in 3 languages
class Tr {
  static String lang = 'en'; // 'en', 'hi', 'kn'

  static String get(String key) {
    final map = _strings[key];
    if (map == null) return key;
    return map[lang] ?? map['en'] ?? key;
  }

  static const Map<String, Map<String, String>> _strings = {
    // App general
    'app_name':       {'en': 'Sakhi Smart Money', 'hi': 'सखी स्मार्ट मनी', 'kn': 'ಸಖಿ ಸ್ಮಾರ್ಟ್ ಮನಿ'},
    'tagline':        {'en': 'Women\'s Financial Literacy Game', 'hi': 'महिलाओं का वित्तीय साक्षरता खेल', 'kn': 'ಮಹಿಳೆಯರ ಹಣಕಾಸು ಸಾಕ್ಷರತೆ ಆಟ'},
    'pitch':          {'en': '"Learn money management by living it — budget, fight scams, build wealth"', 'hi': '"जीकर सीखो — बजट बनाओ, धोखे से बचो, धन बनाओ"', 'kn': '"ಜೀವಿಸುತ್ತಾ ಕಲಿಯಿರಿ — ಬಜೆಟ್, ವಂಚನೆ ತಡೆ, ಸಂಪತ್ತು"'},
    'start_game':     {'en': '▶  Start Playing', 'hi': '▶  खेलना शुरू करें', 'kn': '▶  ಆಟ ಪ್ರಾರಂಭಿಸಿ'},
    'team':           {'en': 'Innovate4FinLit · Team Sudoku Gang', 'hi': 'Innovate4FinLit · टीम सुडोकू गैंग', 'kn': 'Innovate4FinLit · ತಂಡ ಸುಡೋಕು ಗ್ಯಾಂಗ್'},

    // Feature chips
    'chip_jars':      {'en': '💰 Money Jars', 'hi': '💰 पैसों के डब्बे', 'kn': '💰 ಹಣದ ಜಾಡಿಗಳು'},
    'chip_scam':      {'en': '🛡️ Scam Safety', 'hi': '🛡️ धोखाधड़ी से सुरक्षा', 'kn': '🛡️ ವಂಚನೆ ಸುರಕ್ಷತೆ'},
    'chip_events':    {'en': '🎯 Life Challenges', 'hi': '🎯 जीवन की चुनौतियां', 'kn': '🎯 ಜೀವನ ಸವಾಲುಗಳು'},
    'chip_offline':   {'en': '📴 Offline', 'hi': '📴 ऑफलाइन', 'kn': '📴 ಆಫ್‌ಲೈನ್'},
    'chip_voice':     {'en': '🗣️ Voice Guidance', 'hi': '🗣️ आवाज़ मार्गदर्शन', 'kn': '🗣️ ಧ್ವನಿ ಮಾರ್ಗದರ್ಶನ'},
    'chip_badges':    {'en': '🏅 Badges', 'hi': '🏅 बैज', 'kn': '🏅 ಬ್ಯಾಡ್ಜ್‌ಗಳು'},

    // Nav
    'nav_home':       {'en': 'Home', 'hi': 'होम', 'kn': 'ಮನೆ'},
    'nav_income':     {'en': 'Income', 'hi': 'आमदनी', 'kn': 'ಆದಾಯ'},
    'nav_jars':       {'en': 'Jars', 'hi': 'डब्बे', 'kn': 'ಜಾಡಿಗಳು'},
    'nav_events':     {'en': 'Events', 'hi': 'घटनाएं', 'kn': 'ಘಟನೆಗಳು'},
    'nav_progress':   {'en': 'Progress', 'hi': 'प्रगति', 'kn': 'ಪ್ರಗತಿ'},

    // Meters
    'health':         {'en': 'Health', 'hi': 'स्वास्थ्य', 'kn': 'ಆರೋಗ್ಯ'},
    'stress':         {'en': 'Stress', 'hi': 'तनाव', 'kn': 'ಒತ್ತಡ'},
    'confidence':     {'en': 'Confidence', 'hi': 'आत्मविश्वास', 'kn': 'ಆತ್ಮವಿಶ್ವಾಸ'},

    // Home tab
    'home_title':     {'en': 'This Month\'s Goal', 'hi': 'इस महीने का लक्ष्य', 'kn': 'ಈ ತಿಂಗಳ ಗುರಿ'},
    'home_voice':     {'en': 'Hello Priya! What will you choose? Understand your income and put money in the right place. You can do it!', 'hi': 'नमस्ते प्रिया! आप क्या चुनेंगी? अपनी आमदनी समझो और पैसा सही जगह लगाओ। आप जरूर कर सकती हैं!', 'kn': 'ನಮಸ್ಕಾರ ಪ್ರಿಯಾ! ನೀವು ಏನು ಆರಿಸುತ್ತೀರಿ? ನಿಮ್ಮ ಆದಾಯ ಅರ್ಥಮಾಡಿಕೊಳ್ಳಿ ಮತ್ತು ಹಣವನ್ನು ಸರಿಯಾದ ಜಾಗದಲ್ಲಿ ಇಡಿ. ನೀವು ಮಾಡಬಲ್ಲಿರಿ!'},
    'monthly_target': {'en': '🎯  Monthly Target', 'hi': '🎯  मासिक लक्ष्य', 'kn': '🎯  ಮಾಸಿಕ ಗುರಿ'},
    'target_desc':    {'en': '✔  Fill Money Jar correctly → +500 pts\n✔  Avoid scams → Scam Shield Badge\n✔  Keep Debt Stress below 40%', 'hi': '✔  मनी जार सही भरो → +500 pts\n✔  धोखे से बचो → Scam Shield बैज\n✔  Debt Stress 40% से कम रखो', 'kn': '✔  ಮನಿ ಜಾರ್ ಸರಿಯಾಗಿ ತುಂಬಿ → +500 pts\n✔  ವಂಚನೆ ತಡೆ → Scam Shield ಬ್ಯಾಡ್ಜ್\n✔  Debt Stress 40% ಕ್ಕಿಂತ ಕಡಿಮೆ ಇಡಿ'},
    'saved':          {'en': 'Saved', 'hi': 'बचत', 'kn': 'ಉಳಿತಾಯ'},
    'scams_beaten':   {'en': 'Scams Beaten', 'hi': 'धोखे हराए', 'kn': 'ವಂಚನೆ ಸೋಲಿಸಿದ'},
    'decisions':      {'en': 'Decisions', 'hi': 'फैसले', 'kn': 'ನಿರ್ಧಾರಗಳು'},
    'begin_month':    {'en': '▶  Begin Month', 'hi': '▶  महीना शुरू करें', 'kn': '▶  ತಿಂಗಳು ಪ್ರಾರಂಭಿಸಿ'},
    'offline_msg':    {'en': 'Offline mode — play without internet', 'hi': 'ऑफलाइन मोड — बिना internet के भी खेलो', 'kn': 'ಆಫ್‌ಲೈನ್ ಮೋಡ್ — ಇಂಟರ್ನೆಟ್ ಇಲ್ಲದೆ ಆಡಿ'},

    // Income tab
    'income_title':   {'en': 'Income Arrived!', 'hi': 'आमदनी आई!', 'kn': 'ಆದಾಯ ಬಂತು!'},
    'income_sub':     {'en': 'See this month\'s earnings', 'hi': 'इस महीने की कमाई देखो', 'kn': 'ಈ ತಿಂಗಳ ಗಳಿಕೆ ನೋಡಿ'},
    'income_voice':   {'en': 'Your earnings have come! First see how much arrived — from business and family. Then divide wisely.', 'hi': 'आपकी कमाई आई है! पहले देखो कितना आया — business से और घर से। फिर wisely बांटना है।', 'kn': 'ನಿಮ್ಮ ಗಳಿಕೆ ಬಂದಿದೆ! ಮೊದಲು ನೋಡಿ ಎಷ್ಟು ಬಂತು — ವ್ಯವಹಾರದಿಂದ ಮತ್ತು ಕುಟುಂಬದಿಂದ. ನಂತರ ಬುದ್ಧಿವಂತಿಕೆಯಿಂದ ಹಂಚಿ.'},
    'total_income':   {'en': 'Total Monthly Income', 'hi': 'कुल मासिक आमदनी', 'kn': 'ಒಟ್ಟು ಮಾಸಿಕ ಆದಾಯ'},
    'main_expenses':  {'en': 'Main Expenses', 'hi': 'मुख्य खर्चे', 'kn': 'ಮುಖ್ಯ ಖರ್ಚುಗಳು'},
    'income_tip':     {'en': 'Keep business income separate from household money. This reduces debt!', 'hi': 'Business की कमाई को घर के पैसों से अलग रखो। इससे debt कम होती है!', 'kn': 'ವ್ಯವಹಾರದ ಆದಾಯವನ್ನು ಮನೆಯ ಹಣದಿಂದ ಪ್ರತ್ಯೇಕವಾಗಿ ಇಡಿ. ಇದು ಸಾಲ ಕಡಿಮೆ ಮಾಡುತ್ತದೆ!'},
    'next_separate':  {'en': 'Next: Separate Money →', 'hi': 'अगला: पैसे बांटो →', 'kn': 'ಮುಂದೆ: ಹಣ ಬೇರ್ಪಡಿಸಿ →'},

    // Expense labels
    'exp_groceries':  {'en': '🛒 Groceries', 'hi': '🛒 राशन', 'kn': '🛒 ದಿನಸಿ'},
    'exp_education':  {'en': '🏫 Education', 'hi': '🏫 शिक्षा', 'kn': '🏫 ಶಿಕ್ಷಣ'},
    'exp_electricity':{'en': '💡 Electricity', 'hi': '💡 बिजली', 'kn': '💡 ವಿದ್ಯುತ್'},
    'exp_business':   {'en': '🏪 Business Stock', 'hi': '🏪 व्यापार स्टॉक', 'kn': '🏪 ವ್ಯವಹಾರ ಸ್ಟಾಕ್'},
    'exp_transport':  {'en': '🚌 Transport', 'hi': '🚌 यातायात', 'kn': '🚌 ಸಾರಿಗೆ'},

    // Jars tab
    'jars_title':     {'en': 'Money Jar Puzzle', 'hi': 'मनी जार पहेली', 'kn': 'ಮನಿ ಜಾರ್ ಒಗಟು'},
    'jars_sub':       {'en': 'Put money in the right jars', 'hi': 'पैसे सही डब्बों में डालो', 'kn': 'ಹಣವನ್ನು ಸರಿಯಾದ ಜಾಡಿಗಳಲ್ಲಿ ಹಾಕಿ'},
    'jars_voice':     {'en': 'There are 4 jars — for home, shop, savings, and emergency. Put the right amount in each!', 'hi': 'ये 4 डब्बे हैं — घर, दुकान, बचत, और emergency के लिए। सही जगह पैसा डालो!', 'kn': 'ಇಲ್ಲಿ 4 ಜಾಡಿಗಳಿವೆ — ಮನೆ, ಅಂಗಡಿ, ಉಳಿತಾಯ ಮತ್ತು ತುರ್ತಿಗೆ. ಸರಿಯಾದ ಜಾಡಿಗೆ ಹಣ ಹಾಕಿ!'},
    'divide_money':   {'en': 'Divide Money — Total: ', 'hi': 'पैसे बाँटो — कुल: ', 'kn': 'ಹಣ ಹಂಚಿ — ಒಟ್ಟು: '},
    'quick_tokens':   {'en': '💴  Quick tokens — tap to add:', 'hi': '💴  जल्दी टोकन — tap करो:', 'kn': '💴  ತ್ವರಿತ ಟೋಕನ್ — ಟ್ಯಾಪ್ ಮಾಡಿ:'},
    'type_amount':    {'en': 'Or type amounts directly:', 'hi': 'या सीधे amount लिखो:', 'kn': 'ಅಥವಾ ನೇರವಾಗಿ ಮೊತ್ತ ಟೈಪ್ ಮಾಡಿ:'},
    'remaining':      {'en': 'Remaining:', 'hi': 'बचा हुआ:', 'kn': 'ಉಳಿದಿದೆ:'},
    'submit':         {'en': '✅  Submit', 'hi': '✅  Submit करो', 'kn': '✅  ಸಲ್ಲಿಸಿ'},
    'submitted':      {'en': '✅  Submitted!', 'hi': '✅  Submit हो गया!', 'kn': '✅  ಸಲ್ಲಿಸಲಾಗಿದೆ!'},

    // Jar names
    'jar_home':       {'en': 'Home', 'hi': 'घर', 'kn': 'ಮನೆ'},
    'jar_biz':        {'en': 'Business', 'hi': 'दुकान', 'kn': 'ವ್ಯವಹಾರ'},
    'jar_save':       {'en': 'Savings', 'hi': 'बचत', 'kn': 'ಉಳಿತಾಯ'},
    'jar_emrg':       {'en': 'Emergency', 'hi': 'आपातकाल', 'kn': 'ತುರ್ತು'},

    // Events tab
    'event_step':     {'en': 'Life Event', 'hi': 'जीवन की घटना', 'kn': 'ಜೀವನ ಘಟನೆ'},
    'event_sub':      {'en': 'A challenge has arrived!', 'hi': 'एक चुनौती आई!', 'kn': 'ಒಂದು ಸವಾಲು ಬಂತು!'},
    'event_voice':    {'en': 'Priya, think carefully before deciding. Use your savings and emergency fund wisely!', 'hi': 'प्रिया, सोचकर फैसला करो। अपनी बचत और emergency fund का सही उपयोग करो!', 'kn': 'ಪ್ರಿಯಾ, ಎಚ್ಚರಿಕೆಯಿಂದ ನಿರ್ಧರಿಸಿ. ನಿಮ್ಮ ಉಳಿತಾಯ ಮತ್ತು ತುರ್ತು ನಿಧಿಯನ್ನು ಸರಿಯಾಗಿ ಬಳಸಿ!'},
    'what_will_you':  {'en': 'What Will You Do?', 'hi': 'आप क्या करेंगी?', 'kn': 'ನೀವು ಏನು ಮಾಡುತ್ತೀರಿ?'},
    'think_time':     {'en': '⏱  Think time: 0:45', 'hi': '⏱  सोचने का वक्त: 0:45', 'kn': '⏱  ಯೋಚನೆ ಸಮಯ: 0:45'},
    'scam_challenge': {'en': '⚡  Scam Challenge →', 'hi': '⚡  Scam चुनौती →', 'kn': '⚡  ವಂಚನೆ ಸವಾಲು →'},

    // Scam
    'scam_title':     {'en': '🚨 Scam Alert!', 'hi': '🚨 धोखे की चेतावनी!', 'kn': '🚨 ವಂಚನೆ ಎಚ್ಚರಿಕೆ!'},
    'scam_sub':       {'en': 'Be careful — it could be a trap', 'hi': 'सावधान — यह धोखा हो सकता है', 'kn': 'ಎಚ್ಚರಿಕೆ — ಇದು ಬಲೆ ಆಗಿರಬಹುದು'},
    'scam_voice':     {'en': 'Priya, stop! Does this seem real? Look at the red flags — don\'t be in a hurry!', 'hi': 'प्रिया, रुको! यह सच लग रहा है? Red flags देखो — जल्दी मत करो!', 'kn': 'ಪ್ರಿಯಾ, ನಿಲ್ಲಿ! ಇದು ನಿಜ ಅನ್ನಿಸುತ್ತಿದೆಯೇ? ಅಪಾಯ ಸಂಕೇತಗಳನ್ನು ನೋಡಿ — ಆತುರ ಬೇಡ!'},
    'red_flags':      {'en': '🚩  Red Flags:', 'hi': '🚩  Red Flags:', 'kn': '🚩  ಅಪಾಯ ಸಂಕೇತಗಳು:'},
    'your_response':  {'en': 'Your Response?', 'hi': 'आपका जवाब?', 'kn': 'ನಿಮ್ಮ ಉತ್ತರ?'},
    'scam_tip':       {'en': 'Real banks never ask for OTP or Aadhaar on the phone. Always call the official number.', 'hi': 'असली banks कभी OTP या Aadhaar phone पर नहीं मांगते। हमेशा official number पर call करो।', 'kn': 'ನಿಜವಾದ ಬ್ಯಾಂಕ್‌ಗಳು ಫೋನ್‌ನಲ್ಲಿ OTP ಅಥವಾ Aadhaar ಕೇಳುವುದಿಲ್ಲ. ಯಾವಾಗಲೂ ಅಧಿಕೃತ ನಂಬರ್‌ಗೆ ಕರೆ ಮಾಡಿ.'},
    'see_progress':   {'en': '📊  See Progress →', 'hi': '📊  Progress देखो →', 'kn': '📊  ಪ್ರಗತಿ ನೋಡಿ →'},

    // Progress tab
    'achievements':   {'en': 'Achievement Badges', 'hi': 'उपलब्धि बैज', 'kn': 'ಸಾಧನೆ ಬ್ಯಾಡ್ಜ್‌ಗಳು'},
    'monthly_report': {'en': 'Monthly Report', 'hi': 'मासिक रिपोर्ट', 'kn': 'ಮಾಸಿಕ ವರದಿ'},
    'next_month':     {'en': 'Next Month →', 'hi': 'अगला महीना →', 'kn': 'ಮುಂದಿನ ತಿಂಗಳು →'},
    'final_results':  {'en': '🏆 Final Results!', 'hi': '🏆 अंतिम परिणाम!', 'kn': '🏆 ಅಂತಿಮ ಫಲಿತಾಂಶ!'},
    'total_score':    {'en': 'Total Score', 'hi': 'कुल स्कोर', 'kn': 'ಒಟ್ಟು ಸ್ಕೋರ್'},
    'months_done':    {'en': 'Months Done', 'hi': 'महीने पूरे', 'kn': 'ತಿಂಗಳು ಮುಗಿದಿದೆ'},
    'xp_remaining':   {'en': 'XP to next level', 'hi': 'अगले level के लिए XP', 'kn': 'ಮುಂದಿನ ಹಂತಕ್ಕೆ XP'},

    // Badge names
    'badge_scam':     {'en': 'Scam Shield', 'hi': 'Scam शील्ड', 'kn': 'ಸ್ಕ್ಯಾಮ್ ಶೀಲ್ಡ್'},
    'badge_saver':    {'en': 'Smart Saver', 'hi': 'स्मार्ट बचतकर्ता', 'kn': 'ಸ್ಮಾರ್ಟ್ ಉಳಿತಾಯಗಾರ'},
    'badge_boss':     {'en': 'Budget Boss', 'hi': 'बजट बॉस', 'kn': 'ಬಜೆಟ್ ಬಾಸ್'},
    'badge_queen':    {'en': 'Digital Queen', 'hi': 'डिजिटल रानी', 'kn': 'ಡಿಜಿಟಲ್ ರಾಣಿ'},
    'badge_scam_d':   {'en': 'Defeat 1 scam', 'hi': '1 scam हराओ', 'kn': '1 ವಂಚನೆ ಸೋಲಿಸಿ'},
    'badge_saver_d':  {'en': 'Save ₹2,000+', 'hi': '₹2,000+ बचाओ', 'kn': '₹2,000+ ಉಳಿಸಿ'},
    'badge_boss_d':   {'en': 'Score 500+ pts', 'hi': '500+ pts पाओ', 'kn': '500+ pts ಗಳಿಸಿ'},
    'badge_queen_d':  {'en': '5 decisions + 2 scams', 'hi': '5 फैसले + 2 scam', 'kn': '5 ನಿರ್ಧಾರ + 2 ವಂಚನೆ'},

    // Report rows
    'rep_health':     {'en': 'Financial Health', 'hi': 'वित्तीय स्वास्थ्य', 'kn': 'ಆರ್ಥಿಕ ಆರೋಗ್ಯ'},
    'rep_stress':     {'en': 'Debt Stress', 'hi': 'कर्ज का तनाव', 'kn': 'ಸಾಲದ ಒತ್ತಡ'},
    'rep_conf':       {'en': 'Confidence', 'hi': 'आत्मविश्वास', 'kn': 'ಆತ್ಮವಿಶ್ವಾಸ'},
    'rep_scams':      {'en': 'Scams Beaten', 'hi': 'धोखे हराए', 'kn': 'ವಂಚನೆ ಸೋಲಿಸಿದ'},
    'rep_dec':        {'en': 'Smart Decisions', 'hi': 'अच्छे फैसले', 'kn': 'ಬುದ್ಧಿವಂತ ನಿರ್ಧಾರಗಳು'},
    'rep_saved':      {'en': 'Total Saved', 'hi': 'कुल बचत', 'kn': 'ಒಟ್ಟು ಉಳಿತಾಯ'},

    // Result dialog
    'great_choice':   {'en': 'Great choice!', 'hi': 'बहुत बढ़िया!', 'kn': 'ಉತ್ತಮ ಆಯ್ಕೆ!'},
    'learn_from':     {'en': 'Learn from this', 'hi': 'इससे सीखो', 'kn': 'ಇದರಿಂದ ಕಲಿಯಿರಿ'},
    'scam_caught':    {'en': 'Scam Defeated!', 'hi': 'Scam हरा दिया!', 'kn': 'ವಂಚನೆ ಸೋಲಿಸಿದೆ!'},
    'scam_lost':      {'en': 'Got Scammed!', 'hi': 'Scam में फंस गई!', 'kn': 'ವಂಚನೆಗೆ ಬಿದ್ದಿರಿ!'},
    'continue_btn':   {'en': 'OK, let\'s continue', 'hi': 'ठीक है, आगे चलते हैं', 'kn': 'ಸರಿ, ಮುಂದುವರಿಯೋಣ'},
    'perfect_jars':   {'en': 'Perfect Split!', 'hi': 'परफेक्ट बंटवारा!', 'kn': 'ಪರಿಪೂರ್ಣ ವಿಭಜನೆ!'},
    'wrong_jars':     {'en': 'Some jars were wrong', 'hi': 'कुछ डब्बे गलत थे', 'kn': 'ಕೆಲವು ಜಾಡಿಗಳು ತಪ್ಪಾಗಿದ್ದವು'},

    // Level names
    'lvl1': {'en': 'Budget Beginner', 'hi': 'बजट शुरुआत', 'kn': 'ಬಜೆಟ್ ಆರಂಭಿಕ'},
    'lvl2': {'en': 'Money Manager',   'hi': 'पैसों की प्रबंधक', 'kn': 'ಹಣ ವ್ಯವಸ್ಥಾಪಕ'},
    'lvl3': {'en': 'Budget Boss',     'hi': 'बजट बॉस', 'kn': 'ಬಜೆಟ್ ಬಾಸ್'},
    'lvl4': {'en': 'Money Master',    'hi': 'पैसों की मास्टर', 'kn': 'ಹಣ ಮಾಸ್ಟರ್'},
    'lvl5': {'en': 'Finance Queen',   'hi': 'वित्त रानी', 'kn': 'ಹಣಕಾಸು ರಾಣಿ'},

    // Win screen
    'year_done':      {'en': 'Year Complete!', 'hi': 'एक साल पूरा!', 'kn': 'ಒಂದು ವರ್ಷ ಪೂರ್ಣ!'},
    'year_body':      {'en': 'An amazing year-long journey! You have built real financial skills.', 'hi': 'एक साल की अद्भुत यात्रा! आपने सच्ची वित्तीय skills सीखीं।', 'kn': 'ಒಂದು ವರ್ಷದ ಅದ್ಭುತ ಪ್ರಯಾಣ! ನೀವು ನಿಜವಾದ ಹಣಕಾಸು ಕೌಶಲ್ಯ ಕಲಿತಿರಿ.'},
    'play_again':     {'en': 'Play Again', 'hi': 'फिर खेलो', 'kn': 'ಮತ್ತೆ ಆಡಿ'},

    // Language picker
    'choose_lang':    {'en': 'Choose Language', 'hi': 'भाषा चुनें', 'kn': 'ಭಾಷೆ ಆರಿಸಿ'},
  };
}
