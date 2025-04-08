Return-Path: <linux-gpio+bounces-18400-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 89290A7F25B
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 03:42:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6916A16F3A6
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 01:41:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80EBE23F262;
	Tue,  8 Apr 2025 01:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="unyL1x8I"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2054.outbound.protection.outlook.com [40.107.21.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A9A23535D;
	Tue,  8 Apr 2025 01:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744076485; cv=fail; b=NH0c9b+/9YB914zqAcnxZcjZcSHAnZr5Rs6RiJtiqIcR4Nm0bQ7r+hcxSb5/LM6FqwpFsCK20lQ22yRWwo7CijlvIy5N5Z2SbK2mvFMrkoBaD/+BFT1wnCjqnrrqdPdPpAxUHztGuC0P5KQ2rqZ2f2sIpivcwgb1lThaygyRCIc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744076485; c=relaxed/simple;
	bh=mD61YO3EeAGNNCoV8yKXiy/ykpiPPJLVbgunaaJbqFg=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=nT6tsIFye56eWIXHxFiP2KsaRj8kddN+QnmADu7XtOiiw6f3jiSQTBNLQhqLSB2Bbo8jkBd/n+BLsudezeU1IhKbjUMGYxN5c9BkXNkDJqnZHXruzMTHZv9bG98pD710WamC6mqmOIV9ABTeFupXMqjEyJVCJ2kHe/IOEoLY4h0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=unyL1x8I; arc=fail smtp.client-ip=40.107.21.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C7VydDecztxmrAR2RCQiLgZE3bGNjaCKGQWBZHDvUEbsu0ZlagUrWqMqnhOONmf81jcxW5V1m/7gqq/ircAS1hDIhYefkcl8ss//xHnmZuvUfLZ4wl22Z7XPbxHvio06Lx6j6Zv250Emu0GwOwmiQ9qkLNRrvM9ri7Ju7Kjo6WXOvlMrWZVq+LnoukeSh6bBq1LgyRmCpE/tyxcrzm8Ss8Fy/dFwZt2nqGJQ4NjXqewqMYhfSaFepFicH+TRBjvrDLQQftJrfa9tp60oTRKBK86xZOJVHYLuy3bIp0U5y3iEf4EfpKsg3ij4+/gK7o0WvRgWhlBQT5s/Bjeetn5gnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=16k6mc2kzx4YqyQ62mNX/D5VTVDl4YsEYeNaOv2w74c=;
 b=qXmuXnrDZa9lDcac3x3Kuf4iEj0nvCj4KS9LExbUf8zFf0+m/TmH+V4MkIHnzxFNVQaKdi9UwCYnmCz4iN9SwV8e+0PNPCe+5l4QkUI240ywAu5HSstMUGcSlLIo/dcnjDofibiZ1doW73P95nszC2PwWRaDgUGRr/isApW1qreegKg8fkTCo+GXqbZ5TBGidt0dHxF9CNMxilzfyG+1vI++63G3FXTcgKIXrhbww2L0sFcHLFDzhSNMxzG6YdpsSbsGd9+XpxCI88G/ZO3JKck5gCCgg2kOGo+9c/6p4dGOTGUzbUJCVwyuXWaYgSOpw/p7XxJTaCc8l7/ZRQNo/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=16k6mc2kzx4YqyQ62mNX/D5VTVDl4YsEYeNaOv2w74c=;
 b=unyL1x8It/rYPKoYbHUCiItyVXAV4JnJ/7TMAYQ0hR5s70baYJbqoFh4K8ikO6Y2miofJgfopmGxXauf+WrE/4oNJInjP+DQI+6z89RhcW54o6SJTxtLbsqzBJwzEMa/CCnhXV4oMuwacqSwqrU7RwBQl0UOwGXspRrmaQHQwLoR9Ks+A4Jhd4CGfc8Gr0iBnY+aHQD0eS78CRaa7nL152/X/6zXgPW02eFKzgN7GjKsM4lfhO/2k4I6swItVnmXtT97q6zJ4/FcKOXMIFrGIcYl1UKWTVr5dpcRWK87HMxEp9ihqzM4qobQh980G0/FGt+gy/OGi6Zuss02CHPsrQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GV1PR04MB10199.eurprd04.prod.outlook.com (2603:10a6:150:1a8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Tue, 8 Apr
 2025 01:41:18 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%6]) with mapi id 15.20.8606.033; Tue, 8 Apr 2025
 01:41:18 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH 0/7] ASoC: codec: Convert to GPIO descriptors
Date: Tue, 08 Apr 2025 09:39:56 +0800
Message-Id: <20250408-asoc-gpio-v1-0-c0db9d3fd6e9@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGx+9GcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDEwML3cTi/GTd9ILMfF0LCzOjRPPEVEsDSwMloPqCotS0zAqwWdGxtbU
 AGslEz1sAAAA=
X-Change-ID: 20250408-asoc-gpio-8862a7ae9090
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
 Peng Fan <peng.fan@nxp.com>, Markus Niebel <Markus.Niebel@ew.tq-group.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>, 
 Tony Lindgren <tony@atomide.com>, Lucas Stach <l.stach@pengutronix.de>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744076413; l=2550;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=mD61YO3EeAGNNCoV8yKXiy/ykpiPPJLVbgunaaJbqFg=;
 b=PY8uEFZ/hcWDvZRuQG/N7hEhUOlGAMqmAP2adGM2LQ/3XaS4ORRxYExiiPSayfxbZR2pUPaVt
 PMvBwvXRQFGA5sqaIKVc5VaaAEOXIMHoOiah8VMae8ZGbElRgZemcV4
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GV1PR04MB10199:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d94c484-c1a5-4f84-4a15-08dd763e7502
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SFNHcHpNMDFoVHRYOGNTTTEyZnZxanNPWis1MGV5VEN0eFZqa1U1ZWJDL3J1?=
 =?utf-8?B?SEdGTkZxeEhnOGdkNWdIeFdSRFRGelBocktyWlZIZGlZOU9VU0ZyWG1ja1BR?=
 =?utf-8?B?aWZ3V01OejI5YXk0QnVnaXJRNmhJWVdRMkM5QU52RXg4MjFzeXg3OCtyRFpI?=
 =?utf-8?B?UEZaam0vZXk4VHIrbGpwdCtWVWE2NTNKNURXOHg0R1VoN3VsUkdmclNqbmlD?=
 =?utf-8?B?R25qNnc4MVVMYkJpWjNyQUowQTYrZVRHb3NIdnFkS0JkT0k4QlEvbm9xWTNn?=
 =?utf-8?B?clQvZDZrME5qZklTZ05PT2FzRTJISVNTQ1NFbUZUTnovOGFJQUlxRG9zSCtC?=
 =?utf-8?B?NGxmNVkxTEl6NUEvRXVUT0VwbHM1ZmNpTEZESkxiNitKd2dheTRJK0s2ME1H?=
 =?utf-8?B?b3R3cVBkQVVBWmJ6RFVsZFYzYzBGU1lXYkxqUElLR1o0WDNiSGxoSlM5cExH?=
 =?utf-8?B?L3BiQzZZNlBrR0dSNTRuam9uakdUOWZ2WjdET0JSaWFPbjJIY1NWajBxUUdn?=
 =?utf-8?B?eEc0d0Rpek1PQzJkSGJIZjh4SEY0TkVYdVhITXlLMHRhdVUrM1Awejk1b2lW?=
 =?utf-8?B?SktHa1o0MlMyWHhFL3FZbVU3bVpvZ1FkcWowREdCWUYwd29JaEJCL1VTU29G?=
 =?utf-8?B?ZzF3Y25UdjBjZ3JmL2pLVFJNZEtRQS9OZjF2MkZxR1RBN2dmMlBEay9UT2hm?=
 =?utf-8?B?eUJYTm9qTTdJZEdWM0s2M0t5R00xbXdHNVVRWkZvdkJmN25ROXBNUTRtTnQ1?=
 =?utf-8?B?dTF4WVREYjdiNlU2eWJPUTRBckJyUzNmZlJIRW5yMHZiVWd3eWJQb0ZHNkhm?=
 =?utf-8?B?OE1yRkxHNGhZSTljV21GTlE5YnlubTExckU4SjRMYW1yOXJXQU8zRjQ4YnV0?=
 =?utf-8?B?TUdVMmduS0FjUGpHa2cvSWJwZHhsZU9OYzBjQ1czUCtsaWdOaXVIc3dzRDJK?=
 =?utf-8?B?YzFWVkY5Mkg0VGRUTG43YVEzbU9hTGkyWWt3Ulk4eEpzbTUxOCtqSCtKbW5r?=
 =?utf-8?B?Zy9TQ29qUVIxQ1VpdjRnQjYvRDZlUU5wR2RwY25hN1NSUEtsL0pIZm9GSmRF?=
 =?utf-8?B?Vzl1UWMxblpQNjA3VTZBZi91N29weG5oYzAvSWQ2SThsUnRBOCs3S1lCanRO?=
 =?utf-8?B?Q1p4OU05SzY2cEFjMkJXMUg1c2FPb2tOUnVvbnFEdzkxWnN1RmpBL2VVYWNW?=
 =?utf-8?B?MU10THZvbkNrRmxOUVBuN3IyRGJKait6UVZkNE1qSUV2elNYbXJGUm1YZ3R2?=
 =?utf-8?B?M3JUUzRaT3V5SVAwSW94SWR3b3JoTXRSdHk0SmQxWlR6czlDdVAvenVzaVJN?=
 =?utf-8?B?OGRBWFZZMVJwQ0pOUlJwazhRc2d3eUp5UkhTNmNKWCt2cXVjcjJONlBhK1Ax?=
 =?utf-8?B?anBpZ1JpWldtVVNXYmlGRjcxUjkzUDFaWVplV05ua2xPc2JsVUNPMUYzWUVo?=
 =?utf-8?B?R0Vxd0N4N29hSzRvQVUweFd4TWtzbjV4RExxYkxmdGZ6cnh5UnMxZktkd1RZ?=
 =?utf-8?B?ck1ZRm00OVZJYmRwNVZoNkYvdjE5VDVIWXovV0dMREZuT1dta2xKOVN6aDdm?=
 =?utf-8?B?cjVaVzVaNDNvMktXYTk0Q2wwOGppWklRRDh2dFRnRWhxeTAwR1dLbkJUUjQy?=
 =?utf-8?B?bjlVeHduMnVWOE5QMnFySnMwSFdQTDh0cWFtNys2a1hBMGZBd1VYdURmTk9T?=
 =?utf-8?B?Vndia01PaTE5R2QwWnhwTUVSYjQ2NWlOcGx3UzlnNSs5dkFzb1Q1UXBlWWl5?=
 =?utf-8?B?L2ExeVVGcU5odzlrb01OQlF1OHkwcUYyR2tINmpnMGVDN0RQclRzUEtRUDl0?=
 =?utf-8?B?c0hrWnBtVGpuOTJDQmFpWGR6U0FtNlJmU0tFUSswWHNJZGhzS2V3WmJCWEVo?=
 =?utf-8?B?QUYrRzBGdTY5TWFJS0dldkVlb1FtcStVU0hOUlhTaUtDWmNNODgreGF4dlFl?=
 =?utf-8?B?RGcvRW5kREJaeTlZOHovNDQ2U0RVNGo0ZWgwc1lmWjd4QUtyNTBpbmtWUWd5?=
 =?utf-8?B?cDBPYmxPc2tRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dXp6NXd3NkNBb2l1VDBTcWIrMDIwaUUwWm5sUGpNOUFPWnBzdjV5WU9qeUVi?=
 =?utf-8?B?djlrR2dxUFl2Y1F3b0NrbWkxcnlucHlwMVBVdWdMaFIvUmoyblVEOWJPTFNF?=
 =?utf-8?B?bnBvYVBvYjIrS0hqcUJCVVVaV08xLzN0RlJha1JSODFSR0FNRVV3RHlxdHZE?=
 =?utf-8?B?MmdQMGw1WS96OVVqdUVFWHNrZTRmdCtoVVBlZFlpeXJNQ0ZHOW53VldvZ0Vp?=
 =?utf-8?B?RW01eTY5MEtQRytTWG9hUkY5Z3Zwa2hycFhZUnM3OFpVaXd3Nkh5MXU5c3BW?=
 =?utf-8?B?VllhWVJVSmQ5Yy82SnMxNkZIOEw1c25WSXJHVWZBQzN3ekhwN1FXSjZ1dkFv?=
 =?utf-8?B?RkJNQUYvUDV3TTR6Zk9pZGdWRk9Ob1RPQ3BKblAyTEkrQVJJRTZjTmhlaDN5?=
 =?utf-8?B?QnIwNzMzTDBlK3pVdnZ0TW85UUtDcjZNbHcyYzFzSmpEYjNQai9XcHdNWDVF?=
 =?utf-8?B?VFBJcExBVjFwbVk3dWhrQTFBSGcrWk9weEJxTDFnNU00RVRzaFFwWFNMejkv?=
 =?utf-8?B?V0RDb2g1eDdZaEJxWDcybUp3bDNpZ0J6VkM0eWFoQkZJL3pFOHdZQ1gyYysx?=
 =?utf-8?B?ZVJuTG4vclNIMWpBdEFyY3NES2F3SWhzYVlnN0NxbE5pS3RtTDlvMjQ2R3JS?=
 =?utf-8?B?U2JSOHN6VnFXWUdwckJGR295ejhlZGw3UCtXc2VmdEVXOTBHR0QxaEZzdTJQ?=
 =?utf-8?B?SDdManRPOUdrTXBrV283cDFnejlZWVBheGJFRTZadE9pR3RmdjNUL2d3UnVE?=
 =?utf-8?B?cUdZeW5tVTd1bFVqQ3UwWnlqQWlqblFhTDhzRjlVdWhGZG01ZWNGcjJraURP?=
 =?utf-8?B?QU0xMUpsL3NkVHVDaVRKV1BuNWkvcXJnc3ZjWTBYM3ZYQzlZSzRVS2hRUUNO?=
 =?utf-8?B?Skl1cG82RVpFYTdZaGIzNDdKS2FJL2VpK0FRS2lGTXpEc1RTN1hhKzIxZTNG?=
 =?utf-8?B?ci9yZlJ6SS9EMkpYT2E5MU5qSS9oWVB4eTkwcDBVbHo4Y002RktrMURaMWFW?=
 =?utf-8?B?STZ0enh5VTYrcXNVUXFRV0FOSXVMYmtQN09CejR0SGRZZnN4T2R4OTJ5UHBl?=
 =?utf-8?B?UDBZOGY5TCtEL3JtQ1VyWXBSTmhuV0g5akxmYm01YXRFN2pMeVo1L1UyNEd3?=
 =?utf-8?B?dHQvYjJMM29mUi95MWdZV3h5WVcyQVZOclZ2ZW55OGFpa3pMTVh2eUJ6SWtN?=
 =?utf-8?B?aVhPSWVGd2dMZDBJRU1IVnFsZEVWVktMZ243VWdUQ3A2UXJncStvVSt6UFJl?=
 =?utf-8?B?eFFKYjBhS1Nub2lleXZ0bHNnUWJjRnlGN2htQ2w5YkdSV2l6ZTJWeTE3Q2x2?=
 =?utf-8?B?TC9pZFAwYWFROUdOQnVETmk4S0ZXa2h5OVJUc2QvOU90OXIzbFdlSWJQQUQ4?=
 =?utf-8?B?dUlGUEM0amR4OXM3dXl3WHVnNy9XRUdoOTZ5TitDMmh1SUlzNHNESWs3dXRY?=
 =?utf-8?B?akZnbTV4UjVUMko2aG52cTdRU01aZWFqVU03bGgrNHRjcXVzb0JKSEphNTVC?=
 =?utf-8?B?bjZWYUhFakNDd1o0VWF3b3Iwc1I2aVVxaG8vbXd0UEJ4TnNEb0wzMjE4QU53?=
 =?utf-8?B?STVNOVNRSlJwQUV2L0x4dEZyejl1cUJ3VTkwRk1CbXlQeW5YREFqU0kxR0FQ?=
 =?utf-8?B?S2tvcHltaHFxQWNGSVZLUUJxZlA0NFB6V0tjUFB3UkxGMzhwRkRqMGRLTlBX?=
 =?utf-8?B?aXB6d0QxWEtqcHhXc092cFFtMG9MeGcwUGQ5aEkxTFpqRDBSNWFPYkNMWVA0?=
 =?utf-8?B?Y2VqZHBZYWNRVFVCM084QWtBdldHUHlQK1JNN0ducFVWZW1qZG9xNXJYVGMy?=
 =?utf-8?B?a1MrcHZGeDhOR3lPcW1ybXh2VHRia1ZKS0dFNS9pcENpNkJZSU9Jb1RQUXJx?=
 =?utf-8?B?YURydlJtVUFLQ0NEYklGcTRwTTZrdFVwNTVzQ1BOeXFvV1ZrTGc5SnhVRVhr?=
 =?utf-8?B?Rmx6TkdVTUNDMSttWUdJTytyeVlLUnRpNEtOZUVQQmNTazBGdFFRYlNMYlpE?=
 =?utf-8?B?VzM4WkVobmxIY1NGWlF3aWQ3WWVMNHhDNUt1TmJPSExTcnZzR21pME1FUnJF?=
 =?utf-8?B?NnM5TytEUSsva2xqaFl3SnJ6eWxaMnNNT0o3Mnhvb3E5L3JPeCtiaDZQc0ZV?=
 =?utf-8?Q?mRScTZNgrkhDeanV3QcjGFXdb?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d94c484-c1a5-4f84-4a15-08dd763e7502
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 01:41:18.2999
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jettz696NITBFOYCsCPLSFN1EcRwIBM5ji6OsQO9MPg7o9R7AOzvVSoMTn4xoacyXaWA7NVPGASDLe8FL2N+rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10199

of_gpio.h is deprecated, update the driver to use GPIO descriptors.

Mostly about dropping legacy platform data usage, and switching
to use devm_gpiod_get_optional to get GPIO descriptors and use
gpiod_set_value to configure output.

Because of lacking of DTS users, I checked datasheet especially
for CS42Lxx and update code accordingly.

I not have devices to test, so just my best effort to do this work.
For cs42lxx codecs, there is no in-tree users for quite long time,
I was thinking to remove the drivers. But in case people have concern,
so I still do the convertion.
For those that have in-tree uers, I have added Cc in each patch and
appreciate if there is T-b from users.

With this patchset post out for ASoC, the left one under ASoC is
sound/arm/pxa2xx-ac97-lib.c which I have not looked into.

For others, below patches are alreay in maillist for reviewing.
ASoC: codec: sma1307: Remove including of_gpio.h
ASoC: codec: wcd9335: Convert to GPIO descriptors
ASoC: codec: wcd938x: Convert to GPIO descriptors
ASoC: codec: wcd939x: Convert to GPIO descriptors
ASoC: codec: ak5386: Convert to GPIO descriptors

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Peng Fan (7):
      ASoC: codec: tlv320aic32x4: Drop aic32x4_pdata usage
      ASoC: codec: tlv320aic32x4: Convert to GPIO descriptors
      ASoC: codec: twl4030: Convert to GPIO descriptors
      ASoC: codec: cs42l56: Convert to GPIO descriptors
      ASoC: codec: cs42l73: Convert to GPIO descriptors
      ASoC: codec: cs42l52: Convert to GPIO descriptors
      ASoC: codec: tpa6130a2: Convert to GPIO descriptors

 MAINTAINERS                      |   1 -
 include/sound/cs42l52.h          |  29 -----------
 include/sound/cs42l56.h          |  45 ----------------
 include/sound/cs42l73.h          |  19 -------
 include/sound/tlv320aic32x4.h    |   9 ----
 include/sound/tpa6130a2-plat.h   |  17 ------
 sound/soc/codecs/cs42l52.c       | 108 ++++++++++++++++++++-------------------
 sound/soc/codecs/cs42l56.c       |  91 +++++++++++++++++++++------------
 sound/soc/codecs/cs42l73.c       |  81 ++++++++++++++---------------
 sound/soc/codecs/tlv320aic32x4.c |  53 +++++++++----------
 sound/soc/codecs/tpa6130a2.c     |  54 ++++++--------------
 sound/soc/codecs/twl4030.c       |  76 +++++++++++----------------
 12 files changed, 220 insertions(+), 363 deletions(-)
---
base-commit: 2bdde620f7f2bff2ff1cb7dc166859eaa0c78a7c
change-id: 20250408-asoc-gpio-8862a7ae9090

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>


