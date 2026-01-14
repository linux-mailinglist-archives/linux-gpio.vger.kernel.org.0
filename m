Return-Path: <linux-gpio+bounces-30540-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F052AD1E21C
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 11:38:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1340230CA66E
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 10:33:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25F6038E5CE;
	Wed, 14 Jan 2026 10:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="NPGnHG0I"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B6F38A9C2;
	Wed, 14 Jan 2026 10:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.182.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768386805; cv=fail; b=ujk9meiWHLVslqACZy8kqYADbRBEubVgWMGwueEQYlJl0L0qf+pL6zhLmbC1vRKWukhP5LUejWXJW4/KRtRV+PfP5+lVsY05461ECxoxSSBe7xdy/Zao56VskVvhKIa5iqdLMRxpP3BHpW1dejeDngg4gwB//mY+Pwg49Knw7nk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768386805; c=relaxed/simple;
	bh=RexvO5DkCQ92It1JC++XDhWogf8nt1bXdmLF2reP5+g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=O0XJBy03IRlspGxggX6Z9D3u7BZb3EfDR+LwLGwOWvadL2mEvelIl1fbqB0ldoPA0yy+6OeoLs5OYpnFsE7ALBhNDLuj+OGgDFAua6VPDlmUk4DYzNZtUbuCETYCigISejdFNgNqlog7zTb2UFPxepuLGHbRMWFvKXwg2sW6wBA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=NPGnHG0I; arc=fail smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60EARq5O797940;
	Wed, 14 Jan 2026 11:32:46 +0100
Received: from am0pr02cu008.outbound.protection.outlook.com (mail-westeuropeazon11013071.outbound.protection.outlook.com [52.101.72.71])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4bntaftydq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 14 Jan 2026 11:32:46 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fBKDhm3xaygwSOxlRQIkBmZQuRIpb3VNAXQf0eyh+ldCbSJtD9lS9HGTS+MVQt4wOGDzYabKBydZvx0G3nxEvV8+n8nbzLRC5sRBTx+pAwOYdiE7pciq+PIFOQJsBPSDh88tHv60UWLv6r8Lgfknvrot9n+QFWYMR7iChXasdTAKeaDEm6azS5LHUsUV+qgs+tWGm1bLzunkXlWVO4+d5k2OHKu0fbx6+v8Qp8RuXA+hA7/4Rb98jFhDxiXK3LLpdWf680Qi2n7y4isuSF8Z4wItQzoKRfGl5xmrgfF1IisEY7bGsB7ybJHq6qLOL7dYQECHglgwwg7wEFbGRZ4rZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p9l9OD5UtJ51yyhOAdrv6McKpN/7vVd0EQ1KH39HGq0=;
 b=OOdLE+S9dvmVkaelnYpWbahAlBHewfKcPTQ3TRgpzRo9jbnmln9+3QbAQUitF6f0d2a+2d2VDth1wZVu6pMIGYozs7q/upElSlrVNWFc8Phzaeadeftno3iHwTvfLkwMTtJC1J6yU+Bj7tO5GLqlHRmdWhDPDoy92sse7DEYCsnnpzxZG/aOtJxGZQw/gk8k3jYfSJNoqzISXMxI3uW7SsdwwrCsQy7Ud/TPYYAD+KFxXkDe3IgFk5XPdnfnxk+poeHFBTdKzPHep6zmhPVyaQfi5r/0YhsAHspbXYAPO6y+NaUMeIkL9Zh8s+UdRbPWX7vfI95pqmYm+kmEvTqTLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=linaro.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p9l9OD5UtJ51yyhOAdrv6McKpN/7vVd0EQ1KH39HGq0=;
 b=NPGnHG0I2azRKybcjDKfqd03C5IOJlxbr9ei+6vltMmB6/t3oVYNtmTDd3+kQwBxaRBcNv1gZ2oqrPkCSW8WNG5XiSdGUYYjm9+5CD2pIF+kWWh+xrB/rKlzaCLUoYQXKRhPif6TpGQESgHIr4woSZpgRhE58LTf1noCwgkxkFz5SKa8lrfEAW8Oayed00K/diHwvZm7plzSfPkRoyRq+TUS364G9Ic0VGYhHhpJtVpeNzs/jInJVkiknmgVZpJwnhv+HS9UCJBD5YW8t2kPOXrH27YpJCBhaZaCvuN4XD/R8f+yBrrGLDKtyEB47Ndqf5vNOrJyQKImmlHqVQ7ycw==
Received: from AS9PR06CA0039.eurprd06.prod.outlook.com (2603:10a6:20b:463::31)
 by AM7PR10MB3858.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:17d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Wed, 14 Jan
 2026 10:31:20 +0000
Received: from AMS1EPF00000047.eurprd04.prod.outlook.com
 (2603:10a6:20b:463:cafe::53) by AS9PR06CA0039.outlook.office365.com
 (2603:10a6:20b:463::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.5 via Frontend Transport; Wed,
 14 Jan 2026 10:31:18 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS1EPF00000047.mail.protection.outlook.com (10.167.16.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Wed, 14 Jan 2026 10:31:20 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 14 Jan
 2026 11:32:45 +0100
Received: from localhost (10.48.86.212) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 14 Jan
 2026 11:31:19 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Wed, 14 Jan 2026 11:29:23 +0100
Subject: [PATCH v2 09/11] arm: dts: stm32: enable CoreSight on the
 stm32mp157c-ev1 board
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260114-debug_bus-v2-9-5475c7841569@foss.st.com>
References: <20260114-debug_bus-v2-0-5475c7841569@foss.st.com>
In-Reply-To: <20260114-debug_bus-v2-0-5475c7841569@foss.st.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan
	<leo.yan@linux.dev>,
        =?utf-8?q?Cl=C3=A9ment_Le_Goffic?=
	<legoffic.clement@gmail.com>,
        Linus Walleij <linusw@kernel.org>,
        "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        <jens.wiklander@linaro.org>
CC: <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        Gatien Chevallier <gatien.chevallier@foss.st.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000047:EE_|AM7PR10MB3858:EE_
X-MS-Office365-Filtering-Correlation-Id: db443216-2144-41f1-1c8f-08de53580eb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|7416014|1800799024|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OGJYYnJIWG1tU2hNeWIwRWROYjNXeW96SSsyb3ZYZzU4eHIveUlNdmFpVmJH?=
 =?utf-8?B?TkZ5OVlXRS9wdy9CeWVwdG5qbGhCallOSC8yVnlzN1FRSE9Vc05hbXh6ZDIr?=
 =?utf-8?B?TS9pTWtkZkVwWVQ1WDdWVjRteXRGV0lOUDJGRVgydHVrSGFTWTQxZ0VIZExR?=
 =?utf-8?B?bDBCNTU1WGE4Ulp6ZEcrZS8rMExTeUdlY1pSclBtWXVBVWU5dGFMWEk0WUt0?=
 =?utf-8?B?NjZsQ01PZWdqZSt0bDdNZzhVajNCNFh2WHNGVXVIN0E0UzNsN0NrY1pGZFpa?=
 =?utf-8?B?OHJGYUNBVVVNQS8rVUVFZjdXa1NVcVZzMHFIRGtjZjVSb0wrWHRQSW5LcVdR?=
 =?utf-8?B?MnhPOGtQd1REY2pqVXl3K2I2eDdCQVJFNkU2c2hTME41NlBUU0JBemZqRUVY?=
 =?utf-8?B?emZkOUVDdXkvUU9JcmhCOGNhR0tleGpIcGUwVU9BbHQzMWltYmlRV3djZCty?=
 =?utf-8?B?L2V5Ums1WUdhVlp2TTdMTDdRVGVvNDlaSHJydUcvaENESmR3bTBKcGovRzNV?=
 =?utf-8?B?NkNmdG8vZmdoWnM1Q083NHNLN3Y4NjdyUFRkYldNY09tY3NCbEw3TnRCYnpQ?=
 =?utf-8?B?U3VmVFZERG54c1creTRocFNKY0NEYkRHN0hsa0FuVEdDRXhaRS9LLzFNcmY1?=
 =?utf-8?B?clNWc1NRam9kejRxYW0valJSeE9xMmVoT1lpM3o1WVRoemRBVFR5dWFwQ1N3?=
 =?utf-8?B?ZkRQN0RpSGFkUG9Tamh4d1U2cFZraU03Rnc3L3pVYmRETzRZQXBxWGYzaEUx?=
 =?utf-8?B?dm9oMEFMU1RhbHVoRkcvWS9PbW5aNWNEdEJZQWZjN0lTUUpUYjVOTExJeThC?=
 =?utf-8?B?VnFxVHV3cnBEd25Qdzk0UGRvREtJQS9OZnVvREpUT0R4TGhBWUNpcGh4a2wz?=
 =?utf-8?B?RU12c2FRVVEwa1JaV0ZqMXF2aXExQVNYUnI3T3NxNW1jdHFWbFJmalQzWllV?=
 =?utf-8?B?OTBnamJFSUM0RFJlM3ZxSk1vejRjSklzMXVrc3pMZktIeVZ0M2VDbHZBbVFG?=
 =?utf-8?B?YmZKZDBCckhYZmhBUmc5N0xuN2hhNElkOTB6S0M4Ky9SMENSRjIrYyt2OGdN?=
 =?utf-8?B?YzNYeHRSQXBnZGNJakk5RWd1Q2FIWFVpVEtDUDBvdzdsc2JzUFpGamVma1Iv?=
 =?utf-8?B?MXpmdG9vNXpJWDN1eVJTYXRjTlYyZnRTTHZOejdxcC9WcU8rZWg3OVhHcC9Y?=
 =?utf-8?B?T0w0Q1lJZm95cTJMdnhLQkJnazFTZGJtQVlRMElCV09JOERSZW05ekxvWjNq?=
 =?utf-8?B?dENRM0VZOWZnaFFhaDMvVERSenVGU3JaSXdvRzRhUU1jWlJuUDhRa2s2VkhR?=
 =?utf-8?B?MnJma242SXdSeG1YRUFPbHl1bE5icjJqZzhCdXlzTjZTQkhMRVlJa0M5TTRp?=
 =?utf-8?B?disvZkV1b0U3YkQ3TnArd3IyMzNvQXdaN0lKeEJpRzVJbjNWMEdtRndnTjU5?=
 =?utf-8?B?emRrY2NqSml5bUg4TU11V2hCRlZBMjdGYW9Gdm5FOTVjTjVlbC96Q3luc2M4?=
 =?utf-8?B?SHhEdDN4cm5wdmJRV1FTaFVQdFljeFNPemtoMEFhVTZtMGxHYjcwQ1F1Ym83?=
 =?utf-8?B?OExiZHJUdC84Z0dJWmRIRUpNRHVLdFZKVjY2VnpqWGZ2eDAraGtLeGxXVG1W?=
 =?utf-8?B?dzRVaWNtNll1eC9TaVRLakhRVmVvUTRBK21pRFFsdFRDbDRDTVF1SnVFSjNi?=
 =?utf-8?B?OENhNkRsUFZ6Zlovd2szSkZQQU02QVRsb0lhRkxVRy9IZldaVnl4Y0xhUC9W?=
 =?utf-8?B?TG10ekc3UWt6Y2VkZDNMOS9ieElBazZKa2QwWnZsK0VHS2NHckM4Y1lsbnpC?=
 =?utf-8?B?aGtJdno5U2lFSDNVVG1CbFYwZk5CL1AxWlFTOVN5YTBweGJQUDFSY3Y5K0U3?=
 =?utf-8?B?UGtlYVZ2c1doazRsMUlZUk1Hd1UyUVZjUmNkaGxRTkpid3ZrbXRqb0xTdVJt?=
 =?utf-8?B?SkNnaDNQZ3dOL1Jya0ZNSWEvY3M0ZjZmKysxVFNJc3czbmNmVUtxa1FqNGJ5?=
 =?utf-8?B?b1VjNDFqeDhTcFFEdi95SHBzMkU2SGxwWUtMTGhmUGZmS0xKS0QzSEtlUVRw?=
 =?utf-8?B?bEk4VE82VU1WaDFRYkxQOUZEbnErZmZvU0I2R0E1cHp5MGdzME5MS3cvOFNN?=
 =?utf-8?B?L1Njd282eEl2bWNYdUVQK0R0NFJEK1Y2aWgwdldyYkZUWjgyOVZLMVVtV3N0?=
 =?utf-8?B?MjhVeDBtbDcyMEJVRnQwR0F6cytOS25ma3R1N2x1UC9RNTUrMmtIeUpNWnEw?=
 =?utf-8?Q?vsthGQYVlsJmQjEa6gIqdMnb1qOxJkJ9CmWdvC1xfA=3D?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(7416014)(1800799024)(376014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 10:31:20.1564
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db443216-2144-41f1-1c8f-08de53580eb9
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000047.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3858
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDA4NiBTYWx0ZWRfX9BfEhC8Z12cr
 0sOuWZDJ/0uHnWmf0eOAkz57Ldkc/SCVAT5aWO3BcDTnSgMMC9cUzEcBK1bN3fzmeTj7FSlOY5I
 Y10YvJYTFO52u4zmKpoChysBS6C2Pk5EiqKqFn43Bl+9iebfy5KkZ2zDBE4u999jkH+ykM6twxo
 Oyqm064Z28bSaEsVmGkWM0b+GJCrIzsYWl1zwjZwXzetHdhdFVAmJoOUtXkiJ7YnbiMyKBs+MC5
 Hvmxz42YwhyIOJvMTXv3tHr640MYIWzMjvMr0VuH9bmZ/nNlpPIZwmb0lMB5AkELszcgDeeetl0
 apF7BElQ6f9R5b+6LGND3JRfYcA7SWbNDh7ph1eToRPtCS6Rb948wrf/ANi+XHZOpEnG7b+Niqu
 KF+GxelNjQaz4QZJawT8PjTm2IokltpNeYz/Lgr5eSPfFOfChgKf2pWWfE0NALIxNWO4zMzSm8y
 Ir2cGBEr0zU2uA9jJYg==
X-Proofpoint-ORIG-GUID: azHh0iSsw3U3ex4ydrW5aC4mqDcm0uUe
X-Proofpoint-GUID: azHh0iSsw3U3ex4ydrW5aC4mqDcm0uUe
X-Authority-Analysis: v=2.4 cv=W9U1lBWk c=1 sm=1 tr=0 ts=696770ce cx=c_pps
 a=9HxWjEJdKu+ocmqtrLsiYA==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=rg8MelPR9j8A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=WyXvt1svF0yAhq5Ft7oA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140086

Enable CoreSight peripherals on the stm32mp157c-ev1 board.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp157c-ev1.dts | 36 ++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp157c-ev1.dts b/arch/arm/boot/dts/st/stm32mp157c-ev1.dts
index e69c8e282c8b..913c20e31196 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-ev1.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-ev1.dts
@@ -81,6 +81,42 @@ &cec {
 	status = "okay";
 };
 
+&cs_cti_trace {
+	status = "okay";
+};
+
+&cs_cti_cpu0 {
+	status = "okay";
+};
+
+&cs_cti_cpu1 {
+	status = "okay";
+};
+
+&cs_etf {
+	status = "okay";
+};
+
+&cs_etm0 {
+	status = "okay";
+};
+
+&cs_etm1 {
+	status = "okay";
+};
+
+&cs_funnel {
+	status = "okay";
+};
+
+&cs_stm {
+	status = "okay";
+};
+
+&cs_tpiu {
+	status = "okay";
+};
+
 &dbg_bus {
 	status = "okay";
 };

-- 
2.43.0


