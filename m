Return-Path: <linux-gpio+bounces-31620-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OO+YK/rtjGmSvgAAu9opvQ
	(envelope-from <linux-gpio+bounces-31620-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 22:00:42 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2E012792C
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 22:00:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D0DF7303A919
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 21:00:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E66C35971E;
	Wed, 11 Feb 2026 21:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="RQiqFhJA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010034.outbound.protection.outlook.com [52.101.84.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906AD353EDC;
	Wed, 11 Feb 2026 21:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770843626; cv=fail; b=l1zoW5D0a1E71RmWz6ldb59Uhxf1uWLdxBNbJi9rfg5Vz9tYbSPViCeaTtorP5egwwhVTeiM/w2MtYLem5kvjKpdgB4Yt02yhH4ndXmEp19mcFcFKZxFIXtx641LnjHQXrxsF+ypiIhv5WAHWsert89yDe7nUBWv55J/y/zor+U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770843626; c=relaxed/simple;
	bh=tYqEuf0dz7jp6G6afDyOHFswFGZerFSAtrBdp+ntm1M=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=DNCAfR3E3TykFVCd/xVr/KfEVaPCohQSWsxH/m6F/LVQrWq8XhvC5e+tKpFl4NezAmUU5FwUYmvbgHb95AlHLZBODPOi9glUwd8mCt70gCUbIivPsTb4YwP5zTMGzLCXygvZIo4vEEL/bhBTMrc/jTa7qu+CT7h9/fNLwuLNG4I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=RQiqFhJA; arc=fail smtp.client-ip=52.101.84.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NaAjZUSdhwu4CPwj1gExDWZgW2nK5oXK/AlIva/0S4OBxLO0IaJJ1WJPcPCut7gBuBU/0jnYpCDL2mZlopIUIksdpH8jjplgECyqgtGxoudnHodbIlf96YMNp3SDlDG/ZI9BbloCsvnjBc5jCIOIbC+yBxFdtXlqOoiN0kmNue8csA6kdmy3j8/1jwunX0tvQCDfT3ZMY8PsV/fgi6FnLzzFZygdm2Cp6Sr9LvrtGyKp6JH9pIH8HH0DCCMjkXx0epE2UJ27jALGHsSvMIRByf+yBqxepufwP7AHgzPHWasyNeHKMq2LlNYGAZzM6Y73bSjkCYQQFGxa0q5wAl9jBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rAQEYuN6CX/aatA/YBNc+hSMoYZ/HlW1ufZgKS7ApbQ=;
 b=oHKNWhoAgZwyz3Zy3bzV6SdV6if7gQwt+tv/tMMOz0GXDKzdxtaCOThggh9Ydyn7EF+petGR/G0aOCPgdcd8oAXcgQp+b6dLTaSp9owYK6MEKbc5Mz70QQcqvlQbX9f8FZKBj2q2tBWeX+rSQKUmZhPfc16foTL/q9rjwHdVzsR90o/ZVGRJM3JZwkAgQ39HFYufjo0bceEXaQZl5oz3rzl+q7fP6Q725gaJ+L6XLr03mpi5sSN5IRy4zutoPumehH68UTUvW4QhxPDdVDOQNjg0UxuIT0O+7+ccyXVpYtWpLoldAhkAzFpYQtOac6zmanc66KVIZDPcLBYXcP88mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rAQEYuN6CX/aatA/YBNc+hSMoYZ/HlW1ufZgKS7ApbQ=;
 b=RQiqFhJAzsUhGJcTM/zvK4LCcMj4NUZXX7SQXA44bV1WB3HTl+aUBLbduGmuhFRuwfRSe25xczMbWIwKFVvEOD9wFT7IesIFMs5xMPrfcd8NLy95rskHtbPALbEBISOFddghQJ9A9XWySZHDbU1Q3ftj12qMnM8J0xuNgOG74nSjgZbD1ECZSBZcn9hQpF3EpDoOoteA8oOuS4wMXsGbnqrIa66k1TL4HWlkWf3HkxVMmw85ucWvj32uhjjSbADyRbJESQaUZ5S0XzIO7AqkxhU/jvfHfiu75f9Xi6ukLtC5u73fC2bf/Uv41OIaNcaAcAkhhiGWuoB7qkqeME8xyw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM9PR04MB8954.eurprd04.prod.outlook.com (2603:10a6:20b:409::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Wed, 11 Feb
 2026 21:00:23 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9587.010; Wed, 11 Feb 2026
 21:00:23 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Wed, 11 Feb 2026 16:00:00 -0500
Subject: [PATCH 1/4] dt-bindings: pinctrl: convert fsl,imx27-pinctrl.txt to
 YAML
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260211-imx2_iomux_warning-v1-1-1c5233771b32@nxp.com>
References: <20260211-imx2_iomux_warning-v1-0-1c5233771b32@nxp.com>
In-Reply-To: <20260211-imx2_iomux_warning-v1-0-1c5233771b32@nxp.com>
To: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
 Jacky Bai <ping.bai@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 NXP S32 Linux Team <s32@nxp.com>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770843616; l=8693;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=tYqEuf0dz7jp6G6afDyOHFswFGZerFSAtrBdp+ntm1M=;
 b=d3+rn9pfi+sQe7x35aV75mz8zqEyaV449ebWPy3/FqCnOvVWAkmKE0zmfIbeL7KamXH6Vn96T
 5kz4cdaZvMlDMWX5hjOtNkKfG00EJavWILBAd59PJ0QRp/e+gUep8S5
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH7P222CA0015.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:33a::28) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM9PR04MB8954:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d4140e5-83e8-4537-b81d-08de69b0929a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|376014|7416014|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MnRVQ0lzcjNZZTRSNEhGRVJsSFlEeE9iUG9QclF1TzBZaXlwWGl5em1tN1dz?=
 =?utf-8?B?ZnJRdDhXcExidDRleVdvVWUxbG9JSkk4MGZjSDNLdVRQbkxSTTlzVHNPZ0o1?=
 =?utf-8?B?d0Q2MmtjOUdLMnNhbDA2K0tYa0tkWVNVZWYzS1Y0MnpvbmwraXlUaVdrMTRr?=
 =?utf-8?B?VEVzMWFDTysrNjQ1TmpmY2J6YVkvSjNkSXZYUnZmdlRBU2tBRnJNNCtRdWR1?=
 =?utf-8?B?VG0ydHUra2REQVVqMW56ZUZPRjkva2hHT2NJRWRzaHJ3MnIyWVg4WjZNYVNk?=
 =?utf-8?B?VTIvcnJUZlFiUHFBYWtSTHQvNGhOUC93T0gvQ0hSNGF5Ulhzc0JJSUFrZGdy?=
 =?utf-8?B?OWFqY1BFRjJUcDl0RktlN0VDbW1ERy9LTnBEY0hWbStjbGJ2NnF1dHIvZDh1?=
 =?utf-8?B?Y1ZGRGZyNHhrbmRDb0pVSk5MZ2dNTWNQWmtYYmp0QmVJenZEZ3hBWU9YRmNy?=
 =?utf-8?B?WnZtU0JwUEZBM1dtM0F3USsrMWtOMkFDRVA5NlFydy9UUFEwYXpIeCtlMU5W?=
 =?utf-8?B?WkMzOWpSazZtdnBmSE1pQU1uZXVuSWtEd2lyNDZMZmM5bWNMa0RBOW1GMktW?=
 =?utf-8?B?b3ZOUXNJTjZNelpnWWdjazNEUFZQNHkxbHI1N3B4T2d0QStjU0NqZmF6bEwx?=
 =?utf-8?B?UU9RNjM2b29EVkViZlNIbWxETU9EUk5UR1g4QjVCZXV4TXRsZWtHb2x5UFRC?=
 =?utf-8?B?WW1CTUM4Y3QvS2h6dkFSeUVSSXZJZzM3VmJMbEYwWlJ3R0tDc05PdzRicGVy?=
 =?utf-8?B?ZjFjM3Q5YlNFTmxKamNSQ3NoYnpOM281SGExTFVmb2c1WlBIeTFvL3RCOGNH?=
 =?utf-8?B?aXRtQTVMTlE4YWFLTW9JUVdoQnVMNFlqVHR4bytOeklEWlBpNHFTVjRZZ1Z6?=
 =?utf-8?B?VkxWb0hFbnZGQVMrTnpCdTdDYlhWMDgyZTRkZkMyZHk2dUpxY0srZ0lzRGlW?=
 =?utf-8?B?cDlTd3JtQ0dwRnlkTEhvTFFUd1NWL0xkRjRGOUdtTm5RQXdHTlpCYVFRUVpV?=
 =?utf-8?B?ZTJCT3QrbEVIQytoWGtabG5DM2YwQ0Y2OTArT0crWllLR2ZZNjdFL1FDd1ll?=
 =?utf-8?B?cUxIQVVCTHdzZjJESXVhZUFIdEJRK2tTQVUvSm1TbmkrNENiQVkxSW8yekp3?=
 =?utf-8?B?cGVtaGpJeGRZZ1hBNXVsYXpiSXJGT0xEblRVZi9DRlVDRnUvaXpGaFI1VzdU?=
 =?utf-8?B?eWtMU3NNTmlvZ2o2ZjBKRytaV3ZNcFJMRjB5dkgvMytxSEZIZDJ6VzMyZi90?=
 =?utf-8?B?dkMxSlJ1WkwzMW1raC9IRG52NFAvcC9NVEtKQWUxOForUjhYUmRsR3R0NGds?=
 =?utf-8?B?dHRON1JkRjY5M2QrcjFtc0tKWW91V1lJR3pJNEVBenZHQm8xSWo1eUo2Z1E5?=
 =?utf-8?B?V094M0hEckJZM1Q2dWxWTTMxai9PbENJWUpMMmM5N2owbndQNTVGUGlFYjlY?=
 =?utf-8?B?d3lNMTlvL1k5V1dZWnBYOFIyWTFuRGFiMDcrVXJGTjlJN09SMEhydk9GY2Jh?=
 =?utf-8?B?eGpBOWtGVkR1YW5ZQW9peFBkL0tHZ1N5b1JFZFRGYys0YndDeExWM1U0Y0RN?=
 =?utf-8?B?LzM3TVlnSnlEems5Q1NUWklLU3BDUzlvak5oanBJaVUvNmZ3QkFGY0M2Lzcy?=
 =?utf-8?B?NWtxajBSdEptOXJ0QjB3ZkFoRTQ1VlA3NklBVi9rOERzVlJHOFdhOWszV2RP?=
 =?utf-8?B?MlVWNnFMQ1doMlZFaDhCcEJoVWkzV3huek5KVzh6UGJ3NGxmazYrNC9XUkRM?=
 =?utf-8?B?Z1d3VDdBMmJZMGVKTjk5SUdyVm5weGFPWTRIVkp6Y1o2cHFTdkhHMjcyVEpE?=
 =?utf-8?B?WTVjb2VPb0I2SE5KOHJXVythdU53TTVjMUdrOHRvZjJmR0tkazVkS2FyQy84?=
 =?utf-8?B?MmkrVVZBcndPYllTK0FrS0Y1enpXb2p5REx4WEhGM0FyOHRSTDRlNUR0V1la?=
 =?utf-8?B?aC9reklkZnMrY291ZERRWml1azYrcWdGOHdJTTE2bkFXYnZtSVF4K3V2SzAw?=
 =?utf-8?B?Smp1dks4Ym1rNjBtcmErN0FHRGs0RVRNU0hUcDFCc3ZVTE94a3MvdzNvazFq?=
 =?utf-8?B?Ym44ZGp2OUoveGV5dXBxR3RicHBFMlJ1TTlWN3ZvV0IxZW8wU2t5WGVCQ2lI?=
 =?utf-8?B?Wm0yT3k2dWg5ZFF5ZE1mWXgzYTBzYStoZkkxZzkrYkxQQTdobnRRREdOMnFO?=
 =?utf-8?B?L1E9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(376014)(7416014)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UlhZTlYwNllDL2JiTHJYTjN1eTkrbUh0cFVqY2JaRVcwOExGTitmUVZKejZU?=
 =?utf-8?B?czBLU2NjaEtURmUycWY4RnlZSU9kaDJpeU1WWTBZejF3bTBnc0g0SEl0QXBj?=
 =?utf-8?B?aVg5RG4rKzhidnNselp3MDB3ZUc0dlIrVkZBNWdDTUx4Um4rVHNJY2t5cFM4?=
 =?utf-8?B?Z2FsWDdvajUzdk0yTDQwQmt5SjFUWGJBYUhBZ21wRUx4czUrSEpqbnY1MjBC?=
 =?utf-8?B?U2V5c1VqWXlmb2hQOWRQWk1YcVhYZTRPTnhzQitpUkorWXh6R3NPZkcvUHdQ?=
 =?utf-8?B?NmE4Q0RtdXdTMmdFdzg5aDBmcC9aUmViZVZEZmdxbWZOWERKdFJzSjhieDdT?=
 =?utf-8?B?TlJzVklmOU0yRUsrU3FpSHMxTGlPOXpIRXZkdlpieDN0N2pqUWVHZXVUTTdk?=
 =?utf-8?B?Q1E1MHk5ckQyWjJZLzJhTjE0Y2hrUkZtSWxlN01zU1BjQUlvc1daTzBRZmJR?=
 =?utf-8?B?UzdRMG83ZExLT1Qydy9rOFZQbkRsUEZWMUNWMktGdTkzbFBqUktpTEhiNUR5?=
 =?utf-8?B?QmhFNWdTNlJDUUZOMGhIdUxOS3BKc0JIZnlEdEJpcVpDeXM4eXdCNHY0bFpX?=
 =?utf-8?B?VjJ3MWszNVhPUXVMT3IrWmZNK0JSbUhZK2hVS2U1bHlwaEYzQ010MGdnaVZQ?=
 =?utf-8?B?UVVXZlZNVVVmaXdnNlZnRmJTZDVnT3RBbjVCZVdRRG5PMjg2Y3dZbFFnYjZW?=
 =?utf-8?B?UWZmMmZaYVAvSnkremxhSThSVy9uK3lCZkp0OGVqeWViOFlaMHFVSjhUSWhL?=
 =?utf-8?B?YVd5b1MyekR5M1dPZ0hGOXI2MXlyVlZEL01Ec3k2Snltd3lVbGJoV1M0RVFp?=
 =?utf-8?B?RGhkKys1Nm9LYUQ3VUVsd1dUZ0R5S0c0YVhjalJXeStST0R5TXpSRDlhRmdW?=
 =?utf-8?B?eWxqdzNJcldlOWJ1WlRZZUFZWFUrajRBQUhER0lUNUsxc0l1REFhZFQ5dTFo?=
 =?utf-8?B?YzRHWEQ4dWRtSVVWa05mVHFMdmQvbGkwMXZKUTVneXQveEdLbE80NjhqbEZ4?=
 =?utf-8?B?bWV0c1EvRVNuSDlYekNMOWlDcjRObXo1ZVc2Z0NUTkhGSjRHRzJlWnFDZXBl?=
 =?utf-8?B?K08zeEx5eGswemp2TS83N1RuWXE0Q21uVGNLSmJEMXhHNnVXdWFHTGlOSlkw?=
 =?utf-8?B?Y0xOREdaZWxTTjZ6KzhUdGVGR1hxNldoRVh4Z2l0MER1cFdabXROLytJVEw3?=
 =?utf-8?B?c1lhVCszS1pnM2pUNjZZeXltSkQ5aWc5VFJSUktFOEVPRnpuekVScDdydFFM?=
 =?utf-8?B?V1VKY2pqSjRkNUozZXBkUVBET0lReUdRWjlMOHExK0dhTGhWZUlSbEFHUEJm?=
 =?utf-8?B?RklTcXRwQjVacW84Y09PTjF3Zk9RV1dGN3hkbTZkbWR4QzZFem1HQ29CeWF2?=
 =?utf-8?B?TXhHZ211azZWRUtFSGNXV1lKNUZJMmdzbVB1NjNxbUx6WUNueWlZMWVNTjkr?=
 =?utf-8?B?N2czTm9sZVd4bUR0UzZJNWdwbVhGdk45eTdLa3dwUWZCQ3ZFSDY4cm9ESGl0?=
 =?utf-8?B?UzhtcXlaWEpTRHJ1dUgyVlcwYjM3Y1F2Tk1XQjF3dDlOTEtndFd1eEk2aVFx?=
 =?utf-8?B?UzN0T29uS0xLQ3Y5b1JSSnAzWDNoR2VyRVpTK2U2WmxScm0rUk9OMkYwVGdr?=
 =?utf-8?B?SitGUFFjNm13b1cwaUo1VTB2TlU3ZEdIbVl4WlQxS2RRaU54cDZ3b0c3ci81?=
 =?utf-8?B?ZnNPd1duSFV1dGdZd1pKajVpckpybXA3MWs3bzYzSHBOVDdxZlFWc1ZCOG9a?=
 =?utf-8?B?a21FMEdFQXJrTzJGK0NRbzNQWU1VTHVvdERObTJyRDdsZG9Qd050Q2QzWmhm?=
 =?utf-8?B?QlhLTXgranZMNEdsOERORkxsVFpjL2NVNDBqSTl3V0dmL2NIQnN2bEZlZnRR?=
 =?utf-8?B?dzVzZytjYmMvTjlVcG11L0pFeWdnUDlXZEwvRVppNU10bllWS0Vxa3NiYWlR?=
 =?utf-8?B?RWZkRWFNU1pVS085ODNNeGoyQ2xjZm5ZaFZBbDhxbDlwcWxCQlB2V3V2YWoz?=
 =?utf-8?B?YkZ1TytCbVM0czNkYkZXekRUM1NsOGdWczNOeU15MlNnZkgrbXI4eXl2QjBM?=
 =?utf-8?B?OTN6bjZSZHJRRVpQbkhzTWJQekZ2RUlVSE5vMGVoQU1ndkZBY1dDTzlMOG42?=
 =?utf-8?B?WVcwcXZXQVRoU1VBaWI3OVRzSUZTcHVyRW5XeDhZWk81NUxMY3JmTElEaEtV?=
 =?utf-8?B?QWVxMm5MSE1LN0plcWk3c0Zqd3dyTVp3Zy9xak1vY1N1MGg2a0ZjeldIS0pH?=
 =?utf-8?B?TWJLTm1PaldwdFJNdWhYaGlDYXlRTk1VVHlSY21EemgzbE10d2NKZEhtN3NB?=
 =?utf-8?Q?cpw3xgVLFydT+duzYZ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d4140e5-83e8-4537-b81d-08de69b0929a
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 21:00:22.9539
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xY+9GtmCPnQiulsv7EZXD6xUgz05Hyxy5fqxE7/GGxac7Vp7zIis51H7NvsrLCnpIoPYCgeYObWhB+Dczt6JtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8954
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31620-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[nxp.com,gmail.com,pengutronix.de,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@nxp.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,nxp.com:mid,nxp.com:dkim,nxp.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.152.209.24:email]
X-Rspamd-Queue-Id: 4E2E012792C
X-Rspamd-Action: no action

Convert fsl,imx27-pinctrl.txt to YAML format.

Additional changes:
- Add the compatible string "fsl,imx1-iomuxc".
- Add gpio@... child nodes.
- Add ranges property.
- Remove the redundant intermediate node between pinmux and group nodes.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../bindings/pinctrl/fsl,imx27-iomuxc.yaml         | 126 +++++++++++++++++++++
 .../bindings/pinctrl/fsl,imx27-pinctrl.txt         | 121 --------------------
 2 files changed, 126 insertions(+), 121 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,imx27-iomuxc.yaml b/Documentation/devicetree/bindings/pinctrl/fsl,imx27-iomuxc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..1254bfcaa7cb6b2d3c66cb0e0e47b968a951d9f4
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/fsl,imx27-iomuxc.yaml
@@ -0,0 +1,126 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/fsl,imx27-iomuxc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX1/i.MX25/i.MX27 IOMUX Controller
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+description:
+  Please refer to fsl,imx-pinctrl.txt and pinctrl-bindings.txt in this directory
+  for common binding part and usage.
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx1-iomuxc
+      - fsl,imx27-iomuxc
+
+  reg:
+    maxItems: 1
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 1
+
+  ranges: true
+
+patternProperties:
+  '^gpio@[0-9a-f]+$':
+    type: object
+    $ref: /schemas/gpio/fsl-imx-gpio.yaml
+    unevaluatedProperties: false
+
+  'grp$':
+    type: object
+    description:
+      Pinctrl node's client devices use subnodes for desired pin configuration.
+      Client device subnodes use below standard properties.
+
+    properties:
+      fsl,pins:
+        description:
+          three integers array, represents a group of pins mux and config
+          setting. The format is fsl,pins = <PIN MUX_ID CONFIG>.
+        $ref: /schemas/types.yaml#/definitions/uint32-matrix
+        items:
+          items:
+            - description:
+                PIN is an integer between 0 and 0xbf. imx27 has 6 ports with 32
+                configurable pins each. PIN is PORT * 32 + PORT_PIN, PORT_PIN
+                is the pin number on the specific port (between 0 and 31)
+            - description: |
+                MUX_ID is function + (direction << 2) + (gpio_oconf << 4)
+                + (gpio_iconfa << 8) + (gpio_iconfb << 10)
+
+                function value is used to select the pin function.
+                Possible values:
+                  0 - Primary function
+                  1 - Alternate function
+                  2 - GPIO
+                Registers: GIUS (GPIO In Use), GPR (General Purpose Register)
+
+                direction defines the data direction of the pin.
+                Possible values:
+                  0 - Input
+                  1 - Output
+                Register: DDIR
+
+                gpio_oconf configures the gpio submodule output signal.
+                This does not have any effect unless GPIO function is
+                selected. A/B/C_IN are output signals of function blocks
+                A,B and C. Specific function blocks are described in the
+                reference manual.
+                Possible values:
+                  0 - A_IN
+                  1 - B_IN
+                  2 - C_IN
+                  3 - Data Register
+                Registers: OCR1, OCR2
+
+                gpio_iconfa/b configures the gpio submodule input to
+                functionblocks A and B. GPIO function should be selected if
+                this is configured.
+                Possible values:
+                  0 - GPIO_IN
+                  1 - Interrupt Status Register
+                  2 - Pulldown
+                  3 - Pullup
+                Registers ICONFA1, ICONFA2, ICONFB1 and ICONFB2
+
+            - description:
+                CONFIG can be 0 or 1, meaning Pullup disable/enable.
+    required:
+      - fsl,pins
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+
+allOf:
+  - $ref: pinctrl.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    pinmux@10015000 {
+        compatible = "fsl,imx27-iomuxc";
+        reg = <0x10015000 0x600>;
+
+        uartgrp {
+            fsl,pins = <
+                0x8c 0x004 0x0 /* UART1_TXD__UART1_TXD */
+                0x8d 0x000 0x0 /* UART1_RXD__UART1_RXD */
+                0x8e 0x004 0x0 /* UART1_CTS__UART1_CTS */
+                0x8f 0x000 0x0 /* UART1_RTS__UART1_RTS */
+            >;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,imx27-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/fsl,imx27-pinctrl.txt
deleted file mode 100644
index d1706ea8257230121f2843bd7684faccd160198b..0000000000000000000000000000000000000000
--- a/Documentation/devicetree/bindings/pinctrl/fsl,imx27-pinctrl.txt
+++ /dev/null
@@ -1,121 +0,0 @@
-* Freescale IMX27 IOMUX Controller
-
-Required properties:
-- compatible: "fsl,imx27-iomuxc"
-
-The iomuxc driver node should define subnodes containing of pinctrl configuration subnodes.
-
-Required properties for pin configuration node:
-- fsl,pins: three integers array, represents a group of pins mux and config
-  setting. The format is fsl,pins = <PIN MUX_ID CONFIG>.
-
-  PIN is an integer between 0 and 0xbf. imx27 has 6 ports with 32 configurable
-  configurable pins each. PIN is PORT * 32 + PORT_PIN, PORT_PIN is the pin
-  number on the specific port (between 0 and 31).
-
-  MUX_ID is
-    function + (direction << 2) + (gpio_oconf << 4) + (gpio_iconfa << 8) + (gpio_iconfb << 10)
-
-      function value is used to select the pin function.
-      Possible values:
-          0 - Primary function
-          1 - Alternate function
-          2 - GPIO
-      Registers: GIUS (GPIO In Use), GPR (General Purpose Register)
-
-      direction defines the data direction of the pin.
-      Possible values:
-          0 - Input
-          1 - Output
-      Register: DDIR
-
-      gpio_oconf configures the gpio submodule output signal. This does not
-      have any effect unless GPIO function is selected. A/B/C_IN are output
-      signals of function blocks A,B and C. Specific function blocks are
-      described in the reference manual.
-      Possible values:
-          0 - A_IN
-          1 - B_IN
-          2 - C_IN
-          3 - Data Register
-      Registers: OCR1, OCR2
-
-      gpio_iconfa/b configures the gpio submodule input to functionblocks A and
-      B. GPIO function should be selected if this is configured.
-      Possible values:
-          0 - GPIO_IN
-          1 - Interrupt Status Register
-          2 - Pulldown
-          3 - Pullup
-      Registers ICONFA1, ICONFA2, ICONFB1 and ICONFB2
-
-  CONFIG can be 0 or 1, meaning Pullup disable/enable.
-
-
-The iomux controller has gpio child nodes which are embedded in the iomux
-control registers. They have to be defined as child nodes of the iomux device
-node. If gpio subnodes are defined "#address-cells", "#size-cells" and "ranges"
-properties for the iomux device node are required.
-
-Example:
-
-iomuxc: iomuxc@10015000 {
-	compatible = "fsl,imx27-iomuxc";
-	reg = <0x10015000 0x600>;
-	#address-cells = <1>;
-	#size-cells = <1>;
-	ranges;
-
-	gpio1: gpio@10015000 {
-		...
-	};
-
-	...
-
-	uart {
-		pinctrl_uart1: uart-1 {
-			fsl,pins = <
-				0x8c 0x004 0x0 /* UART1_TXD__UART1_TXD */
-				0x8d 0x000 0x0 /* UART1_RXD__UART1_RXD */
-				0x8e 0x004 0x0 /* UART1_CTS__UART1_CTS */
-				0x8f 0x000 0x0 /* UART1_RTS__UART1_RTS */
-			>;
-		};
-
-		...
-	};
-};
-
-
-For convenience there are macros defined in imx27-pinfunc.h which provide PIN
-and MUX_ID. They are structured as MX27_PAD_<Pad name>__<Signal name>. The names
-are defined in the i.MX27 reference manual.
-
-The above example using macros:
-
-iomuxc: iomuxc@10015000 {
-	compatible = "fsl,imx27-iomuxc";
-	reg = <0x10015000 0x600>;
-	#address-cells = <1>;
-	#size-cells = <1>;
-	ranges;
-
-	gpio1: gpio@10015000 {
-		...
-	};
-
-	...
-
-	uart {
-		pinctrl_uart1: uart-1 {
-			fsl,pins = <
-				MX27_PAD_UART1_TXD__UART1_TXD 0x0
-				MX27_PAD_UART1_RXD__UART1_RXD 0x0
-				MX27_PAD_UART1_CTS__UART1_CTS 0x0
-				MX27_PAD_UART1_RTS__UART1_RTS 0x0
-			>;
-		};
-
-		...
-	};
-};

-- 
2.43.0


