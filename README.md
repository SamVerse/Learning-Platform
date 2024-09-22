# LearningPlatform

## Vision
The LearningPlatform aims to revolutionize the educational landscape by incentivizing learners with a token system that rewards course completion. This approach not only enhances user engagement but also promotes lifelong learning and skill acquisition.

## Features
- **Token Management**: Learners can earn skill tokens for completing courses, which can be used to access additional educational content.
- **Account Initialization**: Users can easily create and initialize their accounts to start earning tokens.
- **Earning Tokens**: A straightforward process allows learners to earn tokens upon successful completion of courses.
- **Spending Tokens**: Learners can spend their earned tokens on further courses, creating a seamless learning experience.
- **Balance Tracking**: Users can check their token balance to manage their educational investments effectively.

## Future Scope
- **Course Expansion**: Integrate a wider variety of courses and educational materials for users to choose from.
- **Enhanced User Experience**: Introduce gamification features such as achievements and leaderboards to motivate learners.
- **Mobile Application**: Develop a mobile app to provide users with on-the-go access to courses and token management.
- **Community Engagement**: Implement forums and peer support features to foster a collaborative learning environment.

## Smart Contract Information
The LearningPlatform utilizes a Move smart contract implemented as follows:

```move
module LearningPlatform::SkillToken { 
    use aptos_framework::signer;

    /// Struct representing a learner with their earned tokens.
    struct Learner has key {
        tokens: u64, // Total tokens earned by the learner
    }

    /// Function to initialize a learner's account
    public fun initialize(learner: &signer) {
        let learner_data = Learner { tokens: 0 };
        move_to(learner, learner_data);
    }

    /// Function for a learner to earn tokens for completing a course.
    public fun earn_tokens(learner: &signer, amount: u64) acquires Learner {
        let learner_address = signer::address_of(learner);
        let learner_data = borrow_global_mut<Learner>(learner_address);
        learner_data.tokens = learner_data.tokens + amount;
    }

    /// Function for a learner to spend tokens on additional courses.
    public fun spend_tokens(learner: &signer, amount: u64) acquires Learner {
        let learner_address = signer::address_of(learner);
        let learner_data = borrow_global_mut<Learner>(learner_address);
        assert!(learner_data.tokens >= amount, 1); // Ensure sufficient tokens
        learner_data.tokens = learner_data.tokens - amount;
    }

    /// Function to get the balance of a learner's tokens
    public fun get_balance(learner_address: address): u64 acquires Learner {
        borrow_global<Learner>(learner_address).tokens
    }
}
```

### Contract Functions
1. **`initialize(learner: &signer)`**: Initializes a learner's account with zero tokens.
2. **`earn_tokens(learner: &signer, amount: u64)`**: Allows a learner to earn tokens for course completion, updating their token balance.
3. **`spend_tokens(learner: &signer, amount: u64)`**: Enables learners to spend their earned tokens on additional courses, ensuring they have sufficient balance.
4. **`get_balance(learner_address: address)`**: Retrieves the current token balance of the specified learner.

This contract manages the lifecycle of skill tokens, providing a secure and efficient way for learners to earn and utilize their tokens.

---

Feel free to adjust any details to better fit your project's specifics!
## Deployment
contract Address:
https://explorer.aptoslabs.com/account/0xd5636a7864e70e1f6c347e2895fac26c9d7eaf7a67bb3f97f2c3ab633d584d85?network=devnet

Transaction Hash: 0xd5636a7864e70e1f6c347e2895fac26c9d7eaf7a67bb3f97f2c3ab633d584d85

![image](https://github.com/user-attachments/assets/24c4f431-355a-43cc-8edf-2625f9591250)

## Contact Information
email: sameersingh192004@gmail.com

This contract manages the token lifecycle, allowing for the initialization of learner accounts, earning and spending of tokens, and querying token balances.

---
