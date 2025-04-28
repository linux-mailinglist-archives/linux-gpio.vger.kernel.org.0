Return-Path: <linux-gpio+bounces-19374-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 450D6A9E620
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Apr 2025 04:12:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2B1A7189C09B
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Apr 2025 02:12:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42F7C176ADB;
	Mon, 28 Apr 2025 02:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="qlqPtyWz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2051.outbound.protection.outlook.com [40.107.20.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 136931CEEBE;
	Mon, 28 Apr 2025 02:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745806269; cv=fail; b=ZRp7nF+Q6HHig7WGbENeqgH+UMZaEpaC/MA5iPj3F2HHinH0P1Gnfaf1XeZLrVaCeqG2R4s5TG+3pM/KMeggG0SNYCu6HyJBImWaZ2WgVr70ttOJaWMV0c9FvfrOWn0IC8YSDO0TinmtF5V9LRf00ahSyYdEnZNGXtE0Ud3lomI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745806269; c=relaxed/simple;
	bh=5nyC0HpBCpJxerFRaGt2W8pQIN+4nUL6P3ojYdbc/2o=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=BigMyipxTAcV0VD/t5vhBwElDqJdlY8KvjAhURt+VwcwuY6OjYzIJUgIykB06YVWdyrjxSleWlN8GKsoDqv3yXXmxOxDSc5S6x9dZS1zNBAkeCLG9Gf56Op8KoiXgLLOMUhRQFYTnyBIHP55koeoATjx/kp0ky/lSHTDarA1tbc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=qlqPtyWz; arc=fail smtp.client-ip=40.107.20.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D34jkC3sGFsFvG0i/8VIxcLic7STo0i0OKEnT+cTzdjCeX0o6sZ7UyNEljElGes/UcrX/W4DZDhtUWmltMaOy0tN6cSkcHNj7QoJVsxqbleag2btSSZrOl9VCgOx73cUKpsrU+bU7Q0hvsHZm+F/UYC1Hx8dzL4FTRJL1EnQeUNsz3XiqEab41tvOBYuDwKTShC0a3EokcksduhTJ0zZPWE/Q7U2aJxpnV7/f2sDdQ523WWK6/Lmllke8I+01Ab5iECQwEiBAzYkVZOIAvUuDOqaURx6mKpyL+H1EsFlln472660M5KA/FtQEk4taylniAgSo6ZHxi6vy8PeO2A5KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CYdjuhwvsfxVUEvKeKODcrk1U2kmXEfmBE/qUmzTBBA=;
 b=o/A6jkvXCC491yW9ffSnSHhd0pNkvqmGJ/4UL+/jntX5CpLtD6MrgeeuWzE4QxQymh92UrI0v8IZHd3w8qGYRjnEyM39L/gqKGr61BU7/8/6c0MWi3Q4cd3v6P8BPIjpyuNPGBtSBvTqALoCJoeOF8Kb9XjE5eIDV09JDdPAvZt8cIyUeEYVNiB8yFSD6kt8rdLj+4cMVgtv2kYvzXIgxvz6w63Sbatkt9xQgsBzeCzuk12DcmMMXVoXcu5rjv0HOwYPM63cinN7f4EiDJtQVoF6LACTX7tfDu++656uMuYDyK3+ZBJQbVVwOSCaCHKccpWOgiVIuAp06RraDDMVGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CYdjuhwvsfxVUEvKeKODcrk1U2kmXEfmBE/qUmzTBBA=;
 b=qlqPtyWzQfqdDQX3IZ6Cjhif/6ey9JUMpYFX/bbTf89LlEscuaRFK59k0yi0VLPG3/Ke1O6tHkyFSoMnA+bx0z5xQnH90Ad2r3+lme8hZqrw0Xgshp7YraqDubdy97JM7rh1ydvqp+MmI+Rb/0FlZC8ad3a7d+gm7i15jDA/y3Koc0KyHocP8NqsdQwEn4IXvFgj2ngmpRhvMcNTI1nfHUdCnLA56dQwxIqpDPFUSsgrUsnd3pvzaN1gh1U+bCFBSjWFJ5H47fDm1sNWgibtjgqB8zXOCI2KZIKcrGGhlPSouiC0N9iixmdEnsCDgjLKWpIYA7vaGLp6f0DyrdTx6g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GVXPR04MB9901.eurprd04.prod.outlook.com (2603:10a6:150:113::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.28; Mon, 28 Apr
 2025 02:11:04 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 02:11:04 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 28 Apr 2025 10:09:10 +0800
Subject: [PATCH v2 9/9] ASoC: codec: cs42l52: Convert to GPIO descriptors
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250428-csl42x-v2-9-e8056313968f@nxp.com>
References: <20250428-csl42x-v2-0-e8056313968f@nxp.com>
In-Reply-To: <20250428-csl42x-v2-0-e8056313968f@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745806152; l=3098;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=Meie2Ur8+olGUDMVKFIdjW59K4DPyviqRjxk8qxOcTQ=;
 b=47scwI1bM1W65FhPQ2o45D0pAVvVQqPLfO7mqYfUXeNxDEBiqMLfKz/nVpqdhqe5VN8glNq+m
 PvQhi324b64DIDtb9uWZVPXL/b81d+fkWknXkqIivs6L45RB1dA4YCq
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI2PR01CA0027.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::7) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GVXPR04MB9901:EE_
X-MS-Office365-Filtering-Correlation-Id: f740b855-1779-43b1-ed3d-08dd85f9eda8
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ME9wSlVvSlFZaHpxK1RSSWMrRElScDBhbUJaTDFLb1lhY3JGMXVEcUU3N0Mx?=
 =?utf-8?B?R0V3eHdQelc2TkpOdzBadjRhQmZaSnJSbmxzczdmb2NzWVFIWUhLZ1Z4NWVX?=
 =?utf-8?B?cFpwU0ZtZE1XRDJQbGsyb2s5bjFXZjUxSTFaY2dRMDZrdmY4dlZ4UHBkdUxv?=
 =?utf-8?B?Y2VBY21YS2FRNk9IczRFU1l5TmJkcVk1cjhzRDNLTjNLV2l2akdPdGQ3ZnB3?=
 =?utf-8?B?YUlRYjJtd1o4L0hONDJhbnhPRGw2K0dvWjdoUVczUXBaSGQyMU1mYkVXL0lt?=
 =?utf-8?B?TUpSRS9RUW01VW90RHNBUmVkd3liTE5XSUNLRFI3SThNQnpKNXQyU2JJTEw3?=
 =?utf-8?B?Y0lKSUpuV0FzMEx4MndHYW85bENlMEpsTk5DZmVBSDlRR2tybmpyNlU4UGla?=
 =?utf-8?B?VHRjTHdtTlBRb004djlSUVJZTTZMTkZibWFvS0JOY1BocHVWWTBiZjA1QURL?=
 =?utf-8?B?NTdsMFIzUUU4RU00Z3lTdmlOMUx5M3d0bVBHZkZuazhrZ3BOc0JHZWcvdmF6?=
 =?utf-8?B?dlVFY2d6R0s0YmdYR1ZKaURJZzc0bmhncXZISENhNmh6cEJZa0R1Y3dQNDNN?=
 =?utf-8?B?TzlacTFLU1dHQlJMMld6eVgxMVVnaFhKdEwvK3ZPaWtMRGRyQ3pKQUtROVJE?=
 =?utf-8?B?YnZmeHlGTlVwbTdBbFRRcllSRUxSMmNxOTFiZVBaK3hJNXh4YnExQVlQcFA2?=
 =?utf-8?B?SWZ2TUtKNmpZK2hpYTN2MzJZdXpYR3BLVlRDRjNDVEw5WWdnVkUzWE5tNTB0?=
 =?utf-8?B?aU9HR2orRjcwNm10clExK2lTRWF0QmVlNEFnQjFIM0dTM21VdVZ4bzRTM1hI?=
 =?utf-8?B?YTNWSDdwa2VuY0d1YlhnUFZnV29CVG1NKzR0Y1AzU0FLZForMnh6elNqcVQy?=
 =?utf-8?B?QnVJdU1GZjd0ZFBUdGhsWFBSTkFwOU11RmJlSGVxVk8yYjhvcUtUeTVIa3RM?=
 =?utf-8?B?TXBnY0IvNmlQV1ptVkNqM2tuekdReUpYb1NUYys2a2w1VzBsbGtSTlNtNndD?=
 =?utf-8?B?YmZrMGVnTmx2ZElvbjdOV3pnakN6NnFQc09ML2pKaGpmM3BaaVdPZWpkTUtr?=
 =?utf-8?B?WWhqcGpjS055WWRNbWxub0sxOTM3bEwzQTZSZENoVVhBT1ZsRGZ1eFluVjN3?=
 =?utf-8?B?WjVxVVI5UWd3dUxyaXlNbUVkTFlHZjAzL2JyN3lUWEJhdlV5VEZzWVZUZTVk?=
 =?utf-8?B?c2dkWkl5eVdCam45V3kwNVlpSGFzQlRuZkwzN1dQWnE4NHBYWmVEYzZESXYr?=
 =?utf-8?B?K1dPcXV6WE9vTGVaUWFvTVY2MlVsS0VkU1hBenU4WGhBdkZtNzJpOHdHcjlo?=
 =?utf-8?B?czJPdXd1SXZhSnluK3NzcUNMYS8rQzFaczFyVEZuUGxrREtxbWhwbnp6dGVC?=
 =?utf-8?B?UGRHeXNNeVdLZm5Vd3hQU0c1a0RoNjlhcTd5U2hHRW4zSDQ2ZWFZeWtsK3ZW?=
 =?utf-8?B?L2w1NFVra1U5RmZic21rM0Jlb3VYNHVndzgyV1hYd3pRRG43dENUNVFuNSsx?=
 =?utf-8?B?OVV1ZlhrdlQxLyt3UXFsUm9ZYzBkVjUzd1p3NW1CTDFaUnFSWDZIZ014eE9v?=
 =?utf-8?B?WEJhUEhyekIrRFZrV1NOZzZHaGpaMkgwOU5ja0EyRzdoLytLMmVzVVlCc0xw?=
 =?utf-8?B?NEVnN0d0QkNwOXhSVVNFYXRQc2lyY0lRQVNQNHRTeEwrYS9JczJvdlV5YThx?=
 =?utf-8?B?djNwV2cvV3o3cmc0YncvdFhoYmpKQ2toRnRNTkp4Y1RLNk9HejEzMnFSM1NU?=
 =?utf-8?B?aFpzaWkwcFVXUEJBeGpDcTlheWZldEJPdWhRR3JpY3VYR1pDa2RMeS9HR0k1?=
 =?utf-8?B?cERmQTYwNjlBM05vQlI3Vno0am5IL1dGZWozaW5aOVR3VWwyZlhScmo4QlJY?=
 =?utf-8?B?UzA4NU9ZaGoxdmswM0RXTmt4OHpwaHRuMnRsNVVkRlZyQUlyWHh5aUJGU3o4?=
 =?utf-8?B?YzR6RWRoMlk2Z21zSkc5TXIvV1o1M3VzVDZYSG50SFFER2ZlTWxBZWNmaHNm?=
 =?utf-8?B?bUV4TDUzYXJRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R1A0a1RyaS9HWkxONVZvVEJLWGQ0YUhwMUc4MXl4U2lnYmVVOXZjMWJNUkdK?=
 =?utf-8?B?OG1zWW1JQTRpTVIrdVdZU2Y4OEx2dkMxa2g1ak8yQzAwdzZ2R0hwbkNuVDZC?=
 =?utf-8?B?T1RKZ05SemtucmdrTDhQZFJiT2dUd0hLQzU5SFI1OGpxVE1hSlNCeVRVK1VS?=
 =?utf-8?B?SkJaL2NtcDkzQk5iR2wwZXZkbC85alZLSlB1RkZHN1p2WUF4T1JxQkkzVXFF?=
 =?utf-8?B?azBwT0xuWWtvZzFYSjgxUDUrQTQ5THF3MzZEVlMxc2haOWoyVE1FK0w5YnNr?=
 =?utf-8?B?REUyRjkrQ0V2ZDVzRy9TYnRpVTlkMkVOaGM5TDVhSXR3QjcvbVQ1ZktEZC96?=
 =?utf-8?B?Yjh1dXlNZ3RldzNtOGVLWlVqaE5pU3JuL1lGWmZwVmdralN4a3diVVhKKzJ0?=
 =?utf-8?B?ZTRXZDV4R3JqelQxdG1EendjdDdlZXFYTm1CTXFCd2RIUWNBU1BGWU9uVnlh?=
 =?utf-8?B?cUU0NXd6cnpkVjg3ZEpEQzdoUzIwSEIzcUQ4UTZISUhROTg2THJOQUcvWjZv?=
 =?utf-8?B?R0RiY3E3SUR6UmZTTE1hQi8waXQ2MURXSER4TVkzeW1hS3JqZlpLTGZQWUdl?=
 =?utf-8?B?R01pWkw5eWdiVnJkY3UwVzc2NzVGa01uS2VyN2tjV3Q2ODFVaUpoVWJNbHZF?=
 =?utf-8?B?VVpVVzlnWVNpODlCUVVJdGR3cXBEZFdmeVpjc25vT1FneXNSOEhyc0x1QkZ2?=
 =?utf-8?B?V1RMTzBVUUh6TjZYaWhtZEpXaVJnbUhQY21FdDc3TTcxOTJ0emJBTStVSGpI?=
 =?utf-8?B?Y2FyMmF2VytzQWZjUmVMSlpGSGg5MzJ4ZmNadzl6YloyQVI5Sjg5YW5MVUdn?=
 =?utf-8?B?enZIaUVYdmFLUHkvUGUvT0VJMkd0bFliWlFwa1hmVU1CTXovcDlSNkg3SElK?=
 =?utf-8?B?VFB3MkhqYnlTL2NzS3hoSENYQTdvTkdNY1IyMy84ZzVKR29XWjNYdjNhekNj?=
 =?utf-8?B?TllObW5DSE9FeC81Q1dKdjdxUGtUazYzRHBzS0RSR2J3akx1VGFqSGpUSUlE?=
 =?utf-8?B?NlR3WlVDQUNWc3FndEhDbjRqcXFvSy8yUmRranYwNVRIZkRVMkRQMTNXTVo3?=
 =?utf-8?B?Nm9PM2ZmMDA1SU1rYll0STdXZStLMG1GVTJSWXdtTW5vbStoSjN6dWhDa3Zv?=
 =?utf-8?B?aGJHRFlVS3pVYTZPajFQNFpNVURveE1nZSs1QmxpY2hjaU5qbCsvODkrbWJT?=
 =?utf-8?B?aVU1RERHS2wvdmN4bDVyd29wMlA4U3VDbjBBRjl6TERERUhEYzlRaUw2RHoy?=
 =?utf-8?B?aTBkeVhIZWxIcEJvcW04YkZaTE9JUkdqek5MWitOa3hQMGJEbnJISWpSWkli?=
 =?utf-8?B?VXQ5eU9FNnZtOUJYY3NJQ0t4T0JYTG9iVnB3NTVrY0FhQlBtajRDVVNEcWtM?=
 =?utf-8?B?T1VadTY4am0rK1RaalFjcnFteXc1eVpPY0xqM3RHVmxHaXd1aWljSDhadlN5?=
 =?utf-8?B?c0tGMm1rd0FnQ3RVb2JGeTMzSXdpQkhkWnBaaStFcldaMTVqeUg5Mkp6b211?=
 =?utf-8?B?SFdBazUzV21jaUhFbzNHMnlNb253U25HM3RER2ZkZW5sMnVsYlNSZXdkeWcr?=
 =?utf-8?B?MGxBYjhJSlNKb2ZuRkV4Z2RSZnd6M29heEhKWEhYL3RmZEtjY1gwak5IdUd2?=
 =?utf-8?B?ZmlEek9xVVBSRS9SOG1ZZlRJbmUrOU5xNFcza3FDbnhoeTZrVFFiSEhzNUlX?=
 =?utf-8?B?QmJhdlJEVmU0N2JJY3dWMWdsMFRKVGhnd3ViYWNkRmNoQmNCTVN5UFdkdXZw?=
 =?utf-8?B?bWgrTFoyNkhxTGdqTFV2cWpmN1d4ck5jblRtcExWa1FKMGVzR2QvNmJUUDY5?=
 =?utf-8?B?NThCMzIvRWd3SldSYUFkcTM3U3FGclVZY1g4eU1MSW00KzZvc21VMzNvWUNE?=
 =?utf-8?B?SDljVXBQbFlHSzNabS9mSFYwbys4MEFnN1ZSbjg4eUNxY1QxdTR6NDdUN3Aw?=
 =?utf-8?B?ZTBCT0g0R2lKUzF6b1UyRHNBRlIyd2JpZUFaVytweHFPMUt0eTZwaUQ5ZFlk?=
 =?utf-8?B?T0JPTk9DMnJRVCtjSEdQeEl4VGdPbnRkM0Z6SlkvcHorNkxicWViNmFwZzl3?=
 =?utf-8?B?aDVYN1FNbTZmQU5VbGc5cDMvR2VYZ2N3cG1SZm9TTGFzQkVhU28wKzlOUVhY?=
 =?utf-8?Q?lvPXCGPqfzkpoO1X6nhIim3GU?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f740b855-1779-43b1-ed3d-08dd85f9eda8
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 02:11:03.9471
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CEqlIodu5VdfXCMZsmVvkL/F20Thi9Om/bQy5HFvYW8SV6X5n0S9JngSrvcJNmZMqcSSDDQvPiwhmHs8FXuEWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9901

From: Peng Fan <peng.fan@nxp.com>

of_gpio.h is deprecated, update the driver to use GPIO descriptors.
 - Use devm_gpiod_get_optional to get GPIO descriptor with default
   polarity GPIOD_OUT_LOW, set consumer name.
 - Use gpiod_set_value_cansleep to configure output value.

Checking the current driver using legacy GPIO API, the
reset value is first output HIGH, then LOW, then HIGH.

Checking the datasheet, the device remains in Power-down state until
RESET pin is brought high.

Since the driver has been here for quite long time and no complain on
the reset flow, still follow original flow when using GPIOD
descriptors.

Per datasheet, the DTS polarity should be GPIOD_ACTIVE_LOW. The binding
example use value 0(GPIOD_ACTIVE_HIGH) which seems wrong.
And the binding use reset-gpio as example, not same as driver using
"cirrus,reset-gpio", and there is no in-tree DTS has the device,
so all should be fine with this patch.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 sound/soc/codecs/cs42l52.c | 28 ++++++++++++----------------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/sound/soc/codecs/cs42l52.c b/sound/soc/codecs/cs42l52.c
index aa8c001cce099e3c1dfc979678fe8000caed097f..a9ffba62aaf88c55a715d83609382d6fc5cfaa8d 100644
--- a/sound/soc/codecs/cs42l52.c
+++ b/sound/soc/codecs/cs42l52.c
@@ -9,13 +9,13 @@
  */
 
 #include <linux/delay.h>
+#include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/init.h>
 #include <linux/input.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
-#include <linux/of_gpio.h>
 #include <linux/pm.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
@@ -50,7 +50,7 @@ struct cs42l52_platform_data {
 	unsigned int chgfreq;
 
 	/* Reset GPIO */
-	unsigned int reset_gpio;
+	struct gpio_desc *reset_gpio;
 };
 
 struct  cs42l52_private {
@@ -1146,25 +1146,21 @@ static int cs42l52_i2c_probe(struct i2c_client *i2c_client)
 			"cirrus,chgfreq-divisor", &val32) >= 0)
 			pdata->chgfreq = val32;
 
-		pdata->reset_gpio =
-			of_get_named_gpio(i2c_client->dev.of_node,
-					"cirrus,reset-gpio", 0);
+		pdata->reset_gpio = devm_gpiod_get_optional(&i2c_client->dev,
+							    "cirrus,reset",
+							    GPIOD_OUT_LOW);
+
+		if (IS_ERR(pdata->reset_gpio))
+			return PTR_ERR(pdata->reset_gpio);
+
+		gpiod_set_consumer_name(pdata->reset_gpio, "CS42L52 /RST");
 	}
 
 	cs42l52->pdata = *pdata;
 
 	if (cs42l52->pdata.reset_gpio) {
-		ret = devm_gpio_request_one(&i2c_client->dev,
-					    cs42l52->pdata.reset_gpio,
-					    GPIOF_OUT_INIT_HIGH,
-					    "CS42L52 /RST");
-		if (ret < 0) {
-			dev_err(&i2c_client->dev, "Failed to request /RST %d: %d\n",
-				cs42l52->pdata.reset_gpio, ret);
-			return ret;
-		}
-		gpio_set_value_cansleep(cs42l52->pdata.reset_gpio, 0);
-		gpio_set_value_cansleep(cs42l52->pdata.reset_gpio, 1);
+		gpiod_set_value_cansleep(cs42l52->pdata.reset_gpio, 1);
+		gpiod_set_value_cansleep(cs42l52->pdata.reset_gpio, 0);
 	}
 
 	i2c_set_clientdata(i2c_client, cs42l52);

-- 
2.37.1


