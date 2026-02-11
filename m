Return-Path: <linux-gpio+bounces-31619-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0OsDDu3tjGmSvgAAu9opvQ
	(envelope-from <linux-gpio+bounces-31619-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 22:00:29 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED9812790E
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 22:00:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 86AC23028B11
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 21:00:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83C6414A91;
	Wed, 11 Feb 2026 21:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="a3oU6xOQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010034.outbound.protection.outlook.com [52.101.84.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3AA886352;
	Wed, 11 Feb 2026 21:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770843624; cv=fail; b=stzXeGIhISoMmdX3lEDpj30I/4i91/idRWwQf+PWgGfdbXnYCfTUophtTUlyu6XDCLc9lajpbZD2MIXGz2snF7z5wAc/+05WRRuPLAgOLPOgH8Eg0qqIOXCGN9Vl9eaezyqhHFxuAzM/NBUy1J5sk2soGXv05liBuxu7bm/Ctt8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770843624; c=relaxed/simple;
	bh=4ZuVoG4Tlk5YrVtd7ZlDJzbOcgkSExydEF8wGk7lXBo=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=MkPNTl3NafaX1toVoF67H++buxuS/r6oI2GtWWYQ4Nk4zL7GCDJhBGNVeEeGvZ0rRwIK3Y0yHGCS1ntPg9XCoaLSnGnM6Nl0PqR7Tw2lw76svuZnl3WDSFMkEZSe04XVY0Y3NKzuyciGQtcqnPVr0d/Pobuql2fP1SvCqn4/BWk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=a3oU6xOQ; arc=fail smtp.client-ip=52.101.84.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LvXEytCZ29sI7EIkk5WT7CkmjGwq5vmGTgKdGxlNuf4ZCut99yevndYSBFadJDxHU5NiDLQ7ioEaMu5lEzU15lSMtQcfEfRuVyk/dq3woeekkawuKDPGYpIen85XV5huBppBF5lolc8tsoUR3qLswrEUQdL+cPxIQQSmEw1skNKwnRh8As1hiH0Xmv/CcxDKpmybTRMIRYpuPs8kSQATzAsa8FF/zm1o3fsyaPGwr9J+SC/YPPJIi798MkF0KBkaXdEHyGo7uHXiPWBUZiLd7yKgDN3xCmpSTwu85FNsFywIYWmSdIF7x/4GTfFtlxsF3QT7XgFiflSGFiPH+Z41kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/+tEJgXe69jTJp0xaJnCL5ijJ36+CnQlrysVJPLlDXQ=;
 b=sCLZp6jrzh3ZiTU00Ok5fmmPYNNgvROTBuHH+s0WAP69xbamX6DXAQnAeOJWtBfwngffhMH/ELdpe0ycc6ooNua9KnNvi+XRpy3V72ODRZ3fLbgsu/Wehg54Vaz7H259dPlo44GhF41FiWo2ilCY9xBdLYKox5Q+SR1sC/IzUECMRxjApruVhX9QDqTldV62isD1UBcN8/6nEKFrCdGEL/NXOj4MQbh1VpO/Kv5woHCjrUK4NToHfJfh63Da7aSLmNr3Vl1Wi9LhmxOgEi2up8Q10fOQYeLpPX9hskJGzozA0PmRKXZHxyM3cdbV/F8h/2aZkBqoOD9bHR9RDzCYIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/+tEJgXe69jTJp0xaJnCL5ijJ36+CnQlrysVJPLlDXQ=;
 b=a3oU6xOQ9UUAHJbHoO0Q57YHmgZ8AEowsT23bi8kFNe77gk75ibGGnq0lhZCjzetC7d2bGWB5gviwpCG/PoeRE1No1CbNiRK59SGaTdDwZme/7d3UrxuiC4zBNMwkMG9ksH8D+Sg7HVDVXoPRGyQewjQvmD2uE0COIP6l8TS2xIkn0UtjI98xnfFtNvMDJhvdV8O6jG/Yxp7JecMs4qo3V9aiLkR5K4Fzsrs0WR7Ca/ogPw+UhZZ4wHV+3n3tfzqB7jAYt6Mmkpbh/DAiRNBtclcqMsfS8uQ9+13DDBDoC9tsoetb4QNp8nUvCuc/ZKCa3Jzd53MkavFh7rpFTnfVw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM9PR04MB8954.eurprd04.prod.outlook.com (2603:10a6:20b:409::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Wed, 11 Feb
 2026 21:00:19 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9587.010; Wed, 11 Feb 2026
 21:00:19 +0000
From: Frank Li <Frank.Li@nxp.com>
Subject: [PATCH 0/4] ARM: dts: imx: cleanup iomux related CHECK_DTBS
 warnings for imx1, imx25 and imx27
Date: Wed, 11 Feb 2026 15:59:59 -0500
Message-Id: <20260211-imx2_iomux_warning-v1-0-1c5233771b32@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM/tjGkC/x3MTQqAIBBA4avErBN0KPu5SkRETTYLNZRKiO6et
 PwW7z0QKTBF6IsHAl0c2bsMVRaw7LMzJHjNBpSoJSol2Cac2NszTfccHDsjat3Um2o1YdVBDo9
 AG6d/Oozv+wHgqOJiZAAAAA==
X-Change-ID: 20260211-imx2_iomux_warning-5675f186e249
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770843616; l=2232;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=4ZuVoG4Tlk5YrVtd7ZlDJzbOcgkSExydEF8wGk7lXBo=;
 b=m0HL76ditFGOzGzEMjmu1F9ryMB5k3Oxg1K1I9qv/f/6gpOorfNlr/FHVVxAWmgOkGmQfdHD/
 egeRXLA6xLnAvNt8u5k/wWiPJerdE+jF8hi+novwmqOnnoL6LYanOR/
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
X-MS-Office365-Filtering-Correlation-Id: 45ccb1fe-25eb-4483-5a9b-08de69b09093
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|376014|7416014|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cGd0anJWcDZPMDdWM1NLc3Y4R1dHdnc3ems0WSsvSTRpYnlTZkUxQk9HNnRt?=
 =?utf-8?B?a2ZQcnppc1prdVg2ZnFMKzA3WVJPWVV6MXBxRlBHaG9lS0J6eDhWa0hERjNj?=
 =?utf-8?B?SlFJY05kQnB1blgzdjY2NzI3OW9FRFZuSGFJTmdqRUhOanlULy9PeFhXbi9o?=
 =?utf-8?B?Z0xmZXAwK0RNY3JUalNqK2kwWmRYSldLc0owM3QwQkppY01lRnhobmhpcTVV?=
 =?utf-8?B?cWc4WEtFdlVKYzdHcmRRdUd3OXE4UHJ4YWRnNi9iZWNIMkc1cVltcFEzR1NI?=
 =?utf-8?B?UmEzcnp4Qzc4S1RSK3dIR2xUNkJvSjhKSG1sQlc3T0dVdlYyVDU0d2RXTWJW?=
 =?utf-8?B?b0p4WHZsZXBrNmVWKzlJc3h0WEV0OU5VQWJYTzc4RDNTTXhIUnNIcE14azY2?=
 =?utf-8?B?VXJPd09OcGExbWtqaTRiSmVyNEtvZDZmc1F6Z2NnbmxMbi9hRXcxNC96Zk5T?=
 =?utf-8?B?QS9PMVhYYUQ3WVl2Ylp0eUljVnJLUnBuR1hOL2JLNm8zOFlxTnNlTTVXWm03?=
 =?utf-8?B?WlZ4TDB1aDhRRFlpSkkzRkpGS0tLcnFONzNxQlJ6NS9HaDhGa0ovWHQ4WnNx?=
 =?utf-8?B?NjZCZlo5R1FiMnFIWHIvKzRMeGFqMjBSWW1MWndtU2doZlhKNCt1UFNjZnUz?=
 =?utf-8?B?bE9DZUFTcHF0YkYvd3MvV0NtalNnQnkwZFJub3pPNmVWNVQrbzJKRjVwR1gz?=
 =?utf-8?B?VEc3VncwQnRqcERpQU1lQitFMHM4RWlDVGE2Q3d2SzFJWTJpNDdMV3doS3JM?=
 =?utf-8?B?V3ZuV1lqOWdQek42NVVIYzZJcWhKY0ROZ3FUZ2dJOWdsN0tlUEFHdkRHMWho?=
 =?utf-8?B?UTJLY0prdEhyN2tzdHJmWmppTzRQMDNaT29USExKV2FLei9DZ3g3cGVEOTMw?=
 =?utf-8?B?a3FpNTB1WThjWkJ2QUtMYWZKWWM0bW9jaUxmTTkrUktld0t6ZUpJdnNlQlZR?=
 =?utf-8?B?MlhOb1Z6bGw0ZHFtRHpEc0pVdWg0eUZKcWFFc1pTRWJORXJodG9seERXRjNu?=
 =?utf-8?B?N0RVZWRmdDFlbEVMUEVaNTRpWFpEV0NGMEMvMnpxd3VabjZKcGpxcGNzc2tz?=
 =?utf-8?B?SC9hTmhsT3FhKzc4aXJMWkc2bGMxdmVTTHJmTnZuYk8vOUR4amxDMHJpNjdN?=
 =?utf-8?B?UnAzR243bXhXdlMvSjJXQ2xGYVN6ZUREd1hTamw5a0JFakhPMXliNEpadndi?=
 =?utf-8?B?eTN2QXZWWHZTYU9oUzFrUUUzV2tZTkhPT1pRUHhTOXRhUkZSR2hUMTVHQkN2?=
 =?utf-8?B?d1NEZ094NE1kRkFGZ0JiOUoyUFRKUGtNNzFBazRGbVBsV1hnb2l3U04xQlM4?=
 =?utf-8?B?ODA3eGJEdnFxNUF5Qld3YWdyMDQ0STRMWTZVcU8wTlg5TU1RczdhcWFucHox?=
 =?utf-8?B?VXJ5dG90OWNGY2w2NFJHWGhRd3gxZHBXKzVaY1pMKys0YUY3WmttZ2QwQWFl?=
 =?utf-8?B?L0tpVGZ1Y3M3M2J0VHBZUmUzeWRRRVhqTXdQcXBENURhTHR4Y3gxcG0wMjdx?=
 =?utf-8?B?eTFVR0RhMTk4KytOaCtoVGxRMXEvNm5NMHdLVnZnMUlSdEdDbC9QTUxyQWg0?=
 =?utf-8?B?WG5hVitadmFWNk5XeDhOOVlYSFZBWlN2eEptRm9PSWJuM2JrbS9CejhURnIw?=
 =?utf-8?B?YnZKTCtxbDRSb3cvYmxnSFJjUVVXVXF2NnFqL2Y2UXJUMnlxSTk4T1ozeE0y?=
 =?utf-8?B?NG84L2h6TDQya2NYaXRHa3BVUlkwNkgvdkd0VElzQjZHRkxjeUg4UENJL0VX?=
 =?utf-8?B?MW13MWFrWXVrRXFYbmRBaGdWSC9IUEJ5QjRXczMwZjB1OEZaRWoySG45Y1hv?=
 =?utf-8?B?L2I1MHE5N1RXU1d4a21rTHFPNHpudVdBYUZPa3Z4dVNJeXhmQ0pyQW5JMXRo?=
 =?utf-8?B?d01GRURSRHl5VmRXZXpRRklWR1hnYlZhb3VkYnU5Qmo3b2p5SFRjTVFTTkZ5?=
 =?utf-8?B?eWpSQXlFODRDeHVUaVF1aFhEOVNDbytBVHNURTJxUUFPZGRHK2NpenFQOTFO?=
 =?utf-8?B?Z3RPZ1h5T1hQbWIxZ1pJMkFJYVZOb2Nvc3pDY0FxWnJ3RTBTa2k2L0lZNGlx?=
 =?utf-8?B?a1JFOU5RbmhqNklhd2VQRGlJTG5JYWxGVWVEc3lYNzEvc2dkMStUYVhucmpl?=
 =?utf-8?B?Zlc0WjR3cGw2dHgwVDF2QzlIaTVFb2VhTVlROUx6NGRMVElyai81WWNxOVFs?=
 =?utf-8?Q?8GrgD4e+sPrSJ8nZaP7AiMhb4JkRo1E2AbPrnwqv5C2V?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(376014)(7416014)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aUsxYU04NEZHcU5TZlJOOU1IdzlVZlFMdnlPOFFpaE83OEFwMGFuUDNZOHE5?=
 =?utf-8?B?VjBxc2FwTHNhOUViUS9wNGVIMUxVaThLNDN0MmtoRkdtU3RBNzhUdExTV2Qx?=
 =?utf-8?B?RTh0SDJGK08wVHlRKzNaVVhGNVJ3N1ZBVWlwOFpwdWNKQ0I5MURUc3hqVGN5?=
 =?utf-8?B?QitBbHJsOXNrb0pZWldibVdDOXA0Q0RiVm5DV2REeWVjakIvbUJWQUp4dk1R?=
 =?utf-8?B?OWQyT01lWHMzazNZTTJNTWVCbURlb1VpTmg4Z3p2V0t5ekx0ZmRLZ21nQTRL?=
 =?utf-8?B?eXRVUmlRTEVFYVJvQkFFdlJ3bDNPRDVXT29IZzFCQUo5NjJybDdtdEZjSFBv?=
 =?utf-8?B?QTZuUTBxa2RHd1BkSG1sOGNKSkNkSG1OWTl0RlhwUGJSM1E1a0JVelVOSU1J?=
 =?utf-8?B?Rmkwc2xIUHYyN2RlTXlweC9UeC85dFk3U2ZaaUUxbDZ6UFBlNzRudXgwWmYw?=
 =?utf-8?B?bFNPemJEVjJzYm03aElsejJBbHJuZVZwUGVFcWpPcitaZlh2Nzk0Wmo4SmVW?=
 =?utf-8?B?Nlg5enFTM0ZyS0lyS0hDNDdSU1I4dWxaY2tJZXE4WmZLWk5TSG5GMWNoUXV5?=
 =?utf-8?B?T1FxNG5ML04yUVNiaUhGTDU5M1V5TUJ3SHpSNEhzcUNJbGVyUWJxRUk2WERj?=
 =?utf-8?B?ckZWV0NEMmxoWDVha2NQQkl0RGhLVVBoZzAybjN5ZU44cWMxaml5RnhhMy9r?=
 =?utf-8?B?Y3F3b3B6THJwcFdqRlhJb2tzSXBibUMvVFEyQ2hDQnQwNlZQc3Q3UkJSbkNv?=
 =?utf-8?B?WGhXa3luTkRLakw4aGdHQnIyak94M1VrU2tSUVBPOHlLeTlQbTJ5RE1PU0Fj?=
 =?utf-8?B?YmQrTUJLL2pzMnVzK2VCd2MrZ0FOWHFNVWRPVU42UUlUYy84MFAwUFExSDhv?=
 =?utf-8?B?aHgwaVphS3hiZForN2NJRW1iQ0pPNjIzRUxsUStIdEJYQ05pOVlId0tRVTJU?=
 =?utf-8?B?VmphZ2R0U21Fbm5HeFY2K0ZnTE5URlY3cEVOcmdVNVJGNnFvdkRGNlIwNVd2?=
 =?utf-8?B?T0Y4THdHUzI1UFJ6RkpIQ1dHM0tDTWNsZUdzOXd5NDZNZWVtTXk4cHkyR0pO?=
 =?utf-8?B?WWF0ME9tQ2lmelVKWDRBb1lHSVdHSktBWXdoY1ZxblBGd0pTOHlYSUpSYUJ0?=
 =?utf-8?B?S3RhdEJrZ2ZubUZIL0cvV1BxSnA5MWZWdjZVSnhBR3F0ZnhZTWhXTVgrSENw?=
 =?utf-8?B?d3lmVkErd01BVkxiV0VBazhGMGpGYXlPbW1XSEoxNENWZk0xOFErclEyK3NI?=
 =?utf-8?B?U1RtZ1B3c0VjUDErbnh5YnpzRUovcWM0SXRpYTJwZXBaYU45QTFBRG1jSG4v?=
 =?utf-8?B?SzRTVzJuaS9RYnVCMko3bFpLaG56SGJmcEFMbGJOb1VCaTIrc3BMRUFBNUVa?=
 =?utf-8?B?eFZYMWRScGhyYXozdk11WXp4bS9VTFZDbGMyRjJwM3Vhdm00dEFDWnBGWlZB?=
 =?utf-8?B?R09vc1B6OG04eVFuMXJ2UERIbk04TS96RmRuN0R5NDM0MFozYlJYNk5zSE1q?=
 =?utf-8?B?TDhtaVl2UjRWS2I2dEEvS3g0dC9lcWZOZEkyUXpZZHFSV3lrWFZxSWdhM09D?=
 =?utf-8?B?QWUvMCt0L2piVnZTSGxLNUhldFBDNVhzVWF5VDd1ZTBhSXNmdjUycmN2MTdI?=
 =?utf-8?B?dC9saDdzZDhVb0pYZjY2S25qeCtRN2Z0NEhpZDVqcDZsQm84NHd2Sm0rR3lF?=
 =?utf-8?B?UTVCTW9qZ3NXL2s1TEcvbTNuSXJjYndSQlRySEhFcWJuUTIwMzJDenhyMkpa?=
 =?utf-8?B?ZG5mSXVkekhYVnBmNGVZVUN1S1IxcWdDaWNkT0ZiTVZhZnNsVzRtU2syd1ov?=
 =?utf-8?B?Yi9LM1RRVWdmTXI1ZjZrTDVOV29WWlNMWmMyclJ1V0lpVzFCRzdpeHdwZjd3?=
 =?utf-8?B?Z0Y3anFKRWpwWWcxS1F4QklLVHN4TWVWV0lHQTRBWmZpSWlkakdWbXhWQ0E3?=
 =?utf-8?B?VENBeDhqZnBHUFlxdEQzWk56WDk0UnlQUlg3RlpDUDVWY25WS3I2cG9IRERH?=
 =?utf-8?B?eVM2eXpCOHF2aytIZlNtTmtNaXJSa21nZ0lTa0VhZSsvcTJQYXBVZERUWm5E?=
 =?utf-8?B?SHdJbzlmSGVuOGEyOFdXQVdUdngvdkpaNHJiZjR1VDdtNUpTSEF2Q2F3UmZt?=
 =?utf-8?B?T0t2QmExK2JLb1Y0VmVDNGZoVkdwYmJrVHNMOUV1UE5ZNUVTYlpYbjJPaUN5?=
 =?utf-8?B?TGZUa0JHMEVTd2plb3JvbFdXYWxBOG9LTTdaNXVIQlgxUDgvSDR3M2tpYjNL?=
 =?utf-8?B?Zjd0MVJveXFtTnZmclVCelhod2VCVWY1c2lyQ1lYY1hZamg1WlJmWmJOUk1U?=
 =?utf-8?Q?Ufgz+1T9etnJNnaFCR?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45ccb1fe-25eb-4483-5a9b-08de69b09093
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 21:00:19.6225
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dJxUGh0udt+ebxljRA3+flEOm0qZq9xhaCPhzG+PmE6mEP6s6bJmBLpepMzgkdZyKNq23w85nzRomkuZI6Vi3A==
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
	TAGGED_FROM(0.00)[bounces-31619-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nxp.com:mid,nxp.com:dkim,nxp.com:email]
X-Rspamd-Queue-Id: 8ED9812790E
X-Rspamd-Action: no action

Cleanup iomux related CHECK_DTBS warnings for imx1, imx25 and imx27.
1. convert txt to yaml format.
2. rename node name to pinmux.
3. remove redundant intermediate node in pinmux hierarchy at dts.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Frank Li (4):
      dt-bindings: pinctrl: convert fsl,imx27-pinctrl.txt to YAML
      dt-bindings: pinctrl: imx35: add compatible string fsl,imx25-iomuxc
      ARM: dts: imx: rename iomuxc to pinmux
      ARM: dts: imx: remove redundant intermediate node in pinmux hierarchy

 .../bindings/pinctrl/fsl,imx27-iomuxc.yaml         | 126 ++++++++++++
 .../bindings/pinctrl/fsl,imx27-pinctrl.txt         | 121 -----------
 .../bindings/pinctrl/fsl,imx35-pinctrl.yaml        |   1 +
 arch/arm/boot/dts/nxp/imx/imx1-ads.dts             | 108 +++++-----
 arch/arm/boot/dts/nxp/imx/imx1-apf9328.dts         |  92 ++++-----
 arch/arm/boot/dts/nxp/imx/imx1.dtsi                |   2 +-
 .../boot/dts/nxp/imx/imx25-eukrea-cpuimx25.dtsi    |  38 ++--
 .../imx25-eukrea-mbimxsd25-baseboard-cmo-qvga.dts  |   6 +-
 .../nxp/imx/imx25-eukrea-mbimxsd25-baseboard.dts   | 134 ++++++------
 arch/arm/boot/dts/nxp/imx/imx25-pdk.dts            | 190 +++++++++--------
 arch/arm/boot/dts/nxp/imx/imx25.dtsi               |   2 +-
 arch/arm/boot/dts/nxp/imx/imx27-apf27.dts          |  58 +++---
 arch/arm/boot/dts/nxp/imx/imx27-apf27dev.dts       | 194 +++++++++---------
 .../boot/dts/nxp/imx/imx27-eukrea-cpuimx27.dtsi    | 228 ++++++++++-----------
 .../nxp/imx/imx27-eukrea-mbimxsd27-baseboard.dts   | 194 +++++++++---------
 arch/arm/boot/dts/nxp/imx/imx27-pdk.dts            | 132 ++++++------
 .../dts/nxp/imx/imx27-phytec-phycard-s-rdk.dts     |  92 ++++-----
 .../dts/nxp/imx/imx27-phytec-phycard-s-som.dtsi    | 174 ++++++++--------
 .../boot/dts/nxp/imx/imx27-phytec-phycore-rdk.dts  | 206 +++++++++----------
 .../boot/dts/nxp/imx/imx27-phytec-phycore-som.dtsi | 154 +++++++-------
 arch/arm/boot/dts/nxp/imx/imx27.dtsi               |   2 +-
 21 files changed, 1115 insertions(+), 1139 deletions(-)
---
base-commit: ff0a13607e585c9e2158911d0173b9a47ac8624b
change-id: 20260211-imx2_iomux_warning-5675f186e249

Best regards,
--
Frank Li <Frank.Li@nxp.com>


