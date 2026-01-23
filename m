Return-Path: <linux-gpio+bounces-31000-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Ov7BXtQc2kDuwAAu9opvQ
	(envelope-from <linux-gpio+bounces-31000-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 11:42:03 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9701974734
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 11:42:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6563B301FA8E
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 10:41:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3856635CBD0;
	Fri, 23 Jan 2026 10:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="Z0CQ53hQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF7235C1BF;
	Fri, 23 Jan 2026 10:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.182.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769164884; cv=fail; b=JF2eaU8mdRwbGhdjckLQNW3g+V6KmM4YM8dmblQ/O7aGNx+KxJcVhV8miSqNp1ktyr+bE3LzhoyVSTUkGmRHpdZ3m3Fz892Ezn4lQh95NSgO2DMOXoKmoEcMmLKLCTGmxyq17XGf3fHR1M0Nxp0CmG8ninToFcUV3XB85myFb3M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769164884; c=relaxed/simple;
	bh=Zx3fD3TmQa50ZDcT398GmmjoVZFZhk6CyRQGscQIcWM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=ZkA8RYUcZT6CxpTzl2TD63XLgiRKhhK/a66rg2t2TtNmu+owXphS95zwD+V9aKC4c3Uhgt7euoxW78NYpcGiZb8VxTLWa7H4dGiumhLWmE93NUiRCnZnyTb6qI+5SrkBWvGqG+5AfY4b/rNqjq55G49NR5H9tVyjhbwfp9v34pQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=Z0CQ53hQ; arc=fail smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60NAbhXS2252247;
	Fri, 23 Jan 2026 11:41:03 +0100
Received: from am0pr83cu005.outbound.protection.outlook.com (mail-westeuropeazon11010056.outbound.protection.outlook.com [52.101.69.56])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4bunggkjpf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 23 Jan 2026 11:41:03 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=begEZphGS+luYnE6S7SXAOQ/DwhybNIcU181P9TJTJYuIxtE97wOW0D16gKvtjxyYLgYjvMTEIweV4woAqUQp6zs44N/gyBs126TM3yOVkBSX90l3Q2JY5VpjTIBpV12GxfZvxzF38UQOBw7DZxxEC/BPgNh308MYUI+4WSzvdiSOhvEdtdq5FpMoH+NiFJfIrplL6xY7fdAtSpSPg9CXaPJpyYD71fxeEle3Ze51YjpDQ+Ln85eHpZM2g2FmFgQxQS5Sf9frL0aC7Uc3nmrqDE+4S2IJKtI+K46b2l2TsDNcgOm1G+kfml4htkL0QPfdRZZeSBqFvGWqgL26fXWfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ernEp7KlB6dLKXwg2+8felSrDfFfiqskUyyRlMO8ybY=;
 b=ToJjCKY/aHuclWU9ykkqpXMv3tI6/PZchRjlZ0+OX/3hbugfcaQnFqosMqvl/thA0xXwPNL09bSnGOIUvLiOHUveXWUQalsBgtkOIMyH+4hXBGMr4XgeNKDp6e6gbFgrcV7qljx8z0f5aJfXDm6h5ZgQEfjblDV+j5EzOr7XjbjY2UiVJcl4MwmYIxD/B790ZvWpU5tdQvFue06CqPCPs+MTKnFlC9EhaEQG07+bKoVXxtbXOtB7INoSbu8/j6zGHcmiFAkg6K8CmgrWWFy45OkjozZDFAqfMEPqUvud2nsGP66eOmNtRwwxaCwbl2RaPx0WUJJfSioJg43bDu5BwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ernEp7KlB6dLKXwg2+8felSrDfFfiqskUyyRlMO8ybY=;
 b=Z0CQ53hQZMGHaKrSEobJuW75R06DnZh007RvIlQD4XtslpOU7o/RFVZaiBAlEHCzXdZUyWv/VUQ3iTn8JBzBUV5nHC6sq0Xxl069pvpMJHp0W/+4vDFoXDweWZ2XagbcMsZjuAC2uyL87WPqtwJkAmewGNQXy5TPNjmjkUJanmBNBVI+FX6rolZ5Py5IPtAzjkQYb+BcHVIcc+IOu0bhRjIZjcPnB0gazw93zo6A/QAIf0Pbl/+GYl27KQF+fW+0ox7rypWOqhSIbaqALcC3uSubKwqRQYTvJ6MD87s9RLpQRUuNVVRVJxvaBuY/XnG7mhZP15YcIsYBuYziPBE9Qg==
Received: from DUZPR01CA0185.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b3::11) by VI0PR10MB9658.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:800:316::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 10:41:02 +0000
Received: from DB5PEPF00014B8B.eurprd02.prod.outlook.com
 (2603:10a6:10:4b3:cafe::3d) by DUZPR01CA0185.outlook.office365.com
 (2603:10a6:10:4b3::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.12 via Frontend Transport; Fri,
 23 Jan 2026 10:41:26 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB5PEPF00014B8B.mail.protection.outlook.com (10.167.8.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 23 Jan 2026 10:41:01 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 23 Jan
 2026 11:42:32 +0100
Received: from localhost (10.48.86.212) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 23 Jan
 2026 11:41:00 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Fri, 23 Jan 2026 11:39:04 +0100
Subject: [PATCH v5 07/12] arm: dts: stm32: introduce the debug bus for
 stm32mp1x platforms
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260123-debug_bus-v5-7-90b670844241@foss.st.com>
References: <20260123-debug_bus-v5-0-90b670844241@foss.st.com>
In-Reply-To: <20260123-debug_bus-v5-0-90b670844241@foss.st.com>
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
        Gatien Chevallier <gatien.chevallier@foss.st.com>,
        Antonio Borneo
	<antonio.borneo@foss.st.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B8B:EE_|VI0PR10MB9658:EE_
X-MS-Office365-Filtering-Correlation-Id: de289de8-7ff9-478c-ebf5-08de5a6be6e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|7416014|1800799024|82310400026|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WERNZlliQjc2OVdXYUhlNDJQVEdZY2djSk1JTGhpSVlSR04vb3ljeFFUMk5S?=
 =?utf-8?B?TnB4dHlseDRDd1NnRTdCRlFZRll4Uyt3WEhmd0ViQUd3WURralNTVElhbUow?=
 =?utf-8?B?a1F3UFFva2FMOUM2MjVxK3Q0VlM3T29taUorVlVZRzk1dEZKQXFPalZFdHNW?=
 =?utf-8?B?cGhsYTRhUzEwZXdkTlBtZjRYTGdOSHF0c0Q2eVUwMWdrR1BqZWF1YWdKUFE3?=
 =?utf-8?B?WTZtS0IrSmFJN3E4Q0tzaFJOMERWSS9ZMDFEUzVidldzYlQzckZEMjNTTEdE?=
 =?utf-8?B?MFVMdUxmMXY2YW9JMVlMQXR6NkxORHR1OGFyRFluMU0yVmgvSjd2ZGo2ODhO?=
 =?utf-8?B?aTU2THV2NkFUdWhpUjJ1MktkMEN0ZUVsSE5jN3RnWGM2MlczaWVwNmlwMFMr?=
 =?utf-8?B?NDlhdkgyay96RDFVd2xzSEE0dzZ2TlYrY3dPWkQ3enRQVUU2UUxmbzkyc25y?=
 =?utf-8?B?bXg4YTQvZkJnenJDR2N2N0hRU2xmcFk3THFYcmJHSDhPZnlJcUEvcnphQjRH?=
 =?utf-8?B?M1JZNVVVR2t3eHYvU3RYZTgxUTNpeDU1U0RJYS95LzJvU0U2Y1RUbkw1cEVx?=
 =?utf-8?B?bGhWUG1pMzVHbTd4aXl1bml2YkI3bXdFUm5YTGlDY01HT3ZTRDVvODc1K3Rh?=
 =?utf-8?B?dlRHd0luMks4TFRQQ3lEeEVpVW5YYU0zZFpVWUs2SlovUXhmanNwVk9kNm1T?=
 =?utf-8?B?Sk5GdTdSam9wbVpGRXJmbFJWS2draFN0M3phK01jMzhFWXR6SjZPTWdiYUNU?=
 =?utf-8?B?cFA0OHdhZ0tWK2ZqVWRseTZnem80QnNHL1l3ZjhpekgwWUhoeURuNEtQbmRC?=
 =?utf-8?B?N0FlWktaZFdtOExiclh1YWhtUFRhUnY3UjV0YUZHUHpRamVCM0VBYStSRzFz?=
 =?utf-8?B?NUFiekZzMVkwNlg1YU9yYjBLVzA3bU1tVEhQWXB1Z2tOeHZJUCtkdktUeGF5?=
 =?utf-8?B?T1JzSlFXU0xWTllwOHF1SlZPSU93NUwwREtXeGJmNnpHUDVOM2VlQlNtT1o1?=
 =?utf-8?B?Y0VWZ3V4ekVuaVlwL3FNcmhSWC9pcnM3NGppcUZ0WHVQOStXcFJGTWVQRTVK?=
 =?utf-8?B?Z3p5MW5EbWgvUWE2YXRlei84ekt5SlNKT0p1WW0zcHljQ2trU2xrdE1RWWV0?=
 =?utf-8?B?aHIvTFMxRy9BOGdlbUVYTE4wdVQ2VDk4ZmdSb2EzOTVPekVjckJ6V0RnSUhU?=
 =?utf-8?B?K1V6VFcyeGRxKzJUQzF4TVZJZ3hLYWdDblJqQU5DT1JNMXhnWjUwY3FFclBh?=
 =?utf-8?B?ckpSdDVBSmhRcm42UFloRUVMR2JyWldBenIrbU92cndjQURSUlBxY1Jham9Q?=
 =?utf-8?B?WlliV1JjM0pjZklodUFEWXRDTGR2Z2YwZ3ZxOWpzQkJRUHdHRmloWHpLVEFh?=
 =?utf-8?B?L3NhMkZPdWU1NHFDWHpyc2xTQ1U2NTQzOVdZMUUxYk5jbUc4ZzJCQWFRYVFT?=
 =?utf-8?B?ZmRYeEZaanhtNWxzNVQyTzV1QmZ3YjJyalRWaEE5bDRYVjdYc1FMOGUzRGE3?=
 =?utf-8?B?bk42NFA1WnhXK3VNTnRKVlBEWElycWFYUkhFSEdKWFZFSGF3bTRveUp3MG5a?=
 =?utf-8?B?bGNXYTVkN1RxV2twZEdicExLMSs0aVNSbEluSGdrY09ZeUdHQU85SVRMcE9v?=
 =?utf-8?B?U2tURkdacDc1UjBqT3dOdExiV0NLNTcvL204ZkdFSnkyN2R2ek9xWmcrQXRU?=
 =?utf-8?B?UUtpVkRZWEQ2N3dqd25GcXRFaGJ3M1pzaUVJUUhvZW9MT0JHRTB3S0FyMk0v?=
 =?utf-8?B?UGd1LzJJbGRxdk96d0R6emNjNnlHMWxYWHgzZFhjRVFqeFRhc1lqZmdETDUz?=
 =?utf-8?B?U1JjRTY3WUU0M0N1M3hBMUpGMXdyaGxlZGVITWNLL2RsZHNhckZndGpERUZT?=
 =?utf-8?B?S1V4L0U1cldCUEppL293bFJNWlRMUWtwVi9jRzIyMGUrWVdhb1B6cmpmclpF?=
 =?utf-8?B?cGV3aGJRdktMZGZsLy9WODdsZHVDeXJmWUdJejlDVFhQQkZDajgyMjF3N1Fq?=
 =?utf-8?B?REs1eWhkWTZnbytGWDd4OG5WVWVCLzFKMElBeG5IUE1WSExLcjB1ZmpPMnEv?=
 =?utf-8?B?NmZMSldVQWJLWTlLZGdrRk9rV0NJV0hlcmFmaWNrNnRFNW80QTBEQ2J6NXhF?=
 =?utf-8?B?K0ZRWUZqZXNOdk9Tajh3SkN6Skl2MXVYODFFK3JObGpRZHBQMUw2OTRYREtG?=
 =?utf-8?B?cUdHOFEyN1dHSXI0czB5UWFYUnd4SWUva2crOUtmNmIxRE9JMzdCK2pIWFR4?=
 =?utf-8?Q?cxHugJakcWB9QV+lTIbdIZMjq+7z2pa9HkZLTtLahA=3D?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(7416014)(1800799024)(82310400026)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 10:41:01.4119
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de289de8-7ff9-478c-ebf5-08de5a6be6e8
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B8B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB9658
X-Authority-Analysis: v=2.4 cv=VdD6/Vp9 c=1 sm=1 tr=0 ts=6973503f cx=c_pps
 a=sNnqP7wa/47tCSgtSqPzZA==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=rg8MelPR9j8A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=-E33GuBO8opgirhHEr4A:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: RmOFxijnvP5xTBkOtuEu5LlOsKiFHag4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDA4NSBTYWx0ZWRfX8k3kRweqedgX
 /ISKm+BnMS5GDdW37Src+HNps6j/+wHGtDxtxsdXnkJh7msXWlsCM8E6lIs9+KBud8kvzvdkhtb
 bZXQUaduRMmv9GuvQ/oKcLi229rNZU7ZQwqOAMax4rT4CGieV9TqzPhyo71m/OP3pmOCzD4SmAh
 dOciAAVYALE4qosvKriCsyO92k/UV0qKvEG4ZSLjUZNwe5Tjvfrm8xy80qEqA6izECCPPDJ157j
 QDAi4A3+xob/9vBFrBcgxYg/uWuPWUEwz/sZvC1D+mBZZIztZVhr26K8LOspSyFUhwxrmX801la
 qRSXwosnO8Cu3SnfKIPnYmt62G0rM4liG3vIXo9LjPVlBZ1hd7UK0ktnUMVDVpmuf3Bg2U+D7IE
 8BZbxYbFo+2woWrrWmyQZe2GoBzsNz8cdrIJduKHdh9Bx+dbjqHbjQ6qP93viTPWGoLJvtAY2K7
 eg43tjLVa0uy1g2AoNw==
X-Proofpoint-GUID: RmOFxijnvP5xTBkOtuEu5LlOsKiFHag4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-23_01,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 impostorscore=0 adultscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601230085
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[foss.st.com,none];
	R_DKIM_ALLOW(-0.20)[foss.st.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31000-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[arm.com,linaro.org,kernel.org,linux.dev,gmail.com,foss.st.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[2.252.95.176:email,st.com:email,2.252.91.200:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,500d8000:email,500a0000:email,5002a000:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gatien.chevallier@foss.st.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:+];
	DBL_PROHIBIT(0.00)[2.252.87.224:email,3.117.2.128:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 9701974734
X-Rspamd-Action: no action

Some peripherals cannot be probed if a debug configuration is not set
in the BSEC.
Introduce a debug bus that will check the debug subsystem accessibility
before probing these peripheral drivers.

Add Coresight peripheral nodes under this bus and add the appropriate
access-controllers property to the HDP node.

Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp131.dtsi | 117 ++++++++++++++++++++++++
 arch/arm/boot/dts/st/stm32mp151.dtsi | 172 +++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/st/stm32mp153.dtsi |  68 ++++++++++++++
 3 files changed, 357 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp131.dtsi b/arch/arm/boot/dts/st/stm32mp131.dtsi
index b9657ff91c23..a2513d55499f 100644
--- a/arch/arm/boot/dts/st/stm32mp131.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp131.dtsi
@@ -3,6 +3,7 @@
  * Copyright (C) STMicroelectronics 2021 - All Rights Reserved
  * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
  */
+#include <dt-bindings/arm/coresight-cti-dt.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/stm32mp13-clks.h>
 #include <dt-bindings/reset/stm32mp13-resets.h>
@@ -964,9 +965,125 @@ hdp: pinctrl@5002a000 {
 			compatible = "st,stm32mp131-hdp";
 			reg = <0x5002a000 0x400>;
 			clocks = <&rcc HDP>;
+			access-controllers = <&dbg_bus 1>;
 			status = "disabled";
 		};
 
+		dbg_bus: bus@50080000 {
+			compatible = "st,stm32mp131-dbg-bus";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			#access-controller-cells = <1>;
+			ranges = <0x50080000 0x50080000 0x3f80000>;
+			status = "disabled";
+
+			cs_etf: etf@50092000 {
+				compatible = "arm,coresight-tmc", "arm,primecell";
+				reg = <0x50092000 0x1000>;
+				clocks = <&rcc CK_DBG>;
+				clock-names = "apb_pclk";
+				access-controllers = <&dbg_bus 0>;
+				status = "disabled";
+
+				in-ports {
+					port {
+						etf_in_port: endpoint {
+							remote-endpoint = <&etm0_out_port>;
+						};
+					};
+				};
+
+				out-ports {
+					port {
+						etf_out_port: endpoint {
+							remote-endpoint = <&tpiu_in_port>;
+						};
+					};
+				};
+			};
+
+			cs_tpiu: tpiu@50093000 {
+				compatible = "arm,coresight-tpiu", "arm,primecell";
+				reg = <0x50093000 0x1000>;
+				clocks = <&rcc CK_DBG>, <&rcc CK_TRACE>;
+				clock-names = "apb_pclk", "atclk";
+				access-controllers = <&dbg_bus 0>;
+				status = "disabled";
+
+				in-ports {
+					port {
+						tpiu_in_port: endpoint {
+							remote-endpoint = <&etf_out_port>;
+						};
+					};
+				};
+			};
+
+			cs_cti_trace: cti@50094000 {
+				compatible = "arm,coresight-cti", "arm,primecell";
+				reg = <0x50094000 0x1000>;
+				clocks = <&rcc CK_DBG>;
+				clock-names = "apb_pclk";
+				access-controllers = <&dbg_bus 0>;
+				status = "disabled";
+			};
+
+			cs_cti_cpu0: cti@500d8000 {
+				compatible = "arm,coresight-cti", "arm,primecell";
+				reg = <0x500d8000 0x1000>;
+				clocks = <&rcc CK_DBG>;
+				clock-names = "apb_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				access-controllers = <&dbg_bus 0>;
+				status = "disabled";
+
+				trig-conns@0 {
+					reg = <0>;
+					arm,trig-in-sigs = <0 4 5>;
+					arm,trig-in-types = <PE_DBGTRIGGER
+							     GEN_IO
+							     GEN_IO>;
+					arm,trig-out-sigs = <0 7>;
+					arm,trig-out-types = <PE_EDBGREQ
+							      PE_DBGRESTART>;
+					cpu = <&cpu0>;
+				};
+
+				trig-conns@2 {
+					reg = <2>;
+					arm,trig-in-sigs = <2 3 6>;
+					arm,trig-in-types = <ETM_EXTOUT
+							     ETM_EXTOUT
+							     ETM_EXTOUT>;
+					arm,trig-out-sigs = <1 2 3 4>;
+					arm,trig-out-types = <ETM_EXTIN
+							      ETM_EXTIN
+							      ETM_EXTIN
+							      ETM_EXTIN>;
+					arm,cs-dev-assoc = <&cs_etm0>;
+				};
+			};
+
+			cs_etm0: etm@500dc000 {
+				compatible = "arm,coresight-etm3x", "arm,primecell";
+				reg = <0x500dc000 0x1000>;
+				cpu = <&cpu0>;
+				clocks = <&rcc CK_DBG>, <&rcc CK_TRACE>;
+				clock-names = "apb_pclk", "atclk";
+				access-controllers = <&dbg_bus 0>;
+				status = "disabled";
+
+				out-ports {
+					port {
+						etm0_out_port: endpoint {
+							remote-endpoint = <&etf_in_port>;
+						};
+					};
+				};
+			};
+		};
+
 		mdma: dma-controller@58000000 {
 			compatible = "st,stm32h7-mdma";
 			reg = <0x58000000 0x1000>;
diff --git a/arch/arm/boot/dts/st/stm32mp151.dtsi b/arch/arm/boot/dts/st/stm32mp151.dtsi
index b1b568dfd126..1580fdcfb772 100644
--- a/arch/arm/boot/dts/st/stm32mp151.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp151.dtsi
@@ -3,6 +3,7 @@
  * Copyright (C) STMicroelectronics 2017 - All Rights Reserved
  * Author: Ludovic Barre <ludovic.barre@st.com> for STMicroelectronics.
  */
+#include <dt-bindings/arm/coresight-cti-dt.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/stm32mp1-clks.h>
 #include <dt-bindings/reset/stm32mp1-resets.h>
@@ -274,9 +275,180 @@ hdp: pinctrl@5002a000 {
 			compatible = "st,stm32mp151-hdp";
 			reg = <0x5002a000 0x400>;
 			clocks = <&rcc HDP>;
+			access-controllers = <&dbg_bus 1>;
 			status = "disabled";
 		};
 
+		dbg_bus: bus@50080000 {
+			compatible = "st,stm32mp151-dbg-bus";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			#access-controller-cells = <1>;
+			ranges = <0x50080000 0x50080000 0x3f80000>,
+				 <0x90000000 0x90000000 0x1000000>;
+			status = "disabled";
+
+			cs_funnel: funnel@50091000 {
+				compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+				reg = <0x50091000 0x1000>;
+				clocks = <&rcc CK_DBG>, <&rcc CK_TRACE>;
+				clock-names = "apb_pclk", "atclk";
+				access-controllers = <&dbg_bus 0>;
+				status = "disabled";
+
+				in-ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					port@0 {
+						reg = <0>;
+						funnel_in_port0: endpoint {
+							remote-endpoint = <&stm_out_port>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+						funnel_in_port1: endpoint {
+							remote-endpoint = <&etm0_out>;
+						};
+					};
+				};
+
+				out-ports {
+					port {
+						funnel_out_port: endpoint {
+							remote-endpoint = <&etf_in_port>;
+						};
+					};
+				};
+			};
+
+			cs_etf: etf@50092000 {
+				compatible = "arm,coresight-tmc", "arm,primecell";
+				reg = <0x50092000 0x1000>;
+				clocks = <&rcc CK_DBG>;
+				clock-names = "apb_pclk";
+				access-controllers = <&dbg_bus 0>;
+				status = "disabled";
+
+				in-ports {
+					port {
+						etf_in_port: endpoint {
+							remote-endpoint = <&funnel_out_port>;
+						};
+					};
+				};
+
+				out-ports {
+					port {
+						etf_out_port: endpoint {
+							remote-endpoint = <&tpiu_in_port>;
+						};
+					};
+				};
+			};
+
+			cs_tpiu: tpiu@50093000 {
+				compatible = "arm,coresight-tpiu", "arm,primecell";
+				reg = <0x50093000 0x1000>;
+				clocks = <&rcc CK_DBG>, <&rcc CK_TRACE>;
+				clock-names = "apb_pclk", "atclk";
+				access-controllers = <&dbg_bus 0>;
+				status = "disabled";
+
+				in-ports {
+					port {
+						tpiu_in_port: endpoint {
+							remote-endpoint = <&etf_out_port>;
+						};
+					};
+				};
+			};
+
+			cs_cti_trace: cti@50094000 {
+				compatible = "arm,coresight-cti", "arm,primecell";
+				reg = <0x50094000 0x1000>;
+				clocks = <&rcc CK_DBG>;
+				clock-names = "apb_pclk";
+				access-controllers = <&dbg_bus 0>;
+				status = "disabled";
+			};
+
+			cs_stm: stm@500a0000 {
+				compatible = "arm,coresight-stm", "arm,primecell";
+				reg = <0x500a0000 0x00001000>,
+				      <0x90000000 0x01000000>;
+				reg-names = "stm-base", "stm-stimulus-base";
+				clocks = <&rcc CK_DBG>, <&rcc CK_TRACE>;
+				clock-names = "apb_pclk", "atclk";
+				access-controllers = <&dbg_bus 0>;
+				status = "disabled";
+
+				out-ports {
+					port {
+						stm_out_port: endpoint {
+							remote-endpoint = <&funnel_in_port0>;
+						};
+					};
+				};
+			};
+
+			cs_cti_cpu0: cti@500d8000 {
+				compatible = "arm,coresight-cti", "arm,primecell";
+				reg = <0x500d8000 0x1000>;
+				clocks = <&rcc CK_DBG>;
+				clock-names = "apb_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				access-controllers = <&dbg_bus 0>;
+				status = "disabled";
+
+				trig-conns@0 {
+					reg = <0>;
+					arm,trig-in-sigs = <0 4 5>;
+					arm,trig-in-types = <PE_DBGTRIGGER
+							     GEN_IO
+							     GEN_IO>;
+					arm,trig-out-sigs = <0 7>;
+					arm,trig-out-types = <PE_EDBGREQ
+							      PE_DBGRESTART>;
+					cpu = <&cpu0>;
+				};
+
+				trig-conns@2 {
+					reg = <2>;
+					arm,trig-in-sigs = <2 3 6>;
+					arm,trig-in-types = <ETM_EXTOUT
+							     ETM_EXTOUT
+							     ETM_EXTOUT>;
+					arm,trig-out-sigs = <1 2 3 4>;
+					arm,trig-out-types = <ETM_EXTIN
+							      ETM_EXTIN
+							      ETM_EXTIN
+							      ETM_EXTIN>;
+					arm,cs-dev-assoc = <&cs_etm0>;
+				};
+			};
+
+			cs_etm0: etm@500dc000 {
+				compatible = "arm,coresight-etm3x", "arm,primecell";
+				reg = <0x500dc000 0x1000>;
+				cpu = <&cpu0>;
+				clocks = <&rcc CK_DBG>, <&rcc CK_TRACE>;
+				clock-names = "apb_pclk", "atclk";
+				access-controllers = <&dbg_bus 0>;
+				status = "disabled";
+
+				out-ports {
+					port {
+						etm0_out: endpoint {
+							remote-endpoint = <&funnel_in_port1>;
+						};
+					};
+				};
+			};
+		};
+
 		mdma1: dma-controller@58000000 {
 			compatible = "st,stm32h7-mdma";
 			reg = <0x58000000 0x1000>;
diff --git a/arch/arm/boot/dts/st/stm32mp153.dtsi b/arch/arm/boot/dts/st/stm32mp153.dtsi
index 92794b942ab2..17d52d93695e 100644
--- a/arch/arm/boot/dts/st/stm32mp153.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp153.dtsi
@@ -30,6 +30,74 @@ timer {
 	};
 };
 
+&cs_funnel {
+	in-ports {
+		port@2 {
+			reg = <2>;
+			funnel_in_port2: endpoint {
+				remote-endpoint = <&etm1_out>;
+			};
+		};
+	};
+};
+
+&dbg_bus {
+	cs_cti_cpu1: cti@500d9000 {
+		compatible = "arm,coresight-cti", "arm,primecell";
+		reg = <0x500d9000 0x1000>;
+		clocks = <&rcc CK_DBG>;
+		clock-names = "apb_pclk";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		access-controllers = <&dbg_bus 0>;
+		status = "disabled";
+
+		trig-conns@0 {
+			reg = <0>;
+			arm,trig-in-sigs = <0 4 5>;
+			arm,trig-in-types = <PE_DBGTRIGGER
+					     GEN_IO
+					     GEN_IO>;
+			arm,trig-out-sigs = <0 7>;
+			arm,trig-out-types = <PE_EDBGREQ
+					      PE_DBGRESTART>;
+			cpu = <&cpu1>;
+		};
+
+		trig-conns@2 {
+			reg = <2>;
+			arm,trig-in-sigs = <2 3 6>;
+			arm,trig-in-types = <ETM_EXTOUT
+					     ETM_EXTOUT
+					     ETM_EXTOUT>;
+			arm,trig-out-sigs = <1 2 3 4>;
+			arm,trig-out-types = <ETM_EXTIN
+					      ETM_EXTIN
+					      ETM_EXTIN
+					      ETM_EXTIN>;
+			arm,cs-dev-assoc = <&cs_etm1>;
+		};
+	};
+
+	cs_etm1: etm@500dd000 {
+		compatible = "arm,coresight-etm3x", "arm,primecell";
+		reg = <0x500dd000 0x1000>;
+		cpu = <&cpu1>;
+		clocks = <&rcc CK_DBG>, <&rcc CK_TRACE>;
+		clock-names = "apb_pclk", "atclk";
+		access-controllers = <&dbg_bus 0>;
+		status = "disabled";
+
+		out-ports {
+			port {
+				etm1_out: endpoint {
+					remote-endpoint = <&funnel_in_port2>;
+				};
+			};
+		};
+	};
+};
+
 &etzpc {
 	m_can1: can@4400e000 {
 		compatible = "bosch,m_can";

-- 
2.43.0


