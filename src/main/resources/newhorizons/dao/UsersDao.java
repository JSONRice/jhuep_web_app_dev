/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package resources.newhorizons.dao;

import java.util.List;
import java.util.Map;

import resources.newhorizons.model.Users;
/**
 *
 * @author matth_000
 */
public interface UsersDao {


/**
 * Specifies behaviors for getting Users information
 * out of the data repository.
 * @author brucephillips
 */

	
	/**
	 * Get last names of every users.
	 * @return Collection of last names
	 */
	public List<String> getLastNames();

	/**
	 * Get count of Users records in repository. 
	 * (see: http://static.springsource.org/spring/docs/2.5.x/reference/jdbc.html,
	 * section 11.2.1.1.1. Querying (SELECT) )
	 * @return number of Users records in repository
	 */
	public int getNumberOfPeople();

    /**
     * Get the Users's first name using the 
     * provided last name.
	 * (see: http://static.springsource.org/spring/docs/2.5.x/reference/jdbc.html,
	 * section 11.2.1.1.1. Querying (SELECT) )
     * @param lastName
     * @return first name
     */
	public String getFirstName(String lastName);
	

	/**
	 * Get Users with the provided last name.
	 * (see: http://static.springsource.org/spring/docs/2.5.x/reference/jdbc.html,
	 * section 11.2.1.1.1. Querying (SELECT) )
	 * @param lastName
	 * @return Users object with matching last name
	 */
	public Users getUsers(String lastName);

	/**
	 * Get collection of all Users objects from 
	 * the data repository.
	 * (see: http://static.springsource.org/spring/docs/2.5.x/reference/jdbc.html,
	 * section 11.2.1.1.1. Querying (SELECT) )
	 * @return Collection of Users objects
	 */
	public List<Users> getPeople();

	/**
	 * Create a Users in the data repository 
	 * that has the provided first and last names.
	 * (see: http://static.springsource.org/spring/docs/2.5.x/reference/jdbc.html,
	 * section 11.2.1.1.2. Updating (INSERT/UPDATE/DELETE) )
	 * @param firstName
	 * @param lastName
	 */
	public void addUsers(String firstName, String lastName);

	/**
	 * Use the provided Users object's state to 
	 * update the Users object in the data repository
	 * that has the same users ID value as the provided
	 * users object.
	 * (see: http://static.springsource.org/spring/docs/2.5.x/reference/jdbc.html,
	 * section 11.2.1.1.2. Updating (INSERT/UPDATE/DELETE) )
	 * @param users Users object with state used to update data repository
	 */
	public void updateUsers(Users users);

	/**
	 * Use the provided Users object's users ID 
	 * value to find a matching Users in the data 
	 * repository and then delete that Users from
	 * the data repository.
	 * (see: http://static.springsource.org/spring/docs/2.5.x/reference/jdbc.html,
	 * section 11.2.1.1.2. Updating (INSERT/UPDATE/DELETE) )
	 * @param users
	 */
	public void deleteUsers(Users users);

	/**
	 * Remove any records from tblUsers that
	 * have a usersID > 4 so that the table
	 * starts off in a consistent state 
	 * if this program has been run before
	 * 
	 */
	public void doDBCleanUp();

	/**
	 * Count the number of Users's in the data repository
	 * that have the provided first name.
	 * (see: http://static.springsource.org/spring/docs/2.5.x/reference/jdbc.html,
	 * section 11.2.2. NamedParameterJdbcTemplate)
	 * @param firstName
	 * @return
	 */
	public int countPeopleWithFirstName(String firstName);

	/**
	 * Using the first and last name of the provided
	 * Users object find all Users objects that
	 * have that first and last name.
	 * (see: http://static.springsource.org/spring/docs/2.5.x/reference/jdbc.html,
	 * section 11.2.2. NamedParameterJdbcTemplate)
	 * @param usersSkeleton Users with first and last name to match
	 * @return
	 */
	public List<Users> getUsers(Users usersSkeleton);

	/**
	 * Using the provided users ID value find
	 * the Users object in the data repository that
	 * has that users id value.
	 * (see: http://static.springsource.org/spring/docs/2.5.x/reference/jdbc.html,
	 * section 11.2.3. SimpleJdbcTemplate)
	 * 
	 * @param usersId
	 * @return Users that has matching users ID value
	 */
	public Users getUsers(int usersId);

	/**
	 * Get all Users objects from data repository
	 * as a List of Map objects.
	 * (see: http://static.springsource.org/spring/docs/2.5.x/reference/jdbc.html,
	 * section 11.2.7. Running Queries)
	 * @return List of Map objects where each Map object represents a Users
	 */
	public List<Map<String,Object>> getPeopleList();

	/**
	 * Using the provided Users object
	 * add it to the data repository.
	 * (see: http://static.springsource.org/spring/docs/2.5.x/reference/jdbc.html,
	 * section 11.5.1. Inserting data using SimpleJdbcInsert)
	 * @param newUsers
	 */
	public void addUsers(Users newUsers);

	/**
	 * Get all Users objects out of the data
	 * repository using the Spring JDBC's
	 * SimpleJdbcTemplate's query method
	 * and Java 5's covariant return type
	 * so that no cast is needed
	 * @return
	 */
	public List<Users> getAllUserss();

}
