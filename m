Return-Path: <linux-gpio+bounces-29660-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FCB2CC5CAC
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Dec 2025 03:41:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AA57A3039979
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Dec 2025 02:41:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9342A7262B;
	Wed, 17 Dec 2025 02:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Q7lw0EA5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010054.outbound.protection.outlook.com [52.101.69.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456AF2AD13;
	Wed, 17 Dec 2025 02:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765939286; cv=fail; b=Fc68PnT8wc4vcJi4t7Hh1MRfB4hFXl9Gf1gmYPhYdjx41y5N2UeHNkBk/x4vBO6nm+GIFWbRxWQYO7vYu8WnFZ5o2b22MLBjOqh1J9+G5TwxkWAzH279dtuYy5rGZj9esthwqBbMo3JD5KHrlfGM5aK5GDb0kaAgmc7km93OWvg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765939286; c=relaxed/simple;
	bh=iTp22blc2ABmwnGEtyE1zov/RV4OaxUBvvDIlHFbIoE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=W6tQEZgsbBIj5042AH66vqSBORk6d45eAEqPrTYGbZEnDksm6Q6P9bGI/6tUpsdkGV2uWAQBLoRTG9wK9w+IAU9jUArs34spgQQrOGypN20v9UmbdLjj6X3fdqX0qid4tOV4rDZPLpRX4ezkpxU5P6k+vZE8sMaawjfUmEfWC10=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Q7lw0EA5; arc=fail smtp.client-ip=52.101.69.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RX9NDioBK/l7hWAjra3re+zJPQplNZHLX5ctOf7vdIMh3fDE/gVdoeif+o7ynPVE0uhPvHjUcx3qdgC4H8IZgOQuqurBdrS1lxL3mIWXO33dutpyPQe4s8QawfNHMz/PeLn7OocecIKNG30hIUdLoWuOFAPY+7f00ldSHIN5r1dg1KoTAUwwOJ5BsOjCtAEV6dT6ho/oZrWn5bFds2ldrsoJWcxjJyixA9wrFPvbfuZxMElhnR4sJg59IlMNq0IbgrWPkO4Nqzb3oaUr7ySF53zYwUrPXDMyyvANfgxLBq12UAIGSkbwzONGiU3GI4co2RbrvSVL4fO8heribrhQBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z4JWxkaIOnKjCfoQ0ZUkRuLUyG/tW3V6b8gfsCk3u6c=;
 b=ei5uXYDRQmIR4Od3H45c+ZjXLKmiy5ip1CfmiK4x4TDAKBQNVowQT4U8msjMgNCyJtdmWJJZoQbdSjF3SLWZo5x0r2fA+/vyv+E2i5Hj+1ztUntL0glcEn3gXvatXjYCl+6jiYHc1I/am7bAHW9V3LbbIeUtPtFXuvP/8ataIIPRLLgk5gnKquT0k2H2a7O7LLhkwLf2haTTSOdaBoy1iRnOtje1dfDoNEhV+H55dhbNHIVOc3Bm8it5Tzd2CPclp5k2kglaouS4OsRvdcgReKCHYkyDOAromq2m8lkYjkNxxkgYbcfaB82GJeg3XVwhv5y0f3nCWtpgJOcyGs72qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z4JWxkaIOnKjCfoQ0ZUkRuLUyG/tW3V6b8gfsCk3u6c=;
 b=Q7lw0EA573PZxNuDFUyn8WHGfcfzbLKrIfQ8OykzbpdU9iizXC/LydN92+8xqve/1BXqp7D0KysU8S30JUSLRLBkMdl2wA+lASVeiMw2IXl8hAWOZ1DmCalJr7stvBoCD6AP6qWdPBHzRKJdBvtbydWGYVNQhPxWERmjhzSSPNkO2vayfult0YnWvqEJvMDp5+ZSdJhAlNtE8BWNjP/34KOA6VowwV+pTyvTKuaxR4XipJ3cch4NpKE+IIKGzEPUiS7kmZ4/CYE7kVzK7Vmu22dlr9rWvT/4SbbhmD9b1gunuvcW01GS3hKabfQlt/OtRJQWJRqLW0kJu2JEv7YgWw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
 by DB9PR04MB8446.eurprd04.prod.outlook.com (2603:10a6:10:2ce::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 02:41:20 +0000
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197]) by DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197%4]) with mapi id 15.20.9434.001; Wed, 17 Dec 2025
 02:41:20 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 17 Dec 2025 10:40:46 +0800
Subject: [PATCH 2/2] pinctrl: imx: Add support for NXP i.MX952
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251217-imx952-pin-v1-2-2747f09144dd@nxp.com>
References: <20251217-imx952-pin-v1-0-2747f09144dd@nxp.com>
In-Reply-To: <20251217-imx952-pin-v1-0-2747f09144dd@nxp.com>
To: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 NXP S32 Linux Team <s32@nxp.com>, Linus Walleij <linusw@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 arm-scmi@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI2P153CA0012.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::15) To DB9PR04MB8461.eurprd04.prod.outlook.com
 (2603:10a6:10:2cf::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB8461:EE_|DB9PR04MB8446:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e28eb87-9563-454c-e619-08de3d15c2bc
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|19092799006|52116014|7416014|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Nk1uK2NYbXpTclhmVXpHaVRzZENaTmRLYkJ2cmVZYkdBL0lYU1V0U2dPMHJh?=
 =?utf-8?B?aWJ6MjdEOGtBcitwanAzMTkyQjY4SEJvRGxhaHpwVm9aV3VHUzhWTU1rT0ZP?=
 =?utf-8?B?dUVYOE1jbE9kc1o3N0oxYTFIcUtQczNiOUViUi9vREV0ME54blRZUXNiZnhD?=
 =?utf-8?B?U0ZkYWF5eEpPYWJ4bnE2UE5nejdpWEptdVMzeGUyQldPUS9Cc28rQUZYR3dQ?=
 =?utf-8?B?SGFtWXIrdUp2a2N2Szc0azI5MW9LUmVoZ3ErdkxKbm9XSjNMOUp2N29jQUpR?=
 =?utf-8?B?d0F1S3grQ0c0dEVRQmdURUc5V2VYNHBvcG5DYzBmendBNEVHZ3hqaEJ4QUdz?=
 =?utf-8?B?aGlMcm1jK0x4RG1JT1RSWjZhSmVDaG8vVVRmbGRJang0YWJ3eDJTWkdJMUd2?=
 =?utf-8?B?ZlY2UHVlZ2NxN0s4MTBQZzRVUkdzZ08zSHN4Zlo1eitQVFd1N0hINmdtOFls?=
 =?utf-8?B?OHJobzdTblpHaEppSmNtQlFSS0NGV0pkQTc4ZTBwZGF4ZWs2eEUyQnptOTBt?=
 =?utf-8?B?aWVjWlN2WXBkaXNMM1Y1ckxlcFZiRUtsZjczcFBMN3JLTUNsL3FQSW9UY3ZJ?=
 =?utf-8?B?RUIwTmdqVmlFWWZDMjRIUGFQenBBTncxRTZiMllkQ2FzODFpODNWV2RXcitR?=
 =?utf-8?B?anlJTW55ZHZJOXdiQlpZQXVHMm54ZkhVWnRaVlVqWFIzKzVPSE91Yi9xM1Z6?=
 =?utf-8?B?UkxyNlMvMFJ1K1l0anYzSDVHZnpqc2NBKzRWeG9nS0xBRkpBandCRzRRR3hG?=
 =?utf-8?B?dENGOGtGdDg1L0M2dVZsYlNzdnF4K0htN3BXS1pkWDh5Y3RuUDZUWjRFb2xz?=
 =?utf-8?B?SXU4M0wvL1k3aWpFc2NxSC92Wlo2SWFwRUJkVDBaVFpPbnozR3BETkZkLzF3?=
 =?utf-8?B?NlZoWk9JMElsVXE1S2krNFNhdzlRVEVCeWpremhhbkh0aU9JZXJsVGZJM0JZ?=
 =?utf-8?B?d3owR28rWEpnNFlLT3RCcHVoWVZaNnNKTG1USkdhMlNkaVN2d2hBK0dSdEFG?=
 =?utf-8?B?Rzl0TDJLZ2g0Z0lxUU5jSXVPbE5Sc1pRdlEvWURvc2Jyc0pXcFFuUk93UFZt?=
 =?utf-8?B?eGhJb2RNU0MxRUcyM1hTYitPRWd2Y1I2VjRlamlJQ1F6S0pDWHgxb3NVWnFL?=
 =?utf-8?B?ZWtwNTBUTGViZVhadmFHS3RKWHI3V2prZ1NRSnBQR2hNUDhHazRVbTRrbWRK?=
 =?utf-8?B?U0pwR2d1SUVqWTRlbzdTN2ZSc0FBRGpRNit6WDRFMVdlc21uaFNrZXVHWjln?=
 =?utf-8?B?blhWVkRDSjZ0UUkrMEZCc1ZvRkhFSlgvb0xtaFIxWEY1QXBtY25KYjluK3JN?=
 =?utf-8?B?ZktjbU9rSk93UGNLSGRLUHZWeVFIbjdBbGpSeEFQeGswTklkWDlEUmxCcitx?=
 =?utf-8?B?OW83U1VHU052Wk5VRWpvR3A0ZDFrUGowekpsUkpRbDAzOWdmN0pta1VkR2pU?=
 =?utf-8?B?dWloWlVUK0lRcFFUdE1Fa0VFVGxEcUJxNktYbDB5SHZRZ1ovbVdxczUxVmpz?=
 =?utf-8?B?Y1JnVGFwY0RjL2YwZUVFMXVWZGNzU093WVN0ekdzNllUMThFbmFTRU4vdHJm?=
 =?utf-8?B?NEI3bVVXa2ZZa0pZeWpYdFNGSjh2WlhBanByb09ZTmxEbmo3UVhvczZPOWVR?=
 =?utf-8?B?UjRlWGFoZzVqclAwS1Z3Tyswblhnakd2V3hGTm9Rbm9UWExpdzJCNmhHdTBW?=
 =?utf-8?B?NytkMnd6TUwrdklxSkpCb0owWU9LRFNnNGtUbTgyMTY1VFRUMmxJUWtkaFRa?=
 =?utf-8?B?cjV5WlNBdjlhQndvV2tiTmpRSjlOdGNlSGwwM1FHZ0pXLys5VGQ4ZWNBOFhx?=
 =?utf-8?B?bXBBSlNLdTdWdFE0aWpHY1hPY3lwL1lrRThQSnhpaEJrMGJkT1RIUnNnNWhw?=
 =?utf-8?B?UDBJVG44VGhYK3pINk4xQnJ0K05OMWhjZFpjMWw1M2YyT2wwbkV5L3F1T2VL?=
 =?utf-8?B?aUYzNldoMWlVRStIajdlZWM0QkxFUXRHNU1sa2poVzJaR2k3V25EYXVHenN6?=
 =?utf-8?B?N3dod3I5VU5IdEpydmgva3pITEhPeVN2L3hYVVFJWGJrb1IwcXVFTHlTTGpr?=
 =?utf-8?B?TkZ4Yk9hNFFJempHUXZaZHlnOW1iZHY1Q0VRZz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8461.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(19092799006)(52116014)(7416014)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YVYrTk1SYm5YekRvZ1IvM29qbjBWeEkyMjU3aWpGRVlSaVBDK3haalIxRWhC?=
 =?utf-8?B?YVBGS25lWDdkZlBSbU5XeVA0RVdRbzQvdHpaaEljSmxSVXpCMGM0cERtd1NC?=
 =?utf-8?B?M2liREtNVEdwcmNCWkI0SFpLajYxdVV5UW03WXpUbnZvSWpPQkdLOGdlL2lS?=
 =?utf-8?B?WW56Q3QwaFhDUHh5Y0hYQUFTWU9zS2FlZFRIajVDZVBpNWk4VXcvWnNXZVdu?=
 =?utf-8?B?VGFxTHFiZHRQVWxnZ2JYejhEVlEvR3N5Wmx5RzNsY1UxSjVvOEp1UmttRXp0?=
 =?utf-8?B?M3BLTHVtdkRQb1BQNWNUNGM1VnV5WGFmc0hTY1B0VE1GMXJsblYrS2FoWW9T?=
 =?utf-8?B?ekp0dTN2RVY1VDRaTVBQVUI2cjR2NDM4ZjVrVnErdUtQcjkxUjBiektZbFl1?=
 =?utf-8?B?dThWaTRnNEg2UVZnZFpvbVl1amM2NmdldTFSL1daaXVlejUydG9BckkvNHU4?=
 =?utf-8?B?YTQrV2swQmtVT1gxaklPZVlIYWtQcFE0STRtU1hDaFM2WCtHeFZDMmdVWlBV?=
 =?utf-8?B?MDdhQnRFbkRKbm4rL2FxUEg0ZjB4NXAxL0xMTVl0MnRsWVZrZTZuSTIzemE1?=
 =?utf-8?B?SVRVamI0aWlCOGdjNG53NkRjK2FmN1VoRjhaTEhBaVdKdURISUMwWCtKZ3di?=
 =?utf-8?B?dWR0QjFUQm1JUzRiR2lwTDcxbzZISUsxaXV0cVlPOUZlaitEVC9XMzhKeWg3?=
 =?utf-8?B?UTJKUm14Z0NNaC9YNWFIOEViclpiVGh3cDlRRmdjNHJvNmEyNVNORS96M3RQ?=
 =?utf-8?B?dWsyZzc3UmtvVXBJczAxZUVVQkZTVDFWTnV1KzlEQ2NzMWpISUVSbDI3SGlZ?=
 =?utf-8?B?V2tYR0kxdEtjWGF0c2h3WXJMd2JjaVVybXFrVTVFSlUvdlpnNkZxTi9UZ2NT?=
 =?utf-8?B?T0hTK3BDc1BjVFJYRURZK0lJemwyNTN0d1VzK3hXTlQ3bVphMTRJVzBRVWxE?=
 =?utf-8?B?K0UwM1phbEk1UDRhc2VrTWt6WDZtWjU4NThZYjYxWWdIQUQzWnYwb3lnTmpY?=
 =?utf-8?B?RXJGZE9TUm1ySWhyVm5yM3N4N2ozMS9zbWoxUkdJdVNFa1dGbFljM3RYVEc5?=
 =?utf-8?B?M2F6TjR1MXhnZUFNMnluT1ZwSmQ2WGVyVzN3R3NQT0FrR25sRmtqV241SUJs?=
 =?utf-8?B?eGJQdkdNZGQ3VnNzV3JvdGo3VHU1WjljKzJReThmK2VuNldPKy9PQVBIS2J5?=
 =?utf-8?B?Yk53ekw2Z2FlMGtHSll4UXhkc3QrV29GNVFoSlFLQUZjTGNvcld3MkJnbWp2?=
 =?utf-8?B?d1pQM0Y5RWZieTNwZ1RmUXkrWC9VVDhnZkZOMmtwd0xsRDZFbFpnOVdTMWlT?=
 =?utf-8?B?dEJUeWV3emlnbTBUVDZRRkh0bUNQVk9PUkxXK0gyai9qZ1lZd2lYNm5ieWlC?=
 =?utf-8?B?UDZhTGhpVDRZaFZhOWF4RDcvZzhjYnhlV0xaSlZxVFJRYXVCNjY0NmphUlFl?=
 =?utf-8?B?cEFVTU9kMjZRbmNLUFBjRTN3UTFQMWtuTlhPdkhLOXRiaGU0VVdUeTVpczZy?=
 =?utf-8?B?U25UVGhBMjJ1QXIxRHRpcmxrVUxQMjh4QVp3aytMb1ZESGJzTXA0S2V4aTdL?=
 =?utf-8?B?cUhETlFiS1dTcG1OaHJtR1VxVGtNTnhJN1ZodjREdjVVKzZwUkdyRkErNWpm?=
 =?utf-8?B?d2RaNXJVWHNaTGxjSE8xalNRczk1MFQwY0QveUdGWWs2Y3F1Y1BBRWZUZ3hB?=
 =?utf-8?B?b1paYTBIQXlvaU1nWnhtUlpObmlhWjJURStOcHZwMlpueGxHdG9TOEhRcEVM?=
 =?utf-8?B?UUJ1Q3VkNmZBd3k2ejNIRzJPbE9RTjRwVGFhMHBTQW9VQ3RvZzZNUExTWnNn?=
 =?utf-8?B?R3BxZS9UbVBYTDhlWmtOWjI4K2lFdHlEMi9pWVdITFI2RDl4eSt0cGNFK0RM?=
 =?utf-8?B?dDNYNTViTmxiYzNWRlRhVWJrcW1MMkZxQVdReVk5UzUyOGtRWXJYZDR5V3g3?=
 =?utf-8?B?MGdLaW5HQUh5TGIzamNEMkdmbFRjNnJIYU1kRXYxR0J0a1FiQ0kzcGh3WnZE?=
 =?utf-8?B?MDdqN0k4MyttN3RXbjVtWWV4K2tHQWxQS3pvV1hEdmN6c2w1Y2MvVUVDOGR6?=
 =?utf-8?B?VTJNS1E3VUtxWmJlUEdWdnFCcjMyOEtwNmlmaEpFL2lDM3JJS2Zkd0t2aFd6?=
 =?utf-8?Q?6HiJUl/vTiYeQh0H/9T5i0Rgr?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e28eb87-9563-454c-e619-08de3d15c2bc
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8461.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 02:41:20.6549
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SOEs72weDLRSHtqvI8Sq2yRRVATPtOUeeRw+JX2AB+K3//g2GD4ICIE5ADvj+HXbXgHZ9yKtwQ2us5BxA1DnYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8446

From: Peng Fan <peng.fan@nxp.com>

The i.MX952 System Manager (SM) firmware supports the System Control
Management Interface (SCMI) pinctrl protocol, similar to the i.MX95 SM.
The base offset for the i.MX952 IOMUXC Daisy input register differs from
that of the i.MX95. Update the pinctrl-imx-scmi driver to add support for
i.MX952.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/pinctrl/freescale/pinctrl-imx-scmi.c | 8 ++++++--
 drivers/pinctrl/pinctrl-scmi.c               | 3 ++-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx-scmi.c b/drivers/pinctrl/freescale/pinctrl-imx-scmi.c
index 04728ad807d38367a19e6e774d4ccc985549ecfe..dab2fabdf4561c21f747773f2908f15b61eebb50 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx-scmi.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx-scmi.c
@@ -51,8 +51,9 @@ struct scmi_pinctrl_imx {
 
 #define IMX_SCMI_PIN_SIZE	24
 
-#define IMX95_DAISY_OFF		0x408
 #define IMX94_DAISY_OFF		0x608
+#define IMX95_DAISY_OFF		0x408
+#define IMX952_DAISY_OFF	0x460
 
 static int pinctrl_scmi_imx_dt_node_to_map(struct pinctrl_dev *pctldev,
 					   struct device_node *np,
@@ -74,6 +75,8 @@ static int pinctrl_scmi_imx_dt_node_to_map(struct pinctrl_dev *pctldev,
 			daisy_off = IMX95_DAISY_OFF;
 		} else if (of_machine_is_compatible("fsl,imx94")) {
 			daisy_off = IMX94_DAISY_OFF;
+		} else if (of_machine_is_compatible("fsl,imx952")) {
+			daisy_off = IMX952_DAISY_OFF;
 		} else {
 			dev_err(pctldev->dev, "platform not support scmi pinctrl\n");
 			return -EINVAL;
@@ -299,8 +302,9 @@ scmi_pinctrl_imx_get_pins(struct scmi_pinctrl_imx *pmx, struct pinctrl_desc *des
 }
 
 static const char * const scmi_pinctrl_imx_allowlist[] = {
-	"fsl,imx95",
 	"fsl,imx94",
+	"fsl,imx95",
+	"fsl,imx952",
 	NULL
 };
 
diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index af3ac031e3626818495a168a96c7930907d9524a..d5fb8649cd9aaddee679ebfd86d8f3d1127b8e01 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -504,8 +504,9 @@ static int pinctrl_scmi_get_pins(struct scmi_pinctrl *pmx,
 }
 
 static const char * const scmi_pinctrl_blocklist[] = {
-	"fsl,imx95",
 	"fsl,imx94",
+	"fsl,imx95",
+	"fsl,imx952",
 	NULL
 };
 

-- 
2.37.1


