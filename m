Return-Path: <linux-gpio+bounces-38717-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rZH3D19kNWrduwYAu9opvQ
	(envelope-from <linux-gpio+bounces-38717-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Jun 2026 17:46:39 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E2C6A6CE2
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Jun 2026 17:46:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=vhGD1UAI;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38717-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38717-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D8BCC30DE219
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Jun 2026 15:42:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36C1F3B5F5D;
	Fri, 19 Jun 2026 15:41:53 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011008.outbound.protection.outlook.com [52.101.65.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519A33B47EB;
	Fri, 19 Jun 2026 15:41:46 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781883711; cv=fail; b=kjz7o2JNi/REsjT3De0QXpqJsyCkxMHpBqp8myHCj5BYCK7tcuvKy+VnnGzo9G/51QwnyxFhouwkCrnezgashxhHT+TRkaHws9SxVvmmu/hCW/dQaJPoQXxrtFkWSV+1hPt2yvm2XJglguMxpj//AnXIz98lvFLtm7j3b+ssORs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781883711; c=relaxed/simple;
	bh=r6Z7JuoN6m7MCez0Fu9BhuDWTv9nGS5585fDF+7mjgI=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=dqAsoyVOkOwtlu4FecJx0DaPolNghTs8dqy2zeAFEhzoS9k+gudYFsvMpXIfMGTvYv+8gruSXzivqZm9K4clVYq1MPrYj67UN6uPmXozAcbgSvVr15/1xgCps4CiNmXKfgYMP4ziP5E6LwSeGkvzNfRc+NQI7Ue1UwAzflWdwIo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=vhGD1UAI; arc=fail smtp.client-ip=52.101.65.8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WnijSK7iV6sw7j03sSCb9p/e8jDP5w31pZedzdlMg8JoMKNwB0pwm6afGfFD7XuK3KXoiDeT7c4B7eoeKGDpzQdY7SrfC77sTRsRPTVf2ueV9zIUqqLgAts22d+Z+xZcAFlJ13LlyJIjg98U+WjSGgyQEoHmefXiiGrE7mcBcx5ji/285/8Kr3Hj5E2qpCJ4CrfY2aLxiS3BlqeoRqaP76HppjNXtOsL2bDRLwMcq2PJeKTPJup6hRLD5G+vLEZhZcE/O2s550z3TBjsDeVafYqqEI7yauTIbBa/LXFwKARpJbeUAsT3NLRGwYr34z8l2R/Ufo7TItz6C/9bQCf6Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D7WyDX7myArDFe1g4LPD+yngsQHVWixC6l2FC91sHhM=;
 b=JmtN/BDR4+rUI5SK51OoBBJkXCJ/7eL1nPwMi14Hkmc1dvEmn0G/TD00cjckKmJ9X/DaoIc+7kSxsUF5fAyNkJGZr20JCJHw/1EBLO9alEJAcuTf/wtPrtEfTSCrsl46v+BgdjCM8OyG0r6PLfgVrJ+OqP2a7s833hCsLo5aUffkk9Sk5kDqm+SKZxT55QGiIbYznLgavu6AGm7HDyJ1xtDJNwVC9gO8fj3viaqO2QtfZgyChIwtbReVXxgHXtli2trOpFgr6Qr3R5+y6ixVD5XFlpZQNxMrdL//m/fGY6clqe+j7NLHKq12O5LIv5c+WJrqekkwE+KxN6fsMja6CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D7WyDX7myArDFe1g4LPD+yngsQHVWixC6l2FC91sHhM=;
 b=vhGD1UAIiwIW3Ct0frhuvvYzGy6JC5KZdOrtWDV4TUwv01T65jE7BdeHgigJJQ/iStVnMXBotF2umPmIeGKY90ZxV5ps+0oxyOs9ANKu9n4arjOefJFcHsog8IIdqA+h0ToGFLns55MAIs+Xn2SrH8Vo/DJ/b7Ewmx6Y5YqkeCM7SUf90SYvHPBBjtOvoloq4lVfS2jf1BP1fJtu1+3QiNXCdxYldsmBV9k37ynFeNqI/Ry5LvueAxiOyal0TiG6ULQKC41nVZodd7ZLIOBNuieo71v2+/v6I/9HDn4NSKiaeCSMmxjh7bOrPJe9tmf6/IoIuxF5zxV83xeYnU5r3A==
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM0PR04MB6818.eurprd04.prod.outlook.com (2603:10a6:208:186::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.13; Fri, 19 Jun
 2026 15:41:38 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0113.015; Fri, 19 Jun 2026
 15:41:38 +0000
From: Frank.Li@oss.nxp.com
Date: Fri, 19 Jun 2026 11:41:01 -0400
Subject: [PATCH 04/11] clk: imx: imxrt1050: Remove NOMMU platform support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260619-dts_cleanup_arm_mcore-v1-4-0101795a2662@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781883675; l=13807;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=/Ww2vlAK3hgYXQRTH9gvPFVx2cUpwK4COiGwa56Ztuc=;
 b=ARnOjw+NxAz3Ak4likSl1RV42/5e1lS+CWhbOMOBRbeOGDfdfxjGco2Gz8jrCd5FQsFqxNMjN
 /mocDl1aS/sDdPd1t1+XHUdsxFKyXDFQWWvT8L/+lQAq+3kjaL4l0qa
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SA1P222CA0010.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:22c::12) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM0PR04MB6818:EE_
X-MS-Office365-Filtering-Correlation-Id: 219c5e90-88a0-463a-16b4-08dece19403f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|7416014|376014|19092799006|56012099006|11063799006|22082099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info:
	aJEkhvPCapusZ9/iomP0usah9ze0ufDvRzqx45xiG6KnhOrlHVSTB4xZ+g6l6V8/c8ggPU7DLytbsw5z5agKxNK9lLXamvKlIe9BYwiOTF10zwDM/1vBjXukZHN0vQbrxaigSnW8xTf2y1hegatm16HPclRFPnWdN/uzXsslnc3uUb6CqRle1FGZXKqsJfmq92cYYXL9QKneavwDib9+eWT2uroM7FddXDsSPvI0iwtjLxHjrw+dcRtqUcf17ouctzaexbFSubmdT/gc1k+YcpXaQrQwNo+hZiI0B2wyxou0Tec8RfX5hL42vcEFnZuxmnoKdPpEq3kFH/mhItZg772IGzYC48TsBYROM1Tjut0hkZeJrgEBLRqPIfcgohSA+JkWRWIQoAAddS/aBWMgeWzgQWs0iqhD/dx6iFW3Vg5xnv8F7A6dUyLMu1cZe1b+eCZcZq0muEJyxwvW2r7XXsWL2xlJqxfrmA/R2ltxzfoahU5bncOjZrzrNa2RQ7t7u7kNSeCPvtG+hXdK64aRCYituiMJ26wtX4M1XonVJ3Ja5jUXRmdL1vTbBSycNXB5qAP5EcpYgZuD6CZRi7vJxf4xAI/HSA/cWE3DaO6yb+e5JNWETrMGuBAMFZPHnGfhb2wHo1GPt6J8M+lf0IZBi4qX/O1E3+EggOQmc8F86Yv4VkXP+XsEe2s7M03uGmuoZ/ECKfO+8NjZ9BipHRrdXw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(7416014)(376014)(19092799006)(56012099006)(11063799006)(22082099003)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ejRDaHJuYndPL3NwT0U1YlVIbnZsTGNmK25vYzI3SC9UZ3pBSVFHcHNOdXJp?=
 =?utf-8?B?a3ZNblVTU1J5NHhEaXN5K2RvMmtuR0NvMjlVODV0clVBZnpGYVRPNCtRNGVF?=
 =?utf-8?B?Sit3aXVkWWM4bDZtaEUvWk5kYWFNS0cwMEliQzNJWkVad1hLTEdoTVBlaE1J?=
 =?utf-8?B?WG10OHNteldhd2Z3SzEvbkwvM29yODB5Wm5FZ3psclBlYkhvWUE2MmJKRXdE?=
 =?utf-8?B?aWFRc3NLT0V1TmJRNUNHZ0wvMk5wb25uLzdPUXZabGZwVW93cEZSVXZTYkZq?=
 =?utf-8?B?eGNrSmxWb1NlUTZ2V1pIWUI5U2JZK1pqV245c3dNbFo3WWxNVWJIZ3NQOUxn?=
 =?utf-8?B?TTA1S2FGbmw1OFE2R1FicGNGUUtrQ0JvWGNzeGtVM2ZaSDZ0T1NMZVhhcnUr?=
 =?utf-8?B?NG1BeDNqajlVTHhhcG1lWkd5L1BoYzB2YjEvcHFCaTVOdHlsYzlqTFlBK3ZG?=
 =?utf-8?B?QzJiWi82OXhYS1U2TTJLZU1wZVdnR1VLQ3lscXhEK1NQRUFiQ3dLSUJJOFhM?=
 =?utf-8?B?L3p1M1NrTmlQSUZjUVoyQWdDVFYzSE1CV01DSWt1bG5wYmdad1dCYk4vbmU0?=
 =?utf-8?B?YlZ3ejAxL3djRW5JcGhiWHZXZitIV1I5alFoZVc1VW5hSENSWi9QSlNlcGtJ?=
 =?utf-8?B?eTJTNlY2cjRkeHRHTGFjcURCRjRYVFNqNnZYQWlwOE9LQWNqZ1BJL1ZHY1NX?=
 =?utf-8?B?dTU0ZVNoNHhWZjR3UFBUZ0NlNGVOdFVaK21ZejJ4ZjdHYlpLbUNkdytYLzRJ?=
 =?utf-8?B?MnJ5OEdueGpjTTJLZXRsL295bG1oV2MwUkNVZTdSUmdvTUtqYmQ2SDl4YytI?=
 =?utf-8?B?T1V0QzBmQ3g3K1phVXc4QTR2aGwwTnVkcmFxMElXdm1idFNlTExiMUxuRVdh?=
 =?utf-8?B?b3ZteitOalhvWGxaQmpMWGV6VzE4UGkwQjlkWGxONEQrZzIrRWVrekJzUFlz?=
 =?utf-8?B?SUpocENDbElJTTFkY0ZHZjRKRDVqbmt5NnJqNG1XSGZJNXZ2cW9HZzBDUlNk?=
 =?utf-8?B?Q2p1MlhielBKajFkMHhCZjVHMmlqOUFSTi95WXh3R01vRUVqMzRhaHJPU0lr?=
 =?utf-8?B?aXFmbngzWVpHams0T2w2QlBFcUcyOVJBN3RaOEpOWTRYd1V0b3VhMTR2TDZ2?=
 =?utf-8?B?MmpkVndiRkwxdEhuY0J0REluWUQ3SE80MkF1K3o3Y2NKR1YzUjQ0REYyNTU3?=
 =?utf-8?B?NVNGcjJrNVliSWMzQW00NmQwVEdOZTdpaVdCbVh6YVMzRnIrTjBZdGlrcVlm?=
 =?utf-8?B?V2xQNW16R3V6OWM2Yi9rQm9IcllHTkU4NmhCTlRRT2ZRWGlhSGhpNmpWcW9w?=
 =?utf-8?B?Tm5ORHdQbmEyTlVtSVdTdFh6NkFoamgvd0ZpbDV4REp2djRPVW9wY0YzaVlr?=
 =?utf-8?B?YlJQZVQrSkxNcDQ5LzFneDk4WVYwbTU5clJJeUFhbC9NMjdVdUdwU3N2Vnpo?=
 =?utf-8?B?bC8xVlFCZ3BYQVBPeDF2aFZHODc1ZHJrbkZkaTd4TTdMMVdqYzE0RmVXM1M3?=
 =?utf-8?B?UDZZV2xUMzgvNXVUeVdlSk9nQ1M2c3JjbUkyMkU2NnJGbW01b2xQaXBvbFoz?=
 =?utf-8?B?aUJFS25kUzhiY2tyMXc2ZjFJYW9NK2FSSXRVNnhoRGRlWlpLV2Q4TGRjc0k3?=
 =?utf-8?B?dnV5SXBoeURadCs4QlA3VXRQY0xYWTExOHZsUVJTVUxTM2xTVXhHWGQzMGtm?=
 =?utf-8?B?ZkpFdW5UaG5nZnBRMzBZMW5VMXFmVHRhOHpsMHE5b3NNZU84Zzh6L21kd0xq?=
 =?utf-8?B?RHRUcTRpWWxIMUJCcDNYd2gzQy9PRjRsVHNnR1FsYkFxenVpWXdnSVI4N2Ir?=
 =?utf-8?B?blpvWHc1bWNtbGxielQ1bk1MZFlEcGtoT0QxYThKeEZMdFZzeVIrMElKUDlp?=
 =?utf-8?B?WElFaE5WZTRZTkJUTlZuazkxemNvL3FHSnJWWFFjZExURGZ1bndjWTcvdENi?=
 =?utf-8?B?N21DajNpdWxRVVE2M1JhV0RwZkFCR3IrZjlLbUFIeHl6UGFBcHBQU2xZZGdy?=
 =?utf-8?B?WVA5TmROYzBtenRXUVB3SUUzMlFGakJxQXJKbng2Mmp2SXg3SUZjZDl5YjR2?=
 =?utf-8?B?dzdUUFNaNEErVmZwZmRkdzR3TE5mOC8yM2NiNFhqeXBDUjh5M21TNjVLQUlI?=
 =?utf-8?B?ZGtaNEdmUzh2WE82NC83Z09Ld2pLRCsvME92MHhMcU9NTWUxUmoxejlSMFpT?=
 =?utf-8?B?Qjgrazlab2VTYktsbkpaL1BNNmI3NTQ0ZXB0czdjanRiVGJpMHZTOFQxK1Zq?=
 =?utf-8?B?K25hSU9nZ283QU1WbGM0aFNYemZxR0JHK3hONzN1TDV0V2dLckt0Y3d3OU9j?=
 =?utf-8?B?b3A2blBnSTc2K2djbzNndzlTTllIMGNUd0FVc1k5Vms5ZEZVYW53QnF0aEk4?=
 =?utf-8?Q?DV45sNkBG/D6vVq7oy1UprBL5kYXkEY2u4UDF?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 219c5e90-88a0-463a-16b4-08dece19403f
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 15:41:38.2013
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u7nxdLEfu75SQTlJDqkP/VkDI/S5IgqXCCY8kr9B4djIxxW9LuNe0GMhSquN2aidD4FHIfMg7BYvIYdtrKjEDPWA9BQFrht5+XP9/OCLRKCB2t8Emgiqe1j/cHiVJcgo
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
	TAGGED_FROM(0.00)[bounces-38717-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[benettiengineering.com:email,oss.nxp.com:from_mime,i.mx:url,nxp.com:mid,nxp.com:email,NXP1.onmicrosoft.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 96E2C6A6CE2

From: Frank Li <Frank.Li@nxp.com>

Commercial users and hardware vendors migrated to Zephyr or other RTOS
solutions years ago, leaving the NOMMU platform support effectively
unused and unmaintained.

Remove the obsolete support to reduce maintenance burden and simplify the
i.MX platform code.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/clk/imx/Kconfig                     |   6 -
 drivers/clk/imx/Makefile                    |   1 -
 drivers/clk/imx/clk-imxrt1050.c             | 182 ----------------------------
 include/dt-bindings/clock/imxrt1050-clock.h |  72 -----------
 4 files changed, 261 deletions(-)

diff --git a/drivers/clk/imx/Kconfig b/drivers/clk/imx/Kconfig
index b292e7ca5c248..92ae6e095fadb 100644
--- a/drivers/clk/imx/Kconfig
+++ b/drivers/clk/imx/Kconfig
@@ -123,9 +123,3 @@ config CLK_IMX95_BLK_CTL
 	help
 	    Build the clock driver for i.MX95 BLK CTL
 
-config CLK_IMXRT1050
-	tristate "IMXRT1050 CCM Clock Driver"
-	depends on SOC_IMXRT || COMPILE_TEST
-	select MXC_CLK
-	help
-	    Build the driver for i.MXRT1050 CCM Clock Driver
diff --git a/drivers/clk/imx/Makefile b/drivers/clk/imx/Makefile
index 208b46873a18c..e71a6a8f8b04f 100644
--- a/drivers/clk/imx/Makefile
+++ b/drivers/clk/imx/Makefile
@@ -56,5 +56,4 @@ obj-$(CONFIG_CLK_IMX6SX) += clk-imx6sx.o
 obj-$(CONFIG_CLK_IMX6UL) += clk-imx6ul.o
 obj-$(CONFIG_CLK_IMX7D)  += clk-imx7d.o
 obj-$(CONFIG_CLK_IMX7ULP) += clk-imx7ulp.o
-obj-$(CONFIG_CLK_IMXRT1050)  += clk-imxrt1050.o
 obj-$(CONFIG_CLK_VF610)  += clk-vf610.o
diff --git a/drivers/clk/imx/clk-imxrt1050.c b/drivers/clk/imx/clk-imxrt1050.c
deleted file mode 100644
index efd1ac9d8eeb7..0000000000000
--- a/drivers/clk/imx/clk-imxrt1050.c
+++ /dev/null
@@ -1,182 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
-/*
- * Copyright (C) 2021
- * Author(s):
- * Jesse Taube <Mr.Bossman075@gmail.com>
- * Giulio Benetti <giulio.benetti@benettiengineering.com>
- */
-#include <linux/clk.h>
-#include <linux/of_address.h>
-#include <linux/of_irq.h>
-#include <linux/platform_device.h>
-#include <dt-bindings/clock/imxrt1050-clock.h>
-
-#include "clk.h"
-
-static const char * const pll_ref_sels[] = {"osc", "dummy", };
-static const char * const per_sels[] = {"ipg_pdof", "osc", };
-static const char * const pll1_bypass_sels[] = {"pll1_arm", "pll1_arm_ref_sel", };
-static const char * const pll2_bypass_sels[] = {"pll2_sys", "pll2_sys_ref_sel", };
-static const char * const pll3_bypass_sels[] = {"pll3_usb_otg", "pll3_usb_otg_ref_sel", };
-static const char * const pll5_bypass_sels[] = {"pll5_video", "pll5_video_ref_sel", };
-static const char *const pre_periph_sels[] = {
-	"pll2_sys", "pll2_pfd2_396m", "pll2_pfd0_352m", "arm_podf", };
-static const char *const periph_sels[] = { "pre_periph_sel", "todo", };
-static const char *const usdhc_sels[] = { "pll2_pfd2_396m", "pll2_pfd0_352m", };
-static const char *const lpuart_sels[] = { "pll3_80m", "osc", };
-static const char *const lcdif_sels[] = {
-	"pll2_sys", "pll3_pfd3_454_74m", "pll5_video", "pll2_pfd0_352m",
-	"pll2_pfd1_594m", "pll3_pfd1_664_62m", };
-static const char *const semc_alt_sels[] = { "pll2_pfd2_396m", "pll3_pfd1_664_62m", };
-static const char *const semc_sels[] = { "periph_sel", "semc_alt_sel", };
-
-static struct clk_hw **hws;
-static struct clk_hw_onecell_data *clk_hw_data;
-
-static int imxrt1050_clocks_probe(struct platform_device *pdev)
-{
-	void __iomem *ccm_base;
-	void __iomem *pll_base;
-	struct device *dev = &pdev->dev;
-	struct device_node *np = dev->of_node;
-	struct device_node *anp;
-	int ret;
-
-	clk_hw_data = devm_kzalloc(dev, struct_size(clk_hw_data, hws,
-					  IMXRT1050_CLK_END), GFP_KERNEL);
-	if (WARN_ON(!clk_hw_data))
-		return -ENOMEM;
-
-	clk_hw_data->num = IMXRT1050_CLK_END;
-	hws = clk_hw_data->hws;
-
-	hws[IMXRT1050_CLK_OSC] = imx_get_clk_hw_by_name(np, "osc");
-
-	anp = of_find_compatible_node(NULL, NULL, "fsl,imxrt-anatop");
-	pll_base = devm_of_iomap(dev, anp, 0, NULL);
-	of_node_put(anp);
-	if (WARN_ON(IS_ERR(pll_base))) {
-		ret = PTR_ERR(pll_base);
-		goto unregister_hws;
-	}
-
-	/* Anatop clocks */
-	hws[IMXRT1050_CLK_DUMMY] = imx_clk_hw_fixed("dummy", 0UL);
-
-	hws[IMXRT1050_CLK_PLL1_REF_SEL] = imx_clk_hw_mux("pll1_arm_ref_sel",
-		pll_base + 0x0, 14, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
-	hws[IMXRT1050_CLK_PLL2_REF_SEL] = imx_clk_hw_mux("pll2_sys_ref_sel",
-		pll_base + 0x30, 14, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
-	hws[IMXRT1050_CLK_PLL3_REF_SEL] = imx_clk_hw_mux("pll3_usb_otg_ref_sel",
-		pll_base + 0x10, 14, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
-	hws[IMXRT1050_CLK_PLL5_REF_SEL] = imx_clk_hw_mux("pll5_video_ref_sel",
-		pll_base + 0xa0, 14, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
-
-	hws[IMXRT1050_CLK_PLL1_ARM] = imx_clk_hw_pllv3(IMX_PLLV3_SYS, "pll1_arm",
-		"pll1_arm_ref_sel", pll_base + 0x0, 0x7f);
-	hws[IMXRT1050_CLK_PLL2_SYS] = imx_clk_hw_pllv3(IMX_PLLV3_GENERIC, "pll2_sys",
-		"pll2_sys_ref_sel", pll_base + 0x30, 0x1);
-	hws[IMXRT1050_CLK_PLL3_USB_OTG] = imx_clk_hw_pllv3(IMX_PLLV3_USB, "pll3_usb_otg",
-		"pll3_usb_otg_ref_sel", pll_base + 0x10, 0x1);
-	hws[IMXRT1050_CLK_PLL5_VIDEO] = imx_clk_hw_pllv3(IMX_PLLV3_AV, "pll5_video",
-		"pll5_video_ref_sel", pll_base + 0xa0, 0x7f);
-
-	/* PLL bypass out */
-	hws[IMXRT1050_CLK_PLL1_BYPASS] = imx_clk_hw_mux_flags("pll1_bypass", pll_base + 0x0, 16, 1,
-		pll1_bypass_sels, ARRAY_SIZE(pll1_bypass_sels), CLK_SET_RATE_PARENT);
-	hws[IMXRT1050_CLK_PLL2_BYPASS] = imx_clk_hw_mux_flags("pll2_bypass", pll_base + 0x30, 16, 1,
-		pll2_bypass_sels, ARRAY_SIZE(pll2_bypass_sels), CLK_SET_RATE_PARENT);
-	hws[IMXRT1050_CLK_PLL3_BYPASS] = imx_clk_hw_mux_flags("pll3_bypass", pll_base + 0x10, 16, 1,
-		pll3_bypass_sels, ARRAY_SIZE(pll3_bypass_sels), CLK_SET_RATE_PARENT);
-	hws[IMXRT1050_CLK_PLL5_BYPASS] = imx_clk_hw_mux_flags("pll5_bypass", pll_base + 0xa0, 16, 1,
-		pll5_bypass_sels, ARRAY_SIZE(pll5_bypass_sels), CLK_SET_RATE_PARENT);
-
-	hws[IMXRT1050_CLK_VIDEO_POST_DIV_SEL] = imx_clk_hw_divider("video_post_div_sel",
-		"pll5_video", pll_base + 0xa0, 19, 2);
-	hws[IMXRT1050_CLK_VIDEO_DIV] = imx_clk_hw_divider("video_div",
-		"video_post_div_sel", pll_base + 0x170, 30, 2);
-
-	hws[IMXRT1050_CLK_PLL3_80M] = imx_clk_hw_fixed_factor("pll3_80m",  "pll3_usb_otg", 1, 6);
-
-	hws[IMXRT1050_CLK_PLL2_PFD0_352M] = imx_clk_hw_pfd("pll2_pfd0_352m", "pll2_sys", pll_base + 0x100, 0);
-	hws[IMXRT1050_CLK_PLL2_PFD1_594M] = imx_clk_hw_pfd("pll2_pfd1_594m", "pll2_sys", pll_base + 0x100, 1);
-	hws[IMXRT1050_CLK_PLL2_PFD2_396M] = imx_clk_hw_pfd("pll2_pfd2_396m", "pll2_sys", pll_base + 0x100, 2);
-	hws[IMXRT1050_CLK_PLL3_PFD1_664_62M] = imx_clk_hw_pfd("pll3_pfd1_664_62m", "pll3_usb_otg", pll_base + 0xf0, 1);
-	hws[IMXRT1050_CLK_PLL3_PFD3_454_74M] = imx_clk_hw_pfd("pll3_pfd3_454_74m", "pll3_usb_otg", pll_base + 0xf0, 3);
-
-	/* CCM clocks */
-	ccm_base = devm_platform_ioremap_resource(pdev, 0);
-	if (WARN_ON(IS_ERR(ccm_base))) {
-		ret = PTR_ERR(ccm_base);
-		goto unregister_hws;
-	}
-
-	hws[IMXRT1050_CLK_ARM_PODF] = imx_clk_hw_divider("arm_podf", "pll1_arm", ccm_base + 0x10, 0, 3);
-	hws[IMXRT1050_CLK_PRE_PERIPH_SEL] = imx_clk_hw_mux("pre_periph_sel", ccm_base + 0x18, 18, 2,
-		pre_periph_sels, ARRAY_SIZE(pre_periph_sels));
-	hws[IMXRT1050_CLK_PERIPH_SEL] = imx_clk_hw_mux("periph_sel", ccm_base + 0x14, 25, 1,
-		periph_sels, ARRAY_SIZE(periph_sels));
-	hws[IMXRT1050_CLK_USDHC1_SEL] = imx_clk_hw_mux("usdhc1_sel", ccm_base + 0x1c, 16, 1,
-		usdhc_sels, ARRAY_SIZE(usdhc_sels));
-	hws[IMXRT1050_CLK_USDHC2_SEL] = imx_clk_hw_mux("usdhc2_sel", ccm_base + 0x1c, 17, 1,
-		usdhc_sels, ARRAY_SIZE(usdhc_sels));
-	hws[IMXRT1050_CLK_LPUART_SEL] = imx_clk_hw_mux("lpuart_sel", ccm_base + 0x24, 6, 1,
-		lpuart_sels, ARRAY_SIZE(lpuart_sels));
-	hws[IMXRT1050_CLK_LCDIF_SEL] = imx_clk_hw_mux("lcdif_sel", ccm_base + 0x38, 15, 3,
-		lcdif_sels, ARRAY_SIZE(lcdif_sels));
-	hws[IMXRT1050_CLK_PER_CLK_SEL] = imx_clk_hw_mux("per_sel", ccm_base + 0x1C, 6, 1,
-		per_sels, ARRAY_SIZE(per_sels));
-	hws[IMXRT1050_CLK_SEMC_ALT_SEL] = imx_clk_hw_mux("semc_alt_sel", ccm_base + 0x14, 7, 1,
-		semc_alt_sels, ARRAY_SIZE(semc_alt_sels));
-	hws[IMXRT1050_CLK_SEMC_SEL] = imx_clk_hw_mux_flags("semc_sel", ccm_base + 0x14, 6, 1,
-		semc_sels, ARRAY_SIZE(semc_sels), CLK_IS_CRITICAL);
-
-	hws[IMXRT1050_CLK_AHB_PODF] = imx_clk_hw_divider("ahb", "periph_sel", ccm_base + 0x14, 10, 3);
-	hws[IMXRT1050_CLK_IPG_PDOF] = imx_clk_hw_divider("ipg", "ahb", ccm_base + 0x14, 8, 2);
-	hws[IMXRT1050_CLK_PER_PDOF] = imx_clk_hw_divider("per", "per_sel", ccm_base + 0x1C, 0, 5);
-
-	hws[IMXRT1050_CLK_USDHC1_PODF] = imx_clk_hw_divider("usdhc1_podf", "usdhc1_sel", ccm_base + 0x24, 11, 3);
-	hws[IMXRT1050_CLK_USDHC2_PODF] = imx_clk_hw_divider("usdhc2_podf", "usdhc2_sel", ccm_base + 0x24, 16, 3);
-	hws[IMXRT1050_CLK_LPUART_PODF] = imx_clk_hw_divider("lpuart_podf", "lpuart_sel", ccm_base + 0x24, 0, 6);
-	hws[IMXRT1050_CLK_LCDIF_PRED] = imx_clk_hw_divider("lcdif_pred", "lcdif_sel", ccm_base + 0x38, 12, 3);
-	hws[IMXRT1050_CLK_LCDIF_PODF] = imx_clk_hw_divider("lcdif_podf", "lcdif_pred", ccm_base + 0x18, 23, 3);
-
-	hws[IMXRT1050_CLK_USDHC1] = imx_clk_hw_gate2("usdhc1", "usdhc1_podf", ccm_base + 0x80, 2);
-	hws[IMXRT1050_CLK_USDHC2] = imx_clk_hw_gate2("usdhc2", "usdhc2_podf", ccm_base + 0x80, 4);
-	hws[IMXRT1050_CLK_LPUART1] = imx_clk_hw_gate2("lpuart1", "lpuart_podf", ccm_base + 0x7c, 24);
-	hws[IMXRT1050_CLK_LCDIF_APB] = imx_clk_hw_gate2("lcdif", "lcdif_podf", ccm_base + 0x70, 28);
-	hws[IMXRT1050_CLK_LCDIF_PIX] = imx_clk_hw_gate2("lcdif_pix", "lcdif", ccm_base + 0x74, 10);
-	hws[IMXRT1050_CLK_DMA] = imx_clk_hw_gate("dma", "ipg", ccm_base + 0x7C, 6);
-	hws[IMXRT1050_CLK_DMA_MUX] = imx_clk_hw_gate("dmamux0", "ipg", ccm_base + 0x7C, 7);
-	imx_check_clk_hws(hws, IMXRT1050_CLK_END);
-
-	ret = of_clk_add_hw_provider(np, of_clk_hw_onecell_get, clk_hw_data);
-	if (ret < 0) {
-		dev_err(dev, "Failed to register clks for i.MXRT1050.\n");
-		goto unregister_hws;
-	}
-	return 0;
-
-unregister_hws:
-	imx_unregister_hw_clocks(hws, IMXRT1050_CLK_END);
-	return ret;
-}
-static const struct of_device_id imxrt1050_clk_of_match[] = {
-	{ .compatible = "fsl,imxrt1050-ccm" },
-	{ /* Sentinel */ }
-};
-MODULE_DEVICE_TABLE(of, imxrt1050_clk_of_match);
-
-static struct platform_driver imxrt1050_clk_driver = {
-	.probe = imxrt1050_clocks_probe,
-	.driver = {
-		.name = "imxrt1050-ccm",
-		.of_match_table = imxrt1050_clk_of_match,
-	},
-};
-module_platform_driver(imxrt1050_clk_driver);
-
-MODULE_DESCRIPTION("NXP i.MX RT1050 clock driver");
-MODULE_LICENSE("Dual BSD/GPL");
-MODULE_AUTHOR("Jesse Taube <Mr.Bossman075@gmail.com>");
-MODULE_AUTHOR("Giulio Benetti <giulio.benetti@benettiengineering.com>");
diff --git a/include/dt-bindings/clock/imxrt1050-clock.h b/include/dt-bindings/clock/imxrt1050-clock.h
deleted file mode 100644
index 93bef0832d16d..0000000000000
--- a/include/dt-bindings/clock/imxrt1050-clock.h
+++ /dev/null
@@ -1,72 +0,0 @@
-/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
-/*
- * Copyright(C) 2019
- * Author(s): Giulio Benetti <giulio.benetti@benettiengineering.com>
- */
-
-#ifndef __DT_BINDINGS_CLOCK_IMXRT1050_H
-#define __DT_BINDINGS_CLOCK_IMXRT1050_H
-
-#define IMXRT1050_CLK_DUMMY			0
-#define IMXRT1050_CLK_CKIL			1
-#define IMXRT1050_CLK_CKIH			2
-#define IMXRT1050_CLK_OSC			3
-#define IMXRT1050_CLK_PLL2_PFD0_352M		4
-#define IMXRT1050_CLK_PLL2_PFD1_594M		5
-#define IMXRT1050_CLK_PLL2_PFD2_396M		6
-#define IMXRT1050_CLK_PLL3_PFD0_720M		7
-#define IMXRT1050_CLK_PLL3_PFD1_664_62M		8
-#define IMXRT1050_CLK_PLL3_PFD2_508_24M		9
-#define IMXRT1050_CLK_PLL3_PFD3_454_74M		10
-#define IMXRT1050_CLK_PLL2_198M			11
-#define IMXRT1050_CLK_PLL3_120M			12
-#define IMXRT1050_CLK_PLL3_80M			13
-#define IMXRT1050_CLK_PLL3_60M			14
-#define IMXRT1050_CLK_PLL1_BYPASS		15
-#define IMXRT1050_CLK_PLL2_BYPASS		16
-#define IMXRT1050_CLK_PLL3_BYPASS		17
-#define IMXRT1050_CLK_PLL5_BYPASS		19
-#define IMXRT1050_CLK_PLL1_REF_SEL		20
-#define IMXRT1050_CLK_PLL2_REF_SEL		21
-#define IMXRT1050_CLK_PLL3_REF_SEL		22
-#define IMXRT1050_CLK_PLL5_REF_SEL		23
-#define IMXRT1050_CLK_PRE_PERIPH_SEL		24
-#define IMXRT1050_CLK_PERIPH_SEL		25
-#define IMXRT1050_CLK_SEMC_ALT_SEL		26
-#define IMXRT1050_CLK_SEMC_SEL			27
-#define IMXRT1050_CLK_USDHC1_SEL		28
-#define IMXRT1050_CLK_USDHC2_SEL		29
-#define IMXRT1050_CLK_LPUART_SEL		30
-#define IMXRT1050_CLK_LCDIF_SEL			31
-#define IMXRT1050_CLK_VIDEO_POST_DIV_SEL	32
-#define IMXRT1050_CLK_VIDEO_DIV			33
-#define IMXRT1050_CLK_ARM_PODF			34
-#define IMXRT1050_CLK_LPUART_PODF		35
-#define IMXRT1050_CLK_USDHC1_PODF		36
-#define IMXRT1050_CLK_USDHC2_PODF		37
-#define IMXRT1050_CLK_SEMC_PODF			38
-#define IMXRT1050_CLK_AHB_PODF			39
-#define IMXRT1050_CLK_LCDIF_PRED		40
-#define IMXRT1050_CLK_LCDIF_PODF		41
-#define IMXRT1050_CLK_USDHC1			42
-#define IMXRT1050_CLK_USDHC2			43
-#define IMXRT1050_CLK_LPUART1			44
-#define IMXRT1050_CLK_SEMC			45
-#define IMXRT1050_CLK_LCDIF_APB			46
-#define IMXRT1050_CLK_PLL1_ARM			47
-#define IMXRT1050_CLK_PLL2_SYS			48
-#define IMXRT1050_CLK_PLL3_USB_OTG		49
-#define IMXRT1050_CLK_PLL4_AUDIO		50
-#define IMXRT1050_CLK_PLL5_VIDEO		51
-#define IMXRT1050_CLK_PLL6_ENET			52
-#define IMXRT1050_CLK_PLL7_USB_HOST		53
-#define IMXRT1050_CLK_LCDIF_PIX			54
-#define IMXRT1050_CLK_USBOH3			55
-#define IMXRT1050_CLK_IPG_PDOF			56
-#define IMXRT1050_CLK_PER_CLK_SEL		57
-#define IMXRT1050_CLK_PER_PDOF			58
-#define IMXRT1050_CLK_DMA			59
-#define IMXRT1050_CLK_DMA_MUX			60
-#define IMXRT1050_CLK_END			61
-
-#endif /* __DT_BINDINGS_CLOCK_IMXRT1050_H */

-- 
2.43.0


