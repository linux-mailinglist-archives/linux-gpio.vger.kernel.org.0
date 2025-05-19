Return-Path: <linux-gpio+bounces-20271-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47995ABB4AC
	for <lists+linux-gpio@lfdr.de>; Mon, 19 May 2025 08:02:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3B1AB7A7F9C
	for <lists+linux-gpio@lfdr.de>; Mon, 19 May 2025 06:00:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F0441FBE8B;
	Mon, 19 May 2025 06:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="bJx9Ed1o"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2044.outbound.protection.outlook.com [40.107.22.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB501EDA09;
	Mon, 19 May 2025 06:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747634517; cv=fail; b=tYXDnBiwerMn9oHtafqOOzvpjE5Rs+R2YBbOOjA4Xa9OSB0IOs55LC6wMgGmxC5SDtHnFv3lBAJodW+vPJ+2UKALmgsi+4KO66wuLW6wRTm1ae3QqYCTadL79uAm6mx7UJULjkPyQHCBUmsQk+WodjoP+IuweDXJlxDF+rM1cMU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747634517; c=relaxed/simple;
	bh=KkQGVWWYSE3EBfZP94Zacds9py9WTja10tkSGQ6IcAQ=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=j6ffZxyTNiPEtTZH73ZE3gX6Xr+WY8Pcx9b07VBcJNNckGuyEjKPoFuN/qOZ5id8pxWdhButjlydM2+epMYJ18KMJ/Yl8Cn8LUZehCgMEKykGx7szjk8nVibEscdF2weJMhPprMFWk8slLbZ0rsxFnkL2eUqbphbYrLoI7AooAs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=bJx9Ed1o; arc=fail smtp.client-ip=40.107.22.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D4gbKHG9AahOx0Jyewi8uqU0mHP21/AZ3Sv6rwBrXDFuS7GEiXMD1LYKshcAPTFLfoF1MEq3z9EEbGLv/aDV8HSyclLiF9h1KA30YfTv/Ei/nW4pf+2gowAEm2rUiab1whSodNy9zba87Czc4GYF1WiNkJc6rAm8rpjXmBnP2dFslojJvBT4obNN6225Q2Fwr449MP0lck70JKaxGQUZ52k/UjT4DUVvXAhimy6u/jkdJcAnmGGqc7/9G+T6GaAE5pGjO0jk1WHrrKOGt+Y8OA3PxpjlVxjaRe9uUu2VxAOAY8yazMVzutQYuzBHzS7ejTgHX/DrkxOlAfePbZ3Nhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NsZalXi/N+ex8sSrmAEFOBwx85XmK0fCb090TRglFH0=;
 b=bvJalbgDCAhXj2WuYr+WYqz7M/YjENhFqIBuL+D4GiuK25rntl+yHsUguJiqrugUX406glz4rTbtwPHTKgPZRSTYbm3c2kubLhWXJOErWM2Q2bmVOLqmSBIHkDv4l7dvKL1HQaOWoSKBUDq9x2aMDgKLzYcW3i8T6+DXwJIEUy3PJgGelUL624hDONeo+U63bzswjDLn2/Eth80gM+9J1Q0WSwuqhWVx80byrbwR2x0qT/ejFM3vQaSeEfSfgrqZUAWZXEanUK3XseONTIJrY1mAPzthGeTvX+qWxacwHidqfAtHOEwY7Y9CH08rsrIKRqfkJXi85yyr6etWoOnS6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NsZalXi/N+ex8sSrmAEFOBwx85XmK0fCb090TRglFH0=;
 b=bJx9Ed1oTaxbpHlfEweX/1aJeBusAG8DP1dWHDrxi5OSLyZqmeDcZjJ00l6CfNpQ19msQMvJ8+ETmEMKnLRBj+6Qlpdy5e4kftYAZ1ZUDuzFzsec4u3QGRtXaLrQCMSdnPqGT/xwTZYe5qOr2IDS4lRppR6jjmOx+09zsQLJab+2oRxO6w2j6+8Q10OGSRuJz9hviaT7EZhCvs8DRsnHNEzJsh1v8ZCpCqV1eiepDQ2mIcX9UChTtNr/UCj9PEhGAdxlu5+1d7IO4iX/4PwKeYM9kl2Z8QFPwftSw+z0pE/w0LWelQUNU9RJHGU8WeeLZeuBZPsggOgNdYfxuJ7uxQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com (2603:10a6:10:32d::19)
 by AS8PR04MB7686.eurprd04.prod.outlook.com (2603:10a6:20b:290::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Mon, 19 May
 2025 06:01:51 +0000
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::4fa3:7420:14ed:5334]) by DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::4fa3:7420:14ed:5334%4]) with mapi id 15.20.8722.031; Mon, 19 May 2025
 06:01:51 +0000
From: Haibo Chen <haibo.chen@nxp.com>
Subject: [PATCH v2 0/2] Add 'ngpios' and 'gpio-reserved-ranges' for
 vf610-gpio driver
Date: Mon, 19 May 2025 14:03:41 +0800
Message-Id: <20250519-gpio-dts-v2-0-b9e77173e9c5@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL3JKmgC/22Myw6CMBAAf4Xs2TXdPoh64j8MBywF9mBLWtJgS
 P/dytnjTCZzQHKRXYJHc0B0mRMHX0FeGrDL4GeHPFYGKaQRhlqcVw44bgm1uCmiV6uU1VDzNbq
 J93P17CsvnLYQP+c508/+mWRCwuFuVfWT0dZ0fl+vNryhL6V8AcsJc42eAAAA
X-Change-ID: 20250516-gpio-dts-408311b633c4
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Haibo Chen <haibo.chen@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747634649; l=1406;
 i=haibo.chen@nxp.com; s=20250421; h=from:subject:message-id;
 bh=KkQGVWWYSE3EBfZP94Zacds9py9WTja10tkSGQ6IcAQ=;
 b=uzbSpbUlEzxPH9Hti+sUBi4muEULQgKB5JLOSQMx2mRPWCWxcbTJvnK2CzjJ5P5VCUvofke12
 +B8heWUJ3TRD0eWg5XGpgzuVEmTB5NTPXsDRwfRqRPwm1HSij3yr9ml
X-Developer-Key: i=haibo.chen@nxp.com; a=ed25519;
 pk=HR9LLTuVOg3BUNeAf4/FNOIkMaZvuwVJdNrGpvKDKaI=
X-ClientProxiedBy: SG2PR01CA0191.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::6) To DU0PR04MB9496.eurprd04.prod.outlook.com
 (2603:10a6:10:32d::19)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9496:EE_|AS8PR04MB7686:EE_
X-MS-Office365-Filtering-Correlation-Id: 98af52ed-7bd2-4d0c-59d5-08dd969aa616
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U29YVzdnUVRkc2JFcFBTY0JMUXJDVWxZdWdqQnM2bkFOUmVJN1Nqc2FmT01Z?=
 =?utf-8?B?bDl2UmNyZHgvUUdIWGRIVFd0NkpGVEdWZUVOTzhsZFRFTlRJNEgxNGJkMlNk?=
 =?utf-8?B?alJhcEZOTWZHcE9oODBNYWRzSUFJRllmcEJKbnJNUTYwQTNBRE5NN3VQbTdn?=
 =?utf-8?B?WUM3OW9iZGFWRWlYNEh5MVZrVmpWdkpoT2dKdTNkdzRVQmZNMW1Ta3JQMG5r?=
 =?utf-8?B?b2R5Ylh0eW52dGxVck9DTElJL0VFUC8xWnlRdjkxdFJJNkt2RjZLVmZZQnAz?=
 =?utf-8?B?TUwrNFhLbVdXU0syemgvYW00d0lMN0FQTy9DR29DMjJ3WGpvcHFLUUJoa1Nu?=
 =?utf-8?B?cWd3WjNZeC9lN1JwTU1WMXlrMXROc2l0cjVsL1c1RXI0V0liTGtmTkZIejJZ?=
 =?utf-8?B?WVJmRkJiN3ArZnNhWnd0RVVNclgwbnpIK05xUkJ0OEs0eGwzSHpRSGpSOWFX?=
 =?utf-8?B?SFlSMXh4WjBVZmxQYWdiSHZwTERJdnNpTXJwMXdmL0hRblhORm8wWWIvRlRs?=
 =?utf-8?B?RVJ1RFN1cEhvdndlT2luOUJGZDlsWTFHcGNDWi80ZjhHWFdWdkNpZDVxUXQz?=
 =?utf-8?B?RU9CcG0vUzlwRzJKTUNLRUZqd2hsM0NpbkpBbyt2a3ZmejUyYitUeGc0VkNF?=
 =?utf-8?B?c2puMTN0cEpOT09pUmRjSDFMN2tEUElZMnRjTG0vUUtsc2F3YVNPNXVXYW80?=
 =?utf-8?B?VGtPaHlIRlVtSEFFZnFJZ1d1SzlNdEUwRmdXZXpjenc3M3hnSGZMNkU1dWU4?=
 =?utf-8?B?eVdjTWw5UHZ6ZlNVVHV4MElDQmxlMk02bERDM0lyaWdYWGg3OXpxUUs2YkRw?=
 =?utf-8?B?dW1vMmpzSUNVTUJrcXh5VFJXSzl4Wm4xSFFFdElKd2pSZGdHYUtLTWhRSnhM?=
 =?utf-8?B?NVNPT0tLNXVxbjNYbkxHM1dzZFBMdTRPMlZ5N1ExaDN4alY2cEZ5N2hzQmgx?=
 =?utf-8?B?UkpaWExPT1Uwb3pUWHFDY0YzTnkrUkdoblR3TjJQbytTZGpvWkNSQmRZaG5C?=
 =?utf-8?B?L1hlNHRhK2hKNGR2SmJmQWxFZjRpenUvdjVoYW4rTDc3Y1UxeDcxUUwwMXNn?=
 =?utf-8?B?ZjVQS2ZwYStnb0wwZHhPQ000ZUJWeSttbnRxK1FiVzB2djhSTlQ4RlIrT0Vz?=
 =?utf-8?B?cHNONndRSWdISFRtRFlRR0RyNjBYSVhHOVVnMFFZUE9ZSDNqWHg1RnpXU05F?=
 =?utf-8?B?dVp1UzlyZ2krd2U0K2Z3RkkxdysySkJsNzRCZGdXMWZaQ0lXNlVOT05jWTJz?=
 =?utf-8?B?OFY0WEZLcjNENFFldXhZbUMvaEFZWldYOGJjemphdi84RmxiZlhtUlJmazc5?=
 =?utf-8?B?TjZJTlc2WUZEamZYdTc1Yzd0RWwxbVVwV0xldmJFTXNwRkNlbGROY240bHhN?=
 =?utf-8?B?RHB4KzV1eWt0L29IcXN6ZFF3d1FWc2NOcXlnRlF4MVBHcGh1YWVkTTlxMHdM?=
 =?utf-8?B?THVaaCtHMEdYZGlCSG4ya0kxM2h0SGtHYVBhRk5Nci8wejhsUUorMVduWmFn?=
 =?utf-8?B?d0d6ODlza3BmTHFxNGx5Wk5WQ2FJZHd5SUEwQnhvS3U2MHlaWE1zWkEvVkNT?=
 =?utf-8?B?TS9xZDQvZEY3SEJ5MllJaXhoaG00ekZEQjdTZ2c0aldDNTlvcVgrdUNtTDcr?=
 =?utf-8?B?bFEwclBSTXBQWHlTb3FSQjVMUVhhUDJDUXhnS2JhME1TQUdwMStoeVdqQjJj?=
 =?utf-8?B?Vi9WL2tHN0dyUE95ZmhEYThUcDlac3RKMnB3NXBwZXZxWlRZVHB2ZHVvQWs0?=
 =?utf-8?B?c3dWTC9UU2JsM2NRN1lGclMwYUNpbEJ6elpzSzZSdHpuaWlEQnVQWWRTY3N3?=
 =?utf-8?B?ZjlDNWxwdjkvemhwb3NMd3RFWllWZk9hZ2dMWlVURkF0MnhyZE1RTnZKcmdh?=
 =?utf-8?B?RXB3QUtlTExKM0RVYTFsaTliRGM3SlBrNENoZFZpblhMVHNnYncraTBsYU44?=
 =?utf-8?B?SkFwbHBXOVBRMXJzTXdTQXNlbFg0d25qNFE2NjNPK1hOUjRHNUhQNU1oZDFh?=
 =?utf-8?B?a0EzODZncXFneTBDTmkzZFVtV0ZTNklmOGFTOGFOK2F1NlMzRWJ0Vzd5S3JH?=
 =?utf-8?Q?X/VDYl?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9496.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z0gvcjF1eWJNK2laTUh3QmRQTS9nRUhxQ20raDYvbFVnOGVjWFhTNG04d0cw?=
 =?utf-8?B?Z2dxbEpXUmoxWmRkdWRvTERCVWFwMkpoaVNrTEVSdnI2akxmb1Q5dnVPT2FO?=
 =?utf-8?B?SFc4Ly9obCt3ekRMVnNub0pWcXQycVV0a0RqWHg4YzZCZm1ud1lvWTRGekVS?=
 =?utf-8?B?Yzcxb0s1ZmYzeXJaTFhhdDNkUXZhL3dKMUgrU0VnUjRoMnhqQ0hHd2RrQms2?=
 =?utf-8?B?a1NJNStxSUV4OHdOMzd6eFdZa2lTczRndVN5NlVwNUhlNGRLRDJPcm43bUxZ?=
 =?utf-8?B?Mk82bFJNVXlUTTEwL3FFVi9GSEkwRlo2Ykh4YldYemR6eW1LbmQwUytFNlU5?=
 =?utf-8?B?NStjT2J0cXdCOG8ydlNlbTAyeDQ2bjJBYWh0b1A0cnFNcGdwdTVPc3EySHpj?=
 =?utf-8?B?SVo1S2Q4c0NvN3JiaUQ4UTIvRWtVYnFSNzRWTmdsekJFV2FuOU9qNS9BWk5o?=
 =?utf-8?B?TTJmRkY0Z0FwOFBTS05jUjc4Q2xwRUhaTTV4NW1xb2lIZUpwVi9qbXVCUWk4?=
 =?utf-8?B?TGpVVUdWUEJiMVA5Y2hKWVIxUndwNHFsbFpzYWdVQ0JOaVNxS2lUMWlCc2dq?=
 =?utf-8?B?SDNMR0pKL3ZiYXpNVjFOWks2UERhekg3dXlWNDQydUxLaGV6MjhlWHRaZSta?=
 =?utf-8?B?VzN3MjU3blNnVjdzaHAzekFKUVhsbmVFL0Y4RnhueDdDWXhvYjk1eTZjOUhP?=
 =?utf-8?B?NmNsN1V3cUJQclhWSk5ib3BrMFdCWUNBTEsyZGZRb0JiVFQ2QUYxZ1Vva0ln?=
 =?utf-8?B?MFdjVmpMbStKYVFRbTZJODduTW54TnMxMHBJcStFTUZkTk5iSWQ3VXY0WnFK?=
 =?utf-8?B?MFpRN0ppYWs1T212cVFDU1BCcks0MzRwU1hPZ3Q2WTBNMlJFc3FEZkFPb2FY?=
 =?utf-8?B?L1RycHc0d0dRMjQ1Y2NIaEp4NThEMm56cjlXNWEwUWJZU0J0cjgxZVZpV3NB?=
 =?utf-8?B?OFlRemcraTJWaGdCTzZSK3BKcllVdTJGNVBkNWlGeWQzMHNkbHh3bEdxSFJR?=
 =?utf-8?B?TzRaSnR3RHFvVUY2a1BBdk91VEs3S2lXdmxvUHg5M0NzYmtyMTJIRWVqTjAx?=
 =?utf-8?B?akptWXdzWFpLbmdQclgzbnh2N1VGckhYelgzaVFueVVzei9ZdTBWZEVlc2FE?=
 =?utf-8?B?K2ZPei81eHdsc25oaUFEZnA2QzVIc3F4aWF0YkthRjQ4U2s1TFA5ZitzaldQ?=
 =?utf-8?B?d3B0Rmd0anhBZ0RaaDE4cURvS1pqZXVEMDNnZDFxZ0svYkRMTmpVOW1qdzdz?=
 =?utf-8?B?ZWFHa3RkNmsvYVc1V3hzSzhUU1FhbTNaNzJXZnRmbU1iSCtPRHAzZFl4TjVa?=
 =?utf-8?B?VW92ZUFyUGZBRkVXVUhDdjJ2TDBCQzlxbG1nZ3FUQ2hRbnB0MkRha3c1MmZP?=
 =?utf-8?B?YzFRQ0Jua1FYdmpjbUFsN0V5bGt4em1wNXRmRmszS2pENHluNDBqSXJlRitv?=
 =?utf-8?B?TFVLN0IvYmhsK1lpNXBKRDh5dWZSTXFuU2tyeUpZbTY1ZzZkSEFaOG1raUYr?=
 =?utf-8?B?TGM2bDJmTUlmYSsxdDdHQUY2eVpxMUQyWE5tMGVqVmJnY1hIbjlIdG01UGhn?=
 =?utf-8?B?ZWYzT0RmK1VocWorZENBRUY5WHRrSXc4MFYwaFBkc2JnTkl3VXFUVkdCbThn?=
 =?utf-8?B?SnlNcVQzV1ZJZWpRcFRWQzJjR0lwajVZaWcxZk8wYm10LzNrY1dOeit2RUpC?=
 =?utf-8?B?Wkk5Smx2VHRqNUc5YWJoaWVTNmdpdkdBTDI4WGVQc3RiWVdsTTBGRk1ER2Nn?=
 =?utf-8?B?WHYyU1RWanhOaGl6eDl4N1lvTzBlZE1CRDQrL3pYU1NSR2NvVElVMTdGRzh6?=
 =?utf-8?B?ODlneUtZQml0bGRqdTg5QllBTHpLbEZlc09LMnVwTk9zeUt5ZVp0MFhEZWRS?=
 =?utf-8?B?Y3B0MENUTllHTVdmSDM0ekhGZ1ZmV0JnNmtHSytwQ3J3OERmK0hpcStkMHpD?=
 =?utf-8?B?SDdpUHdXL1c3ZGV1OU1Qa0lOYkgxS3dEWFVSVVl2MjFvaW1ncDdxcnNGWDA3?=
 =?utf-8?B?Yzc4STBMeXdzcmEva0JNeU5YczE3clQ4aEp3VzAxUWE2NUpHMHFRQ0RpUG1C?=
 =?utf-8?B?MEVLenFKZENTYzhkL3VCam0zeXQ2RlA0TGdtVWNIRnRXKzV1NU1FUmZZaXND?=
 =?utf-8?Q?d9xsIV+ATJZZwy7haaoB0j7pU?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98af52ed-7bd2-4d0c-59d5-08dd969aa616
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9496.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 06:01:51.5168
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YPgXrYVgRBPS46TneIGClimLYFkh571V64ZQQ2s4lXIkhfrvYS3BV5WaJEClt5F8ITWuWMnZqb8O6vK4pyv5tA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7686

Not all GPIO ports have 32 pads, so add 'ngpios' property to specify
the number. This can save some memory when alloc bitmap for GPIO,
besides GPIO tools like gpioinfo will show the correct information.

Some GPIO ports even more special, e.g. GPIO7 on imx94, it only support
IO0~IO9 and IO16~IO27, so add 'gpio-reserved-ranges' property.

Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
---
Changes in v2:
- No changes for PATCH1.
- Add PATCH2 in this verson to avoid dt-binding check.
- Link to v1: https://lore.kernel.org/r/20250516-gpio-dts-v1-1-a9c3505f54c5@nxp.com

---
Haibo Chen (2):
      ARM: dts: add ngpios for vf610 compatible gpio controllers
      dt-bindings: gpio: vf610: add ngpios and gpio-reserved-ranges

 Documentation/devicetree/bindings/gpio/gpio-vf610.yaml | 6 ++++++
 arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi                 | 4 ++++
 arch/arm/boot/dts/nxp/vf/vfxxx.dtsi                    | 5 +++++
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi             | 3 +++
 arch/arm64/boot/dts/freescale/imx93.dtsi               | 4 ++++
 arch/arm64/boot/dts/freescale/imx94.dtsi               | 7 +++++++
 arch/arm64/boot/dts/freescale/imx95.dtsi               | 5 +++++
 7 files changed, 34 insertions(+)
---
base-commit: 484803582c77061b470ac64a634f25f89715be3f
change-id: 20250516-gpio-dts-408311b633c4

Best regards,
-- 
Haibo Chen <haibo.chen@nxp.com>


