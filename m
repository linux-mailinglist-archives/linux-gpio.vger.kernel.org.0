Return-Path: <linux-gpio+bounces-12930-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B8C9C6CD6
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2024 11:27:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C7DC6B25397
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2024 10:14:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 999561FCC57;
	Wed, 13 Nov 2024 10:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="KYtIXwD9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012060.outbound.protection.outlook.com [52.101.66.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0EC1FB8A9;
	Wed, 13 Nov 2024 10:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731492771; cv=fail; b=GBVUrAU9d1BGrFSXDXUgSBpDkIt5deDTn7VT+iByRkyH3drHLUeyDl9sMkXman9RUkefoaA2gl5nkBAaCeeRyrP8PA8O6PaoIsMQ1U9usuKETpaT85WbN/V3CES0ohsbcJ1G7X/gfNvbse217Jv1G74xQLYMfwuBgpIEth1PJ9s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731492771; c=relaxed/simple;
	bh=kF8Nr8hIBNh1rtPdDeE/GfQ/g573NEXdWCPfpGxzTL0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TAagBfdxgkTIueU8ASWj8W6ICmyRMk6ueoK5hFteyrhtFiHOo687DW7ot3c2yKI8X1t7ZyrOjo3nD3oxd9jyCw89A/QEhO6+Zy4YYyH/YCcXiD7jY7qK2Tj9Hp422yWzHvoauNmcCnYs2oM7tZ1NXt8+5XD1PTib0UxPuTrtNBc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=KYtIXwD9; arc=fail smtp.client-ip=52.101.66.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uP4zjWBVZwDojD1Yvhe6PJ9CECthvggq3Yy7PtM1ZN97tIAzbM9WR8qd+0JW+GOZjAmVi1cbsf9axG0+gkblY8ROgctMUO5NEDBkYOsexPWMTyMHH5qz+xShWtz7kGodDNh1cNnQZ1lq6ibagqOqGlNZ5CfagIjRTNM4ZxMVTb+gGLBTIKKmYU//E0ThCEgtKoeSmOgE5CVJrlSFeNUmPIX6bRvDfu7uQvtxum267QWou2zXcG+BWzx+Avk3ZI1ri+7uk+/2GUZmabN2ZXbJt3MkDr9m4upwjv8iJ1r6mUPJWMrIK3aA9pBjoxmrjlZ0orLjw6AH/vmyVbrEzBTIlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+54voebqoeKg4PDvduKb7kbojQ1Q0j2NGqVvHwKT85I=;
 b=NG/zewrueEkYdVdkKEKAyZCFfnkrstQSfgEj4wTgztzk0hkgSVgSAQPXYZkXm8wNDZtORw73vBhySWOaiG3dq7+Dx3uj2M6qnOCsaNaQBiGGftpar0EmGfXT8rNXlLA6tP5tozXO87NOWnAxzvp9JTxWs/LPhGeDBV0qgv+0YcfZfQfqa9B1rT7jrYz7zIuR1h7VitsW+H4kEgsqDgACSfUpKZR2cIGeo7Rl2s3gS9Pzp8egp5qiL3YvcJKMUy8voebV/g2zAvEvr44laDh2IGDptx1wJQTDLlyh9eZmYSpZbQMlhkpF8mz06AKsQUOR5WZF61oZjF8SUVkqMzwO4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+54voebqoeKg4PDvduKb7kbojQ1Q0j2NGqVvHwKT85I=;
 b=KYtIXwD9DJydHpGvp5awOFWvKECoIhi4FReSg7P+uzGV5Hg5byarPiiO64B8KuqyDuYBmBI6O8zDRUpSk2MpHFkkcW2YXUVlKcrYpr/uEp7PrJ25XlLOCX1MJV0euDF8Cx71le8wu6xr9xmfVRlBkZZBdmGZGQDYWmlm2p7Qs1hJtchfacLDhjz/vVONPAqDfoRBM78bKtvManiyxCZXXet3rKXGP40wXFUpt2fybWozfttCBmylPDGbePj8xBX9uOlc8DEpnQwEOd5cMryp2NqHfMYhS1RpVCGkMeUGDZIQ+BWDtfzfH4UnwsDvcY8Nrp3zoOmCT+5eUwoGKlYR1A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com (2603:10a6:20b:41a::6)
 by DBBPR04MB7739.eurprd04.prod.outlook.com (2603:10a6:10:1eb::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.29; Wed, 13 Nov
 2024 10:12:43 +0000
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455]) by AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455%4]) with mapi id 15.20.8158.013; Wed, 13 Nov 2024
 10:12:43 +0000
From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>,
	Larisa Grigore <larisa.grigore@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev,
	Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Subject: [PATCH v6 6/7] pinctrl: s32cc: implement GPIO functionality
Date: Wed, 13 Nov 2024 12:10:58 +0200
Message-ID: <20241113101124.1279648-7-andrei.stefanescu@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241113101124.1279648-1-andrei.stefanescu@oss.nxp.com>
References: <20241113101124.1279648-1-andrei.stefanescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM8P251CA0005.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:21b::10) To AM9PR04MB8487.eurprd04.prod.outlook.com
 (2603:10a6:20b:41a::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8487:EE_|DBBPR04MB7739:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cbab589-f131-46f2-47f9-08dd03cbb66d
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Qlhwd1hyRm14dnRESFFvY0pyTExmVmhkTmNob2tjbitwNEZ4ak02RUhPeFI2?=
 =?utf-8?B?U3JIT25FSlM1b0xzTDRMUjkzWnB2OGhqZi9PMUFFSnV1SnFBalJVREpIclZh?=
 =?utf-8?B?RXBkdmdpTG5BOVZOcFJkK0ZNUFdodmE5TFJMcnBFYVZUb1NoODhZb1luVEMz?=
 =?utf-8?B?ektzOTJMRXc2TVAxZm83OFlISWp4QWRuRDFxTWlaZDNXRkFOdWV5eW1rV0tv?=
 =?utf-8?B?UFVka0NEVFArbkMycjNlK05kdkFLV2Y4cE45aFViVnNsVG9Pekl0ZnU0OFRk?=
 =?utf-8?B?Y00veHNBajZSQ0ZtVmxoOEpJVU9JVkJMRDNrYmdKNGpRa2tpRmhZaGc1cHFE?=
 =?utf-8?B?Zi83ZzBPRmRXOTFCVnBPNXVwY0lYZXZtUEZBMnduQVN0Q1o0OWo2VVMwWFBw?=
 =?utf-8?B?STY5MFZ6K0VWRENUZGRNdEVjT3cvUk44U0RhUkV1QTRlN3JSQnJMRUVveisv?=
 =?utf-8?B?cWg4ZmI5QlIxZzFnWkhLb3RsT1JMR2Z6d1J2YVhaL2gzOC9pbFpvV2dZRjRp?=
 =?utf-8?B?cnFSamJUVEt5Q2luTThIbmt0YTd6bTNXYWZlZlBYVzRhN0lXMDJ2ZWk3RHE1?=
 =?utf-8?B?OEFGblRuNllObXcxN25zYS9ycWxYMS85dVFSZ1JDQkZFR1Fld1ZnRWRTL2No?=
 =?utf-8?B?VEQxa1JKeXFJNzI0OVc4dGRURzhIZUduS2h0K01HY1o3OWIxK2FDTytLSkpy?=
 =?utf-8?B?cVNFYVQySFZ1alo5aVpVb1VNd3h2UzNrZzJJcjZzblhCQk8vZUU2R3dYbnpC?=
 =?utf-8?B?QTdYazdJd1E2V1UxL2kySmFmMWQ0WUk5TkU0eUtMOUlzUEV6WXlOZ1U5YUl0?=
 =?utf-8?B?U0tSd1JoQzJZNTQ5UE1ucTVMTVpzZ0xOc1lQWTU3RUhwVERjaWJMeWhIV3NK?=
 =?utf-8?B?V05LYWsyaVBFQUdiQklwZjNNNk5tYU8wYVlqcm92cjBTdFRoVHhLMXJvUEx5?=
 =?utf-8?B?ZkcwbWpZcDR5Zy9CVE4rM0RtSUgwZWJ4T1JCZXZXQW5vMnVhb2EzMFhGR3or?=
 =?utf-8?B?L0VJcmNGMTlwZGRPdkJHV04vbE4yVmw2L2RIejV5Rm5TeXVla25QbjlJY1BR?=
 =?utf-8?B?TTdKdkR2RHRsL3ovMkE4dEhUNTVRb1JZQThGTmdHMUNGSmhWYTNJSHZVbG5U?=
 =?utf-8?B?ekRlaFR3d3lFNzJmM1o0dXErUm1JcW9HNXBhTmtnaWxMakM2WER4QWNlcGYx?=
 =?utf-8?B?NjlNa3ZiamVDVHVYek95c21MUDdHekJRT3I0MmxkZ2kwSGdaOTJGN0hiZzh3?=
 =?utf-8?B?azU5V1JwZG5lUEk0SWo4VFY4Unk3VmJrYU9kcVhCQmJFdEk1NE1xVVBaSHpn?=
 =?utf-8?B?b2pqY2daYTVxUTNZd0E2bW0vdDJ5NFBYdHdTNlVLdnk4NklHamYyZlBlelZm?=
 =?utf-8?B?MXIyQnc2bCsvSGdxR2pTbnh6cy96VkJKTXRlaUdOeXJCRFd3L0M1R2dmdDcv?=
 =?utf-8?B?ZHFOb2k1c2F6TlM1aC9heU45VlJkeGtSQzMrckZGZkJBUjR5SHM1Mk1MLzJk?=
 =?utf-8?B?bFVNb3NMRVkybU45Y3Bwd0FrVUVkQWRERThacHFkUzBsL1ZmMHpZRWIwSHg1?=
 =?utf-8?B?eEVKKzZhWjRlbnBJOHlCZUxxbnlvWVQ1Z01ianlIV3VXbkF0d05kQmdyQ092?=
 =?utf-8?B?d1F5dTBzYmMrZ0NrcU5aeG1QUFIrT1lnVzliUUE1UU4zNUlrdzZXSVdBMXE3?=
 =?utf-8?B?MzZxaE0vZjdJTytrTUJKdTJuT0NUbHkxaEN4NDlDMGJqakZoOHVWYXFPbWww?=
 =?utf-8?B?RC9kaUJGM1AxUjJXN3J1a3JoVDd0eWJUU2p1N1d1Zm9MWkw2YWZDb0FoL2pD?=
 =?utf-8?B?VFA2YVA2U2NGNEc1NmlKc3VMTVdIVTJjZG1UcmNOWHI0MmYxM1B5THFQS3lK?=
 =?utf-8?Q?O1MxXAMobhlx5?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8487.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V0I3UlNrak01S3BKYmFTbzA5SmJQY2xnOWNicE5YVW0rdGhoTGMyckFnaHc0?=
 =?utf-8?B?QUtDVlBiMlBpSkpwQU0wSFB0N0xhLytrbHpVQjVVU3ZpYVcwU3ppMnBreC9D?=
 =?utf-8?B?MUl6UTRPRSt5Qllyc29Ra2NYTVZCREYrcUNMdXZkUGhLVWtaSkhlZFArdWVh?=
 =?utf-8?B?V2tIeVRiZEVYMytYeEV4NC9qU3JON0pvdk5GSGJuUFNPRGhaL1hVbHlYRnFD?=
 =?utf-8?B?aGxwby9xVmQrRWRRazU5Q2NUWlVQL0xSTyt2dWtOcnZpVy9KOVZuTzM5dzR1?=
 =?utf-8?B?QVBMOWtZYVYvL09kMHFud1Z5K0RDMzJ5NHZEU21IL3J1V1BnLzhBZmFpYWM3?=
 =?utf-8?B?WG0vNnR4bTdEUTJNTEpkMXY0U1ZCeHVDTFN2elZJcE9SNTREdzJWQ1o5MG4z?=
 =?utf-8?B?V1c5NlEycW4vWHRQeGlyeE9Pc0VtQlhWMGVseGRyQXFjWG9Wc1dHMk9PRzRz?=
 =?utf-8?B?S2FiamtMNzNrSUpkZTJhbDlBdkpnRTVHNS8rakQ1czEzamZjNXJaaks3bXZk?=
 =?utf-8?B?VjZUampZbWFoUG1nOE8rYXozV0dYRnUyUExGcUc5ZnVMcEhRNzNjL3ZOYnRB?=
 =?utf-8?B?eGtlRVArUmxvdjcrZ0M1Z0c1akx6aUZxOG81eU53Vkw0NFk1Q0NMSjk3RmlV?=
 =?utf-8?B?WXZueU5LUzVOU0lIdFB3dmZwTE5GMDJDbG16bGpaaEZldGJYSHdHTjZkV1Fq?=
 =?utf-8?B?NVN0dmxLZXM0MTVRMVNVQ2lzcmxQRXpvcVY0MWc2ZDVjcW9GMTBUbkpOQmx5?=
 =?utf-8?B?MTBQNVUrVkxzc3ZsNkdYYXBPcWVabC91MDc2WGw0NkF6dHU0amsxQzVDbkVK?=
 =?utf-8?B?VHdLSGJJZGZtU21VOVgrQWRldXhmTk1iWjNVcXRMMVc2cU9pV0RiWkU4OTdY?=
 =?utf-8?B?cFk0ejJNNytVV2JUK2NLOTlyYThWN20vVGpmWk5sNEZGYU45ZnlQQ3FKVUg1?=
 =?utf-8?B?OFZiZmZoa1JtT05zbWo0emdiL0JoRmJjU2NIWGJOMmovMUtiNzFnKzhEVld2?=
 =?utf-8?B?Q3VrNFhISmMrdzZaQUZEV1VjSjFZZE1URS9hSllpVFJDV1d4VlM1ZU9zSW1F?=
 =?utf-8?B?a2VQeHdRNzdCVE9lR2lUWkNZUEszRWlCbUJLL2ZielA1Mlk2UStqeEZQZUll?=
 =?utf-8?B?Wjc2TytEUW56NEpsTjBwSGMyL2ptMTA2UGJRTVFxelFtZXRRZVpPYktPOEM5?=
 =?utf-8?B?UElySUxlZXZIbmx0ZXZ3K2VFOHFwSy9DakZuNU9CUDdmV3NxSXdGM2xkQ2NX?=
 =?utf-8?B?b1NWZDN0cTFxcG1WVGd1V0VxTDJ6ZmVsOUVSVEw1MlE1cG9acFZnVXZENjlZ?=
 =?utf-8?B?cGQ4cDFqaTd4ZG9NODQ5ZWh3dE1BNnlacGVtWXhVRlNpT0s2M3BGaWliSzk1?=
 =?utf-8?B?a0NTL0xZWGdFNEZLN05UR1VDOTFxanJqWTlyblhFZVdsQlBUZlQrN2VLdkxn?=
 =?utf-8?B?bVAyLzBaWC9rRnlENG56UUxvMXYwc0NqY05JSkJWbmF3K2h3SDZ1TDFBT1FM?=
 =?utf-8?B?UlhrREgyTW1RVk5CZHArUWxqSTZZTHlaS09URjdnRk9vbW1CQzR1Smo0Wnl1?=
 =?utf-8?B?U1lDVFZKMlNSeEFXMHJIeEJ5cUhmV0JwMGsvdDN4WmpocDFxNWY0YjJWeGQ1?=
 =?utf-8?B?bGljSzVRQlJjSi9DMzE2Rk84VDJpYUJHeE1QOGI4d2wxc1JSTkpzNnh0aUZs?=
 =?utf-8?B?R20yaGpuQzZtOTB1YzFJZE1HUU4vRWJqKzlqOHBRZEZFYkJ0K29oWmJOc3p0?=
 =?utf-8?B?ak9ybXBrUUFsM2tiMUhJOUNtMG1SZXZCM0NDV1owN3M1QVdqWmpoWUl4TEt1?=
 =?utf-8?B?dkhHZStadzNUWXNjZWs3QmlXdDlBK2U3bGhzWUl4WDl3NUJVY2ZhdzJGK1Rs?=
 =?utf-8?B?azhhMjNYWlBKaHJSMlZ0N1FLMGNYeU5oVTlnOE8rMlpIVW9aSmtyS1lLN2wy?=
 =?utf-8?B?UTNYdTlPdWZleStIOXU2dWpBeUx5Rk1XQXo5N3dIYWJLaFhKZUlDV3Z2NkpK?=
 =?utf-8?B?RXdCSWhWVmNzL3RHQ2hhR29uNXk2Qk9yM0J4Q2tYN3VScVFLZy9hVXU1d0Nu?=
 =?utf-8?B?S1NtZXc5d0hNQzFrMHpockFlMzRnaUl5S1JMWUkxcjcydnBXWWQyNVdsMnJn?=
 =?utf-8?B?bFlPeDIrTGJJRHpJUm9WOFZqMjhhU2NGdWNkd0luanVqZzIweVFXQ1prdmps?=
 =?utf-8?B?UlE9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cbab589-f131-46f2-47f9-08dd03cbb66d
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8487.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2024 10:12:43.3145
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7B1WWiva/XvoHxAKtmUy/Pd6LiKQABV9Ni8MJVtJkttSO6klW4OyApsJTnS8BrE4Eg8hnqjy/rDs9RTZVJWVFc61PndrzfbUJh99wKVe1fU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7739

Add basic GPIO functionality (request, free, get, set) for the existing
pinctrl SIUL2 driver since the hardware for pinctrl&GPIO is tightly
coupled.

Also, remove pinmux_ops which are no longer needed.

Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
---
 drivers/pinctrl/nxp/pinctrl-s32cc.c | 406 +++++++++++++++++++++++-----
 1 file changed, 344 insertions(+), 62 deletions(-)

diff --git a/drivers/pinctrl/nxp/pinctrl-s32cc.c b/drivers/pinctrl/nxp/pinctrl-s32cc.c
index 0b79c7445929..e213a910d958 100644
--- a/drivers/pinctrl/nxp/pinctrl-s32cc.c
+++ b/drivers/pinctrl/nxp/pinctrl-s32cc.c
@@ -40,6 +40,14 @@
 #define S32_MSCR_ODE		BIT(20)
 #define S32_MSCR_OBE		BIT(21)
 
+/* PGPDOs are 16bit registers that come in big endian
+ * order if they are grouped in pairs of two.
+ *
+ * For example, the order is PGPDO1, PGPDO0, PGPDO3, PGPDO2...
+ */
+#define S32_PGPD(N)		(((N) ^ 1) * 2)
+#define S32_PGPD_SIZE		16
+
 enum s32_write_type {
 	S32_PINCONF_UPDATE_ONLY,
 	S32_PINCONF_OVERWRITE,
@@ -84,6 +92,7 @@ struct s32_pinctrl_context {
  * struct s32_pinctrl - private driver data
  * @dev: a pointer back to containing device
  * @pctl: a pointer to the pinctrl device structure
+ * @gc: a pointer to the gpio_chip
  * @regions: reserved memory regions with start/end pin
  * @info: structure containing information about the pin
  * @gpio_configs: Saved configurations for GPIO pins
@@ -93,6 +102,7 @@ struct s32_pinctrl_context {
 struct s32_pinctrl {
 	struct device *dev;
 	struct pinctrl_dev *pctl;
+	struct gpio_chip gc;
 	struct s32_pinctrl_mem_region *regions;
 	struct s32_pinctrl_soc_info *info;
 	struct list_head gpio_configs;
@@ -366,66 +376,6 @@ static int s32_pmx_get_groups(struct pinctrl_dev *pctldev,
 	return 0;
 }
 
-static int s32_pmx_gpio_request_enable(struct pinctrl_dev *pctldev,
-				       struct pinctrl_gpio_range *range,
-				       unsigned int offset)
-{
-	struct s32_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
-	struct gpio_pin_config *gpio_pin;
-	unsigned int config;
-	unsigned long flags;
-	int ret;
-
-	ret = s32_regmap_read(pctldev, offset, &config);
-	if (ret)
-		return ret;
-
-	/* Save current configuration */
-	gpio_pin = kmalloc(sizeof(*gpio_pin), GFP_KERNEL);
-	if (!gpio_pin)
-		return -ENOMEM;
-
-	gpio_pin->pin_id = offset;
-	gpio_pin->config = config;
-
-	spin_lock_irqsave(&ipctl->gpio_configs_lock, flags);
-	list_add(&gpio_pin->list, &ipctl->gpio_configs);
-	spin_unlock_irqrestore(&ipctl->gpio_configs_lock, flags);
-
-	/* GPIO pin means SSS = 0 */
-	config &= ~S32_MSCR_SSS_MASK;
-
-	return s32_regmap_write(pctldev, offset, config);
-}
-
-static void s32_pmx_gpio_disable_free(struct pinctrl_dev *pctldev,
-				      struct pinctrl_gpio_range *range,
-				      unsigned int offset)
-{
-	struct s32_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
-	struct gpio_pin_config *gpio_pin, *tmp;
-	unsigned long flags;
-	int ret;
-
-	spin_lock_irqsave(&ipctl->gpio_configs_lock, flags);
-
-	list_for_each_entry_safe(gpio_pin, tmp, &ipctl->gpio_configs, list) {
-		if (gpio_pin->pin_id == offset) {
-			ret = s32_regmap_write(pctldev, gpio_pin->pin_id,
-						 gpio_pin->config);
-			if (ret != 0)
-				goto unlock;
-
-			list_del(&gpio_pin->list);
-			kfree(gpio_pin);
-			break;
-		}
-	}
-
-unlock:
-	spin_unlock_irqrestore(&ipctl->gpio_configs_lock, flags);
-}
-
 static int s32_pmx_gpio_set_direction(struct pinctrl_dev *pctldev,
 				      struct pinctrl_gpio_range *range,
 				      unsigned int offset,
@@ -449,8 +399,6 @@ static const struct pinmux_ops s32_pmx_ops = {
 	.get_function_name = s32_pmx_get_func_name,
 	.get_function_groups = s32_pmx_get_groups,
 	.set_mux = s32_pmx_set,
-	.gpio_request_enable = s32_pmx_gpio_request_enable,
-	.gpio_disable_free = s32_pmx_gpio_disable_free,
 	.gpio_set_direction = s32_pmx_gpio_set_direction,
 };
 
@@ -669,6 +617,311 @@ static const struct pinconf_ops s32_pinconf_ops = {
 	.pin_config_group_dbg_show = s32_pinconf_group_dbg_show,
 };
 
+static struct s32_pinctrl *to_s32_pinctrl(struct gpio_chip *chip)
+{
+	return container_of(chip, struct s32_pinctrl, gc);
+}
+
+static struct regmap *s32_gpio_get_pgpd_regmap(struct gpio_chip *chip,
+					       unsigned int pin,
+					       bool output)
+{
+	struct s32_pinctrl *ipctl = to_s32_pinctrl(chip);
+	struct nxp_siul2_mfd *mfd;
+	u32 base, num;
+	int i;
+
+	mfd = dev_get_drvdata(ipctl->dev->parent);
+
+	for (i = 0; i < mfd->num_siul2; i++) {
+		base = mfd->siul2[i].gpio_base;
+		num = mfd->siul2[i].gpio_num;
+
+		if (pin >= base && pin < base + num)
+			return output ? mfd->siul2[i].regmaps[SIUL2_PGPDO] :
+					mfd->siul2[i].regmaps[SIUL2_PGPDI];
+	}
+
+	return NULL;
+}
+
+static int s32_gpio_request(struct gpio_chip *gc, unsigned int gpio)
+{
+	struct s32_pinctrl *ipctl = to_s32_pinctrl(gc);
+	struct pinctrl_dev *pctldev = ipctl->pctl;
+	struct gpio_pin_config *gpio_pin;
+	unsigned int config;
+	int ret;
+
+	ret = s32_regmap_read(pctldev, gpio, &config);
+	if (ret)
+		return ret;
+
+	/* Save current configuration */
+	gpio_pin = kmalloc(sizeof(*gpio_pin), GFP_KERNEL);
+	if (!gpio_pin)
+		return -ENOMEM;
+
+	gpio_pin->pin_id = gpio;
+	gpio_pin->config = config;
+
+	scoped_guard(spinlock_irqsave, &ipctl->gpio_configs_lock)
+		list_add(&gpio_pin->list, &ipctl->gpio_configs);
+
+	/* GPIO pin means SSS = 0 */
+	config &= ~S32_MSCR_SSS_MASK;
+
+	return s32_regmap_write(pctldev, gpio, config);
+}
+
+static void s32_gpio_free(struct gpio_chip *gc, unsigned int gpio)
+{
+	struct s32_pinctrl *ipctl = to_s32_pinctrl(gc);
+	struct pinctrl_dev *pctldev = ipctl->pctl;
+	struct gpio_pin_config *gpio_pin, *tmp;
+	unsigned long flags;
+	int ret;
+
+	spin_lock_irqsave(&ipctl->gpio_configs_lock, flags);
+
+	list_for_each_entry_safe(gpio_pin, tmp, &ipctl->gpio_configs, list) {
+		if (gpio_pin->pin_id == gpio) {
+			ret = s32_regmap_write(pctldev, gpio_pin->pin_id,
+					       gpio_pin->config);
+			if (ret != 0)
+				goto unlock;
+
+			list_del(&gpio_pin->list);
+			kfree(gpio_pin);
+			break;
+		}
+	}
+
+unlock:
+	spin_unlock_irqrestore(&ipctl->gpio_configs_lock, flags);
+}
+
+static int s32_gpio_get_dir(struct gpio_chip *chip, unsigned int gpio)
+{
+	struct s32_pinctrl *ipctl = to_s32_pinctrl(chip);
+	unsigned int reg_value;
+	int ret;
+
+	ret = s32_regmap_read(ipctl->pctl, gpio, &reg_value);
+	if (ret)
+		return ret;
+
+	if (!(reg_value & S32_MSCR_IBE))
+		return -EINVAL;
+
+	return reg_value & S32_MSCR_OBE ? GPIO_LINE_DIRECTION_OUT :
+					  GPIO_LINE_DIRECTION_IN;
+}
+
+static unsigned int s32_pin2pad(unsigned int pin)
+{
+	return pin / S32_PGPD_SIZE;
+}
+
+static u16 s32_pin2mask(unsigned int pin)
+{
+	/**
+	 * From Reference manual :
+	 * PGPDOx[PPDOy] = GPDO(x × 16) + (15 - y)[PDO_(x × 16) + (15 - y)]
+	 */
+	return BIT(S32_PGPD_SIZE - 1 - pin % S32_PGPD_SIZE);
+}
+
+static struct regmap *s32_gpio_get_regmap_offset_mask(struct gpio_chip *chip,
+						      unsigned int gpio,
+						      unsigned int *reg_offset,
+						      u16 *mask,
+						      bool output)
+{
+	struct regmap *regmap;
+	unsigned int pad;
+
+	regmap = s32_gpio_get_pgpd_regmap(chip, gpio, output);
+	if (!regmap)
+		return NULL;
+
+	*mask = s32_pin2mask(gpio);
+	pad = s32_pin2pad(gpio);
+
+	*reg_offset = S32_PGPD(pad);
+
+	return regmap;
+}
+
+static void s32_gpio_set_val(struct gpio_chip *chip, unsigned int gpio,
+			     int value)
+{
+	unsigned int reg_offset;
+	struct regmap *regmap;
+	u16 mask;
+
+	regmap = s32_gpio_get_regmap_offset_mask(chip, gpio, &reg_offset,
+						 &mask, true);
+	if (!regmap)
+		return;
+
+	value = value ? mask : 0;
+
+	regmap_update_bits(regmap, reg_offset, mask, value);
+}
+
+static void s32_gpio_set(struct gpio_chip *chip, unsigned int gpio,
+			 int value)
+{
+	if (s32_gpio_get_dir(chip, gpio) != GPIO_LINE_DIRECTION_OUT)
+		return;
+
+	s32_gpio_set_val(chip, gpio, value);
+}
+
+static int s32_gpio_get(struct gpio_chip *chip, unsigned int gpio)
+{
+	unsigned int reg_offset, value;
+	struct regmap *regmap;
+	u16 mask;
+	int ret;
+
+	if (s32_gpio_get_dir(chip, gpio) != GPIO_LINE_DIRECTION_IN)
+		return -EINVAL;
+
+	regmap = s32_gpio_get_regmap_offset_mask(chip, gpio, &reg_offset,
+						 &mask, false);
+	if (!regmap)
+		return -EINVAL;
+
+	ret = regmap_read(regmap, reg_offset, &value);
+	if (ret)
+		return ret;
+
+	return !!(value & mask);
+}
+
+static int s32_gpio_dir_out(struct gpio_chip *chip, unsigned int gpio,
+			    int val)
+{
+	struct s32_pinctrl *ipctl = to_s32_pinctrl(chip);
+
+	s32_gpio_set_val(chip, gpio, val);
+
+	return s32_pmx_gpio_set_direction(ipctl->pctl, NULL, gpio, false);
+}
+
+static int s32_gpio_dir_in(struct gpio_chip *chip, unsigned int gpio)
+{
+	struct s32_pinctrl *ipctl = to_s32_pinctrl(chip);
+
+	return s32_pmx_gpio_set_direction(ipctl->pctl, NULL, gpio, true);
+}
+
+static int s32_gpio_gen_names(struct device *dev, unsigned int cnt, char **names,
+			      char *ch_index, unsigned int *num_index)
+{
+	unsigned int i;
+
+	for (i = 0; i < cnt; i++) {
+		if (i != 0 && !(*num_index % 16))
+			(*ch_index)++;
+
+		names[i] = devm_kasprintf(dev, GFP_KERNEL, "P%c_%02d",
+					  *ch_index, 0xFU & (*num_index)++);
+		if (!names[i])
+			return -ENOMEM;
+	}
+
+	return 0;
+}
+
+static int s32_gpio_remove_reserved_names(struct device *dev,
+					  struct s32_pinctrl *ipctl,
+					  char **names)
+{
+	struct device_node *np = dev->of_node;
+	u32 base_gpio, num_gpio, tmp;
+	int num_ranges, i, j, ret;
+
+	/* Parse the gpio-reserved-ranges to know which GPIOs to exclude. */
+
+	num_ranges = of_property_count_u32_elems(dev->of_node,
+						 "gpio-reserved-ranges");
+
+	/* The "gpio-reserved-ranges" is optional. */
+	if (num_ranges < 0)
+		return 0;
+	num_ranges /= 2;
+
+	for (i = 0; i < num_ranges; i++) {
+		ret = of_property_read_u32_index(np, "gpio-reserved-ranges",
+						 i * 2, &base_gpio);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "Cannot parse start GPIO: %d\n",
+					     ret);
+
+		ret = of_property_read_u32_index(np, "gpio-reserved-ranges",
+						 i * 2 + 1, &num_gpio);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "Cannot parse num. GPIOs: %d\n",
+					     ret);
+
+		if (check_add_overflow(base_gpio, num_gpio, &tmp) ||
+		    base_gpio + num_gpio > ipctl->gc.ngpio)
+			return dev_err_probe(dev, -EINVAL,
+					     "Invalid reserved GPIOs\n");
+
+		/* Remove names set for reserved GPIOs. */
+		for (j = base_gpio; j < base_gpio + num_gpio; j++) {
+			devm_kfree(dev, names[j]);
+			names[j] = NULL;
+		}
+	}
+
+	return 0;
+}
+
+static int s32_gpio_populate_names(struct device *dev,
+				   struct s32_pinctrl *ipctl)
+{
+	struct nxp_siul2_mfd *mfd = dev_get_drvdata(ipctl->dev->parent);
+	unsigned int num_index = 0;
+	char ch_index = 'A';
+	char **names;
+	int i, ret;
+
+	names = devm_kcalloc(dev, ipctl->gc.ngpio, sizeof(*names),
+			     GFP_KERNEL);
+	if (!names)
+		return -ENOMEM;
+
+	for (i = 0; i < mfd->num_siul2; i++) {
+		if (mfd->siul2[i].gpio_base % 16 == 0)
+			num_index = 0;
+
+		ret = s32_gpio_gen_names(dev, mfd->siul2[i].gpio_num,
+					 names + mfd->siul2[i].gpio_base,
+					 &ch_index, &num_index);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "Error setting SIUL2_%d names\n",
+					     i);
+
+		ch_index++;
+	}
+
+	ret = s32_gpio_remove_reserved_names(dev, ipctl, names);
+	if (ret)
+		return ret;
+
+	ipctl->gc.names = (const char *const *)names;
+
+	return 0;
+}
+
 #ifdef CONFIG_PM_SLEEP
 static bool s32_pinctrl_should_save(struct s32_pinctrl *ipctl,
 				    unsigned int pin)
@@ -896,12 +1149,14 @@ static int s32_pinctrl_probe_dt(struct platform_device *pdev,
 int s32_pinctrl_probe(struct platform_device *pdev,
 		      const struct s32_pinctrl_soc_data *soc_data)
 {
+	struct nxp_siul2_mfd *mfd = dev_get_drvdata(pdev->dev.parent);
 #ifdef CONFIG_PM_SLEEP
 	struct s32_pinctrl_context *saved_context;
 #endif
 	struct pinctrl_desc *s32_pinctrl_desc;
 	struct s32_pinctrl_soc_info *info;
 	struct s32_pinctrl *ipctl;
+	struct gpio_chip *gc;
 	int ret;
 
 	if (!soc_data || !soc_data->pins || !soc_data->npins)
@@ -967,5 +1222,32 @@ int s32_pinctrl_probe(struct platform_device *pdev,
 
 	dev_info(&pdev->dev, "Initialized s32 pinctrl driver\n");
 
+	gc = &ipctl->gc;
+	gc->parent = &pdev->dev;
+	gc->label = dev_name(&pdev->dev);
+	gc->base = -1;
+	/* In some cases, there is a gap between the SIUL GPIOs. */
+	gc->ngpio = mfd->siul2[mfd->num_siul2 - 1].gpio_base +
+		    mfd->siul2[mfd->num_siul2 - 1].gpio_num;
+	ret = s32_gpio_populate_names(&pdev->dev, ipctl);
+	if (ret)
+		return ret;
+
+	gc->set = s32_gpio_set;
+	gc->get = s32_gpio_get;
+	gc->set_config = gpiochip_generic_config;
+	gc->request = s32_gpio_request;
+	gc->free = s32_gpio_free;
+	gc->direction_output = s32_gpio_dir_out;
+	gc->direction_input = s32_gpio_dir_in;
+	gc->get_direction = s32_gpio_get_dir;
+
+	ret = devm_gpiochip_add_data(&pdev->dev, gc, ipctl);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "Unable to add gpiochip\n");
+
+	dev_info(&pdev->dev, "Initialized s32 GPIO functionality\n");
+
 	return 0;
 }
-- 
2.45.2


