Return-Path: <linux-gpio+bounces-30437-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5EFD116DF
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jan 2026 10:14:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AF014304766A
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jan 2026 09:12:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD315346ADA;
	Mon, 12 Jan 2026 09:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="BDN7qKwY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60AF630BF60;
	Mon, 12 Jan 2026 09:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.182.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768209123; cv=fail; b=GYNAnvcLMR2E8RJsSFBI3beCFDBL/JBP44XfbVUGJvZtTVodjc8QdFWc8dOW2JZ0S+ZnaQt+hSBe8xKAwQr9vhgPzqpbkaRlzzYOVzidYlfGjm/Dde+C8Rv1aDu2ac+tkf2Tde38aQtHiLGaSeKUtLodsiHtELAZX60BXCk8dKA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768209123; c=relaxed/simple;
	bh=4h/u7Eo8doDpSNn09Dx/xg+0KPROIILM9alQ412pI/U=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=c0WcIIAdS6860KPDqWYzcNAiXUGb1LOnCFtLrx68fS2j6PA4Uma5CS8kCWv0Bd3vgXMhOvKKlovXu+Il7AbxGrF2nUSa3nqZkNNEOoPU6TZzuMm6hOkXizhN3ysbbQ6QVkwfD+pWcHcNBfiyBfEGKiStMUcjbTg0PcKNdTBFl+0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=BDN7qKwY; arc=fail smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C9B16M2352767;
	Mon, 12 Jan 2026 10:11:13 +0100
Received: from du2pr03cu002.outbound.protection.outlook.com (mail-northeuropeazon11011057.outbound.protection.outlook.com [52.101.65.57])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4bm174kb7q-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 12 Jan 2026 10:11:13 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XRSJM6PR3SAoeBMK1WVykPJOi9HZvBFSTc843aVkeRJEgLgcNo3nsuSCe05kcZCh+TEK0YSD7x1jNUEa2NBlCst3GCxbC0UkWMsKnghOIuA60LTHkWF6iq4+DhwQezlYnFe8LU2tuA2RKJAS6GKmeD5A7ewKV4/9gO4Cu3CWhm6eBZmfE90UvvZ6GbEzyz4Jd5L1Q1vBT4PQyay0hSmavYbt8CHh99fAtarf1/Ak/AnTt9Mtvmq1jcpgK4R0HFV28o7rSCGa+oOe6lj6ih9+s1kTwwveNj130ciGKBzqkE2aOj3Nu3k4Gv7CZjDmATVt6Tz1ShdMo9FPkCsgTCC/YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+TdpEMuixTtpvWufAE5rHOu9uDHWNuD2ISatjwUHfrA=;
 b=tCExRji60hs/QYcJ+ehhldvKs2wqvQkKn7+zAml5goaEwCSqRqeaD0Bk4lMHSlzuh0SeTbyGdB2A8ogb7Bk4wCjhgYS9ephmJSXteXP59fQhR7xVmp6JHQMhAuScXjBjFfVqpwo3ExGcVoiK/GbWi2POPFjqkw5E2VUgCIAKJj0+Zg+E4tiWDvv7By3zOyZYut7nJM1uMIobuL2VI8hcdvmxFXNhBWj7hc3xlk5pKDh29ubYRloI50RrXlsQ+dsU29hIoZxjv4Fz8obxbPrUHb1i/nYWxO5xijsFZ6NeL5UPlGUtEzbvg/8Z77F8HSfwVt/grP3408XccXcCnn08WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+TdpEMuixTtpvWufAE5rHOu9uDHWNuD2ISatjwUHfrA=;
 b=BDN7qKwYh8ppjQ381zRkM4vTGkj8wC1LMQ+wgek2Cyq8bHHXRDCxv/CLDGhCO14zlWStuOl0PYgwNHMbX2njt6yN4dR5rJVlYHyxAG/p0UARISmlJ1Pkuko6bxxKy92g+KIuYEKzuc/vHe4UlKuWkmW80zaH5TstQasZh0J+Zyx00l8Axlq5Yt+OJERDmwTubcW2RUO8aoOfAt3cXFNXx10/O4ibqsT0VIuGqeC/ApemWo3V/9iagl7hvitrMCzVyIfcLgu+1BUE4k+XrLbUkuC3mgR9l3gUrPm9aujkYbKM8MbONadOGGz1C2fyxqJMC36oniEi/RJTf3+JwrbL8Q==
Received: from DUZP191CA0011.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f9::9) by
 AM0PR10MB3284.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:180::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.7; Mon, 12 Jan 2026 09:11:09 +0000
Received: from DU6PEPF00009523.eurprd02.prod.outlook.com
 (2603:10a6:10:4f9:cafe::6e) by DUZP191CA0011.outlook.office365.com
 (2603:10a6:10:4f9::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.7 via Frontend Transport; Mon,
 12 Jan 2026 09:11:08 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU6PEPF00009523.mail.protection.outlook.com (10.167.8.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Mon, 12 Jan 2026 09:11:09 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 12 Jan
 2026 10:07:32 +0100
Received: from [10.48.86.212] (10.48.86.212) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 12 Jan
 2026 10:06:07 +0100
Message-ID: <f3089d5b-340f-4d26-9b5a-15e9dbe1d389@foss.st.com>
Date: Mon, 12 Jan 2026 10:06:07 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/11] dt-bindings: bus: document the stm32 debug bus
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
 <20260109-debug_bus-v1-3-8f2142b5a738@foss.st.com>
 <a4e11134-3035-4963-a434-db168da32945@kernel.org>
Content-Language: en-US
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <a4e11134-3035-4963-a434-db168da32945@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF00009523:EE_|AM0PR10MB3284:EE_
X-MS-Office365-Filtering-Correlation-Id: 9331591f-8593-4271-f76d-08de51ba865b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|1800799024|36860700013|13003099007|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UDVvY0JtMjRPQUwwYnFpVlBidWs1TVliV2tacjNmcnVtdVVJVjhSc20zL0t1?=
 =?utf-8?B?TDJzMmt2MjdEYTM5Q3AvVWExSlhYWlRIb2MzeEtNeXRMRmpyOGllZExjbVpX?=
 =?utf-8?B?dE9WemZ6b2hLSFFnQXNnQ1NXTEJqcFRrMUFOVmUvcFdodGdOTmswSExXN0tm?=
 =?utf-8?B?Tk0waW9uY2pkenYyL1pkckF1R1NwUU84dVIrTmI1aEFaRjZXZ1ZodkRlSXFh?=
 =?utf-8?B?MWZzc2xUcDR3Wlh1a2hXTnROQlpkbmV2bzcrQnNEK3kvQWtEc2J3Umk3UU5v?=
 =?utf-8?B?S0xvWDh1SUtyM2JkZHRSN2tTT2txWE5kZXQ1cEF5a3I0M1R0enNrN0RYUTlU?=
 =?utf-8?B?bjBYWkR0Q2VMdzM5UmszMTgvaGtDaTNNUEtUZ1AvOGp5aEVHRGY3cC9GRjZN?=
 =?utf-8?B?UkhSSUxkajhmYUxJTlp5a2lPWmhoVjR4SVFUakVHWjA2YWZua3hqOWVyZG1j?=
 =?utf-8?B?WkI1V2VsTDR4dnlTYzVrQXh2Q1BEQkY0TkRiUWpaajJFQ25ESDVteVdnM1FL?=
 =?utf-8?B?UVZnS3BrdG9rR2RoczBicUhzbmJpQlBJZkZqSEhFUElEa0lHS3dLWm9YOHVQ?=
 =?utf-8?B?T2dSYkV6UWJLN3Z6ako4WXA3VS9PeU0zMUVIdGdTejlNMHZmRitVQlByampv?=
 =?utf-8?B?TWljNDNLaXdoRllET29sWjRkbGtwNmd1UmJTSjZIUEtaZzRLU2lxc1RGelgy?=
 =?utf-8?B?NW5lZnB5cEtROERNY3FnS1NRMDFhY1V4cCtWeis5ZVo3WE5jam9KMEllN29J?=
 =?utf-8?B?WEJzdE5RTlp2TGZTRUpFczFWdXQwQ3lVOXQvRGpyempXUzBGNFdSMGtEUVRJ?=
 =?utf-8?B?T3VKbHJMcFpWZEM4bW1IZlZtWS8xS05zaFdwdWtFTytLWERNa2RBaGQra0Fz?=
 =?utf-8?B?VVJrS0F5a1BQTzBOZDhhNnNzOTh4NEFuQ24yZVVBd201VSt6NE9aTjloNFFo?=
 =?utf-8?B?VCtLQURXRE5idnhXUHVHV1JsQXZRQkNXdmN2QW5zZHlabTZpTnFISkFueE92?=
 =?utf-8?B?L0NWM2NIaEhoRXROSGExZThqcTIrS1VJSFlXdWhSdmtsVy9rVGpHMmVzc1A3?=
 =?utf-8?B?cjkvTTFCWmZwK0w5RGJxTVpzdFhNU1M1OHpETXRVSkY5ZXM2OWxyTitoQ1I0?=
 =?utf-8?B?OTdQQlRhZEVscjIyb3BJdTh3elN3UHdTeVVjNHQvb3J1V1VzbjBsVmZPWVZI?=
 =?utf-8?B?K3Bad3NGUGVTY1ZxNDYvMU5NMXZUZTFRdmtCMTBRUCtTVmRxeWlicjRuY05C?=
 =?utf-8?B?K1FNeFpGc0IvWlZ2d1ZYSVoyTWw3eitSZlNsRnBKUENJY3pTTDRLV29UNzFY?=
 =?utf-8?B?KzJWalR4SUdyR2U0VmlLSGFlazRJd2tTUGdhVDhkYW1yVUsydTlBOWh5U2dU?=
 =?utf-8?B?TFJTblFPclRvLzJrbkN5bHlaLzREUUpCY1MzVXdSc3JiSXF1dlE3ckVtMU1Y?=
 =?utf-8?B?cDVkZllkVlRDb0JhcFFwNjBWVjgyZmhuOXpNd21ZS09CWHpIRDlHNUpWbCt3?=
 =?utf-8?B?cm5taHMzS2NYZS9KMWtxbk5zTUdkaGsrcWFIT2grdTB3TmhaUlZXZjVSWW1w?=
 =?utf-8?B?bnNvNWVNZjZUM0VTYzE3OWVkN1duMmpyVy9idmNnNThzUWhkeC9GbDY1bkRu?=
 =?utf-8?B?OThjK0Y0dEJFKzNVSzNQalNxUTV2SmpQSlhzdXhDeERXK2pHemRLSVQ4d3hx?=
 =?utf-8?B?MnZtUW10TnZVR0Y1cmpIU2p1dVJhcmZndXN0SUN4KzRxN2xUeFk3UnF5K2FK?=
 =?utf-8?B?TTJ5Vk9aUnNuZ0Z5VGFJN1lNSURMYVVqWUwvWHE0azdxejBFdC9aakJkay85?=
 =?utf-8?B?Vk9SSVFHdkpzaldXOElMT09NVEk4NDJsVFQ3dVYvdHFpY2d3YkMrcHdJWWdz?=
 =?utf-8?B?N1ZrVG9WVWhhSWZyWi9jUTlpNlJYYnVHV1ZDcnRjTE1JM3NWZjFkZys5U3BV?=
 =?utf-8?B?a1NJMmZIbXVsZnpsTTNTbHNOWnRHYlBtdjNBOXYzR0F2SlB5VnNCRDJleGJv?=
 =?utf-8?B?b2QwcXRIVUVSWUtFYUpBTWFla3RmTVdUZkIvNWVYNFliRXZkQmNmcGNCeVlG?=
 =?utf-8?B?ZXFoOGpyRytQbkFnc25PWEI0SktLNHpsOENSZz09?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(1800799024)(36860700013)(13003099007)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 09:11:09.2003
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9331591f-8593-4271-f76d-08de51ba865b
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF00009523.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3284
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA3MSBTYWx0ZWRfX4SA7zlT3ujsN
 GHad8B9kXEkP7LsD8SVrkJEnphgdUyIanw13/cxWFYcykohzB8ldnPgGp8j4/bJQDADbOL2vu1g
 FI6L5iS3lDz5p08r+0K/D0XFkWntXHk155E+WKy07QElr8Yyf2bNYm8l7+d4nmfGqb9r8ZnIAG4
 jacQX0I2dw1atAuJpttlaWoJj35iiHE8ZSEEFmF+zYKLHJHU6p1lx8XBQHXQOW1kOgKtQVAWd8b
 ku4Gpaph9ghFIXmsWHLQHMKnb6KYrVx1IogDavwXWzoOkvnRTPX1cZxxvPCEbw2AxeKeWxrjRjZ
 MMtH/8Pa/2Y34nmBVoWKHZXc1GtwNxro4mcxOaxXZAObtQgAYReLXpF3s8fY78ZNjDukaF4+2oS
 l6IBXaI69jJBHBWPCqZF5XYEnmQ8RzpxKfhP8bBOIRG70eg6VcunAHizPirroNGM2PCROEHxK8/
 VXueKj7AX3CtJZTaEPg==
X-Proofpoint-ORIG-GUID: aRgD6wgJ8EZxPx8s__qLVzWBzkscG9dj
X-Proofpoint-GUID: aRgD6wgJ8EZxPx8s__qLVzWBzkscG9dj
X-Authority-Analysis: v=2.4 cv=atm/yCZV c=1 sm=1 tr=0 ts=6964bab1 cx=c_pps
 a=JS5Ex5ODQcMkTVofuE0IAw==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=rg8MelPR9j8A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=8b9GpE9nAAAA:8
 a=GV3oxosoKDo0kaNxp5oA:9 a=QEXdDO2ut3YA:10 a=sptkURWiP4Gy88Gu7hUp:22
 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 spamscore=0 malwarescore=0 impostorscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601120071



On 1/11/26 12:27, Krzysztof Kozlowski wrote:
> On 09/01/2026 11:55, Gatien Chevallier wrote:
>> Document the stm32 debug bus. The debug bus is responsible for
>> checking the debug sub-system accessibility before probing any related
>> drivers.
>>
>> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
>> ---
>>   .../bindings/bus/st,stm32mp131-dbg-bus.yaml        | 86 ++++++++++++++++++++++
>>   1 file changed, 86 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/bus/st,stm32mp131-dbg-bus.yaml b/Documentation/devicetree/bindings/bus/st,stm32mp131-dbg-bus.yaml
>> new file mode 100644
>> index 000000000000..68bdfba08909
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/bus/st,stm32mp131-dbg-bus.yaml
>> @@ -0,0 +1,86 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/bus/st,stm32mp131-dbg-bus.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: STM32 Coresight bus
>> +
>> +maintainers:
>> +  - Gatien Chevallier <gatien.chevallier@foss.st.com>
>> +
>> +description: |
> 
> 
> Do not need '|' unless you need to preserve formatting.
> >> +  The STM32 debug bus is in charge of checking the debug configuration
> 
> What sort of bus it is? What protocol? Looks like rather fake wrapping
> node. You cannot just organize children in MMIO and call it a "bus".
> just to justify having child nodes.
> 

It is a standard APB bus, gated through the debug configuration,
dedicated for debug peripherals.

>> +  of the platform before probing the peripheral drivers that rely on the debug
>> +  domain.
>> +
>> +properties:
>> +  compatible:
>> +    oneOf:
> 
> Drop
> 
>> +      - items:
> 
> Drop
> 
>> +          - enum:
>> +              - st,stm32mp131-dbg-bus
>> +              - st,stm32mp151-dbg-bus
>> +
>> +  "#address-cells":
>> +    const: 1
>> +
>> +  "#size-cells":
>> +    const: 1
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  ranges: true
>> +
>> +  reg:
>> +    maxItems: 1
> 
> What stuff is here? Your driver does not use it at all.
> 

I listed the reg property so that it is clear what memory range
the debug bus covers. Peripherals under it should be in that range.
Do you prefer no reg and explicit ranges property with the memory
range in it?

>> +
>> +  "#access-controller-cells":
>> +    const: 1
>> +    description:
>> +      Contains the debug profile necessary to access the peripheral.
>> +
>> +patternProperties:
>> +  "^.*@[0-9a-f]+$":
>> +    description: Debug related peripherals
>> +    type: object
>> +
>> +    additionalProperties: true
>> +
>> +    required:
>> +      - access-controllers
> 
> I don't get why children need to reference the parent. If you have such
> relationship, then the access-controllers are redundant, no?
> 

They can reference the parent, but nothing prevents them to reference
a different access controller, if needed. It's not only the parent
that is referenced, it is also the argument representing the
specific configuration to check.

For now, the peripherals in this patchset all check the
same configuration bits, but there are others that differ,
so I need per-node property.

No peripherals on this bus can function properly without some
bits of debug configuration being set, so I made the property
mandatory.

>> +
>> +required:
>> +  - "#access-controller-cells"
>> +  - "#address-cells"
>> +  - "#size-cells"
>> +  - clocks
>> +  - compatible
>> +  - ranges
>> +  - reg
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/stm32mp1-clks.h>
>> +
>> +    dbg_bus: bus@50080000 {
>> +      compatible = "st,stm32mp131-dbg-bus";
>> +      reg = <0x50080000 0x3f80000>;
>> +      #address-cells = <1>;
>> +      #size-cells = <1>;
>> +      clocks = <&rcc CK_DBG>;
> 
> So the same clock as child? Another argument that this node is not a
> true bus node.
> 

In fact, I do not need to manipulate the clock at bus level. I'll
simply remove it for V2 and let the peripherals enable the bus clock
when needed. Thank you.

>> +      #access-controller-cells = <1>;
>> +      ranges;
>> +
>> +      cs_cti_trace: cti@50094000 {
> 
> Drop unused label
> 
>> +        compatible = "arm,coresight-cti", "arm,primecell";
>> +        reg = <0x50094000 0x1000>;
>> +        clocks = <&rcc CK_DBG>;
>> +        clock-names = "apb_pclk";
>> +        access-controllers = <&dbg_bus 0>;
>> +        status = "disabled";
> 
> Drop
> 
>> +      };
>> +    };
>>
> 
> 
> Best regards,
> Krzysztof

I'll address the comments for v2

Best regards,
Gatien


