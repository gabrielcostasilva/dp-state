# frozen_string_literal: true

module Billing
  class BasePlan
    def calculate_cost
      raise NotImplementedError, "This method should be overridden in subclasses"
    end
  end

  class FreePlan < BasePlan
    def calculate_cost
      # Free plans do not incur any cost
      0
    end
  end

  class SubscriptionPlan < BasePlan
    def calculate_cost
      # Subscription plans have a fixed monthly fee
      9.99
    end
  end

  class PayPerUsePlan < BasePlan
    def calculate_cost
      # Pay-per-use plans charge based on usage
      # For example, let's assume a cost of $0.10 per unit used
      usage_units = 100 # This would typically be dynamic
      usage_units * 0.10
    end
  end

  class BillingService
    def initialize(plan)
      @plan = plan
    end

    def calculate_cost
      @plan.calculate_cost
    rescue NotImplementedError => e
      raise Error, "Cost calculation failed: #{e.message}"
    end
  end
end
