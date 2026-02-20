Return-Path: <linux-gpio+bounces-31942-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6R/1H64lmGlHBwMAu9opvQ
	(envelope-from <linux-gpio+bounces-31942-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 10:13:18 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F6C1660AE
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 10:13:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4DDB0301DEE1
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 09:13:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A032531B100;
	Fri, 20 Feb 2026 09:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="CYci0iJI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010062.outbound.protection.outlook.com [52.101.84.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D02E2D7DC8;
	Fri, 20 Feb 2026 09:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771578791; cv=fail; b=XlY5LcOI614r4UAibj/Jmqm/IvHmgIJ/k9d0iGG7BQdtBs6qQtBSz4Mnb/m6NDNPSvl7EuJlhQcOIRO6Gxep+NzN4Rk8UlMbDl2mmExe06vaDTB4zhIz72QQ3lIW+6TVB0xAd+p3PoObhyCQpDZ1OMf2rQMdD4uKaeC4jnYqQ8Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771578791; c=relaxed/simple;
	bh=SeSq3ic8FGm+I1KR/MK3VDJ9ijmHFW87+elDwBmbonQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=M0y8MmfTOShAH9Wkvf+1m3GMfQp1BotBLpVJtiRISiDv28zB+Iak8RU4DB1Ht7m2JNrzkq+hKDc5/WVvuenu6XZRK2jfii448W148FUgjWM6gs+VQDQfZIj+kgptqD0bhTIVMHeamQtwylzC/rx81c55+AEKmZUEcLc2MQJbqVc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=CYci0iJI; arc=fail smtp.client-ip=52.101.84.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WAoBZRCWyuPQEXEKrpLowSoINWEPiCwUOjvnmYqlAmu1s0tdUVP9qPflWy5efYXVKgsrU4+1zyIH4eWhLccscoChGK4vPZUjE6k7IwVaPMuJ5ehFCqjuBmLCG9BvOLrQuIOZ2BDfBJvuA+ofnjZyW/kP9DSVZjJwxWbUukfLVdNRItuixS/edxs1ikEz4TbPSxvTJSFw0PkllJ/bohztsRfoSWkDVbWzj21GVtK2acg4iv2nrfdguR8FAUpI9KM4QuUW8qcapXnVHqyJiOKKTchKyImHA8OKIqAe05/ubsx6iKXmMGrhm05jEmbuA5b9cJoa+D/+SYxkr9iXjXyc1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=im4pw7qmv0I4UjgzzYdoMRJGJdBBb4sDlX0nXirF2rg=;
 b=vIeIBDobyyAoxFbYTOMyi2NhDPd5HuDfStxUdNXNdVYkeO920xs7xHEs7eEJfWMxsnWNfWVdStDoFZX154wt/cLmUSYUBjwwTjksRGF9PRceGxtlWvgJnxAuq5MVnhi4MptajkqSsyjXIuWWocyjw2CTHoBxTMAKI77v7jsj0nk2tLpcv1dQvAax9A5bsiGmyRB2ZH/TWaKORxhwoFo59YIFp/SwQUmba4N8CUP8ZHdxg7b8ZckLSeetIASd+be3PAQvdBlwo5YnkZhPTvneifyelmgtDqiV8xHgpJTfVbvQBAarxBdjQa/ugbH5n926LZtCg+M+VyRK+brDgwbnnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=nxp.com smtp.mailfrom=foss.st.com; dmarc=fail
 (p=none sp=none pct=100) action=none header.from=foss.st.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=im4pw7qmv0I4UjgzzYdoMRJGJdBBb4sDlX0nXirF2rg=;
 b=CYci0iJIkOwo+NVrbToOUnYOKoQoDX1n3UcLknz1f/4g3aPkyxX/ZScTRMBRl7N7pxYx3j/Hm+A0+khe+tcG9t9ThEjkGltuTdZ2zGH5CZq75v8uKxHq76ZR2Fw6bTwuFQe8AhfSrIQexLShzBLShW4QIPPpKeMnk869rJ6j/BXvAzVmGo9finD+GTazwBMHrM/FL+a03NleykW68TAY711RpIgwN8Z1G4z1ZCAHiC3QTTGBmHTnCbeGD2Z1cxxHBTCmsqoqOfU7pduduijIKrdNi/2KulHGIbfqx1+/ERSLzqt1K8viRRZmod/BRYWj0RvZZW/72OxpdgytcCsdbA==
Received: from CWLP265CA0281.GBRP265.PROD.OUTLOOK.COM (2603:10a6:401:5c::29)
 by VI1PR10MB3534.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:136::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Fri, 20 Feb
 2026 09:13:01 +0000
Received: from AMS1EPF00000090.eurprd05.prod.outlook.com
 (2603:10a6:401:5c:cafe::f4) by CWLP265CA0281.outlook.office365.com
 (2603:10a6:401:5c::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.16 via Frontend Transport; Fri,
 20 Feb 2026 09:13:01 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS1EPF00000090.mail.protection.outlook.com (10.167.242.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Fri, 20 Feb 2026 09:13:00 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 20 Feb
 2026 10:14:57 +0100
Received: from [10.48.87.127] (10.48.87.127) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 20 Feb
 2026 10:12:59 +0100
Message-ID: <7669d7dd-96a5-48a9-b051-875e9fbdad58@foss.st.com>
Date: Fri, 20 Feb 2026 10:12:58 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
To: Shenwei Wang <shenwei.wang@nxp.com>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
	"Mathieu Poirier" <mathieu.poirier@linaro.org>, Frank Li <frank.li@nxp.com>,
	"Sascha Hauer" <s.hauer@pengutronix.de>
CC: Shuah Khan <skhan@linuxfoundation.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan
	<peng.fan@nxp.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-remoteproc@vger.kernel.org"
	<linux-remoteproc@vger.kernel.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Andrew Lunn <andrew@lunn.ch>
References: <20260212213656.662437-1-shenwei.wang@nxp.com>
 <20260212213656.662437-4-shenwei.wang@nxp.com>
 <aae7c851-a93b-4d57-a118-43c6e68c4790@foss.st.com>
 <PAXPR04MB918582EE33F7BD5C26259BB2896BA@PAXPR04MB9185.eurprd04.prod.outlook.com>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
In-Reply-To: <PAXPR04MB918582EE33F7BD5C26259BB2896BA@PAXPR04MB9185.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000090:EE_|VI1PR10MB3534:EE_
X-MS-Office365-Filtering-Correlation-Id: 82424236-9344-4198-c8c3-08de70603f02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|36860700013|82310400026|1800799024|7053199007|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q2pCT01tZER4TU1VVXV4b0ROTzBpZTBwZHBFcEd0M1BRUW83N1hZLzNDNG1y?=
 =?utf-8?B?ZVkweXV3LzNlTVhoWUJxMTZNRll3YmlhalJuc25qU1pSd2lXaWVNMzdnZnpN?=
 =?utf-8?B?YnV0ZHNpdTRDN1BWMDQ5cy9oNU1mK09ZUFhQanM5TVlmWnlaQjFTamJ6a2l2?=
 =?utf-8?B?SDhUdlh4T2dUZnlHOXd1N0V2MUtubm92azNZQWJWSkthVUl3OU85cHFCL3JV?=
 =?utf-8?B?dUN6ZWxrS2tuODM2OE9VRklNL09DVDhlOGViU2lSWmtQbFo4b0xSbGcySXps?=
 =?utf-8?B?NnVSSDh0TlMvVlJMSDBvWTQ2Zmp3MUpoQUJFRjRYbUVZWi9WVDJBbW5icTRp?=
 =?utf-8?B?NmVpM3Yra1pkZUwvWnNGTlk2aVlSQ2xYcXRuMlVndkV6U3NtWmE5ZHYzQ09F?=
 =?utf-8?B?ZXV3ZEtIeHhaM3hKVXRobWdSN001VWk4QUpmL0h3MU40eTEvbENtT3NaQklJ?=
 =?utf-8?B?STZNNlZWdXVtMFVQeDcrVlQ2MndBZ0IvN0lVMThRU1ZXcmVHQm5Eb0Y1TmVG?=
 =?utf-8?B?KzJZTGtmK0pSbjR2VE12U2FXdys0Ylo4a2xoM3FaWDhWSVpVZGJkZzEzN0RM?=
 =?utf-8?B?QUlzVGFuOWlaQ0RRL2lEOGg1SzBTd3czaVVjMlZlQzdBSVp6bXd0ZWRQaTlY?=
 =?utf-8?B?MUlENzA4ZFZhTERTam01dWVkUTRsaVZIQ2V2eXhqdjFGRlZ1MkhLRXIzcTEx?=
 =?utf-8?B?ZDIySmlIc3o2dzFPZlFWRTduOHBpdzBnT0UrVDdIT1hDVmVyQTFNV2tzN1o2?=
 =?utf-8?B?ZXlTQkhJNElZS2UwUDFkSjhYN2p3ekpLN1djdG1NeWdHZVhFcjFEWTVuQWdu?=
 =?utf-8?B?Nkx6eldseE9KL2QvZlp3UVFGVXVtV2RmL21DVThRanV6bkVYdkJpU2o4UUlB?=
 =?utf-8?B?RDdTVVhRR2hzVUcvbnB2REdHYXA3WVJzT05ENGQ0UVZyZUl4azZjWm9ZU3d1?=
 =?utf-8?B?N094OHRjT0NWbGtjdXo5VHFWWXozWURPNlE1NUZTQ2pjS2IzOUtBdUZwVU9r?=
 =?utf-8?B?eTJoS1RIRjd0TjdmNHNRcG4ydnRkUm1mMVFEYW1qQm5jeFBJaDNXbVVyeGY1?=
 =?utf-8?B?Vi9EcWtRM2l2QXk3NTF5UFBucHZJRGZFY0ZMcVdpOUkxQnVhV2VRMjMvSW41?=
 =?utf-8?B?TDl0UTJZRjF6M3BabUpHUnFOZ0VFL0d6NGFRaWZBdG10bjgrYmZhNjF4QUJV?=
 =?utf-8?B?d3JYUUtlRkZBRXk1aWxUMzMrZFJnTE45L2dLcHpTU2M5ZlBscHhIdEJmVmhs?=
 =?utf-8?B?ZE5nNVM4S0x3QmYrd1ExRXU5U25hYVM4OXNKRVY5c295Y01TMkRkN1VyaE1k?=
 =?utf-8?B?VXpoalNwRUZQL2hVV2FyaGl3dHlDaGNVcE9hOWdKSVJCQVVDSXpGdVI1Y2Qw?=
 =?utf-8?B?Y1NMNEh4dXlFVVNKWFJIUm50UVJzTXE1U0poZHVyMjZ2Uit3ZEFUeWRZcUlk?=
 =?utf-8?B?N282ekdOVFlUWGd0QVhGeDAzdzdxcXBBYXY3ZGlVYkhZTi8yTlQvaEprQTRD?=
 =?utf-8?B?N1I5dDBXOExOTmdNcUtMSW4zSVVzd3FPcTNzQVVCOStUUlNXaXh2NDY5ZnBq?=
 =?utf-8?B?a1BWY3JKQ044REhoTm5qVFhjeUxERE8xVzFxNU5rZUM0NmVFRHN6SmRxaVh5?=
 =?utf-8?B?cCtLWVlhNHFLR3pLM3V2MnB4akZrdm5MdmpmWTI5ZHBtKzE3eVYxd211NlpZ?=
 =?utf-8?B?K0N2Z21SSUFKTkl2QTcrdkZncGRodjFDMUFJTXdnUzUySzhjRFdVbERheG43?=
 =?utf-8?B?QmJqYS9UZ0RrVmhSNVpjMSt2MTVCV0tCZVVVd2xZVXU5eDJreXFXdVFmd3k5?=
 =?utf-8?B?Qy8zSWNyVlM5cm12QWNjY1FUWFgxWWV4Y1hXU0ZzZGRKaEZ1ekVZSUJkWStz?=
 =?utf-8?B?V1Q5eUk3dmpuaUJLR3VLZGVOdllMTVYyZnJ6SVl5MDVJdEsxbGRKeitVMzZ1?=
 =?utf-8?B?SStiWUJTZ01ZYkJMRjJUNEd5NDcwcEFwb2ZpK2paK05GYzZ0M0svZ0JOS21P?=
 =?utf-8?B?ZFQ5eFRreEpPV3o2NU11K2pYNjRYZE5RK2RIbzh2WG1XMWxhY3o4QzBkeTlI?=
 =?utf-8?B?L204ZTBrNHdYa2U0Ty8xeHpDWXNjUlJ6QVJnZEZuV1AvSUVtMHNnbTJWVUFn?=
 =?utf-8?B?NzNNR1NvNGJZSFFqR2o1eEhnaGx2R1pqdkVoVkpQeHk3UGVRdk1YMWNvM04w?=
 =?utf-8?B?UjNObUxCeVkzRlBkYm5KZm5SWm1NZ3p6RTRzWVR2Wkc3akJ6TGNrS0tZemZm?=
 =?utf-8?Q?8Y9nDMumtYjD9QWEDclfnxz3pDhqOwzfubWCyG6MUQ=3D?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700013)(82310400026)(1800799024)(7053199007)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	BP7rXjwvaJdExRgFQGN/1giFg+RW/kma7s/bQmSsKyA1uB1XssLMdvH9bG6yC5u9pe7+/di0jU0m6y07uJFRnujYebjeituBKZKpY6dd5023XWOFKHuVJ2MzHUwh7jU8k9L23PNxnHcQ2o7yQ6FwOMqAOMoC1JCV3Sj5UqU12YwILMQuL1P+oQXzFgRiMjL0Ra7DeH3vv+1HxOs+mLnuNZ4PINzMuzTvt2R5Yv2PeoIDVTTmZAmAkrbYrroPHQWA23NKbBJd+MOTH0fDFAkXLK320Uo6DO0vSHT2IulgY0xaS6PjpkIXxq/w6rlhzU5Hohz6u6AeMyRArU1nMgzRL8URZ/w2byk8D35ZBCHzPbBVA+1Q/aSb9THSkLRvt0IZ68dZKJLGAhCHCvcRwdS/+MByPESqf3RsnE36uvA/GXr5u/CqrMWEsCPW6eBULXOW
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 09:13:00.8673
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 82424236-9344-4198-c8c3-08de70603f02
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000090.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3534
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[foss.st.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[foss.st.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31942-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,pengutronix.de,gmail.com,nxp.com,lists.linux.dev,lists.infradead.org,bgdev.pl,lunn.ch];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnaud.pouliquen@foss.st.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 79F6C1660AE
X-Rspamd-Action: no action



On 2/19/26 21:04, Shenwei Wang wrote:
> 
> 
>> -----Original Message-----
>> From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
>> Sent: Thursday, February 19, 2026 3:21 AM
>> To: Shenwei Wang <shenwei.wang@nxp.com>; Linus Walleij
>> <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.org>; Jonathan Corbet
>> <corbet@lwn.net>; Rob Herring <robh@kernel.org>; Krzysztof Kozlowski
>> <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Bjorn Andersson
>> <andersson@kernel.org>; Mathieu Poirier <mathieu.poirier@linaro.org>; Frank Li
>> <frank.li@nxp.com>; Sascha Hauer <s.hauer@pengutronix.de>
>> Cc: Shuah Khan <skhan@linuxfoundation.org>; linux-gpio@vger.kernel.org; linux-
>> doc@vger.kernel.org; linux-kernel@vger.kernel.org; Pengutronix Kernel Team
>> <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>; Peng Fan
>> <peng.fan@nxp.com>; devicetree@vger.kernel.org; linux-
>> remoteproc@vger.kernel.org; imx@lists.linux.dev; linux-arm-
>> kernel@lists.infradead.org; dl-linux-imx <linux-imx@nxp.com>; Bartosz
>> Golaszewski <brgl@bgdev.pl>; Andrew Lunn <andrew@lunn.ch>
>> Subject: [EXT] Re: [PATCH v8 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
>>
>> Hello Shenwei,
>>
>> This versiob seems much more generic, thanks!
>>
>> On 2/12/26 22:36, Shenwei Wang wrote:
>>> On an AMP platform, the system may include two processors:
>>>        - An MCU running an RTOS
>>>        - An MPU running Linux
>>>
>>> These processors communicate via the RPMSG protocol.
>>> The driver implements the standard GPIO interface, allowing the Linux
>>> side to control GPIO controllers which reside in the remote processor
>>> via RPMSG protocol.
>>>
>>> Cc: Bartosz Golaszewski <brgl@bgdev.pl>
>>> Cc: Andrew Lunn <andrew@lunn.ch>
>>> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
>>> ---
>>>    drivers/gpio/Kconfig      |  17 ++
>>>    drivers/gpio/Makefile     |   1 +
>>>    drivers/gpio/gpio-rpmsg.c | 588
>> ++++++++++++++++++++++++++++++++++++++
>>>    3 files changed, 606 insertions(+)
>>>    create mode 100644 drivers/gpio/gpio-rpmsg.c
>>>
>>> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig index
>>> b45fb799e36c..3179a54f0634 100644
>>> --- a/drivers/gpio/Kconfig
>>> +++ b/drivers/gpio/Kconfig
>>> @@ -1892,6 +1892,23 @@ config GPIO_SODAVILLE
>>>
>>>    endmenu
>>>
>>> +menu "RPMSG GPIO drivers"
>>> +     depends on RPMSG
>>> +
>>> +config GPIO_RPMSG
>>> +     tristate "Generic RPMSG GPIO support"
>>> +     depends on REMOTEPROC
>>> +     select GPIOLIB_IRQCHIP
>>> +     default REMOTEPROC
>>> +     help
>>> +       Say yes here to support the generic GPIO functions over the RPMSG
>>> +       bus. Currently supported devices: i.MX7ULP, i.MX8ULP, i.MX8x, and
>>> +       i.MX9x.
>>> +
>>> +       If unsure, say N.
>>> +
>>> +endmenu
>>> +
>>>    menu "SPI GPIO expanders"
>>>        depends on SPI_MASTER
>>>
>>> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile index
>>> c05f7d795c43..501aba56ad68 100644
>>> --- a/drivers/gpio/Makefile
>>> +++ b/drivers/gpio/Makefile
>>> @@ -158,6 +158,7 @@ obj-$(CONFIG_GPIO_RDC321X)                += gpio-
>> rdc321x.o
>>>    obj-$(CONFIG_GPIO_REALTEK_OTTO)             += gpio-realtek-otto.o
>>>    obj-$(CONFIG_GPIO_REG)                      += gpio-reg.o
>>>    obj-$(CONFIG_GPIO_ROCKCHIP) += gpio-rockchip.o
>>> +obj-$(CONFIG_GPIO_RPMSG)             += gpio-rpmsg.o
>>>    obj-$(CONFIG_GPIO_RTD)                      += gpio-rtd.o
>>>    obj-$(CONFIG_ARCH_SA1100)           += gpio-sa1100.o
>>>    obj-$(CONFIG_GPIO_SAMA5D2_PIOBU)    += gpio-sama5d2-piobu.o
>>> diff --git a/drivers/gpio/gpio-rpmsg.c b/drivers/gpio/gpio-rpmsg.c new
>>> file mode 100644 index 000000000000..163f51fd45b5
>>> --- /dev/null
>>> +++ b/drivers/gpio/gpio-rpmsg.c
>>> @@ -0,0 +1,588 @@
>>> +// SPDX-License-Identifier: GPL-2.0-only
>>> +/*
>>> + * Copyright 2026 NXP
>>> + *
>>> + * The driver exports a standard gpiochip interface to control
>>> + * the GPIO controllers via RPMSG on a remote processor.
>>> + */
>>> +#include <linux/completion.h>
>>> +#include <linux/device.h>
>>> +#include <linux/err.h>
>>> +#include <linux/gpio/driver.h>
>>> +#include <linux/init.h>
>>> +#include <linux/irqdomain.h>
>>> +#include <linux/mod_devicetable.h>
>>> +#include <linux/module.h>
>>> +#include <linux/mutex.h>
>>> +#include <linux/of.h>
>>> +#include <linux/of_device.h>
>>> +#include <linux/of_platform.h>
>>> +#include <linux/platform_device.h>
>>> +#include <linux/remoteproc.h>
>>> +#include <linux/rpmsg.h>
>>> +
>>> +#define RPMSG_GPIO_ID                5
>>> +#define RPMSG_VENDOR         1
>>> +#define RPMSG_VERSION                0
>>> +
>>> +#define GPIOS_PER_PORT_DEFAULT       32
>>> +#define RPMSG_TIMEOUT                1000
>>> +
>>> +/* GPIO RPMSG header type */
>>> +#define GPIO_RPMSG_SETUP     0
>>> +#define GPIO_RPMSG_REPLY     1
>>> +#define GPIO_RPMSG_NOTIFY    2
>>> +
>>> +/* GPIO Interrupt trigger type */
>>> +#define GPIO_RPMSG_TRI_IGNORE                0
>>> +#define GPIO_RPMSG_TRI_RISING                1
>>> +#define GPIO_RPMSG_TRI_FALLING               2
>>> +#define GPIO_RPMSG_TRI_BOTH_EDGE     3
>>> +#define GPIO_RPMSG_TRI_LOW_LEVEL     4
>>> +#define GPIO_RPMSG_TRI_HIGH_LEVEL    5
>>> +
>>> +/* GPIO RPMSG commands */
>>> +#define GPIO_RPMSG_INPUT_INIT                0
>>> +#define GPIO_RPMSG_OUTPUT_INIT               1
>>> +#define GPIO_RPMSG_INPUT_GET         2
>>> +#define GPIO_RPMSG_DIRECTION_GET     3
>>> +
>>> +#define MAX_PORT_PER_CHANNEL    10
>>> +
>>> +/*
>>> + * @rproc_name: the name of the remote proc.
>>> + * @channel_devices: an array of the devices related to the rpdev.
>>> + */
>>> +struct rpdev_drvdata {
>>> +     const char *rproc_name;
>>> +     void *channel_devices[MAX_PORT_PER_CHANNEL];
>>> +};
>>> +
>>> +struct gpio_rpmsg_head {
>>
>> Sometime the prefix is gpio_rpmsg, sometime rpmsg_gpio or just gpio, could you
>> use "rpmsg_gpio" prefix in the whole driver?
>>
> 
> All the types use prefix gpio_rpmsg. All the functions use rpmsg_gpio.
> 
>>> +     u8 id;          /* Message ID Code */
>>> +     u8 vendor;      /* Vendor ID number */
>>
>> Does this fields above are mandatory, seems that it is just some constant values
>> that are useless.
>>
>>> +     u8 version;     /* Vendor-specific version number */
>>
>> Why it is vendor specific? the version should represent the rpmsg-tty protocol
>> version.
>>
>>> +     u8 type;        /* Message type */
>>> +     u8 cmd;         /* Command code */
>>> +     u8 reserved[5];
>>
>> What is the purpose of this reserved field?
>>
>>> +} __packed;
>>> +
>>> +struct gpio_rpmsg_packet {
>>> +     struct gpio_rpmsg_head header;
>>> +     u8 pin_idx;
>>> +     u8 port_idx;
>>> +     union {
>>> +             u8 event;
>>> +             u8 retcode;
>>> +             u8 value;
>>> +     } out;
>>> +     union {
>>> +             u8 wakeup;
>>> +             u8 value;
>>> +     } in;
>>> +} __packed __aligned(8);
>>
>> Any reason to use __packed and alignement here?
>> This structure will be copied in a vring buffer right?
>>
> 
> Using __packed together with an explicit alignment is a common pattern for defining
> communication packets. The goal is to ensure a stable and predictable layout across
> different architectures and compilers. Even though this structure is copied into a vring
> buffer, enforcing the layout avoids potential ABI or padding differences that could lead
> to compatibility issues when the data is parsed on the other side.
> 

Please could you give a concrete example for this rpmsg, I can not see a 
situation where adding padding at the end of the RPMsg is usefull?


>>> +
>>> +struct gpio_rpmsg_pin {
>>> +     u8 irq_shutdown;
>>> +     u8 irq_unmask;
>>> +     u8 irq_mask;
>>> +     u32 irq_wake_enable;
>>> +     u32 irq_type;
>>> +     struct gpio_rpmsg_packet msg;
>>> +};
>>> +
>>> +struct gpio_rpmsg_info {
>>> +     struct rpmsg_device *rpdev;
>>> +     struct gpio_rpmsg_packet *reply_msg;
>>> +     struct completion cmd_complete;
>>> +     struct mutex lock;
>>> +     void **port_store;
>>> +};
>>> +
>>> +struct rpmsg_gpio_port {
>>> +     struct gpio_chip gc;
>>> +     struct gpio_rpmsg_pin gpio_pins[GPIOS_PER_PORT_DEFAULT];
>>> +     struct gpio_rpmsg_info info;
>>> +     u32 ngpios;
>>> +     u32 idx;
>>> +};
>>> +
>>> +static int gpio_send_message(struct rpmsg_gpio_port *port,
>>
>> s/gpio_send_message/rpmsg_gpio_send_message
>>
>>> +                          struct gpio_rpmsg_packet *msg,
>>> +                          bool sync)
>>> +{
>>> +     struct gpio_rpmsg_info *info = &port->info;
>>> +     int err;
>>> +
>>> +     reinit_completion(&info->cmd_complete);
>>> +     err = rpmsg_send(info->rpdev->ept, msg, sizeof(struct gpio_rpmsg_packet));
>>> +     if (err) {
>>> +             dev_err(&info->rpdev->dev, "rpmsg_send failed: %d\n", err);
>>> +             return err;
>>> +     }
>>> +
>>> +     if (sync) {
>>> +             err = wait_for_completion_timeout(&info->cmd_complete,
>>> +                                               msecs_to_jiffies(RPMSG_TIMEOUT));
>>> +             if (err == 0) {
>>> +                     dev_err(&info->rpdev->dev, "rpmsg_send timeout!\n");
>>> +                     return -ETIMEDOUT;
>>
>> strange condition you return an error if err == 0, for redability use 'ret' variable or
>> simply:
>>
> 
> Agree. Changing to "ret" is clearer here.
> 
>>                  if(!wait_for_completion_timeout(&info->cmd_complete,
>>                                    msecs_to_jiffies(RPMSG_TIMEOUT)) {
>>                          dev_err(&info->rpdev->dev, "rpmsg_send timeout!\n");
>>                          return -ETIMEDOUT;
>>                  }
>>
>>> +
>>> +             if (info->reply_msg->out.retcode != 0) {
>>> +                     dev_err(&info->rpdev->dev, "remote core replies an error: %d!\n",
>>> +                             info->reply_msg->out.retcode);
>>> +                     return -EINVAL;
>>> +             }
>>> +
>>> +             /* copy the reply message */
>>> +             memcpy(&port->gpio_pins[info->reply_msg->pin_idx].msg,
>>> +                    info->reply_msg, sizeof(*info->reply_msg));
>>> +     }
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> +static struct gpio_rpmsg_packet *gpio_setup_msg_common(struct
>> rpmsg_gpio_port *port,
>>> +                                                    unsigned int offset,
>>> +                                                    u8 cmd) {
>>> +     struct gpio_rpmsg_packet *msg = &port->gpio_pins[offset].msg;
>>> +
>>> +     memset(msg, 0, sizeof(struct gpio_rpmsg_packet));
>>> +     msg->header.id = RPMSG_GPIO_ID;
>>> +     msg->header.vendor = RPMSG_VENDOR;
>>> +     msg->header.version = RPMSG_VERSION;
>>> +     msg->header.type = GPIO_RPMSG_SETUP;
>>> +     msg->header.cmd = cmd;
>>> +     msg->pin_idx = offset;
>>> +     msg->port_idx = port->idx;
>>> +
>>> +     return msg;
>>> +}
>>> +
>>> +static int rpmsg_gpio_get(struct gpio_chip *gc, unsigned int gpio) {
>>> +     struct rpmsg_gpio_port *port = gpiochip_get_data(gc);
>>> +     struct gpio_rpmsg_packet *msg;
>>> +     int ret;
>>> +
>>> +     guard(mutex)(&port->info.lock);
>>> +
>>> +     msg = gpio_setup_msg_common(port, gpio, GPIO_RPMSG_INPUT_GET);
>>> +
>>> +     ret = gpio_send_message(port, msg, true);
>>> +     if (!ret)
>>> +             ret = !!port->gpio_pins[gpio].msg.in.value;
>>> +
>>> +     return ret;
>>> +}
>>> +
>>> +static int rpmsg_gpio_get_direction(struct gpio_chip *gc, unsigned
>>> +int gpio) {
>>> +     struct rpmsg_gpio_port *port = gpiochip_get_data(gc);
>>> +     struct gpio_rpmsg_packet *msg;
>>> +     int ret;
>>> +
>>> +     guard(mutex)(&port->info.lock);
>>> +
>>> +     msg = gpio_setup_msg_common(port, gpio,
>>> + GPIO_RPMSG_DIRECTION_GET);
>>> +
>>> +     ret = gpio_send_message(port, msg, true);
>>> +     if (!ret)
>>> +             ret = !!port->gpio_pins[gpio].msg.in.value;
>>> +
>>> +     return ret;
>>> +}
>>> +
>>> +static int rpmsg_gpio_direction_input(struct gpio_chip *gc, unsigned
>>> +int gpio) {
>>> +     struct rpmsg_gpio_port *port = gpiochip_get_data(gc);
>>> +     struct gpio_rpmsg_packet *msg;
>>> +
>>> +     guard(mutex)(&port->info.lock);
>>> +
>>> +     msg = gpio_setup_msg_common(port, gpio, GPIO_RPMSG_INPUT_INIT);
>>> +
>>> +     return gpio_send_message(port, msg, true); }
>>> +
>>> +static int rpmsg_gpio_set(struct gpio_chip *gc, unsigned int gpio,
>>> +int val) {
>>> +     struct rpmsg_gpio_port *port = gpiochip_get_data(gc);
>>> +     struct gpio_rpmsg_packet *msg;
>>> +
>>> +     guard(mutex)(&port->info.lock);
>>> +
>>> +     msg = gpio_setup_msg_common(port, gpio, GPIO_RPMSG_OUTPUT_INIT);
>>> +     msg->out.value = val;
>>> +
>>> +     return gpio_send_message(port, msg, true); }
>>> +
>>> +static int rpmsg_gpio_direction_output(struct gpio_chip *gc,
>>> +                                    unsigned int gpio,
>>> +                                    int val) {
>>> +     return rpmsg_gpio_set(gc, gpio, val); }
>>> +
>>> +static int gpio_rpmsg_irq_set_type(struct irq_data *d, u32 type) {
>>> +     struct rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
>>> +     u32 gpio_idx = d->hwirq;
>>> +     int edge = 0;
>>> +     int ret = 0;
>>> +
>>> +     switch (type) {
>>> +     case IRQ_TYPE_EDGE_RISING:
>>> +             edge = GPIO_RPMSG_TRI_RISING;
>>> +             irq_set_handler_locked(d, handle_simple_irq);
>>> +             break;
>>> +     case IRQ_TYPE_EDGE_FALLING:
>>> +             edge = GPIO_RPMSG_TRI_FALLING;
>>> +             irq_set_handler_locked(d, handle_simple_irq);
>>> +             break;
>>> +     case IRQ_TYPE_EDGE_BOTH:
>>> +             edge = GPIO_RPMSG_TRI_BOTH_EDGE;
>>> +             irq_set_handler_locked(d, handle_simple_irq);
>>> +             break;
>>> +     case IRQ_TYPE_LEVEL_LOW:
>>> +             edge = GPIO_RPMSG_TRI_LOW_LEVEL;
>>> +             irq_set_handler_locked(d, handle_level_irq);
>>> +             break;
>>> +     case IRQ_TYPE_LEVEL_HIGH:
>>> +             edge = GPIO_RPMSG_TRI_HIGH_LEVEL;
>>> +             irq_set_handler_locked(d, handle_level_irq);
>>> +             break;
>>> +     default:
>>> +             ret = -EINVAL;
>>> +             irq_set_handler_locked(d, handle_bad_irq);
>>> +             break;
>>> +     }
>>> +
>>> +     port->gpio_pins[gpio_idx].irq_type = edge;
>>> +
>>> +     return ret;
>>> +}
>>> +
>>> +static int gpio_rpmsg_irq_set_wake(struct irq_data *d, u32 enable) {
>>> +     struct rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
>>> +     u32 gpio_idx = d->hwirq;
>>> +
>>> +     port->gpio_pins[gpio_idx].irq_wake_enable = enable;
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> +/*
>>> + * This unmask/mask function is invoked in two situations:
>>> + *   - when an interrupt is being set up, and
>>> + *   - after an interrupt has occurred.
>>> + *
>>> + * The GPIO driver does not access hardware registers directly.
>>> + * Instead, it caches all relevant information locally, and then
>>> +sends
>>> + * the accumulated state to the remote system at this stage.
>>> + */
>>> +static void gpio_rpmsg_unmask_irq(struct irq_data *d) {
>>> +     struct rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
>>> +     u32 gpio_idx = d->hwirq;
>>> +
>>> +     port->gpio_pins[gpio_idx].irq_unmask = 1; }
>>> +
>>> +static void gpio_rpmsg_mask_irq(struct irq_data *d) {
>>> +     struct rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
>>> +     u32 gpio_idx = d->hwirq;
>>> +
>>> +     /*
>>> +      * When an interrupt occurs, the remote system masks the interrupt
>>> +      * and then sends a notification to Linux. After Linux processes
>>> +      * that notification, it sends an RPMsg command back to the remote
>>> +      * system to unmask the interrupt again.
>>> +      */
>>> +     port->gpio_pins[gpio_idx].irq_mask = 1; }
>>> +
>>> +static void gpio_rpmsg_irq_shutdown(struct irq_data *d) {
>>> +     struct rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
>>> +     u32 gpio_idx = d->hwirq;
>>> +
>>> +     port->gpio_pins[gpio_idx].irq_shutdown = 1; }
>>> +
>>> +static void gpio_rpmsg_irq_bus_lock(struct irq_data *d) {
>>> +     struct rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
>>> +
>>> +     mutex_lock(&port->info.lock);
>>> +}
>>> +
>>> +static void gpio_rpmsg_irq_bus_sync_unlock(struct irq_data *d) {
>>> +     struct rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
>>> +     struct gpio_rpmsg_packet *msg = NULL;
>>> +     u32 gpio_idx = d->hwirq;
>>> +
>>> +     /*
>>> +      * For mask irq, do nothing here.
>>> +      * The remote system will mask interrupt after an interrupt occurs,
>>> +      * and then send a notify to Linux system.
>>> +      * After Linux system dealt with the notify, it will send an rpmsg to
>>> +      * the remote system to unmask this interrupt again.
>>> +      */
>>> +     if (port->gpio_pins[gpio_idx].irq_mask && !port-
>>> gpio_pins[gpio_idx].irq_unmask) {
>>> +             port->gpio_pins[gpio_idx].irq_mask = 0;
>>> +             mutex_unlock(&port->info.lock);
>>> +             return;
>>> +     }
>>> +
>>> +     msg = gpio_setup_msg_common(port, gpio_idx,
>>> + GPIO_RPMSG_INPUT_INIT);
>>> +
>>> +     if (port->gpio_pins[gpio_idx].irq_shutdown) {
>>> +             msg->out.event = GPIO_RPMSG_TRI_IGNORE;
>>> +             msg->in.wakeup = 0;
>>> +             port->gpio_pins[gpio_idx].irq_shutdown = 0;
>>> +     } else {
>>> +             /* if not set irq type, then use low level as trigger type */
>>> +             msg->out.event = port->gpio_pins[gpio_idx].irq_type;
>>> +             if (!msg->out.event)
>>> +                     msg->out.event = GPIO_RPMSG_TRI_LOW_LEVEL;
>>> +             if (port->gpio_pins[gpio_idx].irq_unmask) {
>>> +                     msg->in.wakeup = 0;
>>> +                     port->gpio_pins[gpio_idx].irq_unmask = 0;
>>> +             } else /* irq set wake */
>>> +                     msg->in.wakeup = port->gpio_pins[gpio_idx].irq_wake_enable;
>>> +     }
>>> +
>>> +     gpio_send_message(port, msg, false);
>>> +     mutex_unlock(&port->info.lock);
>>> +}
>>> +
>>> +static const struct irq_chip gpio_rpmsg_irq_chip = {
>>> +     .irq_mask = gpio_rpmsg_mask_irq,
>>> +     .irq_unmask = gpio_rpmsg_unmask_irq,
>>> +     .irq_set_wake = gpio_rpmsg_irq_set_wake,
>>> +     .irq_set_type = gpio_rpmsg_irq_set_type,
>>> +     .irq_shutdown = gpio_rpmsg_irq_shutdown,
>>> +     .irq_bus_lock = gpio_rpmsg_irq_bus_lock,
>>> +     .irq_bus_sync_unlock = gpio_rpmsg_irq_bus_sync_unlock,
>>> +     .flags = IRQCHIP_IMMUTABLE,
>>> +};
>>> +
>>> +static void rpmsg_gpio_remove_action(void *data) {
>>> +     struct rpmsg_gpio_port *port = data;
>>> +
>>> +     port->info.port_store[port->idx] = NULL; }
>>> +
>>> +static int rpmsg_gpiochip_register(struct rpmsg_device *rpdev, struct
>>> +device_node *np) {
>>> +     struct rpdev_drvdata *drvdata = dev_get_drvdata(&rpdev->dev);
>>> +     struct rpmsg_gpio_port *port;
>>> +     struct gpio_irq_chip *girq;
>>> +     struct gpio_chip *gc;
>>> +     int ret;
>>> +
>>> +     port = devm_kzalloc(&rpdev->dev, sizeof(*port), GFP_KERNEL);
>>> +     if (!port)
>>> +             return -ENOMEM;
>>> +
>>> +     ret = of_property_read_u32(np, "reg", &port->idx);
>>> +     if (ret)
>>> +             return ret;
>>> +
>>> +     if (port->idx >= MAX_PORT_PER_CHANNEL)
>>> +             return -EINVAL;
>>> +
>>> +     ret = devm_mutex_init(&rpdev->dev, &port->info.lock);
>>> +     if (ret)
>>> +             return ret;
>>> +
>>> +     ret = of_property_read_u32(np, "ngpios", &port->ngpios);
>>> +     if (ret)
>>> +             port->ngpios = GPIOS_PER_PORT_DEFAULT;
>>> +
>>> +     init_completion(&port->info.cmd_complete);
>>> +     port->info.reply_msg = devm_kzalloc(&rpdev->dev,
>>> +                                         sizeof(struct gpio_rpmsg_packet),
>>> +                                         GFP_KERNEL);
>>> +     port->info.port_store = drvdata->channel_devices;
>>> +     port->info.port_store[port->idx] = port;
>>> +     port->info.rpdev = rpdev;
>>> +
>>> +     gc = &port->gc;
>>> +     gc->owner = THIS_MODULE;
>>> +     gc->parent = &rpdev->dev;
>>> +     gc->fwnode = of_fwnode_handle(np);
>>> +     gc->ngpio = port->ngpios;
>>> +     gc->base = -1;
>>> +     gc->label = devm_kasprintf(&rpdev->dev, GFP_KERNEL, "%s-gpio%d",
>>> +                                drvdata->rproc_name, port->idx);
>>> +
>>> +     gc->direction_input = rpmsg_gpio_direction_input;
>>> +     gc->direction_output = rpmsg_gpio_direction_output;
>>> +     gc->get_direction = rpmsg_gpio_get_direction;
>>> +     gc->get = rpmsg_gpio_get;
>>> +     gc->set = rpmsg_gpio_set;
>>> +
>>> +     girq = &gc->irq;
>>> +     gpio_irq_chip_set_chip(girq, &gpio_rpmsg_irq_chip);
>>> +     girq->parent_handler = NULL;
>>> +     girq->num_parents = 0;
>>> +     girq->parents = NULL;
>>> +     girq->chip->name = devm_kasprintf(&rpdev->dev, GFP_KERNEL, "%s-
>> gpio%d",
>>> +                                       drvdata->rproc_name,
>>> + port->idx);
>>> +
>>> +     ret = devm_add_action_or_reset(&rpdev->dev,
>> rpmsg_gpio_remove_action, port);
>>> +     if (ret)
>>> +             return ret;
>>> +
>>> +     return devm_gpiochip_add_data(&rpdev->dev, gc, port); }
>>> +
>>> +static const char *rpmsg_get_rproc_node_name(struct rpmsg_device
>>> +*rpdev) {
>>> +     const char *name = NULL;
>>> +     struct device_node *np;
>>> +     struct rproc *rproc;
>>> +
>>> +     rproc = rproc_get_by_child(&rpdev->dev);
>>> +
>>> +     if (!rproc)
>>> +             return NULL;
>>> +
>>> +     np = of_node_get(rproc->dev.of_node);
>>> +     if (!np && rproc->dev.parent)
>>> +             np = of_node_get(rproc->dev.parent->of_node);
>>> +
>>> +     if (np) {
>>> +             name = devm_kstrdup(&rpdev->dev, np->name, GFP_KERNEL);
>>> +             of_node_put(np);
>>> +     }
>>
>> What about simply returning rproc->name?
>>
> 
> rproc->name doesn’t serve the purpose here. It only reflects the remoteproc driver’s name,
> not the identity of a specific remoteproc instance. What we need is a unique and meaningful
> identifier for this particular instance, and using the DT node name provides exactly that.

It should, rproc->name is used for find the 
/dev/remoteproc/remoteproc<X> instance

Regards,
Arnaud

> 
> Thanks,
> Shenwei
> 
>>> +
>>> +     return name;
>>> +}
>>> +
>>> +static struct device_node *
>>> +rpmsg_get_channel_ofnode(struct rpmsg_device *rpdev, char *chan_name)
>>> +{
>>> +     struct device_node *np_chan = NULL, *np;
>>> +     struct rproc *rproc;
>>> +
>>> +     rproc = rproc_get_by_child(&rpdev->dev);
>>> +     if (!rproc)
>>> +             return NULL;
>>> +
>>> +     np = of_node_get(rproc->dev.of_node);
>>> +     if (!np && rproc->dev.parent)
>>> +             np = of_node_get(rproc->dev.parent->of_node);
>>
>> Is a topology where they is no rproc->dev node but a parent node exist?
>>
>>> +
>>> +     if (np) {
>>> +             /* Balance the of_node_put() performed by of_find_node_by_name().
>> */
>>> +             of_node_get(np);
>>> +             np_chan = of_find_node_by_name(np, chan_name);
>>> +             of_node_put(np);
>>> +     }
>>> +
>>> +     return np_chan;
>>> +}
>>> +
>>> +static int
>>> +rpmsg_gpio_channel_callback(struct rpmsg_device *rpdev, void *data,
>>> +                         int len, void *priv, u32 src) {
>>> +     struct gpio_rpmsg_packet *msg = data;
>>> +     struct rpmsg_gpio_port *port = NULL;
>>> +     struct rpdev_drvdata *drvdata;
>>> +
>>> +     drvdata = dev_get_drvdata(&rpdev->dev);
>>> +     if (drvdata && msg && msg->port_idx < MAX_PORT_PER_CHANNEL)
>>> +             port = drvdata->channel_devices[msg->port_idx];
>>> +
>>> +     if (!port)
>>> +             return -ENODEV;
>>> +
>>> +     if (msg->header.type == GPIO_RPMSG_REPLY) {
>>> +             *port->info.reply_msg = *msg;
>>> +             complete(&port->info.cmd_complete);
>>
>> What happen if the remoteprocessor answer after the completion timeout?
>> Could it result in desynchronization between the request and the answer?
>>
>> Having a cmd_counter in gpio_rpmsg_head could help to identify current request
>> and answer
>>
>> the use of reinit_completion could be also needed
>>
>>> +     } else if (msg->header.type == GPIO_RPMSG_NOTIFY) {
>>> +             generic_handle_domain_irq_safe(port->gc.irq.domain, msg->pin_idx);
>>> +     } else
>>> +             dev_err(&rpdev->dev, "wrong command type!\n");
>>
>> Could you print the msg->header.type value to help for debug?
>>
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> +static int rpmsg_gpio_channel_probe(struct rpmsg_device *rpdev) {
>>> +     struct device *dev = &rpdev->dev;
>>> +     struct rpdev_drvdata *drvdata;
>>> +     struct device_node *np;
>>> +     int ret;
>>> +
>>> +     if (!dev->of_node) {
>>> +             np = rpmsg_get_channel_ofnode(rpdev, rpdev->id.name);
>>> +             if (np) {
>>> +                     dev->of_node = np;
>>> +                     set_primary_fwnode(dev, of_fwnode_handle(np));
>>> +             }
>>> +             return -EPROBE_DEFER;
>>> +     }
>>> +
>>> +     drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
>>> +     if (!drvdata)
>>> +             return -ENOMEM;
>>> +
>>> +     drvdata->rproc_name = rpmsg_get_rproc_node_name(rpdev);
>>> +     dev_set_drvdata(dev, drvdata);
>>> +
>>> +     for_each_child_of_node_scoped(dev->of_node, child) {
>>> +             if (!of_device_is_available(child))
>>> +                     continue;
>>> +
>>> +             if (!of_match_node(dev->driver->of_match_table, child))
>>> +                     continue;
>>> +
>>> +             ret = rpmsg_gpiochip_register(rpdev, child);
>>> +             if (ret < 0)
>>> +                     dev_err(dev, "Failed to register: %pOF\n", child);
>>> +     }
>>> +
>>> +     return 0;
>>
>> return ret
>> or indicate why the return of rpmsg_gpiochip_register is not taken into account
>>
>>
>>> +}
>>> +
>>> +static void rpmsg_gpio_channel_remove(struct rpmsg_device *rpdev) {
>>> +     dev_info(&rpdev->dev, "rpmsg gpio channel driver is removed\n");
>>> +}
>>> +
>>> +static const struct of_device_id rpmsg_gpio_dt_ids[] = {
>>> +     { .compatible = "rpmsg-gpio" },
>>> +     { /* sentinel */ }
>>> +};
>>> +
>>> +static struct rpmsg_device_id rpmsg_gpio_channel_id_table[] = {
>>> +     { .name = "rpmsg-io-channel" },
>>
>> I would remove the "-channel" suffix to have similar naming than "rpmsg-tty" and
>> "rpmsg-raw"
>>
>> Regards,
>> Arnaud
>>
>>> +     { },
>>> +};
>>> +MODULE_DEVICE_TABLE(rpmsg, rpmsg_gpio_channel_id_table);
>>> +
>>> +static struct rpmsg_driver rpmsg_gpio_channel_client = {
>>> +     .drv.name       = KBUILD_MODNAME,
>>> +     .drv.of_match_table = rpmsg_gpio_dt_ids,
>>> +     .id_table       = rpmsg_gpio_channel_id_table,
>>> +     .probe          = rpmsg_gpio_channel_probe,
>>> +     .callback       = rpmsg_gpio_channel_callback,
>>> +     .remove         = rpmsg_gpio_channel_remove,
>>> +};
>>> +module_rpmsg_driver(rpmsg_gpio_channel_client);
>>> +
>>> +MODULE_AUTHOR("Shenwei Wang <shenwei.wang@nxp.com>");
>>> +MODULE_DESCRIPTION("generic rpmsg gpio driver");
>>> +MODULE_LICENSE("GPL");
> 


