-- =============================================
-- Author:		Rakshith
-- Create date: 06/28/2019
-- Description:	SP used to update existing users
-- =============================================
CREATE PROCEDURE [dbo].[UpdateUser]
    @userId bigint, 
    @pFirstName NVARCHAR(40) = NULL, 
    @pLastName NVARCHAR(40) = NULL,
    @responseMessage NVARCHAR(250) OUTPUT
AS
BEGIN
    SET NOCOUNT ON

    BEGIN TRY

        Update dbo.[User] set FirstName = @pFirstName, LastName = @pLastName
		WHERE UserId = @userId;

        SET @responseMessage='Success';

    END TRY
    BEGIN CATCH
        SET @responseMessage=ERROR_MESSAGE() 
    END CATCH

END
