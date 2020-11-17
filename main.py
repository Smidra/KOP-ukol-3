import sys  # work with arguments
from classes import *  # Custom made classes file
import time


# Read arguments, control program flow
def main():
    # Load instances from file to objects
    instances_file = []
    load_instances_file(sys.argv[1], instances_file)

    # Solve every instance
    for i in range(0, file_len(sys.argv[1])):
    # for i in range(3, 4):
        start = time.process_time()
        # instances_file[i].solve_brute()
        # instances_file[i].solve_brute_cut()
        # instances_file[i].solve_branch_and_bound()
        # instances_file[i].solve_greedy()
        instances_file[i].solve_redux()
        # instances_file[i].solve_dynamic()
        # instances_file[i].solve_fptas(0.1)
        # instances_file[i].solve_fptas(0.3)
        # instances_file[i].solve_fptas(0.5)
        # instances_file[i].solve_fptas(0.9)
        end = time.process_time()
        # print("Elapsed time is %f" % (float(end-start)))
        instances_file[i].time = float(end - start)
        print(instances_file[i])

    # Save the constructed solution for diff comparison
    save_solution_file(sys.argv[2], instances_file)
    # Save the calculated complexity
    save_complexity_file(sys.argv[3], instances_file)

    better_output(sys.argv[4], instances_file, sys.argv[5])
    return


# Count lines in a file
# Source: https://stackoverflow.com/questions/845058/how-to-get-line-count-of-a-large-file-cheaply-in-python
def file_len(fname):
    with open(fname) as f:
        for i, l in enumerate(f):
            pass
    return i + 1

# Better output
def better_output( solution_location, instances_array, save_summary):
    # Open file with instances
    f = open(solution_location, "r")

    #
    item_nr = 0
    max_time = 0
    avg_time = 0
    max_error = 0
    avg_error = 0

    for line in f:
        line = line.split()
        if instances_array[item_nr].id != int(line[0]):
            # print("Item nr> %d != %d <Currently reading" % (item_nr+1, int(line[0])))
            continue
        correct_solution = line[2]
        calculated_solution = instances_array[item_nr].best_cost
        if int(correct_solution) != 0:
            absolute_calculation_error = abs(calculated_solution - int(correct_solution))
            one_percent = float(float(correct_solution)/100)
            # print("One percent from %d is %f" % ( int(correct_solution), one_percent ) )
            calculation_error = float(absolute_calculation_error/one_percent)
        calculation_time = instances_array[item_nr].time
        max_error=max(max_error, calculation_error)
        max_time=max(max_time, calculation_time)
        avg_time += calculation_time
        avg_error += calculation_error
        item_nr += 1
        # print("Item %d OK" % (item_nr-1) )
    # for line in f:
    #     line = line.split()
    #     if item_nr+1 != int(line[0]):
    #         # print("Item nr> %d != %d <Currently reading" % (item_nr+1, int(line[0])))
    #         continue
    #     correct_solution = line[2]
    #     calculated_solution = instances_array[item_nr].best_cost
    #     if int(correct_solution) != 0:
    #         absolute_calculation_error = abs(calculated_solution - int(correct_solution))
    #         one_percent = float(float(correct_solution)/100)
    #         # print("One percent from %d is %f" % ( int(correct_solution), one_percent ) )
    #         calculation_error = float(absolute_calculation_error/one_percent)
    #     calculation_time = instances_array[item_nr].time
    #     max_error=max(max_error, calculation_error)
    #     max_time=max(max_time, calculation_time)
    #     avg_time += calculation_time
    #     avg_error += calculation_error
    #     item_nr += 1
    #     print("Item %d OK" % (item_nr-1) )

    avg_error = float(avg_error)/float(len(instances_array))
    avg_time = float(avg_time)/float(len(instances_array))

    print("%f; %f; %f; %f" % (max_time, avg_time, max_error, avg_error) )

    f = open(save_summary, "a")
    f.write("%d; %f; %f; %f; %f\n" % ( instances_array[0].current_things, max_time, avg_time, max_error, avg_error))
    f.close()

    return

# Load solution from file to objects
def load_instances_file(file_location, instances_array):
    # Open file with instances
    f = open(file_location, "r")
    # Iterate, create KnapsackInstance from each line and add them to instances_array
    for line in f:
        line = line.split()
        # Create new KnapsackInstance
        new_inst = KnapsackInstance(id=1 * int(line[0]),
                                    expecting_things=int(line[1]),
                                    limit_weight=int(line[2]),
                                    min_cost=int(-1))
        # Iterate the rest of the line to create and load Things
        for i in range(1, int(line[1]) + 1):
            new_thing = Thing(int(line[(i * 2) + 1]), int(line[(i * 2) + 2]))
            new_inst.add_thing(new_thing)

        # Add the constructed KnapsackInstance to an array representing the file
        instances_array.append(new_inst)

    return instances_array


# Save CONSTRUCTED solved instances to a file
# The solution file is formatted the same as MOODLE solutions
# Diff can than easily spot differences
def save_solution_file(file_location, instances_array):
    f = open(file_location, "w")
    for instance in instances_array:
        f.write("%d %d %d" % (instance.id, instance.current_things, instance.best_cost))
        for config in instance.best_solution:
            f.write(" %d" % config)

        f.write(" \n")

    f.close()
    return


# Save all info about complexity of calculated instances to a file
def save_complexity_file(file_location, instances_array):
    f = open(file_location, "w")
    # time_sum = 0
    # complexity_sum = 0
    # brut_sum = 0
    for instance in instances_array:
        f.write("%d %d %d %d %d %f\n" % (instance.id,
                                         instance.best_cost,
                                         instance.best_acceptable_cost,
                                         instance.complexity,
                                         instance.complexity_brute,
                                         instance.time))
        # complexity_sum = complexity_sum + instance.complexity
        # brut_sum = brut_sum + instance.complexity_brute
        # time_sum = time_sum + instance.time

    # print("====== Summary ======")
    # print("Avg time:  %d" % (float(time_sum) / len(instances_array)))
    # print("Avg complexity:  %d" % (int(complexity_sum) / len(instances_array)))
    # print("Avg brute:  %d" % (int(brut_sum) / len(instances_array)))
    f.close()


if __name__ == '__main__':
    main()
