Return-Path: <linux-gpio+bounces-19913-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7ADAB2D67
	for <lists+linux-gpio@lfdr.de>; Mon, 12 May 2025 04:16:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B7E91890B4C
	for <lists+linux-gpio@lfdr.de>; Mon, 12 May 2025 02:16:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E849253928;
	Mon, 12 May 2025 02:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="SAeJQ26x"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010012.outbound.protection.outlook.com [52.101.69.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A46202961;
	Mon, 12 May 2025 02:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747016157; cv=fail; b=Zh3EUdR6broLF2XJjS1e3ze7PT5WbA3/EK3aCOcXTqnWKB2HRCQIL2H/JtEdahKTS3r2ptFlaWTma5ojG8Ae6NE2ME/zqw/z0jnZdzvGc9H6kXj1778CenU18iTdLYHtno1Fmc1OJc4+RtAV3ISiktu3eH/T9NmHs8oMm2wFBJs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747016157; c=relaxed/simple;
	bh=m+rgq+wHWGU1fW+hPNv5rVJmedZE7CUD4DQ1fSDVAkM=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=VGyTgejnSweNrGgS6Ne9TWeVQmjVeX1hdVDH0YaUW9BfMPpFjdIJx2hLQ41SqU6kf78wA/DDGU8HLM6mzewYHpRWdNKb20t74rrImA+Mba9KIuwNrT3+tW9abuN0anR8p4hBJcA2DaCw75Ui7JBlyP3myMcWsDtNAPBv07uiaWU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=SAeJQ26x; arc=fail smtp.client-ip=52.101.69.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iMeAIXifa/01Ot5lEj2DKBAKTSZNRT0fR3qaJw2MH5KKQdJiU9eHrFxLA9WxoABW/41g7zgYxNvlM2CW+POUaQZzoafSVvu6wfJfdBD2geT+srsPc9E3ghZrB5xVNgzcxCV3uKa1z1qivVJGS5plHxi/Lq5Oawk2u3pdNUnAcC4v1d2aSCeO3jVpnMzZh+ZpaXGnUIzy55wJ/WpeQizd7uVX2r6KX+kuJAU2kdmnIHgN1kDQxhotNw/LWmd1EBnpREIYaRTr/N+SFgvZaBsrK6pFqgIiP/1ct5MgqNM8A50ICtEOJIpOafXNHVdiWRvnO3/efNkA1gSmvwMQcikjnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1CuqBEwHk4ZXDSL49IOmXi9+te0HFNuZ6DyJql7rw4U=;
 b=A6LK10Mw0MF6+n0kiSvR+TpQRKykD3VdudiLpcBmzjsorwHmXQywH4lf3s07wd6M+h7Pv/Td6UQdZttDwt5i0LqhzIioCIObgZmr5dMoY2ciuANxyQzAEw/w/d+AbML3CzsFtsgG7c105tlbxO7sak5IrLiCg4Lp1TFfaFrUd2/6RoTiTYrm9Z/1A8tXsRnTK3GPDflvhMQMPgubYP+QEsyMUgC1IFCVZwnHLaBtjnS8ZSQTjUYawzHnePYpsQTQ2dc+owwPS0L1QXYmEzNZstaoTtcjRVMO5FT2k3Fi0tBE1+WipJU54E4YcYPwz1DozW/FqA9tCU6JBYUaIEX/ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1CuqBEwHk4ZXDSL49IOmXi9+te0HFNuZ6DyJql7rw4U=;
 b=SAeJQ26xiEZ9nZask579HIgHSvHlE9rBDfhRtHtdLr98YZ0A7+UZi0Ww5nfmGlGyqDODKugBkoFdRYsZnrCO+5CHKXaCp4B7Ecdz/sqg48V85qc4lqhv0BgrzkjOZs7S+3j6rlk4KVMD7iHXLLFwbGV7yB4KUvqLPjH/llSYGynBe/U3zWUGHThkPNQe42W0YHWgM3k4sT2Okzr0fEkBQJFn4WR8VWAXz9htAPlfApIG6mych5iWQAIH1bJNlS3S8NRurKkrwUXGq+ePCNoWZxGxAkbZRdqatC2ud72xRWtyE376kZWjaGpwcwxagan03oJaMW97DB1yUzgM875uUQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS1PR04MB9240.eurprd04.prod.outlook.com (2603:10a6:20b:4c4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.26; Mon, 12 May
 2025 02:15:52 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8722.027; Mon, 12 May 2025
 02:15:52 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 12 May 2025 10:14:15 +0800
Subject: [PATCH 2/3] pinctrl: imx-scmi: Get daisy register offset from DT
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250512-pin-v1-2-d9f1555a55ad@nxp.com>
References: <20250512-pin-v1-0-d9f1555a55ad@nxp.com>
In-Reply-To: <20250512-pin-v1-0-d9f1555a55ad@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Dong Aisheng <aisheng.dong@nxp.com>, 
 Jacky Bai <ping.bai@nxp.com>, NXP S32 Linux Team <s32@nxp.com>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747016063; l=2703;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=E2mXekEs3EDmBHhfTq11r6IkRUMfnIXtutcGMM8YPgU=;
 b=ZTZoBIwElk4nKZVMkP1OExTbBTRe1Tgm/mzu8O2IDXv6KUXqD4oUH9QE2lHhlkZySBGVmsqOI
 josJBxWS4PeAWbusHmuYM6qw8keIc18p30S0jdXMb587hyQznqVEVhM
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2PR02CA0042.apcprd02.prod.outlook.com
 (2603:1096:3:18::30) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS1PR04MB9240:EE_
X-MS-Office365-Filtering-Correlation-Id: 9648d3d1-fccb-415d-aa24-08dd90faeb3c
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RUxXdmtDUU41MVFFQzVQeUFSZkhjZDNUVjF4QjdKMUFOdUpIMDBDUStjM0JM?=
 =?utf-8?B?UmF6U21SRHN1Qjk5b3lWaEJNM0l0UGlJWGx0K2xQWnFwYjArRGorNE5zWk5S?=
 =?utf-8?B?aGs3eHRiOTY5OWttNk9oOVhhbnluM2hvbXViT2RLSndiUkhkeUUzOVJRWWhF?=
 =?utf-8?B?T0pTNGt6Q3BKV0VOeVJOZE5Mb3hsK001cHU4V1oxWGFuRExXMCtFUU83QzVz?=
 =?utf-8?B?RHN4djRyWVdGY1ozeEFaVzBTUjVlN3QvbmVrSk10T3FvQUdFOXA1aHVxZnZ5?=
 =?utf-8?B?bjhlbytjenl0d2xpak5OTHJCelNxMU1oL1FjYWY3alViTEtXQ1dlTWFpRld1?=
 =?utf-8?B?WW1QdE9ZVjduTVJiZmQvNjg5U1lrY2ROMmdEcjRxalpJd2QwQzFvS3F3S25k?=
 =?utf-8?B?SWNoL3VSOXpZd1IzT2NNbVhIVElHYWFGUkR3aitmdWNySDdIdmNFNVlNWWhu?=
 =?utf-8?B?U0IraXNUMmxqNzlRTndEam1yL1ZreHlHdDZjWWRSKzhibjNRbWxtVkFDZXU4?=
 =?utf-8?B?dlpkRHVBNnZKVzZveHNpeTFrWjM5UEtjMW1kVjVITW9sNERWc2M0cFp5Z1E4?=
 =?utf-8?B?QTN0WXBocS85YTBJdzkzUlVHektnTXFOcmJscnVnT21CNnE5UzNwR2Z4SFBu?=
 =?utf-8?B?RFJ5M0VQcllZU0xYL0Z6YXNzdk1JUUtoYnlPSlVoYkpFRXgzMnU1OVFGbXdQ?=
 =?utf-8?B?dGhDdXVuckNVRElsYWRpNWxjS1M4YTExajNWT3c4Vkx0MFE1ZGJ3YUY0eUxG?=
 =?utf-8?B?Y2tTR3VKbVFMdjJTclFWaFg3WlVFbUpPVmhuVGs0NXIxY3ZCeTZkZmpTWVFo?=
 =?utf-8?B?dE9uWDc2ZHcwVklnbHdoRHF0NnFCRHdFN2IzMk9CMUF5NXpYWmNHaG1jUkRG?=
 =?utf-8?B?MVZycURnODJmdXRUV2lBRDBuNDZFT0hTZXE2ZUxPWEk0OEFvcHVhSDN2b1M0?=
 =?utf-8?B?Z3NlWjFZalJHWW44RUQ4Z2I4cHM4QXZMU2pabWYzR1hOTnhvdm5YeWl1S1Nt?=
 =?utf-8?B?UXRnTXIvTU9lMGUxclZQZ2JUSnFnWWZaSzYxNWQ4SnJhTHRtN0Jnc1ZrRHQ2?=
 =?utf-8?B?b2lrL2hIaFhqeGE4L1NHRUpGYitMWnd6S0xjQ0s5ZnM5d3ZhaWd6cDhTSk5r?=
 =?utf-8?B?Nk9zb2d6NXV6dDRud0kwSkxEZUxwUEFVSmlUL0tHUHdMZTdtMEVocmlCSk5p?=
 =?utf-8?B?VTZYWFhpM2RzaGJ2QzNrbm9OdXYrNklFOWx6Qit2NWpzNDd0emRyV1ZxWjE0?=
 =?utf-8?B?eTA5OWI4R1hUaEtlV2tGYXdDSWhjTkpxS1o2dUF4YWo2SHIxNFp5S3ZJejFu?=
 =?utf-8?B?TkkxV0x5S0VINHE5TGNoRzVQQ1pqcUJYbk1UN0haZFIvV2VIRXVhaUd1aEFo?=
 =?utf-8?B?MTVpc2NIYmx5aCtvMHozVWdPWEd3YnArOCtZZFp6UVhnV3EveSs1cjJUMmZR?=
 =?utf-8?B?c1lHVzQ0SVQwdzJ4SVJnWU1kcWRheXpJR0hoVFptOGpUL0xIM2FsM2Rkcytx?=
 =?utf-8?B?YzYvTnNyNTBWckQyYlBhaE1oMHhWWUMyVjFhdzA2Tm9wSXFQc05FYm01cmVT?=
 =?utf-8?B?SUNzaU9NbDhMY2YvZzhSMXdYK3FPMVNmWVhtWUIxSEJQUFI0bFp2RjVjYnZD?=
 =?utf-8?B?TjJmQ1lMZTVoT1R1SHYvNjg1cWlsb2JRWllWUkRZWG5sS1c5R3hrS01tSzl5?=
 =?utf-8?B?a0xIY0ZzeDlnWDRZQ3pydkdBZXN6bi84L2dWZmVpby90S1BYZkZtY2JwTS9F?=
 =?utf-8?B?d3VENlRvbkdXU0hyNWdFZDFoODVGK3VFczI1RURlcTBsdG9aRU1VYmhrNkNw?=
 =?utf-8?B?MGNUbmw3T3FpWUFwblgrcG5zNGhnVlQ0UDg3NVBFM2NGVVZwWkVGL0tCMUNM?=
 =?utf-8?B?cWcrblAwcVpXZVVHaUNRMWMxTzB6dmRxYTgycmc3KzBReTNRcCtOTmgzdEJn?=
 =?utf-8?B?RDVuSTVXMGNGdVhiMjVRai9oWFpXQWxNYWIxc3hnYkErTHgzUmVxT1o1WEtU?=
 =?utf-8?Q?2/qQtq79xE+bYbUfy4AzdmXp0Kr1Zw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OGxpMCtXS3llSlBzYXJSSDlSZUNPeEVhU0pjOUV2OW1TVHREZDhsK1JpZit2?=
 =?utf-8?B?UlNpNkZ2UEVUcGl3ZUdoK01JSldtN0drVEtJdGJGOUZtTjFmeHMwWlF2T1BM?=
 =?utf-8?B?dmphN1B4RjdrN0tPV0pSaWxxNjlPcUxKVmJVQ1JIaTU3MlhneEFORWNmaCsz?=
 =?utf-8?B?YjVocE5iS09qYzIySkRIMCt0SkNBTzFBSmxDU1dtQUpDTU9vWE80TVFBRFp1?=
 =?utf-8?B?YzRRQURBWnUweWFBZ2dqTzRnK2l3SDhxM0VoMVFzZUFMNnlwR3ljV2xiaS9U?=
 =?utf-8?B?TzBYQ1liTzdjd1RxYzMxdy90WjA5NCtSeml3azdaQ3Vtd2NJbE5uWDZNb0xY?=
 =?utf-8?B?M005YThsZk5HRk1kR3BLZ1BRVElmY0tBOGhrT1V2OEtFUytxbFB2SFRDUUNt?=
 =?utf-8?B?OW9oMU9qVmZ5djRhcWxsOGQveHg0UTBhbHlJeFdkS0kvZ285d2tUU0Y4OGZY?=
 =?utf-8?B?WVY5NUEyWnBZTEppNEl4eEpIQW9JaXpBUDVQb3psSy9ER0VyL2NaRzNoUVE5?=
 =?utf-8?B?cDdJZGFDTnA4bnJDYjJWbUp3cGpHdW5JSGpxMzRJZDVKTk4wcVcyMWRZRG9H?=
 =?utf-8?B?a3V0WGtOS0YwWDJlV0RudEhpNklWM09EMHJIWHJzQ041Yzk2VVFVQ3R1UDNM?=
 =?utf-8?B?N09zRVZ5andqdXZ5YndEaVZZeXI1YzhRMGVVYkFiZWJJTEhFamIxSm1adUNr?=
 =?utf-8?B?dFFKc0dzVkJ1UXErTGJvQ3lWSEluRTFKZHJGVHJEeWZxQVJrdi9KZWoyZks1?=
 =?utf-8?B?QUZIR0Z1MUREU1prcVdoRERLUzE5eGFRM3ZZOFpqY3N6VFVZUlhzQS9YcmV4?=
 =?utf-8?B?Wm02UnljWTFyVDZvWERTRmhVMXNNNWU5QytZblZXbTJnVlVNS3JzWFJSd3ZV?=
 =?utf-8?B?WFZrNkxWNldxS1M5QzZmZDVLNTR5ak53QUdpS0o5dWRqYnBlNlpMUVdCcE9X?=
 =?utf-8?B?VlBBbUxmV0xtMlZYbDhJalFzTW1BdWtjTWpaTEdNdVRNd2VxSWJyOGxrbW8y?=
 =?utf-8?B?QXRhOEF0M0NreTZscFVReHA2aXFJMExLeHYzUHVISmNHc2FLV2Ewd0ZMZFBF?=
 =?utf-8?B?ZjZ3NjlXb0h3Ky9kVWlDYnZRdVIzU24vd1pTSjNVYytuaDh3QVVzYmFOS3Er?=
 =?utf-8?B?bEk5aEU4blRVUU0vazF4VmdwdllCSFFpeTN2TCtvNkZ5S3B0RnJBdjY1ZWtI?=
 =?utf-8?B?R0tncWdCd2xPUnJ5dGM2U0VEbmpPczgwMlp4RjB2TjhIaDVaaHA0U1RKd3Ny?=
 =?utf-8?B?UzBvSjZ4MDJDNURLYXg0aGZ1bUp6Q1dERWc5SER5WXF4Y1JhYXdjYmZHcDFp?=
 =?utf-8?B?QWl0a2R5VGlpVEFPVDByT3dJWERVblQ2UXI5ZE1XK0NhSmlrQmM5b1F1c1BB?=
 =?utf-8?B?ZzQyTndETGt1cGRscWhvTkpOelUySEVmUXh0bmlucXBwTDQrTlE4OXlxQVRy?=
 =?utf-8?B?Sm9XUzVORk1CQnRrOTR0NDlGZ0YzRzZZeXMybmhEeW1PU003ekVPQSthYnhw?=
 =?utf-8?B?YVBQR2RxbWVNTkpROGtpRVl1K2cyQXM3ZmFyZ3ZWVHR1V20wK0V6ZWNnV04w?=
 =?utf-8?B?Z2MxU3EwY2FtNzVSRTlxQnVjbzdyWHV0eVZPcVM3eUJiZS81a3ZFcTRNa2kw?=
 =?utf-8?B?OG44K0VyeTB1SzAvM3h2M2d6WXRXd01Fd0o1bWpjdndLclJvZnBJMFZRZ1RK?=
 =?utf-8?B?bGtid0dRWU10WFBwSW95TzNaMllDTmE4M3IrMEVKd1N5S2w2NG5HZzlsQUcv?=
 =?utf-8?B?YXNIclVJZ2x5ZGlPNGYybDBBTzI2UEtiNVJMRVhRYTVReHZwRUZqVGdGN2Va?=
 =?utf-8?B?ZTZmeUI2Q0VDR3k0dFRIUzZMZStSWHlPM0REOHdNMEljdENpWm5HRkRDNUFL?=
 =?utf-8?B?Yy9nUHpCUzcrVldOemV0dXc1WklWR1RNZjF5WEcwdzZRMDh5R0EzMW5rVXEw?=
 =?utf-8?B?Y3FuSm9CVWtMa1doZUN6UEFkTHZzOXl0RSs5VmFRblRtclg1ckppd0tQRWtn?=
 =?utf-8?B?WEFmNHdSVXQ2VUJuYTc0SzZtMTgvejkzRWQ5VWNaSCtVU3BLbTg4SE8yMFh2?=
 =?utf-8?B?OEsyVGtsdWFnYzRNby9ucVcvNzlkd2xIRWY4cE5SNFNwRkVJa0NDTC9Eb3Z5?=
 =?utf-8?Q?AYap3epJhzQUYiyTfyuxdKTNr?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9648d3d1-fccb-415d-aa24-08dd90faeb3c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 02:15:52.0428
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5TYB+FELNhippQWrjsiDPeODofxSBFybHYva/LwiDKDjt/3hYfVQ18Qk9/wcZDfIHuE4wU/bbo2j5rkx0Y34+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9240

From: Peng Fan <peng.fan@nxp.com>

Parsing the "nxp,iomuxc-daisy-off" to get the daisy register offset,
then no need to hardcode the register offset in driver for new SoCs.

To keep backwards comatibility, still keep the register offset for i.MX95.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/pinctrl/freescale/pinctrl-imx-scmi.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx-scmi.c b/drivers/pinctrl/freescale/pinctrl-imx-scmi.c
index 8f15c4c4dc4412dddb40505699fc3f459fdc0adc..7c15244371c20e0d99b1802e480c39aaeeec495b 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx-scmi.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx-scmi.c
@@ -35,6 +35,7 @@ struct scmi_pinctrl_imx {
 	struct pinctrl_dev *pctldev;
 	struct pinctrl_desc pctl_desc;
 	const struct scmi_pinctrl_proto_ops *ops;
+	uint32_t daisy_off;
 };
 
 /* SCMI pin control types, aligned with SCMI firmware */
@@ -57,6 +58,7 @@ static int pinctrl_scmi_imx_dt_node_to_map(struct pinctrl_dev *pctldev,
 					   struct pinctrl_map **map,
 					   unsigned int *num_maps)
 {
+	struct scmi_pinctrl_imx *pmx = pinctrl_dev_get_drvdata(pctldev);
 	struct pinctrl_map *new_map;
 	const __be32 *list;
 	unsigned long *configs = NULL;
@@ -65,16 +67,6 @@ static int pinctrl_scmi_imx_dt_node_to_map(struct pinctrl_dev *pctldev,
 	int mux_reg, conf_reg, input_reg, mux_val, conf_val, input_val;
 	int i, j;
 	uint32_t ncfg;
-	static uint32_t daisy_off;
-
-	if (!daisy_off) {
-		if (of_machine_is_compatible("fsl,imx95")) {
-			daisy_off = IMX95_DAISY_OFF;
-		} else {
-			dev_err(pctldev->dev, "platform not support scmi pinctrl\n");
-			return -EINVAL;
-		}
-	}
 
 	list = of_get_property(np, "fsl,pins", &size);
 	if (!list) {
@@ -126,7 +118,7 @@ static int pinctrl_scmi_imx_dt_node_to_map(struct pinctrl_dev *pctldev,
 			ncfg -= 2;
 		} else {
 			cfg[j++] = pinconf_to_config_packed(IMX_SCMI_PIN_DAISY_ID,
-							    (input_reg - daisy_off) / 4);
+							    (input_reg - pmx->daisy_off) / 4);
 			cfg[j++] = pinconf_to_config_packed(IMX_SCMI_PIN_DAISY_CFG, input_val);
 		}
 
@@ -315,6 +307,18 @@ static int scmi_pinctrl_imx_probe(struct scmi_device *sdev)
 	if (!pmx)
 		return -ENOMEM;
 
+	ret = device_property_read_u32(dev, "nxp,iomuxc-daisy-off", &pmx->daisy_off);
+	if (ret) {
+		/*
+		 * To keep backwards compatible, new chips should specify
+		 * nxp,iomuxc-daisy_off
+		 */
+		if (of_machine_is_compatible("fsl,imx95"))
+			pmx->daisy_off = IMX95_DAISY_OFF;
+		else
+			return dev_err_probe(dev, ret, "Failed to get daisy off value\n");
+	}
+
 	pmx->ph = ph;
 	pmx->ops = pinctrl_ops;
 

-- 
2.37.1


