Return-Path: <linux-gpio+bounces-18406-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ADC7A7F262
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 03:43:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E9F2F17BFDB
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 01:42:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B439932C8E;
	Tue,  8 Apr 2025 01:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="GHkcXwbX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012050.outbound.protection.outlook.com [52.101.71.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20BBA25F967;
	Tue,  8 Apr 2025 01:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744076519; cv=fail; b=IlbyaNYRgDSekBS8/Za470sr5sfONI9eVdqmbQzsU5SDuVHYi6cqdJImJmysFvxuuOf6vLl2hnw13H+srGyycUKXF21nJhYbA/7TwFhmrLXHMQJkJq5EBpNbvRBBIfWtaGisjHO+vUug/LGjJc0v4KV/71nehqT6MJ33trT4Fsw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744076519; c=relaxed/simple;
	bh=whEPXMghPFWJmcez/kNrfobL2JINxtIEXm48TIFMoEc=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=lJ33THa05LO19hBK2JzYMg5UpcvTY2jEltKCrU5hMiasGTkESdg+CsfL1D2BOXF9lYrW2NXNZhEkDUxECWoad+t6gDI7SJi2Srb5Czgu4x8swO98R6JOP53PZIizab5BiLMF2jc53xsPQJzFCf9jgNBN8hfL4pulxahbfqqAGRY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=GHkcXwbX; arc=fail smtp.client-ip=52.101.71.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EDqdMPbBClyaSpCphrXq+LOkn1eZbzwFoZhYSVALTwSWD8cj6csqIUMVoN8YAlZFngXAJnR+oik86OjSPFUxQLaeulpg+JCvrkciYjcqodP+KPHmFwZPKzt+xwwA8fvifyw2EM5x9YxgElzZEA+TtkfakLTudankRJqwRHdeB/GKtcsfrRaEHClZlR0e8NGWAhBN2St4QVELekJ7pO9/HtRfEC0UHRArCJ+VwCIe9Wt2hLnD9F3HvtaGg5IYMD3hQhZPEX84UU9sREZjGW4PyfnGYjKfDNBdBr/aU5jq00VMH57XOA5FM16Ir50OJHJMJN1AIqUKGaNQ2yuatpwVpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fLAs4qCLkaHaNr0pkS3WNZSi2iaLg2dcPaA6P89xO8w=;
 b=p8FJhhA396eCfJ6HsSY6DUfTqO6zN/Bd+AU+0RHtqJCg6wWDqZfjPa8KxIbp8fElKWJ3UzPo9YopuYqP25GhrtjtHuqCCmymMy0OQTD/BRNW+7iIsGw5x4a6KkavXQgNNCiLb7vfGkd15HXJWjHAwBE0XIBmK2qp3XSBIDcJwrPKdcf0AUquEWcopofCIUXmnCBslnvfvOUgsTLqga9xBXv56rFANMft+A80VDL2wr3Lq1z7PqAxoXqnSJxa6B9GTITViiFa5IQx2PbtQJ2XjFLVmJl0Jpt69bgTPiil5B7hdlWk0qvfpJA4GSF//Bah9ClMvrLOknoKBBt7d1vGCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fLAs4qCLkaHaNr0pkS3WNZSi2iaLg2dcPaA6P89xO8w=;
 b=GHkcXwbXtxpP1r82D8R/aeKQm3Rp4VU4/+DgwfD2sOf0SSuwHYaLxeOJfx/8R/uI6LkFP/uSvc27Qn1y9L8rOrEHweCsvn/1uN7qeMGdul1FEL3bPWwjVvcfQ8o039fqgtwteeIao02okGsYpSQpnU30YIYEGcTNjv2fnjUjZz0UXSAYislSVSeB2Qt/U4ngTXzG/gJu7v4blfi8e+v6/0CleFj3vpJlpnFlHsw/ml1GLi8REoD/QHyjOVAfosjhEnUlws01vhjQ2nmVIZYgOUbsRBlLxvo5T81S7b7jYdW6imW5gGg3WSqnuzImJsG0I6cKVqmHvkaqTG/Ths5bCg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GV1PR04MB10583.eurprd04.prod.outlook.com (2603:10a6:150:203::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.31; Tue, 8 Apr
 2025 01:41:34 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%6]) with mapi id 15.20.8606.033; Tue, 8 Apr 2025
 01:41:34 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 08 Apr 2025 09:39:59 +0800
Subject: [PATCH 3/7] ASoC: codec: twl4030: Convert to GPIO descriptors
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-asoc-gpio-v1-3-c0db9d3fd6e9@nxp.com>
References: <20250408-asoc-gpio-v1-0-c0db9d3fd6e9@nxp.com>
In-Reply-To: <20250408-asoc-gpio-v1-0-c0db9d3fd6e9@nxp.com>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Peter Ujfalusi <peter.ujfalusi@gmail.com>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, patches@opensource.cirrus.com, 
 Peng Fan <peng.fan@nxp.com>, Tony Lindgren <tony@atomide.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744076413; l=6651;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=ExGvRGQyDo4ZlYfuBr4C2ncIrF3BsbADUswuNAzOsIM=;
 b=Pa3lZL4adPD40he5sCxKg3rKTwy1y42SZQmn6hM54IhS7BJ5gTKEaihNQVMsYOOme2qYhA1Us
 vGrBo2uVVzhAadewcO/h/q8fKx2+K2m53cALd9zo97XSWA/yrrOjIwa
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI2PR01CA0048.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::17) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GV1PR04MB10583:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d5b47a5-be2d-452d-a8e2-08dd763e7e9e
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|366016|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y3JzenNsUmxocVFETDBnOWxwZWVtVWRtMzdaK090ZHpzdU9vQVJia0RpMUUx?=
 =?utf-8?B?eWxMWTZ3YnZEQnEvWEpSb0IyeWJDZ1F4bEJUYU44QlVkZzNFZVRDYTVHbTl0?=
 =?utf-8?B?c08vbFJFNk04bWEvbDVOVmVlM0p3RFRlWHBYZHBuL2doRFJtUnZKSzE5TFhu?=
 =?utf-8?B?QzJDV1VuRzc5UHd6QmJPYmNFK3JVTjlQRXpjZWlrQXZkb2djV0dQU3dCUkRy?=
 =?utf-8?B?dnA5MmFpUGtkQXI0bThjcUVBVW5SWDJodlN0U2ZLU3dFK3lqVVEyL25DUzg0?=
 =?utf-8?B?bHpEUDBtak5iaFZOSGQxSlNIUHVIdmNjbzE0TUNXVGMzaFcrYUtwdzlqMlFu?=
 =?utf-8?B?dWxFcE5FblhuKytmRU9mMVpxelIzakFrWUFCMmdsaFVLcnBiZVNUaTZUYW1C?=
 =?utf-8?B?cEZXRUlxRlo0STJJNmdXeUNqWTRYRWp3amlSN3NheFc1ZXFvV25YQVVWSDdU?=
 =?utf-8?B?VElOZWQ4N25RdE5tNmxSM2dYYUFBY0FEczJIRFcwZENIZk1uN1FBck9yZUVH?=
 =?utf-8?B?ZFBqOEw0NmNMa1o4NFVGbHQ0cjBJNFVXUTlaMjAvOWhRemNpVzA3ZkVqY1hq?=
 =?utf-8?B?STI1ckZ0WjVnekI3a1hBZmQxT0hSMHFWM3hjaGt4T3JhMW5uaThJL2FRS3k5?=
 =?utf-8?B?OU1JenNLcEFzc2xWdXc3d21NM1hEcU1rZ0kyRlloQkVPWExGNkRsZm1tWGlF?=
 =?utf-8?B?UGFwV0swa3doTEdLN3V2N2YycmhMYnk4OTlZWlZwOWVwOU5pbGY4anpQei9X?=
 =?utf-8?B?Rmt1bVR5czMxQ1h1SkJsVTRwM29WOUVLQWhxTDVBSGo5M0hPYzRCMmdkWWU2?=
 =?utf-8?B?TDB1TFkxRTFOUjllYjVQOU9jNXVoWU5KSWRubDhPUjRDOXIvUUl1YWl5RE5x?=
 =?utf-8?B?WTNBa2p2TDc4dkRKUDlDTDc1K2M0bXd4alNRUVRNdkoxeWhTNFdxcXhpWGR5?=
 =?utf-8?B?ZHVsTkdDc1RpU1RBdWFGVGdrbEt3RGpJbnRxcmFqRGFYeEdQZlJPc0RqaEpL?=
 =?utf-8?B?S0RabllXeVY2MjhNWWtnWG45dXM4ZXFFWElZL2Nwb1ZJQW1YK3FPaVRZL3VO?=
 =?utf-8?B?MFMxbU5YMmgvSXFqaTJicjdVejFrMkpiRlB5RHpKWWMrL0FVODkyUTAwOXph?=
 =?utf-8?B?NGlNMHkxK21zblQ5S3duRG9nak8vZDNKRHNnbms1Z0w5N09MSVJvQlNHdmU5?=
 =?utf-8?B?SFIvSk1ZMG5ZNzIrS3Q5SXBmdHVtT1FjRzRDVWI2NGt3eEpabkJ2WlVTTFh5?=
 =?utf-8?B?by9LY0lnZ0pscm92VVo2Qk5qOGVPdEIrYXIxVzdvR3dLaE05RVFCd0YvYUtM?=
 =?utf-8?B?eDU2TXZZM1hwMGNaYUZ2dXNxODR5dHVUcWJYYTVva3FUZkJaejRaajdZd1hT?=
 =?utf-8?B?T0RWNFdPNkMwc3Q5SFdleUt4eUxwSXQvSnYzaUFEbG14ZUJyQVR1YjZaQk45?=
 =?utf-8?B?NGxRUnBUSUtrOFplZFd3bHJMZDF1U0dIQThORFkzcTEwdzAwU1pDZ3M2cnc5?=
 =?utf-8?B?Smo0OENqWVlHczBtQU1WSHI1bXJTTEJFWHpmTUFCOTAvTjN3TmNqeFgyRFo4?=
 =?utf-8?B?TlRCcTFiWVp6S1daWVBLbmp5YkZiV25xYXl1NkJLd3JOczkrZjFYbHUrckhX?=
 =?utf-8?B?SE1VN2lHenFJRyttK2hwQ2E5SW9qMVdqdzF0WVNZeWovb1pXS3lMSzFQRFp5?=
 =?utf-8?B?ZG8vWUYxZXZNZ2NtOEw3T3NLaFYzMUxvR1hpS3pDdzJZb200WHVIRlBRK1E2?=
 =?utf-8?B?RTlSSVJLdjlNVG9iZmc3ZFdadHdpQm5KNGY3cEdZTGRNSmd1dlE5UlhHNU1L?=
 =?utf-8?B?eTB5cHUxYTNDNUhRN0RTa2paN0ZJR0ZRU21mT1lyRlFYeHUwMU5KbzRMVVNO?=
 =?utf-8?B?UXBrZms3RUU1V0FFVEVVOVZ1ZkZBdTBhT2dmMVY4NzdlTUZBOERHSllpdmRa?=
 =?utf-8?B?aUU1MmR1bFUzeHI2MGNxSWcwMTg3eEFXNjJvUWd3UHNaUGpiSE1OQldJS1pp?=
 =?utf-8?B?TXlHWFg5SGl3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?di9nb20vajR5R1MzSWFmTTNYR2F2VmM2TkVyc3NJdHRMS3pFTnJvRlZsWGho?=
 =?utf-8?B?WEhRV3F6YmFOOXlNVEVWdU9ETEtMU2wzUVVNYWt6Z2FKNTBJUTV4VSs1eGdF?=
 =?utf-8?B?ZE1Zam03Q2xycm1yQ0N1bFMyVDlUL1BCOFpkQndBckFncnFvS3FmZ0ZaOG4y?=
 =?utf-8?B?emRqNzcwNWxXcmNScXA4TVpxQnh4bDdaUUQwdU9tVVRjODRtdG8vNmF5L1JC?=
 =?utf-8?B?aTl1eFJndXRVOUF3RmpqWjE3UVBic0Y4MEsyZzNZcnB4UFVjRWNKRWFZbkl5?=
 =?utf-8?B?WElCZlFqR21ZdE1tZTRNQ20zYWNwc0d5VXlEU0NPTDJ4cmNIWmxIQmJqcEtP?=
 =?utf-8?B?Y1UyeXJ0M1gzcU81SDdqRENFV05Kd3RwdDNyK3M0aUsxS3crWFFoL21XUnRt?=
 =?utf-8?B?Z0wrK0JFNGxaQ2t2VSt5WjZYcVoyZEJ4eU1oQnptekNXaWp0VC9NS0NwZkJQ?=
 =?utf-8?B?QWsvTS9CdTJGc0FFL0dLSGVDMkhhbTRvajMvNmJOWUxncTh0T1g3cXZ4cmtm?=
 =?utf-8?B?OTBIOW94bDIwcWwxeURBSVRJUDNXMElCREtIamJEWld6ME5VbEY4TWh6cTNN?=
 =?utf-8?B?S3ZxL2FMcjJTR2xBL3dOQk5TaEtQMkQ3OC85QXVmTzFTWWN0VVVraXlBLzFO?=
 =?utf-8?B?YlZ3TWdJVFBWSG9VakhPZFVBR1BxdUFpVXZJaSt1blluZm5FdzZrL2g3NjYv?=
 =?utf-8?B?N0EwQkg3cWJiWGdueWdiR1poZVpPT2drN3d1OGxmMnhiUnRSQURJSm85TGpB?=
 =?utf-8?B?bHp3RzBsWVhvY3RIN2VHQ0lyR2h0a2xQVXZrU1FDczRIbmg5THNxY0hGN29P?=
 =?utf-8?B?cDhDaGNQT3N3d2NFZ2tUWGl1THBVMCsySWF4SlJDaU84TjhCNWI5VFoyS21B?=
 =?utf-8?B?UmRRL3dTODRyWHRDeWs2VVJtWHBGMDhxNW5vWU1wOXcxSFlLQXVJWGRzRG5N?=
 =?utf-8?B?aytpcm9oZ0tFMkhBbEdsaFNMZVBHUE9wWGcrdFY2aGo0dnU3QnoxdytINGND?=
 =?utf-8?B?K2FiVUxwMTVzNlU3OTRqVTh0d3FpWFh3dUdLSUNUbWd5RTVla2RjdzIzNUc0?=
 =?utf-8?B?S2llTlBnSG9xWkxBTTUwKzlBTGNGM3YzelZ2VU1PbFdnVmp0SXBJU3h1Rm40?=
 =?utf-8?B?R0FGUjNEbThUeGc4YWpMQ0JpRGZqdVRCTjlNN0pURUZwSlMxTjJHWnFqR1V5?=
 =?utf-8?B?SElPLzZCSy8wUTlOaHNqMyt1TGVxVU5NNDhNRDYyYU9KcmtMeHVsRHZRa1dP?=
 =?utf-8?B?RHJ4WW5MUDhVUUJGNW42M0xMT2F5UzREaUZrTzB5Q0oyUGVsTnhWU1MwREhW?=
 =?utf-8?B?cHdQYmJZQXozem96eEFlNDIzL2U3YUlNaDFXNGo2L003bW1pK0M3VXNIWGQr?=
 =?utf-8?B?Sm5vZTR2TVNkQ1JZTHBKcnU5elZSdTEzdzZZeHRaWm5PNFpUc2RwR0lnbzk1?=
 =?utf-8?B?QmZVSmdFOFVBK0x6cGFLV043aThZemZlVE5mMFlBdGMwajJuK0VjQlhBSVRz?=
 =?utf-8?B?RlhMOTlTSnBPbE11OXZqMkE0TnpzN0ZlSUNadHAvazExUFJSOEV2K2FaaERP?=
 =?utf-8?B?Q0NTdGRpSDdDWXBZZlpmL0FzSk9iemRZazJkWVRDaFNBYURscHhNNE9PYVVl?=
 =?utf-8?B?bzhzcHJ6TVlFVC9iNjdkK0xWQllqeHErcGJkeFNnRGRBR3AvY1V6dHpRVlN0?=
 =?utf-8?B?akNKWHIwcWlrSjlZYlI3WTRrNFNicVhONUJHWklCK0JEZW1ZRmxOeU85SHFB?=
 =?utf-8?B?djI0ZVZja0YvRFhwMngrbXRPQzNZUllsOFlOQ1F2eG5Yd0FEUVdBWTZQN3Uv?=
 =?utf-8?B?WDZobkpscFRjME1NVHh5WWY3c000TS9sOUdJZWhBc1dvRHVLQTlUVlhyTkk5?=
 =?utf-8?B?MGxiQ1BncWQ4UEVSR0RBemxZMTZ5V0wxRHV3S09pOXlFRkRsM1ZCUlE3amxL?=
 =?utf-8?B?SlpuRU9hZTBpQjRXdnF1cldCa0ZGSU9GQjVzK1NUUXgwbjhWanhabTFEc2dS?=
 =?utf-8?B?bXF5bkdwQVdCTkhLeWptcXlQOFVBNG5LSmdDTVkzdjNCbmI0N2s0V05Oc0Nw?=
 =?utf-8?B?MEw1Smdkd0xhTDZpM3pmNnZDOUlFdUFUZElqOVRNUHRYN0NhQWJNamc0L0ts?=
 =?utf-8?Q?5amfgmkCieOxazn6/UB7fB7jH?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d5b47a5-be2d-452d-a8e2-08dd763e7e9e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 01:41:34.1992
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rVlrOuq+ZXyx9cb9TVeLGrcKaBfqfPJXiuE5FCqvNUMQ2VgphYcj5oCv79+mkQciDz5CPJnSLU2ozAJCFVU6YQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10583

From: Peng Fan <peng.fan@nxp.com>

of_gpio.h is deprecated, update the driver to use GPIO descriptors.
 - Use of_property_present to check "ti,hs_extmute_gpio" to set hs_extmute
 - if returned value is true.
 - Use devm_gpiod_get_optional to get GPIO descriptor, set consumer name.
 - Use gpiod_set_value to configure output value.

While at here
 - reorder the included headers.
 - drop remove hook after switching to use devm_gpiod_get_optional
 - Add return value for twl4030_init_chip to propagate value to parent
   in case defer probe happens

Checking the only user logicpd-som-lv.dtsi that uses polarity
GPIO_ACTIVE_HIGH, so all should work as expected.

Cc: Tony Lindgren <tony@atomide.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 sound/soc/codecs/twl4030.c | 76 ++++++++++++++++++----------------------------
 1 file changed, 30 insertions(+), 46 deletions(-)

diff --git a/sound/soc/codecs/twl4030.c b/sound/soc/codecs/twl4030.c
index 609886461805f85f826a002942bd07c9105f2038..2879b44eba41daf9a1877bc604b7bbfdbf476c47 100644
--- a/sound/soc/codecs/twl4030.c
+++ b/sound/soc/codecs/twl4030.c
@@ -5,18 +5,18 @@
  * Author:      Steve Sakoman, <steve@sakoman.com>
  */
 
-#include <linux/module.h>
-#include <linux/moduleparam.h>
-#include <linux/init.h>
 #include <linux/delay.h>
-#include <linux/pm.h>
+#include <linux/init.h>
 #include <linux/i2c.h>
-#include <linux/platform_device.h>
-#include <linux/of.h>
-#include <linux/of_gpio.h>
+#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
+#include <linux/pm.h>
 #include <linux/mfd/twl.h>
+#include <linux/module.h>
+#include <linux/moduleparam.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
 #include <linux/slab.h>
-#include <linux/gpio.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
@@ -39,7 +39,7 @@ struct twl4030_board_params {
 	unsigned int ramp_delay_value;
 	unsigned int offset_cncl_path;
 	unsigned int hs_extmute:1;
-	int hs_extmute_gpio;
+	struct gpio_desc *hs_extmute_gpio;
 };
 
 /* codec private data */
@@ -213,8 +213,7 @@ twl4030_get_board_param_values(struct twl4030_board_params *board_params,
 	if (!of_property_read_u32(node, "ti,hs_extmute", &value))
 		board_params->hs_extmute = value;
 
-	board_params->hs_extmute_gpio = of_get_named_gpio(node, "ti,hs_extmute_gpio", 0);
-	if (gpio_is_valid(board_params->hs_extmute_gpio))
+	if (of_property_present(node, "ti,hs_extmute_gpio"))
 		board_params->hs_extmute = 1;
 }
 
@@ -242,7 +241,7 @@ twl4030_get_board_params(struct snd_soc_component *component)
 	return board_params;
 }
 
-static void twl4030_init_chip(struct snd_soc_component *component)
+static int twl4030_init_chip(struct snd_soc_component *component)
 {
 	struct twl4030_board_params *board_params;
 	struct twl4030_priv *twl4030 = snd_soc_component_get_drvdata(component);
@@ -252,24 +251,20 @@ static void twl4030_init_chip(struct snd_soc_component *component)
 	board_params = twl4030_get_board_params(component);
 
 	if (board_params && board_params->hs_extmute) {
-		if (gpio_is_valid(board_params->hs_extmute_gpio)) {
-			int ret;
-
-			if (!board_params->hs_extmute_gpio)
-				dev_warn(component->dev,
-					"Extmute GPIO is 0 is this correct?\n");
-
-			ret = gpio_request_one(board_params->hs_extmute_gpio,
-					       GPIOF_OUT_INIT_LOW,
-					       "hs_extmute");
-			if (ret) {
-				dev_err(component->dev,
-					"Failed to get hs_extmute GPIO\n");
-				board_params->hs_extmute_gpio = -1;
-			}
+		board_params->hs_extmute_gpio = devm_gpiod_get_optional(component->dev,
+									"ti,hs_extmute",
+									GPIOD_OUT_LOW);
+		if (IS_ERR(board_params->hs_extmute_gpio))
+			return dev_err_probe(component->dev, PTR_ERR(board_params->hs_extmute_gpio),
+					     "Failed to get hs_extmute GPIO\n");
+
+		if (board_params->hs_extmute_gpio) {
+			gpiod_set_consumer_name(board_params->hs_extmute_gpio, "hs_extmute");
 		} else {
 			u8 pin_mux;
 
+			dev_info(component->dev, "use TWL4030 GPIO6\n");
+
 			/* Set TWL4030 GPIO6 as EXTMUTE signal */
 			twl_i2c_read_u8(TWL4030_MODULE_INTBR, &pin_mux,
 					TWL4030_PMBR1_REG);
@@ -297,7 +292,7 @@ static void twl4030_init_chip(struct snd_soc_component *component)
 
 	/* Machine dependent setup */
 	if (!board_params)
-		return;
+		return 0;
 
 	twl4030->board_params = board_params;
 
@@ -332,6 +327,8 @@ static void twl4030_init_chip(struct snd_soc_component *component)
 		  TWL4030_CNCL_OFFSET_START));
 
 	twl4030_codec_enable(component, 0);
+
+	return 0;
 }
 
 static void twl4030_apll_enable(struct snd_soc_component *component, int enable)
@@ -714,8 +711,8 @@ static void headset_ramp(struct snd_soc_component *component, int ramp)
 	/* Enable external mute control, this dramatically reduces
 	 * the pop-noise */
 	if (board_params && board_params->hs_extmute) {
-		if (gpio_is_valid(board_params->hs_extmute_gpio)) {
-			gpio_set_value(board_params->hs_extmute_gpio, 1);
+		if (board_params->hs_extmute_gpio) {
+			gpiod_set_value(board_params->hs_extmute_gpio, 1);
 		} else {
 			hs_pop |= TWL4030_EXTMUTE;
 			twl4030_write(component, TWL4030_REG_HS_POPN_SET, hs_pop);
@@ -750,8 +747,8 @@ static void headset_ramp(struct snd_soc_component *component, int ramp)
 
 	/* Disable external mute */
 	if (board_params && board_params->hs_extmute) {
-		if (gpio_is_valid(board_params->hs_extmute_gpio)) {
-			gpio_set_value(board_params->hs_extmute_gpio, 0);
+		if (board_params->hs_extmute_gpio) {
+			gpiod_set_value(board_params->hs_extmute_gpio, 0);
 		} else {
 			hs_pop &= ~TWL4030_EXTMUTE;
 			twl4030_write(component, TWL4030_REG_HS_POPN_SET, hs_pop);
@@ -2168,24 +2165,11 @@ static int twl4030_soc_probe(struct snd_soc_component *component)
 	/* Set the defaults, and power up the codec */
 	twl4030->sysclk = twl4030_audio_get_mclk() / 1000;
 
-	twl4030_init_chip(component);
-
-	return 0;
-}
-
-static void twl4030_soc_remove(struct snd_soc_component *component)
-{
-	struct twl4030_priv *twl4030 = snd_soc_component_get_drvdata(component);
-	struct twl4030_board_params *board_params = twl4030->board_params;
-
-	if (board_params && board_params->hs_extmute &&
-	    gpio_is_valid(board_params->hs_extmute_gpio))
-		gpio_free(board_params->hs_extmute_gpio);
+	return twl4030_init_chip(component);
 }
 
 static const struct snd_soc_component_driver soc_component_dev_twl4030 = {
 	.probe			= twl4030_soc_probe,
-	.remove			= twl4030_soc_remove,
 	.read			= twl4030_read,
 	.write			= twl4030_write,
 	.set_bias_level		= twl4030_set_bias_level,

-- 
2.37.1


