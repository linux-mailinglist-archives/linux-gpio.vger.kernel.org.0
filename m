Return-Path: <linux-gpio+bounces-30457-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 28EC6D13D73
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jan 2026 16:57:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 87B5E301558F
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jan 2026 15:57:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F93236403C;
	Mon, 12 Jan 2026 15:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="PHENBecP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723083612CB;
	Mon, 12 Jan 2026 15:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=91.207.212.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768233435; cv=fail; b=LFrdnwAe0qzfMCF7leEbmRHexUDc6E5Ne5o347vnyfbfaZT9lsjbZrjyKzsNygGopkmJVr9OoRvXyb6uyfbl+kbzSa0flJEHAmoK1k6FirioBq0hBT4HItzmQJGgBvkW0bxUqVETaEk8m3tfJzUby3TNI6LlcgkvjR6gNdredgU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768233435; c=relaxed/simple;
	bh=V8z7eWcchMBlUnAh6lo8RQWDhPRJeTZCqkSRDN4DXgo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=EzNto+yaoiDnv4zbHCXD6kDmVzAxPHuq7FzouX4hB2pr9WcJLrzkg/0mFaCUrVpPfpnwu0Yg0q4ca3K+FbnnQXSUVmyvono+WYHs+sm60TDSLa8LBhFHl3CeoLndJibG56qo0I4K6pypsSDQlCjZFvQEviQEHgbgZuVAUk2BbT8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=PHENBecP; arc=fail smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60CFbDWY3568059;
	Mon, 12 Jan 2026 16:56:49 +0100
Received: from duzpr83cu001.outbound.protection.outlook.com (mail-northeuropeazon11012067.outbound.protection.outlook.com [52.101.66.67])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4bm2kpvjfn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 12 Jan 2026 16:56:49 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i0nCbYChLISwayWIRNsPhAki7QlPiLRd4XhAqBYul40/BB37zXladktg2hSyGofhauNeFA5Md1rRi2dJVNCIUEStaoOV043TI1AQj2W4UDJjVF0AAoXKFIl1s5jO69b+//5wW1axMdxccqiE4fxE9knpSGG6bvex5wZwkVgRcv5bvl1/BlncySpf9a0QdFuGJzAXtUUniXtLqiq+P4MtkePsz2ZcpNOJENeIc7Qd1S0hmRHwYjcPUMAiDHrFGnFmhCgqWrdUyIrTCOhy3+Pm2Z66V0iqWkxi9Hxpe1zl2/3CigpB1EVicmyaiHhPdWO8tcMLqI6guPOcDC5Fuxs0Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wnlgiFJfv4qdn9WqcMN12KaRFXbVJYyNRztehNQsTkM=;
 b=S5AwLYkFlWFfzfku8NuTiYF3/PCSDpZ+l483A/cwrnE+2vbB8iaCaH3eSH+lYX6slyhktiG+2Ou76aqCugKv62v8hr17jlKg0Kj96v4o6h+z/GqOplzOYTlcsPZbUjw5J59MYtkEqCd6cp8tUil5FG8w6I2HwPxjd3QM1BK8vKrT9/8rFvmpJThZSBSz/iaZh4CJGsUqkqDe8ZCZICVAdy2uHAUzUg3s3D73wJmVu8uoxVZ8TX/jQ270yDa47JWebO5ChsySwYdz+A8imCLAr0Ffe8JP/kbzRtO+KWYgMqkOJvS3NOl3qo+3lwDKqDfgH4IhkmF0qt3QzA19t8dEdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wnlgiFJfv4qdn9WqcMN12KaRFXbVJYyNRztehNQsTkM=;
 b=PHENBecPeSSYEqz68QmXccxSjUMwLQX5lzuGw1UK8tzFO+sriz8BqtD4A0eBffkWOgX1pWO/0yyWIohMT8GnrcMhSP5ryxjEWBEbJcon0E8s38iNUTh4wYf2A+OJQiW9EdCUrDgZMaU1pw32hGZFTcc+fD/0J4eOPwIfi4FFYrNN7jxz8NI+r6DI77ZjzeLR+HLAHdu0ph4dFqSrTi8UQvQjihspBi4HWDKqxGBZiEpDdj7hVQ/yIQbFQiKk97B+Va4i6ueobgg9z+HFXGlKW4r4irTMTp0bKVZABrrJvvKSaaz7duGj+Nf1of15gsFHMxLpEgWFdgjs4Wso011/9A==
Received: from AM0PR10CA0031.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:150::11)
 by AM7PR10MB3720.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:13e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 15:56:46 +0000
Received: from AMS0EPF0000019E.eurprd05.prod.outlook.com
 (2603:10a6:20b:150:cafe::fb) by AM0PR10CA0031.outlook.office365.com
 (2603:10a6:20b:150::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.7 via Frontend Transport; Mon,
 12 Jan 2026 15:56:37 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS0EPF0000019E.mail.protection.outlook.com (10.167.16.250) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Mon, 12 Jan 2026 15:56:46 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 12 Jan
 2026 16:58:10 +0100
Received: from [10.48.86.212] (10.48.86.212) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 12 Jan
 2026 16:56:45 +0100
Message-ID: <36aadb47-7cea-47cc-8952-6eab14c925e8@foss.st.com>
Date: Mon, 12 Jan 2026 16:56:45 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/11] bus: add stm32 debug bus and coresight support for
 stm32mp1x platforms
To: Linus Walleij <linusw@kernel.org>,
        Jens Wiklander
	<jens.wiklander@linaro.org>
CC: Suzuki K Poulose <suzuki.poulose@arm.com>,
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
        =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?=
	<legoffic.clement@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        Antonio Borneo <antonio.borneo@foss.st.com>
References: <20260109-debug_bus-v1-0-8f2142b5a738@foss.st.com>
 <CAD++jLmk3RCf19yPvE0E9X3b+gy0XghQTbmMPfioBkSKkAaLpQ@mail.gmail.com>
Content-Language: en-US
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <CAD++jLmk3RCf19yPvE0E9X3b+gy0XghQTbmMPfioBkSKkAaLpQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF0000019E:EE_|AM7PR10MB3720:EE_
X-MS-Office365-Filtering-Correlation-Id: 38f43b12-0111-4e5f-44d1-08de51f33070
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|36860700013|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eUpQVXE3Y2dBS3JqRENVTWE1SFhJcFd0cm1HVlNXYU5WRDFmUFBFYWpWeEZq?=
 =?utf-8?B?RUNWdld5TXZ4M0ljVVdlMUxEU1M4Y2lCcUdLcG1FM09lMWtLcktaRXZ6cjRy?=
 =?utf-8?B?eVpSd2NlUVJzczlUQ09jQU05Y2Q3RkNLZ1hSUXo0Mi9PN25mdHNOM1M1ck11?=
 =?utf-8?B?d3lOZ25xTm43QVUrM0owbmN3c1Q5a1orY2FEQzJ2TklhcFk3THVEVHkvVXZm?=
 =?utf-8?B?bk5ablpTeVA1eUYwSENqQWdzL3RRaGVEamw4cnRWRmJ3eGI2NHpyYngxWUth?=
 =?utf-8?B?eDkyeHJRdUxLVk9vajFoWGY1dy95YytnT0NCSk53YkYxRnVQdkhadDRRZmQr?=
 =?utf-8?B?dW1BUm9sU0hQaFdNZkxkM0t5QWdocUxXSkFwTkxGdGJ6MFJicm55RGtJam55?=
 =?utf-8?B?M1pNVUttSllLSXJsdHR5V1ZWSGtWL2VONHY1Mzd1M3p6UEVpUFFOend2Nlky?=
 =?utf-8?B?bnQ4c0VINFNDajRaWDBIRXBCenJzRkFXOWZibXJEeFhnYjJxU0hDZ084L0VQ?=
 =?utf-8?B?QTUvMjA5QThyM0Z5dmlYcndXaFJGNGZteGVVZEN2dEJGOVFscjhFZjNUZCtM?=
 =?utf-8?B?RzFYTkRMTmlGdlZaOFBoSmFOMnA4c1FMMlgwMzdPODNyeUhtcytlN0czVXVn?=
 =?utf-8?B?dDAwWE9FbnBabVc2N0xabU9VbVZvTUQxNHZjZzZDaVJVOFdwKzJqaFZiR2Qw?=
 =?utf-8?B?bGdFRHlmV2tjUkVMOTAwSWlNUDVvUk9Ec0hzVm5PaGZVMk1tM3hlOVk1TTVu?=
 =?utf-8?B?Z25mQ2lPRGhMaXU5emEvZUhuR2k1emNpc1dRUy82TGI4cVJid3ZVUlRrbHky?=
 =?utf-8?B?SG5Va24zZ01EQ0hSaXp0QjhlV0JsS05iMkFPZitCSzk0cVJhNFJDQzRQYXNo?=
 =?utf-8?B?S1hUckRFNTcrSWtRSTZSaDZnbVBjR294V2tYZG1haFZjL0srR2RwL0YvM253?=
 =?utf-8?B?SnhoTnBSdlIrN0NkOEUxNGVIYThWOG9SYWRod0E5RlpSVEJjcGF5VEZaN0Fl?=
 =?utf-8?B?a1cyaVduazNaWHczTUp5NWU0WklIdnVFZk9nY3VQZkduZ3kvNytnY1I0am9i?=
 =?utf-8?B?TzIxYmE2RVBSeUtHSDN4M3RCV1hDbXYzT0hWNkp2OTlTNWVXWFNLYzh5dUxJ?=
 =?utf-8?B?UlJrUS9hWGpTRExoK1pLMUVBTUM0bWV0aXJqQ01IM25oejY4c0hZclpOVGNz?=
 =?utf-8?B?Qlg0ZHNFZTJCYkRacVZ0SzZHOW1zRjM2NWw5NXVGb3VlWGl4cFl5R1dPNTFT?=
 =?utf-8?B?cFVocDd0NitLNGM4NWYxNUtYbWl5dlhxTll3R3lBb0pQcE1EYnk2anZaR01P?=
 =?utf-8?B?Vi9ZZWtnMHFMRWVlWDYyb3QrYW12MzdHV3RiOWdwZDJISy9JaUl0cFVSQ1Vn?=
 =?utf-8?B?N3Q1NkhtNjJRYzd5aEtjekhzS0dvLzB5UnNYUE5WZVJxSDgwWHJWNXRzVVVD?=
 =?utf-8?B?Mkw0R2hwZHRrYXJLaWVVQWRYUTRFNHl3eUZGUkdxNE91ZDZXTS9Qd0Qyb3Fo?=
 =?utf-8?B?OFMwOGZ2QUVrUU1VYko5eHAyc1NFMjJLQ3FtUEhSRm5haFVIdys0N2J1UmNH?=
 =?utf-8?B?bzZaTDJCZnZIdk0vb1JtanBMYVdHZytTL1AyNkFaSzVLSzFSVVZvUk5GQklq?=
 =?utf-8?B?bjdqTFpQclJRLzVmYk9ORy9HRWFuNHk2eUdubVJ6Vy9KT2xHdWNlSWdtUlc2?=
 =?utf-8?B?ZWNpK3ZtMFl4ZHJKcjFzWnhFUFNROTZ5bVduWkx2RXNNNnJ4dDg1Zml1RTAx?=
 =?utf-8?B?WEJ0RnVQaS9QdTNQY0xDMFhKQkErdHlxZzNzS1krck5vZStFZzZqUmhSdUk1?=
 =?utf-8?B?MXlNSnBkSmpIMkd0TThYNWRZYjBTamZOYkF4K05zLzlmeGFPUENWa2xxUDNH?=
 =?utf-8?B?Q2thS0R6S1l1N2k2WDArdzk1cS9FNkYrVzE1RWNQMVljamM5aEZCUlUyeEtr?=
 =?utf-8?B?M1NwZ0dzWHhBck9jalVZNG15ZzgxR1h4RVFVQjJ4bENtMXJ5VllEeUdSWG1S?=
 =?utf-8?B?THIvVUdDZ2oyV3BieWU2b3Q3UnljajRjTkJpRHJESlU3ME1HcTJXRWlLWTZW?=
 =?utf-8?B?TFN4aXhrV0YxTW03RjUvbmszK2J6dlA4dnR1amxyZjkyQU91Q2lWWTdvUmhs?=
 =?utf-8?Q?L9gQ=3D?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(36860700013)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 15:56:46.3888
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 38f43b12-0111-4e5f-44d1-08de51f33070
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF0000019E.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3720
X-Proofpoint-GUID: NsIHp8Qwf3AhQcV5zGOSiy9IYN6QuQ6l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDEzMCBTYWx0ZWRfX3UMLFWXJxPsR
 RdG6vMbO3cpG85cbf8+jczVHXDwyP5y756b9TSjmZrDLy5c5YFm2lWaSsQJBTz4fizKQYjRVjBo
 EEoaF52z8+gIGvtesj0t2ohfc2qRY/q555cI4JIlu9IOJ8mJbKnSF1YLD/mHlfKiRzh2Koxi3j3
 OeWI2OmK8Tden2pt6++kbKoJaq20aI+ZlcxGmY2B9Jv9zXbWtMM0/+nzt8NmuLERYROLU8WeHJi
 eooY3W1sNvK+5yNeNvai5ZSxXKX/vBI5Y9lixTHiyiOr/YIq9lGenMqz/AOocRRlqscjc9l25Ge
 81Wq+ywZL5znfwC2CQ/sghNSuk4NJxEVf11HKh3piH1E/7rD2CCKNBP5szbl1UeiWCr1INBKSwt
 1olkuYQWjgfwiOhSkQatZ23kLLDkj4ve/sCqtO6PCA/Q30jFfRffyWj0bPydXXeReBxa4wGEau7
 6Weqm9PAcFgIFsa0MJA==
X-Proofpoint-ORIG-GUID: NsIHp8Qwf3AhQcV5zGOSiy9IYN6QuQ6l
X-Authority-Analysis: v=2.4 cv=BZTVE7t2 c=1 sm=1 tr=0 ts=696519c1 cx=c_pps
 a=XdU98ikZCVsoVlHqIUyARA==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=rg8MelPR9j8A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=8b9GpE9nAAAA:8
 a=F9KKovqh_Fmp6Uur3D8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_04,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0 bulkscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1011 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120130



On 1/10/26 00:10, Linus Walleij wrote:
> Hi Gatien,
> 
> thanks for your patch series!
> 
> On Fri, Jan 9, 2026 at 11:56 AM Gatien Chevallier
> <gatien.chevallier@foss.st.com> wrote:
> 
>> Stm32 SoCs embed debug peripherals such as Coresight. These peripherals
>> can monitor the activity of the cores. Because of that, they can be
>> used only if some features in the debug configuration are enabled.
>> Else, errors or firewall exceptions can be observed. Similarly to
>> the ETZPC(on stm32mp1x platforms) or the RIFSC(on stm32mp2x platforms),
>> debug-related peripherals access can be assessed at bus level to
>> prevent these issues from happening.
>>
>> The debug configuration can only be accessed by the secure world.
>> That means that a service must be implemented in the secure world for
>> the kernel to check the firewall configuration. On OpenSTLinux, it is
>> done through a Debug access PTA in OP-TEE [1].
>> To represent the debug peripherals present on a dedicated debug bus,
>> create a debug bus node in the device tree and the associated driver
>> that will interact with this PTA.
>>
>> [1]: https://github.com/OP-TEE/optee_os/pull/7673
>>
>> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> 
> I think Jens Wiklander wants to have a look at this partch
> series, so added him to the To:.
> 
> Yours,
> Linus Walleij

Hi Linus,

Sure, I'll keep the To. addition for V2, thank you.

Best regards,
Gatien


