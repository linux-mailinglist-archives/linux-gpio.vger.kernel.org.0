Return-Path: <linux-gpio+bounces-19652-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E52AABC79
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 10:04:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 78BAC3BF300
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 07:47:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA952235345;
	Tue,  6 May 2025 07:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="mlR3oqIG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011004.outbound.protection.outlook.com [40.107.130.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC552343B6;
	Tue,  6 May 2025 07:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746516677; cv=fail; b=cr0y24HzNJPbUCFCyF4QxrINogUpBiZuCbDyBXviMp7DtLl/czSL22sWTWr+lIpNmf23liRE5zrH5GdfXM+JoTe5puT5yFtUb8eGINrkT67W/v8FD2usTOYJMjj6QUSkqXKv3SggsiX+U/HAfH/unjSqaWyDpPRD33Hv2uyBRK4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746516677; c=relaxed/simple;
	bh=f9dLhyRBIT01lmpiiMPgcPg3hY38pcv0t5L8sRYG7As=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=B3aujPhhpK5+4s/mdW2YmALE0xpg9tlu9ZzH9qrtp9zjtgoMATWBrLtPnkuUdiVLRyMhFJIBEQfbtIM1D9I/SUizOJU+jvIBiBTlY4moolvfZPFmVZFqpUrDOFij7Exrt/w7h1UNpksVXmQmU1GYFGdzgoazmowxA2/MfmX4yIo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=mlR3oqIG; arc=fail smtp.client-ip=40.107.130.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A78pdLXuoUM6KHjOAneLPCHoxJiagbW8obGwKDE1RyoZbsLcE/iLjonWL62KuEJV7XAkwJsK4M6aMPuEw+pJQQ9+e/3Ypt1GKMSU5GGXbHvhaiW/6c3pRj/+I3Lds9Cl67eE9+K9RtH7GW7VxK5wFw8ErwH/EwzQXefVhvyAcUFzpJpdkVOOCmTywwMNqdT3q+ky22pgfCi2c0LW+vr+CftlCLp0g1QTTXp7EqzFj2xZ9eXvM692CEGM5OTgyVE1yenNqTd7xNRm6sGs9koeXeuId04h6NBmYelF9oREekCyOorkcJS83+wrs3vFSdfdKj6qSKGln80x9z8elWm4UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NdcO1e+FOB+0AOoedEe+hHZYDSTlJ73OMPTJXdHoLNU=;
 b=wCBc6NfZHfr5mFn6akqRNzZyvJyZwU6eqHrChgtN1m8FbgMZUb+9eAPpBGRoMGenJGJ/0KcGpLTNT6AuM7CKlGRTMCJPm4INxMDWg+Fw0K1pFrzJiddKAbYe72UwYhNP6Yc4FPn0UGW2+K6NkanBU7rXFHCar6Tgd1mDDwUmLOWU/SNbRw/YTTJ0BvHrZru9VcLngbft7sVZFR62/nwVCI6IRMNTyC7duFM5ayW7PvLJz/0tFex2s77AeS7u6DjMy9KAoezYQczsdKqVpZAHqG1YrM0kFZZOaHY5duE6jASxKBEKUYNOe9bPmpwq9lMAVVVpqzKcN68UXcXx+g1xwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NdcO1e+FOB+0AOoedEe+hHZYDSTlJ73OMPTJXdHoLNU=;
 b=mlR3oqIGHdx2UlwvS0h0m2wPF18wSVzLXnFs0QRkTiIMhQip2NRJeXfS3FyYxHQJkSLjgX9r2GH74KEtSPUw7XtEb9LdV05aXy0gywmVClUm9vyNmowAKMUYxT3pEkxbFPfxOAWBpJ0QoUSpd+2ihCR/dTjYoDO2cWe76KV7TVULGx/u7PijNNS1MMehQFMopU+WRIpT0GN7QWbdyIO+tXO0jzJopfyL8kBUapInss+Hd4bUrwwDVgybB+iYvsiZQD3qYJotWhxGv6zPXw8D5OWmjsjK4G1CYPHwcTSYCnHj8cK2YU6Hy66RA78NP8HaEqin/a2+wsqcB9ksVBohjw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DB8PR04MB7196.eurprd04.prod.outlook.com (2603:10a6:10:123::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Tue, 6 May
 2025 07:31:14 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8699.026; Tue, 6 May 2025
 07:31:14 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 06 May 2025 15:29:33 +0800
Subject: [PATCH v3 3/9] ASoC: codec: cs42l56: Convert to GPIO descriptors
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-csl42x-v3-3-e9496db544c4@nxp.com>
References: <20250506-csl42x-v3-0-e9496db544c4@nxp.com>
In-Reply-To: <20250506-csl42x-v3-0-e9496db544c4@nxp.com>
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746516585; l=3284;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=/BNyznGWn5Xax492PrhBweuf7S7aOMRGhTsy7DqKMyo=;
 b=G8soVedrWA7QG4U3qEPxp/Nm79zOJ4Uzu+muwdVaixUVaasly/6dF2CW3fIBPyUgQa8pRgDCB
 nnh72m6o/qwAKJrwbNiMd4jaqV9XBZsmM1Tv4evEZWvnAnTV3pH68Mq
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2PR01CA0176.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::32) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DB8PR04MB7196:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c402351-cf1c-451c-4262-08dd8c6ffb19
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|7416014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WHphN0gxTWlFWFE4ZTZuSllXSjF4QUt6MUdNdy95SjVTdDV2NXhDQWw5STdL?=
 =?utf-8?B?OUZBLzlyUklDenhtTjhCWVlsN1ZEMWEvRHVXM3dJZmxsRnAwTVVIcFFORUpr?=
 =?utf-8?B?QjNRL3VQZzRaOCtIT1d0ZzE2UTZoRDcyMk5HYW1zQk04bGVFZDBWdFFiM3d3?=
 =?utf-8?B?aVc3UGZ2aXZMNTRubXpnTDNES3pPbDRpeVF5cFJsd1JoTnpaazZXTWU2QzhG?=
 =?utf-8?B?RXF2Qk9WVUZJN1pva0RWZFFCekJHbS92bDJXYWRQR3ZRYng0SHpocmZRa0hU?=
 =?utf-8?B?OUZkUUdML1lJZExhQ1NmZDYyYmpPc2d4V0NoWkM1Ukw1cjFEcGttZUk0bW9T?=
 =?utf-8?B?NHo2UElaRDdWdUc0ZEdGZ0xaMjNhUGZWMGhzQVBVZ2p1VnNEbng1bWxSZUIy?=
 =?utf-8?B?UUFlNS9nY0tZQnZKL3ZucFpHRGV1TjBSMkxCMnNvNHQycVVKVk01dXZRM3ZE?=
 =?utf-8?B?SXhFMU5TZzRSV3UvQVdrSkRzY05YSDJUR1hDMGJxVHExYU5TVnU0RzFEd1Rp?=
 =?utf-8?B?VXVybnU3WGtFVjJsVXR5ZEV0eUkxYlI5VWxBNFFDeDZQZm9hSlk5ZVUyMDBE?=
 =?utf-8?B?ZWg4MHFHaUNVYXhaZDNXQjdKYkVIcEY0UkpVRTh0US9JRUZ6dEFkbm9xOFNl?=
 =?utf-8?B?NkJBMXBnSmx4eDQ4eDFjZkRqbldheVJqUGdhOG1vcnE3RWFSc2FaMXZIY3d1?=
 =?utf-8?B?WERvZWFhN0c2eXdMdXNOS1NvT0VsY2FXdkZHc0dFdTJ5bFNKdEtJVW13NWZi?=
 =?utf-8?B?RithNEJFc2g0TXRGa2tTa1lmSDllK05nUFVEY3l0dmZUL3JuSjZmRGV3Q1ZN?=
 =?utf-8?B?aUtEMXBoYStuSXc0d3RUeXNqMXY3bzVUNWZlbUEzc1JURjNzVTdWMHJZOHNt?=
 =?utf-8?B?MWptTjdzcjc3S2FHbWVBQnhJU1RoUHVzSGsyUU5tT2duY2F6WkpJSlcxSGlJ?=
 =?utf-8?B?UkhoQWE1cGhBdzhUdE44OE5hNHZEaWpPSEtvZ1ltY3hvMUZ4bC9IYkJBTUFT?=
 =?utf-8?B?dkZJT0dCeUFvc0FBckNPNXVJaUN5dnBzdTNHL3NCUE9ib2lpUlBTYmpEN2kr?=
 =?utf-8?B?MFUxMXkxSXRwKzlnb2k5WTVvb24yTVV2SkpaTDd4MmdlR0UrUXc1YXBEWlVM?=
 =?utf-8?B?YlhEUEczYlBlSUxNUU9pYUhBTVlMSFU0MFMwcElCeHY5aVRiY1Q2REV1WENM?=
 =?utf-8?B?K3NaZFN6enpYaktHRkRQVU5uQnBjbUtIMU1HVkhMeGp4TXBwclRwa1p6VExz?=
 =?utf-8?B?QzkvSGlYdXNjS1RZVFpWRm9wRC8wN0RCZDk2OERLekF6WDVkVEhOQk9kWmJo?=
 =?utf-8?B?NDVmMXhIZThESW93djJTeG1HUDJyQ0ZsR2dWS2MzWW5RR3ZmaDI0NjcyYmhK?=
 =?utf-8?B?cFpDSFhsblVWTFh4OWRUUGlDSjlTVCtNMUhSZlUvNnBxbDR6K0VtbzNqS21B?=
 =?utf-8?B?Q3BVYUJyYXcyM0x0VEVRVVZmWTFINmpybWpBaVdiOTVxcHRtQnZ2Y2VqMStK?=
 =?utf-8?B?YXFIdTJRa3VNdUlZdjRzU1RLUVN1M2pZN2N5V0RHU3doVi9WbjR3QitiamlU?=
 =?utf-8?B?MDhicUhNbndsb2hqNU1IN3MvUkxpbHlTanA4YXQyWHJCeDlLTTZ2ZzNuMkRU?=
 =?utf-8?B?M2JUc1NKNDF0Uko5Rk12YjRacFZxVW5iUFVOeWxuaVlCdlJrZzRPTlVsWHFM?=
 =?utf-8?B?TU1EeWUzeGFzaW1DTEtBYUJnRjZVOStyeEVRQjcxZWZvR1I3dy9jOWhsL0xP?=
 =?utf-8?B?OFIrbjduOGF6Tkw4NE1nSkxqTUJmVlhvRFZVZ2FzTFd6azFvZTJabXZsbk1w?=
 =?utf-8?B?alVTSXNJaGRFQWxiTFVERGd1blRyVTgyRVJpaGVkZDdRZ09BL2hZRHRCUzc4?=
 =?utf-8?B?NlA2QTBOdURKNXl3MFN5WE1nWFhGNm9pdGNGbnN3MWdQbk9pdE9obzl6bTZZ?=
 =?utf-8?B?NDZxTFd1TndqVHplU0V5UzBWWlUzZ1FwcEFVT0x0ak1GbE9kb3NaSzBtbWRU?=
 =?utf-8?B?QWpUdFFnRTdRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dk9Bc1VadGxuN2o0K3ltR3NqYkpkR0NFbzRvOWdTTEJUam9HakN4Tld0ZVV0?=
 =?utf-8?B?TUFqRmhXSWR2S1ZrRGVzb3VVUEZTWXY4cDdyMkQ0VzQyZkdwQU5PWi9RaTBE?=
 =?utf-8?B?QStMMXJZSVVuc1dnZVNSc0RZZjNoWlYvU1R3SWMzNjZJL3dkaS9qemtuRzRm?=
 =?utf-8?B?K2V1RmNWNEFINHhyRyt5ZXc2VWhrb2F4SW9HeGVpVTE1bGVsb3QwWUo4eFlz?=
 =?utf-8?B?NjE2S3c1bjdUQmcxbkF4S0pOZlNSYkZ2SmdSTkh2QXlhTjhyN0xrK0ZGN25C?=
 =?utf-8?B?aUN4WVViMXNJblVPOWxWL2dML3AxcFlBT1IwYXV1SXNGRDNLWmRSSDk3a3V4?=
 =?utf-8?B?N1NMdlZObkN4cERpMkZXZkdsWkFZbldTS2ZKVTMrS0swb203L0VzREdMbUYw?=
 =?utf-8?B?VTZ0bHRaNzlOZGx5cVhwQWJaUm5pdDNoYVVFWmhPSVBHNUl3cTU0SG5LaC9X?=
 =?utf-8?B?RU5hM1BGWG9YTmZQSTdSdTQ5eVgxV3hiUTJRQWl0N1E1TkNUcWdSY08xTnJn?=
 =?utf-8?B?dFhHbHZuRW8vdklVY1Z0dFU2Nkw1WkthYzcrc2haYmlrcFdwMVdaTi9kRjhL?=
 =?utf-8?B?TlRiTk14NVQ4UnJMVTc4L1Y3UnBqdW9CMDhnRkZMNWMzSlNTTW53Z24yeFN0?=
 =?utf-8?B?TFp2eGY0UXNYenVuYi9FSUY2a2JaUndMUUxOM25vTXRuTmw3dUxpdTlWRW1p?=
 =?utf-8?B?OEdZNnhqblV3ZmZUcVV1ODRCVjBGZ2xmbzNEQkhkVWR2cU1vck1VWXRXQ1pJ?=
 =?utf-8?B?OG5BZ3U3cXZzeWNKRjdPTTkxUmJ0K0Y3cThnbWFrZHFjVjZMZnArTnB3S1U5?=
 =?utf-8?B?N2dPaURVNWJBNlN2MFM0ZjZNVTlJcXgvOFBWdFNUb3lINTJtRjBoR1l3cG5H?=
 =?utf-8?B?US9uY3ZzdVJ1VWhHK3JZVmo1ZGxDeTNnNlM3T3BqOGM1TlgzbGV1SVp6L0x6?=
 =?utf-8?B?R0swQjV2SjlTNE4yNExwWlV0cVE4akNHSnRDTXdqbFNmKys2VnllOStTL0FH?=
 =?utf-8?B?K2h5eEdCL2REaTRaUEV2Z3QybHVPbDB4RWREV1plOWNLeXBlVnNhSGRuZ05Q?=
 =?utf-8?B?RkNSOWdab3FjMEVobm4rNDZ3YUtCSmNMTWM0NENJNHlJOU1LZTVxVzQ3Z3pT?=
 =?utf-8?B?N0J3WEdpZG9MWHlsclhXUFVDdHAveXIvWkpwY2licHdNM1FnWlRuTWxrUURQ?=
 =?utf-8?B?OWVyWjQxUTlyaTBqbS9KVmdDTzdDRVhSc2xnMUIwVVhHUm1UUlJQL1c4TjNT?=
 =?utf-8?B?QUZSMU9tZm5ZYnlMZHFObHlwMkxaTXl3TkJQbEZOamNmUXlxNFRZeVFGZTlT?=
 =?utf-8?B?UFVkaW1ZMWdQMzJhdnJYVDVFWnpmSlZ2enZpME54VDB5WDhaK0JycWErVTUz?=
 =?utf-8?B?TkxHQldnRkFLRHhqMWJ1WWRRdENGNEtTVGNUU3hXY2VaZkNLMEkxQkQyTS9J?=
 =?utf-8?B?QkplQzhpaFVMK200T3BSQ2RZZUU2dUxaUVJYaDNwbkZ4b0JqUC91RmNLRUNY?=
 =?utf-8?B?V1d3bjEwWnh0WVgvRks0OHVpNGNMS01mbWlWUFVyK3RiNDdEalFOcmJqdU9V?=
 =?utf-8?B?WmhDaTRsMG14dFJ1SkZYOFhyZi9LUTJVV2pZQ042Wld2R3hjeitkTEdhbFVH?=
 =?utf-8?B?OGpFNDFnaXpsaCt4UzFwS05rSTlQeEczai9ERU14V0VOM1JZMmNBTUlpL0JC?=
 =?utf-8?B?eTVPYWE4T1pKQkwyeG8rVjkwdlQ4YWJHQkNYamo1VEp6dEVHU1gzMHBOYWht?=
 =?utf-8?B?dUdSOHZFbjVYWjBXVXRZMzlMcHpHRkJlUkNhTjFVdlJ0SWpYQ1F2WHNnWW9I?=
 =?utf-8?B?SGRrSXRsUjhqUk5TZ1JmM2p5clpKQzBHdWZRQUFjQ2N1UlkxSXk4eGdYNVVU?=
 =?utf-8?B?VWVXbW4xMk1kZ2F0QVVkWkZzc0ZFSW5kZ0czbDRIYTFvb2hvL2lMc01hcnpR?=
 =?utf-8?B?bWNZQS9LbkI2N3lEaVJZT3J6eEptSklMam4rN3A0bHFNMjZVa1FUK0FnRkR4?=
 =?utf-8?B?bkpQTE8wSHJIeWE2OXNxY0ZNU2tJL2VPODBlaXdHMzhZbTM3cHJNckRFQWUx?=
 =?utf-8?B?UW1DNXdsUFlQVXpFOXJVVEU4MWtRWFJBN3VkVkliVHA0ZWw4Z2NnNXByMUhx?=
 =?utf-8?Q?JTJBD79PJvH4MI7es11BiewFX?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c402351-cf1c-451c-4262-08dd8c6ffb19
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 07:31:14.0045
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8KrNbd0KBsh9kvBR9nprS8uzlTuMESI5blyyj1b+pdk7mBwvy9kxgjSMwRT/ZSC+UWadTFwcmtOobS5jrrLpaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7196

From: Peng Fan <peng.fan@nxp.com>

of_gpio.h is deprecated, update the driver to use GPIO descriptors.
 - Use devm_gpiod_get_optional to get GPIO descriptor with default
   polarity GPIOD_OUT_LOW, set consumer name.
 - Use gpiod_set_value_cansleep to configure output value.

Checking the current driver using legacy GPIO API, the
nreset value is first output HIGH, then LOW, then HIGH.

Checking the datasheet, nreset is should be held low after power
on, when nreset is high, it starts to work.

Since the driver has been here for quite long time and no complain on
the nreset flow, still follow original flow when using GPIOD
descriptors.

Commit 944004eb56dc ("gpiolib: of: add a quirk for reset line for Cirrus
CS42L56 codec") added quirks, so the gpio request API will work as before.

Per datasheet, the DTS polarity should be GPIOD_ACTIVE_LOW. The binding
example use value 0(GPIOD_ACTIVE_HIGH) which seems wrong. There is
no in-tree DTS has the device, so all should be fine.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 sound/soc/codecs/cs42l56.c | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/sound/soc/codecs/cs42l56.c b/sound/soc/codecs/cs42l56.c
index 9c58d4f08692871c5baf2702c73367287735cf24..98fa812bc07b87fae717d601561d4ab3b9ee6bdd 100644
--- a/sound/soc/codecs/cs42l56.c
+++ b/sound/soc/codecs/cs42l56.c
@@ -8,6 +8,7 @@
  */
 
 #include <linux/delay.h>
+#include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/init.h>
 #include <linux/input.h>
@@ -15,7 +16,6 @@
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/of.h>
-#include <linux/of_gpio.h>
 #include <linux/platform_device.h>
 #include <linux/pm.h>
 #include <linux/regmap.h>
@@ -35,7 +35,7 @@
 
 struct cs42l56_platform_data {
 	/* GPIO for Reset */
-	unsigned int gpio_nreset;
+	struct gpio_desc *gpio_nreset;
 
 	/* MICBIAS Level. Check datasheet Pg48 */
 	unsigned int micbias_lvl;
@@ -1193,7 +1193,13 @@ static int cs42l56_handle_of_data(struct i2c_client *i2c_client,
 	if (of_property_read_u32(np, "cirrus,hpf-left-freq", &val32) >= 0)
 		pdata->hpfb_freq = val32;
 
-	pdata->gpio_nreset = of_get_named_gpio(np, "cirrus,gpio-nreset", 0);
+	pdata->gpio_nreset = devm_gpiod_get_optional(&i2c_client->dev, "cirrus,gpio-nreset",
+						     GPIOD_OUT_LOW);
+
+	if (IS_ERR(pdata->gpio_nreset))
+		return PTR_ERR(pdata->gpio_nreset);
+
+	gpiod_set_consumer_name(pdata->gpio_nreset, "CS42L56 /RST");
 
 	return 0;
 }
@@ -1225,19 +1231,10 @@ static int cs42l56_i2c_probe(struct i2c_client *i2c_client)
 	}
 
 	if (cs42l56->pdata.gpio_nreset) {
-		ret = gpio_request_one(cs42l56->pdata.gpio_nreset,
-				       GPIOF_OUT_INIT_HIGH, "CS42L56 /RST");
-		if (ret < 0) {
-			dev_err(&i2c_client->dev,
-				"Failed to request /RST %d: %d\n",
-				cs42l56->pdata.gpio_nreset, ret);
-			return ret;
-		}
-		gpio_set_value_cansleep(cs42l56->pdata.gpio_nreset, 0);
-		gpio_set_value_cansleep(cs42l56->pdata.gpio_nreset, 1);
+		gpiod_set_value_cansleep(cs42l56->pdata.gpio_nreset, 1);
+		gpiod_set_value_cansleep(cs42l56->pdata.gpio_nreset, 0);
 	}
 
-
 	i2c_set_clientdata(i2c_client, cs42l56);
 
 	for (i = 0; i < ARRAY_SIZE(cs42l56->supplies); i++)

-- 
2.37.1


