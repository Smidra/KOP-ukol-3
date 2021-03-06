import brute_force
import brute_force_cut
import branch_and_bound
import greedy  # Greedy algorithm
import redux  # Redux algorithm
import dynamic  # Dynamic programming solution
import FPTAS  # FPTAS alrgorithm


# Represents one instance of a thing used in a Knapsack problem
class Thing:
    def __init__(self, weight, value):
        self.weight = weight
        self.value = value
        self.ratio = value / weight
        self.sequence = -1

    # For print(item1) usage
    def __str__(self):
        return "--- Item ---\n" \
               "- Weight: %d\n" \
               "- Value:  %d\n" \
               "- Ratio:  %f" % (self.weight, self.value, self.ratio)

    # For listing things inside instance
    def __repr__(self):
        # return "%d/%d/%f" % (self.weight, self.value, self.ratio)
        return "%d/%d" % (self.weight, self.value)


# Represents one instance of a Knapsack problem
class KnapsackInstance:
    def __init__(self, id, expecting_things, limit_weight, min_cost):
        self.id = id
        self.expecting_things = expecting_things
        self.limit_weight = limit_weight
        self.original_limit_weight = limit_weight
        self.min_cost = min_cost
        self.current_things = 0
        self.complexity = -1
        self.complexity_brute = -1
        self.time = -1
        self.things_array = []
        self.best_cost = -1
        self.best_solution = []
        self.best_acceptable_cost = -1
        self.best_acceptable_solution = []
        self.value_of_all = 0

        self.decompose_array = []
        self.decompose_builder = []

        self.best_cost_reduced = -1

    # Appends one more thing to the array of things in this knapsack problem
    def add_thing(self, thing):
        self.things_array.append(thing)
        self.things_array[-1].sequence = self.current_things
        self.current_things += 1
        self.value_of_all = self.value_of_all + thing.value

    # For printing the instance
    def __str__(self):
        return "=== Knapsack instance nr.%d ===\n" \
               "- Limit weight:  %d\n" \
               "- Nr. of things: %d\n" \
               "- Minimal cost:  %d\n" \
               "- Best cost:    %d\n" \
               "- Best solution:%s\n" \
               "- Complexity:   %d\n" \
               "- Brute force:  %d\n" \
               "- Time:         %f\n" \
               "- Things: %s" % (
                   self.id, self.limit_weight, self.current_things, self.min_cost, self.best_cost, self.best_solution,
                   self.complexity, self.complexity_brute, self.time, self.things_array)

    # For printing the decompose array
    def print_decompose(self):
        for word in self.decompose_array:
            print(word)
        return

    # Brute force without cutting
    solve_brute = brute_force.solve_brute
    brute = brute_force.brute

    # Solve the instance brute force with cutting
    solve_brute_cut = brute_force_cut.solve_brute_cut
    brute_cut = brute_force_cut.brute_cut

    # Solve the instance with branch and bound cutting (weight+cost)
    solve_branch_and_bound = branch_and_bound.solve_branch_and_bound
    branch_and_bound = branch_and_bound.branch_and_bound

    # Greedy
    solve_greedy = greedy.solve_greedy

    # Redux
    solve_redux = redux.solve_redux

    # Dynamic
    solve_dynamic = dynamic.dynamic

    # Redux
    solve_fptas = FPTAS.fptas
