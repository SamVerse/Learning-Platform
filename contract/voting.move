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

        // Increase the learner's token balance
        learner_data.tokens = learner_data.tokens + amount;
    }

    /// Function for a learner to spend tokens on additional courses.
    public fun spend_tokens(learner: &signer, amount: u64) acquires Learner {
        let learner_address = signer::address_of(learner);
        let learner_data = borrow_global_mut<Learner>(learner_address);

        assert!(learner_data.tokens >= amount, 1); // Ensure sufficient tokens

        // Deduct the spent tokens
        learner_data.tokens = learner_data.tokens - amount;
    }

    /// Function to get the balance of a learner's tokens
    public fun get_balance(learner_address: address): u64 acquires Learner {
        borrow_global<Learner>(learner_address).tokens
    }
}
