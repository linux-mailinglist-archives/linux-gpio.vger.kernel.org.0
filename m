Return-Path: <linux-gpio+bounces-31623-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KNC0NEXujGmSvgAAu9opvQ
	(envelope-from <linux-gpio+bounces-31623-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 22:01:57 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A53C127983
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 22:01:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BFB443038155
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 21:00:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45C98359F84;
	Wed, 11 Feb 2026 21:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="XgEg5h4N"
X-Original-To: linux-gpio@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013052.outbound.protection.outlook.com [40.107.162.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A9F32D7F8;
	Wed, 11 Feb 2026 21:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770843640; cv=fail; b=djcEJKcd/QHR+WkcXt4cFZWTHA8XbtS+mLoCCzEJ2zUOq2SHF4RMEQGrJiJa2yZbj1HOb5TJxLS0g40wd3X2LN4ktvP/wV+OVcDOd4Yif3PSzyi1YE6y3/LMWVONmEdBAH0g1J1tEQNxOCfMHFLf3CK6smqDvr8HOuE/1sN9igo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770843640; c=relaxed/simple;
	bh=1cE933yph5yC+wGm3NSqRFh43+qDMKNlFzWG1aDVTRA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=WOYtNE6bZVmHq9mz63xJEy6lpTZtHjky2UMSQs1iJ6OJG03hdq1QJVDbWGyy7DLjq90fk+rBoFEiHZTiw2HB4ulYSLn52TyLaup2/yuHarT1OdPKHlpyOSrCrQxnR+0WRaSREVc9HoxaTWonrlJ2JaE31NlaTfTd4jKgUEHOzdA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=XgEg5h4N; arc=fail smtp.client-ip=40.107.162.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NANEtQIUBLidF+XuClVUGe9x3a9InUBpaZAouLyDivMDwxnL2CW+BfGuoQxrCINs4p4XKc264Y4V5TZTCLJ+2D16xYqy7y8tVsuiE2ZklscVgLQQ4key3Yev538igghx0tBSQCxf6Iafuo/guoQSe0wCH/ft/EPVeTjbOi4tJsYuQ7GaR8vQ5CEr9XJJCYQ8jS7tnhq5UITaCrfi0q7TXa0n/qRnHIizMkXJ65M/s69Lzg+6Izf8g/ibr4j55SRLSJa2ACt83HQzcIsNp18ihRKVuh2WKVJRCejEAdY8FC5EAP+T/4w/Y8YxtY7bmOQVY6cLdtI/lMV6z9jjxYu93w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U9cgmPSztWqM6knmT5keGf10n+k3OxePNi2wizYhXZg=;
 b=QBUvnMl+Wkti6g4bTUHBagsQhsC+PHKicjwOHtXN3NAhz8Ka+Ke/mnk9aGsW1jrWNwK40tRfA3cz79QDE1JTLDbn7O9eHFVV3SFaQnNeJ1/sdfjbmDoED148hsZNCfICxoJXuHnkRux06L1zojAMBUgF/hvCo4BIqS/q6vpQLQDuTIZKUMcjv4Rvryct5933MfbVi6u9Bjr2U768wffiy9mqtpz10ud0lkYQZZ8te/yaHC/LD0Bgw2us2qLFNYT9D75IiifaFEvbw8mlZen42eJKD1H78ocbytaCRMOJvwfQZ5HFYRphQ6lRuFUelW2XwDgwSMyYJpnpJsjgx504lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U9cgmPSztWqM6knmT5keGf10n+k3OxePNi2wizYhXZg=;
 b=XgEg5h4NPqheHO/ITaHDBgsR0+4LN7VLx9IcUxnGjyYG1RqWY57EQAxNM5WSK1m7z+SzgEANWm3sKFK/eeens947+ufqUDp+EOjKS87x3EHxCkPrXY4TjH7JZMG62S45Cseop8OS83FrX00j6Mcg4rXBqlMieSB9FnpgN9e6GRs98/fTlhXqcDz38YW9OPKOPI1bi6v3rdmd+SuPmT2mTZfFsMsDJlcX/xLBtbWF44Gqs14mqr+oC1bzJmhlCRCv3MEt60auzO3TKY5AJAyP1vPK8LcCweM1bLuDKt51OO00aYJOn46v0M/40IxLuG47k5x/WMqlnOmz7zO+bQsmgw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM9PR04MB8954.eurprd04.prod.outlook.com (2603:10a6:20b:409::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Wed, 11 Feb
 2026 21:00:33 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9587.010; Wed, 11 Feb 2026
 21:00:33 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Wed, 11 Feb 2026 16:00:03 -0500
Subject: [PATCH 4/4] ARM: dts: imx: remove redundant intermediate node in
 pinmux hierarchy
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260211-imx2_iomux_warning-v1-4-1c5233771b32@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770843616; l=65741;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=1cE933yph5yC+wGm3NSqRFh43+qDMKNlFzWG1aDVTRA=;
 b=Dtg9S+AorEzIql9S9wgMKLnaOeyfTKrVJP90A9QEkfkNlRVaC4HvZytoHFWN9yBHtfo3Giz2w
 CeaCK8CgXgPD6Rkj5HE0opXeJwTfJrANkhnudDAx01/UB/zutCYYp/b
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
X-MS-Office365-Filtering-Correlation-Id: 7fbf4589-15c7-4e14-7099-08de69b09890
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|376014|7416014|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OVRSN2JrbXV0U09xWHp1cGd0Zk03NVN4dUI1QTFDblp5Y1kwT2Jyd1l5a2VQ?=
 =?utf-8?B?b3RzNDFxd3VmS0lFNEdidDh0bDVLN1ExRTFmNXgzYTNFaXE1QzJuZFEvUlU1?=
 =?utf-8?B?a0RaYW9uQnhHRmVCeFZsVVlIS09Va0Z4cmJEa0pEcUhJWEo2ZktmSTRDZkcx?=
 =?utf-8?B?U25FSGxFQVlySGdTaGkyZC8vMHNCdHlPdDFTaDI5Z0pSK0N2ZlAvUUoyV054?=
 =?utf-8?B?N25CLzVZOEp5ZkJFUGVZOU8xNkFsNW00bUdzQjE1Y2ZscEZGOU1wMWNsRmZi?=
 =?utf-8?B?SDN3TU0xTjE1NWhzOTNVc3pQbjBpdTc0VFJTUjVKbUJDRm1GdnZ0eTU3T2dw?=
 =?utf-8?B?SkY2dittZUhrOXdHV01qM0FIbFgvOWk0ZGlORU9KT1docE1CcWxGZ2hUbEY0?=
 =?utf-8?B?cVBjVThsMFpla2V5Zkx6NnVIN1lBc2o3ekhVN1BYMjFCTHBuS1RFcjArRW9O?=
 =?utf-8?B?Q1QxSGdDalJ5V1BFYkF1a01Ra3NtVEl3cVhYcXQrRExzdkRaR3pabmgvd0Zm?=
 =?utf-8?B?dWRRZTRiYU1UdjN6WWhaN2I4Zmd6WjF6TTA5MWNucENXaVhEUHJHVWtxLzFG?=
 =?utf-8?B?UVNsQUUrUXRxQ3phVGlJRmpBamFQc2xUbUYvd2JBbmVkSkdNRlZ4dXBEeUVN?=
 =?utf-8?B?NFIrcmo3a1prVmVtL2k5UmNUYlh1L0YrLzBvK2w2Q3QrV3BJTkp4NDJtaXZE?=
 =?utf-8?B?bFNGZW82c2w1V0F4Tjk2eEptemtoMGdEUWo5TVl0UWtqK2xudm83YzZaTDVx?=
 =?utf-8?B?NTVXUVpDcmEvTGxxaGVYWW9qWnJ3ajcwRDg2VzdFT0c0THdaOUVqNjJaem1w?=
 =?utf-8?B?a0xpQ3M1UmZOYWVmb0NReGc0VlhmZ0F3NjlmM0NZa3FmZGxWdEpxK1FSallq?=
 =?utf-8?B?Ym8vWWRia2tDcWsvZkhCK3kxUlJScVlqMUZyaW9MS2VCeDQ5bkxaNkh0L0pj?=
 =?utf-8?B?MGdrSXNkcnNHRjJFSlNNTHdlUFFxUjJRQ3RBbXRIRW5rY1ZidWx2STNPd3py?=
 =?utf-8?B?SWZpWStBSWJyNEhxSklkRW82Ty8reUlSNVp4MXRyaHFjcTQ5NHBCcFl2ZEc2?=
 =?utf-8?B?bkQ5ZXJzdkUwSm9DQ0Y2c0ptOG54bHFKT3RoMXJXOUN5SnFNczM2TE9wemx5?=
 =?utf-8?B?WVVMVTJCeXBqUGg1U0JHNEFTcU1VTklVc0NTdnpyMHNSYm5jK1BiV1lpWUVD?=
 =?utf-8?B?M2IxWVBUU2lkWnJDOEluVTN0WEp2SWVYa1E0cmFkckZRUzkxQkhqRW93NE55?=
 =?utf-8?B?RGYzOUI4Qlh2UDZOREJZSHdmMWU4eWh1SUNjMEp4cnBINDNwZnlBbUpuWUd5?=
 =?utf-8?B?WlJjZXM0QzQ5cHVsTUw2L01CZkFEYnJXTEl5K2s2Ris1N3NBa3FuRUFPMFpF?=
 =?utf-8?B?Y2hIeHljdkpTQm9CcVpBdWJpRnBMRmdwMk03YU9YSWxQeDNzUWVXbHpwM2xN?=
 =?utf-8?B?VUU4ZktQSXc3anVEaUdUL0p3V1QycVBqN3VQaXFQRlE0TkYzT3lsZTNtcDlw?=
 =?utf-8?B?MmExY3o4d2FCTkk0TzF2R3lXNVI5Sm1Xby9SNUFPUlUrYW5NQkFpenZnWWdW?=
 =?utf-8?B?ZERrcllrbnBiSzEyWEtpdEFGVGRrSDY0TVYxQ3B2cVhlNmZEdGNMQmc2NFhZ?=
 =?utf-8?B?a2p3Y1JHR3pWVTIwY0QxQWJ3MGcxKzA2SksvZUlQN3ZEZ21XU0l6KzNlL0Zk?=
 =?utf-8?B?cFdtWEJ5b1l4TjdsNGp2dmFHeGxMTGVsK2l4SVVRWkpTSk9UWFhFR3oxREl2?=
 =?utf-8?B?RlBBblNXeTZHQjdicm9VKzFibmRKU01qTzB2aFdZS3g4Wjl3SEtuT3h5NSt4?=
 =?utf-8?B?U09ZK2hrYnZGVmEyMU9vUXUvSjV0S0VMT2dNVFIzZTN6MEdDYmFpbis4aGNq?=
 =?utf-8?B?OThOY2pFc3U4bld0bXNZcVpTUUZZVmxoMWJUSGp4L3VRbytRUUNsR2lTdHUz?=
 =?utf-8?B?bnE0Z0hlV2ZnZ1VkWDljU2JuSFhNdk9yM1lKbW5RMjdoaG9pTjlYcW9hWnVO?=
 =?utf-8?B?T2cvTjJPWjAyNmFzOW1ZR0dXSWx1V285Z2VVWmNCVnBSc0pTUG55azc0STBk?=
 =?utf-8?B?UFlCeGpQVjRlcVgwSjdQZHJOY1JJWWFaYmlBeTZIYy9nY1NXNzhQYS8wdThy?=
 =?utf-8?B?K3N0dGpCNFFiVENSelZOR1Q3N3FHYlQwb2NGbmx6ajRZZ2lNanlwVGZUVXVI?=
 =?utf-8?Q?52mObhNZFV/nqZ4iJhtgWYDDgQxVXyaXHNgo41omexJf?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(376014)(7416014)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T2s1am93dTJjRnBJeXBEZ08wOW9XQjZPdWxZeTZ0eXVDOVZjNkh3OVBhR054?=
 =?utf-8?B?QmwyV0FNTlN4ODh0R0hEQ0VlQ0NEV0txaEUxKytrLys0OTR4d3JCclphMzdH?=
 =?utf-8?B?Ykc3ZURoanZ5ZmIzcFNTM1p4RXU1MDY4NE80R0doMjd4SGVtbFdMeU1UZVhS?=
 =?utf-8?B?Rlo5K0xxcjYrQitPNS9iSmF6b3NRaWljWEo5K2tjVUZCZXFJRDJYNy9YdGJV?=
 =?utf-8?B?OUNxL1JEOXZJQlRiTzFHOHFqZlZBNGdhbzFMZmY2UjhjYjBnUWdMN2p6b1Zk?=
 =?utf-8?B?My9MR3VlRmZ5cjBIKzVZc3ZQVm1tMGRBa1hjNGJQTVprQ3pmMGVDNjdpdDdj?=
 =?utf-8?B?V2VVRXhUMzVPUyt2UElDaHZ4VWJ6MTZoTFZsUG4yMWNEMzdkTXhlMHhlTEZX?=
 =?utf-8?B?OTdUOVora2xsYXVDMUdDSEQwRkdQQVZMbWRNejlxWDBJeUU0aTkwRTd5bFRi?=
 =?utf-8?B?T1F0aHorZGpEVGhGMjhkNU91Q3RrUWJTYjdINllxUHFsTWl0aDdETGcyVTBo?=
 =?utf-8?B?U2JsNVlPWU1qTFV3Z3hWODJpQ3MreWxkamc0MjY1RlZqS2VtdmxOMDlYbGFV?=
 =?utf-8?B?c2tqeTloWjQrNG41Z3ljV3ViU2ZHRGQ3UXd4bTlWNkhOQjVXZTJYRENaaGZL?=
 =?utf-8?B?WlpLMjJTVlZwVEttTWNGTXJSeGlTZEhtK0ZiWi9YOFM3L0hmNk9iSkpJdWtv?=
 =?utf-8?B?Uml3aXRDTXRXNGlyaGFZR1FnR2xpTldMWDcrRTNWMG1oR21TNjEzcEhiUkRI?=
 =?utf-8?B?WHlSUWpaNERFdEgvTHIyY2UrU2F6YUQ3d0Q3N0JVeFlRZ2xtYTVvSDJrWEhS?=
 =?utf-8?B?NkpUSlArUVhuSjdQM01aeVFVVWp3eWtROHlqRDVaRlJZRzJVK3V1Yk5ZNk1T?=
 =?utf-8?B?VTYvNDd6RTlLTUdKbTVEdzBFM000VWNmUHVqRGpvME9TcUNUWC9ycDFLUDN5?=
 =?utf-8?B?VWtqSndHd1dkUVovU0hLTzIycHppM1BsQzR4SmhUdzJNYXI5OVZGU1U0ZERa?=
 =?utf-8?B?U0tUbS9XZy9EL0hSQ3Q5SjUvZEJuUlNIZkdRc0RFNFNFZkRVMVZpL1hQd3ZH?=
 =?utf-8?B?VCtlN2x6UUZxN3U0a0FEdUxUcGYyZVJ1YW1qKzNDY1Zkdis1dzVOaG9CZjZ1?=
 =?utf-8?B?QlEzREY4ZWM4bnkvejB6Q3d3ZmROQXM0SjllZHRYU1krcTZhRitsTjZRR1VK?=
 =?utf-8?B?V09QdzJ3S3ppcitNZlpuWXF2V0REMTF3SlZPWE02UzFINThQVW5jRnNHWE82?=
 =?utf-8?B?NUwweGNHM0g3VDQrVEl4WVl3SS9uNnhqek8rcXV0L1pOdldCNEhlclcrRUdV?=
 =?utf-8?B?MHVQdEt4K0NwN2FteFNtTThuN04vbUIvcEpFMlVEVEk4OHV0TTZTYnVpaUNF?=
 =?utf-8?B?MXVCSTF3OEZ6c1NqM2dmdVUrbXJNcDlURFVpanNVcENHYXZkRzYrclI3d3hX?=
 =?utf-8?B?TkljZFZlYzJHZUR0NkFtbXAxaDgvU2tpVnZUUFdBWTF6UUhDOXFYcmFJcmpr?=
 =?utf-8?B?UW41eG1tTElrZ0lJNTJGeWhkODhDczR1ZXIrMzlHbW40MFl6WjVHZ0VzUzZs?=
 =?utf-8?B?QVFON0FnR29samlaRXljdGUxcklyb3pKdWdZNkRZaUtDL0g3OEpqVExpbzdt?=
 =?utf-8?B?OS9UenYvQ0t5NTB3MWpYREFITmVhVURQT0hqTmhqeWhmR3lNWXUwYlJQbnpz?=
 =?utf-8?B?Yk05Y3dCWlVoVEtUS0xyTjhTWUFXMTVhQWRwMGlWdlJuUldSNVdBaDRCRytN?=
 =?utf-8?B?SEJWbi9ockdVcWlLNlBZL1Q4eXg0UUJ1RmNvM0hZRUcvc1oxejQ2MzhjVjZ2?=
 =?utf-8?B?Um5pZ3IwaUx1bENEVE5EQUpMaDlCRmcrYVVJakJWS216NFlxdWhiMU91Vlh6?=
 =?utf-8?B?aFhtZXkzVmR2TUVPYm9yNFV6Z0pvd2s0NW1YdnlIMC9CSVFtNU44M0dtTDV0?=
 =?utf-8?B?UXMvd3FWcDRUNUdYYkxuL2x0L1hUNkhpb2RzV1J5Vk1uZ0x0VzBxMjdQTzl0?=
 =?utf-8?B?czhtdTViVG14N2ovV0xxT1NyQi9RWjZJY0xEY3B4djlJNldDbExSK2FMVzJD?=
 =?utf-8?B?YVkrcmFScVJzNHNIcHhWNm1XVlBoUFpDZ205R2w0RUtpbHVScGRhellsUVBr?=
 =?utf-8?B?MGhtNHlsdy9GMlZiOGd6L1JsSnhyZjN4RlRFc2dFMDhza0FOcTdQdEdVTEtH?=
 =?utf-8?B?S1R0cjBlcG1YRkpVSWI4bDg5VUZKUSthRGRtU2ZFR1lPeXFVclYyLy9RT1Rz?=
 =?utf-8?B?UXhtS2NOaWVvRExtL1cyRzc4SEhMcFFzeTVIdGdyNGEzZ3VyZVZQKzN3c3d1?=
 =?utf-8?Q?fnSTHhiQ465iltVMWJ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fbf4589-15c7-4e14-7099-08de69b09890
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 21:00:33.1153
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1NX5x8eUa9OFMjwFQD0R9j6Dp0CLLgyw0cu5Xoha/wyyUgp6a0M1MlcokB6eP7QbrqJiHg3syB5gCLT3yKKVjQ==
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
	TAGGED_FROM(0.00)[bounces-31623-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4A53C127983
X-Rspamd-Action: no action

Remove the redundant intermediate node between the pinmux and group nodes,
and add the missing "grp" suffix to the group node names.

Fix below CHECK_DTBS warnings:
arm/boot/dts/nxp/imx/imx27-apf27dev.dtb: iomuxc@10015000 (fsl,imx27-iomuxc): Unevaluated properties are not allowed ('imx27-apf27', 'imx27-apf27dev' were unexpected)
        from schema $id: http://devicetree.org/schemas/pinctrl/fsl,imx27-iomuxc.yaml

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/imx/imx1-ads.dts             | 108 +++++-----
 arch/arm/boot/dts/nxp/imx/imx1-apf9328.dts         |  92 ++++-----
 .../boot/dts/nxp/imx/imx25-eukrea-cpuimx25.dtsi    |  38 ++--
 .../imx25-eukrea-mbimxsd25-baseboard-cmo-qvga.dts  |   6 +-
 .../nxp/imx/imx25-eukrea-mbimxsd25-baseboard.dts   | 134 ++++++------
 arch/arm/boot/dts/nxp/imx/imx25-pdk.dts            | 190 +++++++++--------
 arch/arm/boot/dts/nxp/imx/imx27-apf27.dts          |  58 +++---
 arch/arm/boot/dts/nxp/imx/imx27-apf27dev.dts       | 194 +++++++++---------
 .../boot/dts/nxp/imx/imx27-eukrea-cpuimx27.dtsi    | 228 ++++++++++-----------
 .../nxp/imx/imx27-eukrea-mbimxsd27-baseboard.dts   | 194 +++++++++---------
 arch/arm/boot/dts/nxp/imx/imx27-pdk.dts            | 132 ++++++------
 .../dts/nxp/imx/imx27-phytec-phycard-s-rdk.dts     |  92 ++++-----
 .../dts/nxp/imx/imx27-phytec-phycard-s-som.dtsi    | 174 ++++++++--------
 .../boot/dts/nxp/imx/imx27-phytec-phycore-rdk.dts  | 206 +++++++++----------
 .../boot/dts/nxp/imx/imx27-phytec-phycore-som.dtsi | 154 +++++++-------
 15 files changed, 985 insertions(+), 1015 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx1-ads.dts b/arch/arm/boot/dts/nxp/imx/imx1-ads.dts
index 2c817c4a4c68f8ec9e100db747762067c7a4b483..823e7c42910b8c21c12159ca12f9c1e7f5e4c770 100644
--- a/arch/arm/boot/dts/nxp/imx/imx1-ads.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx1-ads.dts
@@ -76,60 +76,58 @@ nor: flash@0,0 {
 };
 
 &iomuxc {
-	imx1-ads {
-		pinctrl_cspi1: cspi1grp {
-			fsl,pins = <
-				MX1_PAD_SPI1_MISO__SPI1_MISO	0x0
-				MX1_PAD_SPI1_MOSI__SPI1_MOSI	0x0
-				MX1_PAD_SPI1_RDY__SPI1_RDY	0x0
-				MX1_PAD_SPI1_SCLK__SPI1_SCLK	0x0
-				MX1_PAD_SPI1_SS__GPIO3_15	0x0
-			>;
-		};
-
-		pinctrl_i2c: i2cgrp {
-			fsl,pins = <
-				MX1_PAD_I2C_SCL__I2C_SCL	0x0
-				MX1_PAD_I2C_SDA__I2C_SDA	0x0
-			>;
-		};
-
-		pinctrl_uart1: uart1grp {
-			fsl,pins = <
-				MX1_PAD_UART1_TXD__UART1_TXD	0x0
-				MX1_PAD_UART1_RXD__UART1_RXD	0x0
-				MX1_PAD_UART1_CTS__UART1_CTS	0x0
-				MX1_PAD_UART1_RTS__UART1_RTS	0x0
-			>;
-		};
-
-		pinctrl_uart2: uart2grp {
-			fsl,pins = <
-				MX1_PAD_UART2_TXD__UART2_TXD	0x0
-				MX1_PAD_UART2_RXD__UART2_RXD	0x0
-				MX1_PAD_UART2_CTS__UART2_CTS	0x0
-				MX1_PAD_UART2_RTS__UART2_RTS	0x0
-			>;
-		};
-
-		pinctrl_weim: weimgrp {
-			fsl,pins = <
-				MX1_PAD_A0__A0			0x0
-				MX1_PAD_A16__A16		0x0
-				MX1_PAD_A17__A17		0x0
-				MX1_PAD_A18__A18		0x0
-				MX1_PAD_A19__A19		0x0
-				MX1_PAD_A20__A20		0x0
-				MX1_PAD_A21__A21		0x0
-				MX1_PAD_A22__A22		0x0
-				MX1_PAD_A23__A23		0x0
-				MX1_PAD_A24__A24		0x0
-				MX1_PAD_BCLK__BCLK		0x0
-				MX1_PAD_CS4__CS4		0x0
-				MX1_PAD_DTACK__DTACK		0x0
-				MX1_PAD_ECB__ECB		0x0
-				MX1_PAD_LBA__LBA		0x0
-			>;
-		};
+	pinctrl_cspi1: cspi1grp {
+		fsl,pins = <
+			MX1_PAD_SPI1_MISO__SPI1_MISO	0x0
+			MX1_PAD_SPI1_MOSI__SPI1_MOSI	0x0
+			MX1_PAD_SPI1_RDY__SPI1_RDY	0x0
+			MX1_PAD_SPI1_SCLK__SPI1_SCLK	0x0
+			MX1_PAD_SPI1_SS__GPIO3_15	0x0
+		>;
+	};
+
+	pinctrl_i2c: i2cgrp {
+		fsl,pins = <
+			MX1_PAD_I2C_SCL__I2C_SCL	0x0
+			MX1_PAD_I2C_SDA__I2C_SDA	0x0
+		>;
+	};
+
+	pinctrl_uart1: uart1grp {
+		fsl,pins = <
+			MX1_PAD_UART1_TXD__UART1_TXD	0x0
+			MX1_PAD_UART1_RXD__UART1_RXD	0x0
+			MX1_PAD_UART1_CTS__UART1_CTS	0x0
+			MX1_PAD_UART1_RTS__UART1_RTS	0x0
+		>;
+	};
+
+	pinctrl_uart2: uart2grp {
+		fsl,pins = <
+			MX1_PAD_UART2_TXD__UART2_TXD	0x0
+			MX1_PAD_UART2_RXD__UART2_RXD	0x0
+			MX1_PAD_UART2_CTS__UART2_CTS	0x0
+			MX1_PAD_UART2_RTS__UART2_RTS	0x0
+		>;
+	};
+
+	pinctrl_weim: weimgrp {
+		fsl,pins = <
+			MX1_PAD_A0__A0			0x0
+			MX1_PAD_A16__A16		0x0
+			MX1_PAD_A17__A17		0x0
+			MX1_PAD_A18__A18		0x0
+			MX1_PAD_A19__A19		0x0
+			MX1_PAD_A20__A20		0x0
+			MX1_PAD_A21__A21		0x0
+			MX1_PAD_A22__A22		0x0
+			MX1_PAD_A23__A23		0x0
+			MX1_PAD_A24__A24		0x0
+			MX1_PAD_BCLK__BCLK		0x0
+			MX1_PAD_CS4__CS4		0x0
+			MX1_PAD_DTACK__DTACK		0x0
+			MX1_PAD_ECB__ECB		0x0
+			MX1_PAD_LBA__LBA		0x0
+		>;
 	};
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx1-apf9328.dts b/arch/arm/boot/dts/nxp/imx/imx1-apf9328.dts
index 058e9435524fe1d12a95e7dba36ec92a073403b3..794e5bfee36706e64f0f23850a9307d04f4747f3 100644
--- a/arch/arm/boot/dts/nxp/imx/imx1-apf9328.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx1-apf9328.dts
@@ -67,56 +67,54 @@ eth: ethernet@4,c00000 {
 };
 
 &iomuxc {
-	imx1-apf9328 {
-		pinctrl_eth: ethgrp {
-			fsl,pins = <
-				MX1_PAD_SIM_SVEN__GPIO2_14	0x0
-			>;
-		};
+	pinctrl_eth: ethgrp {
+		fsl,pins = <
+			MX1_PAD_SIM_SVEN__GPIO2_14	0x0
+		>;
+	};
 
-		pinctrl_i2c: i2cgrp {
-			fsl,pins = <
-				MX1_PAD_I2C_SCL__I2C_SCL	0x0
-				MX1_PAD_I2C_SDA__I2C_SDA	0x0
-			>;
-		};
+	pinctrl_i2c: i2cgrp {
+		fsl,pins = <
+			MX1_PAD_I2C_SCL__I2C_SCL	0x0
+			MX1_PAD_I2C_SDA__I2C_SDA	0x0
+		>;
+	};
 
-		pinctrl_uart1: uart1grp {
-			fsl,pins = <
-				MX1_PAD_UART1_TXD__UART1_TXD	0x0
-				MX1_PAD_UART1_RXD__UART1_RXD	0x0
-				MX1_PAD_UART1_CTS__UART1_CTS	0x0
-				MX1_PAD_UART1_RTS__UART1_RTS	0x0
-			>;
-		};
+	pinctrl_uart1: uart1grp {
+		fsl,pins = <
+			MX1_PAD_UART1_TXD__UART1_TXD	0x0
+			MX1_PAD_UART1_RXD__UART1_RXD	0x0
+			MX1_PAD_UART1_CTS__UART1_CTS	0x0
+			MX1_PAD_UART1_RTS__UART1_RTS	0x0
+		>;
+	};
 
-		pinctrl_uart2: uart2grp {
-			fsl,pins = <
-				MX1_PAD_UART2_TXD__UART2_TXD	0x0
-				MX1_PAD_UART2_RXD__UART2_RXD	0x0
-				MX1_PAD_UART2_CTS__UART2_CTS	0x0
-				MX1_PAD_UART2_RTS__UART2_RTS	0x0
-			>;
-		};
+	pinctrl_uart2: uart2grp {
+		fsl,pins = <
+			MX1_PAD_UART2_TXD__UART2_TXD	0x0
+			MX1_PAD_UART2_RXD__UART2_RXD	0x0
+			MX1_PAD_UART2_CTS__UART2_CTS	0x0
+			MX1_PAD_UART2_RTS__UART2_RTS	0x0
+		>;
+	};
 
-		pinctrl_weim: weimgrp {
-			fsl,pins = <
-				MX1_PAD_A0__A0			0x0
-				MX1_PAD_A16__A16		0x0
-				MX1_PAD_A17__A17		0x0
-				MX1_PAD_A18__A18		0x0
-				MX1_PAD_A19__A19		0x0
-				MX1_PAD_A20__A20		0x0
-				MX1_PAD_A21__A21		0x0
-				MX1_PAD_A22__A22		0x0
-				MX1_PAD_A23__A23		0x0
-				MX1_PAD_A24__A24		0x0
-				MX1_PAD_BCLK__BCLK		0x0
-				MX1_PAD_CS4__CS4		0x0
-				MX1_PAD_DTACK__DTACK		0x0
-				MX1_PAD_ECB__ECB		0x0
-				MX1_PAD_LBA__LBA		0x0
-			>;
-		};
+	pinctrl_weim: weimgrp {
+		fsl,pins = <
+			MX1_PAD_A0__A0			0x0
+			MX1_PAD_A16__A16		0x0
+			MX1_PAD_A17__A17		0x0
+			MX1_PAD_A18__A18		0x0
+			MX1_PAD_A19__A19		0x0
+			MX1_PAD_A20__A20		0x0
+			MX1_PAD_A21__A21		0x0
+			MX1_PAD_A22__A22		0x0
+			MX1_PAD_A23__A23		0x0
+			MX1_PAD_A24__A24		0x0
+			MX1_PAD_BCLK__BCLK		0x0
+			MX1_PAD_CS4__CS4		0x0
+			MX1_PAD_DTACK__DTACK		0x0
+			MX1_PAD_ECB__ECB		0x0
+			MX1_PAD_LBA__LBA		0x0
+		>;
 	};
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx25-eukrea-cpuimx25.dtsi b/arch/arm/boot/dts/nxp/imx/imx25-eukrea-cpuimx25.dtsi
index 93a6e4e680b45133885a7c04693ae2e49dd1db85..31dc2a6403628db1527a1707460afbf9de893abd 100644
--- a/arch/arm/boot/dts/nxp/imx/imx25-eukrea-cpuimx25.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx25-eukrea-cpuimx25.dtsi
@@ -34,27 +34,25 @@ rtc@51 {
 };
 
 &iomuxc {
-	imx25-eukrea-cpuimx25 {
-		pinctrl_fec: fecgrp {
-			fsl,pins = <
-				MX25_PAD_FEC_MDC__FEC_MDC		0x80000000
-				MX25_PAD_FEC_MDIO__FEC_MDIO		0x400001e0
-				MX25_PAD_FEC_TDATA0__FEC_TDATA0		0x80000000
-				MX25_PAD_FEC_TDATA1__FEC_TDATA1		0x80000000
-				MX25_PAD_FEC_TX_EN__FEC_TX_EN		0x80000000
-				MX25_PAD_FEC_RDATA0__FEC_RDATA0		0x80000000
-				MX25_PAD_FEC_RDATA1__FEC_RDATA1		0x80000000
-				MX25_PAD_FEC_RX_DV__FEC_RX_DV		0x80000000
-				MX25_PAD_FEC_TX_CLK__FEC_TX_CLK		0x1c0
-			>;
-		};
+	pinctrl_fec: fecgrp {
+		fsl,pins = <
+			MX25_PAD_FEC_MDC__FEC_MDC		0x80000000
+			MX25_PAD_FEC_MDIO__FEC_MDIO		0x400001e0
+			MX25_PAD_FEC_TDATA0__FEC_TDATA0		0x80000000
+			MX25_PAD_FEC_TDATA1__FEC_TDATA1		0x80000000
+			MX25_PAD_FEC_TX_EN__FEC_TX_EN		0x80000000
+			MX25_PAD_FEC_RDATA0__FEC_RDATA0		0x80000000
+			MX25_PAD_FEC_RDATA1__FEC_RDATA1		0x80000000
+			MX25_PAD_FEC_RX_DV__FEC_RX_DV		0x80000000
+			MX25_PAD_FEC_TX_CLK__FEC_TX_CLK		0x1c0
+		>;
+	};
 
-		pinctrl_i2c1: i2c1grp {
-			fsl,pins = <
-				MX25_PAD_I2C1_CLK__I2C1_CLK		0x80000000
-				MX25_PAD_I2C1_DAT__I2C1_DAT		0x80000000
-			>;
-		};
+	pinctrl_i2c1: i2c1grp {
+		fsl,pins = <
+			MX25_PAD_I2C1_CLK__I2C1_CLK		0x80000000
+			MX25_PAD_I2C1_DAT__I2C1_DAT		0x80000000
+		>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard-cmo-qvga.dts b/arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard-cmo-qvga.dts
index 6cddb2cc36fe2aa4a07cad18c0fc9f2014314c1f..e08fcbfef4d5d97897943f64b9ce9c8d91104d05 100644
--- a/arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard-cmo-qvga.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard-cmo-qvga.dts
@@ -43,10 +43,8 @@ reg_lcd_3v3: regulator-0 {
 };
 
 &iomuxc {
-	imx25-eukrea-mbimxsd25-baseboard-cmo-qvga {
-		pinctrl_reg_lcd_3v3: reg_lcd_3v3 {
-			fsl,pins = <MX25_PAD_PWM__GPIO_1_26 0x80000000>;
-		};
+	pinctrl_reg_lcd_3v3: reg_lcd_3v3grp {
+		fsl,pins = <MX25_PAD_PWM__GPIO_1_26 0x80000000>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard.dts b/arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard.dts
index c7207ea437c404399213b2f4939af22159e1ea68..cf127e00793effbd7231972f464b0dc03dfa6bfe 100644
--- a/arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard.dts
@@ -68,80 +68,78 @@ tlv320aic23: codec@1a {
 };
 
 &iomuxc {
-	imx25-eukrea-mbimxsd25-baseboard {
-		pinctrl_audmux: audmuxgrp {
-			fsl,pins = <
-				MX25_PAD_KPP_COL3__AUD5_TXFS		0xe0
-				MX25_PAD_KPP_COL2__AUD5_TXC		0xe0
-				MX25_PAD_KPP_COL1__AUD5_RXD		0xe0
-				MX25_PAD_KPP_COL0__AUD5_TXD		0xe0
-			>;
-		};
+	pinctrl_audmux: audmuxgrp {
+		fsl,pins = <
+			MX25_PAD_KPP_COL3__AUD5_TXFS		0xe0
+			MX25_PAD_KPP_COL2__AUD5_TXC		0xe0
+			MX25_PAD_KPP_COL1__AUD5_RXD		0xe0
+			MX25_PAD_KPP_COL0__AUD5_TXD		0xe0
+		>;
+	};
 
-		pinctrl_esdhc1: esdhc1grp {
-			fsl,pins = <
-				MX25_PAD_SD1_CMD__ESDHC1_CMD		0x400000c0
-				MX25_PAD_SD1_CLK__ESDHC1_CLK		0x400000c0
-				MX25_PAD_SD1_DATA0__ESDHC1_DAT0		0x400000c0
-				MX25_PAD_SD1_DATA1__ESDHC1_DAT1		0x400000c0
-				MX25_PAD_SD1_DATA2__ESDHC1_DAT2		0x400000c0
-				MX25_PAD_SD1_DATA3__ESDHC1_DAT3		0x400000c0
-			>;
-		};
+	pinctrl_esdhc1: esdhc1grp {
+		fsl,pins = <
+			MX25_PAD_SD1_CMD__ESDHC1_CMD		0x400000c0
+			MX25_PAD_SD1_CLK__ESDHC1_CLK		0x400000c0
+			MX25_PAD_SD1_DATA0__ESDHC1_DAT0		0x400000c0
+			MX25_PAD_SD1_DATA1__ESDHC1_DAT1		0x400000c0
+			MX25_PAD_SD1_DATA2__ESDHC1_DAT2		0x400000c0
+			MX25_PAD_SD1_DATA3__ESDHC1_DAT3		0x400000c0
+		>;
+	};
 
-		pinctrl_gpiokeys: gpiokeysgrp {
-			fsl,pins = <MX25_PAD_VSTBY_ACK__GPIO_3_18 0x80000000>;
-		};
+	pinctrl_gpiokeys: gpiokeysgrp {
+		fsl,pins = <MX25_PAD_VSTBY_ACK__GPIO_3_18 0x80000000>;
+	};
 
-		pinctrl_gpioled: gpioledgrp {
-			fsl,pins = <MX25_PAD_POWER_FAIL__GPIO_3_19 0x80000000>;
-		};
+	pinctrl_gpioled: gpioledgrp {
+		fsl,pins = <MX25_PAD_POWER_FAIL__GPIO_3_19 0x80000000>;
+	};
 
-		pinctrl_lcdc: lcdcgrp {
-			fsl,pins = <
-				MX25_PAD_LD0__LD0			0x1
-				MX25_PAD_LD1__LD1			0x1
-				MX25_PAD_LD2__LD2			0x1
-				MX25_PAD_LD3__LD3			0x1
-				MX25_PAD_LD4__LD4			0x1
-				MX25_PAD_LD5__LD5			0x1
-				MX25_PAD_LD6__LD6			0x1
-				MX25_PAD_LD7__LD7			0x1
-				MX25_PAD_LD8__LD8			0x1
-				MX25_PAD_LD9__LD9			0x1
-				MX25_PAD_LD10__LD10			0x1
-				MX25_PAD_LD11__LD11			0x1
-				MX25_PAD_LD12__LD12			0x1
-				MX25_PAD_LD13__LD13			0x1
-				MX25_PAD_LD14__LD14			0x1
-				MX25_PAD_LD15__LD15			0x1
-				MX25_PAD_GPIO_E__LD16			0x1
-				MX25_PAD_GPIO_F__LD17			0x1
-				MX25_PAD_HSYNC__HSYNC			0x80000000
-				MX25_PAD_VSYNC__VSYNC			0x80000000
-				MX25_PAD_LSCLK__LSCLK			0x80000000
-				MX25_PAD_OE_ACD__OE_ACD			0x80000000
-				MX25_PAD_CONTRAST__CONTRAST		0x80000000
-			>;
-		};
+	pinctrl_lcdc: lcdcgrp {
+		fsl,pins = <
+			MX25_PAD_LD0__LD0			0x1
+			MX25_PAD_LD1__LD1			0x1
+			MX25_PAD_LD2__LD2			0x1
+			MX25_PAD_LD3__LD3			0x1
+			MX25_PAD_LD4__LD4			0x1
+			MX25_PAD_LD5__LD5			0x1
+			MX25_PAD_LD6__LD6			0x1
+			MX25_PAD_LD7__LD7			0x1
+			MX25_PAD_LD8__LD8			0x1
+			MX25_PAD_LD9__LD9			0x1
+			MX25_PAD_LD10__LD10			0x1
+			MX25_PAD_LD11__LD11			0x1
+			MX25_PAD_LD12__LD12			0x1
+			MX25_PAD_LD13__LD13			0x1
+			MX25_PAD_LD14__LD14			0x1
+			MX25_PAD_LD15__LD15			0x1
+			MX25_PAD_GPIO_E__LD16			0x1
+			MX25_PAD_GPIO_F__LD17			0x1
+			MX25_PAD_HSYNC__HSYNC			0x80000000
+			MX25_PAD_VSYNC__VSYNC			0x80000000
+			MX25_PAD_LSCLK__LSCLK			0x80000000
+			MX25_PAD_OE_ACD__OE_ACD			0x80000000
+			MX25_PAD_CONTRAST__CONTRAST		0x80000000
+		>;
+	};
 
-		pinctrl_uart1: uart1grp {
-			fsl,pins = <
-				MX25_PAD_UART1_RTS__UART1_RTS		0xe0
-				MX25_PAD_UART1_CTS__UART1_CTS		0xe0
-				MX25_PAD_UART1_TXD__UART1_TXD		0x80000000
-				MX25_PAD_UART1_RXD__UART1_RXD		0xc0
-			>;
-		};
+	pinctrl_uart1: uart1grp {
+		fsl,pins = <
+			MX25_PAD_UART1_RTS__UART1_RTS		0xe0
+			MX25_PAD_UART1_CTS__UART1_CTS		0xe0
+			MX25_PAD_UART1_TXD__UART1_TXD		0x80000000
+			MX25_PAD_UART1_RXD__UART1_RXD		0xc0
+		>;
+	};
 
-		pinctrl_uart2: uart2grp {
-			fsl,pins = <
-				MX25_PAD_UART2_RXD__UART2_RXD		0x80000000
-				MX25_PAD_UART2_TXD__UART2_TXD		0x80000000
-				MX25_PAD_UART2_RTS__UART2_RTS		0x80000000
-				MX25_PAD_UART2_CTS__UART2_CTS		0x80000000
-			>;
-		};
+	pinctrl_uart2: uart2grp {
+		fsl,pins = <
+			MX25_PAD_UART2_RXD__UART2_RXD		0x80000000
+			MX25_PAD_UART2_TXD__UART2_TXD		0x80000000
+			MX25_PAD_UART2_RTS__UART2_RTS		0x80000000
+			MX25_PAD_UART2_CTS__UART2_CTS		0x80000000
+		>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx25-pdk.dts b/arch/arm/boot/dts/nxp/imx/imx25-pdk.dts
index dd176fb54e58595b34a8cd2c35769f341729895a..a35778ba6ffa0474d67f77005dfa4299b27d947c 100644
--- a/arch/arm/boot/dts/nxp/imx/imx25-pdk.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx25-pdk.dts
@@ -130,109 +130,107 @@ codec: sgtl5000@a {
 };
 
 &iomuxc {
-	imx25-pdk {
-		pinctrl_audmux: audmuxgrp {
-			fsl,pins = <
-				MX25_PAD_RW__AUD4_TXFS			0xe0
-				MX25_PAD_OE__AUD4_TXC			0xe0
-				MX25_PAD_EB0__AUD4_TXD			0xe0
-				MX25_PAD_EB1__AUD4_RXD			0xe0
-			>;
-		};
+	pinctrl_audmux: audmuxgrp {
+		fsl,pins = <
+			MX25_PAD_RW__AUD4_TXFS			0xe0
+			MX25_PAD_OE__AUD4_TXC			0xe0
+			MX25_PAD_EB0__AUD4_TXD			0xe0
+			MX25_PAD_EB1__AUD4_RXD			0xe0
+		>;
+	};
 
-		pinctrl_can1: can1grp {
-			fsl,pins = <
-				MX25_PAD_GPIO_A__CAN1_TX		0x0
-				MX25_PAD_GPIO_B__CAN1_RX		0x0
-				MX25_PAD_D14__GPIO_4_6 			0x80000000
-			>;
-		};
+	pinctrl_can1: can1grp {
+		fsl,pins = <
+			MX25_PAD_GPIO_A__CAN1_TX		0x0
+			MX25_PAD_GPIO_B__CAN1_RX		0x0
+			MX25_PAD_D14__GPIO_4_6			0x80000000
+		>;
+	};
 
-		pinctrl_esdhc1: esdhc1grp {
-			fsl,pins = <
-				MX25_PAD_SD1_CMD__ESDHC1_CMD		0x80000000
-				MX25_PAD_SD1_CLK__ESDHC1_CLK		0x80000000
-				MX25_PAD_SD1_DATA0__ESDHC1_DAT0		0x80000000
-				MX25_PAD_SD1_DATA1__ESDHC1_DAT1		0x80000000
-				MX25_PAD_SD1_DATA2__ESDHC1_DAT2		0x80000000
-				MX25_PAD_SD1_DATA3__ESDHC1_DAT3		0x80000000
-				MX25_PAD_A14__GPIO_2_0			0x80000000
-				MX25_PAD_A15__GPIO_2_1			0x80000000
-			>;
-		};
+	pinctrl_esdhc1: esdhc1grp {
+		fsl,pins = <
+			MX25_PAD_SD1_CMD__ESDHC1_CMD		0x80000000
+			MX25_PAD_SD1_CLK__ESDHC1_CLK		0x80000000
+			MX25_PAD_SD1_DATA0__ESDHC1_DAT0		0x80000000
+			MX25_PAD_SD1_DATA1__ESDHC1_DAT1		0x80000000
+			MX25_PAD_SD1_DATA2__ESDHC1_DAT2		0x80000000
+			MX25_PAD_SD1_DATA3__ESDHC1_DAT3		0x80000000
+			MX25_PAD_A14__GPIO_2_0			0x80000000
+			MX25_PAD_A15__GPIO_2_1			0x80000000
+		>;
+	};
 
-		pinctrl_fec: fecgrp {
-			fsl,pins = <
-				MX25_PAD_FEC_MDC__FEC_MDC		0x80000000
-				MX25_PAD_FEC_MDIO__FEC_MDIO		0x400001e0
-				MX25_PAD_FEC_TDATA0__FEC_TDATA0		0x80000000
-				MX25_PAD_FEC_TDATA1__FEC_TDATA1		0x80000000
-				MX25_PAD_FEC_TX_EN__FEC_TX_EN		0x80000000
-				MX25_PAD_FEC_RDATA0__FEC_RDATA0		0x80000000
-				MX25_PAD_FEC_RDATA1__FEC_RDATA1		0x80000000
-				MX25_PAD_FEC_RX_DV__FEC_RX_DV		0x80000000
-				MX25_PAD_FEC_TX_CLK__FEC_TX_CLK		0x1c0
-				MX25_PAD_A17__GPIO_2_3			0x80000000
-				MX25_PAD_D12__GPIO_4_8			0x80000000
-			>;
-		};
+	pinctrl_fec: fecgrp {
+		fsl,pins = <
+			MX25_PAD_FEC_MDC__FEC_MDC		0x80000000
+			MX25_PAD_FEC_MDIO__FEC_MDIO		0x400001e0
+			MX25_PAD_FEC_TDATA0__FEC_TDATA0		0x80000000
+			MX25_PAD_FEC_TDATA1__FEC_TDATA1		0x80000000
+			MX25_PAD_FEC_TX_EN__FEC_TX_EN		0x80000000
+			MX25_PAD_FEC_RDATA0__FEC_RDATA0		0x80000000
+			MX25_PAD_FEC_RDATA1__FEC_RDATA1		0x80000000
+			MX25_PAD_FEC_RX_DV__FEC_RX_DV		0x80000000
+			MX25_PAD_FEC_TX_CLK__FEC_TX_CLK		0x1c0
+			MX25_PAD_A17__GPIO_2_3			0x80000000
+			MX25_PAD_D12__GPIO_4_8			0x80000000
+		>;
+	};
 
-		pinctrl_i2c1: i2c1grp {
-			fsl,pins = <
-				MX25_PAD_I2C1_CLK__I2C1_CLK		0x80000000
-				MX25_PAD_I2C1_DAT__I2C1_DAT		0x80000000
-			>;
-		};
+	pinctrl_i2c1: i2c1grp {
+		fsl,pins = <
+			MX25_PAD_I2C1_CLK__I2C1_CLK		0x80000000
+			MX25_PAD_I2C1_DAT__I2C1_DAT		0x80000000
+		>;
+	};
 
-		pinctrl_kpp: kppgrp {
-			fsl,pins = <
-				MX25_PAD_KPP_ROW0__KPP_ROW0	0x80000000
-				MX25_PAD_KPP_ROW1__KPP_ROW1	0x80000000
-				MX25_PAD_KPP_ROW2__KPP_ROW2	0x80000000
-				MX25_PAD_KPP_ROW3__KPP_ROW3	0x80000000
-				MX25_PAD_KPP_COL0__KPP_COL0	0x80000000
-				MX25_PAD_KPP_COL1__KPP_COL1	0x80000000
-				MX25_PAD_KPP_COL2__KPP_COL2	0x80000000
-				MX25_PAD_KPP_COL3__KPP_COL3	0x80000000
-			>;
-		};
+	pinctrl_kpp: kppgrp {
+		fsl,pins = <
+			MX25_PAD_KPP_ROW0__KPP_ROW0	0x80000000
+			MX25_PAD_KPP_ROW1__KPP_ROW1	0x80000000
+			MX25_PAD_KPP_ROW2__KPP_ROW2	0x80000000
+			MX25_PAD_KPP_ROW3__KPP_ROW3	0x80000000
+			MX25_PAD_KPP_COL0__KPP_COL0	0x80000000
+			MX25_PAD_KPP_COL1__KPP_COL1	0x80000000
+			MX25_PAD_KPP_COL2__KPP_COL2	0x80000000
+			MX25_PAD_KPP_COL3__KPP_COL3	0x80000000
+		>;
+	};
 
-		pinctrl_lcd: lcdgrp {
-			fsl,pins = <
-				MX25_PAD_LD0__LD0		0xe0
-				MX25_PAD_LD1__LD1		0xe0
-				MX25_PAD_LD2__LD2		0xe0
-				MX25_PAD_LD3__LD3		0xe0
-				MX25_PAD_LD4__LD4		0xe0
-				MX25_PAD_LD5__LD5		0xe0
-				MX25_PAD_LD6__LD6		0xe0
-				MX25_PAD_LD7__LD7		0xe0
-				MX25_PAD_LD8__LD8		0xe0
-				MX25_PAD_LD9__LD9		0xe0
-				MX25_PAD_LD10__LD10		0xe0
-				MX25_PAD_LD11__LD11		0xe0
-				MX25_PAD_LD12__LD12		0xe0
-				MX25_PAD_LD13__LD13		0xe0
-				MX25_PAD_LD14__LD14		0xe0
-				MX25_PAD_LD15__LD15		0xe0
-				MX25_PAD_GPIO_E__LD16		0xe0
-				MX25_PAD_GPIO_F__LD17		0xe0
-				MX25_PAD_HSYNC__HSYNC		0xe0
-				MX25_PAD_VSYNC__VSYNC		0xe0
-				MX25_PAD_LSCLK__LSCLK		0xe0
-				MX25_PAD_OE_ACD__OE_ACD		0xe0
-				MX25_PAD_CONTRAST__CONTRAST	0xe0
-			>;
-		};
+	pinctrl_lcd: lcdgrp {
+		fsl,pins = <
+			MX25_PAD_LD0__LD0		0xe0
+			MX25_PAD_LD1__LD1		0xe0
+			MX25_PAD_LD2__LD2		0xe0
+			MX25_PAD_LD3__LD3		0xe0
+			MX25_PAD_LD4__LD4		0xe0
+			MX25_PAD_LD5__LD5		0xe0
+			MX25_PAD_LD6__LD6		0xe0
+			MX25_PAD_LD7__LD7		0xe0
+			MX25_PAD_LD8__LD8		0xe0
+			MX25_PAD_LD9__LD9		0xe0
+			MX25_PAD_LD10__LD10		0xe0
+			MX25_PAD_LD11__LD11		0xe0
+			MX25_PAD_LD12__LD12		0xe0
+			MX25_PAD_LD13__LD13		0xe0
+			MX25_PAD_LD14__LD14		0xe0
+			MX25_PAD_LD15__LD15		0xe0
+			MX25_PAD_GPIO_E__LD16		0xe0
+			MX25_PAD_GPIO_F__LD17		0xe0
+			MX25_PAD_HSYNC__HSYNC		0xe0
+			MX25_PAD_VSYNC__VSYNC		0xe0
+			MX25_PAD_LSCLK__LSCLK		0xe0
+			MX25_PAD_OE_ACD__OE_ACD		0xe0
+			MX25_PAD_CONTRAST__CONTRAST	0xe0
+		>;
+	};
 
-		pinctrl_uart1: uart1grp {
-			fsl,pins = <
-				MX25_PAD_UART1_RTS__UART1_RTS		0xe0
-				MX25_PAD_UART1_CTS__UART1_CTS		0xe0
-				MX25_PAD_UART1_TXD__UART1_TXD		0x80000000
-				MX25_PAD_UART1_RXD__UART1_RXD		0xc0
-			>;
-		};
+	pinctrl_uart1: uart1grp {
+		fsl,pins = <
+			MX25_PAD_UART1_RTS__UART1_RTS		0xe0
+			MX25_PAD_UART1_CTS__UART1_CTS		0xe0
+			MX25_PAD_UART1_TXD__UART1_TXD		0x80000000
+			MX25_PAD_UART1_RXD__UART1_RXD		0xc0
+		>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx27-apf27.dts b/arch/arm/boot/dts/nxp/imx/imx27-apf27.dts
index 745d5d40995251ddb3ed33ddc41686ed27db00a8..b67bb21af3dedf1124ccdff6a1ac3ef703a6e22d 100644
--- a/arch/arm/boot/dts/nxp/imx/imx27-apf27.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx27-apf27.dts
@@ -24,36 +24,34 @@ &clk_osc26m {
 };
 
 &iomuxc {
-	imx27-apf27 {
-		pinctrl_fec1: fec1grp {
-			fsl,pins = <
-				MX27_PAD_SD3_CMD__FEC_TXD0 0x0
-				MX27_PAD_SD3_CLK__FEC_TXD1 0x0
-				MX27_PAD_ATA_DATA0__FEC_TXD2 0x0
-				MX27_PAD_ATA_DATA1__FEC_TXD3 0x0
-				MX27_PAD_ATA_DATA2__FEC_RX_ER 0x0
-				MX27_PAD_ATA_DATA3__FEC_RXD1 0x0
-				MX27_PAD_ATA_DATA4__FEC_RXD2 0x0
-				MX27_PAD_ATA_DATA5__FEC_RXD3 0x0
-				MX27_PAD_ATA_DATA6__FEC_MDIO 0x0
-				MX27_PAD_ATA_DATA7__FEC_MDC 0x0
-				MX27_PAD_ATA_DATA8__FEC_CRS 0x0
-				MX27_PAD_ATA_DATA9__FEC_TX_CLK 0x0
-				MX27_PAD_ATA_DATA10__FEC_RXD0 0x0
-				MX27_PAD_ATA_DATA11__FEC_RX_DV 0x0
-				MX27_PAD_ATA_DATA12__FEC_RX_CLK 0x0
-				MX27_PAD_ATA_DATA13__FEC_COL 0x0
-				MX27_PAD_ATA_DATA14__FEC_TX_ER 0x0
-				MX27_PAD_ATA_DATA15__FEC_TX_EN 0x0
-			>;
-		};
-
-		pinctrl_uart1: uart1grp {
-			fsl,pins = <
-				MX27_PAD_UART1_TXD__UART1_TXD 0x0
-				MX27_PAD_UART1_RXD__UART1_RXD 0x0
-			>;
-		};
+	pinctrl_fec1: fec1grp {
+		fsl,pins = <
+			MX27_PAD_SD3_CMD__FEC_TXD0 0x0
+			MX27_PAD_SD3_CLK__FEC_TXD1 0x0
+			MX27_PAD_ATA_DATA0__FEC_TXD2 0x0
+			MX27_PAD_ATA_DATA1__FEC_TXD3 0x0
+			MX27_PAD_ATA_DATA2__FEC_RX_ER 0x0
+			MX27_PAD_ATA_DATA3__FEC_RXD1 0x0
+			MX27_PAD_ATA_DATA4__FEC_RXD2 0x0
+			MX27_PAD_ATA_DATA5__FEC_RXD3 0x0
+			MX27_PAD_ATA_DATA6__FEC_MDIO 0x0
+			MX27_PAD_ATA_DATA7__FEC_MDC 0x0
+			MX27_PAD_ATA_DATA8__FEC_CRS 0x0
+			MX27_PAD_ATA_DATA9__FEC_TX_CLK 0x0
+			MX27_PAD_ATA_DATA10__FEC_RXD0 0x0
+			MX27_PAD_ATA_DATA11__FEC_RX_DV 0x0
+			MX27_PAD_ATA_DATA12__FEC_RX_CLK 0x0
+			MX27_PAD_ATA_DATA13__FEC_COL 0x0
+			MX27_PAD_ATA_DATA14__FEC_TX_ER 0x0
+			MX27_PAD_ATA_DATA15__FEC_TX_EN 0x0
+		>;
+	};
+
+	pinctrl_uart1: uart1grp {
+		fsl,pins = <
+			MX27_PAD_UART1_TXD__UART1_TXD 0x0
+			MX27_PAD_UART1_RXD__UART1_RXD 0x0
+		>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx27-apf27dev.dts b/arch/arm/boot/dts/nxp/imx/imx27-apf27dev.dts
index 849306cb4532dbdeb5302ee1c66256247eda645f..dba97912cfd75964ee4a2966fae897e7f0b037e7 100644
--- a/arch/arm/boot/dts/nxp/imx/imx27-apf27dev.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx27-apf27dev.dts
@@ -122,116 +122,114 @@ &i2c2 {
 };
 
 &iomuxc {
-	imx27-apf27dev {
-		pinctrl_cspi1: cspi1grp {
-			fsl,pins = <
-				MX27_PAD_CSPI1_MISO__CSPI1_MISO 0x0
-				MX27_PAD_CSPI1_MOSI__CSPI1_MOSI 0x0
-				MX27_PAD_CSPI1_SCLK__CSPI1_SCLK 0x0
-			>;
-		};
+	pinctrl_cspi1: cspi1grp {
+		fsl,pins = <
+			MX27_PAD_CSPI1_MISO__CSPI1_MISO 0x0
+			MX27_PAD_CSPI1_MOSI__CSPI1_MOSI 0x0
+			MX27_PAD_CSPI1_SCLK__CSPI1_SCLK 0x0
+		>;
+	};
 
-		pinctrl_cspi1_cs: cspi1csgrp {
-			fsl,pins = <MX27_PAD_CSPI1_SS0__GPIO4_28 0x0>;
-		};
+	pinctrl_cspi1_cs: cspi1csgrp {
+		fsl,pins = <MX27_PAD_CSPI1_SS0__GPIO4_28 0x0>;
+	};
 
-		pinctrl_cspi2: cspi2grp {
-			fsl,pins = <
-				MX27_PAD_CSPI2_MISO__CSPI2_MISO 0x0
-				MX27_PAD_CSPI2_MOSI__CSPI2_MOSI 0x0
-				MX27_PAD_CSPI2_SCLK__CSPI2_SCLK 0x0
-			>;
-		};
+	pinctrl_cspi2: cspi2grp {
+		fsl,pins = <
+			MX27_PAD_CSPI2_MISO__CSPI2_MISO 0x0
+			MX27_PAD_CSPI2_MOSI__CSPI2_MOSI 0x0
+			MX27_PAD_CSPI2_SCLK__CSPI2_SCLK 0x0
+		>;
+	};
 
-		pinctrl_cspi2_cs: cspi2csgrp {
-			fsl,pins = <
-				MX27_PAD_CSI_D5__GPIO2_17 0x0
-				MX27_PAD_CSPI2_SS0__GPIO4_21 0x0
-				MX27_PAD_CSPI1_SS1__GPIO4_27 0x0
-			>;
-		};
+	pinctrl_cspi2_cs: cspi2csgrp {
+		fsl,pins = <
+			MX27_PAD_CSI_D5__GPIO2_17 0x0
+			MX27_PAD_CSPI2_SS0__GPIO4_21 0x0
+			MX27_PAD_CSPI1_SS1__GPIO4_27 0x0
+		>;
+	};
 
-		pinctrl_gpio_leds: gpioledsgrp {
-			fsl,pins = <MX27_PAD_PC_VS1__GPIO6_14 0x0>;
-		};
+	pinctrl_gpio_leds: gpioledsgrp {
+		fsl,pins = <MX27_PAD_PC_VS1__GPIO6_14 0x0>;
+	};
 
-		pinctrl_gpio_keys: gpiokeysgrp {
-			fsl,pins = <MX27_PAD_PC_VS2__GPIO6_13 0x0>;
-		};
+	pinctrl_gpio_keys: gpiokeysgrp {
+		fsl,pins = <MX27_PAD_PC_VS2__GPIO6_13 0x0>;
+	};
 
-		pinctrl_imxfb1: imxfbgrp {
-			fsl,pins = <
-				MX27_PAD_CLS__CLS 0x0
-				MX27_PAD_CONTRAST__CONTRAST 0x0
-				MX27_PAD_LD0__LD0 0x0
-				MX27_PAD_LD1__LD1 0x0
-				MX27_PAD_LD2__LD2 0x0
-				MX27_PAD_LD3__LD3 0x0
-				MX27_PAD_LD4__LD4 0x0
-				MX27_PAD_LD5__LD5 0x0
-				MX27_PAD_LD6__LD6 0x0
-				MX27_PAD_LD7__LD7 0x0
-				MX27_PAD_LD8__LD8 0x0
-				MX27_PAD_LD9__LD9 0x0
-				MX27_PAD_LD10__LD10 0x0
-				MX27_PAD_LD11__LD11 0x0
-				MX27_PAD_LD12__LD12 0x0
-				MX27_PAD_LD13__LD13 0x0
-				MX27_PAD_LD14__LD14 0x0
-				MX27_PAD_LD15__LD15 0x0
-				MX27_PAD_LD16__LD16 0x0
-				MX27_PAD_LD17__LD17 0x0
-				MX27_PAD_LSCLK__LSCLK 0x0
-				MX27_PAD_OE_ACD__OE_ACD 0x0
-				MX27_PAD_PS__PS 0x0
-				MX27_PAD_REV__REV 0x0
-				MX27_PAD_SPL_SPR__SPL_SPR 0x0
-				MX27_PAD_HSYNC__HSYNC 0x0
-				MX27_PAD_VSYNC__VSYNC 0x0
-			>;
-		};
+	pinctrl_imxfb1: imxfbgrp {
+		fsl,pins = <
+			MX27_PAD_CLS__CLS 0x0
+			MX27_PAD_CONTRAST__CONTRAST 0x0
+			MX27_PAD_LD0__LD0 0x0
+			MX27_PAD_LD1__LD1 0x0
+			MX27_PAD_LD2__LD2 0x0
+			MX27_PAD_LD3__LD3 0x0
+			MX27_PAD_LD4__LD4 0x0
+			MX27_PAD_LD5__LD5 0x0
+			MX27_PAD_LD6__LD6 0x0
+			MX27_PAD_LD7__LD7 0x0
+			MX27_PAD_LD8__LD8 0x0
+			MX27_PAD_LD9__LD9 0x0
+			MX27_PAD_LD10__LD10 0x0
+			MX27_PAD_LD11__LD11 0x0
+			MX27_PAD_LD12__LD12 0x0
+			MX27_PAD_LD13__LD13 0x0
+			MX27_PAD_LD14__LD14 0x0
+			MX27_PAD_LD15__LD15 0x0
+			MX27_PAD_LD16__LD16 0x0
+			MX27_PAD_LD17__LD17 0x0
+			MX27_PAD_LSCLK__LSCLK 0x0
+			MX27_PAD_OE_ACD__OE_ACD 0x0
+			MX27_PAD_PS__PS 0x0
+			MX27_PAD_REV__REV 0x0
+			MX27_PAD_SPL_SPR__SPL_SPR 0x0
+			MX27_PAD_HSYNC__HSYNC 0x0
+			MX27_PAD_VSYNC__VSYNC 0x0
+		>;
+	};
 
-		pinctrl_i2c1: i2c1grp {
-			fsl,pins = <
-				MX27_PAD_I2C_DATA__I2C_DATA 0x0
-				MX27_PAD_I2C_CLK__I2C_CLK 0x0
-			>;
-		};
+	pinctrl_i2c1: i2c1grp {
+		fsl,pins = <
+			MX27_PAD_I2C_DATA__I2C_DATA 0x0
+			MX27_PAD_I2C_CLK__I2C_CLK 0x0
+		>;
+	};
 
-		pinctrl_i2c2: i2c2grp {
-			fsl,pins = <
-				MX27_PAD_I2C2_SDA__I2C2_SDA 0x0
-				MX27_PAD_I2C2_SCL__I2C2_SCL 0x0
-			>;
-		};
+	pinctrl_i2c2: i2c2grp {
+		fsl,pins = <
+			MX27_PAD_I2C2_SDA__I2C2_SDA 0x0
+			MX27_PAD_I2C2_SCL__I2C2_SCL 0x0
+		>;
+	};
 
-		pinctrl_max1027: max1027 {
-			 fsl,pins = <
-				 MX27_PAD_UART1_CTS__GPIO5_14 0x0 /* CNVST */
-				 MX27_PAD_UART1_RTS__GPIO5_15 0x0 /* EOC */
-			>;
-		};
+	pinctrl_max1027: max1027grp {
+		 fsl,pins = <
+			 MX27_PAD_UART1_CTS__GPIO5_14 0x0 /* CNVST */
+			 MX27_PAD_UART1_RTS__GPIO5_15 0x0 /* EOC */
+		>;
+	};
 
-		pinctrl_pwm: pwmgrp {
-			fsl,pins = <
-				MX27_PAD_PWMO__PWMO 0x0
-			>;
-		};
+	pinctrl_pwm: pwmgrp {
+		fsl,pins = <
+			MX27_PAD_PWMO__PWMO 0x0
+		>;
+	};
 
-		pinctrl_sdhc2: sdhc2grp {
-			fsl,pins = <
-				MX27_PAD_SD2_CLK__SD2_CLK 0x0
-				MX27_PAD_SD2_CMD__SD2_CMD 0x0
-				MX27_PAD_SD2_D0__SD2_D0 0x0
-				MX27_PAD_SD2_D1__SD2_D1 0x0
-				MX27_PAD_SD2_D2__SD2_D2 0x0
-				MX27_PAD_SD2_D3__SD2_D3 0x0
-			>;
-		};
+	pinctrl_sdhc2: sdhc2grp {
+		fsl,pins = <
+			MX27_PAD_SD2_CLK__SD2_CLK 0x0
+			MX27_PAD_SD2_CMD__SD2_CMD 0x0
+			MX27_PAD_SD2_D0__SD2_D0 0x0
+			MX27_PAD_SD2_D1__SD2_D1 0x0
+			MX27_PAD_SD2_D2__SD2_D2 0x0
+			MX27_PAD_SD2_D3__SD2_D3 0x0
+		>;
+	};
 
-		pinctrl_sdhc2_cd: sdhc2cdgrp {
-			fsl,pins = <MX27_PAD_TOUT__GPIO3_14 0x0>;
-		};
+	pinctrl_sdhc2_cd: sdhc2cdgrp {
+		fsl,pins = <MX27_PAD_TOUT__GPIO3_14 0x0>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx27-eukrea-cpuimx27.dtsi b/arch/arm/boot/dts/nxp/imx/imx27-eukrea-cpuimx27.dtsi
index c7e92358487826874e74d819af17764311016d4a..3df70ed6056c4d122c83f9d6dd1ec1af3c64ff0b 100644
--- a/arch/arm/boot/dts/nxp/imx/imx27-eukrea-cpuimx27.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx27-eukrea-cpuimx27.dtsi
@@ -154,131 +154,129 @@ uart8250@3,1000000 {
 };
 
 &iomuxc {
-	imx27-eukrea-cpuimx27 {
-		pinctrl_fec: fecgrp {
-			fsl,pins = <
-				MX27_PAD_SD3_CMD__FEC_TXD0		0x0
-				MX27_PAD_SD3_CLK__FEC_TXD1		0x0
-				MX27_PAD_ATA_DATA0__FEC_TXD2		0x0
-				MX27_PAD_ATA_DATA1__FEC_TXD3		0x0
-				MX27_PAD_ATA_DATA2__FEC_RX_ER		0x0
-				MX27_PAD_ATA_DATA3__FEC_RXD1		0x0
-				MX27_PAD_ATA_DATA4__FEC_RXD2		0x0
-				MX27_PAD_ATA_DATA5__FEC_RXD3		0x0
-				MX27_PAD_ATA_DATA6__FEC_MDIO		0x0
-				MX27_PAD_ATA_DATA7__FEC_MDC		0x0
-				MX27_PAD_ATA_DATA8__FEC_CRS		0x0
-				MX27_PAD_ATA_DATA9__FEC_TX_CLK		0x0
-				MX27_PAD_ATA_DATA10__FEC_RXD0		0x0
-				MX27_PAD_ATA_DATA11__FEC_RX_DV		0x0
-				MX27_PAD_ATA_DATA12__FEC_RX_CLK		0x0
-				MX27_PAD_ATA_DATA13__FEC_COL		0x0
-				MX27_PAD_ATA_DATA14__FEC_TX_ER		0x0
-				MX27_PAD_ATA_DATA15__FEC_TX_EN		0x0
-			>;
-		};
+	pinctrl_fec: fecgrp {
+		fsl,pins = <
+			MX27_PAD_SD3_CMD__FEC_TXD0		0x0
+			MX27_PAD_SD3_CLK__FEC_TXD1		0x0
+			MX27_PAD_ATA_DATA0__FEC_TXD2		0x0
+			MX27_PAD_ATA_DATA1__FEC_TXD3		0x0
+			MX27_PAD_ATA_DATA2__FEC_RX_ER		0x0
+			MX27_PAD_ATA_DATA3__FEC_RXD1		0x0
+			MX27_PAD_ATA_DATA4__FEC_RXD2		0x0
+			MX27_PAD_ATA_DATA5__FEC_RXD3		0x0
+			MX27_PAD_ATA_DATA6__FEC_MDIO		0x0
+			MX27_PAD_ATA_DATA7__FEC_MDC		0x0
+			MX27_PAD_ATA_DATA8__FEC_CRS		0x0
+			MX27_PAD_ATA_DATA9__FEC_TX_CLK		0x0
+			MX27_PAD_ATA_DATA10__FEC_RXD0		0x0
+			MX27_PAD_ATA_DATA11__FEC_RX_DV		0x0
+			MX27_PAD_ATA_DATA12__FEC_RX_CLK		0x0
+			MX27_PAD_ATA_DATA13__FEC_COL		0x0
+			MX27_PAD_ATA_DATA14__FEC_TX_ER		0x0
+			MX27_PAD_ATA_DATA15__FEC_TX_EN		0x0
+		>;
+	};
 
-		pinctrl_i2c1: i2c1grp {
-			fsl,pins = <
-				MX27_PAD_I2C_DATA__I2C_DATA		0x0
-				MX27_PAD_I2C_CLK__I2C_CLK		0x0
-			>;
-		};
+	pinctrl_i2c1: i2c1grp {
+		fsl,pins = <
+			MX27_PAD_I2C_DATA__I2C_DATA		0x0
+			MX27_PAD_I2C_CLK__I2C_CLK		0x0
+		>;
+	};
 
-		pinctrl_nfc: nfcgrp {
-			fsl,pins = <
-				MX27_PAD_NFRB__NFRB			0x0
-				MX27_PAD_NFCLE__NFCLE			0x0
-				MX27_PAD_NFWP_B__NFWP_B			0x0
-				MX27_PAD_NFCE_B__NFCE_B			0x0
-				MX27_PAD_NFALE__NFALE			0x0
-				MX27_PAD_NFRE_B__NFRE_B			0x0
-				MX27_PAD_NFWE_B__NFWE_B			0x0
-			>;
-		};
+	pinctrl_nfc: nfcgrp {
+		fsl,pins = <
+			MX27_PAD_NFRB__NFRB			0x0
+			MX27_PAD_NFCLE__NFCLE			0x0
+			MX27_PAD_NFWP_B__NFWP_B			0x0
+			MX27_PAD_NFCE_B__NFCE_B			0x0
+			MX27_PAD_NFALE__NFALE			0x0
+			MX27_PAD_NFRE_B__NFRE_B			0x0
+			MX27_PAD_NFWE_B__NFWE_B			0x0
+		>;
+	};
 
-		pinctrl_owire: owiregrp {
-			fsl,pins = <
-				MX27_PAD_RTCK__OWIRE			0x0
-			>;
-		};
+	pinctrl_owire: owiregrp {
+		fsl,pins = <
+			MX27_PAD_RTCK__OWIRE			0x0
+		>;
+	};
 
-		pinctrl_sdhc2: sdhc2grp {
-			fsl,pins = <
-				MX27_PAD_SD2_CLK__SD2_CLK		0x0
-				MX27_PAD_SD2_CMD__SD2_CMD		0x0
-				MX27_PAD_SD2_D0__SD2_D0			0x0
-				MX27_PAD_SD2_D1__SD2_D1			0x0
-				MX27_PAD_SD2_D2__SD2_D2			0x0
-				MX27_PAD_SD2_D3__SD2_D3			0x0
-			>;
-		};
+	pinctrl_sdhc2: sdhc2grp {
+		fsl,pins = <
+			MX27_PAD_SD2_CLK__SD2_CLK		0x0
+			MX27_PAD_SD2_CMD__SD2_CMD		0x0
+			MX27_PAD_SD2_D0__SD2_D0			0x0
+			MX27_PAD_SD2_D1__SD2_D1			0x0
+			MX27_PAD_SD2_D2__SD2_D2			0x0
+			MX27_PAD_SD2_D3__SD2_D3			0x0
+		>;
+	};
 
-		pinctrl_uart4: uart4grp {
-			fsl,pins = <
-				MX27_PAD_USBH1_TXDM__UART4_TXD		0x0
-				MX27_PAD_USBH1_RXDP__UART4_RXD		0x0
-				MX27_PAD_USBH1_TXDP__UART4_CTS		0x0
-				MX27_PAD_USBH1_FS__UART4_RTS		0x0
-			>;
-		};
+	pinctrl_uart4: uart4grp {
+		fsl,pins = <
+			MX27_PAD_USBH1_TXDM__UART4_TXD		0x0
+			MX27_PAD_USBH1_RXDP__UART4_RXD		0x0
+			MX27_PAD_USBH1_TXDP__UART4_CTS		0x0
+			MX27_PAD_USBH1_FS__UART4_RTS		0x0
+		>;
+	};
 
-		pinctrl_uart8250_1: uart82501grp {
-			fsl,pins = <
-				MX27_PAD_USB_PWR__GPIO2_23		0x0
-			>;
-		};
+	pinctrl_uart8250_1: uart82501grp {
+		fsl,pins = <
+			MX27_PAD_USB_PWR__GPIO2_23		0x0
+		>;
+	};
 
-		pinctrl_uart8250_2: uart82502grp {
-			fsl,pins = <
-				MX27_PAD_USBH1_SUSP__GPIO2_22		0x0
-			>;
-		};
+	pinctrl_uart8250_2: uart82502grp {
+		fsl,pins = <
+			MX27_PAD_USBH1_SUSP__GPIO2_22		0x0
+		>;
+	};
 
-		pinctrl_uart8250_3: uart82503grp {
-			fsl,pins = <
-				MX27_PAD_USBH1_OE_B__GPIO2_27		0x0
-			>;
-		};
+	pinctrl_uart8250_3: uart82503grp {
+		fsl,pins = <
+			MX27_PAD_USBH1_OE_B__GPIO2_27		0x0
+		>;
+	};
 
-		pinctrl_uart8250_4: uart82504grp {
-			fsl,pins = <
-				MX27_PAD_USBH1_RXDM__GPIO2_30		0x0
-			>;
-		};
+	pinctrl_uart8250_4: uart82504grp {
+		fsl,pins = <
+			MX27_PAD_USBH1_RXDM__GPIO2_30		0x0
+		>;
+	};
 
-		pinctrl_usbh2: usbh2grp {
-			fsl,pins = <
-				MX27_PAD_USBH2_CLK__USBH2_CLK		0x0
-				MX27_PAD_USBH2_DIR__USBH2_DIR		0x0
-				MX27_PAD_USBH2_NXT__USBH2_NXT		0x0
-				MX27_PAD_USBH2_STP__USBH2_STP		0x0
-				MX27_PAD_CSPI2_SCLK__USBH2_DATA0	0x0
-				MX27_PAD_CSPI2_MOSI__USBH2_DATA1	0x0
-				MX27_PAD_CSPI2_MISO__USBH2_DATA2	0x0
-				MX27_PAD_CSPI2_SS1__USBH2_DATA3		0x0
-				MX27_PAD_CSPI2_SS2__USBH2_DATA4		0x0
-				MX27_PAD_CSPI1_SS2__USBH2_DATA5		0x0
-				MX27_PAD_CSPI2_SS0__USBH2_DATA6		0x0
-				MX27_PAD_USBH2_DATA7__USBH2_DATA7	0x0
-			>;
-		};
+	pinctrl_usbh2: usbh2grp {
+		fsl,pins = <
+			MX27_PAD_USBH2_CLK__USBH2_CLK		0x0
+			MX27_PAD_USBH2_DIR__USBH2_DIR		0x0
+			MX27_PAD_USBH2_NXT__USBH2_NXT		0x0
+			MX27_PAD_USBH2_STP__USBH2_STP		0x0
+			MX27_PAD_CSPI2_SCLK__USBH2_DATA0	0x0
+			MX27_PAD_CSPI2_MOSI__USBH2_DATA1	0x0
+			MX27_PAD_CSPI2_MISO__USBH2_DATA2	0x0
+			MX27_PAD_CSPI2_SS1__USBH2_DATA3		0x0
+			MX27_PAD_CSPI2_SS2__USBH2_DATA4		0x0
+			MX27_PAD_CSPI1_SS2__USBH2_DATA5		0x0
+			MX27_PAD_CSPI2_SS0__USBH2_DATA6		0x0
+			MX27_PAD_USBH2_DATA7__USBH2_DATA7	0x0
+		>;
+	};
 
-		pinctrl_usbotg: usbotggrp {
-			fsl,pins = <
-				MX27_PAD_USBOTG_CLK__USBOTG_CLK		0x0
-				MX27_PAD_USBOTG_DIR__USBOTG_DIR		0x0
-				MX27_PAD_USBOTG_NXT__USBOTG_NXT		0x0
-				MX27_PAD_USBOTG_STP__USBOTG_STP		0x0
-				MX27_PAD_USBOTG_DATA0__USBOTG_DATA0	0x0
-				MX27_PAD_USBOTG_DATA1__USBOTG_DATA1	0x0
-				MX27_PAD_USBOTG_DATA2__USBOTG_DATA2	0x0
-				MX27_PAD_USBOTG_DATA3__USBOTG_DATA3	0x0
-				MX27_PAD_USBOTG_DATA4__USBOTG_DATA4	0x0
-				MX27_PAD_USBOTG_DATA5__USBOTG_DATA5	0x0
-				MX27_PAD_USBOTG_DATA6__USBOTG_DATA6	0x0
-				MX27_PAD_USBOTG_DATA7__USBOTG_DATA7	0x0
-			>;
-		};
+	pinctrl_usbotg: usbotggrp {
+		fsl,pins = <
+			MX27_PAD_USBOTG_CLK__USBOTG_CLK		0x0
+			MX27_PAD_USBOTG_DIR__USBOTG_DIR		0x0
+			MX27_PAD_USBOTG_NXT__USBOTG_NXT		0x0
+			MX27_PAD_USBOTG_STP__USBOTG_STP		0x0
+			MX27_PAD_USBOTG_DATA0__USBOTG_DATA0	0x0
+			MX27_PAD_USBOTG_DATA1__USBOTG_DATA1	0x0
+			MX27_PAD_USBOTG_DATA2__USBOTG_DATA2	0x0
+			MX27_PAD_USBOTG_DATA3__USBOTG_DATA3	0x0
+			MX27_PAD_USBOTG_DATA4__USBOTG_DATA4	0x0
+			MX27_PAD_USBOTG_DATA5__USBOTG_DATA5	0x0
+			MX27_PAD_USBOTG_DATA6__USBOTG_DATA6	0x0
+			MX27_PAD_USBOTG_DATA7__USBOTG_DATA7	0x0
+		>;
 	};
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx27-eukrea-mbimxsd27-baseboard.dts b/arch/arm/boot/dts/nxp/imx/imx27-eukrea-mbimxsd27-baseboard.dts
index d78793601306cff9f353fa8814a645e5305dd4c4..1c834f2f5068d16174c086c1fe540ff371444675 100644
--- a/arch/arm/boot/dts/nxp/imx/imx27-eukrea-mbimxsd27-baseboard.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx27-eukrea-mbimxsd27-baseboard.dts
@@ -147,113 +147,111 @@ &uart3 {
 };
 
 &iomuxc {
-	imx27-eukrea-cpuimx27-baseboard {
-		pinctrl_cspi1: cspi1grp {
-			fsl,pins = <
-				MX27_PAD_CSPI1_MISO__CSPI1_MISO	0x0
-				MX27_PAD_CSPI1_MOSI__CSPI1_MOSI	0x0
-				MX27_PAD_CSPI1_SCLK__CSPI1_SCLK	0x0
-				MX27_PAD_CSPI1_SS0__GPIO4_28	0x0 /* CS0 */
-			>;
-		};
+	pinctrl_cspi1: cspi1grp {
+		fsl,pins = <
+			MX27_PAD_CSPI1_MISO__CSPI1_MISO	0x0
+			MX27_PAD_CSPI1_MOSI__CSPI1_MOSI	0x0
+			MX27_PAD_CSPI1_SCLK__CSPI1_SCLK	0x0
+			MX27_PAD_CSPI1_SS0__GPIO4_28	0x0 /* CS0 */
+		>;
+	};
 
-		pinctrl_backlight: backlightgrp {
-			fsl,pins = <
-				MX27_PAD_PWMO__GPIO5_5		0x0
-			>;
-		};
+	pinctrl_backlight: backlightgrp {
+		fsl,pins = <
+			MX27_PAD_PWMO__GPIO5_5		0x0
+		>;
+	};
 
-		pinctrl_gpioleds: gpioledsgrp {
-			fsl,pins = <
-				MX27_PAD_PC_PWRON__GPIO6_16	0x0
-				MX27_PAD_PC_CD2_B__GPIO6_19	0x0
-			>;
-		};
+	pinctrl_gpioleds: gpioledsgrp {
+		fsl,pins = <
+			MX27_PAD_PC_PWRON__GPIO6_16	0x0
+			MX27_PAD_PC_CD2_B__GPIO6_19	0x0
+		>;
+	};
 
-		pinctrl_imxfb: imxfbgrp {
-			fsl,pins = <
-				MX27_PAD_LD0__LD0		0x0
-				MX27_PAD_LD1__LD1		0x0
-				MX27_PAD_LD2__LD2		0x0
-				MX27_PAD_LD3__LD3		0x0
-				MX27_PAD_LD4__LD4		0x0
-				MX27_PAD_LD5__LD5		0x0
-				MX27_PAD_LD6__LD6		0x0
-				MX27_PAD_LD7__LD7		0x0
-				MX27_PAD_LD8__LD8		0x0
-				MX27_PAD_LD9__LD9		0x0
-				MX27_PAD_LD10__LD10		0x0
-				MX27_PAD_LD11__LD11		0x0
-				MX27_PAD_LD12__LD12		0x0
-				MX27_PAD_LD13__LD13		0x0
-				MX27_PAD_LD14__LD14		0x0
-				MX27_PAD_LD15__LD15		0x0
-				MX27_PAD_LD16__LD16		0x0
-				MX27_PAD_LD17__LD17		0x0
-				MX27_PAD_CONTRAST__CONTRAST	0x0
-				MX27_PAD_OE_ACD__OE_ACD		0x0
-				MX27_PAD_HSYNC__HSYNC		0x0
-				MX27_PAD_VSYNC__VSYNC		0x0
-			>;
-		};
+	pinctrl_imxfb: imxfbgrp {
+		fsl,pins = <
+			MX27_PAD_LD0__LD0		0x0
+			MX27_PAD_LD1__LD1		0x0
+			MX27_PAD_LD2__LD2		0x0
+			MX27_PAD_LD3__LD3		0x0
+			MX27_PAD_LD4__LD4		0x0
+			MX27_PAD_LD5__LD5		0x0
+			MX27_PAD_LD6__LD6		0x0
+			MX27_PAD_LD7__LD7		0x0
+			MX27_PAD_LD8__LD8		0x0
+			MX27_PAD_LD9__LD9		0x0
+			MX27_PAD_LD10__LD10		0x0
+			MX27_PAD_LD11__LD11		0x0
+			MX27_PAD_LD12__LD12		0x0
+			MX27_PAD_LD13__LD13		0x0
+			MX27_PAD_LD14__LD14		0x0
+			MX27_PAD_LD15__LD15		0x0
+			MX27_PAD_LD16__LD16		0x0
+			MX27_PAD_LD17__LD17		0x0
+			MX27_PAD_CONTRAST__CONTRAST	0x0
+			MX27_PAD_OE_ACD__OE_ACD		0x0
+			MX27_PAD_HSYNC__HSYNC		0x0
+			MX27_PAD_VSYNC__VSYNC		0x0
+		>;
+	};
 
-		pinctrl_lcdreg: lcdreggrp {
-			fsl,pins = <
-				MX27_PAD_CLS__GPIO1_25		0x0
-			>;
-		};
+	pinctrl_lcdreg: lcdreggrp {
+		fsl,pins = <
+			MX27_PAD_CLS__GPIO1_25		0x0
+		>;
+	};
 
-		pinctrl_sdhc1: sdhc1grp {
-			fsl,pins = <
-				MX27_PAD_SD1_CLK__SD1_CLK	0x0
-				MX27_PAD_SD1_CMD__SD1_CMD	0x0
-				MX27_PAD_SD1_D0__SD1_D0		0x0
-				MX27_PAD_SD1_D1__SD1_D1		0x0
-				MX27_PAD_SD1_D2__SD1_D2		0x0
-				MX27_PAD_SD1_D3__SD1_D3		0x0
-			>;
-		};
+	pinctrl_sdhc1: sdhc1grp {
+		fsl,pins = <
+			MX27_PAD_SD1_CLK__SD1_CLK	0x0
+			MX27_PAD_SD1_CMD__SD1_CMD	0x0
+			MX27_PAD_SD1_D0__SD1_D0		0x0
+			MX27_PAD_SD1_D1__SD1_D1		0x0
+			MX27_PAD_SD1_D2__SD1_D2		0x0
+			MX27_PAD_SD1_D3__SD1_D3		0x0
+		>;
+	};
 
-		pinctrl_ssi1: ssi1grp {
-			fsl,pins = <
-				MX27_PAD_SSI4_CLK__SSI4_CLK	0x0
-				MX27_PAD_SSI4_FS__SSI4_FS	0x0
-				MX27_PAD_SSI4_RXDAT__SSI4_RXDAT	0x1
-				MX27_PAD_SSI4_TXDAT__SSI4_TXDAT	0x1
-			>;
-		};
+	pinctrl_ssi1: ssi1grp {
+		fsl,pins = <
+			MX27_PAD_SSI4_CLK__SSI4_CLK	0x0
+			MX27_PAD_SSI4_FS__SSI4_FS	0x0
+			MX27_PAD_SSI4_RXDAT__SSI4_RXDAT	0x1
+			MX27_PAD_SSI4_TXDAT__SSI4_TXDAT	0x1
+		>;
+	};
 
-		pinctrl_touch: touchgrp {
-			fsl,pins = <
-				MX27_PAD_CSPI1_RDY__GPIO4_25	0x0 /* IRQ */
-			>;
-		};
+	pinctrl_touch: touchgrp {
+		fsl,pins = <
+			MX27_PAD_CSPI1_RDY__GPIO4_25	0x0 /* IRQ */
+		>;
+	};
 
-		pinctrl_uart1: uart1grp {
-			fsl,pins = <
-				MX27_PAD_UART1_TXD__UART1_TXD	0x0
-				MX27_PAD_UART1_RXD__UART1_RXD	0x0
-				MX27_PAD_UART1_CTS__UART1_CTS	0x0
-				MX27_PAD_UART1_RTS__UART1_RTS	0x0
-			>;
-		};
+	pinctrl_uart1: uart1grp {
+		fsl,pins = <
+			MX27_PAD_UART1_TXD__UART1_TXD	0x0
+			MX27_PAD_UART1_RXD__UART1_RXD	0x0
+			MX27_PAD_UART1_CTS__UART1_CTS	0x0
+			MX27_PAD_UART1_RTS__UART1_RTS	0x0
+		>;
+	};
 
-		pinctrl_uart2: uart2grp {
-			fsl,pins = <
-				MX27_PAD_UART2_TXD__UART2_TXD	0x0
-				MX27_PAD_UART2_RXD__UART2_RXD	0x0
-				MX27_PAD_UART2_CTS__UART2_CTS	0x0
-				MX27_PAD_UART2_RTS__UART2_RTS	0x0
-			>;
-		};
+	pinctrl_uart2: uart2grp {
+		fsl,pins = <
+			MX27_PAD_UART2_TXD__UART2_TXD	0x0
+			MX27_PAD_UART2_RXD__UART2_RXD	0x0
+			MX27_PAD_UART2_CTS__UART2_CTS	0x0
+			MX27_PAD_UART2_RTS__UART2_RTS	0x0
+		>;
+	};
 
-		pinctrl_uart3: uart3grp {
-			fsl,pins = <
-				MX27_PAD_UART3_TXD__UART3_TXD	0x0
-				MX27_PAD_UART3_RXD__UART3_RXD	0x0
-				MX27_PAD_UART3_CTS__UART3_CTS	0x0
-				MX27_PAD_UART3_RTS__UART3_RTS	0x0
-			>;
-		};
+	pinctrl_uart3: uart3grp {
+		fsl,pins = <
+			MX27_PAD_UART3_TXD__UART3_TXD	0x0
+			MX27_PAD_UART3_RXD__UART3_RXD	0x0
+			MX27_PAD_UART3_CTS__UART3_CTS	0x0
+			MX27_PAD_UART3_RTS__UART3_RTS	0x0
+		>;
 	};
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx27-pdk.dts b/arch/arm/boot/dts/nxp/imx/imx27-pdk.dts
index 21d436972aa47c57f50db2636b23b45b41c02f05..2fc4ea5b9501f4765624b42f8badf013fbcdad6f 100644
--- a/arch/arm/boot/dts/nxp/imx/imx27-pdk.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx27-pdk.dts
@@ -110,76 +110,74 @@ &usbotg {
 };
 
 &iomuxc {
-	imx27-pdk {
-		pinctrl_cspi2: cspi2grp {
-			fsl,pins = <
-				MX27_PAD_CSPI2_MISO__CSPI2_MISO 0x0
-				MX27_PAD_CSPI2_MOSI__CSPI2_MOSI 0x0
-				MX27_PAD_CSPI2_SCLK__CSPI2_SCLK 0x0
-				MX27_PAD_CSPI2_SS0__GPIO4_21	0x0 /* SPI2 CS0 */
-				MX27_PAD_TOUT__GPIO3_14		0x0 /* PMIC IRQ */
-			>;
-		};
+	pinctrl_cspi2: cspi2grp {
+		fsl,pins = <
+			MX27_PAD_CSPI2_MISO__CSPI2_MISO 0x0
+			MX27_PAD_CSPI2_MOSI__CSPI2_MOSI 0x0
+			MX27_PAD_CSPI2_SCLK__CSPI2_SCLK 0x0
+			MX27_PAD_CSPI2_SS0__GPIO4_21	0x0 /* SPI2 CS0 */
+			MX27_PAD_TOUT__GPIO3_14		0x0 /* PMIC IRQ */
+		>;
+	};
 
-		pinctrl_fec: fecgrp {
-			fsl,pins = <
-				MX27_PAD_SD3_CMD__FEC_TXD0 0x0
-				MX27_PAD_SD3_CLK__FEC_TXD1 0x0
-				MX27_PAD_ATA_DATA0__FEC_TXD2 0x0
-				MX27_PAD_ATA_DATA1__FEC_TXD3 0x0
-				MX27_PAD_ATA_DATA2__FEC_RX_ER 0x0
-				MX27_PAD_ATA_DATA3__FEC_RXD1 0x0
-				MX27_PAD_ATA_DATA4__FEC_RXD2 0x0
-				MX27_PAD_ATA_DATA5__FEC_RXD3 0x0
-				MX27_PAD_ATA_DATA6__FEC_MDIO 0x0
-				MX27_PAD_ATA_DATA7__FEC_MDC 0x0
-				MX27_PAD_ATA_DATA8__FEC_CRS 0x0
-				MX27_PAD_ATA_DATA9__FEC_TX_CLK 0x0
-				MX27_PAD_ATA_DATA10__FEC_RXD0 0x0
-				MX27_PAD_ATA_DATA11__FEC_RX_DV 0x0
-				MX27_PAD_ATA_DATA12__FEC_RX_CLK 0x0
-				MX27_PAD_ATA_DATA13__FEC_COL 0x0
-				MX27_PAD_ATA_DATA14__FEC_TX_ER 0x0
-				MX27_PAD_ATA_DATA15__FEC_TX_EN 0x0
-			>;
-		};
+	pinctrl_fec: fecgrp {
+		fsl,pins = <
+			MX27_PAD_SD3_CMD__FEC_TXD0 0x0
+			MX27_PAD_SD3_CLK__FEC_TXD1 0x0
+			MX27_PAD_ATA_DATA0__FEC_TXD2 0x0
+			MX27_PAD_ATA_DATA1__FEC_TXD3 0x0
+			MX27_PAD_ATA_DATA2__FEC_RX_ER 0x0
+			MX27_PAD_ATA_DATA3__FEC_RXD1 0x0
+			MX27_PAD_ATA_DATA4__FEC_RXD2 0x0
+			MX27_PAD_ATA_DATA5__FEC_RXD3 0x0
+			MX27_PAD_ATA_DATA6__FEC_MDIO 0x0
+			MX27_PAD_ATA_DATA7__FEC_MDC 0x0
+			MX27_PAD_ATA_DATA8__FEC_CRS 0x0
+			MX27_PAD_ATA_DATA9__FEC_TX_CLK 0x0
+			MX27_PAD_ATA_DATA10__FEC_RXD0 0x0
+			MX27_PAD_ATA_DATA11__FEC_RX_DV 0x0
+			MX27_PAD_ATA_DATA12__FEC_RX_CLK 0x0
+			MX27_PAD_ATA_DATA13__FEC_COL 0x0
+			MX27_PAD_ATA_DATA14__FEC_TX_ER 0x0
+			MX27_PAD_ATA_DATA15__FEC_TX_EN 0x0
+		>;
+	};
 
-		pinctrl_nand: nandgrp {
-			fsl,pins = <
-				MX27_PAD_NFRB__NFRB	0x0
-				MX27_PAD_NFCLE__NFCLE	0x0
-				MX27_PAD_NFWP_B__NFWP_B	0x0
-				MX27_PAD_NFCE_B__NFCE_B	0x0
-				MX27_PAD_NFALE__NFALE	0x0
-				MX27_PAD_NFRE_B__NFRE_B	0x0
-				MX27_PAD_NFWE_B__NFWE_B	0x0
-			>;
-		};
+	pinctrl_nand: nandgrp {
+		fsl,pins = <
+			MX27_PAD_NFRB__NFRB	0x0
+			MX27_PAD_NFCLE__NFCLE	0x0
+			MX27_PAD_NFWP_B__NFWP_B	0x0
+			MX27_PAD_NFCE_B__NFCE_B	0x0
+			MX27_PAD_NFALE__NFALE	0x0
+			MX27_PAD_NFRE_B__NFRE_B	0x0
+			MX27_PAD_NFWE_B__NFWE_B	0x0
+		>;
+	};
 
-		pinctrl_uart1: uart1grp {
-			fsl,pins = <
-				MX27_PAD_UART1_TXD__UART1_TXD 0x0
-				MX27_PAD_UART1_RXD__UART1_RXD 0x0
-				MX27_PAD_UART1_CTS__UART1_CTS 0x0
-				MX27_PAD_UART1_RTS__UART1_RTS 0x0
-			>;
-		};
+	pinctrl_uart1: uart1grp {
+		fsl,pins = <
+			MX27_PAD_UART1_TXD__UART1_TXD 0x0
+			MX27_PAD_UART1_RXD__UART1_RXD 0x0
+			MX27_PAD_UART1_CTS__UART1_CTS 0x0
+			MX27_PAD_UART1_RTS__UART1_RTS 0x0
+		>;
+	};
 
-		pinctrl_usbotg: usbotggrp {
-			fsl,pins = <
-				MX27_PAD_USBOTG_NXT__USBOTG_NXT 0x0
-				MX27_PAD_USBOTG_STP__USBOTG_STP 0x0
-				MX27_PAD_USBOTG_DIR__USBOTG_DIR 0x0
-				MX27_PAD_USBOTG_CLK__USBOTG_CLK 0x0
-				MX27_PAD_USBOTG_DATA0__USBOTG_DATA0 0x0
-				MX27_PAD_USBOTG_DATA1__USBOTG_DATA1 0x0
-				MX27_PAD_USBOTG_DATA2__USBOTG_DATA2 0x0
-				MX27_PAD_USBOTG_DATA3__USBOTG_DATA3 0x0
-				MX27_PAD_USBOTG_DATA4__USBOTG_DATA4 0x0
-				MX27_PAD_USBOTG_DATA5__USBOTG_DATA5 0x0
-				MX27_PAD_USBOTG_DATA6__USBOTG_DATA6 0x0
-				MX27_PAD_USBOTG_DATA7__USBOTG_DATA7 0x0
-			>;
-		};
+	pinctrl_usbotg: usbotggrp {
+		fsl,pins = <
+			MX27_PAD_USBOTG_NXT__USBOTG_NXT 0x0
+			MX27_PAD_USBOTG_STP__USBOTG_STP 0x0
+			MX27_PAD_USBOTG_DIR__USBOTG_DIR 0x0
+			MX27_PAD_USBOTG_CLK__USBOTG_CLK 0x0
+			MX27_PAD_USBOTG_DATA0__USBOTG_DATA0 0x0
+			MX27_PAD_USBOTG_DATA1__USBOTG_DATA1 0x0
+			MX27_PAD_USBOTG_DATA2__USBOTG_DATA2 0x0
+			MX27_PAD_USBOTG_DATA3__USBOTG_DATA3 0x0
+			MX27_PAD_USBOTG_DATA4__USBOTG_DATA4 0x0
+			MX27_PAD_USBOTG_DATA5__USBOTG_DATA5 0x0
+			MX27_PAD_USBOTG_DATA6__USBOTG_DATA6 0x0
+			MX27_PAD_USBOTG_DATA7__USBOTG_DATA7 0x0
+		>;
 	};
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx27-phytec-phycard-s-rdk.dts b/arch/arm/boot/dts/nxp/imx/imx27-phytec-phycard-s-rdk.dts
index 27c93b9fe0499fc9438b713086391adf375c04dc..2b884cb3e38184d4524a95419a2bb8d36739dc0e 100644
--- a/arch/arm/boot/dts/nxp/imx/imx27-phytec-phycard-s-rdk.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx27-phytec-phycard-s-rdk.dts
@@ -65,58 +65,56 @@ adc@64 {
 };
 
 &iomuxc {
-	imx27-phycard-s-rdk {
-		pinctrl_i2c1: i2c1grp {
-			fsl,pins = <
-				MX27_PAD_I2C_DATA__I2C_DATA 0x0
-				MX27_PAD_I2C_CLK__I2C_CLK 0x0
-			>;
-		};
+	pinctrl_i2c1: i2c1grp {
+		fsl,pins = <
+			MX27_PAD_I2C_DATA__I2C_DATA 0x0
+			MX27_PAD_I2C_CLK__I2C_CLK 0x0
+		>;
+	};
 
-		pinctrl_owire1: owire1grp {
-			fsl,pins = <
-				MX27_PAD_RTCK__OWIRE 0x0
-			>;
-		};
+	pinctrl_owire1: owire1grp {
+		fsl,pins = <
+			MX27_PAD_RTCK__OWIRE 0x0
+		>;
+	};
 
-		pinctrl_sdhc2: sdhc2grp {
-			fsl,pins = <
-				MX27_PAD_SD2_CLK__SD2_CLK 0x0
-				MX27_PAD_SD2_CMD__SD2_CMD 0x0
-				MX27_PAD_SD2_D0__SD2_D0 0x0
-				MX27_PAD_SD2_D1__SD2_D1 0x0
-				MX27_PAD_SD2_D2__SD2_D2 0x0
-				MX27_PAD_SD2_D3__SD2_D3 0x0
-				MX27_PAD_SSI3_RXDAT__GPIO3_29 0x0 /* CD */
-			>;
-		};
+	pinctrl_sdhc2: sdhc2grp {
+		fsl,pins = <
+			MX27_PAD_SD2_CLK__SD2_CLK 0x0
+			MX27_PAD_SD2_CMD__SD2_CMD 0x0
+			MX27_PAD_SD2_D0__SD2_D0 0x0
+			MX27_PAD_SD2_D1__SD2_D1 0x0
+			MX27_PAD_SD2_D2__SD2_D2 0x0
+			MX27_PAD_SD2_D3__SD2_D3 0x0
+			MX27_PAD_SSI3_RXDAT__GPIO3_29 0x0 /* CD */
+		>;
+	};
 
-		pinctrl_uart1: uart1grp {
-			fsl,pins = <
-				MX27_PAD_UART1_TXD__UART1_TXD 0x0
-				MX27_PAD_UART1_RXD__UART1_RXD 0x0
-				MX27_PAD_UART1_CTS__UART1_CTS 0x0
-				MX27_PAD_UART1_RTS__UART1_RTS 0x0
-			>;
-		};
+	pinctrl_uart1: uart1grp {
+		fsl,pins = <
+			MX27_PAD_UART1_TXD__UART1_TXD 0x0
+			MX27_PAD_UART1_RXD__UART1_RXD 0x0
+			MX27_PAD_UART1_CTS__UART1_CTS 0x0
+			MX27_PAD_UART1_RTS__UART1_RTS 0x0
+		>;
+	};
 
-		pinctrl_uart2: uart2grp {
-			fsl,pins = <
-				MX27_PAD_UART2_TXD__UART2_TXD 0x0
-				MX27_PAD_UART2_RXD__UART2_RXD 0x0
-				MX27_PAD_UART2_CTS__UART2_CTS 0x0
-				MX27_PAD_UART2_RTS__UART2_RTS 0x0
-			>;
-		};
+	pinctrl_uart2: uart2grp {
+		fsl,pins = <
+			MX27_PAD_UART2_TXD__UART2_TXD 0x0
+			MX27_PAD_UART2_RXD__UART2_RXD 0x0
+			MX27_PAD_UART2_CTS__UART2_CTS 0x0
+			MX27_PAD_UART2_RTS__UART2_RTS 0x0
+		>;
+	};
 
-		pinctrl_uart3: uart3grp {
-			fsl,pins = <
-				MX27_PAD_UART3_TXD__UART3_TXD 0x0
-				MX27_PAD_UART3_RXD__UART3_RXD 0x0
-				MX27_PAD_UART3_CTS__UART3_CTS 0x0
-				MX27_PAD_UART3_RTS__UART3_RTS 0x0
-			>;
-		};
+	pinctrl_uart3: uart3grp {
+		fsl,pins = <
+			MX27_PAD_UART3_TXD__UART3_TXD 0x0
+			MX27_PAD_UART3_RXD__UART3_RXD 0x0
+			MX27_PAD_UART3_CTS__UART3_CTS 0x0
+			MX27_PAD_UART3_RTS__UART3_RTS 0x0
+		>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx27-phytec-phycard-s-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx27-phytec-phycard-s-som.dtsi
index 31b3fc972abbfc585c1c65eb10e006c89561dce2..2f60b3809f39b2f2c92cdb6a61664103380e3478 100644
--- a/arch/arm/boot/dts/nxp/imx/imx27-phytec-phycard-s-som.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx27-phytec-phycard-s-som.dtsi
@@ -58,94 +58,92 @@ eeprom@52 {
 };
 
 &iomuxc {
-	imx27-phycard-s-som {
-		pinctrl_fec1: fec1grp {
-			fsl,pins = <
-				MX27_PAD_SD3_CMD__FEC_TXD0 0x0
-				MX27_PAD_SD3_CLK__FEC_TXD1 0x0
-				MX27_PAD_ATA_DATA0__FEC_TXD2 0x0
-				MX27_PAD_ATA_DATA1__FEC_TXD3 0x0
-				MX27_PAD_ATA_DATA2__FEC_RX_ER 0x0
-				MX27_PAD_ATA_DATA3__FEC_RXD1 0x0
-				MX27_PAD_ATA_DATA4__FEC_RXD2 0x0
-				MX27_PAD_ATA_DATA5__FEC_RXD3 0x0
-				MX27_PAD_ATA_DATA6__FEC_MDIO 0x0
-				MX27_PAD_ATA_DATA7__FEC_MDC 0x0
-				MX27_PAD_ATA_DATA8__FEC_CRS 0x0
-				MX27_PAD_ATA_DATA9__FEC_TX_CLK 0x0
-				MX27_PAD_ATA_DATA10__FEC_RXD0 0x0
-				MX27_PAD_ATA_DATA11__FEC_RX_DV 0x0
-				MX27_PAD_ATA_DATA12__FEC_RX_CLK 0x0
-				MX27_PAD_ATA_DATA13__FEC_COL 0x0
-				MX27_PAD_ATA_DATA14__FEC_TX_ER 0x0
-				MX27_PAD_ATA_DATA15__FEC_TX_EN 0x0
-			>;
-		};
-
-		pinctrl_i2c2: i2c2grp {
-			fsl,pins = <
-				MX27_PAD_I2C2_SDA__I2C2_SDA 0x0
-				MX27_PAD_I2C2_SCL__I2C2_SCL 0x0
-			>;
-		};
-
-		pinctrl_nfc: nfcgrp {
-			fsl,pins = <
-				MX27_PAD_NFRB__NFRB 0x0
-				MX27_PAD_NFCLE__NFCLE 0x0
-				MX27_PAD_NFWP_B__NFWP_B 0x0
-				MX27_PAD_NFCE_B__NFCE_B 0x0
-				MX27_PAD_NFALE__NFALE 0x0
-				MX27_PAD_NFRE_B__NFRE_B 0x0
-				MX27_PAD_NFWE_B__NFWE_B 0x0
-			>;
-		};
-
-		pinctrl_usbotgphy: usbotgphygrp {
-			fsl,pins = <
-				MX27_PAD_USBH1_RCV__GPIO2_25		0x1 /* reset gpio */
-			>;
-		};
-
-		pinctrl_usbotg: usbotggrp {
-			fsl,pins = <
-				MX27_PAD_USBOTG_CLK__USBOTG_CLK		0x0
-				MX27_PAD_USBOTG_DIR__USBOTG_DIR		0x0
-				MX27_PAD_USBOTG_NXT__USBOTG_NXT		0x0
-				MX27_PAD_USBOTG_STP__USBOTG_STP		0x0
-				MX27_PAD_USBOTG_DATA0__USBOTG_DATA0	0x0
-				MX27_PAD_USBOTG_DATA1__USBOTG_DATA1	0x0
-				MX27_PAD_USBOTG_DATA2__USBOTG_DATA2	0x0
-				MX27_PAD_USBOTG_DATA3__USBOTG_DATA3	0x0
-				MX27_PAD_USBOTG_DATA4__USBOTG_DATA4	0x0
-				MX27_PAD_USBOTG_DATA5__USBOTG_DATA5	0x0
-				MX27_PAD_USBOTG_DATA6__USBOTG_DATA6	0x0
-				MX27_PAD_USBOTG_DATA7__USBOTG_DATA7	0x0
-			>;
-		};
-
-		pinctrl_usbh2phy: usbh2phygrp {
-			fsl,pins = <
-				MX27_PAD_USBH1_SUSP__GPIO2_22		0x0 /* reset gpio */
-			>;
-		};
-
-		pinctrl_usbh2: usbh2grp {
-			fsl,pins = <
-				MX27_PAD_USBH2_CLK__USBH2_CLK		0x0
-				MX27_PAD_USBH2_DIR__USBH2_DIR		0x0
-				MX27_PAD_USBH2_NXT__USBH2_NXT		0x0
-				MX27_PAD_USBH2_STP__USBH2_STP		0x0
-				MX27_PAD_CSPI2_SCLK__USBH2_DATA0	0x0
-				MX27_PAD_CSPI2_MOSI__USBH2_DATA1	0x0
-				MX27_PAD_CSPI2_MISO__USBH2_DATA2	0x0
-				MX27_PAD_CSPI2_SS1__USBH2_DATA3		0x0
-				MX27_PAD_CSPI2_SS2__USBH2_DATA4		0x0
-				MX27_PAD_CSPI1_SS2__USBH2_DATA5		0x0
-				MX27_PAD_CSPI2_SS0__USBH2_DATA6		0x0
-				MX27_PAD_USBH2_DATA7__USBH2_DATA7	0x0
-			>;
-		};
+	pinctrl_fec1: fec1grp {
+		fsl,pins = <
+			MX27_PAD_SD3_CMD__FEC_TXD0 0x0
+			MX27_PAD_SD3_CLK__FEC_TXD1 0x0
+			MX27_PAD_ATA_DATA0__FEC_TXD2 0x0
+			MX27_PAD_ATA_DATA1__FEC_TXD3 0x0
+			MX27_PAD_ATA_DATA2__FEC_RX_ER 0x0
+			MX27_PAD_ATA_DATA3__FEC_RXD1 0x0
+			MX27_PAD_ATA_DATA4__FEC_RXD2 0x0
+			MX27_PAD_ATA_DATA5__FEC_RXD3 0x0
+			MX27_PAD_ATA_DATA6__FEC_MDIO 0x0
+			MX27_PAD_ATA_DATA7__FEC_MDC 0x0
+			MX27_PAD_ATA_DATA8__FEC_CRS 0x0
+			MX27_PAD_ATA_DATA9__FEC_TX_CLK 0x0
+			MX27_PAD_ATA_DATA10__FEC_RXD0 0x0
+			MX27_PAD_ATA_DATA11__FEC_RX_DV 0x0
+			MX27_PAD_ATA_DATA12__FEC_RX_CLK 0x0
+			MX27_PAD_ATA_DATA13__FEC_COL 0x0
+			MX27_PAD_ATA_DATA14__FEC_TX_ER 0x0
+			MX27_PAD_ATA_DATA15__FEC_TX_EN 0x0
+		>;
+	};
+
+	pinctrl_i2c2: i2c2grp {
+		fsl,pins = <
+			MX27_PAD_I2C2_SDA__I2C2_SDA 0x0
+			MX27_PAD_I2C2_SCL__I2C2_SCL 0x0
+		>;
+	};
+
+	pinctrl_nfc: nfcgrp {
+		fsl,pins = <
+			MX27_PAD_NFRB__NFRB 0x0
+			MX27_PAD_NFCLE__NFCLE 0x0
+			MX27_PAD_NFWP_B__NFWP_B 0x0
+			MX27_PAD_NFCE_B__NFCE_B 0x0
+			MX27_PAD_NFALE__NFALE 0x0
+			MX27_PAD_NFRE_B__NFRE_B 0x0
+			MX27_PAD_NFWE_B__NFWE_B 0x0
+		>;
+	};
+
+	pinctrl_usbotgphy: usbotgphygrp {
+		fsl,pins = <
+			MX27_PAD_USBH1_RCV__GPIO2_25		0x1 /* reset gpio */
+		>;
+	};
+
+	pinctrl_usbotg: usbotggrp {
+		fsl,pins = <
+			MX27_PAD_USBOTG_CLK__USBOTG_CLK		0x0
+			MX27_PAD_USBOTG_DIR__USBOTG_DIR		0x0
+			MX27_PAD_USBOTG_NXT__USBOTG_NXT		0x0
+			MX27_PAD_USBOTG_STP__USBOTG_STP		0x0
+			MX27_PAD_USBOTG_DATA0__USBOTG_DATA0	0x0
+			MX27_PAD_USBOTG_DATA1__USBOTG_DATA1	0x0
+			MX27_PAD_USBOTG_DATA2__USBOTG_DATA2	0x0
+			MX27_PAD_USBOTG_DATA3__USBOTG_DATA3	0x0
+			MX27_PAD_USBOTG_DATA4__USBOTG_DATA4	0x0
+			MX27_PAD_USBOTG_DATA5__USBOTG_DATA5	0x0
+			MX27_PAD_USBOTG_DATA6__USBOTG_DATA6	0x0
+			MX27_PAD_USBOTG_DATA7__USBOTG_DATA7	0x0
+		>;
+	};
+
+	pinctrl_usbh2phy: usbh2phygrp {
+		fsl,pins = <
+			MX27_PAD_USBH1_SUSP__GPIO2_22		0x0 /* reset gpio */
+		>;
+	};
+
+	pinctrl_usbh2: usbh2grp {
+		fsl,pins = <
+			MX27_PAD_USBH2_CLK__USBH2_CLK		0x0
+			MX27_PAD_USBH2_DIR__USBH2_DIR		0x0
+			MX27_PAD_USBH2_NXT__USBH2_NXT		0x0
+			MX27_PAD_USBH2_STP__USBH2_STP		0x0
+			MX27_PAD_CSPI2_SCLK__USBH2_DATA0	0x0
+			MX27_PAD_CSPI2_MOSI__USBH2_DATA1	0x0
+			MX27_PAD_CSPI2_MISO__USBH2_DATA2	0x0
+			MX27_PAD_CSPI2_SS1__USBH2_DATA3		0x0
+			MX27_PAD_CSPI2_SS2__USBH2_DATA4		0x0
+			MX27_PAD_CSPI1_SS2__USBH2_DATA5		0x0
+			MX27_PAD_CSPI2_SS0__USBH2_DATA6		0x0
+			MX27_PAD_USBH2_DATA7__USBH2_DATA7	0x0
+		>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx27-phytec-phycore-rdk.dts b/arch/arm/boot/dts/nxp/imx/imx27-phytec-phycore-rdk.dts
index 5398e9067e60f98663bec70519d719f859d6e2fa..d7136c399ae29e87a6b13d19ae6d7b9b42a28b48 100644
--- a/arch/arm/boot/dts/nxp/imx/imx27-phytec-phycore-rdk.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx27-phytec-phycore-rdk.dts
@@ -89,119 +89,117 @@ camgpio: pca9536@41 {
 };
 
 &iomuxc {
-	imx27_phycore_rdk {
-		pinctrl_csien: csiengrp {
-			fsl,pins = <
-				MX27_PAD_USB_OC_B__GPIO2_24 0x0
-			>;
-		};
+	pinctrl_csien: csiengrp {
+		fsl,pins = <
+			MX27_PAD_USB_OC_B__GPIO2_24 0x0
+		>;
+	};
 
-		pinctrl_cspi1cs1: cspi1cs1grp {
-			fsl,pins = <
-				MX27_PAD_CSPI1_SS1__GPIO4_27 0x0
-			>;
-		};
+	pinctrl_cspi1cs1: cspi1cs1grp {
+		fsl,pins = <
+			MX27_PAD_CSPI1_SS1__GPIO4_27 0x0
+		>;
+	};
 
-		pinctrl_imxfb1: imxfbgrp {
-			fsl,pins = <
-				MX27_PAD_LD0__LD0 0x0
-				MX27_PAD_LD1__LD1 0x0
-				MX27_PAD_LD2__LD2 0x0
-				MX27_PAD_LD3__LD3 0x0
-				MX27_PAD_LD4__LD4 0x0
-				MX27_PAD_LD5__LD5 0x0
-				MX27_PAD_LD6__LD6 0x0
-				MX27_PAD_LD7__LD7 0x0
-				MX27_PAD_LD8__LD8 0x0
-				MX27_PAD_LD9__LD9 0x0
-				MX27_PAD_LD10__LD10 0x0
-				MX27_PAD_LD11__LD11 0x0
-				MX27_PAD_LD12__LD12 0x0
-				MX27_PAD_LD13__LD13 0x0
-				MX27_PAD_LD14__LD14 0x0
-				MX27_PAD_LD15__LD15 0x0
-				MX27_PAD_LD16__LD16 0x0
-				MX27_PAD_LD17__LD17 0x0
-				MX27_PAD_CLS__CLS 0x0
-				MX27_PAD_CONTRAST__CONTRAST 0x0
-				MX27_PAD_LSCLK__LSCLK 0x0
-				MX27_PAD_OE_ACD__OE_ACD 0x0
-				MX27_PAD_PS__PS 0x0
-				MX27_PAD_REV__REV 0x0
-				MX27_PAD_SPL_SPR__SPL_SPR 0x0
-				MX27_PAD_HSYNC__HSYNC 0x0
-				MX27_PAD_VSYNC__VSYNC 0x0
-			>;
-		};
+	pinctrl_imxfb1: imxfbgrp {
+		fsl,pins = <
+			MX27_PAD_LD0__LD0 0x0
+			MX27_PAD_LD1__LD1 0x0
+			MX27_PAD_LD2__LD2 0x0
+			MX27_PAD_LD3__LD3 0x0
+			MX27_PAD_LD4__LD4 0x0
+			MX27_PAD_LD5__LD5 0x0
+			MX27_PAD_LD6__LD6 0x0
+			MX27_PAD_LD7__LD7 0x0
+			MX27_PAD_LD8__LD8 0x0
+			MX27_PAD_LD9__LD9 0x0
+			MX27_PAD_LD10__LD10 0x0
+			MX27_PAD_LD11__LD11 0x0
+			MX27_PAD_LD12__LD12 0x0
+			MX27_PAD_LD13__LD13 0x0
+			MX27_PAD_LD14__LD14 0x0
+			MX27_PAD_LD15__LD15 0x0
+			MX27_PAD_LD16__LD16 0x0
+			MX27_PAD_LD17__LD17 0x0
+			MX27_PAD_CLS__CLS 0x0
+			MX27_PAD_CONTRAST__CONTRAST 0x0
+			MX27_PAD_LSCLK__LSCLK 0x0
+			MX27_PAD_OE_ACD__OE_ACD 0x0
+			MX27_PAD_PS__PS 0x0
+			MX27_PAD_REV__REV 0x0
+			MX27_PAD_SPL_SPR__SPL_SPR 0x0
+			MX27_PAD_HSYNC__HSYNC 0x0
+			MX27_PAD_VSYNC__VSYNC 0x0
+		>;
+	};
 
-		pinctrl_i2c1: i2c1grp {
-			/* Add pullup to DATA line */
-			fsl,pins = <
-				MX27_PAD_I2C_DATA__I2C_DATA	0x1
-				MX27_PAD_I2C_CLK__I2C_CLK	0x0
-			>;
-		};
+	pinctrl_i2c1: i2c1grp {
+		/* Add pullup to DATA line */
+		fsl,pins = <
+			MX27_PAD_I2C_DATA__I2C_DATA	0x1
+			MX27_PAD_I2C_CLK__I2C_CLK	0x0
+		>;
+	};
 
-		pinctrl_owire1: owire1grp {
-			fsl,pins = <
-				MX27_PAD_RTCK__OWIRE 0x0
-			>;
-		};
+	pinctrl_owire1: owire1grp {
+		fsl,pins = <
+			MX27_PAD_RTCK__OWIRE 0x0
+		>;
+	};
 
-		pinctrl_sdhc2: sdhc2grp {
-			fsl,pins = <
-				MX27_PAD_SD2_CLK__SD2_CLK 0x0
-				MX27_PAD_SD2_CMD__SD2_CMD 0x0
-				MX27_PAD_SD2_D0__SD2_D0 0x0
-				MX27_PAD_SD2_D1__SD2_D1 0x0
-				MX27_PAD_SD2_D2__SD2_D2 0x0
-				MX27_PAD_SD2_D3__SD2_D3 0x0
-				MX27_PAD_SSI3_FS__GPIO3_28	0x0 /* WP */
-				MX27_PAD_SSI3_RXDAT__GPIO3_29	0x0 /* CD */
-			>;
-		};
+	pinctrl_sdhc2: sdhc2grp {
+		fsl,pins = <
+			MX27_PAD_SD2_CLK__SD2_CLK 0x0
+			MX27_PAD_SD2_CMD__SD2_CMD 0x0
+			MX27_PAD_SD2_D0__SD2_D0 0x0
+			MX27_PAD_SD2_D1__SD2_D1 0x0
+			MX27_PAD_SD2_D2__SD2_D2 0x0
+			MX27_PAD_SD2_D3__SD2_D3 0x0
+			MX27_PAD_SSI3_FS__GPIO3_28	0x0 /* WP */
+			MX27_PAD_SSI3_RXDAT__GPIO3_29	0x0 /* CD */
+		>;
+	};
 
-		pinctrl_uart1: uart1grp {
-			fsl,pins = <
-				MX27_PAD_UART1_TXD__UART1_TXD 0x0
-				MX27_PAD_UART1_RXD__UART1_RXD 0x0
-				MX27_PAD_UART1_CTS__UART1_CTS 0x0
-				MX27_PAD_UART1_RTS__UART1_RTS 0x0
-			>;
-		};
+	pinctrl_uart1: uart1grp {
+		fsl,pins = <
+			MX27_PAD_UART1_TXD__UART1_TXD 0x0
+			MX27_PAD_UART1_RXD__UART1_RXD 0x0
+			MX27_PAD_UART1_CTS__UART1_CTS 0x0
+			MX27_PAD_UART1_RTS__UART1_RTS 0x0
+		>;
+	};
 
-		pinctrl_uart2: uart2grp {
-			fsl,pins = <
-				MX27_PAD_UART2_TXD__UART2_TXD 0x0
-				MX27_PAD_UART2_RXD__UART2_RXD 0x0
-				MX27_PAD_UART2_CTS__UART2_CTS 0x0
-				MX27_PAD_UART2_RTS__UART2_RTS 0x0
-			>;
-		};
+	pinctrl_uart2: uart2grp {
+		fsl,pins = <
+			MX27_PAD_UART2_TXD__UART2_TXD 0x0
+			MX27_PAD_UART2_RXD__UART2_RXD 0x0
+			MX27_PAD_UART2_CTS__UART2_CTS 0x0
+			MX27_PAD_UART2_RTS__UART2_RTS 0x0
+		>;
+	};
 
-		pinctrl_usbh2: usbh2grp {
-			fsl,pins = <
-				MX27_PAD_USBH2_CLK__USBH2_CLK 0x0
-				MX27_PAD_USBH2_DIR__USBH2_DIR 0x0
-				MX27_PAD_USBH2_NXT__USBH2_NXT 0x0
-				MX27_PAD_USBH2_STP__USBH2_STP 0x0
-				MX27_PAD_CSPI2_SCLK__USBH2_DATA0 0x0
-				MX27_PAD_CSPI2_MOSI__USBH2_DATA1 0x0
-				MX27_PAD_CSPI2_MISO__USBH2_DATA2 0x0
-				MX27_PAD_CSPI2_SS1__USBH2_DATA3 0x0
-				MX27_PAD_CSPI2_SS2__USBH2_DATA4 0x0
-				MX27_PAD_CSPI1_SS2__USBH2_DATA5 0x0
-				MX27_PAD_CSPI2_SS0__USBH2_DATA6 0x0
-				MX27_PAD_USBH2_DATA7__USBH2_DATA7 0x0
-			>;
-		};
+	pinctrl_usbh2: usbh2grp {
+		fsl,pins = <
+			MX27_PAD_USBH2_CLK__USBH2_CLK 0x0
+			MX27_PAD_USBH2_DIR__USBH2_DIR 0x0
+			MX27_PAD_USBH2_NXT__USBH2_NXT 0x0
+			MX27_PAD_USBH2_STP__USBH2_STP 0x0
+			MX27_PAD_CSPI2_SCLK__USBH2_DATA0 0x0
+			MX27_PAD_CSPI2_MOSI__USBH2_DATA1 0x0
+			MX27_PAD_CSPI2_MISO__USBH2_DATA2 0x0
+			MX27_PAD_CSPI2_SS1__USBH2_DATA3 0x0
+			MX27_PAD_CSPI2_SS2__USBH2_DATA4 0x0
+			MX27_PAD_CSPI1_SS2__USBH2_DATA5 0x0
+			MX27_PAD_CSPI2_SS0__USBH2_DATA6 0x0
+			MX27_PAD_USBH2_DATA7__USBH2_DATA7 0x0
+		>;
+	};
 
-		pinctrl_weim: weimgrp {
-			fsl,pins = <
-				MX27_PAD_CS4_B__CS4_B		0x0 /* CS4 */
-				MX27_PAD_SD1_D1__GPIO5_19	0x0 /* CAN IRQ */
-			>;
-		};
+	pinctrl_weim: weimgrp {
+		fsl,pins = <
+			MX27_PAD_CS4_B__CS4_B		0x0 /* CS4 */
+			MX27_PAD_SD1_D1__GPIO5_19	0x0 /* CAN IRQ */
+		>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx27-phytec-phycore-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx27-phytec-phycore-som.dtsi
index e958d7286ae9d397161b2e7404617bf6f75c0182..7d5d24c781b9834dbf8834c798b923829fd98444 100644
--- a/arch/arm/boot/dts/nxp/imx/imx27-phytec-phycore-som.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx27-phytec-phycore-som.dtsi
@@ -192,90 +192,88 @@ lm75@4a {
 };
 
 &iomuxc {
-	imx27_phycore_som {
-		pinctrl_cspi1: cspi1grp {
-			fsl,pins = <
-				MX27_PAD_CSPI1_MISO__CSPI1_MISO 0x0
-				MX27_PAD_CSPI1_MOSI__CSPI1_MOSI 0x0
-				MX27_PAD_CSPI1_SCLK__CSPI1_SCLK 0x0
-				MX27_PAD_CSPI1_SS0__GPIO4_28	0x0 /* SPI1 CS0 */
-			>;
-		};
+	pinctrl_cspi1: cspi1grp {
+		fsl,pins = <
+			MX27_PAD_CSPI1_MISO__CSPI1_MISO 0x0
+			MX27_PAD_CSPI1_MOSI__CSPI1_MOSI 0x0
+			MX27_PAD_CSPI1_SCLK__CSPI1_SCLK 0x0
+			MX27_PAD_CSPI1_SS0__GPIO4_28	0x0 /* SPI1 CS0 */
+		>;
+	};
 
-		pinctrl_fec1: fec1grp {
-			fsl,pins = <
-				MX27_PAD_SD3_CMD__FEC_TXD0 0x0
-				MX27_PAD_SD3_CLK__FEC_TXD1 0x0
-				MX27_PAD_ATA_DATA0__FEC_TXD2 0x0
-				MX27_PAD_ATA_DATA1__FEC_TXD3 0x0
-				MX27_PAD_ATA_DATA2__FEC_RX_ER 0x0
-				MX27_PAD_ATA_DATA3__FEC_RXD1 0x0
-				MX27_PAD_ATA_DATA4__FEC_RXD2 0x0
-				MX27_PAD_ATA_DATA5__FEC_RXD3 0x0
-				MX27_PAD_ATA_DATA6__FEC_MDIO 0x0
-				MX27_PAD_ATA_DATA7__FEC_MDC 0x0
-				MX27_PAD_ATA_DATA8__FEC_CRS 0x0
-				MX27_PAD_ATA_DATA9__FEC_TX_CLK 0x0
-				MX27_PAD_ATA_DATA10__FEC_RXD0 0x0
-				MX27_PAD_ATA_DATA11__FEC_RX_DV 0x0
-				MX27_PAD_ATA_DATA12__FEC_RX_CLK 0x0
-				MX27_PAD_ATA_DATA13__FEC_COL 0x0
-				MX27_PAD_ATA_DATA14__FEC_TX_ER 0x0
-				MX27_PAD_ATA_DATA15__FEC_TX_EN 0x0
-				MX27_PAD_SSI3_TXDAT__GPIO3_30	0x0 /* FEC RST */
-			>;
-		};
+	pinctrl_fec1: fec1grp {
+		fsl,pins = <
+			MX27_PAD_SD3_CMD__FEC_TXD0 0x0
+			MX27_PAD_SD3_CLK__FEC_TXD1 0x0
+			MX27_PAD_ATA_DATA0__FEC_TXD2 0x0
+			MX27_PAD_ATA_DATA1__FEC_TXD3 0x0
+			MX27_PAD_ATA_DATA2__FEC_RX_ER 0x0
+			MX27_PAD_ATA_DATA3__FEC_RXD1 0x0
+			MX27_PAD_ATA_DATA4__FEC_RXD2 0x0
+			MX27_PAD_ATA_DATA5__FEC_RXD3 0x0
+			MX27_PAD_ATA_DATA6__FEC_MDIO 0x0
+			MX27_PAD_ATA_DATA7__FEC_MDC 0x0
+			MX27_PAD_ATA_DATA8__FEC_CRS 0x0
+			MX27_PAD_ATA_DATA9__FEC_TX_CLK 0x0
+			MX27_PAD_ATA_DATA10__FEC_RXD0 0x0
+			MX27_PAD_ATA_DATA11__FEC_RX_DV 0x0
+			MX27_PAD_ATA_DATA12__FEC_RX_CLK 0x0
+			MX27_PAD_ATA_DATA13__FEC_COL 0x0
+			MX27_PAD_ATA_DATA14__FEC_TX_ER 0x0
+			MX27_PAD_ATA_DATA15__FEC_TX_EN 0x0
+			MX27_PAD_SSI3_TXDAT__GPIO3_30	0x0 /* FEC RST */
+		>;
+	};
 
-		pinctrl_i2c2: i2c2grp {
-			fsl,pins = <
-				MX27_PAD_I2C2_SDA__I2C2_SDA 0x0
-				MX27_PAD_I2C2_SCL__I2C2_SCL 0x0
-			>;
-		};
+	pinctrl_i2c2: i2c2grp {
+		fsl,pins = <
+			MX27_PAD_I2C2_SDA__I2C2_SDA 0x0
+			MX27_PAD_I2C2_SCL__I2C2_SCL 0x0
+		>;
+	};
 
-		pinctrl_nfc: nfcgrp {
-			fsl,pins = <
-				MX27_PAD_NFRB__NFRB 0x0
-				MX27_PAD_NFCLE__NFCLE 0x0
-				MX27_PAD_NFWP_B__NFWP_B 0x0
-				MX27_PAD_NFCE_B__NFCE_B 0x0
-				MX27_PAD_NFALE__NFALE 0x0
-				MX27_PAD_NFRE_B__NFRE_B 0x0
-				MX27_PAD_NFWE_B__NFWE_B 0x0
-			>;
-		};
+	pinctrl_nfc: nfcgrp {
+		fsl,pins = <
+			MX27_PAD_NFRB__NFRB 0x0
+			MX27_PAD_NFCLE__NFCLE 0x0
+			MX27_PAD_NFWP_B__NFWP_B 0x0
+			MX27_PAD_NFCE_B__NFCE_B 0x0
+			MX27_PAD_NFALE__NFALE 0x0
+			MX27_PAD_NFRE_B__NFRE_B 0x0
+			MX27_PAD_NFWE_B__NFWE_B 0x0
+		>;
+	};
 
-		pinctrl_pmic: pmicgrp {
-			fsl,pins = <
-				MX27_PAD_USB_PWR__GPIO2_23	0x0 /* PMIC IRQ */
-			>;
-		};
+	pinctrl_pmic: pmicgrp {
+		fsl,pins = <
+			MX27_PAD_USB_PWR__GPIO2_23	0x0 /* PMIC IRQ */
+		>;
+	};
 
-		pinctrl_ssi1: ssi1grp {
-			fsl,pins = <
-				MX27_PAD_SSI1_FS__SSI1_FS 0x0
-				MX27_PAD_SSI1_RXDAT__SSI1_RXDAT 0x0
-				MX27_PAD_SSI1_TXDAT__SSI1_TXDAT 0x0
-				MX27_PAD_SSI1_CLK__SSI1_CLK 0x0
-			>;
-		};
+	pinctrl_ssi1: ssi1grp {
+		fsl,pins = <
+			MX27_PAD_SSI1_FS__SSI1_FS 0x0
+			MX27_PAD_SSI1_RXDAT__SSI1_RXDAT 0x0
+			MX27_PAD_SSI1_TXDAT__SSI1_TXDAT 0x0
+			MX27_PAD_SSI1_CLK__SSI1_CLK 0x0
+		>;
+	};
 
-		pinctrl_usbotg: usbotggrp {
-			fsl,pins = <
-				MX27_PAD_USBOTG_CLK__USBOTG_CLK 0x0
-				MX27_PAD_USBOTG_DIR__USBOTG_DIR 0x0
-				MX27_PAD_USBOTG_NXT__USBOTG_NXT 0x0
-				MX27_PAD_USBOTG_STP__USBOTG_STP 0x0
-				MX27_PAD_USBOTG_DATA0__USBOTG_DATA0 0x0
-				MX27_PAD_USBOTG_DATA1__USBOTG_DATA1 0x0
-				MX27_PAD_USBOTG_DATA2__USBOTG_DATA2 0x0
-				MX27_PAD_USBOTG_DATA3__USBOTG_DATA3 0x0
-				MX27_PAD_USBOTG_DATA4__USBOTG_DATA4 0x0
-				MX27_PAD_USBOTG_DATA5__USBOTG_DATA5 0x0
-				MX27_PAD_USBOTG_DATA6__USBOTG_DATA6 0x0
-				MX27_PAD_USBOTG_DATA7__USBOTG_DATA7 0x0
-			>;
-		};
+	pinctrl_usbotg: usbotggrp {
+		fsl,pins = <
+			MX27_PAD_USBOTG_CLK__USBOTG_CLK 0x0
+			MX27_PAD_USBOTG_DIR__USBOTG_DIR 0x0
+			MX27_PAD_USBOTG_NXT__USBOTG_NXT 0x0
+			MX27_PAD_USBOTG_STP__USBOTG_STP 0x0
+			MX27_PAD_USBOTG_DATA0__USBOTG_DATA0 0x0
+			MX27_PAD_USBOTG_DATA1__USBOTG_DATA1 0x0
+			MX27_PAD_USBOTG_DATA2__USBOTG_DATA2 0x0
+			MX27_PAD_USBOTG_DATA3__USBOTG_DATA3 0x0
+			MX27_PAD_USBOTG_DATA4__USBOTG_DATA4 0x0
+			MX27_PAD_USBOTG_DATA5__USBOTG_DATA5 0x0
+			MX27_PAD_USBOTG_DATA6__USBOTG_DATA6 0x0
+			MX27_PAD_USBOTG_DATA7__USBOTG_DATA7 0x0
+		>;
 	};
 };
 

-- 
2.43.0


