# A simple demo about NSOperation and Grand Central Dispatch



Dispatch queues
are an easy way to perform tasks asynchronously and concurrently in your application.
They are queues where tasks are being submitted by your app in form of blocks (Blocks of codes). 
There are two varieties of dispatch queues: (1) serial queues, & (2) concurrent queues.

——
Serial Queues: 
the queue can only execute one task at a time. All tasks in the same serial queue will respect each other and execute serially

For example:
 Imagine that there is a single ticket booth but there are a bunch of people who want to buy cinema tickets, here the staff at the booth is a shared resource. It’ll be chaotic if the staff has to serve these people all at the same time. To handle this situation, people are required to queue up (serial queue), so that the staff can serve the customers one at a time.

The advantages of using serial queues are:
1. Guaranteed serialized access to a shared resource that avoids race condition.
2. Tasks are executed in a predictable order. When you submit tasks in a serial dispatch queue, they will 

1. be executed in the same order as they are inserted.
2. You can create any number of serial queues.
——
Concurrent Queues : 
allows you to execute multiple tasks in parallel.
 The tasks (blocks of codes) starts in the order in which they are added in the queue. 
But their execution all occur concurrently and they don’t have to wait for each other to start.
Concurrent queues guarantee that tasks start in same order but you will not know the order of execution, execution time or the number of tasks being executed at a given 

point.

For example:
You submit three tasks (

task #1, #2 and #3) to a concurrent queue. The tasks are executed concurrently and are started in the order in which they were added to the queue. However, the execution time and finish time vary. Even it may take some time for task #2 and task #3 to start, they both can complete before task #1. It’s up to the system to decide the execution of the tasks.
—-

By default, the system provides each application with a
Single serial queue (main dispatch queue)

&
Four concurrent queues (Global Dispatch queues)

- [ ] The main dispatch queue is the globally available serial queue that executes tasks on the application’s main thread : Use for UI Updates
- [ ] Global Dispatch queues :  These queues are global to the application and are differentiated only by their priority level

Reference of your preferred queue using the function dispatch_get_global_queue which takes in the first parameter one of these values:
* DISPATCH_QUEUE_PRIORITY_HIGH
* DISPATCH_QUEUE_PRIORITY_DEFAULT
* DISPATCH_QUEUE_PRIORITY_LOW
* DISPATCH_QUEUE_PRIORITY_BACKGROUND


<p align="center">
  <img src ="https://github.com/amrangry/ClockWise/blob/master/logo.png?raw=true"/>
</p>

Part 2: Operation Queues:

GCD is a low-level C API that enables developers to execute tasks concurrently. 
Operation queues, on the other hand, are high level abstraction of the queue model,and is built on top of GCD

- [ ] Don’t follow FIFO: in operation queues, you can set an exec

- [ ] ution priority for operations and you can add dependencies between operations which means you can define that some operations will only be executed after the completion of other operations. This is why they don’t follow First-In-First-Out.
- [ ] By default, they operate concurrently: while you can’t change its type to serial queues, there is still a workaround to execute tasks in operation queues in sequence by using dependencies between operations.
- [ ] Operation queues are instances of class NSOperationQueue and its tasks are encapsulated in instances of NSOperation.

NSOperation is an abstract class which can’t be used directly so you have to use NSOperation subclasses

1. NSBlockOperation – Use this class to initiate operation with one or more blocks. The operation itself can contain more than one block and the operation will be considered as finish when all blocks are executed.
2. NSInvocationOperation – Use this class to initiate an operation that consists of invoking a selector on a specified object.
￼
<p align="center">
  <img src ="https://github.com/amrangry/ClockWise/blob/master/logo.png?raw=true"/>
</p>

the advantages of NSOperation?
1. First, they support dependencies through the method addDependency(op: NSOperation) in the NSOperation class. When you need to start an operation that depends on the execution of the other, you will want to use NSOperation.
2. Secondly, you can change the execution priority by setting the property queuePriority with one of these values:
public enum NSOperationQueuePriority : Int {
    case VeryLow
    case Low
    case Normal
    case High
    case VeryHigh
}

3. Can cancel the operation by calling cancel() in the NSOperation class. When you cancel any operation, we have three scenarios that one of them will happen:
* Your operation is already finished. In that case, the cancel method has no effect.
* Your operation is already being executing. In that case, system will NOT force your operation code to stop but instead, cancelled property will be set to true.
* Your operation is still in the queue waiting to be executed. In that case, your operation will not be executed.

  4. NSOperation has 3 helpful boolean properties which are finished, cancelled, and ready. finished will be set to true once operation execution is done. cancelled is set to true once the operation has been cancelled. ready is set to true once the operation is about to be executed now.
5. Any NSOperation has an option to set completion block to be called once the task being finished. The block will be called once the property finished is set to true in NSOperation.
---
More :

operationQueue.maxConcurrentOperationCount = 1 


---
inspired by:

http://www.appcoda.com/ios-concurrency/
