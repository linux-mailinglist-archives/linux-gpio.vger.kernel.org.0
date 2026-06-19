Return-Path: <linux-gpio+bounces-38719-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sgYKOYJkNWr7uwYAu9opvQ
	(envelope-from <linux-gpio+bounces-38719-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Jun 2026 17:47:14 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 646626A6D0F
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Jun 2026 17:47:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b="iUZ/4Ab8";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38719-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38719-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 65234300D31F
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Jun 2026 15:42:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B146B3B3899;
	Fri, 19 Jun 2026 15:42:00 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011008.outbound.protection.outlook.com [52.101.65.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D85F93B52FF;
	Fri, 19 Jun 2026 15:41:51 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781883719; cv=fail; b=KMu/hyCWqFPBbBQwRfLICRhez7smAIEq+NGj3a1VrAnEOmMyrmtHkMw8yvYavgkIemcORK0PA0l/OzCsI/KqEW/VkS+2NsmzUuGcZ2tjmne3RRSeb/F3oMKo6lokq7yFAeYHq4wRFbnDWjlXVUcuDiAPPuAgrI2ceAd7ZKp0RdE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781883719; c=relaxed/simple;
	bh=LJmEu/Lok8W8aZOw2sMBEgaqgvktJZ5JH8ZOE+0EqnA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=S0RNL4Mztbs15sUCYMLU/nEy0i0l/RM7QtVjhYsGFskVHXFnnwsSNL9EGAtwP/WoR8/zC03vvlNnUd91Xj0HspxWOylVM6QXOuO5xnoacmf3QDGenbpEw2MSakMGmNVe2HIzK5476YsIoqZn/dVee4ICftmsBbCuuf1duds3xQY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=iUZ/4Ab8; arc=fail smtp.client-ip=52.101.65.8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HYyHJAMprbmyUeX/eyKLxi819vIjQdaaXbo3xL5+ECO1nc2NbAR69VZmoz4Sw2B63X1Np5yq8rHJ/fp+sSvG862lS83mDEAm7zgugYXQQCeI+Aet7dfU9qSEi+JzGgrKmku+n1UxIej39hUG5nt2uIx+CWGZwYXaHfuj3ptGdSwICwWf0/2/wWf16tUc5xs1CboU1kUL/r317X3a1ZuojZxK022t7X4HcaDp5yndoA0OubuWJG58Sn1Y3fpujaRfImbUCNP7noVFG+sV3ONW5TKvHidkaL4skJ4JN8moRCYg5d7jmf1l+UpppQPREKKdChQu6I3aKa5wHymd4fBH7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zfmCqNnjSIzwL4nsVzq8Eb+wS2MxaJA9rKk82viUn40=;
 b=kDne48B6ZiigEI0hV2gQZpYEiKTSCpF/28n13TvnazLUwgT60mvQW/9s1cZ4XBi4NyexFqHQsUcJTeJFUlr7MiJJV/RP82y/JKKdEIKdcIgYEDXSBQRZMK//lY+Q6hdxaX2XrLdGhPmli2MUT7wq0+qB7Hno0CY8IRwwIORhLjb8KM4WUmJLznXZXUJKeR6QEpD7OjFn+ycWQjRMGUCIEJzAJxOyEaU0D40F33jPxGo793PU0ikKEAXp07JSaqn0H5xv+IBpNqDuc3/OcSp+FEjAWHXnwkJef8CRoYRxHWmAL5p7iU+AbtJCL1WhzZusF0QR393cV4acFpanlAzzeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zfmCqNnjSIzwL4nsVzq8Eb+wS2MxaJA9rKk82viUn40=;
 b=iUZ/4Ab89EfE1tKvsEQQvf2tMmIYMUXH9+UDkRZKoiI4ZhEj5SQJxsvuyUpGkAJsOiSsgxoJZuizR7d+2uey3bEdLpMSYlmha3mzJfaYRl1ApWzPIqhal8MPAvIa75bkN117I/TgJ8CocMKQ0vNRjjNq6pglZet46QRglpd3gEVyFgHlF6WTOKpF9kPUsVjhWThFMPYlIKJ7tRzKN2MrTpywzZ6tqYkFaHUqEkqf3Ry1/957I4+tQUluheOGVNBsyJlIukef6+TEGSRQW1x/yNRyX7j2LoSYLC7BVy4f15x6C1rScP9BpchaMRKjr4GuJf3S/QdGubR69gXORvLj5w==
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM0PR04MB6818.eurprd04.prod.outlook.com (2603:10a6:208:186::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.13; Fri, 19 Jun
 2026 15:41:43 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0113.015; Fri, 19 Jun 2026
 15:41:43 +0000
From: Frank.Li@oss.nxp.com
Date: Fri, 19 Jun 2026 11:41:02 -0400
Subject: [PATCH 05/11] pinctrl: freescale: IMXRT: Remove NOMMU platform
 support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260619-dts_cleanup_arm_mcore-v1-5-0101795a2662@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781883675; l=30820;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=rEundGioiHZHL1aI73BlNhtXsXVCvmX9iAwWtVaP5k0=;
 b=KMkI59XPmkrxuuW94sXba6YDZ1dSuXvPDoci5m+sWgEjOWc9Hbq5QEMc5kWpNddYzUxNFi7cW
 3eoqlaA7Iu+BiF8MaAutBSpFlg39sAmJd7H63FkPwlXt7qnQi+hhIrp
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SN7PR04CA0088.namprd04.prod.outlook.com
 (2603:10b6:806:121::33) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM0PR04MB6818:EE_
X-MS-Office365-Filtering-Correlation-Id: 85e0ae9a-3a2a-497d-a02a-08dece194318
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|7416014|376014|19092799006|56012099006|11063799006|6133799003|22082099003|18002099003|3023799007|921020|13003099007;
X-Microsoft-Antispam-Message-Info:
	lpom2uo+etXS403XAb2uvnLAJmimqiJJo8hZuV5ngD/oEqHjPDFD7dLQkeX10jaQR5FAltIBDLCSPoIWLvrmC2baS0PMIpHDIlEVgkd+uMtalED2Gnyl3rH2dvkcYwSPoQx8FYj5EjK8fD8lk0GW24u2IghHM/6xklPhSr6RRPWHuFryn6cMxyDjknaTFMJWpoUVgBud/tbcV19Z1P3uJN/s/kH3viGYXBJ3tW1rKBfByRxZ4Ele1spwMjznCz3dWVj4DhS2HvJVTaorlZfo1WzL97th4jJfvYzX1sSt647j6hCkJJNJK26DslaXq+bbwLbaj02NjBsd6WKvKf3f2RYdENi9u296VMgYaZrKJMaP62lscTo7uo9hHYZiTVMn+DwHCinVRq4xeJ7OogmWXK7XErP4QAfL8na6LowZhT8wqI8b7rQXHRoaq7+ueleZG/j2kyfT43YMqNAjKO5qUR1kvj6+eLgCA6k19BQ0Zr2LrBqINVAUGab3LhNUKN2VNwnv/pj8je8yQYioUlycM5sm9dYWK1tCzXEPqJBpC9wJWSCnlzo1OXZWX16keAHrDP7f/GgV32FPkH/pg9GyUr4W5Jpj5gudp0A+UgKWxqc1E1HjB1fYnrgKyl1/prhhG/SoPswEKDxDmWeAfT5wvJqcl9w38slsKIrwDHF0pVE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(7416014)(376014)(19092799006)(56012099006)(11063799006)(6133799003)(22082099003)(18002099003)(3023799007)(921020)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?elJTdVArdm41WFI0VkEvcTVWQnpPK0krbEpHRUhsMkFTY2Y3YmgwL2V4Rlhi?=
 =?utf-8?B?bC9uRHlqeWlWZDhaYVVOM0Vhd1YvQm8ra0g4QU5wWDhkSm1iYzNlYTBEaUdU?=
 =?utf-8?B?b2V4MmxEd3hWNmk1TFU0UzZOcllxcVhKYVRXZHo5TW9TRVBuaGZaQmFLRDlN?=
 =?utf-8?B?Ymt4N3lHSnEyRTh4WC9HRTVUMlZWVkxpTDJoZlFMN0N4WlBPZHQ4UHpwazk4?=
 =?utf-8?B?NnZSeFJOM0VrYnlaN3YwVkdIdDRqK0FWNmZ0NkN6dzRXYk04UE5Eek9JM3BC?=
 =?utf-8?B?MXhhNVhhRStPWU4vVkNJV3NSMkh6SWlxaXBHalpCVGRaL3ZmNUUwMGh0ZGI2?=
 =?utf-8?B?TVB6QWVxdXZSTmZFQjkvNFcwZ3cwcU9jSXRkQk9vZDU3dzUvOUgvZU93T3Zj?=
 =?utf-8?B?UUVWZGdtRFFEa0Y3WFM0N3RiOE55TG9LYXVLNTVJNDUxbWsvT2E5WWh0aEtz?=
 =?utf-8?B?eXl4bSt1TVNONnFqd1VVZGtqamVxZ0R5UStnUFFHc3VzSWpsY2s4RXNOSmZF?=
 =?utf-8?B?NzlDT1RLTDhEUHNHNU5Hcnh1a0NNL0RVVVc2dnNiU01jeUhJK083NU1WcHky?=
 =?utf-8?B?U2VFYmlydEROS3I2MEViVCtVNVN3bVNDdktZekdsNzFFVWJBbVJIVVJSMTIw?=
 =?utf-8?B?eUJmZHBVNUlxQ2xjaWdydVdPeFlqcXNmNnpZZjBabXhYRlA3bnhmc1F4K2dv?=
 =?utf-8?B?cVQrWFFnNElCOEthRysvdkd1VWVuMkZaVGJ5L1IxbTN4alJBbmU1UE42Q2pW?=
 =?utf-8?B?aUQwV1U3VHllTE1oenJycU5oTmpmQWgyeXNFeVY2Y3RXNUlqRi9vckkrd2Fr?=
 =?utf-8?B?djFqemlGd0VCVUViMkN4ZkxnZmR6TkFwTXREL2U4VlJIZHZGMzd4c3dwQUw4?=
 =?utf-8?B?RXJWU0tlU0cyMlhQOXF4SjYydmlXeGxVQW9pc1YvTmVkbyt0LytCR3g0N3JB?=
 =?utf-8?B?TFlWYTI4WDhvT3BZbVV1aWZHeTl0SWRSL1V5VDhtL0IzcDJYMlB1MmI5cERz?=
 =?utf-8?B?THRJY2RFblFQOGRFaGM2ZTltQjZucUlLTFlCVlFKUis5OTJ3N1RzaU5RbWlO?=
 =?utf-8?B?bytuMUtTZmtVUE5OMTloVldlL2lhS3RYdWVSeDl1K2l0cUxFWXBWTDZqcnZZ?=
 =?utf-8?B?d2NBNFBwQngrNjVLVnp6SlVFQVM4WHphdENkdkt0bU85dzhSSnFxTkEzd3Zj?=
 =?utf-8?B?eTl5anNTMkwwRHpRNHVEdyt2WXJjMlhpZ2xuS3UvaHhkK0VzRmV4d2FBRUZG?=
 =?utf-8?B?STdGZTVZNlEydEJMejA3OXdOc29vcEUyNndYaUczTXZLdERwUVlOM294RXZF?=
 =?utf-8?B?aXFjR1RLM2o2UEttRnVQNERhUWpRN1Z4elNQQlVNSXF4WkxNaTZicjJwdldt?=
 =?utf-8?B?Q2hBb0VLWTRJdHRaNDh6QWtTTkpwUHdwbktOd1J2d3BEa0J4UmpwYmozSjJU?=
 =?utf-8?B?UFBpTUJxaWR5TWc2Rm56bFI4US84OW1Rb1ZzNkM0Q1VjeHllQnVMWk5yc2pG?=
 =?utf-8?B?NlY4L3hmSjlBd1Z5ZlArS2M2TkgyYnZ6UEcyd0pHbUEwaWFVcmJCZmY2c0ZS?=
 =?utf-8?B?Mk0vQ3FhRmZlT1EvS2tad0h2VW9tNmlDUU5vRXB2dHNiT3c3bUZjcm1TbERK?=
 =?utf-8?B?cW9BZWg2NWJuWHg3bUtXcnpPOEQ5NWdXQ3dWSVNFTlZJQmMxYVhHWnhMdmRn?=
 =?utf-8?B?elhyVDNyOXpSc1owQ2FSVVQ2WG9NaDdpNVJPcTY0N0NHdFRUREpRQlIrV1dN?=
 =?utf-8?B?QzFkcUJBaHBBbnlYVkZ6VWpMaE16dCtyM0g0SlN2anAxNXVsVU5rOHBFdG5k?=
 =?utf-8?B?bjhOVnhqOE9xVDA2SGYrbCsrR1Zic3FYTXdMTVdVVS81NU0vcHdoVEhWTUtC?=
 =?utf-8?B?am5LYUtOZ2ZDcjQwQ3dCRGRBVDdDVlBtMjlwU3ZOL0RIbVNmQ1hpYzhHYXFB?=
 =?utf-8?B?cTEzZ3RUbjlGdU1vMGRMT3V3M21wNlZnakFaSmdLbnRzaVlWNTdtMXZnbjI3?=
 =?utf-8?B?andXM0tvVWZrd0FJaXk4UzFxa2hsUk1YSTNLMXRmV1hGQTlOeEppbERRTU1H?=
 =?utf-8?B?UzRFR0VxbVBpVlBvcXhEN3lFL0tUQkEvaFN0bzd6SGFVZEZzL3hUWGpCRVR1?=
 =?utf-8?B?Ty9ucFNyZnlQTkJpVVA1RTgxZkZYcXlFZTBFdFVPbkNrWVliM1VMenlIRjRJ?=
 =?utf-8?B?REFiZEFoT2ZDaXl5NEszMWVRZTJRTUlJRXBPM2Nub0QrUm92OW93UGdQcUll?=
 =?utf-8?B?K2YzRHlMa2tiUG5FNmg0RWx4Z3FweTVNMDZYRVRhL0czZmNZMkM5Q3NsbTJs?=
 =?utf-8?B?WXN2YkpGemsrV0w3WURkM1praHpEQzRwd0FFOU1uWTAyN1htL2hoU1lBNHRF?=
 =?utf-8?Q?kcJ4UsXFvJZ13dDCzwHql1XYyiMD9ahqqd9Sn?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85e0ae9a-3a2a-497d-a02a-08dece194318
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 15:41:43.1198
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yUgmALt8S+K4w5PFtjjHsvvRfpUYtYwsroIRrcmJG4drdGOkingLRuS7KZcX9OKRS5vRxJPTtM2UORmetbwbCn6nMNKBAOgb/gQqDWeXRtkP6BYVFXEZKL8MzjQFKBmk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6818
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:arnd@arndb.de,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:stefan@agner.ch,m:festevam@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux@armlinux.org.uk,m:abelvesa@kernel.org,m:peng.fan@nxp.com,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:aisheng.dong@nxp.com,m:ping.bai@nxp.com,m:s32@nxp.com,m:linusw@kernel.org,m:vz@mleia.com,m:piotr.wojtaszczyk@timesys.com,m:kees@kernel.org,m:gustavoars@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:imx@lists.linux.dev,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:Frank.Li@nxp.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-38719-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.nxp.com:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,nxp.com:mid,nxp.com:email,i.mx:url,benettiengineering.com:email,NXP1.onmicrosoft.com:dkim,devicetree.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 646626A6D0F

From: Frank Li <Frank.Li@nxp.com>

Commercial users and hardware vendors migrated to Zephyr or other RTOS
solutions years ago, leaving the NOMMU platform support effectively
unused and unmaintained.

Remove the obsolete support to reduce maintenance burden and simplify the
i.MX platform code.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../devicetree/bindings/pinctrl/fsl,imxrt1050.yaml |  79 -----
 .../devicetree/bindings/pinctrl/fsl,imxrt1170.yaml |  77 -----
 drivers/pinctrl/freescale/Kconfig                  |  16 -
 drivers/pinctrl/freescale/Makefile                 |   2 -
 drivers/pinctrl/freescale/pinctrl-imxrt1050.c      | 309 ------------------
 drivers/pinctrl/freescale/pinctrl-imxrt1170.c      | 349 ---------------------
 6 files changed, 832 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,imxrt1050.yaml b/Documentation/devicetree/bindings/pinctrl/fsl,imxrt1050.yaml
deleted file mode 100644
index db5fe66ad8733..0000000000000
--- a/Documentation/devicetree/bindings/pinctrl/fsl,imxrt1050.yaml
+++ /dev/null
@@ -1,79 +0,0 @@
-# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/pinctrl/fsl,imxrt1050.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: Freescale IMXRT1050 IOMUX Controller
-
-maintainers:
-  - Giulio Benetti <giulio.benetti@benettiengineering.com>
-  - Jesse Taube <Mr.Bossman075@gmail.com>
-
-description:
-  Please refer to fsl,imx-pinctrl.txt and pinctrl-bindings.txt in this directory
-  for common binding part and usage.
-
-properties:
-  compatible:
-    const: fsl,imxrt1050-iomuxc
-
-  reg:
-    maxItems: 1
-
-# Client device subnode's properties
-patternProperties:
-  'grp$':
-    type: object
-    description:
-      Pinctrl node's client devices use subnodes for desired pin configuration.
-      Client device subnodes use below standard properties.
-
-    properties:
-      fsl,pins:
-        description:
-          each entry consists of 6 integers and represents the mux and config
-          setting for one pin. The first 5 integers <mux_reg conf_reg input_reg
-          mux_val input_val> are specified using a PIN_FUNC_ID macro, which can
-          be found in <arch/arm/boot/dts/imxrt1050-pinfunc.h>. The last
-          integer CONFIG is the pad setting value like pull-up on this pin. Please
-          refer to i.MXRT1050 Reference Manual for detailed CONFIG settings.
-        $ref: /schemas/types.yaml#/definitions/uint32-matrix
-        items:
-          items:
-            - description: |
-                "mux_reg" indicates the offset of mux register.
-            - description: |
-                "conf_reg" indicates the offset of pad configuration register.
-            - description: |
-                "input_reg" indicates the offset of select input register.
-            - description: |
-                "mux_val" indicates the mux value to be applied.
-            - description: |
-                "input_val" indicates the select input value to be applied.
-            - description: |
-                "pad_setting" indicates the pad configuration value to be applied.
-
-    required:
-      - fsl,pins
-
-    additionalProperties: false
-
-required:
-  - compatible
-  - reg
-
-additionalProperties: false
-
-examples:
-  - |
-    iomuxc: iomuxc@401f8000 {
-        compatible = "fsl,imxrt1050-iomuxc";
-        reg = <0x401f8000 0x4000>;
-
-        pinctrl_lpuart1: lpuart1grp {
-            fsl,pins =
-              <0x0EC 0x2DC 0x000 0x2 0x0	0xf1>,
-              <0x0F0 0x2E0 0x000 0x2 0x0	0xf1>;
-        };
-    };
diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,imxrt1170.yaml b/Documentation/devicetree/bindings/pinctrl/fsl,imxrt1170.yaml
deleted file mode 100644
index 2e880b3e537c1..0000000000000
--- a/Documentation/devicetree/bindings/pinctrl/fsl,imxrt1170.yaml
+++ /dev/null
@@ -1,77 +0,0 @@
-# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/pinctrl/fsl,imxrt1170.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: Freescale i.MXRT1170 IOMUX Controller
-
-maintainers:
-  - Giulio Benetti <giulio.benetti@benettiengineering.com>
-  - Jesse Taube <Mr.Bossman075@gmail.com>
-
-description:
-  Please refer to fsl,imx-pinctrl.txt and pinctrl-bindings.txt in this directory
-  for common binding part and usage.
-
-properties:
-  compatible:
-    const: fsl,imxrt1170-iomuxc
-
-  reg:
-    maxItems: 1
-
-# Client device subnode's properties
-patternProperties:
-  'grp$':
-    type: object
-    description:
-      Pinctrl node's client devices use subnodes for desired pin configuration.
-      Client device subnodes use below standard properties.
-
-    properties:
-      fsl,pins:
-        description:
-          each entry consists of 6 integers and represents the mux and config
-          setting for one pin. The first 5 integers <mux_reg conf_reg input_reg
-          mux_val input_val> are specified using a PIN_FUNC_ID macro, which can
-          be found in <arch/arm/boot/dts/imxrt1170-pinfunc.h>. The last
-          integer CONFIG is the pad setting value like pull-up on this pin. Please
-          refer to i.MXRT1170 Reference Manual for detailed CONFIG settings.
-        $ref: /schemas/types.yaml#/definitions/uint32-matrix
-        items:
-          items:
-            - description: |
-                "mux_reg" indicates the offset of mux register.
-            - description: |
-                "conf_reg" indicates the offset of pad configuration register.
-            - description: |
-                "input_reg" indicates the offset of select input register.
-            - description: |
-                "mux_val" indicates the mux value to be applied.
-            - description: |
-                "input_val" indicates the select input value to be applied.
-            - description: |
-                "pad_setting" indicates the pad configuration value to be applied.
-    required:
-      - fsl,pins
-
-    additionalProperties: false
-
-required:
-  - compatible
-  - reg
-
-additionalProperties: false
-
-examples:
-  - |
-    iomuxc: iomuxc@400e8000 {
-        compatible = "fsl,imxrt1170-iomuxc";
-        reg = <0x400e8000 0x4000>;
-        pinctrl_lpuart1: lpuart1grp {
-            fsl,pins =
-              <0x16C 0x3B0 0x620 0x0 0x0  0xf1>,
-              <0x170 0x3B4 0x61C 0x0 0x0	0xf1>;
-        };
-    };
diff --git a/drivers/pinctrl/freescale/Kconfig b/drivers/pinctrl/freescale/Kconfig
index fd53cf5bb843d..9baf222abdecf 100644
--- a/drivers/pinctrl/freescale/Kconfig
+++ b/drivers/pinctrl/freescale/Kconfig
@@ -229,15 +229,6 @@ config PINCTRL_IMX8ULP
 	help
 	  Say Y here to enable the imx8ulp pinctrl driver
 
-config PINCTRL_IMXRT1050
-	bool "IMXRT1050 pinctrl driver"
-	depends on OF
-	depends on SOC_IMXRT || COMPILE_TEST
-	default SOC_IMXRT
-	select PINCTRL_IMX
-	help
-	  Say Y here to enable the imxrt1050 pinctrl driver
-
 config PINCTRL_IMX91
 	tristate "IMX91 pinctrl driver"
 	depends on ARCH_MXC
@@ -276,10 +267,3 @@ config PINCTRL_IMX28
 	bool
 	select PINCTRL_MXS
 
-config PINCTRL_IMXRT1170
-	bool "IMXRT1170 pinctrl driver"
-	depends on OF
-	depends on SOC_IMXRT || COMPILE_TEST
-	select PINCTRL_IMX
-	help
-	  Say Y here to enable the imxrt1170 pinctrl driver
diff --git a/drivers/pinctrl/freescale/Makefile b/drivers/pinctrl/freescale/Makefile
index d27085c2b4c45..72de53db68eb8 100644
--- a/drivers/pinctrl/freescale/Makefile
+++ b/drivers/pinctrl/freescale/Makefile
@@ -33,5 +33,3 @@ obj-$(CONFIG_PINCTRL_MXS)	+= pinctrl-mxs.o
 obj-$(CONFIG_PINCTRL_IMX23)	+= pinctrl-imx23.o
 obj-$(CONFIG_PINCTRL_IMX25)	+= pinctrl-imx25.o
 obj-$(CONFIG_PINCTRL_IMX28)	+= pinctrl-imx28.o
-obj-$(CONFIG_PINCTRL_IMXRT1050)	+= pinctrl-imxrt1050.o
-obj-$(CONFIG_PINCTRL_IMXRT1170)	+= pinctrl-imxrt1170.o
diff --git a/drivers/pinctrl/freescale/pinctrl-imxrt1050.c b/drivers/pinctrl/freescale/pinctrl-imxrt1050.c
deleted file mode 100644
index f6435227d4fbb..0000000000000
--- a/drivers/pinctrl/freescale/pinctrl-imxrt1050.c
+++ /dev/null
@@ -1,309 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Copyright (C) 2020
- * Author(s): Giulio Benetti <giulio.benetti@benettiengineering.com>
- */
-
-#include <linux/err.h>
-#include <linux/init.h>
-#include <linux/of.h>
-#include <linux/pinctrl/pinctrl.h>
-#include <linux/platform_device.h>
-
-#include "pinctrl-imx.h"
-
-enum imxrt1050_pads {
-	IMXRT1050_PAD_RESERVE0,
-	IMXRT1050_PAD_RESERVE1,
-	IMXRT1050_PAD_RESERVE2,
-	IMXRT1050_PAD_RESERVE3,
-	IMXRT1050_PAD_RESERVE4,
-	IMXRT1050_PAD_EMC_00,
-	IMXRT1050_PAD_EMC_01,
-	IMXRT1050_PAD_EMC_02,
-	IMXRT1050_PAD_EMC_03,
-	IMXRT1050_PAD_EMC_04,
-	IMXRT1050_PAD_EMC_05,
-	IMXRT1050_PAD_EMC_06,
-	IMXRT1050_PAD_EMC_07,
-	IMXRT1050_PAD_EMC_08,
-	IMXRT1050_PAD_EMC_09,
-	IMXRT1050_PAD_EMC_10,
-	IMXRT1050_PAD_EMC_11,
-	IMXRT1050_PAD_EMC_12,
-	IMXRT1050_PAD_EMC_13,
-	IMXRT1050_PAD_EMC_14,
-	IMXRT1050_PAD_EMC_15,
-	IMXRT1050_PAD_EMC_16,
-	IMXRT1050_PAD_EMC_17,
-	IMXRT1050_PAD_EMC_18,
-	IMXRT1050_PAD_EMC_19,
-	IMXRT1050_PAD_EMC_20,
-	IMXRT1050_PAD_EMC_21,
-	IMXRT1050_PAD_EMC_22,
-	IMXRT1050_PAD_EMC_23,
-	IMXRT1050_PAD_EMC_24,
-	IMXRT1050_PAD_EMC_25,
-	IMXRT1050_PAD_EMC_26,
-	IMXRT1050_PAD_EMC_27,
-	IMXRT1050_PAD_EMC_28,
-	IMXRT1050_PAD_EMC_29,
-	IMXRT1050_PAD_EMC_30,
-	IMXRT1050_PAD_EMC_31,
-	IMXRT1050_PAD_EMC_32,
-	IMXRT1050_PAD_EMC_33,
-	IMXRT1050_PAD_EMC_34,
-	IMXRT1050_PAD_EMC_35,
-	IMXRT1050_PAD_EMC_36,
-	IMXRT1050_PAD_EMC_37,
-	IMXRT1050_PAD_EMC_38,
-	IMXRT1050_PAD_EMC_39,
-	IMXRT1050_PAD_EMC_40,
-	IMXRT1050_PAD_EMC_41,
-	IMXRT1050_PAD_AD_B0_00,
-	IMXRT1050_PAD_AD_B0_01,
-	IMXRT1050_PAD_AD_B0_02,
-	IMXRT1050_PAD_AD_B0_03,
-	IMXRT1050_PAD_AD_B0_04,
-	IMXRT1050_PAD_AD_B0_05,
-	IMXRT1050_PAD_AD_B0_06,
-	IMXRT1050_PAD_AD_B0_07,
-	IMXRT1050_PAD_AD_B0_08,
-	IMXRT1050_PAD_AD_B0_09,
-	IMXRT1050_PAD_AD_B0_10,
-	IMXRT1050_PAD_AD_B0_11,
-	IMXRT1050_PAD_AD_B0_12,
-	IMXRT1050_PAD_AD_B0_13,
-	IMXRT1050_PAD_AD_B0_14,
-	IMXRT1050_PAD_AD_B0_15,
-	IMXRT1050_PAD_AD_B1_00,
-	IMXRT1050_PAD_AD_B1_01,
-	IMXRT1050_PAD_AD_B1_02,
-	IMXRT1050_PAD_AD_B1_03,
-	IMXRT1050_PAD_AD_B1_04,
-	IMXRT1050_PAD_AD_B1_05,
-	IMXRT1050_PAD_AD_B1_06,
-	IMXRT1050_PAD_AD_B1_07,
-	IMXRT1050_PAD_AD_B1_08,
-	IMXRT1050_PAD_AD_B1_09,
-	IMXRT1050_PAD_AD_B1_10,
-	IMXRT1050_PAD_AD_B1_11,
-	IMXRT1050_PAD_AD_B1_12,
-	IMXRT1050_PAD_AD_B1_13,
-	IMXRT1050_PAD_AD_B1_14,
-	IMXRT1050_PAD_AD_B1_15,
-	IMXRT1050_PAD_B0_00,
-	IMXRT1050_PAD_B0_01,
-	IMXRT1050_PAD_B0_02,
-	IMXRT1050_PAD_B0_03,
-	IMXRT1050_PAD_B0_04,
-	IMXRT1050_PAD_B0_05,
-	IMXRT1050_PAD_B0_06,
-	IMXRT1050_PAD_B0_07,
-	IMXRT1050_PAD_B0_08,
-	IMXRT1050_PAD_B0_09,
-	IMXRT1050_PAD_B0_10,
-	IMXRT1050_PAD_B0_11,
-	IMXRT1050_PAD_B0_12,
-	IMXRT1050_PAD_B0_13,
-	IMXRT1050_PAD_B0_14,
-	IMXRT1050_PAD_B0_15,
-	IMXRT1050_PAD_B1_00,
-	IMXRT1050_PAD_B1_01,
-	IMXRT1050_PAD_B1_02,
-	IMXRT1050_PAD_B1_03,
-	IMXRT1050_PAD_B1_04,
-	IMXRT1050_PAD_B1_05,
-	IMXRT1050_PAD_B1_06,
-	IMXRT1050_PAD_B1_07,
-	IMXRT1050_PAD_B1_08,
-	IMXRT1050_PAD_B1_09,
-	IMXRT1050_PAD_B1_10,
-	IMXRT1050_PAD_B1_11,
-	IMXRT1050_PAD_B1_12,
-	IMXRT1050_PAD_B1_13,
-	IMXRT1050_PAD_B1_14,
-	IMXRT1050_PAD_B1_15,
-	IMXRT1050_PAD_SD_B0_00,
-	IMXRT1050_PAD_SD_B0_01,
-	IMXRT1050_PAD_SD_B0_02,
-	IMXRT1050_PAD_SD_B0_03,
-	IMXRT1050_PAD_SD_B0_04,
-	IMXRT1050_PAD_SD_B0_05,
-	IMXRT1050_PAD_SD_B1_00,
-	IMXRT1050_PAD_SD_B1_01,
-	IMXRT1050_PAD_SD_B1_02,
-	IMXRT1050_PAD_SD_B1_03,
-	IMXRT1050_PAD_SD_B1_04,
-	IMXRT1050_PAD_SD_B1_05,
-	IMXRT1050_PAD_SD_B1_06,
-	IMXRT1050_PAD_SD_B1_07,
-	IMXRT1050_PAD_SD_B1_08,
-	IMXRT1050_PAD_SD_B1_09,
-	IMXRT1050_PAD_SD_B1_10,
-	IMXRT1050_PAD_SD_B1_11,
-};
-
-/* Pad names for the pinmux subsystem */
-static const struct pinctrl_pin_desc imxrt1050_pinctrl_pads[] = {
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_RESERVE0),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_RESERVE1),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_RESERVE2),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_RESERVE3),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_RESERVE4),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_EMC_00),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_EMC_01),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_EMC_02),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_EMC_03),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_EMC_04),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_EMC_05),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_EMC_06),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_EMC_07),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_EMC_08),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_EMC_09),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_EMC_10),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_EMC_11),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_EMC_12),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_EMC_13),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_EMC_14),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_EMC_15),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_EMC_16),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_EMC_17),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_EMC_18),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_EMC_19),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_EMC_20),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_EMC_21),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_EMC_22),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_EMC_23),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_EMC_24),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_EMC_25),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_EMC_26),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_EMC_27),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_EMC_28),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_EMC_29),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_EMC_30),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_EMC_31),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_EMC_32),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_EMC_33),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_EMC_34),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_EMC_35),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_EMC_36),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_EMC_37),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_EMC_38),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_EMC_39),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_EMC_40),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_EMC_41),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_AD_B0_00),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_AD_B0_01),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_AD_B0_02),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_AD_B0_03),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_AD_B0_04),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_AD_B0_05),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_AD_B0_06),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_AD_B0_07),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_AD_B0_08),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_AD_B0_09),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_AD_B0_10),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_AD_B0_11),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_AD_B0_12),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_AD_B0_13),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_AD_B0_14),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_AD_B0_15),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_AD_B1_00),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_AD_B1_01),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_AD_B1_02),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_AD_B1_03),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_AD_B1_04),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_AD_B1_05),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_AD_B1_06),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_AD_B1_07),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_AD_B1_08),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_AD_B1_09),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_AD_B1_10),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_AD_B1_11),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_AD_B1_12),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_AD_B1_13),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_AD_B1_14),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_AD_B1_15),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_B0_00),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_B0_01),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_B0_02),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_B0_03),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_B0_04),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_B0_05),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_B0_06),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_B0_07),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_B0_08),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_B0_09),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_B0_10),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_B0_11),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_B0_12),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_B0_13),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_B0_14),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_B0_15),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_B1_00),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_B1_01),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_B1_02),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_B1_03),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_B1_04),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_B1_05),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_B1_06),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_B1_07),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_B1_08),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_B1_09),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_B1_10),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_B1_11),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_B1_12),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_B1_13),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_B1_14),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_B1_15),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_SD_B0_00),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_SD_B0_01),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_SD_B0_02),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_SD_B0_03),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_SD_B0_04),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_SD_B0_05),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_SD_B1_00),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_SD_B1_01),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_SD_B1_02),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_SD_B1_03),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_SD_B1_04),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_SD_B1_05),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_SD_B1_06),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_SD_B1_07),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_SD_B1_08),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_SD_B1_09),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_SD_B1_10),
-	IMX_PINCTRL_PIN(IMXRT1050_PAD_SD_B1_11),
-};
-
-static const struct imx_pinctrl_soc_info imxrt1050_pinctrl_info = {
-	.pins = imxrt1050_pinctrl_pads,
-	.npins = ARRAY_SIZE(imxrt1050_pinctrl_pads),
-	.gpr_compatible = "fsl,imxrt1050-iomuxc-gpr",
-};
-
-static const struct of_device_id imxrt1050_pinctrl_of_match[] = {
-	{ .compatible = "fsl,imxrt1050-iomuxc", .data = &imxrt1050_pinctrl_info, },
-	{ /* sentinel */ }
-};
-
-static int imxrt1050_pinctrl_probe(struct platform_device *pdev)
-{
-	return imx_pinctrl_probe(pdev, &imxrt1050_pinctrl_info);
-}
-
-static struct platform_driver imxrt1050_pinctrl_driver = {
-	.driver = {
-		.name = "imxrt1050-pinctrl",
-		.of_match_table = of_match_ptr(imxrt1050_pinctrl_of_match),
-		.suppress_bind_attrs = true,
-	},
-	.probe = imxrt1050_pinctrl_probe,
-};
-
-static int __init imxrt1050_pinctrl_init(void)
-{
-	return platform_driver_register(&imxrt1050_pinctrl_driver);
-}
-arch_initcall(imxrt1050_pinctrl_init);
diff --git a/drivers/pinctrl/freescale/pinctrl-imxrt1170.c b/drivers/pinctrl/freescale/pinctrl-imxrt1170.c
deleted file mode 100644
index d8857f329e253..0000000000000
--- a/drivers/pinctrl/freescale/pinctrl-imxrt1170.c
+++ /dev/null
@@ -1,349 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Copyright (C) 2022
- * Author(s): Jesse Taube <Mr.Bossman075@gmail.com>
- */
-
-#include <linux/err.h>
-#include <linux/init.h>
-#include <linux/of.h>
-#include <linux/pinctrl/pinctrl.h>
-#include <linux/platform_device.h>
-
-#include "pinctrl-imx.h"
-
-enum imxrt1170_pads {
-	IMXRT1170_PAD_RESERVE0,
-	IMXRT1170_PAD_RESERVE1,
-	IMXRT1170_PAD_RESERVE2,
-	IMXRT1170_PAD_RESERVE3,
-	IMXRT1170_PAD_EMC_B1_00,
-	IMXRT1170_PAD_EMC_B1_01,
-	IMXRT1170_PAD_EMC_B1_02,
-	IMXRT1170_PAD_EMC_B1_03,
-	IMXRT1170_PAD_EMC_B1_04,
-	IMXRT1170_PAD_EMC_B1_05,
-	IMXRT1170_PAD_EMC_B1_06,
-	IMXRT1170_PAD_EMC_B1_07,
-	IMXRT1170_PAD_EMC_B1_08,
-	IMXRT1170_PAD_EMC_B1_09,
-	IMXRT1170_PAD_EMC_B1_10,
-	IMXRT1170_PAD_EMC_B1_11,
-	IMXRT1170_PAD_EMC_B1_12,
-	IMXRT1170_PAD_EMC_B1_13,
-	IMXRT1170_PAD_EMC_B1_14,
-	IMXRT1170_PAD_EMC_B1_15,
-	IMXRT1170_PAD_EMC_B1_16,
-	IMXRT1170_PAD_EMC_B1_17,
-	IMXRT1170_PAD_EMC_B1_18,
-	IMXRT1170_PAD_EMC_B1_19,
-	IMXRT1170_PAD_EMC_B1_20,
-	IMXRT1170_PAD_EMC_B1_21,
-	IMXRT1170_PAD_EMC_B1_22,
-	IMXRT1170_PAD_EMC_B1_23,
-	IMXRT1170_PAD_EMC_B1_24,
-	IMXRT1170_PAD_EMC_B1_25,
-	IMXRT1170_PAD_EMC_B1_26,
-	IMXRT1170_PAD_EMC_B1_27,
-	IMXRT1170_PAD_EMC_B1_28,
-	IMXRT1170_PAD_EMC_B1_29,
-	IMXRT1170_PAD_EMC_B1_30,
-	IMXRT1170_PAD_EMC_B1_31,
-	IMXRT1170_PAD_EMC_B1_32,
-	IMXRT1170_PAD_EMC_B1_33,
-	IMXRT1170_PAD_EMC_B1_34,
-	IMXRT1170_PAD_EMC_B1_35,
-	IMXRT1170_PAD_EMC_B1_36,
-	IMXRT1170_PAD_EMC_B1_37,
-	IMXRT1170_PAD_EMC_B1_38,
-	IMXRT1170_PAD_EMC_B1_39,
-	IMXRT1170_PAD_EMC_B1_40,
-	IMXRT1170_PAD_EMC_B1_41,
-	IMXRT1170_PAD_EMC_B2_00,
-	IMXRT1170_PAD_EMC_B2_01,
-	IMXRT1170_PAD_EMC_B2_02,
-	IMXRT1170_PAD_EMC_B2_03,
-	IMXRT1170_PAD_EMC_B2_04,
-	IMXRT1170_PAD_EMC_B2_05,
-	IMXRT1170_PAD_EMC_B2_06,
-	IMXRT1170_PAD_EMC_B2_07,
-	IMXRT1170_PAD_EMC_B2_08,
-	IMXRT1170_PAD_EMC_B2_09,
-	IMXRT1170_PAD_EMC_B2_10,
-	IMXRT1170_PAD_EMC_B2_11,
-	IMXRT1170_PAD_EMC_B2_12,
-	IMXRT1170_PAD_EMC_B2_13,
-	IMXRT1170_PAD_EMC_B2_14,
-	IMXRT1170_PAD_EMC_B2_15,
-	IMXRT1170_PAD_EMC_B2_16,
-	IMXRT1170_PAD_EMC_B2_17,
-	IMXRT1170_PAD_EMC_B2_18,
-	IMXRT1170_PAD_EMC_B2_19,
-	IMXRT1170_PAD_EMC_B2_20,
-	IMXRT1170_PAD_AD_00,
-	IMXRT1170_PAD_AD_01,
-	IMXRT1170_PAD_AD_02,
-	IMXRT1170_PAD_AD_03,
-	IMXRT1170_PAD_AD_04,
-	IMXRT1170_PAD_AD_05,
-	IMXRT1170_PAD_AD_06,
-	IMXRT1170_PAD_AD_07,
-	IMXRT1170_PAD_AD_08,
-	IMXRT1170_PAD_AD_09,
-	IMXRT1170_PAD_AD_10,
-	IMXRT1170_PAD_AD_11,
-	IMXRT1170_PAD_AD_12,
-	IMXRT1170_PAD_AD_13,
-	IMXRT1170_PAD_AD_14,
-	IMXRT1170_PAD_AD_15,
-	IMXRT1170_PAD_AD_16,
-	IMXRT1170_PAD_AD_17,
-	IMXRT1170_PAD_AD_18,
-	IMXRT1170_PAD_AD_19,
-	IMXRT1170_PAD_AD_20,
-	IMXRT1170_PAD_AD_21,
-	IMXRT1170_PAD_AD_22,
-	IMXRT1170_PAD_AD_23,
-	IMXRT1170_PAD_AD_24,
-	IMXRT1170_PAD_AD_25,
-	IMXRT1170_PAD_AD_26,
-	IMXRT1170_PAD_AD_27,
-	IMXRT1170_PAD_AD_28,
-	IMXRT1170_PAD_AD_29,
-	IMXRT1170_PAD_AD_30,
-	IMXRT1170_PAD_AD_31,
-	IMXRT1170_PAD_AD_32,
-	IMXRT1170_PAD_AD_33,
-	IMXRT1170_PAD_AD_34,
-	IMXRT1170_PAD_AD_35,
-	IMXRT1170_PAD_SD_B1_00,
-	IMXRT1170_PAD_SD_B1_01,
-	IMXRT1170_PAD_SD_B1_02,
-	IMXRT1170_PAD_SD_B1_03,
-	IMXRT1170_PAD_SD_B1_04,
-	IMXRT1170_PAD_SD_B1_05,
-	IMXRT1170_PAD_SD_B2_00,
-	IMXRT1170_PAD_SD_B2_01,
-	IMXRT1170_PAD_SD_B2_02,
-	IMXRT1170_PAD_SD_B2_03,
-	IMXRT1170_PAD_SD_B2_04,
-	IMXRT1170_PAD_SD_B2_05,
-	IMXRT1170_PAD_SD_B2_06,
-	IMXRT1170_PAD_SD_B2_07,
-	IMXRT1170_PAD_SD_B2_08,
-	IMXRT1170_PAD_SD_B2_09,
-	IMXRT1170_PAD_SD_B2_10,
-	IMXRT1170_PAD_SD_B2_11,
-	IMXRT1170_PAD_DISP_B1_00,
-	IMXRT1170_PAD_DISP_B1_01,
-	IMXRT1170_PAD_DISP_B1_02,
-	IMXRT1170_PAD_DISP_B1_03,
-	IMXRT1170_PAD_DISP_B1_04,
-	IMXRT1170_PAD_DISP_B1_05,
-	IMXRT1170_PAD_DISP_B1_06,
-	IMXRT1170_PAD_DISP_B1_07,
-	IMXRT1170_PAD_DISP_B1_08,
-	IMXRT1170_PAD_DISP_B1_09,
-	IMXRT1170_PAD_DISP_B1_10,
-	IMXRT1170_PAD_DISP_B1_11,
-	IMXRT1170_PAD_DISP_B2_00,
-	IMXRT1170_PAD_DISP_B2_01,
-	IMXRT1170_PAD_DISP_B2_02,
-	IMXRT1170_PAD_DISP_B2_03,
-	IMXRT1170_PAD_DISP_B2_04,
-	IMXRT1170_PAD_DISP_B2_05,
-	IMXRT1170_PAD_DISP_B2_06,
-	IMXRT1170_PAD_DISP_B2_07,
-	IMXRT1170_PAD_DISP_B2_08,
-	IMXRT1170_PAD_DISP_B2_09,
-	IMXRT1170_PAD_DISP_B2_10,
-	IMXRT1170_PAD_DISP_B2_11,
-	IMXRT1170_PAD_DISP_B2_12,
-	IMXRT1170_PAD_DISP_B2_13,
-	IMXRT1170_PAD_DISP_B2_14,
-	IMXRT1170_PAD_DISP_B2_15,
-};
-
-/* Pad names for the pinmux subsystem */
-static const struct pinctrl_pin_desc imxrt1170_pinctrl_pads[] = {
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_RESERVE0),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_RESERVE1),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_RESERVE2),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_RESERVE3),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B1_00),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B1_01),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B1_02),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B1_03),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B1_04),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B1_05),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B1_06),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B1_07),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B1_08),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B1_09),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B1_10),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B1_11),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B1_12),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B1_13),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B1_14),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B1_15),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B1_16),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B1_17),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B1_18),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B1_19),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B1_20),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B1_21),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B1_22),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B1_23),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B1_24),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B1_25),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B1_26),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B1_27),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B1_28),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B1_29),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B1_30),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B1_31),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B1_32),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B1_33),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B1_34),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B1_35),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B1_36),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B1_37),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B1_38),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B1_39),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B1_40),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B1_41),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B2_00),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B2_01),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B2_02),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B2_03),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B2_04),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B2_05),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B2_06),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B2_07),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B2_08),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B2_09),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B2_10),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B2_11),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B2_12),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B2_13),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B2_14),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B2_15),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B2_16),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B2_17),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B2_18),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B2_19),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_EMC_B2_20),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_AD_00),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_AD_01),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_AD_02),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_AD_03),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_AD_04),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_AD_05),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_AD_06),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_AD_07),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_AD_08),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_AD_09),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_AD_10),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_AD_11),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_AD_12),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_AD_13),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_AD_14),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_AD_15),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_AD_16),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_AD_17),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_AD_18),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_AD_19),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_AD_20),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_AD_21),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_AD_22),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_AD_23),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_AD_24),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_AD_25),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_AD_26),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_AD_27),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_AD_28),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_AD_29),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_AD_30),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_AD_31),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_AD_32),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_AD_33),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_AD_34),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_AD_35),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_SD_B1_00),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_SD_B1_01),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_SD_B1_02),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_SD_B1_03),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_SD_B1_04),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_SD_B1_05),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_SD_B2_00),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_SD_B2_01),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_SD_B2_02),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_SD_B2_03),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_SD_B2_04),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_SD_B2_05),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_SD_B2_06),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_SD_B2_07),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_SD_B2_08),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_SD_B2_09),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_SD_B2_10),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_SD_B2_11),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_DISP_B1_00),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_DISP_B1_01),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_DISP_B1_02),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_DISP_B1_03),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_DISP_B1_04),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_DISP_B1_05),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_DISP_B1_06),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_DISP_B1_07),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_DISP_B1_08),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_DISP_B1_09),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_DISP_B1_10),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_DISP_B1_11),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_DISP_B2_00),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_DISP_B2_01),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_DISP_B2_02),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_DISP_B2_03),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_DISP_B2_04),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_DISP_B2_05),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_DISP_B2_06),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_DISP_B2_07),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_DISP_B2_08),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_DISP_B2_09),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_DISP_B2_10),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_DISP_B2_11),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_DISP_B2_12),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_DISP_B2_13),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_DISP_B2_14),
-	IMX_PINCTRL_PIN(IMXRT1170_PAD_DISP_B2_15),
-};
-
-static const struct imx_pinctrl_soc_info imxrt1170_pinctrl_info = {
-	.pins = imxrt1170_pinctrl_pads,
-	.npins = ARRAY_SIZE(imxrt1170_pinctrl_pads),
-	.gpr_compatible = "fsl,imxrt1170-iomuxc-gpr",
-};
-
-static const struct of_device_id imxrt1170_pinctrl_of_match[] = {
-	{ .compatible = "fsl,imxrt1170-iomuxc", .data = &imxrt1170_pinctrl_info, },
-	{ /* sentinel */ }
-};
-
-static int imxrt1170_pinctrl_probe(struct platform_device *pdev)
-{
-	return imx_pinctrl_probe(pdev, &imxrt1170_pinctrl_info);
-}
-
-static struct platform_driver imxrt1170_pinctrl_driver = {
-	.driver = {
-		.name = "imxrt1170-pinctrl",
-		.of_match_table = of_match_ptr(imxrt1170_pinctrl_of_match),
-		.suppress_bind_attrs = true,
-	},
-	.probe = imxrt1170_pinctrl_probe,
-};
-
-static int __init imxrt1170_pinctrl_init(void)
-{
-	return platform_driver_register(&imxrt1170_pinctrl_driver);
-}
-arch_initcall(imxrt1170_pinctrl_init);

-- 
2.43.0


