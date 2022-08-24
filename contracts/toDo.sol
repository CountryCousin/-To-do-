// SPDX-License-Identifier: MIT

pragma solidity 0.8.16;

contract TodoList{
    struct Todo{
        string description;
        bool status;
    }

        Todo[] public todos;

        function createToDo(string calldata _description) external {
            todos.push(Todo({
                description: _description,
                status:false
            }));
        }

        function updateDescription(uint _position, string calldata _description) external{
            
            todos[_position].description= _description;
            

            Todo storage todo = todos[_position];
            todo.description = _description;
            
        }

        function getToDo(uint _position)external view returns(string memory, bool){
            // storage - 29397 gas used when storage was used;
            // memory -29480 gas used when memory was used
            Todo memory todo = todos[_position];
            return (todo.description, todo.status);
        }

        function toggleCompleted(uint _position)external{
            todos[_position].status = !todos[_position].status;
        }
    
}

