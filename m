Return-Path: <linux-gpio+bounces-38253-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0yv+KX5mKWoDWQMAu9opvQ
	(envelope-from <linux-gpio+bounces-38253-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 15:28:30 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A5A669BA9
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 15:28:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=pcQwdRNq;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38253-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38253-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ACBF3307B57A
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 13:21:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7689409DFB;
	Wed, 10 Jun 2026 13:21:34 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011053.outbound.protection.outlook.com [52.101.65.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBC53409616;
	Wed, 10 Jun 2026 13:21:32 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781097694; cv=fail; b=F03i7EuDBIg+B5tx1NN2T1aP7vymHggA9io1y64b37H5U63MFMYLtkroAB8yhGQ6wHTcG1fSYN8hsGH9Gv7oYc/ueZxxYa9sHKznH/V+me6H6NwEZbvVt7gI9SAnMOf36n/Ra/uk/MZNFO+dEJ9ZgScSLYSeH0KhVu0hO++JNy4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781097694; c=relaxed/simple;
	bh=S7swCwZ7lOG+VHwMik343otu/2rnMABiENrAp+ZteTE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TW5D2cbqQohgmBP8X94UVZ3oDH7mTpXjkY+z2NhduEvu8qevJPKnVDTrnMeHJO0S+4DPvQBZDcqdiQ5fN4k0IUt13AJN2D4F5Fg5Dd8XbFECF1hTHV0s3qCog2jfRrrHwFB3a7gmeuUifOkeId9C7/s5AJ6bvljMqxqT6UQwcag=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=pcQwdRNq; arc=fail smtp.client-ip=52.101.65.53
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UBiXIGfFO++MeHad1+jvhVU4uhzirgmc7/fFKUdviTbEyKdq7yye4lwii3lHPEKGWbhBpFI+mIeMcLu+feCq8LgPJ60ZaMH6ptnCB9u/M+IETMfElrAtoNHELYqtP96EU00GSlf2XQbq272A4DmrGW1XztCHo0dWwaieZvk+uCmNfCCRK8Y4uRTCLAU+c8moBG6SCAHVbSk0fAQYJCc1U3vI6hRsQ0NmyovzzyhdoMOpMbN2/OF9E/oEWMbtnakrthGU0dQmqaI8c6p3JBdnqD4Fgufma3OurrGcWcbgfAP/VziIPBFboOL8ujRBONw5h3FspFAVQu4l4Fq2WS+ayA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7K2qfy7hoslASI73wn79MiDWsqT0yM1g3SvwyMobcv4=;
 b=p3ws38tKQAVW/bXCy2TEJpChpaMjl0Ng2N0TJ2f27S0Grgq7v1vbt+yCGSqoMFPWlQD41zBY+syTSJB9pZjdJ6y/F09MRpIJUNJwmVOZwtPtYi2/SK7tz2FIwqZB97MYBhxKdMeJRBB8NtEYFmUuD4w0Sz/L3lB1CxyZHqJ3vsB5oOmccOgCMK/oczoo4RxaPl4cIvxLzoYTLtreJcgd4AuIDaP2+n0U2OnH7w5oNVXf3I9iDFBSOaMY3aycqJ3S0Pminr2+Dm1O9hns/ryZYHNH2D/uEiU+gKtS4MuSygwmBkn756de9bgdiuApydZnWBr4pu1lgq5MIzpAfaAwHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7K2qfy7hoslASI73wn79MiDWsqT0yM1g3SvwyMobcv4=;
 b=pcQwdRNqXO8iweiBYC/iFOueaNEJNlsajHi0zYYWqNKzwCFgOaDw04W3rIw1dQcR6Ms34pvYoZ0JnksEKa7zIObfUdLpfXKbiKO38kdqseb0jcxLU9lagK4KqhOT0P+R/vEqrjD57NcuyH4vmUWbiwswjbnUMV8tlJn23mNbcI9Cqx/9ahl7p7WHda34aJsUYNEBndQzoyjGwBJB0t0UefpDJSMLW4D6eXv6D+F1NRgGjWv2J25W+Y/FoNxoTJfOIAweyXROEl+rAzhCWQd6m8n9+FvOKzdDh615popm+Cv3mNCGHLm0MPXZ09TtScd4TlQAmgwL+sIA/1LgVLOSPw==
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::20)
 by GVXPR04MB10112.eurprd04.prod.outlook.com (2603:10a6:150:1c0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Wed, 10 Jun
 2026 13:21:25 +0000
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85]) by AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85%6]) with mapi id 15.21.0113.011; Wed, 10 Jun 2026
 13:21:25 +0000
From: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
	Larisa Grigore <larisa.grigore@nxp.com>,
	Lee Jones <lee@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>
Cc: Alberto Ruiz <aruizrui@redhat.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	devicetree@vger.kernel.org,
	Enric Balletbo <eballetb@redhat.com>,
	Eric Chanudet <echanude@redhat.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Vincent Guittot <vincent.guittot@linaro.org>
Subject: [PATCH v11 6/6] arm64: dts: s32g: describe GPIO and EIRQ resources in SIUL2 pinctrl node
Date: Wed, 10 Jun 2026 15:21:16 +0200
Message-Id: <20260610132116.1998140-7-khristineandreea.barbulescu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260610132116.1998140-1-khristineandreea.barbulescu@oss.nxp.com>
References: <20260610132116.1998140-1-khristineandreea.barbulescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P190CA0034.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d1::10) To AM9PR04MB8179.eurprd04.prod.outlook.com
 (2603:10a6:20b:3b5::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8179:EE_|GVXPR04MB10112:EE_
X-MS-Office365-Filtering-Correlation-Id: aa71c31e-918d-4a4d-1d5e-08dec6f32c56
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|23010399003|19092799006|1800799024|376014|7416014|366016|6133799003|22082099003|18002099003|921020|3023799007|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
 PuZIsznBx+XYDKgJztMYE1gQzFu4NTcQ5pEVuEhaa0IzF0w8NJQGryefLxkgMl2BFr0s49LUrgHaZ+oOvwC0Ui8gOfcEsuUiK5wd5VSvlK616GyLCPGrsVgc3MmBnVs79Hfn8nAP202aWrEWwp37aDQzFc0QkTUH5Rv8R4tXW3Nk1dRt/2xyqlMulwnxdCrmEuQEbhwV83dbxOBY9jUEYMXgKzedWKDP7o0gGzVo7gkEkzS+DojRcY5XTR2c6PhzkCmV7nfxVg2Is0VlckVTG3g45WQGpR381Ub8Z9EMsPdhIjeZgc8efK+62dqQgSfZeVBwbqpYkvikuHVoq7Xx+IIer28DEV49N3A4WZArffg/gbv4/kirXF9VqLtwdSrqqMruEmyGRYCKWcNVB0RVLj0/q/5/1BpoyntAZd2rXsih0Ky47vpsHp0S1wdB+usuZxQVeulQLa4JmvJ2YNa+9LRLxZzdxbuiAy9WHdkqAvKcGF6e7I+SfmA+nxI/EPMqYFsKo8d6Aq+PgG80cZLRDMIXNz0whKmVaCBGMTfKFz49lqIQNv7OqrNAfH7sEEvNvZoXBPXgTj2nvohUbNhYRR45QGlOAB8WQQPcqP4MieWo/JW+xZ23bah6j+1z8ll7LPocmNt1qcixuENdp9DAMJjKkzmMSnpF0w/+APW2MCr0HfcaaBtIVEVXj795LBlXGPHJeOTE/HgNTtTsceIKPlZqYT5Dkk/wXchmUR7oUgw=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8179.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(1800799024)(376014)(7416014)(366016)(6133799003)(22082099003)(18002099003)(921020)(3023799007)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?L1B4bGtRZnlaTUdjbzZKM1NJUk1jVzFTb24rSEl5N2R6NUE3UWt6UzN3Qk1G?=
 =?utf-8?B?UGs4bktVa044WXRIT1A5Z0dONVJyUEpaakdLY2REQnRjNUpHN0xEOGY2Z0t3?=
 =?utf-8?B?WnBHSWZnVm5nbVY5clBEV1NDUFZYMG03V3BoNWcrMjJaTld1ZDBlU1NJSkRy?=
 =?utf-8?B?dUtDVVdBelRFNkQvb0V3SmZoUmg5bjN5aTMzdUpDYTE2WnAvWG5TUHh6VEpZ?=
 =?utf-8?B?bEQ0OHNCd0YzaXp1M25IeGZxQ2U3UGRRMTJLRWE2NktmS3BYazNQVjFsNmkz?=
 =?utf-8?B?NTh6ckJnWmgyYjdXNUg4TTRxUWovSUgzN2tobGh3Mk1mM2dKTFR6enZVc252?=
 =?utf-8?B?bEtBY2NoQlVKdHc2ZjlyMWxYMmpMRkt5Q0docElEQ28vTGpWTTM3eDUvSGRC?=
 =?utf-8?B?c2NlL2M2dkVPRVRBN2tFSEdnYmlJcGlFWG9EejdYYVlwVnI3ZUlJa3F6TEk1?=
 =?utf-8?B?eUNKMnNteE95UDJWeElBVGZ1U3BDSFhtMFlqeDBjZGs3b0J0WDhDSHdlaVdO?=
 =?utf-8?B?dnVnZnljWGNRdjMra2taSmtNTDlmRERmNWQzQVphZTYzVE1rTWd6eWI1UEhw?=
 =?utf-8?B?Q01tMG4yVTdCaEk0SGkzeEYzcm92WlFVS2s1NUVvM1RBaTdVbzNtVGN1MFM5?=
 =?utf-8?B?NzJBbHczTzJJRkJLOFlTWnE4SmhQTjJZWDV5RW40ZU0xSHUyTWVoNkRHMnNz?=
 =?utf-8?B?eDhUd3RGdEF5WXhndUlWMVJOTUhjSVR0aWlWT2xLZWIzdUFPNk9qbEZpbzFa?=
 =?utf-8?B?M0k1SDhVaVU4TGd6RCtiZk5UYkFQQ2JIMnh0Y3RuSEMxdllNNVUwTm5ZMS95?=
 =?utf-8?B?VHVMUDI0eDlhbHRzWFdqdFZ2a2lGYkhGM3dSb3N4bFVWYWozWjl1MytGTWhs?=
 =?utf-8?B?OWNrK3E2U0k4RmJMdndqMGpraXpiNFIrYWN3Z3B3TFIzYUFrTDcvVjQ2Y1o1?=
 =?utf-8?B?eW5sV1FUQU9KQzQyTmJ1NTR2bVZzdExyU2ZuR09YVGtzdXhMbDd3Z3NiVFM0?=
 =?utf-8?B?UDc1YmFldnFrUjJIQWVrUmlmcEFlQlVvRWk5UjNYWCttNnVDTHEzU1hNVnVi?=
 =?utf-8?B?VHhJb3JoZ2VES3JkQmxIZUJydlBKcGVwUStlaXpVMTVUUlVKRUZ1SVp3L1VX?=
 =?utf-8?B?Nm52bEU0Y1dsT29FUUxrWWJ1OG1KamdrcXAwRDJGMUp3K3QxSGwrNXcyVWN0?=
 =?utf-8?B?SDUvL1pMZzE5cEFPYXlGU2pDOXhNRnBzV3NGL0g0RW4vczVlemh0MmM3c2Ri?=
 =?utf-8?B?K1poUXJNeTFtQkl1Rktld3RVRTBHVG1CeWdOa1U4TVI3ZGp6VGNoM0ZyRUM3?=
 =?utf-8?B?UGRvd2ZCWUVRb2V3R0NaTEJZeDdoMm9aUFZjcFRLY2x5YTVwbFVBb0N5bWZi?=
 =?utf-8?B?Nks4N1ZvemJkR1ZLS0I2MEVUek91dzQ2NDhaZWl5bHZ5NTY1R1kxcHNQTkUr?=
 =?utf-8?B?TjU2RkQreXJ2djJTN1BpUWNKanpzclNwRWl2aUd2V3BnY1RBajVuY3JNb0xt?=
 =?utf-8?B?SmxVMEx2SWdva3JKSVZuR3prZnVWZ2s3TXJkaXFiSjNscG5QRTFsY1VXTm5C?=
 =?utf-8?B?K2Z5SUVtMk80M2k5cE85WmpabGJkeTlOUFJSR1E1cWV0SkVYTndOMkJWRnZY?=
 =?utf-8?B?QXhOZG9LSiswUWxaRHZhT3lzOXptQlhNZVV3STlSVjNjTjlsUXE0Yjg4cmZy?=
 =?utf-8?B?Mjh1K0Qya1VUTTFES1lmK2o4YytWeHhBU2hrWnVPTk1IeWloNjlnVFFvWEJy?=
 =?utf-8?B?NVNlWWQrZ3RnRkRkK0lvQ2Q0TkhITU1yS0NVWEY5QlFDaVpIY3U3ZGJULzly?=
 =?utf-8?B?UnNIcms5UDVuRDBCejV4NGxadzFaTGNrK1A3bWdrUldsSStybERuUS9QaFZy?=
 =?utf-8?B?aVpyNVdza0R3YTBUNVJBZjRDT0UrTHNaTE1JQzYxZG0vZEpFNFQ3REdRT2Rs?=
 =?utf-8?B?UVJzS2ZZTXZxNGxkaTJSdUt2OGpYTmdLL2RYMTZBYmtsU3Z4bjBYVHRuaXFq?=
 =?utf-8?B?b0JmNTcvV0R2eXgwZzNzcTNIUkZPN3lEdml3cVJRYVZIeXFqTVZjTjRRSkcr?=
 =?utf-8?B?UnRaTElxYjRRUmIrM2ZuSFZJL2RqUEJZcERoWG1seHhBT3JBenpBUjJyVVRi?=
 =?utf-8?B?cGxFTEkwYnltNUZIRGRZKzdDRUFrcUMweUcyWTYycTRoZXAxSkNTRkdNWlR2?=
 =?utf-8?B?YmwxSjJXaGJoL25melYvTCtkOE9NU3g2blNyd1RHNWtFSTRDRjIvSEpNTzBw?=
 =?utf-8?B?b2Q2TzVzQUZ1TW1ESGNQYS9lQ0U5cUFOVmdpUFNIY1JqQjVaalV3MmUzSFhW?=
 =?utf-8?B?WWNFS2RTdWlxOXVESmJ6RGJ3RmRrVC90L0RpalpLTEsxMGxpYTdRZmg4NTFL?=
 =?utf-8?Q?KxacElfgfqmRu/WSdwQmwQcpj1hZVd+yTR7yk?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa71c31e-918d-4a4d-1d5e-08dec6f32c56
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8179.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 13:21:25.7599
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wk6vV/0rtIl3rZCvrHc7Z1VucsW7p9S++CkshkVlt7dv3vYDX5TBsBQPJW6ZXeo/VbFC3BntJ9XzkrCnrGbWRgVvi6LZdXQrjHFy/ZPAtYS/uVdWSy7DqoxczIfi1cc7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10112
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38253-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:brgl@bgdev.pl,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:chester62515@gmail.com,m:mbrugger@suse.com,m:ghennadi.procopciuc@nxp.com,m:larisa.grigore@nxp.com,m:lee@kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:festevam@gmail.com,m:aisheng.dong@nxp.com,m:ping.bai@nxp.com,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:srini@kernel.org,m:aruizrui@redhat.com,m:clizzi@redhat.com,m:devicetree@vger.kernel.org,m:eballetb@redhat.com,m:echanude@redhat.com,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:s32@nxp.com,m:kernel@pengutronix.de,m:vincent.guittot@linaro.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[khristineandreea.barbulescu@oss.nxp.com,linux-gpio@vger.kernel.org];
	FREEMAIL_TO(0.00)[kernel.org,bgdev.pl,gmail.com,suse.com,nxp.com,pengutronix.de,linuxfoundation.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[khristineandreea.barbulescu@oss.nxp.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,NXP1.onmicrosoft.com:dkim,oss.nxp.com:mid,oss.nxp.com:from_mime,nxp.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 07A5A669BA9

Update the SIUL2 pinctrl node to describe the additional register
ranges and DT properties used by the updated SIUL2 driver.

Besides the MSCR and IMCR ranges used for pinmux and pin
configuration, the SIUL2 block also provides PGPDO and
PGPDI registers for GPIO output and input operations,
as well as an EIRQ register window for external interrupt configuration.

The driver supports both legacy pinctrl-only DTs and
extended DTs with GPIO and IRQ.

Reflect these resources in the SIUL2 pinctrl node by adding:
  - the PGPDO and PGPDI register ranges
  - the EIRQ register range
  - gpio-controller, #gpio-cells and gpio-ranges
  - interrupt-controller, #interrupt-cells and interrupts

Keep the hardware description aligned with the updated SIUL2
driver, where pinctrl, GPIO data access and the EIRQ register
block are described under the same device node.

Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
---
 arch/arm64/boot/dts/freescale/s32g2.dtsi | 23 +++++++++++++++++++++--
 arch/arm64/boot/dts/freescale/s32g3.dtsi | 23 +++++++++++++++++++++--
 2 files changed, 42 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/dts/freescale/s32g2.dtsi
index 51d00dac12de..f21c8d19bcfe 100644
--- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
@@ -3,7 +3,7 @@
  * NXP S32G2 SoC family
  *
  * Copyright (c) 2021 SUSE LLC
- * Copyright 2017-2021, 2024-2025 NXP
+ * Copyright 2017-2021, 2024-2026 NXP
  */
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
@@ -135,7 +135,26 @@ pinctrl: pinctrl@4009c240 {
 				/* IMCR119-IMCR397 registers on siul2_1 */
 			      <0x44010c1c 0x45c>,
 				/* IMCR430-IMCR495 registers on siul2_1 */
-			      <0x440110f8 0x108>;
+			      <0x440110f8 0x108>,
+				/* PGPDO registers on siul2_0 */
+			      <0x4009d700 0x10>,
+				/* PGPDI registers on siul2_0 */
+			      <0x4009d740 0x10>,
+				/* PGPDO registers on siul2_1 */
+			      <0x44011700 0x18>,
+				/* PGPDI registers on siul2_1 */
+			      <0x44011740 0x18>,
+				/* EIRQ window: DISR0..IFEER0 */
+			      <0x44010010 0x34>;
+
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pinctrl 0 0 102>,
+					<&pinctrl 112 112 79>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			interrupts = <GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH>;
 
 			jtag_pins: jtag-pins {
 				jtag-grp0 {
diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
index e314f3c7d61d..f5825881fd69 100644
--- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
 /*
- * Copyright 2021-2025 NXP
+ * Copyright 2021-2026 NXP
  *
  * Authors: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
  *          Ciprian Costea <ciprianmarian.costea@nxp.com>
@@ -193,7 +193,26 @@ pinctrl: pinctrl@4009c240 {
 				/* IMCR119-IMCR397 registers on siul2_1 */
 			      <0x44010c1c 0x45c>,
 				/* IMCR430-IMCR495 registers on siul2_1 */
-			      <0x440110f8 0x108>;
+			      <0x440110f8 0x108>,
+				/* PGPDO registers on siul2_0 */
+			      <0x4009d700 0x10>,
+				/* PGPDI registers on siul2_0 */
+			      <0x4009d740 0x10>,
+				/* PGPDO registers on siul2_1 */
+			      <0x44011700 0x18>,
+				/* PGPDI registers on siul2_1 */
+			      <0x44011740 0x18>,
+				/* EIRQ window: DISR0..IFEER0 */
+			      <0x44010010 0x34>;
+
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pinctrl 0 0 102>,
+					<&pinctrl 112 112 79>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			interrupts = <GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH>;
 
 			jtag_pins: jtag-pins {
 				jtag-grp0 {
-- 
2.34.1


