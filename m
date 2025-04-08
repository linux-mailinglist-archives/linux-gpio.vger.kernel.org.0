Return-Path: <linux-gpio+bounces-18401-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F2EA7F256
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 03:41:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1F6B43AB8AC
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 01:41:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5526724C08A;
	Tue,  8 Apr 2025 01:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="XfftPc0y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011069.outbound.protection.outlook.com [52.101.65.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8222744E;
	Tue,  8 Apr 2025 01:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744076506; cv=fail; b=iwdDvg1pxisAukwpmxe3wTTA/mWgYb9wiNQ7fJCbgHjnK4CmoztGJlN95fRD1xqnCKRBryYGdwR0tLKYV3IdYcUyukgfkVlcDuOSDWt4P2k3j3/DOakue6zpiL2BeeHKRXASpfAxaxo4rUEDHD+gkd/3A1k0Cf5II2nVaJ0PwFU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744076506; c=relaxed/simple;
	bh=1o5x+KX0xgNVw5wDC+GMF01F18IYCuVvHuREM+xjPgQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=NiiiuVD+GwvefFjIxasfUCiVtDQUt4V3uurQwlVUHJq5iS6c1mdBJjl1qhxkhmNUsRk+xIG+QoGEYS8qaRnxRx3sWn7ZCbHbPhMKKZ4RpJkVCJ6O7WmHWM6+RJdYfYSvf8GQYglqaL1NHnEDSPNms5FsBJZI5X4G61XnKr902L0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=XfftPc0y; arc=fail smtp.client-ip=52.101.65.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y0UNA3ajwcqNereOEx0/uFkVWEZhBxIN2R3ldmT/8XynxPCyLgCLgY6YkZJ6yOGjBEOzoy8SNL57p/MpLONwzJLw4RF8UCQqdy0w7aCDTzqkg9+A1bz6RKBpKJqRP432iq1Lm6y69fPmuRFG0F6hiv3vJwHdEHX6mT4CZ97XMfhqoW5e+59MYQ+hR5/qONWTFpTyukR56pIkXPAp6QRvu8uqxBG/ZrrUy6gwh8V02UQeodlUrCZBwJ7CFy6jSELdlmtaqoanu0KBEVif/4fpxITxPeqqZGztz4YMC6LXS112b/8OxkDDaSEZwt4Yt5BCzPru8Z6uY6cFrCWkAdP1HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OdoAPY/sUyxCMCaK082qQ7k8A2vCvUk1kF+c3PHcnjY=;
 b=RFCU6mv/HPcOkpuREz7jAcuD8tXP6Dey6C3SxRR0nLfyGi8qxXkN42B+Px+KgpCfMWCP5nZkJvLqNoJMFzmIARQyBAqtCf8BLMPcG8t/+SlP9xMSqbVE0gG7G1DgpPpRdpNj6l9+rbj8FIvdCTdH/yVJZqhZzTyFHlqIOUWZ+X5gcUXNbyuvcC1D8aNvcWlPCo5dHv4jqFRIKtWmyzEtKvntJtreTLy88GatJqu+mh715PjBjQup4wlTcZjVbs9Ed0eZR5+hdy2WO85KF1o6fGeAj2RxWwYHDb/gi7MvTW5LTQ3eVXh8W0uFOljFX3GQBoVhiZ718VuKyJEJqaDJag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OdoAPY/sUyxCMCaK082qQ7k8A2vCvUk1kF+c3PHcnjY=;
 b=XfftPc0ygN0OmserHchAagFu7o/S72sAL+8ZQ1JpsAI7jJ/JJw+R0+KQ7IAmXeeWPlzvPjyf2R9+pgWsSz3zQ4oNXTmGfO0qHaLDMpQ5XMKP2MREsNwEpjvpse9YfpzUV4ob/kjR19GDI8AmMQiNeW2mYmjo/ZIU+0mxm+yqIif3uAayo/qZacxEHwYNhQV6yo5qPrvcEcTycrT8Te4Eg8rAlDkISpUoN3L6C20XKhtV6KjqViPIEaXOXLqi1xT+OqdQ0dcxtHh46HNcj5IY7CWtne3Tokvk64Toj+0etQ8IckOM3jdpxqbzSxkZFI3gi991HMKra+f7xV8Md7EuKQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GV1PR04MB10583.eurprd04.prod.outlook.com (2603:10a6:150:203::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.31; Tue, 8 Apr
 2025 01:41:39 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%6]) with mapi id 15.20.8606.033; Tue, 8 Apr 2025
 01:41:39 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 08 Apr 2025 09:40:00 +0800
Subject: [PATCH 4/7] ASoC: codec: cs42l56: Convert to GPIO descriptors
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-asoc-gpio-v1-4-c0db9d3fd6e9@nxp.com>
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
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744076413; l=6895;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=AFsqk6hLyIvdhwha/1DpMl3RBCtKKRrXwbMQN2/uW1c=;
 b=tiv9uoylB13VhzcyWY9lLkfx3geqSYjaAW7d/ip1lDEqLNBaGd+5DJn4BZZJtcvrkikyhrOmn
 Eu6ZV96+9fGByqsKyTxF+6rjuPIzALwkOKwzrY1M/IbSxKYpZvqp3Gj
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
X-MS-Office365-Filtering-Correlation-Id: d182951f-fc9c-4f41-ded1-08dd763e8171
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|366016|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WkZjbmYzaFFlUUMyUXgwMEF1aWY3dVBZb2prUGEzdURuVXlDMmlidjcxeDFr?=
 =?utf-8?B?bGxEU2NtMVdZdVJXNW5kcjR6R3ZFZm95enNSeVhsRkpxdVdiZWZnVXZvRWw0?=
 =?utf-8?B?VFV0YzJPQWZsZjNydVIveFFvZjN2MWJDT3pIR1RjSGNUMUZJVmFqc2hZeTBK?=
 =?utf-8?B?R3R0eGNWOUFiRnBSQWI5ZFNwME1HSHdQeFFXSEsyNU9WVGJCUWtld3lHWnFM?=
 =?utf-8?B?Y3lQQVBSUDNLTXQwaE5DdkFDYWxUclQ1RUl0VGNkNCtqL3ZDQW1JVHIyYW1h?=
 =?utf-8?B?TS90QTFPdWlwVEw5aHBzc3RUWWxrNHN3azlqWVlVODVzTGJoYStWRWlmOUVs?=
 =?utf-8?B?b1lTNHUzYWhkNmgyVEFJS1IyN1FLbkZ6ZytqNkV4aFNUczNmMG9xSnJYNjBQ?=
 =?utf-8?B?UWJqaTVWYmlZb3UvNjZ6SUZ2L0RuUGVOeGtDc1JNZWZoRktSemZVTGFGSlRZ?=
 =?utf-8?B?UHk5QlhoaXFqbCs4Z0RqYWZmUFFjNXVLeHhOb3JoVGRDaTBHRnJmTVJWZ1R1?=
 =?utf-8?B?aDBMVVZKekY4WUFJbGh5NDZhZlNFazRIN3pqNmVqS0JUMXZWQ1dEdWNqUHZs?=
 =?utf-8?B?MWErSGZUSmQwWjlFcmdLblNGbWdVZUNOVDdCZ0craDFDWndGaDIyY2h3ZFJY?=
 =?utf-8?B?RnlJSEFTdmZMQm5RTHk4dHhGelkvOFpQVDdUdlZhcTdBZHFoem9ibFk2Qnh2?=
 =?utf-8?B?d0tyczQyUkUyelY0M0NrZmpDUnRQVXRoSDFMZElwcEl6WlVsL3YxWmF1NFBW?=
 =?utf-8?B?RXd5SCswYjJIUnMrcnFNNllrcGNkNmlOOS82cWpudzY5VDdHZUFGRXBVR3M2?=
 =?utf-8?B?QTFoV2FLNGRMb044Z2p3Vkhyd2FGMEFuSUV2d2VVdjYrcEF2NytEN2NteTNX?=
 =?utf-8?B?QlRMUWs4NHlJSWZxWG95TlRTMkVhUkpSVWZERzdocEdSb2d0cWJ2WHJwQTJt?=
 =?utf-8?B?NEdvUUhZbytnVjhIYW5ldjFGUHc5Q3N3R0ZxVjZDNjk3Zzdjc2k5RTN0bnl4?=
 =?utf-8?B?R296K1gyazBWTmppSyt6MG44OVZRR3pnaC9BSDJRVUJDNEN6ZlUvdG9mdjhI?=
 =?utf-8?B?NnNtN2xLR3pVa2NqRmdTQUVDQThjeVBrQ1lEWkZkVGlkQ0Y1OURMNTRnNExn?=
 =?utf-8?B?U1BPbEduU1pkUUdWa3IySUlkdElWVTVnR1lwV2pKV1RsVnBHOTZDWVFna3gr?=
 =?utf-8?B?b2NKTWlLN3dhckV5Y0lXdTJuV0VkQUVTQ0YzS3JKc0RUd0J2RkswRUV2Q1py?=
 =?utf-8?B?aGxWNHZqT056QW4rNHFwZndZbVBna3lFZWhaaUR6M01rSVFhUXdUUWpqeDQy?=
 =?utf-8?B?cnJocTJqMkFhQ1BWNTdIM3UvazZWTHZFWEF2ZnlnQkNHRkM5cTBEUXFlem95?=
 =?utf-8?B?Si9SV0liRGZSMkhYRDZCMVVuSW5WdFcySVNOdEdDTU9qVjBTQmxUdGU3eVJw?=
 =?utf-8?B?TEJJTkwycUZ6RUI0MXA3dTY4dHBPbmdFQ0xsczF4QVZ6TGpROUVhVFBjNFV3?=
 =?utf-8?B?T01CNkRLTUZZTDV4N1U4T3NETTl2dTNpek10TUFoNkl1OFI3WFVINU5lampv?=
 =?utf-8?B?WnowSTUwQ2JtVFEwNS8yTVV5TnUxVVkvMHhJZkxRODhIWFRrRm01dGRzbUho?=
 =?utf-8?B?SW9qNjdsbEl5aEVaUmNHZ1VRQWxNdmRzYVVsdStzNTVaa1lTWmFaYk9ubDha?=
 =?utf-8?B?L3hhQ1JUTzNnQ3FnK0crTlpoWDU2aHZqK202ZGJSRGxYcDh1bVBsRmx1Kzhv?=
 =?utf-8?B?TUhoRmh2eTlBSld6c0hvT0NlOHlXSkxoU1k4T3k4TU4zYVBnbVBseGw4em1P?=
 =?utf-8?B?WmpqQ25QaUhMYW9EY1VPZHowakVnR2xtNWdGeGNNRGttWDZaN0ZZbmM1WTYy?=
 =?utf-8?B?Vi9aSUpKOWZMd0dVVitnMm5zdTVXRW40cm8xT3VxVzhqK21rVWpZRGlhazBP?=
 =?utf-8?B?NW9mTVNXUUFiQzdlUCtVVGluL0hIVndMdHNQbk50UGFCQjBjQWhib1BLSW9D?=
 =?utf-8?B?QXBmNVY5SXF3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NU1iVnliVVhOTHZOMEJZRHdlMG5WejhOcEJ5VDR6MGlYS2FEeVBtT1hKUkN3?=
 =?utf-8?B?Y0puNVBRYUJvYkFtMEt2UHYzTmVVWXlVN0JURlRLb1ZnaEdNQ3FzZlhqUVJ5?=
 =?utf-8?B?Vmt5akl6bHkyb3VrQm50ZmRQOG5PYW9aQTF2RllTdkFVY2lyb0lNeHQ1Sk1G?=
 =?utf-8?B?RE9WSTJGV25BcVBrVkFiamdmdG9FTEdSdzJkMW5rcjVza3k0NGdrS3B4Mzhq?=
 =?utf-8?B?RXZLSm95cm54c3hqbm5PR2tmMXQya1JZMjl2MFREclJmdnBkdE80L0s0am5S?=
 =?utf-8?B?RHdYTmdpZTl6RVVBYjRIK2NEUU9XbEMwTlJ3WWZCZndQNzlHUHpIL092YVBy?=
 =?utf-8?B?SXMreXFFZFRncS92M01lRmVCSHc2b05HdVRVL2dpM3VhQnkwUkdlOWROMHhO?=
 =?utf-8?B?bE5JVGFxdFBQQVdSSzVlNWxtMWE5TVZnUFhCRU9McmNpdnVqZnorL3g2WDVo?=
 =?utf-8?B?SWhwOVlLTTF1SkxuYkZWRXhaZ1V4WCszaHVsQUxiQ3RkVm9LWDh6VnBLT2NE?=
 =?utf-8?B?QXd1ekIwSHB1RUMyeHlCVGdEaVIzSXVLYWJTNnZrNDdtUFdsL2U0NjRSMkRu?=
 =?utf-8?B?MFFDclBFYmdzRXQ1YmFKNlM2aHNnd2ZCckFUcmZaYnZHSG5PVk9qTkFoSm5N?=
 =?utf-8?B?SkhSWUNnMHNMYXdFZUpLbW5nZE1FUXliamhVQ1NaTFhjWUlKdWNMNTBZaFdK?=
 =?utf-8?B?REdXY3B3K1N6SkxYSlFwU1JSL0dSTjRPZi9mMG9ZM0hFVlpFNW9qbThNWk5M?=
 =?utf-8?B?VWtYZFBLSTQ1SFM5ZnQ3djBXSGgyOGhIYVF0aGl0dWhsTjlyMDlXWFdQU0c1?=
 =?utf-8?B?UG1ZQXVnUXNEeGRYanJUTGVUTkpxRHRyQ0NjUDlSL0NkTjlIdVgrcXBsclAr?=
 =?utf-8?B?Q0g5OXpHWm1RVUxPbURlSlovOHQ0OGFJaUJYVW05ekFwR2szVTZ6clUrREtG?=
 =?utf-8?B?ZytoS1lTV09LdnU3ME5Wc2NUTE5aN3ExRlhkYWh1VE1aanN0M2g3NFVodWw4?=
 =?utf-8?B?ZHVuMkFsSnF1cmQvWHlQWW04a2ZMQ2V6UHZodEFiVUJiZFdTTU1lcWFBbTBu?=
 =?utf-8?B?OW1yVUcxUzlwb2l0bzFkQWZTNHRKTHFFeE1QWElZS1pVWWVpenFSMVU2bTQy?=
 =?utf-8?B?OXdScDdWZTIxT091OHFxTURVRkhTT3Nrb29UdzEydHZHTXV6WWNmalgvRXFE?=
 =?utf-8?B?YmdNYVIvdGhacy9xaGMzeUxlOXA4cjQwVG5TZThURC9LSWxmdFREU2poRnk2?=
 =?utf-8?B?U3NEUFBQajJPcHZ3bk02KzRoeTlDZS9UQlQvZjlWNUN0VklQN1I1WEkrSmdo?=
 =?utf-8?B?aHg1M2hqaVJXSzdyRlIxY05jTE93NEdPU0NYa3lCNnY0TC8rUk01K1liUlM0?=
 =?utf-8?B?dmhtRE4zYkROQWV2K084czZ2R2RSWG5Rd3F2Snc3WUFML1ArS1lPd05XOUU3?=
 =?utf-8?B?Yk5DcjdWdmJOZUcwM2VmMWNIS1YyN2tRSEdBNFU4Yzc1d3kvaHpoL0dqY2I0?=
 =?utf-8?B?YlY0azNObjZOaHVJK0tqODFqaUhhaCswTytIMnhyK0hZYUgxZEsybEdPQWtq?=
 =?utf-8?B?cy91OTl2WGxxdnB2bGY5M2hBYXh1Mk9CNmduVE9tQmRUZTE0Wmh5ZXFYVWRV?=
 =?utf-8?B?cHlhdCtwUjRCMmFpUlZaWW9XSklncVBCbHcvVlQrck1uaXhCS2RSbXJiMGh6?=
 =?utf-8?B?ZmlkQjhPdnNCaGhGQU1jUE1QTlhyOTVoajFIRHZXME1JUW81MHEwdXE0L1F0?=
 =?utf-8?B?WDhpQWFtaG9VaTcxTncxcllYd1psZWV5TndEemVodzZpVVltT0gwOGQ1ck1t?=
 =?utf-8?B?UTBiemM1czRxTnFnSFJTcjI4ZTZTd1VVTFMyR0Q4K0swTUFnRnRjMW5pWnpM?=
 =?utf-8?B?VFp5M3YyRTFMaFZUckFyb3ZMdllTSlNYUnFOcEZMM3puL2J4WmNZUjhkMjdC?=
 =?utf-8?B?TWlSWW8vRk5jWG8vT0hubmliN1pHL0FjVFhTNFdVMmxaQ1AxcFNKT2twdWww?=
 =?utf-8?B?YnF5Ui9QbGVtQzVhSVllOGhyaTlNS01PVnZ0aEpRcklDZHV4Nk55d2FpMDlh?=
 =?utf-8?B?dklMUGRVcTk3R0sxWUo3VFNHeGtMMlVLWWFpTCtocEVYRWo4bjVMc3BOTS9y?=
 =?utf-8?Q?dvDx3vl/ludaU45+PWdF93JcZ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d182951f-fc9c-4f41-ded1-08dd763e8171
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 01:41:38.9329
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B0+xeXN7E0iIudnCJOvWPonw4AA2T7vjhsksycH+qQ9OHP/edipK6lMOfhYYv5uEMovgYklqxEjV7Xb+zULjbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10583

From: Peng Fan <peng.fan@nxp.com>

of_gpio.h is deprecated, update the driver to use GPIO descriptors.
 - Use devm_gpiod_get_optional to get GPIO descriptor with default
   polarity GPIOD_OUT_LOW, set consumer name.
 - Use gpiod_set_value_cansleep to configure output value.

While at here
 - reorder the included headers.
 - Move cs42l56_platform_data from sound/cs42l56.h to driver code
 - Drop sound/cs42l56.h because no user is creating the device using
   platform data

Checking the current driver using legacy GPIO API, the
nreset value is first output HIGH, then LOW, then HIGH.

Checking the datasheet, nreset is should be held low after power
on, when nreset is high, it starts to work.

Since the driver has been here for quite long time and no complain on
the nreset flow, still follow original flow when using GPIOD
descriptors.

Per datasheet, the DTS polarity should be GPIOD_ACTIVE_LOW. The binding
example use value 0(GPIOD_ACTIVE_HIGH) which seems wrong. There is
no in-tree DTS has the device, so all should be fine.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 include/sound/cs42l56.h    | 45 -----------------------
 sound/soc/codecs/cs42l56.c | 91 +++++++++++++++++++++++++++++-----------------
 2 files changed, 58 insertions(+), 78 deletions(-)

diff --git a/include/sound/cs42l56.h b/include/sound/cs42l56.h
deleted file mode 100644
index 62e9f7a3b414f6d1bcb651b22f7f8bd1f29b0eb3..0000000000000000000000000000000000000000
--- a/include/sound/cs42l56.h
+++ /dev/null
@@ -1,45 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * linux/sound/cs42l56.h -- Platform data for CS42L56
- *
- * Copyright (c) 2014 Cirrus Logic Inc.
- */
-
-#ifndef __CS42L56_H
-#define __CS42L56_H
-
-struct cs42l56_platform_data {
-
-	/* GPIO for Reset */
-	unsigned int gpio_nreset;
-
-	/* MICBIAS Level. Check datasheet Pg48 */
-	unsigned int micbias_lvl;
-
-	/* Analog Input 1A Reference 0=Single 1=Pseudo-Differential */
-	unsigned int ain1a_ref_cfg;
-
-	/* Analog Input 2A Reference 0=Single 1=Pseudo-Differential */
-	unsigned int ain2a_ref_cfg;
-
-	/* Analog Input 1B Reference 0=Single 1=Pseudo-Differential */
-	unsigned int ain1b_ref_cfg;
-
-	/* Analog Input 2B Reference 0=Single 1=Pseudo-Differential */
-	unsigned int ain2b_ref_cfg;
-
-	/* Charge Pump Freq. Check datasheet Pg62 */
-	unsigned int chgfreq;
-
-	/* HighPass Filter Right Channel Corner Frequency */
-	unsigned int hpfb_freq;
-
-	/* HighPass Filter Left Channel Corner Frequency */
-	unsigned int hpfa_freq;
-
-	/* Adaptive Power Control for LO/HP */
-	unsigned int adaptive_pwr;
-
-};
-
-#endif /* __CS42L56_H */
diff --git a/sound/soc/codecs/cs42l56.c b/sound/soc/codecs/cs42l56.c
index aaf90c8b7339dc7d9fa469048a56f38dca1797cd..8223e22dd1fea68e746151e637b611100f4e1a6e 100644
--- a/sound/soc/codecs/cs42l56.c
+++ b/sound/soc/codecs/cs42l56.c
@@ -7,32 +7,66 @@
  * Author: Brian Austin <brian.austin@cirrus.com>
  */
 
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/init.h>
+#include <linux/input.h>
+#include <linux/i2c.h>
+#include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
-#include <linux/kernel.h>
-#include <linux/init.h>
-#include <linux/delay.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
 #include <linux/pm.h>
-#include <linux/i2c.h>
-#include <linux/input.h>
 #include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
 #include <linux/slab.h>
 #include <linux/workqueue.h>
-#include <linux/platform_device.h>
-#include <linux/regulator/consumer.h>
-#include <linux/of.h>
-#include <linux/of_gpio.h>
 #include <sound/core.h>
+#include <sound/initval.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
 #include <sound/soc-dapm.h>
-#include <sound/initval.h>
 #include <sound/tlv.h>
-#include <sound/cs42l56.h>
 #include "cs42l56.h"
 
 #define CS42L56_NUM_SUPPLIES 3
+
+struct cs42l56_platform_data {
+
+	/* GPIO for Reset */
+	struct gpio_desc *gpio_nreset;
+
+	/* MICBIAS Level. Check datasheet Pg48 */
+	unsigned int micbias_lvl;
+
+	/* Analog Input 1A Reference 0=Single 1=Pseudo-Differential */
+	unsigned int ain1a_ref_cfg;
+
+	/* Analog Input 2A Reference 0=Single 1=Pseudo-Differential */
+	unsigned int ain2a_ref_cfg;
+
+	/* Analog Input 1B Reference 0=Single 1=Pseudo-Differential */
+	unsigned int ain1b_ref_cfg;
+
+	/* Analog Input 2B Reference 0=Single 1=Pseudo-Differential */
+	unsigned int ain2b_ref_cfg;
+
+	/* Charge Pump Freq. Check datasheet Pg62 */
+	unsigned int chgfreq;
+
+	/* HighPass Filter Right Channel Corner Frequency */
+	unsigned int hpfb_freq;
+
+	/* HighPass Filter Left Channel Corner Frequency */
+	unsigned int hpfa_freq;
+
+	/* Adaptive Power Control for LO/HP */
+	unsigned int adaptive_pwr;
+
+};
+
 static const char *const cs42l56_supply_names[CS42L56_NUM_SUPPLIES] = {
 	"VA",
 	"VCP",
@@ -1161,7 +1195,13 @@ static int cs42l56_handle_of_data(struct i2c_client *i2c_client,
 	if (of_property_read_u32(np, "cirrus,hpf-left-freq", &val32) >= 0)
 		pdata->hpfb_freq = val32;
 
-	pdata->gpio_nreset = of_get_named_gpio(np, "cirrus,gpio-nreset", 0);
+	pdata->gpio_nreset = devm_gpiod_get_optional(&i2c_client->dev, "cirrus,gpio-nreset",
+						     GPIOD_OUT_LOW);
+
+	if (IS_ERR(pdata->gpio_nreset))
+		return PTR_ERR(pdata->gpio_nreset);
+
+	gpiod_set_consumer_name(pdata->gpio_nreset, "CS42L56 /RST");
 
 	return 0;
 }
@@ -1169,8 +1209,6 @@ static int cs42l56_handle_of_data(struct i2c_client *i2c_client,
 static int cs42l56_i2c_probe(struct i2c_client *i2c_client)
 {
 	struct cs42l56_private *cs42l56;
-	struct cs42l56_platform_data *pdata =
-		dev_get_platdata(&i2c_client->dev);
 	int ret, i;
 	unsigned int devid;
 	unsigned int alpha_rev, metal_rev;
@@ -1188,28 +1226,15 @@ static int cs42l56_i2c_probe(struct i2c_client *i2c_client)
 		return ret;
 	}
 
-	if (pdata) {
-		cs42l56->pdata = *pdata;
-	} else {
-		if (i2c_client->dev.of_node) {
-			ret = cs42l56_handle_of_data(i2c_client,
-						     &cs42l56->pdata);
-			if (ret != 0)
-				return ret;
-		}
+	if (i2c_client->dev.of_node) {
+		ret = cs42l56_handle_of_data(i2c_client, &cs42l56->pdata);
+		if (ret != 0)
+			return ret;
 	}
 
 	if (cs42l56->pdata.gpio_nreset) {
-		ret = gpio_request_one(cs42l56->pdata.gpio_nreset,
-				       GPIOF_OUT_INIT_HIGH, "CS42L56 /RST");
-		if (ret < 0) {
-			dev_err(&i2c_client->dev,
-				"Failed to request /RST %d: %d\n",
-				cs42l56->pdata.gpio_nreset, ret);
-			return ret;
-		}
-		gpio_set_value_cansleep(cs42l56->pdata.gpio_nreset, 0);
-		gpio_set_value_cansleep(cs42l56->pdata.gpio_nreset, 1);
+		gpiod_set_value_cansleep(cs42l56->pdata.gpio_nreset, 1);
+		gpiod_set_value_cansleep(cs42l56->pdata.gpio_nreset, 0);
 	}
 
 

-- 
2.37.1


