Return-Path: <linux-gpio+bounces-30537-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B86D1E1E9
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 11:36:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 27A55309F715
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 10:33:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 544D938FEF5;
	Wed, 14 Jan 2026 10:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="Jvgmd1xO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C0A38BDCE;
	Wed, 14 Jan 2026 10:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.182.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768386771; cv=fail; b=OUkYDXR7SF88e3qr4EbCr4IpjXLhOqnjF/lcXqcKz+okUEmwls0n4DGpaVm2qvJDBnCcRa7h/g3C9blHn7HAH+BkExzlSLRwNIyFr70TpD9SVDCnRjMGDyjqTitbYw5FrCJrDtTIZ9vMV2U2tq6lgIZKPzCYmgMT4JZsHSDMJnA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768386771; c=relaxed/simple;
	bh=l6ZVfoWz5u4T3ZRCM94AGwRm1ba+4HRmvB4JiLZGWDo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=F7nRiVAo0HnD1ZYXY9CsPXrMeDUYqRTWeBJAsYxEKweQXSTIAB5MQO/ZsWEqGn39Jb2AKwR5XzSisFb837qaqDgkisPmv3cDyhZlJZqgciEAM70zoNWTrrm1k5UbbKbxfhy09iQhoEIczDngREE+wi4YYgxDk00ZaNX0/iBAJEw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=Jvgmd1xO; arc=fail smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60EAGXJA777694;
	Wed, 14 Jan 2026 11:31:19 +0100
Received: from am0pr83cu005.outbound.protection.outlook.com (mail-westeuropeazon11010001.outbound.protection.outlook.com [52.101.69.1])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4bntafty6r-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 14 Jan 2026 11:31:18 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YA2gFleKrsmU9VoL6aYPEZWuCr40lt2HUlg7Q2FQxiBhmjS7QIeuQe9GSaRsw7gTngAv5WgZwErYdn7K+gtq0g4S0WcY44LAkqsaASlfW8eNrEytbgRqNTCNSy+pkp/q9SR5JpRFRzgjBGv5xtjXFzVV6Nr/E9jW/9o0sdDyCkVNVCR24uzfg+E8uJoU0QxBfK7A+d94pdYX0RkSCeSpvRoey5Caj40MHNGL8hwcA33zvoWtNMN8M5o+e7nPA1PeyecCMb+1aDzZAh+hBB7BGvreVkNovEiIbqJz7VoIeJWb0/JM5fUg3gtilq5Le5wI+OF0fkNe0Ho9nd/pf9VBuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qHqeqowr6oP0AigY5SnPMenINrDk1GkoRAg0SCMO7jA=;
 b=FF4NRghY0medXdDufXU/vTiT2d9w4NrDyA7NwNuotrwAQ77BwdNiiZysqdsmY68Ojg2zo8CW/tfxbefFvLP+7qmb3CPbyuq/oRxC2LMVstT1ddQM8C9MZXReW/NnsR1yoSSLsHwDpYBCIi8TF5sR4pFO37rgG0NXDfq/8Olaf76YetMHBijLAyrwQYmKZtE4E/qknI8P9O6gL2oSG+RryDIGrmX17Yj7KqfK7OTrFD0nIlIHPqC9Exm3bdID6iAmWHJzxk1uNE59q0DCIs1Pcs0Cy11yyYIVOuhAX1KmZbIWA3IHC5F5XoMlKjqkxMIY+kGfmfdn+p/WkN5V2mnKdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=linaro.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qHqeqowr6oP0AigY5SnPMenINrDk1GkoRAg0SCMO7jA=;
 b=Jvgmd1xO1UsPw/C+3Z45Rw8uGGkZvy9murmUIDnzfYgbRVV+zIvv3+ndAeQOPw1JLWjHQR+PB2tLvma+CSpqtAaoqcpi9RJa7aP/McNuI04zUVpnmPP7k8sUDkgi7JfkgBwO2UYs1w1AdqPsbpUDAiXpajKxTX3OzxZ+iR+g3kQmfOvy9XGJrkDjORXzvd/7sYsjiovQj/PC231A9/rLN/9eiqpiamFpsSj+FQGAYpClWTlgoAwm8vmJz4sqwavFNotGQMuicKjUFW8KzmLwY/60KwC6zhiVBwGFIzrDuEWMXdk3MkneTSIiRkSvVzBD7OVbcPk0KgdgzBvxNaMM7A==
Received: from AS4P189CA0046.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:659::11)
 by PAVPR10MB7466.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:2f5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 14 Jan
 2026 10:31:15 +0000
Received: from AMS1EPF0000004A.eurprd04.prod.outlook.com
 (2603:10a6:20b:659:cafe::fc) by AS4P189CA0046.outlook.office365.com
 (2603:10a6:20b:659::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.5 via Frontend Transport; Wed,
 14 Jan 2026 10:31:14 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS1EPF0000004A.mail.protection.outlook.com (10.167.16.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Wed, 14 Jan 2026 10:31:14 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 14 Jan
 2026 11:32:34 +0100
Received: from localhost (10.48.86.212) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 14 Jan
 2026 11:31:08 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Wed, 14 Jan 2026 11:29:22 +0100
Subject: [PATCH v2 08/11] arm: dts: stm32: enable CoreSight on
 stm32mp15xx-dkx boards
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260114-debug_bus-v2-8-5475c7841569@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: AMS1EPF0000004A:EE_|PAVPR10MB7466:EE_
X-MS-Office365-Filtering-Correlation-Id: 62104376-bfa6-4f58-0a03-08de53580b5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|1800799024|36860700013|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VVVVRlZLemdDa25KSGsrKzFtaTFoL3ZZbUNtbDFRWUtJWCtveHhsQTFEVVRN?=
 =?utf-8?B?OXRDYzQrNFBWME9oa3RycUhoNGZKZTI1VHZMZzVZNWQ2bHFLOEkwelFQbmkx?=
 =?utf-8?B?dm5veWNURXFlaDBRMEg2OTRodktpSWtXLzdvczdOQ1NsbkVLZjQ2U0x4a0p4?=
 =?utf-8?B?U25KZ1MvTW53SUl6bVhJZWJMcXBKUG5LUzl5UjJONlVZR2krZmpKOFl1ampV?=
 =?utf-8?B?REY5VW53RWdJTS9PNnhaU25PR0dIdkQzbWhOS2ltME1VcU9KelB4RFcwRzJE?=
 =?utf-8?B?VGR3TndOZjVrYnhjeEVJWDcyK0ZUVys1bmVJQVk2RFRsbTgzdUlyNVArbEJs?=
 =?utf-8?B?UE9hVlBRRUhuWkhnazRoQ3lSM2RrQWNjaDFlS2h6SnBoYmdnTDhhOTNLS3F0?=
 =?utf-8?B?Ni9ack92WUt6Wk9UTUxwejI5UndUcDAvZ0QzRm82UWhHVWk3cmg2bzNnSDBE?=
 =?utf-8?B?QzJrcnlSQUxDRmVuVWQ5MzNQL3UxZnJnZGtsVEpRTC9NOGJhbnBZTTBpZ3RO?=
 =?utf-8?B?a1J0aENGT0w3VjZoaDloNXQyZEF6WWFMaGhscHlDbGE5WjhEVW5LOEJhVTRV?=
 =?utf-8?B?ODd3aTNkZkh6VmRoZlVWeThSVlF2Z1dCL2VLTmVzUGpjQkNYZzNsTVF2Y0xr?=
 =?utf-8?B?L0pSRUxUN212VnF3OHE1N2x4WTMzT3pjVWhQUUtBZzRtK25oOWNCWDJOOEVT?=
 =?utf-8?B?R2N1Z2V6MlFsWVlsM3M4Y3hscjdnNjFlV0wxUlVEeFMzMFJ5Rnd6ek16dkRm?=
 =?utf-8?B?VVp1TFBRRU1BZzdhS3hxTmkvdWFZOHRjZ2R3WmFuZWdiaEdYQWxVTC9HT0hw?=
 =?utf-8?B?K21tYkFxSVRHUk1KVGxuc29QMjcwK0txRS8vdzJhck4zYzBOMWZDdXR6WlZy?=
 =?utf-8?B?enduMStBR0hnRTJmekhqR2J5V2E5MFFaaDUvdVZYTTcvNmxOUHVhcW1veTRR?=
 =?utf-8?B?Lzl1R3FIenkyRXRoN2g2VGlNS3JaQ3lPMzkweVJ0VzVTVnZ1azlJZ1h2bVdv?=
 =?utf-8?B?Uk9aTGpGMlBXcDEydmM0U3ltV3BUQ01JMk16WDlkUkl2elQ1dHpWbW9LS2E1?=
 =?utf-8?B?eHd1TWc5WnN5ZkV0K3JSU1lLUGFtNitXb2xaRm5JbU9zRWNNdHZCUFNHaENG?=
 =?utf-8?B?MmlRejJDLzVHMGZ5blM4aXdMbk5EZ1ExSXR1ZkJDakNTeFJYODdBNHJCQUo0?=
 =?utf-8?B?djRyL21OSEpxeFBWcnJjLy90Y0pycWdZcURQbnl2clVLcWxyOGlJNllFZnJa?=
 =?utf-8?B?UHRRRGR4U2ttdk1oLzlrSDJ3Wld0Yy9LY2Z5eFhFMnVockxiRGxKWGJJRFB4?=
 =?utf-8?B?RXlFQUNPcVhSeWJBMEd6WEprVC9lTlphY2h1Yzc3cTJTeFNZdVZoMnpUWWJz?=
 =?utf-8?B?UUR2UCt5cmREcEFObk9mWnpna1BoTU1YazVNSW1kczBRUkFTQkk5ZDdHL3ZE?=
 =?utf-8?B?N2FpT0s1SWpqL1BpRkVMeXAzbGE3WWtNT0xxZ25SUzJITW5Tay96TXhwZ3hH?=
 =?utf-8?B?V25yVXIveGZDOHUyR25ranJobE5DN1Qrc0FVdHNQL2ZMU0RXMTFXcFBrODZO?=
 =?utf-8?B?VGtlaEE5T3ZnNk01SDh2Q2RZUFdyb3MzTzAwWXR2aVphMEQza0tWLzRoOXEz?=
 =?utf-8?B?d0JIcmhhSFU4ODNTSXkyQ2NHK2N5VURVTXYrNVMvc0FZRm45R0l5L3UxN3RR?=
 =?utf-8?B?dEpyNnJzMkZCK2FwZXlkT1ZETThmWUZ6OWN4RS9QaG5ESTZPWFFmMkpSWXlQ?=
 =?utf-8?B?SVBCcVhMOHBiR0JTd0JPMjRJMnQ4YTUySHpBYVR6RjFySElFWFFuVHJMbkNQ?=
 =?utf-8?B?Rk15OWF0ZHU3K2pERjdiWDdwdjZJOGc0NGprTHZyQTE4elRwSk5zVThRRjRR?=
 =?utf-8?B?MzdPdno4WExJZmV6WXRTSHVydHZNWUd6YVoxWXdoc3Rza2xXaEJoWmVPclB4?=
 =?utf-8?B?bk03RHFkZ3RkU1hCQzZwWjdmQW1YS2tKanphZXpwdDliZHUrTVk5U21CV0Zx?=
 =?utf-8?B?RW9ncExHWDZ0dVUxVi9LSDdGZ0QwZHRDYnZwckRpRER3T2wyZVhSUGhVS1By?=
 =?utf-8?B?ZFRSajlFMHNvOXJiVmZmSGF5N1FiOTNGbXo3VXlHR0h0Q1h2eXRhNDk2RGo0?=
 =?utf-8?B?NnI5cnc3emwwc2V6VDFPMXVsYmhDelFjYmNqSEZNN3ZUUFJhb3ZXS3Mvd2s5?=
 =?utf-8?B?S2dURmxVMU56RTVtY0hGaXB4ejJiYU5PbWROMnBITzZBQm10bzRMSUJzMjhv?=
 =?utf-8?Q?QY3xgw86BdJuqScwqAUggaEzovVULiqnhcZ4dK0kC8=3D?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(1800799024)(36860700013)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 10:31:14.5319
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 62104376-bfa6-4f58-0a03-08de53580b5f
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF0000004A.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR10MB7466
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDA4NiBTYWx0ZWRfXxVVKCgM1gikT
 uT8hlBPvJ486Kpc4OTkGBZC5qFQIuUMCKbyYa4qEij/hMCcEB+YFl5099+tCBCmb+od1RdG8hm2
 CrJBkemKt4jZSAsP3K71Nz7fYMROv9mud2uqmnFTKZnOi0fLgnjSP/viSYV4AyjwyWIQGEjBGCn
 AUYJ4tQTnrp6pDt1eXfWt32LGC1ksIZiqH7iz6BXfldoiNffvKutoeaxoe1AorOgi4m1eI/1i9o
 +iJugOG9/pykPg1aO9YOgtZm3Ma17919gK+MiPEUP37XG58tPtDG1+xdTKywJfSt7QDxl5PnGvH
 mScrbegnIX/8BXKWqJpUCj7dJ9xxheZV4zMiArhzyPtf2n6HN0wxyXBTi1XO4te89U+QJFn+631
 M8daRjOuVMlmKqOKf9RSM6GfMqf0UAxNC4QQhkNDWsOuGDcjFZM/8ZJJUMZsU6vMSeRLNbYg0lY
 sr0TzOWFsvKNqqrccvQ==
X-Proofpoint-ORIG-GUID: sBYKlzKz4ccK48mTyOLLJJMHihJdGAHu
X-Proofpoint-GUID: sBYKlzKz4ccK48mTyOLLJJMHihJdGAHu
X-Authority-Analysis: v=2.4 cv=W9U1lBWk c=1 sm=1 tr=0 ts=69677077 cx=c_pps
 a=/zxwvu5qryUnIYcS29lqcg==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=rg8MelPR9j8A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=6OkPYWvNmkp-oGry5mkA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140086

Enable CoreSight peripherals on the stm32mp15xx-dkx boards. All boards
including this file are embedding a dual core SoC so this change is
applicable.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi | 36 +++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi b/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
index fe2ab07ea4a8..c91204476161 100644
--- a/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
@@ -140,6 +140,42 @@ &crc1 {
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


