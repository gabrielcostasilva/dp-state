# frozen_string_literal: true

module Billing
  class Error < StandardError; end

  class BasePlan
    def calculate_cost
      raise NotImplementedError, "This method should be overridden in subclasses"
    end
  end

  class FreePlan < BasePlan
  end

  class SubscriptionPlan < BasePlan
  end

  class PayPerUsePlan < BasePlan
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
