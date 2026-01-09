Return-Path: <linux-gpio+bounces-30335-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 78344D08C0E
	for <lists+linux-gpio@lfdr.de>; Fri, 09 Jan 2026 11:58:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6DA4B30158E4
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Jan 2026 10:58:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 152FF33B6C6;
	Fri,  9 Jan 2026 10:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="ipR+Tf9y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C0533B6D2;
	Fri,  9 Jan 2026 10:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.182.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767956283; cv=fail; b=CWhr20k8yJQMehjwl3kIRJM93l3x8cknemBF84zydXsHVoYJhhrd1Ua4l0aKrsdagidn4x+dpB0kRY+/7szakCuzabMGtNBJgBqIZSMTtQL2XedEVM43Foy43PSCRElgxMvba0dK2WHXdTfEpGsX8kG5PIVH+3JX8UHRUbhz4zo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767956283; c=relaxed/simple;
	bh=ewEZODz90npyyYRi379HUBKf6SIxjR5Q5hb4xCINgd0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=lPX6QGvFqFIz0kTRPiO9vc/IPJSDdQdHVZvnu0qscMNOeESHQDzkmk4Wbo8COjv3oTNNyT4/sbPCkq7/7ZYjMqQEBVBctR1mZ9YF88DIPkE+MaR3REPTOeuQePMYkr023b3o/dHB5c/LSR8vHJKlAqlnRvIDVJDRjq02PrafHEg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=ipR+Tf9y; arc=fail smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 609AqtaC923301;
	Fri, 9 Jan 2026 11:57:44 +0100
Received: from db3pr0202cu003.outbound.protection.outlook.com (mail-northeuropeazon11010043.outbound.protection.outlook.com [52.101.84.43])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4bjspghehg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 09 Jan 2026 11:57:43 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OOG5nFCh7vZnt4yYjifFKWe3+UFmc+f8wuJufT4zT8UbGSf/OQVavcSwcDDONVM4q3GHscyQNt3cD+tcJSdOKOozlag+jbA9yJ9sjBH5Q1a+fjS4a3kCG2v3av2HHWbpswrJx+dYSsq94I3DP2NIk2+LQnUkUgqz2zoFT7mM82OswgjQaRU7+8vkrA/QgXaLZuPt3wF8QYwfr45vq6lSIPzSNtbgkdEnXI/wIccdojSw/gKJa9nCa4Zjev/fnzuDHXaibTaNGHIveh3AtQUaaUmwnDpMqV5YHo0LXaKqgftyBox7yN0WpGJwf5i8XoUYAEFdi+Xz40Bg9Wzf1IIlDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5er+eTox9cwQuYhpYmpkyJ+YK4aQrQb1NoDbSG6A+9U=;
 b=o4L+ltZ/hHSaqhaOqxPr65eT+PVSePaKMaSJu8oQx6n3A+3f8zqU9xIwMwglZLQ4FYvWBQb81wj+5eQlcZWSfZSo31wCmYpNoV0GHIJljy+/tK0xayIcIq+jq7u2RZpblil0uZ5Ixdkf1v14EO2Up7j43y7fjU1ndfeBDoGbaSpTHpBv76sOei3HK/RiaRjpUl/iu8Iq5qA+aSfZo6KZvc3jhA4BDVJ4cuiAyhaPThcwkAb1+si1yyUOB14ETVPzafFJFQ8Rx2g5OsozM0yghNJXd5QN/CzumdkDA3jR/smnxLcq9ZH1+qGnhvWJTWJPjU4XvBsgSGZe/ptWB45r5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=linaro.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5er+eTox9cwQuYhpYmpkyJ+YK4aQrQb1NoDbSG6A+9U=;
 b=ipR+Tf9yjlFYLFejtDGtXnfUhRA2CzObJw/vJyR3hgiVicnAIKqEu+4xf9BGwNjubMnJysk1u0EW04V4H4ptOsDjgd5hFloA+xQZeeHd1MhBwdpnY2wTmOri4U8AdDbsKB3SH2YP0P5TvyvfQwsCFICnLzxOBaWKFjpyA48SZXYiZFS66DvtSb4yixImnr2yzI1+Xc3v7MWaKDPFtmACnwRETaHhuZfaT5/BHfOMQ/632kl8yckm4BVSsqEofquIGwWZbyaX+RUTdlkN6J6nHMVZAGc03vEjQKgj5wZeIVyNIKpL4ORhShM97gBy9EcZDjMHxYpJA6dgkQmS3esSHw==
Received: from DUZP191CA0022.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f9::26)
 by VI1PR10MB3742.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:803:13c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.5; Fri, 9 Jan
 2026 10:57:39 +0000
Received: from DU6PEPF0000A7DD.eurprd02.prod.outlook.com
 (2603:10a6:10:4f9:cafe::c) by DUZP191CA0022.outlook.office365.com
 (2603:10a6:10:4f9::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.4 via Frontend Transport; Fri, 9
 Jan 2026 10:57:39 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU6PEPF0000A7DD.mail.protection.outlook.com (10.167.8.37) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Fri, 9 Jan 2026 10:57:38 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 9 Jan
 2026 11:58:55 +0100
Received: from localhost (10.48.86.212) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 9 Jan
 2026 11:57:37 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Fri, 9 Jan 2026 11:55:10 +0100
Subject: [PATCH 10/11] arm: dts: stm32: enable CoreSight on the
 stm32mp135f-dk board
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260109-debug_bus-v1-10-8f2142b5a738@foss.st.com>
References: <20260109-debug_bus-v1-0-8f2142b5a738@foss.st.com>
In-Reply-To: <20260109-debug_bus-v1-0-8f2142b5a738@foss.st.com>
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
	<alexandre.torgue@foss.st.com>
CC: <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        Gatien Chevallier <gatien.chevallier@foss.st.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000A7DD:EE_|VI1PR10MB3742:EE_
X-MS-Office365-Filtering-Correlation-Id: ddd4a979-2d7e-4bea-c207-08de4f6de78b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|7416014|1800799024|36860700013|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RnJEOGNtWnN6MkZEUTA3YkZKUkVvcmJ6ZVhjOVFLaTF0Tnl3VnNheWQzTUFO?=
 =?utf-8?B?d2FwV1lvWlV6VC9DMGU1Z3o2Yk1XWm9xZHBhWGxFOHBVSzZ5eElqVzVudDJU?=
 =?utf-8?B?dTNQeUd4WkJYZTRuNUYxMitES2QzQThwZ3VhdU4yRk0xOG1FV2QxMko1VkV3?=
 =?utf-8?B?L21jS0I1UFNwMTNsTTJvSElJMnk5dXZ0M2Y0eXRZbE5LMDZhT25BcExiZUN1?=
 =?utf-8?B?a2Ivd0c5WlVpZEc0L2I5Q045dEpCRm1hZE5Xd1BqVEgxYks5UzEzQWVOVUxI?=
 =?utf-8?B?cENDUkFwZkNJVWIzaGt3UTR1T3ZPbFlRRGlpVEY0eTNaT1NBQ2pNNFlhVFhC?=
 =?utf-8?B?QVJUR1hLNnZjTjJRUDVWZm1INW1POXcrWWtlMGp0RnkvdkdwRng5MGx4T050?=
 =?utf-8?B?Zld4WkhCOVFreWF3aGJjL0dTWmV6VG5GcUtEN21GUmFZS3lJVmRDU1lpb3I3?=
 =?utf-8?B?YXdQeHJ6NlBtNWwzRUErWW9rVFViNE9UZCtYcU45WEcyb3pIUnpHYTQ5a2xJ?=
 =?utf-8?B?UzY2STRPd3VtcUU4WnhLeHJiekE5cWo3UHVSWUh1ak85ejJJbzk3eDZDR1Bs?=
 =?utf-8?B?VXNOU0dRWjZEejZrRld3bVN6bCt3YnRTaE9FUHlBejNqU2N3TjZJbk9WSTRy?=
 =?utf-8?B?Q2VMQnYxdC9iZ2twd2g5SE1JOTBXZ1ZBcjZWbmhQeUlRZjFtZTdWcE12VElO?=
 =?utf-8?B?c3ZiWEwvdXoxVHV4REZSS2FsY0xYMHBmZVB3NkRxaDRMc1cxMllRTlFaYkYr?=
 =?utf-8?B?emJQOE4yTG9RbC9ucEZLRzVuUDhSTHlYaHRzWFlFREtoVnQySEVJMy9YeCts?=
 =?utf-8?B?TmpTQkFnTEt0TUJpbWoyTHZpd2ZGbVpFRHlwbFpNOHE4Tkl2VS9tT29QUVgy?=
 =?utf-8?B?NzNNNVR0dUhHVksrT0g0V3NZNnRtOVhESHFSZzdUNVZtakhaV2o0YXlaQ09D?=
 =?utf-8?B?RG1xTzF4eEUxZm9XOSsvNjBhcGdWTXNiem8vRmlwSlpaaHp5bUlsNW5GVGZ6?=
 =?utf-8?B?bUc3TmY1Q3NPUkZaeGFLVFlGLzdrMVQvNXVrSklaUElZZXNrMlpPTEVXWEVW?=
 =?utf-8?B?SzZFeWZ5aUNJSVIvQXZ4VUY2dWhmWEdQODAwd2EvVXJqanpJVjArMFlHTHp3?=
 =?utf-8?B?aUhvcVVzMUYyYUp0MThFaHFaVk1kQmxPVTAyNHBBVTdobUtmOEsvRzA0RjE3?=
 =?utf-8?B?UUQwSmZubWtKenhUaERscWxOK1N0bklkVy85VDRWUTBRL3d4OEVsSVN0Z0dI?=
 =?utf-8?B?REVTOFpOZndMY25lZFVRL2Z4a04vRmVjUGdCb1lwbVltYngrRnVSOURoUWJQ?=
 =?utf-8?B?V1NZbWk3SUdCU0xQdzAxbG10aXBuZk91RE9uZW1HU1NmY0drcWpOdXB4dmhx?=
 =?utf-8?B?Tk9YVTFVTzZLUlFoTFhna0lLdmZsLzhnZnVReHR0cUwrczk3QU9HVEw2L1ZT?=
 =?utf-8?B?OEJCQ201djhPV2JPVlhQamEweEtrZm9jblJEM2ZmNU5LVTdJK1A5cGYxaDBp?=
 =?utf-8?B?eWc2OFJ0Rk5QbTdyZitzeG5RRlpwaHYyd0oyWWdYSkJmS0dzZjRNMmhuTFM5?=
 =?utf-8?B?dktyWVhsRDNzeVhqVzlrdGpDanJQSS93YzVlbVBRMXp0MkNyVGp5bW5VOGtK?=
 =?utf-8?B?SXh0eDh1UlFjOURHMGdpYTArd3JOOHdlV2pHVXkwTFpMbkZNM2luRW9nNk9P?=
 =?utf-8?B?dWZCdGc4SkUvYXBXOUdGY3VENFZ6S1dSbDdhc0hrcVNMdUE4U0JsVDA4YUZp?=
 =?utf-8?B?d05YWHlYY2NDcWhZeWRaWGhZZkxLOXdPbHNJS042RXpRWVVldC9mUGtKclJI?=
 =?utf-8?B?NXBPcEJMY2hzcW5YV2hsMUtoa0xiMFRnekNBOHNhcWR2c1l2emZtS3JRT1lZ?=
 =?utf-8?B?L3ZYQTlRdVp4eHk3eFRNRUJONXJLZXBodm5tbHN5VEdIUDJVcVdaZ1p4VUNF?=
 =?utf-8?B?VWk1K3pTcFN1U1QzWTJ5OHl4eEhycEtwUXE5dkQ0UFlZdjNoOGtyeE5DR0xS?=
 =?utf-8?B?bk9ZWUFUUEphTmFOMlBuVGFDVDJFOVNWdVIvRXNCRGlpcTRPc3pPelpaUHlD?=
 =?utf-8?B?dGxKQUFORmIwaHVSVXBSQVV0ZHkzRlk4N2dFNE53bDZVL2NLbTFkUDdFSEZJ?=
 =?utf-8?Q?nVjJ6coAEdFQcxM1wsV38vEo9?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(1800799024)(36860700013)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 10:57:38.6765
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ddd4a979-2d7e-4bea-c207-08de4f6de78b
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000A7DD.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3742
X-Proofpoint-GUID: Kk_kmmMRoet4k20MqPOZDxnslUUBt0xB
X-Authority-Analysis: v=2.4 cv=E8zAZKdl c=1 sm=1 tr=0 ts=6960df28 cx=c_pps
 a=+6CRCh6JdYl0EMJOUlbVVg==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=rg8MelPR9j8A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=134C2J0RlIERMqBQ30UA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA4MCBTYWx0ZWRfX4ti0mQg6rUoV
 jRTSR5xfbzsHDzbORTbVAtAEhAsjulYUyvWATSedmufDyWFZC9xtRbtEChfp25VWkOBz776b4Hp
 hFi+8uKWEjybgTiCulXkHaoSy6BbAWaESwxzv71C0hMxuvuvok/MbuI2OYw6KzP/et9bwIQ10Mh
 94TtPmUnJO/oU/A547FV4CoLpvAeiOFKg3cZZloWAhvZpIoGz5uTOT/C9PLIw5B2Y4Yxf/pJSJA
 dSKyDPJdko6OhUGeR2wCBA1YXHRCJE4nMZRshCwAV3/7uP1ERDHchDBTfrBheQTv4eClxDWghjq
 fWkOqrapUfpI73u6uLd/Xm+B0Z45EszmArl/JztItK35FmjzA+bNbPznkWuO/jn3SmNoTOZTxDq
 D9qyKJc49ulPgIpIIYJYA8zrDBNxaez6UKA5JJxChXXvkuUw0qsrt7s1LMmDVe+ddqfllSG0HTU
 8WgGItgn/3Te2TBMG1A==
X-Proofpoint-ORIG-GUID: Kk_kmmMRoet4k20MqPOZDxnslUUBt0xB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_03,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 impostorscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 suspectscore=0 spamscore=0 clxscore=1011 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090080

Enable CoreSight peripherals on the stm32mp135f-dk board.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp135f-dk.dts | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp135f-dk.dts b/arch/arm/boot/dts/st/stm32mp135f-dk.dts
index ebc719797271..2ce38e46c6d0 100644
--- a/arch/arm/boot/dts/st/stm32mp135f-dk.dts
+++ b/arch/arm/boot/dts/st/stm32mp135f-dk.dts
@@ -174,6 +174,26 @@ &cryp {
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
+&cs_etf {
+	status = "okay";
+};
+
+&cs_etm0 {
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


