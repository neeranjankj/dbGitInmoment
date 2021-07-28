--survey response
CREATE TABLE [dbo].[SurveyResponse_partitioned](
	[repl_id] [varchar](100) NOT NULL,
	[objectId] [bigint] NOT NULL,
	[surveyGatewayObjectId] [int] NOT NULL,
	[ani] [varchar](25) NULL,
	[beginDate] [datetime] NOT NULL,
	[complete] [bit] NOT NULL,
	[surveyObjectId] [int] NULL,
	[dateOfService] [datetime] NULL,
	[redemptionCode] [int] NULL,
	[employeeCode] [varchar](25) NULL,
	[oldEmployeeCode] [varchar](10) NULL,
	[beginTime] [datetime] NULL,
	[minutes] [float] NULL,
	[instantAlertSent] [bit] NULL,
	[modeType] [int] NULL,
	[loyaltyNumber] [varchar](400) NULL,
	[cookieUID] [varchar](40) NULL,
	[externalId] [varchar](36) NULL,
	[externalCallRecordingId] [varchar](30) NULL,
	[IPAddress] [varchar](39) NULL,
	[assignedUserAccountObjectId] [int] NULL,
	[isRead] [bit] NOT NULL,
	[beginDateUTC] [datetime] NOT NULL,
	[exclusionReason] [int] NOT NULL,
	[locationObjectId] [int] NULL,
	[offerObjectId] [int] NULL,
	[offerCode] [varchar](50) NULL,
	[lastModTime] [datetime] NULL,
	[reviewOptIn] [bit] NULL,
	[uuid] [varchar](100) NULL,
	[fingerprint] [varchar](255) NULL,
	[deviceType] [varchar](255) NULL,
	[deviceTypeValue] [int] NULL,
	[redemptionCodeVal] [varchar](255) NULL,
	[language] [smallint] NULL,
	[responseSourceObjectId] [int] NULL,
	[contactId] [varchar](44) NULL,
	[requestId] [varchar](100) NULL,
	[dateofservice2] [datetime] NULL,
	[sentimentScore] [float] NULL,
 CONSTRAINT [PK_dbo_SurveyResponse_partitioned__objectId] PRIMARY KEY CLUSTERED 
(
	[objectId] ASC,
	[beginDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 100, DATA_COMPRESSION=ROW) ON WH_PS_SurveyResponse (beginDate)
) ON WH_PS_SurveyResponse (beginDate)
GO

ALTER TABLE [dbo].[SurveyResponse_partitioned] ADD  CONSTRAINT [DF__SurveyRes_part_begin]  DEFAULT ('1 Jan 1900') FOR [beginDateUTC]
GO

ALTER TABLE [dbo].[SurveyResponse_partitioned] ADD  CONSTRAINT [DF__SurveyRes_part_lastM]  DEFAULT (getutcdate()) FOR [lastModTime]
GO

ALTER TABLE [dbo].[SurveyResponse_partitioned] ADD  CONSTRAINT [DF__SurveyRes_part_revie]  DEFAULT ((0)) FOR [reviewOptIn]
GO

--Survey Response Alert

CREATE TABLE [dbo].[SurveyResponseAlert_partitioned](
	[objectId] [bigint] NOT NULL,
	[surveyResponseObjectId] [bigint] NOT NULL,
	[eventConditionType] [int] NULL,
	[triggerDataFieldObjectId] [int] NULL,
	[alertObjectId] [int] NULL,
	[beginDate] [datetime] NOT NULL,
 CONSTRAINT [PK_SurveyResponseAlert_partitioned] PRIMARY KEY NONCLUSTERED 
(
	[objectId] ASC,
	[beginDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 100, DATA_COMPRESSION=ROW) ON WH_PS_SurveyResponseAlert (beginDate)
) ON WH_PS_SurveyResponseAlert (beginDate)
GO

-- Survey Response Note

CREATE TABLE [dbo].[SurveyResponseNote_partitioned](
	[objectId] [bigint] NOT NULL,
	[datestamp] [datetime] NOT NULL,
	[surveyResponseObjectId] [bigint] NULL,
	[userAccountObjectId] [int] NULL,
	[stateType] [int] NOT NULL,
	[sequence] [int] NULL,
	[currentNote] [bit] NULL,
	[datestampUTC] [datetime] NULL,
	[beginDate] [datetime] NOT NULL,
 CONSTRAINT [PK_SurveyResponseNote_partitioned] PRIMARY KEY NONCLUSTERED 
(
	[objectId] ASC,
	[beginDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 100, DATA_COMPRESSION=ROW) ON WH_PS_SurveyResponseNote (beginDate)
) ON WH_PS_SurveyResponseNote (beginDate)
GO

-- Survey Response Score
CREATE TABLE [dbo].[SurveyResponseScore_partitioned](
	[objectId] [bigint] NOT NULL,
	[surveyResponseObjectId] [bigint] NOT NULL,
	[dataFieldObjectId] [int] NOT NULL,
	[points] [float] NOT NULL,
	[pointsPossible] [float] NOT NULL,
	[score] [float] NOT NULL,
	[count] [int] NOT NULL,
	[totalWeight] [float] NULL,
	[beginDate] [datetime] NOT NULL,
 CONSTRAINT [PK_SurveyResponseScore_partitioned] PRIMARY KEY CLUSTERED 
(
	[objectId] ASC,
	[beginDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 100, DATA_COMPRESSION=ROW) ON WH_PS_SurveyResponseScore (beginDate)
) ON WH_PS_SurveyResponseScore (beginDate)
GO

--Comment
CREATE TABLE [dbo].[Comment_partitioned](
	[objectId] [bigint] NOT NULL,
	[audioLengthBytes] [int] NULL,
	[encrypted] [bit] NULL,
	[encryptiontype] [tinyint] NULL,
	[surveyResponseAnswerObjectId] [bigint] NOT NULL,
	[commentType] [tinyint] NOT NULL,
	[commentText] [nvarchar](max) NULL,
	[commentTextLengthBytes] [int] NULL,
	[commentTextLengthChars] [int] NULL,
	[commentTextLengthWords] [int] NOT NULL,
	[commentLanguage] [int] NULL,
	[audioTranscriptionDate] [datetime] NULL,
	[audioTranscriptionUserObjectId] [int] NULL,
	[transcriptionState] [tinyint] NOT NULL,
	[audioContentType] [smallint] NOT NULL,
	[offensiveText] [nvarchar](max) NULL,
	[transcriptionConfidence] [float] NULL,
	[transcriptionConfidenceLevel] [tinyint] NULL,
	[transcriptionJson] [nvarchar](max) NULL,
	[reprocess] [tinyint] NULL,
	[managerReply] [nvarchar](max) NULL,
	[vociUUID] [nvarchar](50) NULL,
	[translatedText] [nvarchar](max) NULL,
	[commentTranslatedTextLengthBytes] [int] NULL,
	[commentTranslatedTextLengthChars] [int] NULL,
	[commentTranslatedTextLengthWords] [int] NULL,
	[sentimentScore] [float] NULL,
	[beginDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Comment_partitioned] PRIMARY KEY CLUSTERED 
(
	[objectId] ASC,
	[beginDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON,FILLFACTOR = 100, DATA_COMPRESSION=ROW) ON WH_PS_Comment (beginDate)
) ON WH_PS_Comment (beginDate)
GO

ALTER TABLE [dbo].[Comment_partitioned] ADD  CONSTRAINT [DF__Comment_part_commenttype]  DEFAULT ((1)) FOR [commentType]
GO

ALTER TABLE [dbo].[Comment_partitioned] ADD  CONSTRAINT [DF__Comment_part_commentTLwords]  DEFAULT ((-1)) FOR [commentTextLengthWords]
GO

ALTER TABLE [dbo].[Comment_partitioned] ADD  CONSTRAINT [DF__Comment_part_trans]  DEFAULT ((0)) FOR [transcriptionState]
GO

ALTER TABLE [dbo].[Comment_partitioned] ADD  CONSTRAINT [DF__Comment_part_audioCo__7167D3BD]  DEFAULT ((0)) FOR [audioContentType]
GO

--SentimentAnnotation
CREATE TABLE [dbo].[SentimentAnnotation_partitioned](
	[objectId] [bigint] NOT NULL,
	[beginIndex] [int] NOT NULL,
	[endIndex] [int] NOT NULL,
	[sentiment] [float] NOT NULL,
	[commentObjectId] [bigint] NOT NULL,
	[isTranslated] [bit] NOT NULL,
	[creationDate] [datetime] NOT NULL,
	[isEnglish] [bit] NOT NULL,
	[uuid] [nvarchar](36) NULL,
	[sentimentScore] [float] NULL,
	[beginDate] [datetime] NOT NULL,
 CONSTRAINT [PK_SentimentAnnotation_partitioned] PRIMARY KEY CLUSTERED 
(
	[objectId] ASC,
	[beginDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 100, DATA_COMPRESSION=ROW) ON WH_PS_SentimentAnnotation (beginDate)
) ON WH_PS_SentimentAnnotation (beginDate)
GO

--Tag Annotation
CREATE TABLE [dbo].[TagAnnotation_partitioned](
	[objectId] [bigint] NOT NULL,
	[commentId] [bigint] NOT NULL,
	[annotation] [nvarchar](200) NULL,
	[beginIndex] [int] NOT NULL,
	[endIndex] [int] NOT NULL,
	[creationDate] [datetime] NOT NULL,
	[tagObjectId] [int] NOT NULL,
	[transcriptionConfidence] [float] NULL,
	[transcriptionConfidenceLevel] [tinyint] NULL,
	[sentiment] [float] NULL,
	[sentimentConfidence] [float] NULL,
	[employeeName] [nvarchar](200) NULL,
	[unfiltered] [tinyint] NULL,
	[translatedBeginIndex] [int] NULL,
	[translatedEndIndex] [int] NULL,
	[pearSource] [int] NULL,
	[pearModelObjectId] [int] NULL,
	[uuid] [nvarchar](36) NULL,
	[beginDate] [datetime] NOT NULL,
 CONSTRAINT [PK_TagAnnotation_partitioned] PRIMARY KEY CLUSTERED 
(
	[objectId] ASC,
	[beginDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 100, DATA_COMPRESSION=ROW) ON WH_PS_TagAnnotation (beginDate)
) ON WH_PS_TagAnnotation (beginDate)
GO

ALTER TABLE [dbo].[TagAnnotation_partitioned] ADD  CONSTRAINT [DF__TagAnnota_part_beginindex]  DEFAULT ((0)) FOR [beginIndex]
GO

ALTER TABLE [dbo].[TagAnnotation_partitioned] ADD  CONSTRAINT [DF__TagAnnota_part_endIndex]  DEFAULT ((0)) FOR [endIndex]
GO

ALTER TABLE [dbo].[TagAnnotation_partitioned] ADD  CONSTRAINT [DF__TagAnnota_part_createDate]  DEFAULT (getdate()) FOR [creationDate]
GO

--TermAnnotation
CREATE TABLE [dbo].[TermAnnotation_partitioned](
	[objectId] [bigint] NOT NULL,
	[commentId] [bigint] NOT NULL,
	[termId] [bigint] NOT NULL,
	[beginIndex] [int] NOT NULL,
	[endIndex] [int] NOT NULL,
	[score] [float] NULL,
	[rawSentiment] [float] NULL,
	[evidence] [int] NULL,
	[sentiment] [int] NULL,
	[creationDate] [datetime] NULL,
	[transcriptionConfidence] [float] NULL,
	[transcriptionConfidenceLevel] [tinyint] NULL,
	[unfiltered] [tinyint] NULL,
	[fieldSentiment] [float] NULL,
	[uuid] [nvarchar](36) NULL,
	[beginDate] [datetime] NOT NULL,
 CONSTRAINT [PK_TermAnnotation_partitioned] PRIMARY KEY CLUSTERED 
(
	[objectId] ASC,
	[beginDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 100, DATA_COMPRESSION=ROW) ON WH_PS_TermAnnotation (beginDate)
) ON WH_PS_TermAnnotation (beginDate)
GO

ALTER TABLE [dbo].[TermAnnotation_partitioned] ADD  CONSTRAINT [DF__TermAnnot_part_beginIndex]  DEFAULT ((0)) FOR [beginIndex]
GO

ALTER TABLE [dbo].[TermAnnotation_partitioned] ADD  CONSTRAINT [DF__TermAnnot_part_endIndex]  DEFAULT ((0)) FOR [endIndex]
GO

ALTER TABLE [dbo].[TermAnnotation_partitioned] ADD  CONSTRAINT [DF__TermAnnot_part_creationDate]  DEFAULT (getdate()) FOR [creationDate]
GO

--Response Tag
CREATE TABLE [dbo].[ResponseTag_partitioned](
	[objectId] [bigint] NOT NULL,
	[responseObjectId] [bigint] NOT NULL,
	[tagObjectId] [int] NOT NULL,
	[sourceType] [int] NOT NULL,
	[userAccountObjectId] [int] NULL,
	[timestamp] [datetime] NOT NULL,
	[transcriptionConfidence] [float] NULL,
	[transcriptionConfidenceLevel] [tinyint] NULL,
	[tagVersion] [int] NULL,
	[pearSource] [int] NULL,
	[pearModelObjectId] [int] NULL,
	[beginDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ResponseTag_partitioned] PRIMARY KEY CLUSTERED 
(
	[objectId] ASC,
	[beginDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 100,DATA_COMPRESSION=ROW) ON WH_PS_ResponseTag (beginDate)
) ON WH_PS_ResponseTag (beginDate)
GO






