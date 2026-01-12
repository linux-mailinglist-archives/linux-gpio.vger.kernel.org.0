Return-Path: <linux-gpio+bounces-30438-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E6407D116D4
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jan 2026 10:13:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E473B3019E27
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jan 2026 09:13:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 684A8346AFD;
	Mon, 12 Jan 2026 09:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="fgqkg0q1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A229346ADF;
	Mon, 12 Jan 2026 09:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.182.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768209213; cv=fail; b=hiCXiG6x7fxbNszklPUq2rVFaRW00523zDdlsVcQ3uvLFB1GWR7jsMmMWLqK4f/2tnwzzGD+q3icsdGIeS+Hwh6jXOlCCkWjtCUUvIf4RU4jAq3NqTJtFsyCMCkOppqI6BpxNWDY4rjwNXYIBnUWPotHbhS2SNwwnzYc1TZYvjI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768209213; c=relaxed/simple;
	bh=mBFDpA3nNtuuIF/meYlsidlWt2GXKDnYwMdBDCFhEng=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=NB2I09tQFS2MDRB2NdhX55rdlbgpKwsLA1S0Lcu3sWUmsBc3q6VdyQNM2JltOg6pvwNYvT1wl5+KK+FJmz0OpEub0qDOIDZ7uM7KgEcZtF8NlMaDM5Vo94guU+RIyiGYRDqhrmHxy5fwXQbaR8duXV2Vberxwy4MV9lVCFCMBdc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=fgqkg0q1; arc=fail smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C9CJsl2823074;
	Mon, 12 Jan 2026 10:13:07 +0100
Received: from du2pr03cu002.outbound.protection.outlook.com (mail-northeuropeazon11011054.outbound.protection.outlook.com [52.101.65.54])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4bkf00n0yn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 12 Jan 2026 10:13:06 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TevNdSRzCRMX8QXWsyvu+wnofHl7fzeXw/D9Hoc3aHxAxL7o4365pBkOy9PMV1Nz7kjm4IqRC33fWqwNTM2Bnl0uxk9rqNtXerzeZqmg4MuVTt+srHEbRTd5BuRm/b+lbnuXZ3LpmqTzo8VMmfnKQA4V0IEaVzTxunwicmFLlbQE370odNinJehxUjSE/4Y2AoWit0zhlwqbX3YuXUfhd9soH203sS5ZbESn8fTSivPCVwnHxXdJI18CG6wlLjBfuHF+f3MGMyG/tvVGO2vsMVO7nbRv5Vl8btq0fQv3HJIISvS8ZcJ4rn91iI8Cnuci4teCb24Hz0MrGfI1R3bILw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Ui/5gIZR6C6mY/+UOBxf2CbwMTACctHjQKRDTnqv2I=;
 b=LUQdGmPGyN2Ob6VtUG91CR6yuNpcb7xJTp0nSQNibMzW1q67giuSImUgebIUVPGR1+iKqQ9Xqwym4shoSbqaWxRntrgHE2n3dNPr0LAO7WkLwG4nL+JQNaMF3z31JehAEXR2nfc/PyHfLt7CMa/LtfeGhUsGcxSH/bjNGfVf1FsV0D0rtexN7pjehMw5JOstFbn/f6drj5UsBkEs91kIs09Avfc/nwCsusotKUEsfpyEbQ2HYjkEckMt9OLx4GpJysE9ld7Zjk2J9ZU4UwaHatB1KmHpDKe4ve79A9oeQDnk/eo9YKoo/F/z3Z7FB0ghxJwejqwVfbxCGy0aqsfzaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Ui/5gIZR6C6mY/+UOBxf2CbwMTACctHjQKRDTnqv2I=;
 b=fgqkg0q1AkS/u60tyOdTNWv9oXyt5Kmofzj6noIk71d/HGI1b9IjzDUQYhZ4nJnFocbv8ZWGogrZI2MK3JT+b7FX6KQqlXHToFsaQGUzUP7G9B5BJCJSDDO8sB6U3SNUXhpIcYz8NTEDeJGVTaBMimyKgAGN38Q4XxeP7MaOhNEpnSyASigIXNJydAyHeA2jKHzBhvpTtZ61Qzn+IT4RYX8ae3YtLRvd5HRci0UINH6AwfRVkj5XMBONTHyjjjgY0ss9AJ+IqxJsvtr+4qnktgeDpDNcCBjmzTxx0PS+eR+9CzpHjrzHfjswalI7CeWwxDQLKWlmkNStlqRmaOO72w==
Received: from AS4P189CA0045.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5dd::17)
 by VI0PR10MB9520.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:309::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.6; Mon, 12 Jan
 2026 09:13:04 +0000
Received: from AM1PEPF000252DA.eurprd07.prod.outlook.com
 (2603:10a6:20b:5dd:cafe::7) by AS4P189CA0045.outlook.office365.com
 (2603:10a6:20b:5dd::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.7 via Frontend Transport; Mon,
 12 Jan 2026 09:13:01 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM1PEPF000252DA.mail.protection.outlook.com (10.167.16.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Mon, 12 Jan 2026 09:13:03 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 12 Jan
 2026 10:14:19 +0100
Received: from [10.48.86.212] (10.48.86.212) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 12 Jan
 2026 10:13:02 +0100
Message-ID: <63419046-0770-45fd-a602-3ee7e08ff579@foss.st.com>
Date: Mon, 12 Jan 2026 10:13:02 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/11] drivers: bus: add the stm32 debug bus driver
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Suzuki K Poulose
	<suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark
	<james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        Leo Yan <leo.yan@linux.dev>,
        =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>,
        "Linus
 Walleij" <linusw@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
References: <20260109-debug_bus-v1-0-8f2142b5a738@foss.st.com>
 <20260109-debug_bus-v1-5-8f2142b5a738@foss.st.com>
 <429e4411-6372-482b-9a0c-be4befa8f016@kernel.org>
Content-Language: en-US
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <429e4411-6372-482b-9a0c-be4befa8f016@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM1PEPF000252DA:EE_|VI0PR10MB9520:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bfe6018-9b27-4f79-06d3-08de51baca89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZjlwMkcya0pCRitMNVJIUWRxUHRBakNsS3Y1WGpqaW45T05yS0NtWUlybWYw?=
 =?utf-8?B?cDJrN1pDRC9ZSW9kQVJuc3VOb3c5SmlMTTdDcklpcmx1YURhYjc3Y1NOY2dL?=
 =?utf-8?B?MUNkK21qa3c1WXFlYnBwWFdTbXZ4Z3RqQ0RrUm1hTXVwWExlVGdmOGN2b21U?=
 =?utf-8?B?UEdSZFJUaWJBVzFDbnNxKzVYTWNSQlFqc1RNMkxaK3dCQTNERFU5cWJLN0Nv?=
 =?utf-8?B?aHptSGhEaDl2L1hXMVdZV1dSSzJKa2lrMkZPUG9QQnRKbnlreWI4VWpBWkdZ?=
 =?utf-8?B?WWdHL3RsY1pFS0MzWUFyZ0g2RFFNMjlMeWVQSGduOWRsWE9ibjRSQUNCZ01q?=
 =?utf-8?B?dUNFaStaZFUxWFRkakpDM3B4ZGhCUXh5bzFKWDBiVEdsSys5c3B5SlVNQmtJ?=
 =?utf-8?B?RTJzdzJ0b2l0WnpXTlBmT1ZBWW9zTEgwMVc5ZytEM2ZaTG4vRWFJNnVxWndM?=
 =?utf-8?B?RFJvWE8rUFJLVXNjYzRrSDRwVVlydU8vN3hvaGdCbzIxdEtHUEdTN3QrVUlG?=
 =?utf-8?B?czZlcnNxblQvMkw4YUd2bGp1TFl5RGFmSTNnL1ZoNGpReU5ZNUhjZWhLSWNX?=
 =?utf-8?B?UlFnNW15ZWs0QlFjeFRoZGZ0eHRHVEtHV250c251bFNMd0xlWTBFTDZyNVlq?=
 =?utf-8?B?dXhONE1hZDN3bldQSFJBd2xNRVlDUnRXR2pLNFp6MjBtSXFZMnBVQVNHbGxz?=
 =?utf-8?B?YzNuZEY5K3FUV1QxR1lUeGdid3pWUUdQMGhrVmx4RHJuejY3NlNDZjU4cHJj?=
 =?utf-8?B?UzhmVUhINzBTejhkUlpUVjAwOHlkWlI2c3lYL1JzUUh0MGt2NWJiZGE0ektD?=
 =?utf-8?B?aUREd3JDVXIycS9xL3Z0OGY3OU9TZHpHMENlWUZZdENqKzJBamRtS213NE9F?=
 =?utf-8?B?b1d1eXpBMFl2UktjdU5WWmpOS2RzRmdUdmZCU0g4MC80NHFLdkJVTVQ5NWpJ?=
 =?utf-8?B?aUVWcEZ1WXlYbVRSRm95VzJWYkRsQVVTMHhob3I1a3dDcUZFWkttRlZEeHBv?=
 =?utf-8?B?S2ExNTBNQUNDQWlqSWNZOVdybzlPbUx5WWhONWVGQmY3NExkSzM0ZXo2R052?=
 =?utf-8?B?bWtDYW41T29hQUc1OTZQYUVMdWVEZ1N3dThqR2JjN0dTV0xxbU15NGRrbnBZ?=
 =?utf-8?B?dmYzR0hWaDFNci9WOGFRUkplZE1xaTl6U3BzK3ZpcTRJNWtFMUFFUkRVcTA5?=
 =?utf-8?B?Z3VEU1pLK05DQ3hrVnVCZ0Z2OWJFQ01FY3lVUzhycDFxdThyamE0cy9FZnBZ?=
 =?utf-8?B?bUdEVUhHN2lIcEF1b0lFMCtiMHB5akVXYnBvYWFoa3M4MkE1Rzg5WUZQK0p0?=
 =?utf-8?B?QllydGR0cDN2NHdHTUNrODNjUG51OS9UYWZSeGJOb0Y5MXc3Yi82YlZRQ3JS?=
 =?utf-8?B?aisvYVAxQjhUdzZOUFFxcEQ4OTl2Y2VSbnZieGt3Sko2cUZ4WEJETnRJUUZS?=
 =?utf-8?B?cCtOWHJDaEhaNEVERG5kMmorNTZSRDFaMytxNTBHYUZTWXgzd3lKMzdEb05i?=
 =?utf-8?B?dlBDb2NXUS81am1tY085TFY0cFRIN2VVczA4MG5FU216OW9aa3dNNWptUVMz?=
 =?utf-8?B?bzlHTks2VEJReUx2N3lFd0hRd2lwSCtnTHBlUk5OSjNQNzlqM29ZbDZaRmRF?=
 =?utf-8?B?Y3B1YWZuUVVHUDJKaG90UmV6b0lRL3cyZVo0VUUvdDNJaWJ2RHBLa2JnaWl1?=
 =?utf-8?B?ek1UK3o3bENNeDh0YTJMemRJdEhPTGdBWlh6b29iZTU5STlpeDlNTnNsWUI4?=
 =?utf-8?B?S0ZUSDdQdGxjeU1JNXFiNVJDTWZNM3FSK1VYVVRtQU1JdDY5L0ExVzc3SkhN?=
 =?utf-8?B?NHlEdTQxYTZxSUJJMUVTbmdPblhKekhZUW8ydUk3d0pMZjdXUmVDZis3WjJU?=
 =?utf-8?B?WWlYemVYQldqbzJ5a2R1Y1p6K3RKb2pEMHhlZ1VabGd4R3A5SUlEUVdoNlRB?=
 =?utf-8?B?Um9tTStNZ1U3cVZ0eVpSbG50Qmp6OGpIaCs0anFIM3ZjenMvMjh5czJUSEIw?=
 =?utf-8?B?aVVIaGhkemlXTUN5WCtTWE9YOTVYdkJHYktMWlFRdzlFUlNPTGlwMVBka29a?=
 =?utf-8?B?bTJlTUF4dHJmMFpIbkZoZ0V4UlYyK1l2SFB0eDFDQlAwbGI1TmkrZ05nNmNX?=
 =?utf-8?Q?t4FFyu+12+B6EwC9cgcZOQE6H?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(7416014)(376014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 09:13:03.6180
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bfe6018-9b27-4f79-06d3-08de51baca89
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM1PEPF000252DA.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB9520
X-Proofpoint-GUID: r0LoMQg5gy8Rr1DpPDzdIF_lpV41kqIf
X-Proofpoint-ORIG-GUID: r0LoMQg5gy8Rr1DpPDzdIF_lpV41kqIf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA3MiBTYWx0ZWRfXz9eS0STuOtJs
 VXKKAGA0+7rO0JKb42UZ8mn2CYZl7eIprMzC70dCBsx3nZyVjCgo/6BSJOXkRFCKx/y+6HfypEa
 WFjvBCu089ixjWlTsrvLBK+g5ePhH0TkdW80CQeu37h8B5z2HKjl8tXVdQJgRzQBGDIyUB4cpVy
 Zjd9BHZXUfu0dVAzlErKGroai3Epx/8ktQ44USXhUWMroBCj3aXFW58LXq7ZRxc4edMo7sdVgxg
 wjKHzl41x6VVrc+Oloqpp783D3ZvsbGJZvMs6DNDsli0XX2HyvhqFvIPbudF5hetyjC/UdUsU8I
 1M8RS7feIwc8F0L49BWcwnzJsPn0iUWE0+xjqNwmRXB933E1O+QjusV6b+junAQtxNv4z94TnSm
 aC+ZeSiFZWT1BwqPjwZQNX8HGn8+zyezsGFDh+8cDKuLYdv6hyX9LasjnrcrbGESnQSjD4ALNtc
 wqJko2gzYvr0AQ+Nppg==
X-Authority-Analysis: v=2.4 cv=PeDyRyhd c=1 sm=1 tr=0 ts=6964bb22 cx=c_pps
 a=+0KVRcNz3+e5gX6inTwS6Q==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=rg8MelPR9j8A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=XT2IAGBCbescH1of7CkA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120072



On 1/11/26 12:27, Krzysztof Kozlowski wrote:
> On 09/01/2026 11:55, Gatien Chevallier wrote:
>> Add the stm32 debug bus driver that is responsible of checking the
>> +
>> +static int stm32_dbg_bus_grant_access(struct stm32_firewall_controller *ctrl, u32 dbg_profile)
>> +{
>> +	struct tee_ioctl_invoke_arg inv_arg = {0};
>> +	struct tee_param param[1] = {0};
>> +	u32 session_id;
>> +	int ret;
>> +
>> +	if (dbg_profile != PERIPHERAL_DBG_PROFILE && dbg_profile != HDP_DBG_PROFILE)
>> +		return -EOPNOTSUPP;
>> +
>> +	ret = stm32_dbg_pta_open_session(&session_id);
>> +	if (ret)
>> +		return ret;
>> +
>> +	inv_arg.func = PTA_CMD_GRANT_DBG_ACCESS;
>> +	inv_arg.session = session_id;
>> +	inv_arg.num_params = 1;
>> +	param[0].attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT;
>> +	param[0].u.value.a = dbg_profile;
>> +
>> +	ret = tee_client_invoke_func(stm32_dbg_bus_priv->ctx, &inv_arg, param);
>> +	if (ret < 0 || inv_arg.ret != 0) {
>> +		dev_dbg(stm32_dbg_bus_priv->dev,
>> +			"When invoking function, err %x, TEE returns: %x\n", ret, inv_arg.ret);
>> +		if (!ret)
>> +			ret = -EACCES;
>> +	}
>> +
>> +	stm32_dbg_pta_close_session(session_id);
>> +
>> +	return ret;
>> +}
>> +
>> +/* Implement mandatory release_access ops even if it does nothing*/
>> +static void stm32_dbg_bus_release_access(struct stm32_firewall_controller *ctrl, u32 dbg_profile)
>> +{
>> +}
>> +
>> +static int stm32_dbg_bus_plat_probe(struct platform_device *pdev)
>> +{
>> +	struct stm32_firewall_controller *dbg_controller;
>> +	int ret;
>> +
>> +	if (!stm32_dbg_bus_priv)
>> +		return dev_err_probe(&pdev->dev, -EPROBE_DEFER,
>> +				     "OP-TEE debug services not yet available\n");
>> +
>> +	dbg_controller = devm_kzalloc(&pdev->dev, sizeof(*dbg_controller), GFP_KERNEL);
>> +	if (!dbg_controller)
>> +		return dev_err_probe(&pdev->dev, -ENOMEM, "Couldn't allocate debug controller\n");
>> +
>> +	dbg_controller->dev = &pdev->dev;
>> +	dbg_controller->mmio = NULL;
>> +	dbg_controller->name = dev_driver_string(dbg_controller->dev);
>> +	dbg_controller->type = STM32_PERIPHERAL_FIREWALL;
>> +	dbg_controller->grant_access = stm32_dbg_bus_grant_access;
>> +	dbg_controller->release_access = stm32_dbg_bus_release_access;
>> +
>> +	stm32_dbg_bus_priv->dbg_clk = devm_clk_get_enabled(&pdev->dev, NULL);
>> +	if (IS_ERR(stm32_dbg_bus_priv->dbg_clk))
>> +		return PTR_ERR(stm32_dbg_bus_priv->dbg_clk);
>> +
>> +	ret = stm32_firewall_controller_register(dbg_controller);
>> +	if (ret) {
>> +		dev_err(dbg_controller->dev, "Couldn't register as a firewall controller: %d", ret);
>> +		return ret;
>> +	}
>> +
>> +	ret = stm32_firewall_populate_bus(dbg_controller);
>> +	if (ret) {
>> +		dev_err(dbg_controller->dev, "Couldn't populate debug bus: %d", ret);
>> +		stm32_firewall_controller_unregister(dbg_controller);
>> +		return ret;
>> +	}
>> +
>> +	pm_runtime_enable(&pdev->dev);
>> +
>> +	ret = of_platform_populate(pdev->dev.of_node, NULL, NULL, &pdev->dev);
>> +	if (ret) {
>> +		dev_err(dbg_controller->dev, "Couldn't populate the node: %d", ret);
>> +		stm32_firewall_controller_unregister(dbg_controller);
>> +		return ret;
> 
> Where do you depopulate on unbind?
> 

Nowhere, so I'll add it for V2.

>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int __maybe_unused stm32_dbg_bus_runtime_suspend(struct device *dev)
>> +{
>> +	clk_disable_unprepare(stm32_dbg_bus_priv->dbg_clk);
>> +
>> +	return 0;
>> +}
>> +
>> +static int __maybe_unused stm32_dbg_bus_runtime_resume(struct device *dev)
>> +{
>> +	int ret = clk_prepare_enable(stm32_dbg_bus_priv->dbg_clk);
>> +
>> +	if (ret) {
>> +		dev_err(dev, "Failed to enable clock: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct of_device_id stm32_dbg_bus_of_match[] = {
>> +	{ .compatible = "st,stm32mp131-dbg-bus", },
>> +	{ .compatible = "st,stm32mp151-dbg-bus", },
> 
> So devices are fully compatible?
> 

As it is a standard bus, yes. The goal of this driver is to be
able to interface with the secure world to check the debug
configuration.

>> +	{ },
>> +};
>> +MODULE_DEVICE_TABLE(of, stm32_dbg_bus_of_match);
>> +
>> +static const struct dev_pm_ops simple_pm_bus_pm_ops = {
>> +	SET_RUNTIME_PM_OPS(stm32_dbg_bus_runtime_suspend, stm32_dbg_bus_runtime_resume, NULL)
>> +	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
>> +};
>> +
>> +static struct platform_driver stm32_dbg_bus_driver = {
>> +	.probe = stm32_dbg_bus_plat_probe,
>> +	.driver = {
>> +		.name = "stm32-dbg-bus",
>> +		.of_match_table = of_match_ptr(stm32_dbg_bus_of_match),
> 
> Warning :/. Why do people still keep copying of_match_ptr?
> 

I'll remove that in V2.

>> +		.pm = pm_ptr(&simple_pm_bus_pm_ops),
>> +	},
>> +};
>> +
>> +static int optee_ctx_match(struct tee_ioctl_version_data *ver, const void *data)
>> +{
>> +	return (ver->impl_id == TEE_IMPL_ID_OPTEE);
>> +}
>> +
>> +static int stm32_dbg_bus_probe(struct device *dev)
>> +{
>> +	struct stm32_dbg_bus *priv;
>> +
>> +	if (stm32_dbg_bus_priv)
>> +		return dev_err_probe(dev, -EBUSY,
>> +				     "A STM32 debug bus device is already initialized\n");
>> +
>> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>> +	if (!priv)
>> +		return dev_err_probe(dev, -ENOMEM, "Cannot allocate priv data\n");
> 
> You NEVER print error allocations on kzalloc, even if with dev_err_probe
> it is silenced.
> 

Ok, I'll keep that in mind and remove that for V2.

Best regards,
Gatien

>> +
>> +	/* Open context with TEE driver */
>> +	priv->ctx = tee_client_open_context(NULL, optee_ctx_match, NULL, NULL);
>> +	if (IS_ERR_OR_NULL(priv->ctx))
>> +		return dev_err_probe(dev, PTR_ERR_OR_ZERO(priv->ctx), "Cannot open TEE context\n");
>> +
>> +	stm32_dbg_bus_priv = priv;
>> +	stm32_dbg_bus_priv->dev = dev;
>> +
>> +	return 0;
>> +}
>> +
>> +static int stm32_dbg_bus_remove(struct device *dev)
>> +{
>> +	tee_client_close_context(stm32_dbg_bus_priv->ctx);
>> +	stm32_dbg_bus_priv = NULL;
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct tee_client_device_id optee_dbg_bus_id_table[] = {
>> +	{UUID_INIT(0xdd05bc8b, 0x9f3b, 0x49f0,
>> +		   0xb6, 0x49, 0x01, 0xaa, 0x10, 0xc1, 0xc2, 0x10)},
>> +	{}
>> +};
>> +
>> +static struct tee_client_driver stm32_optee_dbg_bus_driver = {
>> +	.id_table = optee_dbg_bus_id_table,
>> +	.driver = {
>> +		.name = "optee_dbg_bus",
>> +		.bus = &tee_bus_type,
>> +		.probe = stm32_dbg_bus_probe,
>> +		.remove = stm32_dbg_bus_remove,
>> +	},
>> +};
>> +
>> +static int __init optee_dbg_bus_mod_init(void)
>> +{
>> +	int ret;
>> +
>> +	ret = driver_register(&stm32_optee_dbg_bus_driver.driver);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = platform_driver_register(&stm32_dbg_bus_driver);
>> +	if (ret)
>> +		driver_unregister(&stm32_optee_dbg_bus_driver.driver);
>> +
>> +	return ret;
>> +}
>> +
>> +static void __exit optee_dbg_bus_mod_exit(void)
>> +{
>> +	platform_driver_unregister(&stm32_dbg_bus_driver);
>> +	driver_unregister(&stm32_optee_dbg_bus_driver.driver);
>> +}
>> +
>> +module_init(optee_dbg_bus_mod_init);
>> +module_exit(optee_dbg_bus_mod_exit);
>> +
>> +MODULE_LICENSE("GPL");
>> +MODULE_AUTHOR("Gatien Chevallier <gatien.chevallier@foss.st.com>");
>> +MODULE_DESCRIPTION("OP-TEE based STM32 debug access bus driver");
>>
> 
> 
> Best regards,
> Krzysztof


