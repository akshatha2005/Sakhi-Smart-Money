class EventChoice {
  final String text;
  final String emoji;
  final int pts;
  final int health;
  final int stress;
  final int conf;
  final int debt;
  final String msg;
  const EventChoice({
    required this.text, required this.emoji, required this.pts,
    this.health = 0, this.stress = 0, this.conf = 0, this.debt = 0,
    required this.msg,
  });
}

class LifeEvent {
  final String icon;
  final String title;
  final String desc;
  final List<EventChoice> choices;
  const LifeEvent({required this.icon, required this.title, required this.desc, required this.choices});
}

class ScamChoice {
  final String text;
  final bool isScam;
  final int pts;
  final int stress;
  final int conf;
  final String msg;
  const ScamChoice({
    required this.text, required this.isScam, required this.pts,
    this.stress = 0, this.conf = 0, required this.msg,
  });
}

class ScamEvent {
  final String type;
  final String urgency;
  final String sender;
  final String message;
  final List<String> redFlags;
  final List<ScamChoice> choices;
  const ScamEvent({
    required this.type, required this.urgency, required this.sender,
    required this.message, required this.redFlags, required this.choices,
  });
}

const List<LifeEvent> lifeEvents = [
  LifeEvent(
    icon: '🎒', title: 'School Admission Fee Crisis!',
    desc: 'School demands ₹3,000 in 3 days. Your savings jar has ₹2,000.',
    choices: [
      EventChoice(text: 'Use Emergency Jar Money', emoji: '💚', pts: 50, health: 5, stress: -10, conf: 5,
        msg: 'Smart! You planned for emergencies. Emergency jar used wisely.'),
      EventChoice(text: 'Take from Business Jar', emoji: '⚠️', pts: -20, health: -5, stress: 15, conf: -5,
        msg: 'This weakens your business capital. Try to replenish next month.'),
      EventChoice(text: 'Quick Loan from App', emoji: '❌', pts: -100, health: -15, stress: 50, conf: -15, debt: 500,
        msg: 'High-interest loan apps trap women in debt cycles. Avoid these!'),
      EventChoice(text: 'Request Extension from School', emoji: '🤝', pts: 30, stress: 5, conf: 10,
        msg: 'Good communication! Schools often give extensions to honest parents.'),
    ],
  ),
  LifeEvent(
    icon: '🤒', title: 'Medical Emergency',
    desc: 'Family member needs urgent treatment. Cost: ₹4,500.',
    choices: [
      EventChoice(text: 'Use Emergency Fund', emoji: '💚', pts: 80, health: 10, stress: -15, conf: 15,
        msg: 'Exactly what emergency funds are for! Your planning paid off.'),
      EventChoice(text: 'Borrow from Neighbor', emoji: '⚠️', pts: 10, health: -5, stress: 20, debt: 300,
        msg: 'Borrowing adds social pressure. Plan better for next month.'),
      EventChoice(text: 'Medical Loan App', emoji: '❌', pts: -80, health: -10, stress: 40, conf: -10, debt: 700,
        msg: 'High interest medical loans create long-term stress. Use proper funds.'),
      EventChoice(text: 'Visit Government Hospital', emoji: '🏛️', pts: 60, health: 5, stress: -5, conf: 10,
        msg: 'Smart! Government hospitals provide quality care at low cost.'),
    ],
  ),
  LifeEvent(
    icon: '🎊', title: 'Festival Season!',
    desc: 'Diwali is here! Family expects celebrations. Budget: ₹2,000.',
    choices: [
      EventChoice(text: 'Celebrate within savings', emoji: '💚', pts: 60, health: 5, stress: -10, conf: 15,
        msg: 'Balance is key! Celebrate smartly without breaking the bank.'),
      EventChoice(text: 'Buy on credit/EMI', emoji: '⚠️', pts: -30, health: -5, stress: 30, conf: -5, debt: 400,
        msg: 'EMIs eat into next month\'s budget. Plan festival funds in advance.'),
      EventChoice(text: 'Cut household budget', emoji: '✂️', pts: 20, health: -10, stress: 10,
        msg: 'Compromising essentials is risky. Build a festival sub-fund next year.'),
      EventChoice(text: 'Homemade gifts & minimal spend', emoji: '🎁', pts: 70, health: 10, stress: -15, conf: 20,
        msg: 'Wonderful! Thoughtful gifts mean more than expensive ones.'),
    ],
  ),
  LifeEvent(
    icon: '🌧️', title: 'Crop Damage / Business Loss',
    desc: 'Unexpected loss of ₹3,000 in business income this month.',
    choices: [
      EventChoice(text: 'Use Business Reserve Jar', emoji: '💼', pts: 60, health: 5, stress: -5, conf: 10,
        msg: 'Excellent! Keeping business reserves separate saved you this month.'),
      EventChoice(text: 'Use Family Savings', emoji: '⚠️', pts: -10, health: -5, stress: 20, conf: -10,
        msg: 'Mixing family and business money creates confusion. Keep them separate!'),
      EventChoice(text: 'Apply for MUDRA Loan', emoji: '🏛️', pts: 40, stress: 10, conf: 5,
        msg: 'Smart! Government MUDRA loans have low interest for small businesses.'),
      EventChoice(text: 'Reduce business expenses', emoji: '📉', pts: 30, stress: -5, conf: 10,
        msg: 'Good thinking! Cutting costs during tough times is wise management.'),
    ],
  ),
  LifeEvent(
    icon: '🏡', title: 'House Repair Needed',
    desc: 'Roof needs urgent repair. Cost estimate: ₹6,000.',
    choices: [
      EventChoice(text: 'Use Emergency + Savings', emoji: '💚', pts: 70, health: 10, stress: -10, conf: 15,
        msg: 'Perfect planning! This is exactly why we maintain multiple savings jars.'),
      EventChoice(text: 'Delay for 2 months', emoji: '⏳', pts: 20, stress: 15, conf: -5,
        msg: 'Delaying repairs can worsen damage. Try to fix promptly if possible.'),
      EventChoice(text: 'Take Personal Loan from Bank', emoji: '🏦', pts: 10, stress: 25, debt: 600,
        msg: 'Bank loans are safer than apps but still add to debt burden.'),
      EventChoice(text: 'SHG (Self Help Group) Support', emoji: '👥', pts: 50, health: 5, stress: 5, conf: 20,
        msg: 'Brilliant! SHG networks provide community support at low or zero interest.'),
    ],
  ),
];

const List<ScamEvent> scamEvents = [
  ScamEvent(
    type: 'OTP Scam', urgency: 'LIVE SCAM! Respond in 01:30',
    sender: 'Bank of India Official\n+91 98765 43210',
    message: '"Madam, your account is BLOCKED urgently. Share OTP immediately or account closes tomorrow. Tell the 6-digit code from SMS right now!"',
    redFlags: ['Creating urgency & panic', 'Asking for OTP on call', 'Threatening consequences', 'Unofficial phone number'],
    choices: [
      ScamChoice(text: 'Share OTP to Save Account', isScam: true, pts: -200, stress: 50, conf: -20,
        msg: 'You lost money to a scam! Real banks NEVER ask for OTP on calls. Always hang up immediately.'),
      ScamChoice(text: 'Cut Call & Visit Bank Branch', isScam: false, pts: 300, stress: -10, conf: 20,
        msg: 'Excellent! You identified the scam correctly. Banks never ask for OTP by phone.'),
      ScamChoice(text: 'Call Official Bank Number First', isScam: false, pts: 150, conf: 15,
        msg: 'Good thinking! Always verify using official numbers before sharing anything.'),
    ],
  ),
  ScamEvent(
    type: 'Fake Loan App', urgency: '⚠️ Suspicious Message Received',
    sender: 'FastCash Loans™\nSMS: FM-FASTCS',
    message: '"Congratulations! You are pre-approved for ₹50,000 loan. No documents needed. Click link now and get instant transfer. Offer expires in 10 minutes!"',
    redFlags: ['No documentation required', 'Extreme time pressure (10 min!)', 'Unsolicited offer', 'Unofficial SMS sender ID'],
    choices: [
      ScamChoice(text: 'Click Link for Instant Loan', isScam: true, pts: -150, stress: 40, conf: -15,
        msg: 'Scam! Fake loan links steal your banking details and personal information.'),
      ScamChoice(text: 'Report & Block the Number', isScam: false, pts: 250, stress: -5, conf: 20,
        msg: 'Perfect! Reporting scam messages protects you and others in your community.'),
      ScamChoice(text: 'Research Company on RBI Website', isScam: false, pts: 180, conf: 15,
        msg: 'Smart! Always verify financial companies through RBI\'s official website.'),
    ],
  ),
  ScamEvent(
    type: 'QR Code Fraud', urgency: '🚨 QR Payment Scam Alert',
    sender: 'Unknown Online Buyer\nOLX / Facebook Marketplace',
    message: '"I want to buy your product. I am sending money via QR code. Please SCAN this QR to RECEIVE ₹5,000. Very urgent, scan now to get your money!"',
    redFlags: ['Scanning QR to RECEIVE (wrong!)', 'Creating urgency', 'Unknown online buyer', 'Too good to be true offer'],
    choices: [
      ScamChoice(text: 'Scan QR Code to Receive Money', isScam: true, pts: -200, stress: 50, conf: -20,
        msg: 'Scam! Scanning QR codes SENDS money, it never receives it. You pay, not receive!'),
      ScamChoice(text: 'Refuse & Ask for Bank Transfer', isScam: false, pts: 300, stress: -10, conf: 25,
        msg: 'Absolutely correct! You can only RECEIVE money via UPI ID or account number, never by scanning.'),
      ScamChoice(text: 'Ask Family Member to Verify', isScam: false, pts: 200, stress: -5, conf: 15,
        msg: 'Wise! Consulting trusted people before financial transactions is always smart.'),
    ],
  ),
  ScamEvent(
    type: 'Fake KYC Update', urgency: '⚠️ KYC Expiry Warning',
    sender: 'NPCI India Official\nSMS: VK-NPCIOF',
    message: '"Your UPI will be BLOCKED in 24 hours. Update KYC immediately by clicking the link and entering your Aadhaar and bank details. Avoid service disruption!"',
    redFlags: ['Fake urgency (24 hours)', 'Asking for Aadhaar + bank details', 'Link in SMS is suspicious', 'NPCI never sends such messages'],
    choices: [
      ScamChoice(text: 'Click Link and Enter Aadhaar', isScam: true, pts: -250, stress: 60, conf: -25,
        msg: 'Identity theft! Never share Aadhaar + bank details via links. NPCI never sends KYC update links.'),
      ScamChoice(text: 'Update KYC at Bank Branch', isScam: false, pts: 200, conf: 20,
        msg: 'Perfect! Always update KYC in person at your bank branch, never through links.'),
      ScamChoice(text: 'Ignore and Report to Cybercrime', isScam: false, pts: 280, stress: -10, conf: 25,
        msg: 'Excellent! Report cyber fraud at cybercrime.gov.in or call 1930.'),
    ],
  ),
];
