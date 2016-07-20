package com.ekunt;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DatabaseBean implements Serializable {

	private DataSource dataSource;

	public DatabaseBean() {
		try {
			Context initContext = new InitialContext();
			Context envContext = (Context) initContext.lookup("java:/comp/env");
			dataSource = (DataSource) envContext.lookup("jdbc/demo");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	public boolean isConnectedOK() {
		boolean ok = false;
		Connection conn = null;
		try {
			conn = dataSource.getConnection();
			if (!conn.isClosed()) {
				ok = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null) {
					conn.close();
					conn = null;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return ok;
	}
}
