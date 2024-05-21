Return-Path: <linux-gpio+bounces-6493-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 62BDC8CA7E5
	for <lists+linux-gpio@lfdr.de>; Tue, 21 May 2024 08:17:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E7A1A1F2101B
	for <lists+linux-gpio@lfdr.de>; Tue, 21 May 2024 06:17:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CF6E4595D;
	Tue, 21 May 2024 06:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Zrp3rQJd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2087.outbound.protection.outlook.com [40.107.22.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C43481CE;
	Tue, 21 May 2024 06:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716272239; cv=fail; b=kKcqdlfEDK6e3BISztCf2CDhsFsrmVNPFnsFAxLBn8qUrwH7On0ezVIe9Gi0tpbEDNVM6CsgVavSeEm/Wx50sVO1/se2oZpsDcmOStWVFd2kbbrMwUR1IbsWA32POOOBNdiyyO/Lid1js6H4lfTcZbB89U4pjCGyuTqM/fE7rR0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716272239; c=relaxed/simple;
	bh=6vI6esihawUEAsMpS5AmmUzpDZmYxlKj+KMmJXgWIqo=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=pcHN4oYCkjuIRqPaDUIK6Tj7J9P/0W1ISu0c52PdiiCjcSJ7Hhj5f/chwUXM1pldoKY1gSekevQ1N+rSGtWkFX4C+2PFbj8VQl93ZxpQ+Pc308RhkxVkq82Dpb5RKg0j8UKy670AWHhfqLCs0ACtCWbjCII7QZ++a9sgslPIBUU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Zrp3rQJd; arc=fail smtp.client-ip=40.107.22.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZNbl3qJHGgtEsYaqbqzGlQ0den+yV06EBMO8PjxfKH3OagdGK5KH7pEiQEUvgXLCTFZhlnEDKPiNta2WkWba6QR67/YcNvF0Uw1MWGs0pKvj/4t2YlAFL6ncEOruTrR/rtPiKp2Xr/kw/SgzUD2ZBhVGAQwmGXgr8v7aXHfozk2cKO6jTNRiSiPh8eulTuXhAAZ5ORlE/v9zBeZkmvq3m2duetMfOtm5sGBnpeQBzjxB4Q1yBXL7zuMg3cSUfuoUGxhupGndsrK2lQczh/CtNejxUrHqUUbau5qv3rDLHughfmYbV+P3EHllIIoBx1dhHCuc2jO18ulLKIaoIuSG6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BSpuIAfuDc9u8B2QwCMoSNaXFE4wvMyesjB0lNEUwr0=;
 b=SUAbZHL7Atyga3h8kw0h35dPPc6fGZL06HAbacBT/4jc1UZiBBCJGujS2oj/O3rtCvR9AclRfby9mz9nQp0IsndIpTqssk8FmCjIt62Wd/UpSdBMJicGgRk0AiT2eL//yAvwceZJGnKqu1845hTQvVxQ64fXlZkzN8I/PyyZPeye05zTb/GExGG/iZQnInPdvktlBV67/rceLvzinVcwNsMjpX4S3SbOlKcbirIFF0RDDyrnXc6EbHgYuRWCMTLNVeKINJ0q3Blh+3rnUbWzfG3gu8Sm8Pad7V3BvtWERBngSrL5igrlSgARUAn+lJXTDQZJDHCPUe3WS4KHc03x+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BSpuIAfuDc9u8B2QwCMoSNaXFE4wvMyesjB0lNEUwr0=;
 b=Zrp3rQJdpkNnhh+OOqRo7gqjthVzWw1WwWizzKZKRFvb25m/nOfJP0FqndQvzy5K+yGxO5AT6NtUI1Lq+4zy464LCNJCV03evvO24EZX8c4CdpA6OLtHurgWoOVq4PVI87zMkaDz0yd2vM/TfYAl94nwSAzjGDTjGo/mkv34ZaE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by GVXPR04MB10705.eurprd04.prod.outlook.com (2603:10a6:150:223::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Tue, 21 May
 2024 06:17:14 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::557f:6fcf:a5a7:981c]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::557f:6fcf:a5a7:981c%6]) with mapi id 15.20.7587.035; Tue, 21 May 2024
 06:17:14 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 21 May 2024 14:25:58 +0800
Subject: [PATCH 2/3] pinctrl: scmi: add blocklist
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240521-pinctrl-scmi-imx95-v1-2-9a1175d735fd@nxp.com>
References: <20240521-pinctrl-scmi-imx95-v1-0-9a1175d735fd@nxp.com>
In-Reply-To: <20240521-pinctrl-scmi-imx95-v1-0-9a1175d735fd@nxp.com>
To: Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-gpio@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716272771; l=1313;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=gKhGtuOf4rXyBBJYl1QLNqh0NrD/5voNP3TjnJqoeg4=;
 b=OsBq554hEU0Fke9Vk3d4Oqc9PBA/AOjXjq02YWJAVWTGD8f00W0ddkpJbSs8irlghBr7sjxQ/
 z03ZhgcQHJMDVR/jXSC6UG2eQ35J3b7i2eA66uLKWNt7OPtEewAPTkV
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2PR01CA0157.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::13) To DU0PR04MB9417.eurprd04.prod.outlook.com
 (2603:10a6:10:358::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9417:EE_|GVXPR04MB10705:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a36c743-bf89-4aca-babe-08dc795da856
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|366007|7416005|1800799015|52116005|376005|921011|38350700005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VlllQmZseWlPbS9rU3JhRkorQUx1aWdBV3JvUDc0Z3Q3cVI4UCtWOXZoVVlt?=
 =?utf-8?B?VDdXODh4RE8ybkdLSmRRcktoNmFRWGpxUWtsYVlvdzdIcUhqa25JdkQ1ODNP?=
 =?utf-8?B?NHhCS3lVdVplV3pFLzA4bC9CZjE0czJQWU0vMXdkaVFKMFlQZjlNRDRncnhO?=
 =?utf-8?B?a1U2NExUdnB5WEo3M2ROZzErb1JpenMxVmJHVXpQN2s4NTFRSmFyMUFTZXp0?=
 =?utf-8?B?SkswQklOdC8wQ2NDSFo3eGs2aW9MUUhWTmJhZ20xaFVDNy9IVmVFZ3luVDVz?=
 =?utf-8?B?VUFWOG5SYkU0YllvMkkyRzR2V3ZuV3IrUzU4OWkvZkpPcVdLSk5GUFgyT3gy?=
 =?utf-8?B?bU9JaUpYUTlQd0s2U2U5dVdiRHZPTkYvZlJtL3I5WG14dDg5RCtyb1YzRTdQ?=
 =?utf-8?B?YTNZTDhpNWo2b3FYdy82NG9FZEJGck9aM1h1dS9DajJxNUVON08ybDF2VkUz?=
 =?utf-8?B?b3FmZlNUeFVxTVlBczRyWDh1ZFh4ak5LcVZHTzJXWEw0RmtsNFhLaXpTYUFV?=
 =?utf-8?B?RkdlczVqTlZYbkNzODNZdFVqYU5qVzhhY3EvSU43c2M0d3ZKeHRkSHh6ZEJj?=
 =?utf-8?B?cWFDN1VmVEdRdTZDRDZtcUpNY2crOHBLZUFsQkdlcFVOaldlVTM5OHB4ajdw?=
 =?utf-8?B?TW01N0VJc0RKN1RaOW1xQTF6UHA0UmdZeTUyeFRSUFVLcHFhOHRqU0dUWm9v?=
 =?utf-8?B?Q2pkbGhTdVlPQnhiSUlEbDlKRHY0UWxGWHRzZFoyMUtpdzJxbjBSVWdpTmNN?=
 =?utf-8?B?WkNQWitsOWN1UmpNbDFZMUdDbW0xOEFGbzhJNFdpQXhidFNxSDNEZ2Y1RENS?=
 =?utf-8?B?QU1ubUdCWFlWM2prdU1jOUpQeU4wQVZIcnZUaGc4S0M3UVB6d1A1a0l2bjM3?=
 =?utf-8?B?N1ZTL01TYUJMejNUMHNVVXpCd2MzclBDaUphNUdXNWpWT3owWmdtaW9tSFNv?=
 =?utf-8?B?eHJMdGtDQ2NIYXNXd3A3eCtYc1F2bytxV0pneGxDZXJXVXZROFlwaklEelJO?=
 =?utf-8?B?dVE4dDR1Nmlia1NZUFJTTVhJV0xDV1FYeGdNaU9kOUR1clFkcjBFNFRtOXlq?=
 =?utf-8?B?L2g1MHc4VjlMNFVMZUhBM0kxcXI5THI3ZDUxZ3JMKzdWc0V4dzM0cnNJQlJz?=
 =?utf-8?B?aDhxRjFNQ1lBWHJpMDdPNHc4dnVNcDVkbWZyV0ExVmZYTEUvMWRXRk9xQWtI?=
 =?utf-8?B?bmc2SmdFNUxaN3RnZDZRRHBGTHVPUnBkZVdkMFY5RUtSS0FZNHU5YmlReWhy?=
 =?utf-8?B?UlNGaWFrM1NaYlArK05vc3dWVmVSMkR5RzhTa3Q2MzB5eDFWTDZXMEtVYkhN?=
 =?utf-8?B?THNpR0ZkdkpRVEZMZ2FhMk9yakc1OFRWMEhINWlsdUI4QjFCSXY2M3o1YmI5?=
 =?utf-8?B?RGxLNFpyNHgrWEpEMmhFNnhNNS9vQ1ZrcjBOYjdSQ1lBYlBubW9ndWtza3BP?=
 =?utf-8?B?NzkrVFFROTRXKzJqdkZBd1VWbHozTDFWcjRtUWdkTjQ5OWRmb2xxYzBaOWtH?=
 =?utf-8?B?TVJpd0w3a0tIeituR1ZtSjd4N01LQ2ZBNGxYTFREeWt5ZndScEpPSGtuZHpL?=
 =?utf-8?B?bWNZYVVXWlU5OGdmQ2tjVmpKd0x1ZS96QWhvVlVaOE4xSWRwVFBGM0J5cDBs?=
 =?utf-8?B?VFBCTklMakI2aElxK1pvOU9xMjFBU1RMZnhBMXdHTHVCUVZjR0hWenlSVHhx?=
 =?utf-8?B?ZDl2cWpyak5xQXVLQUpuVE9SWFMxakZQOGVNTk9iK1d2RVpyOTdhSHh6RlZt?=
 =?utf-8?B?RjFIaGVNNmpBeTFWYmF3MXArY2s5UDZpejlXMS9VenlvOVlhdlE2U0ZHRjRG?=
 =?utf-8?B?TnZabmJTMm1aTmVzbDhjdz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(7416005)(1800799015)(52116005)(376005)(921011)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QjhNQlc2NDB4eXBxS3V6WkwxUStBcU5xT1NBci93d3J6UGJEWVAwK1d6dUJU?=
 =?utf-8?B?ZDBMVmxkYktVaVdTZHhjclJYeWVkamVQVWFFZnE5MU9vemxQa0xRMzNCTnRi?=
 =?utf-8?B?V0tyWGxUdVRJeWFYLzVzcFpGN1ZrZ2VUZEhuYmN1TGRWWUQ4NEw4YkVuNTRT?=
 =?utf-8?B?a2hYdmEzQy9YRm5tQWlBS3ZrYXY5U3EwTlV4YzFKdGhwNXRRSUZnVzM1YlQy?=
 =?utf-8?B?OFR4clpqRCtld3RuN3NCbzU2U05lMnc2OGJaTERpU1NIL0x2T0lHVHlYYWUy?=
 =?utf-8?B?bVlhRXU1Vm03QnVONndSQVVvQU9Dc0h6ZSsrRHlSMnRWUkMyUlBHRmhoMmp3?=
 =?utf-8?B?bGdJV3RaL29iQlh5eU1tUnhRWThhUm5ySForZ1pBWThmeHpUUGhsODlBMGlP?=
 =?utf-8?B?RlpwL2llazZqSmhVUnI0S25aUTNBTjdHZXVwOWtSOEVHdmVyckN6cVRxb2Jp?=
 =?utf-8?B?a3c5UUdoNDBCRkQ3cEFGWTRsTjlFdkFGVWRCcFJvT3A4SXMwRTB3b0hjWXhI?=
 =?utf-8?B?Tk1Ba1RQL0xpRlBWRHQxU1ZFWUdLaW5jdnczSElncnJTM2V0UGhGQVZuQi95?=
 =?utf-8?B?Sy9PeHdqQ21rd1FoK0dLOWRlYkc3VEpaZ1llOVNIcm5aL3dXV1hWQjNWR2NZ?=
 =?utf-8?B?YzFFZGhmbk9tVjNMRFU4UDBubHJaK1BLWHduMGpOclp3SGNWMkc2eXJGSW9y?=
 =?utf-8?B?WXN3bkIxd1dlZmh1bysvZW5SSW52Q1ZFeDYwQWk0alFwNzl3UzhSejZHWk1y?=
 =?utf-8?B?YnYwa3pyZ0p0aG1KUFhjQkt2aFVQY1ZIcDN1VklBWWR3UzI0T1pZZlppTTNO?=
 =?utf-8?B?VXJpcEp2UGtmQ2s0NUExV2RoT244MHM1MVpmcFdzQkdUajF2QzN4YkVUajAw?=
 =?utf-8?B?dkF5eTN5a3NGYkduODVpMHNHdjAxMnNUbkswRXZCeUd5TUJIampqK1pWLzVE?=
 =?utf-8?B?bVNETTN6MnBTMm5pQlh6REdtYXpFdk80SFZyYTR5U0dseElEQ05DN1NBR0k0?=
 =?utf-8?B?SGJpMmFxK0phSUVkTWdZdTRvLzdDd1VOQjRsRkRzTTNyUU00UTZ4NTRkd0Rt?=
 =?utf-8?B?YW94Sk9UWnNWSU1KMlpDMkxqbjgxWnJCamVGUktuOXAyTEFHOEdkQ29UeExY?=
 =?utf-8?B?b1BFblRSb3RNbWNpYk1XRmJ2bmNCcGlsR0txRGw1THJaSnpxemNWdUM3Z2M1?=
 =?utf-8?B?bk5sRFhiSTRTa3ZxM3NIckNoSW93OTRTZnVCYnhndHc3K2MvQWNMbG9sQi8w?=
 =?utf-8?B?eEl1TUpTODhNejBXN1dXNnR0UU1BZElyRzF4MlFQSWpVSXZsYVNoSVhPa25K?=
 =?utf-8?B?TVkreHp0andLOW5GVklNaitITW1CTkh2S3gvUU5ZOWhzR3BncXZQd1lBdmMz?=
 =?utf-8?B?aTJVUEJoSWM0VFZvZnZ0eHJDcmx6cWxrOWhHalFiRG80WEp6YnRHdmJ3TzAr?=
 =?utf-8?B?SDZZZDZLak5pMXRRRVhSRHUwS05uS0RyMUJ2S2drUkIyVkY0S3FVY2lXZEND?=
 =?utf-8?B?OVU1czFCaDA5NGdjQ1hvZVJtMDdsMENPSHNxbUJDYWhia3ZhTXZUamVFWE9Z?=
 =?utf-8?B?OU9DcU9pWmlKWEtOSmdMalllOXlnM2dGVXA4aGFXYVJZOVJwZStYRzYvWFhr?=
 =?utf-8?B?azROeEp4aGhhVHFWM3drMjdtejNETmNDSytmaTN5dnZNcVlseTNUN0RiS1RH?=
 =?utf-8?B?NDVFamsxRjBBc3ZNQ1VzVDZlT0VWUDlLME5QbEZaV1kvcmhkYlBPR2ZBSlNx?=
 =?utf-8?B?Z1NLZGZndFAyRkhrZXpHclZoMUcyVWNoZGpOc3cvK0NuVWRmbjNSdDJ5a3Jz?=
 =?utf-8?B?L3dzQXRhM0VXaXVDYy9SUlhjQk9mL2wyQmJ3bUtRWXRWd3JDR2FFNkE0VkRN?=
 =?utf-8?B?UWJyUVZCL2xCYUZtcVJLYys2SmlkWVgrYXRGY0NJdDNFR0lnV2tNZU1uRWFv?=
 =?utf-8?B?UHljT2ZZWUVUK0NkWEhEYlRhVkM4d3M3NExVS3FDTExYZXlnMkNVQk9GdDVy?=
 =?utf-8?B?TWhzVTlwSFdqVnRJdmtxZWRnWHY0T3U3Uk1ndWRESGR6VlFsOCtkREwreU8v?=
 =?utf-8?B?NWlGRTJESkNUMDN2SkJMV2MxRHdDZ0ZVTVE4cUtQZlBLQ0JEdjRRekR5V2NE?=
 =?utf-8?Q?jfGpQduFwEhIBMq9zlVaAhL/e?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a36c743-bf89-4aca-babe-08dc795da856
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2024 06:17:14.3738
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6SYd9LaKeJ63Zi8Zt9wqtVyJFBcwNSX6ZE7ffchvwsp58NF4dlUAm95coNtLIalo56HnWfeV/At/JLx3BFM3sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10705

From: Peng Fan <peng.fan@nxp.com>

i.MX95 will have its own pinctrl scmi driver, so need block
pinctrl-scmi driver for i.MX95, otherwise there will be two pinctrl
devices for a single scmi protocol@19.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/pinctrl/pinctrl-scmi.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index 036bc1e3fc6c..df4bbcd7d1d5 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -11,6 +11,7 @@
 #include <linux/errno.h>
 #include <linux/module.h>
 #include <linux/mod_devicetable.h>
+#include <linux/of.h>
 #include <linux/scmi_protocol.h>
 #include <linux/slab.h>
 #include <linux/types.h>
@@ -504,6 +505,11 @@ static int pinctrl_scmi_get_pins(struct scmi_pinctrl *pmx,
 	return 0;
 }
 
+static const char * const scmi_pinctrl_blocklist[] = {
+	"fsl,imx95",
+	NULL
+};
+
 static int scmi_pinctrl_probe(struct scmi_device *sdev)
 {
 	int ret;
@@ -515,6 +521,9 @@ static int scmi_pinctrl_probe(struct scmi_device *sdev)
 	if (!sdev->handle)
 		return -EINVAL;
 
+	if (of_machine_compatible_match(scmi_pinctrl_blocklist))
+		return -ENODEV;
+
 	handle = sdev->handle;
 
 	pinctrl_ops = handle->devm_protocol_get(sdev, SCMI_PROTOCOL_PINCTRL, &ph);

-- 
2.37.1


