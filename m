Return-Path: <linux-gpio+bounces-6331-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9783C8C3FE9
	for <lists+linux-gpio@lfdr.de>; Mon, 13 May 2024 13:37:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9AAB21C22A94
	for <lists+linux-gpio@lfdr.de>; Mon, 13 May 2024 11:37:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B05314D28E;
	Mon, 13 May 2024 11:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="haTdEOv5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2089.outbound.protection.outlook.com [40.107.105.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5BC14C5BA;
	Mon, 13 May 2024 11:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715600256; cv=fail; b=NqppoOPxvEpgBHjXglF1gIOxrQMbhCjKBJQhDEvLEHqsyGepbTTkL901GwCw6dOIV/LsyRfx3me2lfv8gDUCyq18pV8+jcyXsfboDNCxtBRZS87532nHH4Zm5J3+NJVxhlEa6v0B2vNltrUZiE2ZJGAS8O4GRSd/1W3CjwvaGZs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715600256; c=relaxed/simple;
	bh=ZDknhd9PRJU61G21qRUE3Hlk6trPRSU4JWdw1PsIP5I=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=QszAVw4v/bSqTHWPEH9s2JoG4jRQ/UCkPsAPUduHLOrbHR1L1YZECNqmsGcYGfA3sjPUNwm95AQ2YidKY4z+5Lj9hvybJkNSE8E7JOUm5Y97yH3TOPFx3kdg4kjGTCZLSnCdsKdqNeZm9y++EjzLO4rtCMAgvRtlVbIWSuMpERk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=haTdEOv5; arc=fail smtp.client-ip=40.107.105.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oRKl81BEim9Lsy4vJqB0ijK6GHQt/ysnbW6qc4ZBeKLUKaqxGfm73K94J61Mgov/O3cErENACdrnujTK2LxF46O6nDdq3BUWHCoHvje7R9yG231kcjnyV18C21FxxIrFm0yZsOF0+xyI4vR2o0fl1z3q2HldWtUnhsDDl99KtPT5fO1JdrKkBACL/+5gI9vJzw3N9ZAv8dCX0SGdiXp8psCGrVGjrM4RnoVTk4XfTfGtfNm3ststxZ/uhLMUl2lLi01NJ576vkzizgtyVoBz0f8/FIacQEBxJjZcTyToKrmx38m2l4oSXH5KOI8B68Gmz1O3xskUzlQ+AQaJ2u8Egw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FE0zoqYXgn/S7dyRu8cpLHzsBHk1W1NnD7Uog2RpdGE=;
 b=c83mgBcO5lgy4Tol1eJtMCSdkoB2pUNoO0psNTQ2GHjoMvFeBdctzFBVn1u/pHGOvd/JVD2SFYrBKaHYFGRLOXeUmNGm/8GO0G2McRWMQV1VsLt8K/e3U45NrIwVG/ualCWy1nHweBUoSNKIGQOPTG+IIfwSsTQmHHck0m6p4p5IFqz8nfuxnSAwdYfW8bNM1nhKlhDZ2kepgxndFY2ltiuIg2cRESCiWuePoXRVf4KnmuIGeqKCfFp/0Cbz0xTVLmKebparz2bwTpV71SB+zwGV5tTqPyvDdKaHz+8Kg+S07K43bqN8cA7dhdQ+UW0SRm7QpluV9qT1Ie2PNb70tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FE0zoqYXgn/S7dyRu8cpLHzsBHk1W1NnD7Uog2RpdGE=;
 b=haTdEOv5VFnpHL890fCIocBxCe6QQhDkoMIwpNBF/TPq2t1ohGso29AYAtE1aBLM4h2l2VHqu9QU1SiIGGXFWaHr/KfbbkXR8DKzqFhyKnvCbVPasdglJLkFZrd7SUNznMBwSGgzM3guLWTtr8tV0IqwkloqnSprkPbMag4tohQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by PR3PR04MB7386.eurprd04.prod.outlook.com (2603:10a6:102:85::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Mon, 13 May
 2024 11:37:29 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d30b:44e7:e78e:662d]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d30b:44e7:e78e:662d%4]) with mapi id 15.20.7544.052; Mon, 13 May 2024
 11:37:29 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH v6 0/3] pinctrl: scmi: support i.MX95 OEM extensions
Date: Mon, 13 May 2024 19:45:23 +0800
Message-Id: <20240513-pinctrl-scmi-oem-v3-v6-0-904975c99cc4@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFP9QWYC/33OTQ6CMBAF4KuYrq3pL6WuvIdxAe0gTaQlLSEYw
 t0tbNBETWbzJnnfzIwSRAcJnQ8zijC65ILPoTgekGkrfwfsbM6IESaIYCXunTdDfOBkOocDdHj
 kmDLKCeG0UsKi3OwjNG7a1Ost59alIcTndmTk6/a/l4dgsBUXFGqhwF781J9M6NCqjWIXJJHfB
 ZEFZbRudKlB19WnIN+FHz/ILBQNq2mhGkVrswvLsrwAk4untjgBAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1715600734; l=4600;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=ZDknhd9PRJU61G21qRUE3Hlk6trPRSU4JWdw1PsIP5I=;
 b=8imq305evS1sLly9eush0gXreWQj+er86Q7o3whbvYiTC8JMTJjZJDVQJb+ovJq+IFRBRAIY1
 JBtGUcH9kiyBLs3iWbLPLua1LM4pdleu+4AjsLn0wdvErXzGMRasZIY
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2PR03CA0089.apcprd03.prod.outlook.com
 (2603:1096:4:7c::17) To DU0PR04MB9417.eurprd04.prod.outlook.com
 (2603:10a6:10:358::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9417:EE_|PR3PR04MB7386:EE_
X-MS-Office365-Filtering-Correlation-Id: 593758ae-31ba-4b63-38e1-08dc734111a0
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|366007|376005|7416005|52116005|1800799015|38350700005|921011;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NHJsVDBjcmJ3ZHFmOC8rRVN4WVhtM3BQYmFEZEFnM2NTc0V5N0c4WmQyZWdK?=
 =?utf-8?B?UjMvcTZXclpZb05zdjg0Y3F6UWdnNXJXZG1ZNlZNckppbnRpSEZCalNxb2pU?=
 =?utf-8?B?Wk5SV3dXdzV6RVpyM0VTOWRUdE9pTGZQbERCdUJBdzhtTFJJSGZQMTBHMVRh?=
 =?utf-8?B?ak9ocE9ndEIzVzNZQndGcFFwRmVOR0VGMmZOK0lLOHVOa3JIeTQyQU5HRVhV?=
 =?utf-8?B?b0RzMm5rR3cvU1YrWHkxV1d0eU0wK0UySnZ4dFRJU0RzUjRBdnFpcHRvM0pt?=
 =?utf-8?B?ZUVtMm4zUTliQ1BkSTh4MzVhNkVOMEUxdktZbEsrTERmemwySWUxVWlTSUJm?=
 =?utf-8?B?anozR05XelQ3bXV2NUxhWUpQUmg3ZjYzVmlOUjRzWEFhazRWaVNvUEMyM2pB?=
 =?utf-8?B?OUVaNGxDZzlYcm9aWEVURTlsVDRHZ24yVEkzazUwUE5aQng0VjJoWHZObTE1?=
 =?utf-8?B?VHlIbXg3RXAxcEVxWkkwWjRTdW5TTlBWaDMvUWI4Qy9uVk90ZmlZa213WUs5?=
 =?utf-8?B?RXJ0SE93TXVjYWV0cXZtVXROZk5WSlJnVXRKaHZHRzdYb21HOENVS2pSVC9t?=
 =?utf-8?B?MFJJRmZoTWx1Y3VUcVhoVFNLTTlwekRnZnUvTUljWDBWa3BDRXRvNnVLRnFP?=
 =?utf-8?B?WXlYTTFlVWVsMlJ1YnRtdTgxRDNVQmdNdVh0MTl5a0ludXVnYk5HbnNjS09D?=
 =?utf-8?B?by9aOHpnYUVuakpydk5ZOW11UU1qR1BPUllBUjRWMC9Od3kxRDBJUlFOd1Br?=
 =?utf-8?B?cVFjMm1Rb3lKOEFkTmhwVUVraFJsVDVjWDFNVmJnK3ZrcTNmcmlaak12MlYv?=
 =?utf-8?B?bXUybnYwSnlNNm1ROWN1NUFzSFYzcGVCT0VwK2RZZkNLK2hpSDBYV3BoeVBj?=
 =?utf-8?B?RFhSQnJxKy9tMFM2TUlaaG1XOVhKWncwakFhWks1ejF0OVFBb2VHOEMxK0g2?=
 =?utf-8?B?REJHVC9LWU1ZYzdMOWVIZmhvUWswTzludVlIK2RpM1pZUUVmYzBzblhSSUpK?=
 =?utf-8?B?c3IrWWRXbXdyTFNsRitRRllucmlNN21nNWh6V3dsVjV1SnE2SnFHOWJCaXIw?=
 =?utf-8?B?KzJlRDZHYldOQWdCZTNkRzZCTW9oU2cwOEVoVm8xSjFqWUNGd0JwWTVaRUNP?=
 =?utf-8?B?YWxpRXFYN1o1dy9TcVJVVUhsWUNDZlk4QkJWWGx0QUxKNWdjUU5Pek5mWmZu?=
 =?utf-8?B?SkdjMDlTUTFzOFVyRllzNWhOTzJsRFhQczdjSUV2bmk2bFhoTU1sWWo1RVVS?=
 =?utf-8?B?eElwT1hJZUM1bThOb1B6Z2xIVVpSTUNjYmRYN2RmZ3lKMGJaU1FOK2QxZFhN?=
 =?utf-8?B?azNBWkVNR2orU0hmZEZMNE9razAwY1prWlNyQ2tBNWxOaHExMUhuelpIMm1P?=
 =?utf-8?B?OCtBVkZNQUtiT29aN3phbUdDWjJSZXRYSTNLV0ZZSFhySlpyNXlENUFKZ0RD?=
 =?utf-8?B?T215d05UQlFQYlA2WkhaZGRLVldqSW9MNnZWUTRDb05vR3g2QXJKTWVEVnhR?=
 =?utf-8?B?T2REWm9GT1lWbzU1UHlwWkxONThzUXE0d1UyblhUbkprMG9laU8zUnJGTEJ1?=
 =?utf-8?B?SnpYTXc3ZmRYOW1ocG5QQXpNbjFzcnAzSXVjMi9DYnE1b2JwN2luVVpNSU0v?=
 =?utf-8?B?K1RhZ2VCR09JMzhlc1dsd0pPN0dMbmdoMkt4clBDS2FuTWJGdktPWlI5ZUhQ?=
 =?utf-8?B?MVRtMkxZYjJFcGt0UFFJOEJOeEUrTmFwOVVMeld6d0J6WFQyUVFHbTVnbW9V?=
 =?utf-8?Q?Hkd6GE703Vz6lmDBls=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(7416005)(52116005)(1800799015)(38350700005)(921011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N3VOcER6VUg2SVJlL1FpemUwS3BscFVZam1ENkxxK3NEajBVcjRrcHBEZWwz?=
 =?utf-8?B?cC9sc3VxM0NNZlM4VzZlVzJVOWhZajR2UXd4S0V1K2FUZlRNNkI4MjdUSDVJ?=
 =?utf-8?B?QVdXVWxsMzFJMTBKdWRLL21Ocldyclp6UzFqSFptQkxIeHdDb3Y0QjlMUUlt?=
 =?utf-8?B?Q00wS3FyRmduVlNVbFJFQ0VYek1QVmdUUzNqNUFsUXVRdFErTDBmelJDODJ4?=
 =?utf-8?B?SUM5WlB3UW8xeE1xK3pVSThUV25GTUVrS1k2blpFcFZiMzNCd01IT2IxUUZI?=
 =?utf-8?B?SkMyOEdleE5ob1FTaG1UK3k0SVhJYkJoajNKMVZDWDRSZ3o0MlNmQXd3N1d6?=
 =?utf-8?B?emJUOEI0RXdJdy9Pb0VOYS90RFo1SVlZM3h3b25EL2k5K2tDbHY0Y2FRTVVE?=
 =?utf-8?B?Z1BQeEZoRXg1bGx3Y0VBUmNYZVVkUDNDTEF6b3BYRi9Pd0hKeTRKUnZ6OXZT?=
 =?utf-8?B?SkNPRUEwUURhWDFoeVRvQ2J1cG5OUGV5NGN5N1RGTXJvYTV5STQ2RGhvSm10?=
 =?utf-8?B?a09jWTM3SmwyM0I1M2NwQVJVL3I4cnFtN3RRTjdJeDRCK0UxZUhXRkw0NE5h?=
 =?utf-8?B?V3V2V2tZVnRXY1piR2RrS2xTZFJBNEpFOVppcVBaWVNHalBtQTdVclZiTFZh?=
 =?utf-8?B?QjZJVkdKM3BoMEk3eFlZSXBiMDVpRDh2VUZEMHlocHF3YzhGSVNoYmN6VFp2?=
 =?utf-8?B?ZmgzalNYa2REZ0M5M2tnV0x0TFRpZ1pNVm9HZTl3MEtaSkt4UnkyTm9hYllX?=
 =?utf-8?B?Y1ptSFJFOGRCWHdhQytybkt0VnFjYzAvZHk4bGo2NDZoakE4cnpETEtNZ0dx?=
 =?utf-8?B?Yk9HQVkxL1RNdFBlQ0M5RUJLUVAvSjVUenoxelFqOU0xdURFUjYwcHpMN1Jj?=
 =?utf-8?B?Vmd0cHorZEQ5Z25WZitUZHROc0p5RytDbGtIZlI5SXJINGhxYnhmY2FKYWtl?=
 =?utf-8?B?Y3V0dFhRUW5MbmM0UHJJeEhFMXZkRWIyMGMvUFpMWFY5aThQd1lqbDZVa05I?=
 =?utf-8?B?R2dFQklmcGVTVkZmbG1UbXNqWm15Kzg4alRhdHE3cnRROWVVL3RkYWpmVTRl?=
 =?utf-8?B?NlhaZk9mQ1pyZmNxQjRNQ3VkaEEyc0g2Q0d3cjc5S2xEd2dBZkRMZ3c3ZjRa?=
 =?utf-8?B?bnJsSU9pRFpzYUZtak0rODIzWlBxaXZRVVMwOUhFMDRrYks0STVaMjJkaW5k?=
 =?utf-8?B?S2ltMFFZVUlQY2JYOWk0QXRZU0VBci9oS1cvSGd3YTVDZXhQc1lFYTJ3eHhx?=
 =?utf-8?B?RWI4M3loMGEwWHlVcUhKYmxOS2hTTXhGaU5tNEVCcXI2MnhWWGdMaEZsaTUw?=
 =?utf-8?B?d1F5VWhIRG5qd2d0SG92M3M4L1hnU2pUK05CejBJdlBJSFA4SDJ3KytXTElW?=
 =?utf-8?B?Nmp1bTNhZENDSkpwcC91dUJxeHlwL0p0RTBxeDVXdlU3OG5RWHE3SHBYY2hr?=
 =?utf-8?B?Y0pBQWI2ZWwvV3Fqd1U0K3psRjVLL1hnSXV1czZWK0JHY0laTkpHcG50NTJP?=
 =?utf-8?B?cThRMFBwdW1CdTFVWENkNmxRaTJmWDlIemZMNHRyRDdPS3l2K3NIc2hpQVZV?=
 =?utf-8?B?YkJkL0grUU5xZXVRZTk1eUhkekRaUXo1ODIvdXNKOTdCaFVmQzF4T3NKazBt?=
 =?utf-8?B?Z2dsdFdSRllIZ1FGZ0NLekE4MnNUbGpSWURTcStuSTE4N2lCT29hUVpmeWE3?=
 =?utf-8?B?ZXVXT1QvajVINFBXVFFOWlZxaC8wWjJHR09sbnd2VUxobzZEZFFSd2doMnRM?=
 =?utf-8?B?WEZKZ3RGSEwzdTNQeFRacXluNlVYZlFqdFBnWElzLzZ4eUt5SENLMzROQmZO?=
 =?utf-8?B?di9SSitNWGxtUksveWhaMGNXMGErMnNaQ0RpZVM0Ym4rYUV1TUJlQU8wTUp3?=
 =?utf-8?B?dHg4MC9QTitJT2lrUnQ2NVA2S3J6UjdEOXFXdEJlQ1I0cFN3Q0JVays1bi9P?=
 =?utf-8?B?SE9HTzFNbllMem94TFg0TldMVVJCWGxjRFhKaEJoYkxHbUtPRld3V2lTMkE2?=
 =?utf-8?B?TG5URlRjdzlRYkJSUGRQWEFQbkxsa1lkM3N6OUxnM1h1RHZTWTJiU1BWcE1L?=
 =?utf-8?B?RStuZVMxOWNtVjBMZHNjQXZkMDdSQS91bEsxaGIrdGtuWHdkYzk5eUNlQnVj?=
 =?utf-8?Q?ZXc/hEJMsiVypX1OYMl7LdvJF?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 593758ae-31ba-4b63-38e1-08dc734111a0
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2024 11:37:28.7668
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PJh1hTA8qUARkf0vPxlZWaQFUASfmUrwqpZA7DWW0sQRagTXjuFVtwUUpfAG7mFN+ExMNk+MFOqE+yYvs/FkGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7386

Hi Sudeep, Linus
  Is it possible for you to pick up this patchset earlier if no major
  comments?

Thanks,
Peng.

ARM SCMI v3.2 Table 24 Pin Configuration Type and Enumerations:
'192 -255 OEM specific units'.

i.MX95 System Manager FW supports SCMI PINCTRL protocol, but it has zero
functions, groups. So pinctrl-scmi.c could not be reused for i.MX95.
Because nxp,pin-func, nxp,pin-conf properties are rejected by dt
maintainers, so use generic property 'pinmux' which requires a new driver
pinctrl-imx-scmi.c

The node will be as below:
 pinctrl_usdhc1: usdhc1-pins {
         sd1-grp0 {
                 pinmux = <IMX95_PAD_SD1_CLK__USDHC1_CLK
                           IMX95_PAD_SD1_STROBE__USDHC1_STROBE>;
                 drive-strength = <0xe>;
                 input-schmitt-enable;
                 bias-pull-down;
                 slew-rate = <0x3>;
         };
         sd1-grp1 {
                 pinmux = <IMX95_PAD_SD1_CMD__USDHC1_CMD
                           IMX95_PAD_SD1_DATA0__USDHC1_DATA0
                           IMX95_PAD_SD1_DATA1__USDHC1_DATA1
                           IMX95_PAD_SD1_DATA2__USDHC1_DATA2
                           IMX95_PAD_SD1_DATA3__USDHC1_DATA3
                           IMX95_PAD_SD1_DATA4__USDHC1_DATA4
                           IMX95_PAD_SD1_DATA5__USDHC1_DATA5
                           IMX95_PAD_SD1_DATA6__USDHC1_DATA6
                           IMX95_PAD_SD1_DATA7__USDHC1_DATA7>;
                 drive-strength = <0xe>;
                 input-schmitt-enable;
                 bias-pull-up;
                 slew-rate = <0x3>;
         };
 };

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Changes in v6:
- Per Andy comment to v4,
  drop imx_pin_group wrapper; assign sdev->handle to handle first, then check
  handle.
- Rebased to next-20240513
- Link to v5: https://lore.kernel.org/r/20240508-pinctrl-scmi-oem-v3-v5-0-6f2b167f71bc@nxp.com

Changes in v5:
- Added Rob'r R-b in patch 1 after addressed the comments
- Per Rob, use of_machine_compatible_match for patch 2
- Use of_machine_compatible_match for patch 3, and enable COMPILE_TEST
- Link to v4: https://lore.kernel.org/r/20240505-pinctrl-scmi-oem-v3-v4-0-7c99f989e9ba@nxp.com

Changes in v4:
- Rebase to next-20240503
- Add pinctrl-scmi-imx.c itself get pins and scmi pinctrl structure to decouple
  pinctrl-scmi.c and pinctrl-scmi-imx.c, so drop patch 3,4,5.
- Link to v3: https://lore.kernel.org/r/20240428-pinctrl-scmi-oem-v3-v3-0-eda341eb47ed@nxp.com

Changes in v3:
- patch 2,3,4,5 are new.
- Rewrite the binding, drop nxp,pin-x properties, use generic properties
  as Rob commented.
- Switch to using pinmux means pinctrl-scmi.c could not be reused, so
  add a new driver in patch 6 for i.MX95. But pinctrl_scmi_get_pins and
  scmi_pinctrl are exported for i.MX95 usage.
- Link to v2: https://lore.kernel.org/r/20240418-pinctrl-scmi-oem-v1-v2-0-3a555a3c58c3@nxp.com

Changes in v2:
- Rename nxp,imx95-pinctrl.yaml  to nxp,imx95-scmi-pinctrl.yaml and move
  to firmware
- Merged patch [1,2]/3 v1 into patch 1/2 v2.
- nxp,imx95-scmi-pinctrl.yaml only has patterProperties for subnode
  The pinctrl will be as below for i.MX95.
        pinctrl_usdhc1: usdhc1-pins {
                sd1cmd {
                        pins = "sd1cmd";
                        nxp,func-id = <0>;
                        nxp,pin-conf = <0x138e>;
                };
                sd1data {
                        pins = "sd1data";
                        nxp,func-id = <0>;
                        nxp,pin-conf = <0x138e>;
                };
        };
- Add pins enum, correct description.
- Link to v1: https://lore.kernel.org/r/20240412-pinctrl-scmi-oem-v1-v1-0-704f242544c1@nxp.com

---
Peng Fan (3):
      dt-bindings: firmware: arm,scmi: Add properties for i.MX95 Pinctrl OEM extensions
      pinctrl: scmi: add blocklist
      pinctrl: imx: support SCMI pinctrl protocol for i.MX95

 .../devicetree/bindings/firmware/arm,scmi.yaml     |   9 +-
 .../bindings/firmware/nxp,imx95-scmi-pinctrl.yaml  |  41 ++
 drivers/pinctrl/freescale/Kconfig                  |   9 +
 drivers/pinctrl/freescale/Makefile                 |   1 +
 drivers/pinctrl/freescale/pinctrl-imx-scmi.c       | 579 +++++++++++++++++++++
 drivers/pinctrl/pinctrl-scmi.c                     |   9 +
 6 files changed, 645 insertions(+), 3 deletions(-)
---
base-commit: ca45a28e860e3ed34cff0ce5211014d535bf6d6d
change-id: 20240428-pinctrl-scmi-oem-v3-12130031a74d

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>


