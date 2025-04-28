Return-Path: <linux-gpio+bounces-19368-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C2EA9E61A
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Apr 2025 04:11:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CDD013A99D2
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Apr 2025 02:10:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43978192D83;
	Mon, 28 Apr 2025 02:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="PhhapwVp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2074.outbound.protection.outlook.com [40.107.22.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB8351922DD;
	Mon, 28 Apr 2025 02:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745806246; cv=fail; b=pkGMGm18HU76o9xqix3skl502nC0BMAA/OmKBrYOeHDuSDSeQfiL06rQKMCU0A2KguarwkFvLR02en7fv5SQO1F80DFYVjeSlQqhJjjuMFiHvbA7gTsl2S+hEi3/Dp1HI8OY0lfgbRue+OUKBCTUpdkeGuKB+Q/MHlTFAm5bbEM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745806246; c=relaxed/simple;
	bh=6OJosQsgoZeVf+CAeFwBwJvt24FJz/Jjn4VZbw7iXjs=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=EKW/7XfNCCBB/7K76r79cLkYqo4btVcYmNXrmRNDjbV2phDWFtqvMXNtFc69TPAjA/VW7pTErY5SMISTK+uj/YakVW3Q5V35Q+5BnJqelDC/ngTqe+U6Ehd3ei/R8ddXU0CMv3mUgSgecDYA7RNZLtNbGqW2whyaPyw3r8P/SxE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=PhhapwVp; arc=fail smtp.client-ip=40.107.22.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=owE7vjySe89VyU1NXiI5qKp/+4eqkeaK/obNhnvi8phCto5jC16GYkZH6XBtQnJUoLBV6SINMpbDfUB5JvNIrO3/1i3pAQI2qbxZSItYqxwpowC1KOE4KDt7LufeH9lJuW0PfpXOvdPiWmIwm59Xki4TqxXSd5Ur2B/cLJ6tLm288WnhsRqjbyC3C14tJSl/0UnWMBJhnbYkGwy1wIn94wOZ0K14TpEtL7udtAKVJoiNRdQnTe9OcGGU6kkLr8k63L5zSfIcep4IVGW/95pwLZC0km1SxvOZTtxvUVhxuiw+aXcEq/6w14h+twdwl8J9zE8QVe61TwySmUYrbD+/Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cHnonqj6TqjEO+bdeR9PE2IVjJH1Z/oDWKT8HU7ATPQ=;
 b=PCPAwVBrvtZKwiI2E0FxA5nu7RXk1gtJ2URjSBAmZbVIOlbv/HiAoYY2CcorxE4mUmISvNEEhnnjXJxFbEsl9xKPUD6GGzBBvCQycaGpvtm8S5oefTmJonDFDv0HgmuMzKjIl8lQiDp4YjQz0WYIhkYy687kvV9k7i3KEOMj5/22bt8Ug+GSljiYQC01dvdiELjVlwCp+nrD4YtxctZhJ2e5EuB5wLVO7CsdByL46CEUI6fQdb6WFsJ+0niBPKJJpm9M6oKb060alZYo67TvFGBFhaiwum9J6yPb4DdNfS/O2Vvi1oxptLjKhVDxOIrXRSSjJpVJKwiWHV7oEOwssQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cHnonqj6TqjEO+bdeR9PE2IVjJH1Z/oDWKT8HU7ATPQ=;
 b=PhhapwVpyo7wa4hKOdZYtnuOD7r+BM0BQ5jpPvVjP8Ucg8D1Oqvo4UMHanaVhLlHZpjL+xsl3b1MzHUup7MIzyA19fUj1eld8p4IZXFxgRVzmkwb/1XZmlmgKlLVXllBlRPyqjysiF9ekZL1reXhbAGc2YZf418CetBsfG7C8/GgLHuSSZQ14grFa1Oi8rU6AnTqSet2CaF40hjU1t8jtDLmO6aNN9TYYBsr9qmJ4CSiClPh6qcdtMl19wnhGN10zhE8BORRSNhb3xubRTxeD1tgZH8nQqTY/lLGMAPt9ZTb4/gHlRjgpYqDmJbXpxeqbgKD0cb6hnGuYGEL4Xv0Og==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GVXPR04MB9901.eurprd04.prod.outlook.com (2603:10a6:150:113::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.28; Mon, 28 Apr
 2025 02:10:39 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 02:10:39 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 28 Apr 2025 10:09:04 +0800
Subject: [PATCH v2 3/9] ASoC: codec: cs42l56: Convert to GPIO descriptors
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250428-csl42x-v2-3-e8056313968f@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745806152; l=3502;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=y5bE1dUN9BJNDNAuO6eK1sD9+kDknDSsErweZYOv+qA=;
 b=s8V5A7KS7AvuDQk4wLX4F73eY3IGoxJLriXWYjhWEUVw2AkvCyWSMjMg8WlT5H7dFzqcYMpN5
 JQPrQFjR1fHDMwohoovre6WW728CGddg0BjqDvBujXO5Dkve74ieqy5
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
X-MS-Office365-Filtering-Correlation-Id: fad24309-cac4-479b-c386-08dd85f9df53
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cjVUL0ZnaTl2ZlRsZnowOFFrc1FoaDJqall2bW9BTnU4WHFJS2FoSDlFamMy?=
 =?utf-8?B?ZlRlVjFxMS91dWs1MVFKWTUrTW53bmpxcUNxODEzN3JDWXJGN0N2dk9PR2Nn?=
 =?utf-8?B?cENwblYzNVRFcWZvTDN4aWNmcmZuMjhoZ280Nmk2SWprVlh3UU9vSnAyWndm?=
 =?utf-8?B?c1Q4eFc1OXpKZnprUFhlZk9yd1pnS0NpcUsxNUNWTnF1SlZKd093RUdyTW1u?=
 =?utf-8?B?Q2tlK2V1ZWxrNUtZNTFUZWRHRENXUThZRFBobDJTWFUyR3RJb0oveUdmVzRN?=
 =?utf-8?B?RUk2RlN4djFZZUFTY2JxV0F4QW5nd0JCd3dXNEtqZER6Nm16OTVuYWJyK2lY?=
 =?utf-8?B?N3haOGc0NC9IampoSXlzS1UxMm1meDVNeW9xaU82ZUpxSFNlS05hZW5oWjVX?=
 =?utf-8?B?ZU5VR0piMUE1NDNzZzFFRjl4eDhJZGRUQlBLVHpVN25GMGt0aEY5WDhGOHhR?=
 =?utf-8?B?SWhjL0M3dWl2V0xId0tuR2ZzcHhpaEFOd2dIanFlM2lMQlllT1ZOOXQrek92?=
 =?utf-8?B?RjVtT29YTUNPT1k3SUtldDMvWnY5WDgwazd2TnpOSisxZmM2Qnd4OHN1Skda?=
 =?utf-8?B?a1VjQzlEVHdONUZldTRncnVWazRTZ3VXT3BoUm1jV0NrTXMvSVhkcVkvaG1C?=
 =?utf-8?B?WDBuOG9lMDZKRmJpcUFaTGQ3RmNOWWZUTGxRNFAwdkNlWk9OWVp5YVRNQkZx?=
 =?utf-8?B?NC9URkJHaEtJTXUwa1RnQkFzRVp4OWE2WFdYWk1DNThheEhmdHU3VWJ2TFRn?=
 =?utf-8?B?SjJtamRJY1N3SHRTdU05UmxpWlhkYWg3SHpnRENpdUl2Wm5KcWQyNmJibFBj?=
 =?utf-8?B?dGFHU0wxWEVVM0tMd1dPY0srMGIzYXBLTGdTeFpXVTBwY3E1c3p6TWFKTmov?=
 =?utf-8?B?RlUrUjFrSFBhV21ka3FYVFJXT2tMbmx4Z0VKdk8zMlBBS3ZIeGVndzZ5ZXA4?=
 =?utf-8?B?d2ZxYXJtdGZvY3Qvdzh0OFZrNWUwUWJpQzBlZFNaYVBmY3NUa3hSUW1EQjlx?=
 =?utf-8?B?emJ3S3FuZkd2aDJybFM1QkxkeVh1d04zdEdFeHdHdzhDQVA2dEpadWt1UGY0?=
 =?utf-8?B?SUFlV0NrZmJJWmFIY1d4U0YyZC9sMUZqNFo5U0xlMFppUTlXajFMdk5OYXJV?=
 =?utf-8?B?d2xYMTg5VVpMTlIzK0NYd2o3UmpaQmgyUUNsYStEUVMvUzlQYmhIQlZ1SGE0?=
 =?utf-8?B?RjMzeHlOM1JZRElaWXQ5dllFN1BEKzIwd1cvellNa3I0cDZBMWk5bUZUTTkr?=
 =?utf-8?B?ZHNqVjA1U3F2SzBuS0M0MGFOSzBCZmZTZlBTbkp4SVN5d29pRGZYZ3gxQWU0?=
 =?utf-8?B?YTBLQU96YzFaRUhuUGV0NTdxOEl6TEh4elFQRWFReUo2WWtSaUpGaTBIT2VM?=
 =?utf-8?B?SEJBS0c5ZkJrRUgrZTNPa3ZSdHJNSlNHOXMrVXNTWE96a0lKQ2VibUtESGR3?=
 =?utf-8?B?TjJoOEdhRnJMUnQ3Q2R0UTdLSWdiSzg4dU05Y2ljbC8xYXFZMlNiY0NvYkpo?=
 =?utf-8?B?dWdKbk5RQlJBTUJuNk0vRnVWeE1neGlJcGQzQk1YVWFqSE1IazhoblRyK25X?=
 =?utf-8?B?R3JNOEhSOVlmajM1TzdtL1Z1VG4wb1duY3dQWEVtc0xJaXFITEJDa1EvcDU4?=
 =?utf-8?B?UG1mOTRacXdwR256MlJTNStxRWFpTit4RTlVUHNva3dXMkJ0Q21SNnNERUJ5?=
 =?utf-8?B?a0d6Y2RhbTdBTUVjakMrOXdTYXNTZXNUanRTM1lDL3dmSzV5azgwQ1B5ZmJv?=
 =?utf-8?B?WTYrUHNkVHRPQW82SVZqM1NrRlVLc2tzeFZJVkZlWTVsTjBoS2ZkdHV3Z25M?=
 =?utf-8?B?cXFqZTQwVUM4alR6S2d5V2V0cjhJTDZ5Rm1raURLL2hSOWJycitTYWY0cGly?=
 =?utf-8?B?RGpoSmw0RXpkbStTc2xsRVZDbFBxKzg0bFY3YmdEWGxZbmdwc3IyVlJIQTAr?=
 =?utf-8?B?VlhOOGRlZkFWQk1WdW1UM1dTejNFdG5aZElrSlZNT3pqYlRoalQwOEJEUDg4?=
 =?utf-8?B?elMrdnRFZzZnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M0lubXhSOUI3VTFpMmhnQmx5bkhJY21BTDl3VHRnS2Noc2o2Vmpyc3FGY1V5?=
 =?utf-8?B?NlgrQkZUNXE5K1d4RU5kSSt2eEh2WkxCN2YwNXgzTnJrUlhucHE1cjBaWmJV?=
 =?utf-8?B?T1JhZW9CcDdTaDJaL2lLcVd3UnM4TkY3ZDU0WFltakRSbm9DMk5hdkdTSG02?=
 =?utf-8?B?VnhGaVR4VzNNZEVCWkY0YXF2d3h6YVdhazJIeWs3Ym5YMzZ2ZG5lc2RFS0hM?=
 =?utf-8?B?ajhmT01sbmZwaHJBZGlXQk1tSzY3UGQ1UytrUmp4cHEwR0RMT1YyZk4xVXFM?=
 =?utf-8?B?dGhyNjZKZW1jM1BDb0Jma1V0VlU2VXc4ZjdoMTAxM0lOcVo1TVN5anNJUlY0?=
 =?utf-8?B?eGRyMDJRYlRXOWdKUmIva3UwZTI0Qi9aNEhsTjR4ZmI0d3Qrd1c5SU9PSmR6?=
 =?utf-8?B?RUcrOXEvdmtnNEZsME9DNmRIUUxucFplNGRtYmhrTXlOL1haN05WSkhCZ3VE?=
 =?utf-8?B?cUxCN0owV2tYY0MrWFVtY1VKV0Z4RlAwYjF4UG04RTlJOFphajRzZzZWdWs1?=
 =?utf-8?B?OTFPQkpMQW9wMlFuR2JvYlBlZVExaTJkNkVFc0N3Z3piT1ozbXlQSWk0MGFt?=
 =?utf-8?B?SmRXNDFXdER0RGNtVDVYRTY0eXBFbEtzYTRQekJYaXJwbnBrd3ZmQSt0S1cz?=
 =?utf-8?B?aTJuWGhDb0syZGNNaGdKN1FsTEErdXZSbmhSVmkwUzZRZ3NxeDhtcGJIOXpZ?=
 =?utf-8?B?MHJ1YlArTTJQS2xITXRwWm5QNGN3QXhqVExGWitvVlI3UmxzQjRBZ054cjcv?=
 =?utf-8?B?YjBzTE51OGg2VjFyWEZmMUlVVk9BRDVnWmFYa25aOFU1WEJ4ZENRNnBMVEZ1?=
 =?utf-8?B?cURlNGZvTGVxU0xaMlJJTjBYMHlSUUE5dU5SclI0Rndscmtqc3lOK08zTHBr?=
 =?utf-8?B?dEUwVHdCaHNYbVVCdHdQRWk0SEFJckp3MnhqR2pWTUpUN2ZieVNyRTc1MHFj?=
 =?utf-8?B?WUZjeXZ3dGkrZjdoakZpYXQ0S3J0bW81RWk1cll0YkVxSFFIdjZlVGVNaHlo?=
 =?utf-8?B?Q3hlcVNRdDIwM0tWRFFhakI4dDNic1BuSHpUb3BUUXlZZTVlclE4K2FDWWdV?=
 =?utf-8?B?d0tlQmd6WVg4QnR1Z295aTlXcWRObzJ5T0huV2NhK1BlUlVIQnJGUUVyRjZo?=
 =?utf-8?B?Zk5PYXhXdnF2QXdWU0xERGpLZnJ0ek92T3l5VXM4b1Z3dDR3Z1Z4T1hSK1RD?=
 =?utf-8?B?RWdTRWcxTnJQbXBIbTQ4cmhPaXRQd1lCVjJpdDBFUjgwcGtUT2xScm9IUmRT?=
 =?utf-8?B?VmhCTlhvSFF3cEpyK21HbXRLSVRJaElLS3NFdERVdUtVWXI5RG9aK09qMWxh?=
 =?utf-8?B?VzZaMmduTXJxS0U1ZHZTMTQvZXVlVUh4b0tHOTJjd0h0WjNaNlNnNnl5ZEVy?=
 =?utf-8?B?TFVnOHpWbytZQ0QrL1pac1pwVjdOS0NKUUVZSXVrRWVrVVdBUG8xMmpyenJT?=
 =?utf-8?B?VWV4VXRRZUZNakE3T1R0MDlNUmlGb2JpNk0vcWtVcUM2RW9PcFBGeWtobnAw?=
 =?utf-8?B?Qks1U2xzY1c3UHp5dmhSSWVBYVA0cE1UaGp4eEZFTU1Zd0x3QlA0aXVDZVJv?=
 =?utf-8?B?SEZRODdsc3pEalJ6MVlBMmdURUQra3BpZlZUYWZJMWwyT0xha3Z5aFpTRmJ5?=
 =?utf-8?B?L01oTDZGQU1LNWEvaGViZkgzRm1Sak1XcTZQUm5rQkYzK3JTN2Rwa3RyUlMx?=
 =?utf-8?B?ZnJ4cEJoenBXbm5YQzdZbktRTStxQTVJMWVmUWlTUHlob0tIMGsyL084R25P?=
 =?utf-8?B?blJubEIwRmNGQzJwMTF0ZEhoeXBXQ2FoTEM3M1ZmaENMb0J1YVlyR3dWeXpW?=
 =?utf-8?B?OUYvTHNaeXZVN21vM1lzb2YrVWpDQXRGNUJPanM4L01vMEhhYXRvTHJmaEJR?=
 =?utf-8?B?aWdkZWMxVy9uT3g2c1JabnRJc3M2S0JFRGh2SW9aUnVsck1SLzRKWVJEUldl?=
 =?utf-8?B?QzZieXhkLzFxM1ZhaEcyZ3V6RDRaVkhyTVU1MFA5ekZYSlh3ampLellMRHNI?=
 =?utf-8?B?amFGQXRKalMyeXVEMjUrZzBWbWdOd0R1Y0dmK2NyT0VCaEVnYlR0bzI5SUF2?=
 =?utf-8?B?ckllc3g4WmpTYUNxZG9uRm9tQUR4QnM2eklkMENTS1NNNWEyaGNOSTZEQmZN?=
 =?utf-8?Q?Kg26eKerhkeBHSXn8SxMUsgdi?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fad24309-cac4-479b-c386-08dd85f9df53
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 02:10:39.7815
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ykst+NPs0OCXnis5laz0MEtvoR74g4YbNd8AhEYddOR7D3FNMO9beo6Ni3MgykwVfS4Ph0SNrAaLJMYCeIjk/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9901

From: Peng Fan <peng.fan@nxp.com>

of_gpio.h is deprecated, update the driver to use GPIO descriptors.
 - Use devm_gpiod_get_optional to get GPIO descriptor with default
   polarity GPIOD_OUT_LOW, set consumer name.
 - Use gpiod_set_value_cansleep to configure output value.

Checking the current driver using legacy GPIO API, the
nreset value is first output HIGH, then LOW, then HIGH.

Checking the datasheet, nreset is should be held low after power
on, when nreset is high, it starts to work.

Since the driver has been here for quite long time and no complain on
the nreset flow, still follow original flow when using GPIOD
descriptors.

Commit 944004eb56dc ("gpiolib: of: add a quirk for reset line for Cirrus
CS42L56 codec") added quirks, so the gpio request API will work as before.

Per datasheet, the DTS polarity should be GPIOD_ACTIVE_LOW. The binding
example use value 0(GPIOD_ACTIVE_HIGH) which seems wrong. There is
no in-tree DTS has the device, so all should be fine.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 sound/soc/codecs/cs42l56.c | 26 +++++++++++---------------
 1 file changed, 11 insertions(+), 15 deletions(-)

diff --git a/sound/soc/codecs/cs42l56.c b/sound/soc/codecs/cs42l56.c
index 559476f767b0fb628bae6ec2728226af315b05fb..98fa812bc07b87fae717d601561d4ab3b9ee6bdd 100644
--- a/sound/soc/codecs/cs42l56.c
+++ b/sound/soc/codecs/cs42l56.c
@@ -8,6 +8,7 @@
  */
 
 #include <linux/delay.h>
+#include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/init.h>
 #include <linux/input.h>
@@ -15,7 +16,6 @@
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/of.h>
-#include <linux/of_gpio.h>
 #include <linux/platform_device.h>
 #include <linux/pm.h>
 #include <linux/regmap.h>
@@ -23,7 +23,6 @@
 #include <linux/slab.h>
 #include <linux/workqueue.h>
 #include <sound/core.h>
-#include <sound/cs42l56.h>
 #include <sound/initval.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
@@ -36,7 +35,7 @@
 
 struct cs42l56_platform_data {
 	/* GPIO for Reset */
-	unsigned int gpio_nreset;
+	struct gpio_desc *gpio_nreset;
 
 	/* MICBIAS Level. Check datasheet Pg48 */
 	unsigned int micbias_lvl;
@@ -1194,7 +1193,13 @@ static int cs42l56_handle_of_data(struct i2c_client *i2c_client,
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
@@ -1226,19 +1231,10 @@ static int cs42l56_i2c_probe(struct i2c_client *i2c_client)
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
 
-
 	i2c_set_clientdata(i2c_client, cs42l56);
 
 	for (i = 0; i < ARRAY_SIZE(cs42l56->supplies); i++)

-- 
2.37.1


