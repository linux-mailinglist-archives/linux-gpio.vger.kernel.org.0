Return-Path: <linux-gpio+bounces-30539-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 72EE6D1E1F7
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 11:37:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C43B5306E592
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 10:33:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38D1139281B;
	Wed, 14 Jan 2026 10:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="bEmuQRhY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B15B138B7C0;
	Wed, 14 Jan 2026 10:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.182.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768386789; cv=fail; b=jMEl7kUBGI3doUSGwK02jWryYtwx9JP8raD8bWTAtxMUfpozR/gO7aLoPAiQOGCBaXH9VQseJ+SUL/QXuANijUsUhSe2h2eFX/Dc8kfLb+w9k3LxWg2YmB5aBN7t78jhjWLiIOZoGUCwooidUZPVeH9JMWGxJM1T285L8DkgYnw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768386789; c=relaxed/simple;
	bh=hU3HEygBHHL58lutyZlIrGBOxOy8vwPWczGsLdq5nl4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=s/70OZ+5pwcgU9U/9WEDREdfU4BaZOpEzq7U94zesT7K4Mwx+v66MPQbkdwouxxaKUzxuaJdI4T7OdUz2BjzIDKYYmEHs2dxEgkRt2mRlaQnfXJDuBCUIHQ4LqtrWvp6X8lRJLENMQbOs3ZGjP6nueb4hEy8D5Qn5aXFwpqk/xg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=bEmuQRhY; arc=fail smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60EAJ1mC782296;
	Wed, 14 Jan 2026 11:31:43 +0100
Received: from am0pr83cu005.outbound.protection.outlook.com (mail-westeuropeazon11010055.outbound.protection.outlook.com [52.101.69.55])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4bntafty97-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 14 Jan 2026 11:31:43 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VGtYCraowj8QL4ETH+wYf628qt90X2nYwoKYM1lmdk7YdfHvM63I5WAnzuhT2NywKIbqlzHkbBXkFWEPZeOWEGN1kWRkbDepzcOibUo6am7vezb7CUOtDtkOGENstOtV0Mf5pbE/Mgcj27R8Wm9Im8A38j+V42aJQehDyxvBQHujF/6HznX/vKPJ6mOjm55w4wGSTP56grQzR86WQ2eZCjpZGQVWi26+WqyC0IQTS40n8ChOPGykg/q2Pu6uMfYLdQQsvZKUJBSYILt/HZxYabBHOrPlRT7IvPVgq2mDzkqXSL7zQSOw1EySmLE+39s3B3V0+ePl0OEQ6zrOMOR8lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j+i6hYJIl121U3yi32zJunsVI+LSsuhbXTjIa+p6N1A=;
 b=XaEiIuJu0Y/Op5Ld2PwLziPPXy2nsZn3wdOM2j9GGrW1Hws8hUyC2EKORIAM4UieGAm86PckG2PD5ilUgJXCdtwNM7h7I+oxEdFqqdajpAewIzHzVG5ZNJYw+ekBDlPJ4qEsMFEk05JrBGC4Rr8oPwwW7SPoQUT23AQSdMSjLCr4iOJaw06xjLVacfoBwlWGzcPbL/iUlEGeQEY2+Rr5yso9FMA5IztitYsB7AcO4RZNCWFuK22E6hZXhscYSa+psNhsOre5qhsSZnls1K+J7BFc7My0mZATsY0geWdFICequcGZn2wS6vBrZYPYwXxStnYIuoYV/PPT5blT51DTLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=linaro.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j+i6hYJIl121U3yi32zJunsVI+LSsuhbXTjIa+p6N1A=;
 b=bEmuQRhYvt2GalhhQ+WKTQMxsYwCpbKOAdeXw3vJdnqr518XJAyHhWpIfsRBre6i25zLl3Seqpezp4nWtnUyTzgcNb4+12uRSoz+vKVIBFODLEyi++zH7ny7AkNFltlmPnd2ylR/FVgYs0B+cTdm96A7nYF9hTSwIkVhrIn0hYiTZOUQ8t9NvHzseEtiz89eKD2AAN5s1DFYssWPip7EPOxGBTkWqnnjRcDPkfqeNUa+cQTiQauExh2ii3N9R4O9g5KpGFUqtVoIoH3U3OLuRUQGP5HhwDHenh+lREImhLmJiydFojdTPDcWYU8/wXcM6sXBPEb6G/CciXk93zL4xg==
Received: from CWLP265CA0516.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:18c::11)
 by PR3PR10MB3897.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:47::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Wed, 14 Jan
 2026 10:31:41 +0000
Received: from AMS1EPF00000048.eurprd04.prod.outlook.com
 (2603:10a6:400:18c:cafe::34) by CWLP265CA0516.outlook.office365.com
 (2603:10a6:400:18c::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.5 via Frontend Transport; Wed,
 14 Jan 2026 10:31:41 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS1EPF00000048.mail.protection.outlook.com (10.167.16.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Wed, 14 Jan 2026 10:31:41 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 14 Jan
 2026 11:33:06 +0100
Received: from localhost (10.48.86.212) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 14 Jan
 2026 11:31:40 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Wed, 14 Jan 2026 11:29:25 +0100
Subject: [PATCH v2 11/11] pinctrl: stm32: add firewall checks before
 probing the HDP driver
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20260114-debug_bus-v2-11-5475c7841569@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: AMS1EPF00000048:EE_|PR3PR10MB3897:EE_
X-MS-Office365-Filtering-Correlation-Id: 26c73927-70b9-4a09-28f7-08de53581b6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|1800799024|36860700013|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UnBkclR2S1RSajRjYnNDK0JYNk41M05mWUp6eXlSUGpOM3c1cy9jb1ZMMWZL?=
 =?utf-8?B?Q0FLdStvV1d2RS9FNU95TlFVczIrV240NmpTRzlNTStHOWdWZTlETmRPbUd4?=
 =?utf-8?B?YnlkdHJ6YSs2UEsrMG9DdDFXanVjdXliVnMvbjVyMFF5WG1BR2wxVXo1dHJP?=
 =?utf-8?B?OEZ1c3NSc3Rtc1Z2Qm1rVnRjbTNUYmc1QnpoVGRBSDZ5RTRoS0xjMmg1Wnl0?=
 =?utf-8?B?NWMzME9IcDJPcDNyWFNVOW43cis1L1F6Z2YxdUo1MGlCckZKTGNXdTh5cEht?=
 =?utf-8?B?TmNGc3ZkdU0rQllWRlZlNFVLL0tBZm9RWURkN3N6OWkySlpqUjBLelJXNWVP?=
 =?utf-8?B?eDlCTWlJREE4amxKVGkyNHJwbjQyaUk2Vzk3NHF0QUVOSGUwUFdJSlkybFNj?=
 =?utf-8?B?bko2MEM2K0ZBQ3UvbHk1cnduYkx5ZndhYkliUlNnaEc5TE9Mc2U1cnltMEk3?=
 =?utf-8?B?azJYYlVobGdESE16SUhIRXVPRXBoNHVPVnI2ZW9TcWw0TlJ4M2hWZnkyekRH?=
 =?utf-8?B?YmNnS05PL1BzZnRVeE5uOW50emlwT2d3bmQrMG9SN1BXS0NsaFhsemczMEVX?=
 =?utf-8?B?Q3BvMEpZWUY4U01ieEpIR3ArVFlleXFTb0RrWVF2eUNKUERaVWU1cFZ2MG1C?=
 =?utf-8?B?QVMxaW5mdTBucjRpUTYxdFFDYlZpaUxlWHlNOGNJVnR1NXc2ODBWRUQ0TG9w?=
 =?utf-8?B?Z1FXcTFldDYxUHlUazBSdXc4WWl1azhrRDg5a29sY0cxUVk4TXdxM0xKK0w1?=
 =?utf-8?B?cWJET3piWVhaelBXbVdGSERBL0pSSnpmYnQrcERWb2VDZjZJTnVSZ3RjWUN0?=
 =?utf-8?B?aDNaTHcva2wyYURqdFl3TlU5ekwxd1RBV0JzbG0xaXFRMDE2WDU4NTBzM1pl?=
 =?utf-8?B?UXVDQUNkQWQ2dVYzMngxNmpnSVhhQ2s1N2JDaHkrZjZmb3ROYzJsMDMrODRU?=
 =?utf-8?B?VUNBMVp3cC8rbFMwa1REVGFlbnBzUWVJRTEybWt3MW1tQ1poSDFCbHQwR3pR?=
 =?utf-8?B?MTA0OSs2K1VlNC80YmxuajNXK3dXaGVhT1h0OC9YaDEwa2ZPZXlzNGpEdWho?=
 =?utf-8?B?QnQwSWx1NEdvbiszYWIyd0hEVXZ5ZlA1bVA1ajlhZU1XYmhlMzk2UE5xMkJs?=
 =?utf-8?B?dDh0NmVMMmJZUm5HWW5BV0dabzJYK1FPZ2VLTkhJYkpRZTVaQyt0L2J1akVh?=
 =?utf-8?B?RmdSYVRXUEkra2VDdE1FMC8zQ2JjMUtIcHdoN2p6TVhDWThENjJjNnViUXBk?=
 =?utf-8?B?d05YYVZmZUVrZ2hSQjlhY2crdjY3a2pzaUtxcWJvalgwa0IyUVRqcGRhMi9B?=
 =?utf-8?B?OTVjR2txOStqYlVpRDRjNGJ2Z1ZScWJJYXJ3Rm85YmZtbENEaGRxRk90dkdu?=
 =?utf-8?B?TnV6REIzd2hITFAxYlNaS1lSa1ZJMEVscnJKMjYxMk5aN0ZDSjNHcnVIWVlE?=
 =?utf-8?B?MmN5eFVNS2FrNlZNM2RGQ254U0U1MWhQbkhzNDd4Zm1ZV25WWm9Qa0ZISkh1?=
 =?utf-8?B?TWU3OGZSclUzMVdtODV2WmJqZHRPYkNlODF3R0pYbmZsMHVxTy9KTXUyTm9F?=
 =?utf-8?B?cFdVOHNua2dxQ1JHRk1BT0dBb0RkY2JGOFZXaEFJSkgxYXhRMW1IRmo3cWtB?=
 =?utf-8?B?M1doTVdwL1lCc1QzSlMvaVljTDhDZ1NDd2JXNmdwYkFIMVpHRlQ5RW9IREt1?=
 =?utf-8?B?RWdsMzc2RGEvdWdONExaZDI2WVprcEVyRVdqd0t2cTkvKzB3QkZxazI5cVFS?=
 =?utf-8?B?LzRIUmRiOVBOVjlicmg0WXROYlRQZ3R0c0tWbXdsL09JRE1KalpldG5McTNn?=
 =?utf-8?B?MGtQQy8wS1hRajlRSVZNRkNwNm4rcjR5ckVid2hwRlgwYWpWb285TlhFSEFL?=
 =?utf-8?B?Y2RVeDNpb04wUysyT3R5M2ZWQWxJSXpLczFKYW5JYVNYSTNsVDVxMldzYXJ3?=
 =?utf-8?B?VHIwdGJ0bmhZZ3RQMDIrR21SZ3BlQ1RNbEVtSU9GSWEwZHZRQUtJU2haNGhm?=
 =?utf-8?B?QVdrdHEzN2xsWjhUdnRucFlZRGtyYkF3ekJhSlkzaENUOTlSVFdyVW5HTnd4?=
 =?utf-8?B?a2dsL05zakRRNGFUMURZbzRCSEE4L3Z3dmYvaFFjWU02NjRDV1hEZnBxeHZW?=
 =?utf-8?B?YTd4S2NLRzh0Y3h3eWdnYzVnRlEvMXY0UU5ZQmc5bWgrVHZPOE1UNyswamxJ?=
 =?utf-8?B?TUNCNHIxTUZaWnBZaHpmSFNuNE96Mkg0aTc3azRKa1FTeXc2elhSUDZ2TkNh?=
 =?utf-8?Q?B9kcs/F7LYPb/eou6lY852NMcPNCzmY+KbfdjkU4DE=3D?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(1800799024)(36860700013)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 10:31:41.4861
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 26c73927-70b9-4a09-28f7-08de53581b6f
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000048.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR10MB3897
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDA4NiBTYWx0ZWRfX0y2KoMr5TMxZ
 uk41Dz7pOU/0rauGnUd50L0XRxzf/VTMWDYWY+oMkLMSmJS5NNdWuvTuBcq0Egf06tsIBtE+u3X
 GYawXO6cT3AHKl87FVPl9YouL4ORS6fF5/6sHAnbQc5W8wT7/iYXfsq+z8zrRrswVLqoYCQU96v
 JnzBKKCeeYMtnqopwDbaK3E8tuGUUTVvCmIh2Un4wzDkA79iX2PxD64OLf5mdFNBZkNdVEl4JzU
 Jk1s0kgFLi4Th3iTRyED6GWEIK8O67T060hUyzH2KeLSe+aYFptNBGoxeH53cogBx6/Zk8FC2Y+
 wQu73I81j3exbps4YCKL/62c3Bp6eJwd/IE5hXOTIrMWf0jRrWfDRJi8eVnKIz+kKYA+oRZbrvT
 pm38GeKyaCbJrLOJQIlK4kJnHZnATYSHxIHU5TpV6eBXM1E6y+sG4PSbmosV/e4ZN619AHCFgAK
 fKn6Mm9Zj/OlGMV7UGg==
X-Proofpoint-ORIG-GUID: IDqwOt8YCZr97R5TbP13AFIssvO0KxX4
X-Proofpoint-GUID: IDqwOt8YCZr97R5TbP13AFIssvO0KxX4
X-Authority-Analysis: v=2.4 cv=W9U1lBWk c=1 sm=1 tr=0 ts=6967708f cx=c_pps
 a=xsPRXSxgE/lgwrq+xqasSg==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=rg8MelPR9j8A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=prQzqxCaf5vTWlbXWNoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140086

Because the HDP peripheral both depends on debug and firewall
configuration, when CONFIG_STM32_FIREWALL is present, use the
stm32 firewall framework to be able to check these configuration against
the relevant controllers.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
 drivers/pinctrl/stm32/pinctrl-stm32-hdp.c | 41 +++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32-hdp.c b/drivers/pinctrl/stm32/pinctrl-stm32-hdp.c
index 0b1dff01e04c..7e4aa0465c06 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32-hdp.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32-hdp.c
@@ -4,6 +4,7 @@
  * Author: Clément Le Goffic <clement.legoffic@foss.st.com> for STMicroelectronics.
  */
 #include <linux/bits.h>
+#include <linux/bus/stm32_firewall_device.h>
 #include <linux/clk.h>
 #include <linux/gpio/driver.h>
 #include <linux/gpio/generic.h>
@@ -605,10 +606,50 @@ MODULE_DEVICE_TABLE(of, stm32_hdp_of_match);
 static int stm32_hdp_probe(struct platform_device *pdev)
 {
 	struct gpio_generic_chip_config config;
+	struct stm32_firewall *firewall = NULL;
 	struct device *dev = &pdev->dev;
 	struct stm32_hdp *hdp;
+	int nb_firewall;
 	u8 version;
 	int err;
+	int i;
+
+	nb_firewall = of_count_phandle_with_args(pdev->dev.of_node, "access-controllers",
+						 "#access-controller-cells");
+	if (IS_ENABLED(CONFIG_STM32_FIREWALL) && nb_firewall != -ENOENT) {
+		if (nb_firewall <= 0)
+			return -EINVAL;
+
+		firewall = devm_kcalloc(dev, nb_firewall, sizeof(*firewall), GFP_KERNEL);
+		if (!firewall)
+			return -ENOMEM;
+
+		/* Get stm32 firewall information */
+		err = stm32_firewall_get_firewall(dev->of_node, firewall, nb_firewall);
+		if (err)
+			return dev_err_probe(dev, err, "Failed to get firewall controller\n");
+
+		for (i = 0; i < nb_firewall; i++) {
+			err = stm32_firewall_grant_access_by_id(firewall + i,
+								firewall[i].firewall_id);
+			if (err) {
+				while (i) {
+					u32 id;
+
+					i--;
+					id = firewall[i].firewall_id;
+					stm32_firewall_release_access_by_id(firewall + i, id);
+				}
+				if (err == -EACCES) {
+					dev_info(dev, "No firewall access\n");
+					return -ENODEV;
+				}
+
+				return dev_err_probe(dev, err, "Error checking firewall access\n");
+			}
+		}
+	}
+
 
 	hdp = devm_kzalloc(dev, sizeof(*hdp), GFP_KERNEL);
 	if (!hdp)

-- 
2.43.0


