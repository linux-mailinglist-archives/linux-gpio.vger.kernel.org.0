Return-Path: <linux-gpio+bounces-30939-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KKzOB3FVcmkJiwAAu9opvQ
	(envelope-from <linux-gpio+bounces-30939-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 17:50:57 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A26D76A535
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 17:50:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 58866331F02B
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 16:40:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D2D23FAFA6;
	Thu, 22 Jan 2026 16:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="gmrg3H3u"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495733F6FD2;
	Thu, 22 Jan 2026 16:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=91.207.212.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769098918; cv=fail; b=SXrwCQMs1VSfluDUydHDTNnqc4KjQy4p0wK5XUSa9rFoxtOOx+tdgkjNsdemXYgMSqk5Jv1OTUE7GD80u9oDpQOSgKCTzCTspYraoyTJ8jU+TisTvXgYBVShajFzyFUWbP8T6w1CwxraS6YY8+2CxWqMffOu60guOwEJq2PQ8ls=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769098918; c=relaxed/simple;
	bh=ewEZODz90npyyYRi379HUBKf6SIxjR5Q5hb4xCINgd0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Oqx36HQijEQn+Q6pXTltiEE+326OpefGNRltPFCu/UEpr+2wHB22cGGdqCmKBUigo3jPKPGdTFKpHQ0VcrcoH95n5LNsboP1OsKWqGHQxon9sKjjdXJyyV2RSGSQAwXlX5NRZZpsbUY2hnugS6RtNOoAX5IwXnN2566GL+j0680=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=gmrg3H3u; arc=fail smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60MGGlOx255423;
	Thu, 22 Jan 2026 17:21:29 +0100
Received: from am0pr02cu008.outbound.protection.outlook.com (mail-westeuropeazon11013053.outbound.protection.outlook.com [52.101.72.53])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4bumsf0q5n-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 22 Jan 2026 17:21:28 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aO8SP690wLYzRYD9jrrX61za/ndtGD4QDP5BMEty2JJMAdbSV2aheGVyuaNyncxDsR6DdfJ6cQWMarLH9TK2fgWxuuAdH7YTnL/MeNEChoVeueYma5Z79/nhOoTmLa6TY7ZSBniffIt8v/lLDmocI3qS7EULcnLlYAJ4PMHtRHdcKS3sSWXinRiv3AMlv+tN1imDEo2zr2MgJdxQnhgDK/h/ms4e0U6MJqZy0vcHmCilJ0ONRceiSJuYQeNL1ohreGLTILjpLnuHoszqf7i3YgU/FQGjMGRT0edJF+t0SdwEux4+adLmC2Fbk57xU7zpXa7mvNbAzJ9RUcnLxEFdDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5er+eTox9cwQuYhpYmpkyJ+YK4aQrQb1NoDbSG6A+9U=;
 b=YlmtI8gq+99O4YkiLHabR6PffnOd8+c7SrlEkOcYHmL/QDHX2HgVNQ1oqgdxCSqG2AHyFGLDD8F9qE7mL1LdJjBpp6bdff0qrli/pyKmtbpkIGnRwGc5wpsQKx+hoR2+cF+5W7mIlU/ShGGRpebQ0pPeAfNmlPreTb2Yj3UrKy3yckm7MapsYsdGH+vx8rK+abxseSxeD2pa1gRENJzvHOfli/VSyRZNC0zshAUSdPv0Jc5iMXgH7UF4jYprEf07CIJGYJZIACIZmQq54LUtsyfPlxihz5QS0s0QPVn5STOdRev9eupmbuOFGbO9ql3XZQi4A6nUDG84+g7sArXaNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5er+eTox9cwQuYhpYmpkyJ+YK4aQrQb1NoDbSG6A+9U=;
 b=gmrg3H3uC1QvCDD5Vw/bczuuAB1wS6s392jf5s40vJ0hZ/XHW2ft40A+0MUGAuhilb9t4Xg+inQtYQLsJvr5xY80Lb+9CZxYPncvuTLhMhUpF+ozy+MJV+NU8r9on3VeJ0M+0w+e5U+DHoexikwxxOMgzyb4c/5rIhPi9qc90gR+Fm/ER3LHdyeM/dMsyLHbBlHGtjM2a9zE4srJpCQMB0u1Z1WaNPq7wqRUZi49XRc4TTUC1pAgzNAXIt97ayn36Lav/E5WzDGABR/Z3rEy0SK9WR+oIEon4s8UeN8dPLQMsUE64nPkKObK4iFxGAtgupUwRtte5oV+fN+UV8GYtA==
Received: from DU7P194CA0007.EURP194.PROD.OUTLOOK.COM (2603:10a6:10:553::30)
 by DU0PR10MB5923.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3b5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Thu, 22 Jan
 2026 16:21:26 +0000
Received: from DB5PEPF00014B9C.eurprd02.prod.outlook.com
 (2603:10a6:10:553:cafe::99) by DU7P194CA0007.outlook.office365.com
 (2603:10a6:10:553::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.11 via Frontend Transport; Thu,
 22 Jan 2026 16:21:24 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB5PEPF00014B9C.mail.protection.outlook.com (10.167.8.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 22 Jan 2026 16:21:25 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 22 Jan
 2026 17:22:46 +0100
Received: from localhost (10.48.86.212) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 22 Jan
 2026 17:21:25 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Thu, 22 Jan 2026 17:19:24 +0100
Subject: [PATCH v4 11/12] arm: dts: stm32: enable CoreSight on the
 stm32mp135f-dk board
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260122-debug_bus-v4-11-28f0f2a25f2c@foss.st.com>
References: <20260122-debug_bus-v4-0-28f0f2a25f2c@foss.st.com>
In-Reply-To: <20260122-debug_bus-v4-0-28f0f2a25f2c@foss.st.com>
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
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B9C:EE_|DU0PR10MB5923:EE_
X-MS-Office365-Filtering-Correlation-Id: d7af3aff-f9ed-4634-06f5-08de59d24a64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|36860700013|376014|82310400026|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eTNwUko4aGlYd1dEdVZWZ1Jmd0tEQXBuYkM2a05pajBHSEU0TVZHM2NMSVcr?=
 =?utf-8?B?VFNEK3pjamtPcnBmVVA1RUVoeDZpNm9sK3AvUmhJSXE5MUR0WFN1Y1BOeDhJ?=
 =?utf-8?B?bEtsajc2SlBFb2Z1OC9LTGd3ZGo1QVV6bWpCa1pTak11ZVF4Vm1XRW50cmZz?=
 =?utf-8?B?ZE1sVlZOM21LY0VQM2hZNm5FZitSZWxIZ0RsY3A4YzlBcXZuNi9SalpVYUdN?=
 =?utf-8?B?UmNFYytTYUZ2dUR0UnFXcTloeFN6QmhWakQ5cXhpbHhPL0RQRHpvN2RuRkFi?=
 =?utf-8?B?YksvVXY0VWtJUnJSb21EOU13RlBQUzRwcFhJRks5ZzlxcHpKaVFMcTNUWldN?=
 =?utf-8?B?cTZWNXp1ZGpSMnpzaU5EQjVFSFVwTlZaekd5M21nTmMzcXFabElLMW1adFla?=
 =?utf-8?B?UXdjYWhvN0NKR2ZBblp1M1YyUlJTSHhMZHEwcFpSclk2SnpMS2lqeDM1UmJR?=
 =?utf-8?B?WTJ1N3V2d3VFMnU4U0tlN3ZYdDVCU04wNXRNeG5TcUswOTUxMUxhTG1tTEFz?=
 =?utf-8?B?Wmo4dk5kckNYUUY4a2J5WDNDUjhnTWdhZi82SC96QmZaVnB5NGhFdUY2VENq?=
 =?utf-8?B?Q2NCRFdIMGVEK0NOaWxaTjlJZ2w2MWt3OXExelB2Z3lyWkN4SEtmTHRIUER3?=
 =?utf-8?B?SndDajhpZ01QblFyZmtVNkZUb3FnQktGSkd4YTg0Q1pHcmVVUEhiWGFLdlQ0?=
 =?utf-8?B?amhZZ29ibTJnRkFiek1zTngvQkFrMFNLaHZJSktJWldJcERhaC9xbTV4RjA2?=
 =?utf-8?B?Tlh4a1p3NzdLdTZ1NUtBMXF1MjZ2MGNHRk93VlN6dmVydVpWcGdhUXNZTERX?=
 =?utf-8?B?ZlFodDFKV2lUdDg4TjRzN0Y1ZGI2elFHekdOU3k2ZnhtV1JKNjZ2SDdYK2tG?=
 =?utf-8?B?QnJQUDlrMjN2ZTZ1NWgwWm8rWjhlY1Z3ZnRCWCtjaHhNU2FqZ3VtVFpobE90?=
 =?utf-8?B?NE8yQ2hSc2J0YXkvSEhmRXI4Qkp6VCtsSjBXd0lON0lhYUlYd2cyS1owakVj?=
 =?utf-8?B?YjhJbFRMcEhTSjkvVWUzTnI2REhlSC8vYVRTWm9NS2x5blZ1U1B6dTlLZjhw?=
 =?utf-8?B?aXVIOWFlZC84OXlOTjM0MFNtK3JEbmFqSHYxekZnSUNmL2lsNnFnOFhUMGhE?=
 =?utf-8?B?VDVHOUk1VUhHWllhVGR2UDQ5Unh5blBOMUFxVjlQTUthd0I5WUx0VCtzMHVV?=
 =?utf-8?B?RmdFUmNmNUN1K1h1SjVsU0lzaFZBWTBVTGtJSFB5MzAxb2VNaldOU3pETVI3?=
 =?utf-8?B?VCtJNDBpelBxRnVzdVJOUHRUbk41MlpkWnkveVJaeU9HeThFVFA0QmE3RzZN?=
 =?utf-8?B?R3padkdMbjdPY0tpRzJzbmYveGE2UEF0b2c0WEE5V2dWV1labTczS0ZFVUtj?=
 =?utf-8?B?cVR5VjBGSzI0WVM4WENXU2xPamtNdmJuWEtyRjNNZnBhQkY1UzRUckZaZzZT?=
 =?utf-8?B?Ti8xUmE5YVlGMElvaTN6RmN0S01oV0FJSUtqSGZGNkRBQ0dMQVU0ZDV5c2xJ?=
 =?utf-8?B?N2Y5ZUcvZGJmUEdjSmJxS0NJdnVxOUsvQWhpbDdReC9FMFpNQXdCT0paQVdS?=
 =?utf-8?B?SFFPdlc1R0N3azRtUVYxK2xjOTkrRlNhQnQ1WTI0TXp3Qk1JSEVEYTgyRUxO?=
 =?utf-8?B?a3dMN3h4Tk82NG1OdkM3S1ppUjRxSysyV3ZXdUlpaE8zeEFBNEJDcWluUmdz?=
 =?utf-8?B?WmdMZXJiYnZoK2lzaVprYklsOWFJbVdSaEFFemIxU3Fod1lBNldlVzJOdlQ4?=
 =?utf-8?B?YWFTWnIvbzhidlRZOTMxVys3S1BCVHhxb1lJTCtUN3R5WHRlY0c4U1FXS0Yx?=
 =?utf-8?B?dEVXVU4wZ1hwTit3UVNyN3YrOVBZeGxsYVArSjNwU1NvNzY1WWRzb3FMb3lC?=
 =?utf-8?B?cW9xcCs0NFk0V0N3MEMxU2RQRFdoSU91V214MnY1TDYvVjhTWWdYQ1dob1Rz?=
 =?utf-8?B?WmtQZWhRcS9YaUpZenpFZk80UkVMa1hERGtZVnJkVFFsMUQxSlRycFY5NHZa?=
 =?utf-8?B?c2M5dXp2L2JZTW44RGFacUxic0xRL0hEWjFLUzBtMzR1ZUVPUnF0TVRCeHJj?=
 =?utf-8?B?WkJTZis1bnljT2grOXJVYUJBQzFKVDFZbTIxaFNCNlJXcnRkVUNpN0Mvb0Jp?=
 =?utf-8?B?c09WVlpzcGk2VHZUTGpqaElNdXFYR0dsc0hKVWpPNStJTnk3NXp4NXlTSkN2?=
 =?utf-8?B?ZWhsY3ExQm1CTXVQUktMeEs0a2ROSW81KzBvdHdmSjJrNVdROVo0K0JDSmdw?=
 =?utf-8?Q?lHYpmjK+yC3AMaEDCyhxUN0Kvy4UNL25sClwMF9uno=3D?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(36860700013)(376014)(82310400026)(1800799024)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 16:21:25.8074
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d7af3aff-f9ed-4634-06f5-08de59d24a64
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B9C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB5923
X-Proofpoint-ORIG-GUID: zUP3uX9TVnMWWhM-VUtqs02u2ZsDkOpc
X-Proofpoint-GUID: zUP3uX9TVnMWWhM-VUtqs02u2ZsDkOpc
X-Authority-Analysis: v=2.4 cv=HbUZjyE8 c=1 sm=1 tr=0 ts=69724e88 cx=c_pps
 a=YWN1z1+lYnpGIt36WFtaVw==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=rg8MelPR9j8A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=134C2J0RlIERMqBQ30UA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDEyNSBTYWx0ZWRfX3HAQjDUJeron
 4IKuIAu4JNbidYoLsaQ6R/LT8PpHvXVNX6mPkeGOkHsqZu7q5DkiecCNgb/a/Mz7fcgEPFckvMg
 QFdiw9TVI0Z6iPWNSxXjq9JFmkpHriqwuJEdK0Ntgv2Qvt3gUzllTvjhKoDs6f1KWt9ddAsqKN/
 zW/38uHH77q4Tnt4VdLjY+MfMb7WaK/31sza72GdwrGuLngNiE5mLa510he1eZpMJ+89pCVpDzh
 Z6wVCrNOylxJCcWu7HZrr2fogZs+9tt6eohisk/AVz+N83zgvsHSY39XSPDiRO4Pctf03RHuBly
 hiYVJRkpqH+mwFH+Qi+ChNKQk83ki6WeNY0EmE2huyXZxUWdnbNPoxv28yslS9L5YkoSKl6y5U5
 gBRrZ92ZmWJE/PB4g8tRTX0jZCYGkg5wYA6pVGe23JKAcBBIZbhcRVU9eBoVFLBIW9NNVyv38fo
 iQqStfCxRVQCIhHZ91w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601220125
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[foss.st.com,none];
	R_DKIM_ALLOW(-0.20)[foss.st.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30939-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[arm.com,linaro.org,kernel.org,linux.dev,gmail.com,foss.st.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st.com:email,foss.st.com:mid,foss.st.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	DKIM_TRACE(0.00)[foss.st.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gatien.chevallier@foss.st.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: A26D76A535
X-Rspamd-Action: no action

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


