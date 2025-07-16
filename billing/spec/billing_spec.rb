# frozen_string_literal: true

require_relative "spec_helper"
require "billing"
RSpec.describe Billing do
  context "when instantiate a billing plan" do
    it "creates a FreePlan instance" do
      plan = Billing::FreePlan.new
      expect(plan).to be_a(Billing::FreePlan)
    end

    it "creates a SubscriptionPlan instance" do
      plan = Billing::SubscriptionPlan.new
      expect(plan).to be_a(Billing::SubscriptionPlan)
    end

    it "creates a PayPerUsePlan instance" do
      plan = Billing::PayPerUsePlan.new
      expect(plan).to be_a(Billing::PayPerUsePlan)
    end
  end

  context "when calculating cost" do
    it "raises NotImplementedError for FreePlan" do
      plan = Billing::FreePlan.new
      service = Billing::BillingService.new(plan)
      expect(service.calculate_cost).to eq(0)
    end
    
    it "raises NotImplementedError for SubscriptionPlan" do
      plan = Billing::SubscriptionPlan.new
      service = Billing::BillingService.new(plan)
      expect(service.calculate_cost).to eq(9.99)
    end
    
    it "raises NotImplementedError for PayPerUsePlan" do
      plan = Billing::PayPerUsePlan.new
      service = Billing::BillingService.new(plan)
      expect(service.calculate_cost).to eq(10.0)
    end
  end
end
