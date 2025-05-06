Return-Path: <linux-gpio+bounces-19649-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0EFAABC13
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 09:54:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 65BD43ACD4C
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 07:46:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 058BB230997;
	Tue,  6 May 2025 07:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="amuGQWZj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011035.outbound.protection.outlook.com [52.101.65.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F8B323026C;
	Tue,  6 May 2025 07:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746516667; cv=fail; b=iKXzN5+5EgVxX+LL/oEZ9wSMar6kgeG99P6dpCPaQeSa1BukEKbkE4dlhqgPIymSeFSbRtYNvtg5vsz+hilhU5r78AH9fy+BtWXYD7NqJT/w6Xtd+lqAarst5LJ1mKUhF8fgPtZsNazH/o8t8vOPzOYZPVciYb3jKMs+ghzGhi4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746516667; c=relaxed/simple;
	bh=V6yikWjdpi+NT1NEY/bZIBltE9ohwesriuHk+ytfDS4=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=ZbHiwUgXXjZVkPRGUi10qi9YI61B6PFKY04IphNU/RRPQEeJdE0r0n9mYdF2kG8UUyKmi9/NOmtLjoKubCidVrz+BwBwnkWwJJek3ubQkzPi2vQxGeB1dbcfu0/BkZeqVvLirSgF/dsAGRQE63xi+2skr7dZkZXrJHOqsYyTKNE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=amuGQWZj; arc=fail smtp.client-ip=52.101.65.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qPB5GAxFj5uCmWOmxp+z9945LTPxu8PV1Xx+HX4R6ycR39f30JflCAZzELjnyp7ppyXCcFPOXSPO3oVsjqfEfeapi/YpQgS6xQvIjFF9aOpGl8dpBeZGSrNDl+eeGxmTIIXJ6okEZ6a6mlciHfc3biU/9JFQR7MjC4JkoqZeJzWsKkDLEKKIs0NICSOigilSGgAUy8T/HgmXpzdAQzk+9bcxgl3yOvWJb+5EcXXJ/pKzKKF0T2iSRNLZ6F4oX84UwMedB4U4gYLpbuJsW2whhdcxlsw1ltIhX52EnD8SObxpzEl4lcdE8HNV8lgeGeemt+rPr1FrAiFdoahKdq1WEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fhoFx6JBqI70AaQ5kWn9SLZBiZF/Rts2Egn2hKEBVjA=;
 b=EbcVgGxUJVBGi21iR3lC4WyZf80UdrbUK4AGf+0B23IiqusxWW74rdfede11pdsqVpnG8KcoK8uIdnqi+6ucV/yTFQYaKYr4VJ4BqIOdQYmaxnv6/3ergz8/DpNAQDMuNGnQs5GTu35y6pr4xrGYb9FBcw0V1XcJPIHs/SNI8TNMlEivOwmXfhm/M5OU3HWeSPz62W7lyZFV3jyAv/6ygCuIpzeKmrrlTbR/9Z301g33FSNwz46D70DqsKekyrP4rZ9anRGQEfHICXMx1AoDJa1rqKBP7TXx3r4xNTVVxjgVcHMrehK+yjLpUrbuP3GWKb04D68vBr7+zE4MbddHbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fhoFx6JBqI70AaQ5kWn9SLZBiZF/Rts2Egn2hKEBVjA=;
 b=amuGQWZjY2Otz1Ajeg3GQIGrMIJYMkrqtoRxnqgA2prr3LMyUceOY1hp+i+sXJ2IqSl5j64Ao88kqzyoSCUiWI9jaamLE2kt0EVkct8Jtf7yzZb52cnJU5BiBLtOgKpdHwvKP1AKDuE1P7G07YNjCdfeBI/PD/b7CFv0tk0pz4/qYLiHPACjlqjEGx+Ybn1rde7m22bKjawgrFLl5ZNj6eMyFWuapa+AeRUbbM0ilfJ+lElLWcBtCitWe5UN5/lOguJRLTFY2jZb0SubuoCuNF9ofgaB/Y1IuAkoYQUwuSsZ3GBOZZJAN7VJ3I2HC5RQvlFBUKMFUVk0lh/KMGl+dA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DB8PR04MB7196.eurprd04.prod.outlook.com (2603:10a6:10:123::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Tue, 6 May
 2025 07:31:01 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8699.026; Tue, 6 May 2025
 07:31:01 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH v3 0/9] ASoC: codec: cs42l[56,73,52]: Convert to GPIO
 descriptors
Date: Tue, 06 May 2025 15:29:30 +0800
Message-Id: <20250506-csl42x-v3-0-e9496db544c4@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFq6GWgC/zXMQQrDIBCF4auEWdeioya2q96jZBGsaQZaDVrEE
 rx7bSDL//H4Nkgukktw7TaILlOi4FvIUwd2mfzTMXq0BuSoucKB2fRSWBgXWgxGTQIlh3Zeo5u
 p7NB9bL1Q+oT43d2M//UgzEFkZJw5w3Uvhbz0Zr75sp5teMNYa/0BtIGX8ZoAAAA=
X-Change-ID: 20250427-csl42x-0151784a1230
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746516585; l=1905;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=V6yikWjdpi+NT1NEY/bZIBltE9ohwesriuHk+ytfDS4=;
 b=wu/t3WCDQbMiVAjZdmgnFqxQ0EIjYBuA2cFD4Ee1liW8leIBGe4hgKOH4qxSUZwjYa/7WK6Nc
 LVtRCEoXoQYCzx9Xq5PWN1BwhCWFFCWu7VWzAIdpMnwSgkc49T0Ado9
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
X-MS-Office365-Filtering-Correlation-Id: c7cfec41-7d6a-41be-e437-08dd8c6ff386
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|7416014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?anhzUFBlckJmOTZrK3gyM0laaG1oOEhwMkZqNVYrRkFwWStTNDdzWWtpWmUy?=
 =?utf-8?B?cmtUaDZqYjcwUlNqcjdhcHZ2ODNHNnJwakNPLzdaSFNVQy9peGV4VlpGY0x1?=
 =?utf-8?B?cGdDeW9RY1ZDNGxpcVlXSCt2OEhPUW9mVnFKekh5MDN6c0VxOUxvNzhXKzR1?=
 =?utf-8?B?dG5IZ1FxUnZ6QjRKekVvbmZaMWszTWJzblJhYzdGSVRVYTZ1V1hMWmZ1KzRq?=
 =?utf-8?B?bG42ZDU1ZS95eUV4bTlUK2JXblkrVzUwT0hoT05mR1Z1d25LU0Q1RGxVZXo0?=
 =?utf-8?B?YXNvSnZtd2g2dUZVamZ0cWlmM1RoVlNPOTgxTVdqMEJWQ0MzSkFyeDIrRFV5?=
 =?utf-8?B?ZEJtdnZhRUZubTJVQnhFalM2OVdTaktZUXlJTVRySzRnR1gzdVRVcUlNTkFj?=
 =?utf-8?B?STk4dFhYemVLVGgrMUhKT3NocUNucmt3R3JoSjZsQ0I2STlWQkpxZnk5MEth?=
 =?utf-8?B?enU3ZzllL25uUDUvVkJJL1NEWUlxeEhIOFdGYk5IL0lWMkZkVVFVSFlKOEhN?=
 =?utf-8?B?QnZNUk1XN1BudWdqbGdLMGRHZE1ZYnZCVFQ0NWh5ZUw0ZG9QRHhPSThGVGps?=
 =?utf-8?B?S01uZkVZaFFlZjFHQlpnM3dETjh6VE05eWdNbUE1OUVDbE1VbXRkSG5RM1JQ?=
 =?utf-8?B?Yi9nM0lHV3Yyb0ZlTlpQNndJRkdNamxjZ0JCOFZZdkJSZEJKbllodFVXSVpl?=
 =?utf-8?B?RFI4bnEzYU9ISTRoOGpPN3JvbUEycGhVUjVYS3lrNnQ1WGJSaVovMm1NdFBi?=
 =?utf-8?B?b1ZpUGxoS3cxQkZQUlkzUDJmODVqUm5ZdEQ4c3k0bVFEeUh3K1h2UVJPMzlz?=
 =?utf-8?B?Wlk2ZTNXWUI1ekV3c0JFNTZzbHZpbEljdkFhTW44UjBxZ05qVEZKbUJCTmo0?=
 =?utf-8?B?Rk9UQkVlNjlyU2xpbnU5YWMyVU94S1FQZXE5Zlo2Qlg1V0FybldFM1NDaHNh?=
 =?utf-8?B?K3JabkFTNTYyNTJvQXpMOWZ3ZVk5cGxBVVkvOXpTQndBdVhROWt3aTF6Y3ZJ?=
 =?utf-8?B?VG1kUVJ3ZHBNTVh5NktidmUyeG1vSmdpdk9CMk10NEg0R2lwakg4R3ZPeHNj?=
 =?utf-8?B?clU3R1RCeGU2QnRxaEFzSGZhL2ViNjRxejU5d2hvMjEwUElHUUN5aS9zQVBN?=
 =?utf-8?B?bzJQdGlqbStQVm81VjNNYUFocEZwWm84ZlFIQjFwMkpEYklQQkpPV3YxazZZ?=
 =?utf-8?B?d0oxSE5UK2lZUmVoQXFTNmt6WktPOXErK2pORUtPQ0NHOVd6emZ4Q1Zpam91?=
 =?utf-8?B?MHVyS21NS00zb0VSbzNtbnFZU0dzTzVjdUpxM1JmZzg3WThSK0J5UUxoQTBh?=
 =?utf-8?B?YnY0Nmo5WmhhZ1lBU3ZZUEtjZjliRmhPaFQxN1ZVZ2VsbFB5NlowZzF4L1BN?=
 =?utf-8?B?WnM1aklieGErSXdBRE9MMUVjWjdwYXF5ODlSdkdaVnE4YlNrM1Y2NHN2aS9a?=
 =?utf-8?B?SFhJbHdNODVvbzhETFRDaEdhVE9TRjM1WkJVeDA0cHhPcUlrZCt5ZGxqUVZW?=
 =?utf-8?B?dE4vM1hhRXpzYmU3S3R3dW8xdjVsME4xYjZQYnF5VVZXN2xXTGNnZUYwTFJJ?=
 =?utf-8?B?UldVRWN0RW9oelc1S0ZONEd0ekJQK1RoaUMxZ3B0OG1Udkd4MGJUaDgrc2RP?=
 =?utf-8?B?d3AzT0VHKys0Q1FuQVlIZGw0SVVoMGxvd2tOM0E3bVA1WDFMaEdnUGYxM0hz?=
 =?utf-8?B?OUtVUG9OSUMwN0pPU0habWh4TTl3Q1FvZ1BucmNUR0JqeHd5M1dQeFlINFlV?=
 =?utf-8?B?bVQyYU9CMlI1Z1paSE9aQXdJZVhMMGFCclFoTjU4SGpDN2FFcmVBU3AxUE43?=
 =?utf-8?B?UlQ0S2RnN2RqRExkZ1RsQmRqdDNnWlVUQVYyL1lNZnQ4ckdEY3Y2ZS8vNXpy?=
 =?utf-8?B?R2NBTkwzelZZeTZPNFRlMG5wNjVFanQxcXlmVmp6SktHZVJiVE9adGFtZ09S?=
 =?utf-8?B?cndaaHFhSGROVDErVnFlck0zUEZZaWZGb1VSVUxLYVQrVDNvQTlIbWVseVJa?=
 =?utf-8?Q?p4uVvExPL4xMaFkcIFwe9USdeW7Yk4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bjZ6SFpsMmh0Qm5RUHhyTll6MjRham0vb3Q5MW5YQXBPVTlHRW14MVg3N2dl?=
 =?utf-8?B?VlJEV05UbUlLd3RQVk5uVUovZWJMNm8vem44aEFSR1Y2TEVLTWF4WmtZQTIz?=
 =?utf-8?B?TVJtU1p1dk1BanhBejZUVTVZNlJ3NkxhMGh4akdHUFk2ZE5RSFk4Rzl1Vmow?=
 =?utf-8?B?dHh3VnVVdTJTd0RjU2VUeDFHaGFKVlJSS0VpaXYvNldhY0lTRFVRVk1hcmlU?=
 =?utf-8?B?TjBUbVFtM05QamJJeHdHT1dLbTNNY1NsM0FKNzFTNmxtVUErcnM1Mm80Rkd0?=
 =?utf-8?B?NkRPZXRzOUpzVWcvZm9VNWhsVGFpMm8wbXh4TDNWdTIwYmc3V0Y4TGFwSG1t?=
 =?utf-8?B?VWtWSFJSdy9HbW16bnkyelQxbkJGNmdQM0pnV3p6RWZWTUhLRlp5bVQ4NWk4?=
 =?utf-8?B?NzhkY29Hb1l0M0hHa09Mb2hvU21mMUJGTDlBNXJkNmw1K09wU2hTT2sxa21w?=
 =?utf-8?B?VEtveUFxUGdoTERGK3BUK210L1dZYmpuOUhRcVRVdXBXeG80ZHdSaG5qMkZx?=
 =?utf-8?B?cUtWaHQrRXI5Unl0SFhLRGFNNk44Ny9wZE5aMGEwcXdITWIzTGY3UnBScHZH?=
 =?utf-8?B?b01kSU1GS21xZUlaK2FueW1QUnk4UFZiQUFrcjE1MVpXLzlCS3YwSDQwcGFk?=
 =?utf-8?B?QmFla241TnBZdVFOaDVJYjl6NWZOaGpES3kvWDJQaUlzY1dLVm5iMHFzU3I0?=
 =?utf-8?B?MUdlaFFxTjJJNURCWVZJMXZIekNIMW1sY2ZLRVVoZXZKNktjaUljQ29IR2Fv?=
 =?utf-8?B?S1RKODFZamN4aVRyYWJtQ0tLUzQveU0wdVJOL3VrMG1kdmg5d0VMQmMycm1O?=
 =?utf-8?B?V0ViSzVVR2JPYTBPeDlUeXZuWlNpTituVlRUWlZqVXIxTCt2YzU0REhBVFBs?=
 =?utf-8?B?RkdnMzlwU2ZtUGg5eEtTZEVsVzBBQmlLMHcrUm80NzdhWW5RV3YyZ25laFov?=
 =?utf-8?B?WEVIeUxWSC9KMkt1OGJGUlpud1dUS0p2allBMWc0RnhJQXdGd1NDRUc2SUl0?=
 =?utf-8?B?Q2VHVzd5TTlFZmR5aS9rcjVXSWwvK2FrZDZ2Q2EwT1pIV3JTMWpKL1BicU11?=
 =?utf-8?B?Y3d0YXRDd3gxR2ZmWnhjMjdzLzErVG5rOFhGRW03RC9SWlpFNUk2VFZOdkdS?=
 =?utf-8?B?Mjk0SmdHeW4zTzJKZlJoTHFZcDViU3pISUllQjJHUnBRYmVFejloQkVDWHN3?=
 =?utf-8?B?SEhEVUJnNkdvRXRGaWpoamdsajZnTzltaW50ZkR6dVAzRUpRV1c1eUlrcTcx?=
 =?utf-8?B?aDZvNTZvZlRYQVNBR2lTZU13b1JPNmYwd3dIZ000SWFqVjVSdDZCcjdhTnJL?=
 =?utf-8?B?VHZlWDRCUXZZbGhBdi8zcEpvWHVEVXJ0Y3oralIxbktjbDlrR1ZmL0ZuY0Ra?=
 =?utf-8?B?cjFhU055UFN1aFY4VlE1bjBOdHBBWjBkL0ZqeUVnVjZGc2piZFhXYWZ3TCtt?=
 =?utf-8?B?V2FQNFNVeVNBcHNVcW9yZkNiM0lZRS96bWl6MHZKMEwvSmRhT2ZEc0U0Rzlk?=
 =?utf-8?B?RTRDaUd0T1lYU1NPYWRvUytkLzRqOU5Xdzl3dzJ2N1JDbzBaYW9GN2YrK1J4?=
 =?utf-8?B?d0NFbklpNkozc3hjRkFyMm9QVG5abEUyM1ZvU1o2QVlSVE5jUm4xOVZwYk5W?=
 =?utf-8?B?YXFOV01hc2YxOW5ia29WV0NmeUxMWCtpRnRUYmV4MlJ0UVBJTnkwanlnQ2dZ?=
 =?utf-8?B?TmdNM25EUXVzNHRUNUh6U0d3d2R5SEc2N2Z0NWdrcCtFeitmWVdVOGF0emVs?=
 =?utf-8?B?Y29JN1pETDM0QzBvNUtVSG1NaTNQNTJneE1ZNnhBWjVkRUNSekM5VDdXY3NL?=
 =?utf-8?B?aXlKNHI5eWNObXFEbGhvS3gwT3NYckxWMUJzQmt0TjdQbWdRVUVKQnhBNXRw?=
 =?utf-8?B?WWZiK2pDRThIQzJVYTJzdUtzWGJsejlwUUM0cGdTNit4U2ROcE0vb28xRC9Q?=
 =?utf-8?B?Vng3SzVGd1BlMjlkMjV2R0VwVTJDYllML0FYVVVEaVVUa3hDRS9wNlcvSDBN?=
 =?utf-8?B?Ni9wM296SzNNT05VaW15a3M1Nng5ZmU0MlpIUW1JSnBLeU0xcG9zaU5JNHBa?=
 =?utf-8?B?Rk1CaDBSZm9oMVkveGlSNmtGb2k5RnpVdFF2dmNwNWZZY2VucXdQSFJXTTVP?=
 =?utf-8?Q?fr+aSJ8OCTu66hrwNOWMK3OGk?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7cfec41-7d6a-41be-e437-08dd8c6ff386
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 07:31:01.3383
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 82SNsSbZ/rdDYdOPZ1H3HURdpsRZmtQYV8VURTVrGUMvs1hKVl73aBIGreKzZ98vI7WVEcpYsG60PaTJCKx/oQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7196

This patchset is separate from [1], and not merging changes in one
patch. So separate changes into three patches for each chip.
- sort headers
- Drop legacy platform support
- Convert to GPIO descriptors

of_gpio.h is deprecated, update the driver to use GPIO descriptors.
 - Use devm_gpiod_get_optional to get GPIO descriptor with default
   polarity GPIOD_OUT_LOW, set consumer name.
 - Use gpiod_set_value_cansleep to configure output value.

I not have platforms to test, just do the patches with my best efforts,
and make build pass.

[1] https://lore.kernel.org/all/20250408-asoc-gpio-v1-0-c0db9d3fd6e9@nxp.com/

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Changes in v3:
- Fix build break in patch 2 when using allmodconfig
- Link to v2: https://lore.kernel.org/r/20250428-csl42x-v2-0-e8056313968f@nxp.com

---
Peng Fan (9):
      ASoC: codec: cs42l56: Sort headers alphabetically
      ASoC: codec: cs42l56: Drop cs42l56.h
      ASoC: codec: cs42l56: Convert to GPIO descriptors
      ASoC: codec: cs42l73: Sort headers alphabetically
      ASoC: codec: cs42l73: Drop cs42l73.h
      ASoC: codec: cs42l73: Convert to GPIO descriptors
      ASoC: codec: cs42l52: Sort headers alphabetically
      ASoC: codec: cs42l52: Drop cs42l52.h
      ASoC: codec: cs42l52: Convert to GPIO descriptors

 include/sound/cs42l52.h    |  29 ------------
 include/sound/cs42l56.h    |  45 ------------------
 include/sound/cs42l73.h    |  19 --------
 sound/soc/codecs/cs42l52.c | 112 ++++++++++++++++++++++++---------------------
 sound/soc/codecs/cs42l56.c |  90 ++++++++++++++++++++++--------------
 sound/soc/codecs/cs42l73.c |  70 +++++++++++++---------------
 6 files changed, 150 insertions(+), 215 deletions(-)
---
base-commit: d9889ee34d3ea05284d5df6182692c12595b671d
change-id: 20250427-csl42x-0151784a1230

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>


