Return-Path: <linux-gpio+bounces-30534-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA4AD1E133
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 11:32:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7CA0F305DCE8
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 10:31:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7123A38BF66;
	Wed, 14 Jan 2026 10:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="a3D2qNuo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B8C38B7C2;
	Wed, 14 Jan 2026 10:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.182.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768386680; cv=fail; b=fPtBUjbwJK5e+f/TZU3xVbkaug6OGhIIl/OHLeApsU1TnTzEWxz4Py3HysvRFzRq8fXj9zLOAxtYDNhkC8LXCSYYO4crmeueIPszbRspL1dx8dP9PoiPh6PtAzwQZ77AcxjYxXa0Dx+LO1FaSgmF0k8qTtYiuLh5YnyRnNFrov0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768386680; c=relaxed/simple;
	bh=x25uK+ZqAD6cwHr9+2tVXlT78PexqaLmpe/NWvPb1ZM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=JyQFavItNDcgJoKVQElTIQ/EGakafERfZ+lSxd8egX5LYiDt2YzIXTm6Tf9ACZMcupAli61q48X92KouhHVTPHYDiY/BGVdjvGNNpx6BptJ0JFuSzmrtuaChwc4p4Dzftz71hyI4zVCo2wH/0QAbjTMmqyJ8+JrXlzleHbhCQz8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=a3D2qNuo; arc=fail smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60EAKuVq785863;
	Wed, 14 Jan 2026 11:30:55 +0100
Received: from mrwpr03cu001.outbound.protection.outlook.com (mail-francesouthazon11011029.outbound.protection.outlook.com [40.107.130.29])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4bntafty4t-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 14 Jan 2026 11:30:54 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N6UWyPtNoK1Z5sjdYkVSmaVtHe3xTacY8V3bbQnJprnhdaHg2Cdj/BXgXznKF3jhhOG12gQP+BQEjETdTk2Hwo2QSz+JtQinRm9BLafFIxHngNLZwDF8FCHmBRjLpLC6TlrIdfVa2xpRxXhPjWumtagOGFsgh6yomp/ypV/dpuaKKOHa0apgQUHTZ2AT+8EJyPfKeMqumihI38A5RZ50u6HRQmA6VLud/MW9A6T0kU7/mpnM251i9lAvzER3b4e6FjLx5sfyNuhVL5c4mXVS/ewRQ1+w71NMhU93XjeuoA3BCCn7D40zKPvFUIEFbyL4xxmyJlUVCzBtwn/EkfxxMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x69j+KwtehBG/F3KwB+xw3x5ggv6Oxye23T6TDjUTNQ=;
 b=qyNhHAauzaFAOCbA6/U4CL67HrEs1TkXrYEaAQuv2urYnIrtbhHWPIo4XEoUoRYvfwuXra8EoBWkYnDuIHmddqgenJw0ydWQk0XyLrUp7ekP7kpyn+Uh/RepLXFEVowxcM7uxGtZCIDOa1Sr7hLjwzT3NSDfhVcTsonP53/bKDfDgDMou0xTbbeo/zFNMf+O8Dr5yJEqzG0ZGceKJnGj/DJAzoV4EsA696/+gXxg7dr/AJhdirK512SYYV4YdHdISCVzJfGAJN4qlivSweFnFFr3lLL5OITKDF0bEsjn2rpvrNzfNKkbR+ZXBNSGdGGJfmeRr1ISkLJZwFw2j2K7jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=linaro.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x69j+KwtehBG/F3KwB+xw3x5ggv6Oxye23T6TDjUTNQ=;
 b=a3D2qNuoVJt3U5rCNkqX5Fo8uuw1yO4qp6NR0B71wHAxFFu87wl+D0NEAQnGPGD1moq+StkkLxMl2DC37KmeZJxotFswP6T45Hir7+gxkaKtgp5s93T7ynH4QL9mej5GQONSW6udwa4ZkhjSgYynFhNqejM7noUdSEfjj3viCZwCRVYuZfzQ9n5hBfow8nXiDTLWtY6LmVxbHqmYki1YcqwJLPOv4UYcpeeQ2hpZMEVSDuY8FNKrlvkKlVBQ/zNPU7kfEQ+SexlWQbGVlWDKOaPc8s+BziLTrKDXjqGKMHfKaK8Bn0ttOAY7WmLpnqPK0Y+JNnwz5S9GW1shbJN/gg==
Received: from AS8PR04CA0120.eurprd04.prod.outlook.com (2603:10a6:20b:31e::35)
 by PA2PR10MB8750.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:426::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Wed, 14 Jan
 2026 10:30:48 +0000
Received: from AMS1EPF0000004B.eurprd04.prod.outlook.com
 (2603:10a6:20b:31e:cafe::83) by AS8PR04CA0120.outlook.office365.com
 (2603:10a6:20b:31e::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.7 via Frontend Transport; Wed,
 14 Jan 2026 10:30:33 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS1EPF0000004B.mail.protection.outlook.com (10.167.16.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Wed, 14 Jan 2026 10:30:48 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 14 Jan
 2026 11:32:13 +0100
Received: from localhost (10.48.86.212) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 14 Jan
 2026 11:30:47 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Wed, 14 Jan 2026 11:29:20 +0100
Subject: [PATCH v2 06/11] arm: dts: stm32: introduce the debug bus for
 stm32mp1x platforms
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260114-debug_bus-v2-6-5475c7841569@foss.st.com>
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
        Gatien Chevallier <gatien.chevallier@foss.st.com>,
        Antonio Borneo
	<antonio.borneo@foss.st.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF0000004B:EE_|PA2PR10MB8750:EE_
X-MS-Office365-Filtering-Correlation-Id: d04fc3a6-3e44-4492-668b-08de5357fbe4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y2M5WTRESStzWWEzVEY2WkIzK1pSV0hTSG9iNllHTCt6UThHL0kxNnFJa2Yy?=
 =?utf-8?B?c1l0aGNndUQvSXA1ZHpNSDk3dDFRejZWcWxSd2x1S1V4bWlDdm8rQStUS041?=
 =?utf-8?B?SXhIT0hGM2tiaURKalU1MVd2bDNkY2cvZmc0L3ZnZjRqR0ZyaTVhaVZhSmh5?=
 =?utf-8?B?aTlZKzQzRzFqa1Z6ekZEK2FBakVXamc1clhPSHdaOGxoalhtMkhOKzE3dVd2?=
 =?utf-8?B?RXNXYVcvaFlOVlhqdC9rQjdyQlRaVGFwckNnNGdlUy9vdUVTR2U4N1JPNEV6?=
 =?utf-8?B?Q2VZRFhieEZFWEJOWUt3ODhVN2NncnQ0VmlhRlZZQWwyYTJvR0srb0lZK0Q2?=
 =?utf-8?B?RkhYT0FiWEpKQWZuc1ZnSHEra1BleTlsV2R3c2lkcG85eDM1Rld6bnpZU3pD?=
 =?utf-8?B?TmxQbllZYzBPajB6OEFRVTFOeWFoRitwT3p6M3k3OUlFTUtDVWcvVTJtRDV3?=
 =?utf-8?B?cXZad0RCNXhrcTFNT0dVbzhhWUxmZDVYNWlrMWpCUXNTQW5rMWF3Q1pPTXdR?=
 =?utf-8?B?emt4TGxXM29RWFZLRzhHK0ttQkl4N1EwYnpXTlRvZU1OZjFRRTRUMERXSUpp?=
 =?utf-8?B?eTRqaGtkeEdvdjdvc1RpcEU1bnI5bnh0THZmV2d2RmZMOE80bTduZy9NSkJu?=
 =?utf-8?B?T05lcDZDVlpMRVRhMU9kL3E3WlgvWlhYdTk4Q1FqY3pWQk5XM3c5NVM0RFNh?=
 =?utf-8?B?bG02YXJMYjdFRW10VkszaEVpY2lpYmZwNUswTDVZbHVrT0lBM0RjR2RoaGlk?=
 =?utf-8?B?UjlvSFU2QkdqNXBsazBtWWM1eGcybGsrUGRtTlcydExrb0hTMlVoZTFlZnNt?=
 =?utf-8?B?WitRNit6Y1Z1QlhrRTdpN2hhSXV1aElkRi9IckFoczU5cCtqZXVpUDhQdldN?=
 =?utf-8?B?N21aTTdvR2J3a0JmMVJSeEtWaldtK2djRjJCZUl4bE9sQ05uS1cwVVdxV1g1?=
 =?utf-8?B?aHRjVm5Sdk9UT3ZvaUJ3a2pkbkNKZWNjd2Zzb3lFTWRKb0phMy82UWZOVlYv?=
 =?utf-8?B?NHNPamFhK1V0L2s1SGZ4VmI3NmZ4dEczeHRDV0JqbUM4UnAra3VoZDR4UXFj?=
 =?utf-8?B?b2JFNngxM084MEJUdC9xZHNFQTN0MDVncnRoUS9OYk5Ja2UzU2l0Yi95NE8r?=
 =?utf-8?B?SmJ5Z2d6VE1PWEpkcEVGcWczNkphQ1VlR09vUURmNWpibkpYTkRpKzROeXg4?=
 =?utf-8?B?d0Q1cEg4R2FidjV6L29odldpbm5GbGxrWjhaOWMySUR3Wm9pK01ic1N4M3E5?=
 =?utf-8?B?UG9LREdaTjArVHNrSmR0MWFDdjYvSjNjSWhjVitrMUVUMFFTNHFHdUV3Y1pD?=
 =?utf-8?B?S2w3NXVXYzhqVkJNaDNHbkdja21SQkV6aUVvZktuQWRWNjE3dXo0Z2t6R2Z6?=
 =?utf-8?B?QkRoWkVCMUdSUDAyT1laRXJNSFFpMnBEOFJrQWdvRVBoRE4rZ2JiaTVyZlVI?=
 =?utf-8?B?eEFNdXd5WVF6UVBPNmdINHFlNzJITjRUWlM1VzhPbUFjOHJseDBkcXNHZ1Bx?=
 =?utf-8?B?QThqVFRVbWJrc1B1TWRMeG9vM2QvekNiaGwxWndCTkd3U2JXTjlDNGd3cjdk?=
 =?utf-8?B?b052eXROZFhkSk8zKyt5M3VzcTI1NkxTTTRuNzA1V3R4TGtUSTc4RGpINkFh?=
 =?utf-8?B?SE9VRHZSVUQxZ0QyZ1JFMFFreXA0cklXY2hveGxNeTliVmcwVG9NSUdDODZM?=
 =?utf-8?B?ZmJPSkE3S0ZVNmFIUlpsZUFDOXZpR3RubE0zSGsxU2FIZDNsTksrMnZUT2dn?=
 =?utf-8?B?ZXdmeFpHRDlUL05zTFZXM3hVUTZhQlJrODB5MkNpbGkwRlBqL096OThvY3Bz?=
 =?utf-8?B?WVZwV0JhR3JCRFRVN0xwSENXdTlqTFhvUHp3ZEtkc0NYS2puUlJTZWFrVlFD?=
 =?utf-8?B?WlFpeTVWRE1aTTlVSjN0Mmt6dHpZTHJXMFVkUlI1aHhqRGhwVmRZZ3N3azYr?=
 =?utf-8?B?ZzNlRTNxMTU1V2RNR3lEQktqV1MrbEJQY1E3MGxueUo0V2I3a3pDQWdPbW5p?=
 =?utf-8?B?bG00YThSbHA5YSswSnhvbDc1TUlibFFwL2lKTURWV1FkMDdQeEN5ZEFiSU00?=
 =?utf-8?B?WCtsTnpNMk9RQUw1MGpwNUIwR1lwTzdtVXh2YVVpamNFVXl1T0FoWmgxT1RV?=
 =?utf-8?B?c284UTEzN1RwRThVZmNReFRxeW5ZZDMvOS95RE52R1ZlTWNwN2grRkxRVFVs?=
 =?utf-8?B?aVFYejczTngyeDk3Q05pZGt6TjAva0lCakJJZWlNeUhuYkMwU2pXcVZtM3Ir?=
 =?utf-8?Q?j1t6tpEOnMENKb7DPyRdFMBQlSQrcuWH7kidrVEVz4=3D?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(7416014)(376014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 10:30:48.5677
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d04fc3a6-3e44-4492-668b-08de5357fbe4
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF0000004B.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR10MB8750
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDA4NiBTYWx0ZWRfX3D4TFlwentXI
 tP2I3HE+el42fv6kt9DmfejvRJSndPsJkD6fz/TVONvonSaoUc3m66tSwS40nUU1qWF9PFJCCh5
 ss9jrGxI6HWZFnOjzwlVtgLLWBFR7XKSq9gRq4ptyO5cTimxyOxHwR+mFN8gn/+M55hHDfgsEeP
 zqXFaVNpz0dC7Dz3NLF5rua9CwjJoAu5tt8VLVukYsG6SEgBLba3laTEAGa/h9RY2UBh16sI68N
 YBHI1t7iF7AqvbnhzAhj4O2Jy2B52lhSwl9dI0dh1r0OIhgiaZIONUGD0H1cKS8B60B6HY8GIDg
 y1yjFcv4hXKs67WYfVyV5ZtCVEwxzTNgnA9A5JQvWLAc8PIDa/x2qM9Rkz0iA5FwAPz23idv4TB
 glakKyrrly3shyg44uAOIgbzQF/d78gOOjFwEaqcYc3l2jzBE6ykSENsxt2CTsYkrPBClis3q5O
 5ggNzIHZb9UaYvkNzaA==
X-Proofpoint-ORIG-GUID: f3pNaSVsBhVMW1r4nRf7OjautBj2_bWl
X-Proofpoint-GUID: f3pNaSVsBhVMW1r4nRf7OjautBj2_bWl
X-Authority-Analysis: v=2.4 cv=W9U1lBWk c=1 sm=1 tr=0 ts=6967705e cx=c_pps
 a=FCXGMy8pXViI/SoB7+PbHw==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=rg8MelPR9j8A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=-E33GuBO8opgirhHEr4A:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140086

Some peripherals cannot be probed if a debug configuration is not set
in the BSEC.
Introduce a debug bus that will check the debug subsystem accessibility
before probing these peripheral drivers.

Add Coresight peripheral nodes under this bus and add the appropriate
access-controllers property to the HDP node.

Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp131.dtsi | 118 ++++++++++++++++++++++++
 arch/arm/boot/dts/st/stm32mp151.dtsi | 172 +++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/st/stm32mp153.dtsi |  68 ++++++++++++++
 3 files changed, 358 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp131.dtsi b/arch/arm/boot/dts/st/stm32mp131.dtsi
index b9657ff91c23..315c2a952f60 100644
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
@@ -964,9 +965,126 @@ hdp: pinctrl@5002a000 {
 			compatible = "st,stm32mp131-hdp";
 			reg = <0x5002a000 0x400>;
 			clocks = <&rcc HDP>;
+			access-controllers = <&dbg_bus 1>;
 			status = "disabled";
 		};
 
+		dbg_bus: bus@50080000 {
+			compatible = "st,stm32mp131-dbg-bus";
+			reg = <0x50080000 0x3f80000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			#access-controller-cells = <1>;
+			ranges;
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
index b1b568dfd126..1559263204be 100644
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
+			reg = <0x50080000 0x3f80000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			#access-controller-cells = <1>;
+			ranges;
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
+				<0x90000000 0x01000000>;
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


