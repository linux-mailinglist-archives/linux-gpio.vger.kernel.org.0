Return-Path: <linux-gpio+bounces-31984-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OKvTKmjwmGl1OQMAu9opvQ
	(envelope-from <linux-gpio+bounces-31984-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 21 Feb 2026 00:38:16 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A81E16B698
	for <lists+linux-gpio@lfdr.de>; Sat, 21 Feb 2026 00:38:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 06789301944D
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 23:38:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BA85313268;
	Fri, 20 Feb 2026 23:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axentia.se header.i=@axentia.se header.b="DZ07L+my"
X-Original-To: linux-gpio@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023113.outbound.protection.outlook.com [40.107.162.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC7D30FC35;
	Fri, 20 Feb 2026 23:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.113
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771630691; cv=fail; b=DrdZ0PByPFv0pl7JAaBQo9PIZ4WKz2Jypeh17XsrKwm0lxIWS45o+Xv0grnJXU1ACPgBzY6RnXu8bLkig8lXeS5pDI0vTsctg0EXD+oGHFMjXjnn9WZieH+xm/3ak24Ukx8a1cL0LPt0pjo+UU1hkO6ZoVqOpUvvaY1n0HLGp64=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771630691; c=relaxed/simple;
	bh=ckjCMbNXGD4J1yjKL8Zjca4bvBKJFkaVeAJvnMi4Z3k=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Nu7FpRh3J9hfY/+q2nepatxe6TJoE71NqUNzcwoc6iHPYI19HdF3mgxapF6DX12WfgPDoFMzxGEGD4fhv8FqdPFpubkn+0y9Ln6AWHmC9msaZsbXRowKX6hdL1aKcjIhKHvDdyLbQM36ms8P4OaWHmzb9mL/zNTxy3ilOqLiER8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axentia.se; spf=pass smtp.mailfrom=axentia.se; dkim=pass (1024-bit key) header.d=axentia.se header.i=@axentia.se header.b=DZ07L+my; arc=fail smtp.client-ip=40.107.162.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axentia.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axentia.se
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Oywz4MBQj4ycIGog+VMxZgVktttmhIppIG1UQukibrz/X579U1m2RxwSL7btkKsRoES1BTqr1w2Hg9bfqOMTu1MAH9KLadTjHZ6dRCwyclL0khfatrNQQHOeIBfPia0rb9lZ4bdvznfDPWhfhsxaa/GQy3UHsmu+xhBIkY0xJkLLS98Q18JSHpV7SlUZjxTz15KUJXSdJPT2lX2/dtssF4Sk18TxmTyrax6cGywLtiHOXyVz9gbw7pWHQrrMj0cnghCACsgfPwu3WkhFxt9WlGlr4pWm9+yeWmwBVsPfjq0Mj/D3cXba5Qf3n7Kzb7VcQMLzT0cUUyMdBldYSJ7a2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SY1ZOAmQMv8JgbDdefmiA5fF/KLtzUGsn/K8Jl+yMPg=;
 b=Vb1xk8EmneUWyOceE4d5aNEapjY8thOkw0BdtW94mHQWJpwf3GsT1iNs1EQra2Mox7Q2ow+RXetfMNMFA7ikoAh2EnOIeRBvxYa4aEODbESspINsfhISDd/DnRMBM/zB+nxSstqHug7Euntg3oTqZCVAuUkAQmszF7soJuXqZUbT479OhnkdD6/tN9tSA84UGXf2dSaEjfcrRqM3H2pH7dyB2uCbVZ6IOY66kbSLP8KQk6pIL2ycTKGwaF3dmYNdR3ajOhn+2dFb8bJ87ijYBMmIXf978G8HD0mcicXjYRTHQ3E54DqmxhbVTGxGrhsAJLmjVuJrlDIx7lAfI7EB6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SY1ZOAmQMv8JgbDdefmiA5fF/KLtzUGsn/K8Jl+yMPg=;
 b=DZ07L+mys11YqiBeQHmxiRfQnnfU7YTk1jQTKL5Sfsux3JNnkUfPgePN7MdiFbswhTDuwJvFtnFA50tFokZrzmdvWUmrZv/xeBQQJLB7BShQGbP74ZIJoSQpt1SaPZ+whbvAq+T5CXxC2Dp9veEZBMYyuSET6QxFUunbvnppBys=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from AS8PR02MB9235.eurprd02.prod.outlook.com (2603:10a6:20b:5c1::5)
 by GVUPR02MB11818.eurprd02.prod.outlook.com (2603:10a6:150:32f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Fri, 20 Feb
 2026 23:38:03 +0000
Received: from AS8PR02MB9235.eurprd02.prod.outlook.com
 ([fe80::32a9:a9e6:ded:5714]) by AS8PR02MB9235.eurprd02.prod.outlook.com
 ([fe80::32a9:a9e6:ded:5714%6]) with mapi id 15.20.9632.017; Fri, 20 Feb 2026
 23:38:03 +0000
Message-ID: <aed0ba40-5c8e-e2c2-94b6-d7f2ee27f056@axentia.se>
Date: Sat, 21 Feb 2026 00:38:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 3/5] pinctrl: add generic board-level pinctrl driver using
 mux framework
Content-Language: sv-SE
To: Frank Li <Frank.Li@nxp.com>, Linus Walleij <linusw@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20260219-pinctrl-mux-v1-0-678d21637788@nxp.com>
 <20260219-pinctrl-mux-v1-3-678d21637788@nxp.com>
From: Peter Rosin <peda@axentia.se>
In-Reply-To: <20260219-pinctrl-mux-v1-3-678d21637788@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV2PEPF000239F7.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::2a9) To AS8PR02MB9235.eurprd02.prod.outlook.com
 (2603:10a6:20b:5c1::5)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR02MB9235:EE_|GVUPR02MB11818:EE_
X-MS-Office365-Filtering-Correlation-Id: d66a83a1-f097-46e2-74d6-08de70d91731
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?blhMdVVPWU5Ma25CTExRbW43MS9zajlZLzQ5aHNXMmc3Znh0SVI3SS85aytn?=
 =?utf-8?B?UFBKd0NGSERaNU1nQjFSMDAyREVNMTVUeDVZZGZqd09EVU9MQWtreUhha2d1?=
 =?utf-8?B?dG1rWnBRYVFiSXdwdk92ODljWTFwaXVKb2pmV01HTnFEUW9jZXBJMWx5TG1W?=
 =?utf-8?B?VkZKdnVjcmFWYUJaK2RCZ0xRTlYvcWV2WGg4QXRyQUhqaTBLM2NRVjVxcHBa?=
 =?utf-8?B?NTJMSERzaVN4YS83S0VQckZuTDYrV3g5ayt0TGRGdnBUbG54VVREYXh4NjRP?=
 =?utf-8?B?MnNyTk1iZit4WXA4UkRDdVBzeHZGL2pVNmdSSld1dGJzY2N4SFlseHlvSzN5?=
 =?utf-8?B?aEZuNFZibGlCeDM0TFpZd3J5eUJqbXM2OTRGVDcvUEFFc3NnYlJvRW8yZ29H?=
 =?utf-8?B?b0RlcWlwdHZkNHhIak45YVYvOWd3eFJ0UTBpNy94TWd5TE0wd2FzWURkbzNi?=
 =?utf-8?B?dUFjd2IwRDhMMDhCV2FsV2U2QmJ2emFGV3dPTzJtZ1kyMmRNOGlKbGY0RnF5?=
 =?utf-8?B?eVhWRUpwYUxkZTEralZvWlRDVDBJSlUwazh6ZllvdDVKV1hEZVRwR3VTLzVG?=
 =?utf-8?B?bXNjRlFKWjFXOEM3TDRsN3cyN2ZoYWRPd2Y4OGcwWkVDTWpPRUdKbXE5K2V3?=
 =?utf-8?B?ME53dGl4RDZkSngwM0liZnpBZFZ2d0kzWk9zK3BOOVVDZ3M5OWt6N3pVai9o?=
 =?utf-8?B?WkpGc0M5aHAycGthNmF2Z3NML2VLTWJvNkJaQXF5MUNObTB0Q09tYndEZUFz?=
 =?utf-8?B?SE81UW56anorZTdrRTRIQ2ZyOS9Sb2JoWjVaOW0zUWl5cEgzdmY5Z3Eva25L?=
 =?utf-8?B?cWRndmRIRmorbkFFLzB0T3gzdDVrRkhFaEpyR3pLNHozSVVtcGlSdmV0Q2hL?=
 =?utf-8?B?N1d4d3pld0wzaklhaHMzTjZQYUJvQmNUNGE1VlUzeDNtMmFTTFk4U1c2UE5L?=
 =?utf-8?B?SmxnRTlxekZxcDFWZjR4Rlc2RGF3WkNqNm5MMUFETmQyWjRlRFc4VkNZWmdw?=
 =?utf-8?B?L25vc2VIYXkvTE9OZVFEZUkvUkMxeTFCOW44TFMveVBJNmZkdkxHNkVJZVJw?=
 =?utf-8?B?WEhwVjNGM2oyU1p5bjdOdzF0TnFjV2NVaUNTaE0xTWlLTnJpUWhFOGxXUUI4?=
 =?utf-8?B?R3gwU3IyTExTYmFZQi9hVVQ4WDFLbHErVmJpNDBueDB6aGdMbCtJemtIWXRt?=
 =?utf-8?B?Q1V0NFNnSVd1SkNocVZ0Yk5HK3hPMnNVTEhVT0ljeDVmdXdhWWVRcWx3SE5M?=
 =?utf-8?B?T0FGZXV4L3VzdnpmR3k4b3BJWHZmcEY5dnZxc2JRV1RENW8xWHB2L01RcUxL?=
 =?utf-8?B?c1pGYnBBS1dWOGgrNGVnaVI5R1FoOW9aOHVrWWpIQnBWYXhZVGgrLzJJSEZl?=
 =?utf-8?B?Yks4aDFlZElvcVhCSmFmeTRrWWwzYW1IdndmVmFMclo1c2k4M1NqSHlneDl6?=
 =?utf-8?B?TzNJcVRPc0VVQkQ3VmNxNnFqaXFURk9mcE9hODJEK3FmYnl5c2ZRL1NPMU4r?=
 =?utf-8?B?VG9WTEZaVDZscnZnV2VVSUtEREVTaHFFMTZnblQwSkxIUFUzRUtyRzJPL1V6?=
 =?utf-8?B?NVdicFRKaGp4OG9MK3I1VGIwaW5BQkt4UDNsdys3MTMxOGNzaEd5YnVLaVJo?=
 =?utf-8?B?NXdObjE5T1YwYWg5ZVArZDdoUWdlTFRKNXU3RFVzdWVHMkFZVW51czRjTWdD?=
 =?utf-8?B?S3ZhMFA4dDU5TDBxcU9SQkRxcXNmOW00aHNVYkt1YzU1a2VWdVFCQmIzVHdp?=
 =?utf-8?B?OGZVL2xBZ1gzSlR4TkUxNUQvNlpKRjN5WFF3bTdveFB4UENDZmVNbTcvZHpG?=
 =?utf-8?B?ZzNLV0xlQXdUQUxzbjR5SE12Y3VadGtuS25TdEE4Z3E1bXd0MjltQ1JYY1F4?=
 =?utf-8?B?ZTRBSW5Eckg5RlJvbWM3TzFLbGhLV2dZK1R1WGE1eUZmdnNxT3YzU0JtV3Vi?=
 =?utf-8?B?TWUyL2pGeCtmb05wZnptNjhwakJwbjRFNFdsbmt3azZobjkremFtVk9hS2tZ?=
 =?utf-8?B?OG5HUkIycm1SOUx2U2IxR3RiY0x0SHp5V29oeUM5YnUxSEVUMGt1UVdlZy96?=
 =?utf-8?B?Q3BsK3pLS3k1RG1pTjdTejJQRmVlc0NiV1Q0TFUzV0VzcnZEWUNJOFdjRWc2?=
 =?utf-8?Q?tb24=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR02MB9235.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aTNnVkV4T1U2ZmpuWlJZTDUvNFJnQUZ4ZW9JYlpNSjgyRGxDdzJoMFpxZldk?=
 =?utf-8?B?R3RFSE16ZUVuMG9TMVgrMDBEVXdZQzRDOXB0Rkt3Nm9Od1hDTGtCWDZTRFdl?=
 =?utf-8?B?a1B3QjdnM0V0WnF4LzZuQU1CdEdheDJmVko1Qm44UFBnSGNmWkw0VitWYm1y?=
 =?utf-8?B?YXo4a0k2TStmWkVhaXhPYnl1NHhrdFg4SlNVTjBLZXovT29xRVA5c2g1UFFv?=
 =?utf-8?B?MG95WEVZUnlKMHFtQnFsVVZZU1BnV3Q2dDJJOUU4YktaT1gzaFJaVkErMUlR?=
 =?utf-8?B?b3RzNkFoZjVJbWdOQnpWNlYvdFFOL09oYTNXbElCaXIyRjc1dk9OTUpuWWlI?=
 =?utf-8?B?a1A4clBZOENaWGRFTUUvOTFUUlZwdVhVQm9nK0hPdkpTZ1lrWVgyOWMvSFpQ?=
 =?utf-8?B?Y3ZlMGgxTERpRFgxSGdCM1EwR2tKUFV6b2JFQ3djWkpacXJvaXdIOXF5U29q?=
 =?utf-8?B?ZDVITUpkTzRXRDFzL29NUkFXN3pMZ3B0SnZQT0k1YjNMQzVsaVdPcS9ncnEx?=
 =?utf-8?B?WGF4M2hvZGZNU0paa29PZ0xJNkpaM0NyUllXRzR2YkRqSzRweGc2Z1pFQ2hS?=
 =?utf-8?B?QkJ2anQvR0R4U240ejhQWkVUNktOM1R5V0tudkFYZW05R1lzbjF4emFyOUFu?=
 =?utf-8?B?eFZUZzlPUDZuSHhadjM0dkZvbnBuUkd6emN3SFd5WVNhcEtkWEtRTnR2Ympm?=
 =?utf-8?B?aVFxTkc0dWJ4bjA0dVp1ODRUbXAxNnorNjBTbFp4U2VOREdmMkVHRjBOU3hh?=
 =?utf-8?B?NWx5bmVUSUh0ZG1jbGR0dEJiWWFCYjU4aWNNeDhTNWljSFZjcnpVRkpFUCtn?=
 =?utf-8?B?cnVZTWdaNDU0YllaTjhOckQ0Yi9sUjJkK0VOUVdvektjUTRzNjg2YjMwcTg0?=
 =?utf-8?B?TDZsL21XUTVBbGRMWmxGYTVQNit6NHBNWWthVkdmTXdidUhvYXBjWE1SSmtD?=
 =?utf-8?B?TXExbkxDRHB4dC9FTnJlWHF2a1dHYlEzWHEvSFBNVDF0cjBKR09qLzVxSWJZ?=
 =?utf-8?B?elBQNmg2cUlCSFZuVjVZSWxWNUV2QjI4aWVxbnh6bGRZWElwTm4xYnRiY2xO?=
 =?utf-8?B?NG9LVkFzTVA2MDhsSkNiRjl6KzRxUnBQMDltdjNkWmFLY0lsWjB1VXNRdUlB?=
 =?utf-8?B?R0ZDUTdadmprTE5Nd1Z6Rk5WbG5CaTVKTEw3ZHBrcmlBcVNIV2xrditqd1cx?=
 =?utf-8?B?S3g5VUdkQzZBcEhDWm1XdFhQYStPSFFqUHhRNmVkYnVkMHZBeHRUaHIvNHZ4?=
 =?utf-8?B?NERwdUJPanF2MjdVRlhPL2VRVzYyTWV0V3BKT1RmSmVSWTVWenV1b0Rqd0Z0?=
 =?utf-8?B?MUorVTBTL0x4UGtuUktaZkNXdzRKZmFlZGxUL25iWlJFZ0NvRnUrQmdidDNU?=
 =?utf-8?B?cFJwUElqTWhjVVQ0ckVFa1V0UHlHUmlmNEJoRkhySXhxU2ovbXJjZVg4a1ZE?=
 =?utf-8?B?U3hPMk5aSm4vWFhib09NRjNPVHB4Z3dUUG1QWDUzbGVFMnJHdjZkejRoV2Ev?=
 =?utf-8?B?RmpBQWdvOXZPWmFhYk5rWU43M1FjZlR4VUpnc2kyZDdKMzIyM0gyWitrckRt?=
 =?utf-8?B?eG9CN0kyNkpHSXhMY3ByRXd0TG4xcTFHWnBFK0lHN256RGMxOE9qdjhxTzNh?=
 =?utf-8?B?aTZJYmpNL3dNaVVQVTlPaFlnVTlZZ01ETUlic2wvTUdFVExyOEFKYjZHcnlY?=
 =?utf-8?B?TnlVOCs0UGp1MXd4VDZMcStlTktHYWQ2OWtpYWYwY05rM3RRVTZDWEhXbjk1?=
 =?utf-8?B?Z096KzJJVVJNT1NsMHNjdU9CS0VTMEVqRkRsbW91bUQ4R3VMaTh1dEhXY2Yy?=
 =?utf-8?B?ejEwTk9EZXhCZ3pzYVJ2RkdyWTV6cDhyaWpWaWgxeFoxYkw4YzF3blpoQjAv?=
 =?utf-8?B?OWVJaWx0d29JS1U1aUJTSXlOOWNlamdmZmoxL2xlNmpRcGh4QjhoRjZQMmNR?=
 =?utf-8?B?aC9CbXpaRTV1MWdxUTdYb0c2SEdqQS8xeUlnZDA2cnNUeDAxTm9jR0pxZU1p?=
 =?utf-8?B?SnZKcWMxeC9WZUNHSGMwU205c3VtMXkwV1I4cUNSR0t5UWNqK2dJWDZsUksx?=
 =?utf-8?B?MEQyRnpKNUJBN0hJV2ZGcElGUVkxOXRLSWVBWEpTZTNqa2xIZ0ZvcUlGMS8w?=
 =?utf-8?B?NDZxUy9FNmpMc2hNcEpWN0cvUDQrZmtMTHV2SmhGSE50bFR4dU83YnFjeHh5?=
 =?utf-8?B?NWxNTmlLb0loTXhZWDQ4R2RpVTZ3OUpGZUtBclg1eXRmdGJ4R1RmN0ppQ2tt?=
 =?utf-8?B?TWphMklRVm1zUWUwcmUxcm14Ky9ZNG1MT2pXcHhQNnBtano3cFdKRGxFV3Mz?=
 =?utf-8?Q?Y1B+1ll9kJMv6p4aHf?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: d66a83a1-f097-46e2-74d6-08de70d91731
X-MS-Exchange-CrossTenant-AuthSource: AS8PR02MB9235.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 23:38:03.4308
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jxe2xQF8/rmFVDAie/xHQCYHtKZhmqkQNzLt8NCFRalb1iJTFn+m+0LttHcjTMwB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVUPR02MB11818
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[axentia.se,none];
	R_DKIM_ALLOW(-0.20)[axentia.se:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31984-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[nxp.com,kernel.org,milecki.pl,pengutronix.de,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peda@axentia.se,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[axentia.se:+];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2A81E16B698
X-Rspamd-Action: no action

Hi!

2026-02-19 at 23:23, Frank Li wrote:
> Many boards use on-board mux chips (often controlled by GPIOs from an I2C
> expander) to switch shared signals between peripherals.
> 
> Add a generic pinctrl driver built on top of the mux framework to
> centralize mux handling and avoid probe ordering issues. Keep board-level
> routing out of individual drivers and supports boot-time only mux
> selection.
> 
> Ensure correct probe ordering, especially when the GPIO expander is probed
> later.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/pinctrl/Kconfig               |   9 ++
>  drivers/pinctrl/Makefile              |   1 +
>  drivers/pinctrl/pinctrl-generic-mux.c | 222 ++++++++++++++++++++++++++++++++++
>  3 files changed, 232 insertions(+)
> 
> diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
> index afecd9407f5354f5b92223f8cd80d2f7a08f8e7d..0657eeeeb587fa5e68dc3c1e00be35608e243b80 100644
> --- a/drivers/pinctrl/Kconfig
> +++ b/drivers/pinctrl/Kconfig
> @@ -274,6 +274,15 @@ config PINCTRL_GEMINI
>  	select GENERIC_PINCONF
>  	select MFD_SYSCON
>  
> +config PINCTRL_GENERIC_MUX
> +	tristate "Generic Pinctrl driver by using multiplexer"
> +	depends on MULTIPLEXER
> +	select PINMUX
> +	select GENERIC_PINCONF
> +	help
> +          Generic pinctrl driver by MULTIPLEXER framework to control on
> +          board pin selection.
> +
>  config PINCTRL_INGENIC
>  	bool "Pinctrl driver for the Ingenic JZ47xx SoCs"
>  	default MACH_INGENIC
> diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
> index f7d5d5f76d0c8becc0aa1d77c68b6ced924ea264..fcd1703440d24579636e8ddb6cbd83a0a982dfb7 100644
> --- a/drivers/pinctrl/Makefile
> +++ b/drivers/pinctrl/Makefile
> @@ -29,6 +29,7 @@ obj-$(CONFIG_PINCTRL_EQUILIBRIUM)   += pinctrl-equilibrium.o
>  obj-$(CONFIG_PINCTRL_EP93XX)	+= pinctrl-ep93xx.o
>  obj-$(CONFIG_PINCTRL_EYEQ5)	+= pinctrl-eyeq5.o
>  obj-$(CONFIG_PINCTRL_GEMINI)	+= pinctrl-gemini.o
> +obj-$(CONFIG_PINCTRL_GENERIC_MUX) += pinctrl-generic-mux.o
>  obj-$(CONFIG_PINCTRL_INGENIC)	+= pinctrl-ingenic.o
>  obj-$(CONFIG_PINCTRL_K210)	+= pinctrl-k210.o
>  obj-$(CONFIG_PINCTRL_K230)	+= pinctrl-k230.o
> diff --git a/drivers/pinctrl/pinctrl-generic-mux.c b/drivers/pinctrl/pinctrl-generic-mux.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..555dd2966e205e7f90a8bf8df3e46ed51d29d562
> --- /dev/null
> +++ b/drivers/pinctrl/pinctrl-generic-mux.c
> @@ -0,0 +1,222 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Generic Pin Control Driver for Board-Level Mux Chips
> + * Copyright (C) 2026
> + */
> +
> +#include <linux/cleanup.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/mutex.h>
> +#include <linux/mux/consumer.h>
> +#include <linux/platform_device.h>
> +#include <linux/pinctrl/pinconf-generic.h>
> +#include <linux/pinctrl/pinctrl.h>
> +#include <linux/pinctrl/pinmux.h>
> +#include <linux/slab.h>
> +
> +#include "core.h"
> +#include "pinmux.h"
> +
> +struct mux_pin_function {
> +	struct mux_state *mux_state;
> +};
> +
> +struct mux_pinctrl {
> +	struct device *dev;
> +	struct pinctrl_dev *pctl;
> +
> +	/* mutex protecting the lists */
> +	struct mutex lock;
> +	int cur_select;
> +};
> +
> +static int
> +mux_pinmux_dt_node_to_map(struct pinctrl_dev *pctldev,
> +			  struct device_node *np_config,
> +			  struct pinctrl_map **map, unsigned int *num_maps)
> +{
> +	struct mux_pinctrl *mpctl = pinctrl_dev_get_drvdata(pctldev);
> +	struct mux_pin_function *function;
> +	struct device *dev = mpctl->dev;
> +	const char **pgnames;
> +	int selector;
> +	int group;
> +	int ret;
> +
> +	*map = devm_kcalloc(dev, 1, sizeof(**map), GFP_KERNEL);
> +	if (!map)
> +		return -ENOMEM;
> +
> +	*num_maps = 0;
> +
> +	function = devm_kzalloc(dev, sizeof(*function), GFP_KERNEL);
> +	if (!function) {
> +		ret = -ENOMEM;
> +		goto err_func;
> +	}
> +
> +	pgnames = devm_kzalloc(dev, sizeof(*pgnames), GFP_KERNEL);
> +	if (!pgnames) {
> +		ret = -ENOMEM;
> +		goto err_pgnames;
> +	}
> +
> +	pgnames[0] = np_config->name;
> +
> +	guard(mutex)(&mpctl->lock);
> +
> +	selector = pinmux_generic_add_function(mpctl->pctl, np_config->name,
> +					       pgnames, 1, function);
> +	if (selector < 0) {
> +		ret = selector;
> +		goto err_add_func;
> +	}
> +
> +	group = pinctrl_generic_add_group(mpctl->pctl, np_config->name, NULL, 0, mpctl);
> +	if (group < 0) {
> +		ret = group;
> +		goto err_add_group;
> +	}
> +
> +	function->mux_state = devm_mux_state_get_from_np(pctldev->dev, NULL, np_config);
> +	if (IS_ERR(function->mux_state)) {
> +		ret = PTR_ERR(function->mux_state);
> +		goto err_mux_state_get;
> +	}
> +
> +	(*map)->type = PIN_MAP_TYPE_MUX_GROUP;
> +	(*map)->data.mux.group = np_config->name;
> +	(*map)->data.mux.function = np_config->name;
> +
> +	*num_maps = 1;
> +
> +	return 0;
> +
> +err_mux_state_get:
> +	pinctrl_generic_remove_group(mpctl->pctl, group);
> +err_add_group:
> +	pinmux_generic_remove_function(mpctl->pctl, selector);
> +err_add_func:
> +	devm_kfree(dev, pgnames);
> +err_pgnames:
> +	devm_kfree(dev, function);
> +err_func:
> +	devm_kfree(dev, *map);
> +
> +	return ret;
> +}
> +
> +static void
> +mux_pinmux_dt_free_map(struct pinctrl_dev *pctldev, struct pinctrl_map *map,
> +		       unsigned int num_maps)
> +{
> +	struct mux_pinctrl *mpctl = pinctrl_dev_get_drvdata(pctldev);
> +
> +	devm_kfree(mpctl->dev, map);
> +}
> +
> +static const struct pinctrl_ops mux_pinctrl_ops = {
> +	.get_groups_count = pinctrl_generic_get_group_count,
> +	.get_group_name = pinctrl_generic_get_group_name,
> +	.get_group_pins = pinctrl_generic_get_group_pins,
> +	.dt_node_to_map = mux_pinmux_dt_node_to_map,
> +	.dt_free_map = mux_pinmux_dt_free_map,
> +};
> +
> +static int mux_pinmux_set_mux(struct pinctrl_dev *pctldev,
> +			      unsigned int func_selector,
> +			      unsigned int group_selector)
> +{
> +	struct mux_pinctrl *mpctl = pinctrl_dev_get_drvdata(pctldev);
> +	const struct function_desc *function;
> +	struct mux_pin_function *func;
> +	int ret;
> +
> +	guard(mutex)(&mpctl->lock);
> +
> +	function = pinmux_generic_get_function(pctldev, func_selector);
> +	func = function->data;
> +
> +	if (mpctl->cur_select == func_selector)
> +		return 0;
> +
> +	if (mpctl->cur_select >= 0 && mpctl->cur_select != func_selector)
> +		return -EINVAL;
> +
> +	ret = mux_state_select(func->mux_state);

There is no matching call to mux_state_deselect(). Quoting the docs for
mux_state_select{,_delay}():

	On successfully selecting the mux-state, its mux-control will be
	locked until there is a call to mux_state_deselect(). If the
	mux-control is already selected when mux_state_select() is called,
	the caller will be blocked until mux_state_deselect() or
	mux_control_deselect() is called (by someone else).

	Therefore, make sure to call mux_state_deselect() when the
	operation is complete and the mux-control is free for others to
	use, but do not call mux_state_deselect() if mux_state_select()
	fails.

So, unless I'm missing something, you will get a deadlock if a pinctrl
have states backed by mux-states connected to the same mux-control (which
feels like the typical case) and you try to change between these pinctrl
states. Have you tried calling pinctrl_select_state() with this pinctrl
to mux things at runtime?

Cheers,
Peter

> +	if (ret)
> +		return ret;
> +
> +	mpctl->cur_select = func_selector;
> +
> +	return 0;
> +}
> +
> +static const struct pinmux_ops mux_pinmux_ops = {
> +	.get_functions_count = pinmux_generic_get_function_count,
> +	.get_function_name = pinmux_generic_get_function_name,
> +	.get_function_groups = pinmux_generic_get_function_groups,
> +	.set_mux = mux_pinmux_set_mux,
> +};
> +
> +static int mux_pinctrl_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct mux_pinctrl *mpctl;
> +	struct pinctrl_desc *pctl_desc;
> +	int ret;
> +
> +	mpctl = devm_kzalloc(dev, sizeof(*mpctl), GFP_KERNEL);
> +	if (!mpctl)
> +		return -ENOMEM;
> +
> +	mpctl->dev = dev;
> +	mpctl->cur_select = -1;
> +
> +	platform_set_drvdata(pdev, mpctl);
> +
> +	pctl_desc = devm_kzalloc(dev, sizeof(*pctl_desc), GFP_KERNEL);
> +	if (!pctl_desc)
> +		return -ENOMEM;
> +
> +	ret = devm_mutex_init(dev, &mpctl->lock);
> +	if (ret)
> +		return ret;
> +
> +	pctl_desc->name = dev_name(dev);
> +	pctl_desc->owner = THIS_MODULE;
> +	pctl_desc->pctlops = &mux_pinctrl_ops;
> +	pctl_desc->pmxops = &mux_pinmux_ops;
> +
> +	ret = devm_pinctrl_register_and_init(dev, pctl_desc, mpctl,
> +					     &mpctl->pctl);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to register pinctrl.\n");
> +
> +	ret = pinctrl_enable(mpctl->pctl);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to enable pinctrl.\n");
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id mux_pinctrl_of_match[] = {
> +	{ .compatible = "pinctrl-multiplexer" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, mux_pinctrl_of_match);
> +
> +static struct platform_driver mux_pinctrl_driver = {
> +	.driver = {
> +		.name = "generic-pinctrl-mux",
> +		.of_match_table = mux_pinctrl_of_match,
> +	},
> +	.probe = mux_pinctrl_probe,
> +};
> +module_platform_driver(mux_pinctrl_driver);
> +
> +MODULE_AUTHOR("Frank Li <Frank.Li@nxp.com>");
> +MODULE_DESCRIPTION("Generic Pin Control Driver for Board-Level Mux Chips");
> +MODULE_LICENSE("GPL");
> +
> 

