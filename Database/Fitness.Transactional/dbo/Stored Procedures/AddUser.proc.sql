-- =============================================
-- Author:		Rakshith
-- Create date: 06/28/2019
-- Description:	SP used to create new user
-- =============================================
CREATE PROCEDURE [dbo].[AddUser]
    @pLogin NVARCHAR(50), 
    @pPassword NVARCHAR(50), 
    @pFirstName NVARCHAR(40) = NULL, 
    @pLastName NVARCHAR(40) = NULL,
    @responseMessage NVARCHAR(250) OUTPUT
AS
BEGIN
    SET NOCOUNT ON

    BEGIN TRY

        INSERT INTO dbo.[User] (LoginName, Password, FirstName, LastName)
        VALUES(@pLogin, HASHBYTES('SHA2_512', @pPassword), @pFirstName, @pLastName)

        SET @responseMessage='Success'

    END TRY
    BEGIN CATCH
        SET @responseMessage=ERROR_MESSAGE() 
    END CATCH

END
