import copy  # for deep copy


# Solve the instance brute force
def solve_dynamic(self):
    builder = []
    w, h = self.current_things + 1, self.value_of_all + 1
    self.decompose_array = [[-1] * w for i in range(h)]
    # print("Created array %d x %d" % (w, h))

    self.dynamic(self.limit_weight, 0, 0, builder)

    # for word in self.decompose_array:
    #     print(word)

    cost = -1
    weight = -1
    # Iterate tle last column of cost decomposition
    for i in self.decompose_array:
        cost += 1
        if i[w - 1] <= self.original_limit_weight and i[w - 1] != -1:
            # Found possible knapsack configuration
            if cost > self.best_cost:
                self.best_cost = cost
                weight = i[w - 1]

    self.best_solution = self.builders_map[(weight, self.best_cost)]

    return


# Dynamic programming recursion finction
# lim_weight = weight "left" in knapsack
# total_cost = sum of costs from all the stuff packed
# size = which item am I trying now
# solution_builder = writes don the solution as it is made
def dynamic(self, lim_weight, total_cost, size, solution_builder):
    # Is it a leaf? (End recursion)
    if size == self.current_things:
        return self.original_limit_weight - lim_weight

    # We will take it (1)
    # Has this been done before?
    next_price = total_cost + self.things_array[size].value
    next_weight = lim_weight - self.things_array[size].weight
    if self.decompose_array[next_price][size] == -1:
        tmp = copy.copy(solution_builder)
        tmp.append(1)
        self.decompose_array[next_price][size] = self.dynamic(lim_weight=next_weight,
                                                                  total_cost=next_price,
                                                                  size=size + 1,
                                                                  solution_builder=tmp)
        if size + 1 == self.current_things:
            self.builders_map[(self.decompose_array[next_price][size + 1], next_price)] = tmp

    # We will leave it (0)
    # Has this been done before?
    if self.decompose_array[total_cost][size] == -1:
        tmp = copy.copy(solution_builder)
        tmp.append(0)
        self.decompose_array[total_cost][size] = self.dynamic(lim_weight=lim_weight,
                                                                  total_cost=total_cost,
                                                                  size=size + 1,
                                                                  solution_builder=tmp)
        if size + 1 == self.current_things:
            self.builders_map[(self.decompose_array[total_cost][size + 1], total_cost)] = tmp

    return self.original_limit_weight - lim_weight
