Return-Path: <linux-gpio+bounces-38716-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id d85pInpjNWpkuwYAu9opvQ
	(envelope-from <linux-gpio+bounces-38716-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Jun 2026 17:42:50 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D116A6C78
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Jun 2026 17:42:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=rvROTQtR;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38716-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38716-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 99BA9302DFAB
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Jun 2026 15:41:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D70703B47FA;
	Fri, 19 Jun 2026 15:41:46 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011008.outbound.protection.outlook.com [52.101.65.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2963B2FF7;
	Fri, 19 Jun 2026 15:41:43 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781883706; cv=fail; b=byuq3x06j2Z5DWbjwMrUpi2ZV7/blW7ngdROFixcngB48iOJRDOhpF3LeaDnVgBpbchsyZ0Dfk3yLAZ7LEA8Q7kjprxoPZynN6HXYKVnPrr4VucpLsVseVMLZ3+9a8K1VyFUU1v5OuDeYvUtNT4g8aqUatV+vijsoOPze0MoRCU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781883706; c=relaxed/simple;
	bh=GaYQmaf40QJDS8Nn04IvPpaPHDT+QUxs3EOz9Mt8sUE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=LTgrI3fq4FDXT3fi+8qPc2H3osaFIUNCNr5s4wdSEnzi+/15L3dg0RNfHE8ydMC/8xblGXvBL6+8ozkwYDo39aS/xH8XJupaO8OH82N516DP31tfUVlVVnMbuUtHflsmW6gmBsMlJ8mu4rWg1JxNt31aESeHGHsY3Qz2Oqysxuw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=rvROTQtR; arc=fail smtp.client-ip=52.101.65.8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DK64cPBtkZGQH4zqOT//xo+Fdod2XuZ9W66qcngXGrHDj4wZIj4FOPvB2WPT31WdSnVCpQqgzB4qXP9xfoKKqgJyFgBcqCYpJ3XXVoSh0C75oNTlaXabOKEdU6AXDUFi+uWbfe/ty6k17ODjCu8uejsTnXUoLs5Q9oXsjDAgnFaYCDJW5WBtdV/hOCCpG9cVDFS8Kn7auxah/nhlXtY9n6AEmS/2ux3L63b/2VmXLNE2y63mtUkB6fTSM5BMTkKaQKLgzI0junySqmyplVKf10P/NeIaWRxdt68IYm4KTvLpeIUyc6UCqwEhrYhWAFxIz7Zkf49hwqCDGLy3cYJnDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SsiVXEwiBM6N+Tds71cXRkdMEiXoDJaf1Sj+qctH51c=;
 b=gGy/UTO/HWOvxYgZ+2ZVKnP6VqKTJghABAv0jOK1oHIFdCIZ3U2WOGNXrGtsw+8xY6L7kvbM9LxthjPwxdYn9X8jgp96n9RDKPghCtB3WEcQolb+qFoHSEJUna+yKpF14ik0iH/7jynKKWnHUsoqGm2AqIbab+tPe/CMqcmUZC+CfJqJ1aSWS9yWL5WDKF3zF03n915KHkBjy4cBJr8MGGlBFZOCwBfpgAg4XDSmZN9T8jtRDwibyXWu2hjBkgHbI6G2ILr8u3UtgWXa8lNPG7FHxb195oGMcUYYyBCMAP9G43v8DghYAHLuNJ37bd096ok1NR3qpi1xJfq22l2h2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SsiVXEwiBM6N+Tds71cXRkdMEiXoDJaf1Sj+qctH51c=;
 b=rvROTQtRL0zDvrUpcLGZgWN6M5RTeVMu9IRXMbm+91tUzharFFEy1z0PEF5gbPgDCuYzLd9Uw85AyRwkK1mseg0POwWBuNjNAqIOJU1G5ZWps4M6f+phM/MKMe9qmflV3LpEerW5BRbRQiqV1/QclYeU9qnaGwAoFRdutDZfhM2mUeYVRLVze1JdPHgCxxBVX0EYV6NMGrlM9k94ku8+TAxSOaOxA0uy/pCKF87aIP0WJtIxByqf6ebw4slnB5Ukm/OhmMoQt59ffC1XfuysKK++UNhxpglhOyE48Qt9Ek1f9x7ivaOPrD8yloYwxwm1abpA8GnHqZSFVm9HKZvxjw==
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM0PR04MB6818.eurprd04.prod.outlook.com (2603:10a6:208:186::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.13; Fri, 19 Jun
 2026 15:41:34 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0113.015; Fri, 19 Jun 2026
 15:41:34 +0000
From: Frank.Li@oss.nxp.com
Date: Fri, 19 Jun 2026 11:41:00 -0400
Subject: [PATCH 03/11] ARM: imx: Remove NOMMU platform support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260619-dts_cleanup_arm_mcore-v1-3-0101795a2662@nxp.com>
References: <20260619-dts_cleanup_arm_mcore-v1-0-0101795a2662@nxp.com>
In-Reply-To: <20260619-dts_cleanup_arm_mcore-v1-0-0101795a2662@nxp.com>
To: Arnd Bergmann <arnd@arndb.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Stefan Agner <stefan@agner.ch>, Fabio Estevam <festevam@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
 NXP S32 Linux Team <s32@nxp.com>, Linus Walleij <linusw@kernel.org>, 
 Vladimir Zapolskiy <vz@mleia.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-hardening@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781883675; l=2239;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=LrMBM37WUhrHDs66yYXpbmZOUrvvc1LWymdf9HjYd1o=;
 b=uRiBVA0X8zL+4xCPJahoDuPO2SlLVCqSquKD9aoUD9cr6oLfSXbzWZWAGSEy0XEOOQ76RHkoW
 l6iyREK8m68BlT8Cft/FW4VPpzhDXzu+hxo5uOpIEYr2uycjZyKF/RO
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SA0PR11CA0198.namprd11.prod.outlook.com
 (2603:10b6:806:1bc::23) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM0PR04MB6818:EE_
X-MS-Office365-Filtering-Correlation-Id: dcc9a785-54b7-4e3c-cab4-08dece193dc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|7416014|376014|19092799006|56012099006|11063799006|22082099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info:
	MBi18BMPh6UvErbW5sjb3yiTqf+siAP40OQhTEW6IlALZ6+Ndn37KI2vHeEKCC/Kt6b7IzzTRTXNl0GlIcXvh8Z43C0JF2SLeypVFFkhxFxnloM0xow3Efq1za4yc6EwX9QVNNHxiYpev90pqrJHwiq+/CVlkuzuZ9eE/TgPmmEfjuhNQzRliPr/EoCjFZ2ANTXBewpw0JedN2LZCNiCJjWlvBGy2G3SgpUNTgdIM5umMu//XivcKh44/CA+fXm0L+i3GiNwiETcaHxsGJJF0Fctf9Tq8v7gZDw6dYUfJRRPckevoFt5YLDSDh+daAbJsNIqgN9XTBJQsK6CqM5fwqSCdpYzpQWAdfp467PFDcIA5d9YTYRjL1Z6DfvuO7OKZstqbxEpWE9rMf6/isjYqhWZPgWjiHM6jVPbIV7YDWaZbHR5ro1XOd1W8cbgngKTLZSkABaxgHGSaJRgoT2Gne5qohhm7ReS98su8EtE2fusaqDVqTLZ1UfMDWZY5oVuXpBTU9e5ikOoQCB9CDU8Qg/dxIkN5kH8aAV4cSpwl9cTw7qkREyQvmdREWODdXvMl4Q5Er6vQz/4eUzCvn5F480YntjImy6aK+WFrHuFqlJAywF1JiPJGlHJ6RZdcfbZIVKw+2AWMs9pFEltY3SAd+xXDlOu/YH2oZY6Urt4TTeESyaOO/qourjve/N4kc1LyjH5cJtM20UXyKBFnR2H6g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(7416014)(376014)(19092799006)(56012099006)(11063799006)(22082099003)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OWtEY3pHcklZQ0hheS9qdU90NjZwT0ZVYmw0dStic0dSdmVQdTQ3VW9MVEdo?=
 =?utf-8?B?RWQzeHFqM3UrRFhGdXVIQUcvb3NIakczR2N6dWZpUWpzd0FDRnRiR1huQytx?=
 =?utf-8?B?N1ZnVXJMcmtpV0tVTU1PYTFmSE5CT3M4MEhpdFE2NmE1R0daZXl6L2REQnFh?=
 =?utf-8?B?K1pNUnpJWkR5dFRlUThpcS96T002NER4cytkOG5xRTZkckN4VlhHZGU5clBU?=
 =?utf-8?B?NWpoNTl5Q3pISGJnZFUrdUFYa2dpRHQzak9TNUE1QmZnRG4yM3FxNElqc3lW?=
 =?utf-8?B?MXROeDBRQ2tnUXBxMmIzT29sM09IL0F6YWZLUmRPeCtXaU0yRnVpR1oxN3RH?=
 =?utf-8?B?SHN1RnFHdWFoSzQvdzlzUlJsdE8vbHU3aEk4ZUhzWGdrSkpQRm5nMHpxcVJP?=
 =?utf-8?B?RHhGYzV5MW1YeHM5eUZONjRiWUdLTGF1UXZyOWxPbkdJQi90MGhkWXRIVzB2?=
 =?utf-8?B?dDBhVnNJWlpkejhleGJzdm91OGR3by9za3N1ODN5TkZaZHBCL2NNS0lQc1ov?=
 =?utf-8?B?M1pKa1RvRWk0TFhhNXFnb0NlMkhNS1lmY05QR3Bpb0NOb2QvdGJNMkR0Yzhs?=
 =?utf-8?B?ZjlPTVhGcXk5Q2hTYnAyQmx2N0ZmTENyeis3eTJsTU9KZWhJYjRTd0pjbTUw?=
 =?utf-8?B?TExOVjA1cTIrSk1rVFI2RmJvK0hXd1hsc3luNUtsWXg1ZjB6RDE1R3EzMlI3?=
 =?utf-8?B?VUtQY3lIcGlxbmxJSmhXQ0I5aWZPK0ZzM1FwNFljZkYySjFhYktvbEgxMDJi?=
 =?utf-8?B?ZzZxNlYzSVU0K3ErM0YxSUZEZW9lNk82ZTcwZThXbmlpaUszZllEQzZxY2xU?=
 =?utf-8?B?d01SWFRibTFqdlIydktpWjN5bHJObjlkRU1SOUVpVVIySFUzc1FTRyt4N0w2?=
 =?utf-8?B?eU9oZ1JKaStWTlp1OUc5REdFK3BuYXh1aFRiVnZEL2tTZjUwdFJtdEpWMWV5?=
 =?utf-8?B?ajcrSFhTN0h6eDh6eGhWUUVqL2dscnBHTmJZb29Pd1hIcDFWcW5Gc1Bld2Rq?=
 =?utf-8?B?THB0R3AzdElWNUVYVFduM1dFMlBHYlJZbFhWN2U5dWdZa2Ntd0d4VytrbW5t?=
 =?utf-8?B?bjBldXpBZ2RKby9FL0YrNnZMdDhGeEJKc3dFYzFQVytpUTdqRGpYcmNhTWJJ?=
 =?utf-8?B?cFIvQ0x5em5MbjRkWXM5clRDS3F3Zzk0NUl2Mllmazk4UU4yWU5FUmdheEE4?=
 =?utf-8?B?bC8zNCtvZEVrNk9yMzZ3UDlOZGVBc0ZFTWpFUVprd3VSMnhWc256S05ZSW9o?=
 =?utf-8?B?SkVCWnUzQ0FpN3ZGbkE3NlVkQW1nM1hHby9pOXF2U3JWWGJPR1ZJTDcxQmEw?=
 =?utf-8?B?OW1xSlUyRmtKT3p4VXVzWGkzREpIaDdURmFhMkpDdEpMK3VYeEhZb1J4ZXNF?=
 =?utf-8?B?THJjTUZVcWNFTWJzYzM4ZVp3ZzF4NlpIcGFDTHRROXZvYkJiODJLZjArQU42?=
 =?utf-8?B?eWgvL3U2RHozdEU2N0JiRW5lNkNmQzFJKzIvVmFWOVUrMjlKSnV3OG9wODll?=
 =?utf-8?B?SXA1WkYrZkgrUDVvVDlpVUZMVFRWaEltdVFycUVIZVIvY0tZdDgvdTd1dVRO?=
 =?utf-8?B?UFhvOGd2b05EL1VTVk5DeTNPSGFINDBJU21PSk9oNm4rL045QkMzVUdJL0R3?=
 =?utf-8?B?MWpwYVJNNGNWMFB2MHo4TTdEM3h1eXZramk5cFpDTit0bVF6eTRGdjltZUhk?=
 =?utf-8?B?dHRJR3NLRXI0NDFWaG5pWXY3MHRlT3pjQnp0bGVSY0JRTWdxNHRGdWpleHd6?=
 =?utf-8?B?bTIwZmYzbi9rYysrVEg3YWhYR0FMbGpsWUphRjV5bjduRnpDY2lCNTdDT3V5?=
 =?utf-8?B?Q3UyVUdMWE9COElCbmwyL3ZpUTBuV3IySm53b0VwL0tORUV5STB1TnQzQUhh?=
 =?utf-8?B?UXQwRGJjOTRYT1B1N3dZOFNXMWc3V28zcWdyQjVrd3hZclBmdDYydEU1R3BJ?=
 =?utf-8?B?WEhUYUNSRFNiY0VDSllUOTBIR3htaGV6dmpKcXd1VUsvOUNQWmM4MVNGcnlL?=
 =?utf-8?B?b0FzRXBHSTZQT09CdkpzYXdtV2ZtQ1FKSW9qSnluRkIycTgxVmxEVG9ack0v?=
 =?utf-8?B?OVc0TUVNdlIvVE52WnpHMGI2WXo5Nmx2M0VMVERITW5wajg0OUpGZ2JZYmdC?=
 =?utf-8?B?RWdpKzRuOHpWQmxEZjZrT1JDdW8ydXNUM1J3QjZJL0R5K1hWSFhFN09OL3hs?=
 =?utf-8?B?WnltOU5FQnpCMDNyL3NiZkF1UEsvUjl0TmEyUHZ5a2pubGJ1cTNqZ1BTV0ZW?=
 =?utf-8?B?Szg2aG0zTk1ydjZiYmJPSGswbG5LMEUzOFowMEFXSWVwVVZmL1MzeDhPaEMv?=
 =?utf-8?B?d1BaWGhYaWVOM3ZWVGZKVFpsRFpNejlZZTN6cHNNTXRKMStyYXVabFJ4Wmxm?=
 =?utf-8?Q?cU7KYaWFOQ7y2j6ZwvtN3uCkG1dl8nd/8KnbB?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dcc9a785-54b7-4e3c-cab4-08dece193dc9
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 15:41:34.0602
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +btky+v4QT7b7RUaGFUuHXFHviS3FFEZiYbIHFtkuMv9bOtfNA+TVlb7jEKdTKCj5mc+5k+FsG04vIcTMpUnCzaEfABxQcgSRK5xwZ8xgizaYf56poUg/MILkS+72yN1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6818
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:arnd@arndb.de,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:stefan@agner.ch,m:festevam@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux@armlinux.org.uk,m:abelvesa@kernel.org,m:peng.fan@nxp.com,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:aisheng.dong@nxp.com,m:ping.bai@nxp.com,m:s32@nxp.com,m:linusw@kernel.org,m:vz@mleia.com,m:piotr.wojtaszczyk@timesys.com,m:kees@kernel.org,m:gustavoars@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:imx@lists.linux.dev,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:Frank.Li@nxp.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-38716-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[Frank.Li@oss.nxp.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	FREEMAIL_TO(0.00)[arndb.de,pengutronix.de,agner.ch,gmail.com,kernel.org,armlinux.org.uk,nxp.com,baylibre.com,redhat.com,mleia.com,timesys.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@oss.nxp.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,i.mx:url,oss.nxp.com:from_mime,nxp.com:mid,nxp.com:email,NXP1.onmicrosoft.com:dkim,vger.kernel.org:from_smtp,benettiengineering.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 00D116A6C78

From: Frank Li <Frank.Li@nxp.com>

Commercial users and hardware vendors migrated to Zephyr or other RTOS
solutions years ago, leaving the NOMMU platform support effectively unused
and unmaintained.

Remove the obsolete support to reduce maintenance burden and simplify the
i.MX platform code.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/mach-imx/Kconfig      |  7 -------
 arch/arm/mach-imx/Makefile     |  2 --
 arch/arm/mach-imx/mach-imxrt.c | 19 -------------------
 3 files changed, 28 deletions(-)

diff --git a/arch/arm/mach-imx/Kconfig b/arch/arm/mach-imx/Kconfig
index a361840d7a047..081f08bb01ae1 100644
--- a/arch/arm/mach-imx/Kconfig
+++ b/arch/arm/mach-imx/Kconfig
@@ -213,13 +213,6 @@ config SOC_IMX7ULP
 	help
 	  This enables support for Freescale i.MX7 Ultra Low Power processor.
 
-config SOC_IMXRT
-	bool "i.MXRT support"
-	depends on ARM_SINGLE_ARMV7M
-	select ARMV7M_SYSTICK if ARM_SINGLE_ARMV7M
-	help
-	  This enables support for Freescale i.MXRT Crossover processor.
-
 config SOC_VF610
 	bool "Vybrid Family VF610 support"
 	select ARM_GIC if ARCH_MULTI_V7
diff --git a/arch/arm/mach-imx/Makefile b/arch/arm/mach-imx/Makefile
index 5c650bf40e024..b14e9a0ec7501 100644
--- a/arch/arm/mach-imx/Makefile
+++ b/arch/arm/mach-imx/Makefile
@@ -60,8 +60,6 @@ obj-$(CONFIG_SOC_IMX50) += mach-imx50.o
 obj-$(CONFIG_SOC_IMX51) += mach-imx51.o
 obj-$(CONFIG_SOC_IMX53) += mach-imx53.o
 
-obj-$(CONFIG_SOC_IMXRT) += mach-imxrt.o
-
 obj-$(CONFIG_SOC_VF610) += mach-vf610.o
 
 obj-$(CONFIG_SOC_LS1021A) += mach-ls1021a.o
diff --git a/arch/arm/mach-imx/mach-imxrt.c b/arch/arm/mach-imx/mach-imxrt.c
deleted file mode 100644
index 2063a3059c849..0000000000000
--- a/arch/arm/mach-imx/mach-imxrt.c
+++ /dev/null
@@ -1,19 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Copyright (C) 2019
- * Author(s): Giulio Benetti <giulio.benetti@benettiengineering.com>
- */
-
-#include <linux/kernel.h>
-#include <asm/mach/arch.h>
-#include <asm/v7m.h>
-
-static const char *const imxrt_compat[] __initconst = {
-	"fsl,imxrt1050",
-	NULL
-};
-
-DT_MACHINE_START(IMXRTDT, "IMXRT (Device Tree Support)")
-	.dt_compat = imxrt_compat,
-	.restart = armv7m_restart,
-MACHINE_END

-- 
2.43.0


