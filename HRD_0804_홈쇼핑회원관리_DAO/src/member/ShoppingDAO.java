package member;

//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
/*
 * DAO : Data Access Object  
 * 데이터 베이스에 접속해서 데이터 추가, 삭제, 수정 등의 작업을 하는 클래스
 */
//요렇게 시작하면 밑에꺼 안 불러와도 됨
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class ShoppingDAO {
	/*
	 * 1. 필드 = 멤버변수
	 */
	Connection con;// 기본값
	PreparedStatement ps;// 기본값
	ResultSet rs;// 기본값

	String sql = "";
	/*
	 * 2. 생성자 : 기본생성자-필드에 기본값(수:0, boolean:false, 클래스 타입:null)을 주어 객체 생성
	 */

	/*
	 * 3. 메서드
	 */
	public static Connection getConnection() throws Exception {
		/* 첫번째 방법 */
		// 1.오라클 드라이버 로딩
		/*
		 * Class.forName("oracle.jdbc.OracleDriver");
		 * 
		 * // 2.Connection 객체 생성 String url = "jdbc:oracle:thin:@localhost:1521:xe";
		 * Connection con = DriverManager.getConnection(url, "system", "1234");// 지역변수 :
		 * 반드시 초기화
		 */		
		
		
		/* 중요 커넥션 풀 생성 JSP책 445p   */
		//커넥션fool에서 가져온다
		Connection con = null;
		try {
			Context init = new InitialContext();
			//톰켓 서버에서 만들어서 
			
			/*
			 * 톰켓 서버에 공유되어 있는 DataSource객체 리소스를 얻어오는 부분
			 * name 송성으로 지정한 리소스명(jdbc/OracleDB)을 사용하여 리소스를 얻어간다.
			 * 
			 */
			
			DataSource ds = (DataSource)init.lookup("jajva:comp/env/jdbc/OracleDB");
			
			
			con = ds.getConnection();
		} catch (NamingException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return con;
	}

	// 1.회원번호조회('회원등록' 폼에서) - 다음 번호 조회(단건조회) + 시스템으로부터 날짜
	public MemberBeans getMaxCustnoJoindate() throws Exception {
		MemberBeans beans = new MemberBeans();

		try {
			// 같은 클래스이므로 클래스이름 생략가능
			// 1.con:멤버변수 con
			con = getConnection();// static 메서드이므로 바로 호출 가능

			// 2.sql
			sql += "select NVL(max(custno),0)+1 AS custno,";
			sql += " to_char(sysdate,'yyyymmdd') as joindate";
			sql += " from member_tbl_02";

			// 3. 실행
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();// 이미 sql문을 가지고 컴파일한상태라 매개변수가 없음

			// 4. 결과처리 -> 최대회원번호+1, '오늘날짜'로 셋팅된 객체
			if (rs.next()) {
				beans.setCustno(rs.getString(1));
				beans.setJoindate(rs.getString(2));// beans.setCustno(rs.getString)
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 5. DB 연결 해제위해서.
			try {
				if (con != null)
					con.close();
				if (ps != null)
					ps.close();
				if (rs != null)
					rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return beans;
	}

	// 2.회원등록
	public void insertMember(MemberBeans beans) throws Exception {
		try {
			// 같은 클래스이므로 클래스이름 생략가능
			// 1. con: 멤버변수 con
			con = getConnection();// static 메서드이므로 바로 호출 가능

			// 2.sql

			// sql += "insert into
			// member_tbl_02(custno,custname,phone,address,joindate,gradee,city)
			// values(?,?,?,?,?,?,?)";
			sql += "insert into member_tbl_02 values(?,?,?,?,?,?,?)";
			// sql += "insert into member_tbl_02 values(?,?,?,?,to_char(?,'yyyy-mm-dd'),?)";

			// 3. 실행
			ps = con.prepareStatement(sql);
			ps.setString(1, beans.getCustno());
			ps.setString(2, beans.getCustname());
			ps.setString(3, beans.getPhone());
			ps.setString(4, beans.getAddress());
			ps.setString(5, beans.getJoindate());
			ps.setString(6, beans.getGrade());
			ps.setString(7, beans.getCity());

			ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 5. DB 연결 해제위해서.
			try {
				if (con != null)
					con.close();
				if (ps != null)
					ps.close();
				if (rs != null)
					rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	// 3. 회원전체조회-select_9.jsp
	public ArrayList<MemberBeans> getMembers() {
		ArrayList<MemberBeans> list = new ArrayList<MemberBeans>();
		try {
			// 같은 클래스이므로 클래스이름 생략가능
			// 1. con: 멤버변수 con
			con = getConnection();// static 메서드이므로 바로 호출 가능

			// 2.sql
			sql += "select custno, custname,phone,address,";
			sql += " to_char(joindate,'yyyy-mm-dd') as joindate,";
			sql += " decode(grade, 'A','VIP','B','일반','C','직원') as grade,";
			sql += " city ";
			sql += " from member_tbl_02";
			sql += " order by 1";

			// 3. 실행
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();

			// 4.결과처리
			while (rs.next()) {
				MemberBeans beans = new MemberBeans();

				// 필드에 기본값이 아닌 결과셋의 레코드의 값들로 채움
				beans.setCustno(rs.getString(1));
				beans.setCustname(rs.getString(2));
				beans.setPhone(rs.getString(3));
				beans.setAddress(rs.getString(4));
				beans.setJoindate(rs.getString(5));
				beans.setGrade(rs.getString(6));
				beans.setCity(rs.getString(7));
				
				list.add(beans);

			}
		} catch (Exception e) {
			e.printStackTrace();

		}
		return list;
	}

	// 4.회원조회- '회원번호(custno)를 매개값으로 받아 조회한 회원객체를 리턴
	public MemberBeans getMember(String custno) {// "100001"
		MemberBeans beans = new MemberBeans();// 기본값으로 채워진 객체
		try {
			// 같은 클래스이므로 클래스이름 생략가능
			// 1.con:멤버변수 con
			con = getConnection();// static 메서드이므로 바로 호출 가능

			// 2.sql
			sql += "select custno, custname,phone,address,";
			sql += " to_char(joindate,'yyyy-mm-dd') as joindate,";
			sql += " grade,";
			sql += " city";
			sql += " from member_tbl_02";
			sql += " where custno=?";

			// 3. 실행
			ps = con.prepareStatement(sql);
			ps.setString(1, custno);

			rs = ps.executeQuery();
			
			// 4. 결과처리 : 필드에 기본값이 아닌 결과셋에서 얻어온 값으로 변경
			if (rs.next()) {// 결과 1개여서 if문 씀
				beans.setCustno(rs.getString(1));
				beans.setCustname(rs.getString(2));
				beans.setPhone(rs.getString(3));
				beans.setAddress(rs.getString(4));
				beans.setJoindate(rs.getString(5));
				beans.setGrade(rs.getString(6));
				beans.setCity(rs.getString(7));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 5. DB 연결 해제위해서.
			try {
				if (con != null)
					con.close();
				if (ps != null)
					ps.close();
				if (rs != null)
					rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return beans;
	}

	// 5번 회원수정
	public void updateMember(MemberBeans beans) {

		try {
			con = getConnection();

			sql = "update member_tbl_02 set custname=?, phone=?, address=?, joindate=?,grade=?,city=? where custno=? ";

			ps = con.prepareStatement(sql);

			ps.setString(1, beans.getCustname());
			ps.setString(2, beans.getPhone());
			ps.setString(3, beans.getAddress());
			ps.setString(4, beans.getJoindate());
			ps.setString(5, beans.getGrade());
			ps.setString(6, beans.getCity());
			ps.setString(7, beans.getCustno());

			ps.executeUpdate();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (con != null)
					con.close();
				if (ps != null)
					ps.close();
				if (rs != null)
					rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	// 6번 회원삭제
	public void deleteMember(MemberBeans beans) {

		try {
			// 1.con:멤버변수 con
			con = getConnection();

			// 2. SQL문 작성
			sql = "delete from member_tbl_02 where custno=?";

			ps = con.prepareStatement(sql); // 받은걸 돌려준다

			ps.setString(1, beans.getCustno());

			ps.executeUpdate();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			// 5. DB 연결 해제위해서.
			try {
				if (con != null)
					con.close();
				if (ps != null)
					ps.close();
				if (rs != null)
					rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	// 7번 매출전체조회
	public ArrayList<SelesBeans> getSeles() {
		
		ArrayList<SelesBeans> list = new ArrayList<SelesBeans>();

		try {
			// 같은 클래스이므로 클래스이름 생략가능
			// 1. con: 멤버변수 con
			con = getConnection();// static 메서드이므로 바로 호출 가능

			// 2.sql
			sql += "select custno, custname, decode(grade, 'A','VIP','B','일반','C','직원') as grade, sum(price) as price";
			sql += " from member_tbl_02 natural join money_tbl_02";
			sql += " group by custno, custname, grade";
			sql += " order by price desc";

			// 3. 실행
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();

			// 4.결과처리
			while (rs.next()) {
				SelesBeans sale = new SelesBeans();

				// 필드에 기본값이 아닌 결과셋의 레코드의 값들로 채움
				sale.setCustno(rs.getString(1));
				sale.setCustname(rs.getString(2));
				sale.setGrade(rs.getString(3));
				sale.setTotalprice(rs.getString(4));

				list.add(sale);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;

	}
}
// 3. 회원전체조회 참고해서 하면된다
