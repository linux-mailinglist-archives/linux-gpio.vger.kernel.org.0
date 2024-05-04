Return-Path: <linux-gpio+bounces-6093-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA9F8BBBE9
	for <lists+linux-gpio@lfdr.de>; Sat,  4 May 2024 15:14:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 25942282908
	for <lists+linux-gpio@lfdr.de>; Sat,  4 May 2024 13:14:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BCCF22EE9;
	Sat,  4 May 2024 13:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="CxNGfzcZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2059.outbound.protection.outlook.com [40.107.22.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1FC22C1A0;
	Sat,  4 May 2024 13:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714828461; cv=fail; b=iPQKWmyvb+2vvvg8xwN2URpTqK/LDJnnFdq90a4l/C0/4euMXqpE1iBTypq9a7fe9Cex+fc/TjAgVi5Tfy91rGlRF7zXn4mUuvieqXgSX4kNKy8JqdB6+pVzwMiZ0Gkl7MifWpBJBqMME/Z3EjLiosIeG93g6EUL1OWGNwDcENM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714828461; c=relaxed/simple;
	bh=klyd7TcZI5h0sPA/ott/7mG9NW3OBXly1KYgwl3L3hA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=X0f1pNk0Rs9DuRStvD16TrqRuEPsUi0lzAliVtzwaFercc6ey5FP3yl6MNkqoDRFS41++87viCmCEL1XIZKszSyI5P9nMKU72MGnzsZpMdmmhNZ5xBNhjrwlW92pNpgrlTuhqybn9c9X7dPbyZuA6kdsroKD/nqBi1RLiPAcG1A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=CxNGfzcZ; arc=fail smtp.client-ip=40.107.22.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e043KH9dCq8dWsmfeKQz3zMn/2C2bwJ7dl9LaOvScQd14Z1P3BuRUHiMQ4EWL2AX5BixlDRrF7G7hVqQ++bU27UsDQtNXIq+J25bfb1K+5Y4ewzDXjbek/UF1hq7yzVpFkX9i4zMiiBtcIwKWAFVxIzPXb51Ksfaf7FjCyQMPT1YNbluWlW0q5qZuVGhjNDDd6N1n8vftq18l6YfLwgDxYiSgzq1ARS3PPgXTGBuTD0M8dx2UgJcq6xWaWskZjYb1xbAg2lVRq0NJ82mgdVYvS/bLL6407xQ5iEbwcMgpMwkY2S/1aR7yKPX1fEKU5eesuS4tD18E+Nv1PVUQDRXUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xlpULG990sWFrI+9qxLt0ZBE85TdL60SLUPePmyaqSI=;
 b=O4Y2ScxgswofbZzRbVgTs64eSe100TK3S2nCZ+AafZ9bEEj7qu83tE2PQWUOfGYUt/0TDS4qPTzb+H2FYqHg4vtV9w5HZXKbXgofb6jXJ33H3SRRPoIyrRaCr/HXcAFG294xbPbrXOST5EWAojyL33MHs926WDQvsfy3zAqF9Uy4zGQi0sim7dbbyTuMaQsE1YZX5O6O+BLi2MBQlQ13uRGqmL+e2U8kB5iZhfv9964jflVaTOGLwKPUhRpShPW9m3TPQQFBcvfgwwlPZtLZRtjeS257Z4Wsg8DXsD0LG26zPLiNXKyuCwExzHKRMNFfX0P2j6yER4IOHXaRf4bl3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xlpULG990sWFrI+9qxLt0ZBE85TdL60SLUPePmyaqSI=;
 b=CxNGfzcZ5jiD6UiFRzRV/406Ja8hQdGwImmDedFo6vSUAQUvVkb3fzxh1GmvkJ1+XRFIqmXPR9HqH/CNFpIvjFpmwMpnfOiqD7kceQQxiLXcuwj/BAIIXKMeHxBq80IcdBY527TNY2zfTABkjJFsegOU2y5BtGpEDMU1DONTAts=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by AM9PR04MB8633.eurprd04.prod.outlook.com (2603:10a6:20b:43c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Sat, 4 May
 2024 13:14:16 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d30b:44e7:e78e:662d]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d30b:44e7:e78e:662d%4]) with mapi id 15.20.7544.036; Sat, 4 May 2024
 13:14:16 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Sat, 04 May 2024 21:20:05 +0800
Subject: [PATCH v2 07/20] pinctrl: renesas: Use scope based of_node_put()
 cleanups
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240504-pinctrl-cleanup-v2-7-26c5f2dc1181@nxp.com>
References: <20240504-pinctrl-cleanup-v2-0-26c5f2dc1181@nxp.com>
In-Reply-To: <20240504-pinctrl-cleanup-v2-0-26c5f2dc1181@nxp.com>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Dvorkin Dmitry <dvorkin@tibbo.com>, 
 Wells Lu <wellslutw@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Emil Renner Berthing <kernel@esmil.dk>, 
 Jianlong Huang <jianlong.huang@starfivetech.com>, 
 Hal Feng <hal.feng@starfivetech.com>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, Viresh Kumar <vireshk@kernel.org>, 
 Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Heiko Stuebner <heiko@sntech.de>, Damien Le Moal <dlemoal@kernel.org>, 
 Ludovic Desroches <ludovic.desroches@microchip.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
 Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 Dan Carpenter <dan.carpenter@linaro.org>, Tony Lindgren <tony@atomide.com>, 
 Stephen Warren <swarren@wwwdotorg.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-samsung-soc@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 imx@lists.linux.dev, linux-aspeed@lists.ozlabs.org, 
 openbmc@lists.ozlabs.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714828815; l=7378;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=rblCQQjgjZSJUmkJHlAJdcDG19G0fEKKnoN4VoqDxp8=;
 b=rP64dRmiJWkjbNAzDUBgxO/jiMdNGY2Dt53nxwhfN/1GpjWG/i9oTL6uo0n4rFB9bCsFKaLFJ
 jG5wo4Gqa6zAfFCB7rn9+S0tSvNdGYgf0P/NDnesEBdMWd+TqbHCddq
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2PR06CA0230.apcprd06.prod.outlook.com
 (2603:1096:4:ac::14) To DU0PR04MB9417.eurprd04.prod.outlook.com
 (2603:10a6:10:358::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9417:EE_|AM9PR04MB8633:EE_
X-MS-Office365-Filtering-Correlation-Id: abac60bd-c623-496b-f9fd-08dc6c3c19d5
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|52116005|7416005|376005|1800799015|366007|38350700005|921011;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VzRuQjkrQm90SVVYV29BWHk0ZDhDS1BVWnZIeCtUNkhwVmlBU1A4ckswN1Fh?=
 =?utf-8?B?b1lIMkFudlUvYlQ5QzdYcjRVVVZ6aUxsUnZ1c1JYZXRIZndPVm0vUEk3aU82?=
 =?utf-8?B?UXNaUzBKZzZuOWtudVliQTNpVk9memVhMWxQQkhQRXNKRWF0WStLTVBSWVVC?=
 =?utf-8?B?TnBhWHNTbkYzaXJIZGIzUWQwQzRzbEZta3dWUGtWVUhCMVlDSm00RGZCaHBt?=
 =?utf-8?B?TVdFZ3l6S1N2RUFOY282bHZGN2RFMW56OVp3UWh0T29pUGlWcEMxZTQxZkJo?=
 =?utf-8?B?dmphMjl1ODR0K2JNZWZ0b1BoNFR3K3B0MzR3RHFrVmJIWWNOd3k2VVltVThZ?=
 =?utf-8?B?c2NZVzRPdWJMWUVzU2VoRDJFOVptU01kdE1ZV3FyQU9EUG1iSmplbHltQkJt?=
 =?utf-8?B?Vk1hNENkM3gwOFM4SUl4RkRSU29lbmJuWmNHMkxCYXV4UGlxeWFHN29tYnZz?=
 =?utf-8?B?UUE0Z1RqREJNMDMxc0lQV0R4MnpJc1NMQWVMNGw3UjhVbE16Ulo3YWU2YWR2?=
 =?utf-8?B?cUV0amhRa1I1d282WFJDTGdzQUN3aXNsSlFzbmg4VGQyNGN5MHNzaDJxUXZk?=
 =?utf-8?B?aVpEMmU3ZnJNTmFZMVhJME5KYVp4SjhsYlFtenduNkdUTDJsbGlhV1FRZ1Nq?=
 =?utf-8?B?ZVRjelBCUlJ0U3ZnTWFmVmNJcXhmSnJsZzNScFFTcTIwUkdjTEsyemlrZEEv?=
 =?utf-8?B?WEd5U0xXZDRHMXNsTHRUTnZGN3ZnSXNwN2JYc04reVVEY0Q4WmhzYmdYampn?=
 =?utf-8?B?V01ROEd5WDRnbVNUb0g1bXdOdzdYSXlMM1FWeUV5eThVa041enk4RWxNR1cx?=
 =?utf-8?B?Y2pTeWtNU1drM0R6MHN5eHB3M0swTEJpZG1hVDA0YThjMy84K3czSDJqdDZW?=
 =?utf-8?B?OXd1Z1huREpONUVkNGwycmd4MTg2bytOMlBFTnd5NW1hbi80c00zekZvM1RW?=
 =?utf-8?B?SnBuTHJ3QWhmUkZhMFErNUwxdDFvUVlrNG1tSDJLZ2M2cWE0RUVqc2VSNmU5?=
 =?utf-8?B?VU1lWWFGN3lzNWI5aHRUM24rbktVeWE0NzZTSlR0ZUt1N1ZhU3A4NXFySk85?=
 =?utf-8?B?VnRlUXBpNFFRYzBhQk8rcE1hVm5VaWFLR2M4ZnpoM2N2alRUZEFjcGRqaXRV?=
 =?utf-8?B?Y2FtN3ZCNTZtQVBpSjlYM1lRdmd3YUs4Tlh3dUUycXZCV3VMbTlQeWk0T1ZI?=
 =?utf-8?B?ek9kVkd3WVhzZ0xCUCtNaHY5dHgxNTRyZ2szLzRPYWRONnU4OENJa0lGMSsw?=
 =?utf-8?B?c0hpQ2F1OVdRcGtseVpuZHFDVElVRVY4clBRSVZJVlBJRnhJRVc1K3pyTjJH?=
 =?utf-8?B?QWFzUm9ZRmFxcnBnR0tvdW5Dbm9xWjdFa1BpQ2RZa09wemxpMi9LMHdkN1pE?=
 =?utf-8?B?QWVJYnlpWW5EMnFkT1NPNnJRR2k0VkxZQmFxUWxiYnhCaGYwdUg5Zmw4RXdB?=
 =?utf-8?B?dzFtbVpFcnNrWHNwUFpkR0JlbzRoc0ZzdXNKaHlIQ2Z1UWZjNlJyaS8rZlRE?=
 =?utf-8?B?MXh4VkE2N3g2WHJPLzdjMk5ldTNpQ0VNblR2NEhnYkl6dWVUSzFXZEVpNnpT?=
 =?utf-8?B?ZFBSNGsreDJEWmZwcUtUTkRxdlpXeTkvdmFBSkt3WEtuUGw5UktSdU5qeHBI?=
 =?utf-8?B?dTN5cDdNYWw2Q1lhYlBIajY5aCtCRU5IQzJwWGVYM0hiNmdhOEFCVkRjUmRV?=
 =?utf-8?B?N3FLS0JSMjFVMTZOdWFqWXFEaFpoRXgzU2E2cUxhZWJQdVBvdmlLOE5JZGg5?=
 =?utf-8?B?d1BlN2tGTG4wTFRCRzBJNE5LS3IzUFN2K0l6eVNHcjg5MnV0anlyaGJuYzVQ?=
 =?utf-8?B?WERzdlUrbkN5ZFE5R2FXZz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(52116005)(7416005)(376005)(1800799015)(366007)(38350700005)(921011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZnRMN29MRGVLdUpReGl5dUlBZXQrQXZ3emVMZWluZ2IzM1ZrOGZWZGxtcWNs?=
 =?utf-8?B?UXhBZnFuV2M4eXU4dHQzb0Zua2lDc2VFZXlWZlU4SDJmZ1UwVXRWMW13OXhH?=
 =?utf-8?B?dU1QVUZCSFRmM2Z4QndTRm1rNXZraVNlSTJYQlloKzNVd0UxVzROTkxIeG9a?=
 =?utf-8?B?eTZET1dlWmxXNTVTQ0FwQjYrbGFxMm8rSFRnWTFnTkxsSms2S0NOUGVmbnpC?=
 =?utf-8?B?M2ZlRjVzRGpWZTlpaU9zVVZIaTlua1FrRmRaS3RYUk53NUQ3akg5ZU1pOW5B?=
 =?utf-8?B?WUc2V1g3Z1VJa0RXQU1nMXRZTWZ5dVNiVkNDdkJFSktVVFdzZHBIT3hJeHBG?=
 =?utf-8?B?Q3lJQWxGVGI4Q2o2bGM3WlUvY0ZSNENKRUIvcS9HRmN1ZUU4TEpPSU9pT1lk?=
 =?utf-8?B?ZG9aaXJ0YmljQzlOaUlQM0dxRE1CbmNIUW9NYmpCR3AyM2lrai9QNHRaeG5L?=
 =?utf-8?B?MW9HbkcxTFc0a1dGaEpWUTFKYjB4ekZSM3dybmcwZFdUNFhqUDdwQ0N1U1Rk?=
 =?utf-8?B?QzliLzlnZmZneit4ZkZ3Q0RpS0FLaUs3c25FTXlyTlRFZjFSdlVmMmZhVWJB?=
 =?utf-8?B?ZVZNeW9NU21uekVSakc1VUg4WVdsRDh1cnhHbXJQWVp3T2NQcXRMMTFnK25w?=
 =?utf-8?B?TjhoR1Z4V0dGNytaYkJuWlRTY0o1RzNGeFdkQzd4bS9nWUJ3V2NwTGNJV1Nx?=
 =?utf-8?B?aGxLUzlnb2tta3k5anY4QmJBMXZ5a3pNMGdOYkJlb0FNZGlraVFJeFVDb2pN?=
 =?utf-8?B?TWdZZW5Ob05NN21Wb2JHNWNTV2FBY09wangxeDI1cTJQV3lsWWZVVlJXU2tk?=
 =?utf-8?B?b01FV2JIMVQrL0ZwZzJrZ3dTUWR5MVptNU9oRnJFaWNKT0l4RG5yaGZQbk1t?=
 =?utf-8?B?NGR4K0t6TS84Tmo0R2orUTRzWmNRc1RDYjBtWUFsb01DNkhieHVQd0NiRDFy?=
 =?utf-8?B?M3RpYWpyV2x0SHI4M0s5NlBpeU9vbEhIeTg5NllaWnA5L0QwRlZGa3NjRlhx?=
 =?utf-8?B?ZExXbk5HTXN0YmI4RFdFSDJjTW8rZmdlRHB2ZldtcjYraGZBV05oV1MrZzdy?=
 =?utf-8?B?UzdUNStqbXVvMWFVbW44U2IwMitXb3M0Z0tURzU0RkNjYUlNZXlVVVo3b1Jx?=
 =?utf-8?B?UmRIK0liRTNmbXNwdXJMZW1jdWJ0U0lmbUZFU240TlM2VXNqV0NLaHJDMGxE?=
 =?utf-8?B?dUtsazNjbUw5NUhGOVJmeTZORHVoK0tCZkJtSjRvU1NNZlp4aVdNb25iTkFX?=
 =?utf-8?B?SC9YekxOS0VmY09HUzNSNEc5a29YSjVTN1Y4dGJiRUNQVUtId0dsbkhkNTg5?=
 =?utf-8?B?M2Z3VURZUzhMQWVLNktKNzhwekN3TUg0YUVBbXUySXZXMnA0V05zQUlRaDg4?=
 =?utf-8?B?Q1MrdXV0L051Z2VZc2dIbU1yTGt6SFc4bkcvcWhXVzgxcEJ5cDNIaUF1U1Fq?=
 =?utf-8?B?alZmaUJuQS9JRG5lZWxubnpvWUVISVUzYS92eGYxWnNyWXQ5Zk8wb1pKN1Vt?=
 =?utf-8?B?TXZrZjJXMDBJdzdWZG9MbklHV3lmY1JoandST0Z3RFBkNTFNVzRYRmszVmhr?=
 =?utf-8?B?WkJ3S1RUNHBzbEtvTGxLV0NNeXI4L0xTUzkxMVhPTmU4eWVabDNIYWNHSm1y?=
 =?utf-8?B?TzV4ck40K3QxNC9pcmtDdDcxM0xvSnZnb1RmMWxUTlkvMU9RZEdyWE5ZeE9x?=
 =?utf-8?B?TG5tWk05MmdDRWhuaEdGay9pYmsxK0FWUWFHWEZ4WnRDaGtDUjZZdEZwM29Y?=
 =?utf-8?B?TThDK250dVNmcFloLzRpbXhybnJuTlRBL2dMbjArWG5ydFBldENJaHpiL3Vt?=
 =?utf-8?B?a2VkSkJaOFAwVmNuNjhNUVcwR0VMU2pLeExYZzVHYnhDb3V3TU9DNktoMnRs?=
 =?utf-8?B?ZStIc3FEY1F1TTAwNkpEQnNCVUtVMStMNm81QUw3UDJ3Q3V6VGd6S0ZjTkQ0?=
 =?utf-8?B?cU1aWTBQMFJSc0l5NVR6bCtnZmF5RnFzMzZBU0FXNFdzbWxjQmx3ZjUrczNW?=
 =?utf-8?B?ZXVPbmtuM1JBdVRKZUQ3UlZmL3dGQ1pMbXVqZTZuYzVJRTY2YVpKbU9ZTVIy?=
 =?utf-8?B?ZDd3dUJ0ZUdHUHhLLzN1K2hudGhia1p3UlM1bFcySzNQQmQyYm1QN1FWTTAv?=
 =?utf-8?Q?AoFNHEYBxA0Y8/F9tv8Jgfwys?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abac60bd-c623-496b-f9fd-08dc6c3c19d5
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2024 13:14:16.8086
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D7c/JWrShKmGOa5H4afl1vGgxSkCzZarqCkczeKZcBRMQ0KdqvL8ItqXWU6PkgfribG/1Sy3XlXOpFVDaCef6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8633

From: Peng Fan <peng.fan@nxp.com>

Use scope based of_node_put() cleanup to simplify code.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/pinctrl/renesas/pinctrl-rza1.c  | 14 ++++----------
 drivers/pinctrl/renesas/pinctrl-rzg2l.c |  7 ++-----
 drivers/pinctrl/renesas/pinctrl-rzn1.c  | 23 +++++++----------------
 drivers/pinctrl/renesas/pinctrl-rzv2m.c |  7 ++-----
 drivers/pinctrl/renesas/pinctrl.c       |  7 ++-----
 5 files changed, 17 insertions(+), 41 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rza1.c b/drivers/pinctrl/renesas/pinctrl-rza1.c
index edcbe7c9ad56..6527872813dc 100644
--- a/drivers/pinctrl/renesas/pinctrl-rza1.c
+++ b/drivers/pinctrl/renesas/pinctrl-rza1.c
@@ -852,7 +852,6 @@ static const struct gpio_chip rza1_gpiochip_template = {
  */
 static int rza1_dt_node_pin_count(struct device_node *np)
 {
-	struct device_node *child;
 	struct property *of_pins;
 	unsigned int npins;
 
@@ -861,12 +860,10 @@ static int rza1_dt_node_pin_count(struct device_node *np)
 		return of_pins->length / sizeof(u32);
 
 	npins = 0;
-	for_each_child_of_node(np, child) {
+	for_each_child_of_node_scoped(np, child) {
 		of_pins = of_find_property(child, "pinmux", NULL);
-		if (!of_pins) {
-			of_node_put(child);
+		if (!of_pins)
 			return -EINVAL;
-		}
 
 		npins += of_pins->length / sizeof(u32);
 	}
@@ -986,7 +983,6 @@ static int rza1_dt_node_to_map(struct pinctrl_dev *pctldev,
 	struct rza1_pinctrl *rza1_pctl = pinctrl_dev_get_drvdata(pctldev);
 	struct rza1_mux_conf *mux_confs, *mux_conf;
 	unsigned int *grpins, *grpin;
-	struct device_node *child;
 	const char *grpname;
 	const char **fngrps;
 	int ret, npins;
@@ -1023,13 +1019,11 @@ static int rza1_dt_node_to_map(struct pinctrl_dev *pctldev,
 
 	ret = rza1_parse_pinmux_node(rza1_pctl, np, mux_conf, grpin);
 	if (ret == -ENOENT)
-		for_each_child_of_node(np, child) {
+		for_each_child_of_node_scoped(np, child) {
 			ret = rza1_parse_pinmux_node(rza1_pctl, child, mux_conf,
 						     grpin);
-			if (ret < 0) {
-				of_node_put(child);
+			if (ret < 0)
 				return ret;
-			}
 
 			grpin += ret;
 			mux_conf += ret;
diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index c3256bfde502..fc7f33d3c613 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -745,7 +745,6 @@ static int rzg2l_dt_node_to_map(struct pinctrl_dev *pctldev,
 				unsigned int *num_maps)
 {
 	struct rzg2l_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
-	struct device_node *child;
 	unsigned int index;
 	int ret;
 
@@ -753,13 +752,11 @@ static int rzg2l_dt_node_to_map(struct pinctrl_dev *pctldev,
 	*num_maps = 0;
 	index = 0;
 
-	for_each_child_of_node(np, child) {
+	for_each_child_of_node_scoped(np, child) {
 		ret = rzg2l_dt_subnode_to_map(pctldev, child, np, map,
 					      num_maps, &index);
-		if (ret < 0) {
-			of_node_put(child);
+		if (ret < 0)
 			goto done;
-		}
 	}
 
 	if (*num_maps == 0) {
diff --git a/drivers/pinctrl/renesas/pinctrl-rzn1.c b/drivers/pinctrl/renesas/pinctrl-rzn1.c
index 4b2f107824fe..e1b4203c66c6 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzn1.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzn1.c
@@ -404,7 +404,6 @@ static int rzn1_dt_node_to_map(struct pinctrl_dev *pctldev,
 			       struct pinctrl_map **map,
 			       unsigned int *num_maps)
 {
-	struct device_node *child;
 	int ret;
 
 	*map = NULL;
@@ -414,12 +413,10 @@ static int rzn1_dt_node_to_map(struct pinctrl_dev *pctldev,
 	if (ret < 0)
 		return ret;
 
-	for_each_child_of_node(np, child) {
+	for_each_child_of_node_scoped(np, child) {
 		ret = rzn1_dt_node_to_map_one(pctldev, child, map, num_maps);
-		if (ret < 0) {
-			of_node_put(child);
+		if (ret < 0)
 			return ret;
-		}
 	}
 
 	return 0;
@@ -760,7 +757,6 @@ static int rzn1_pinctrl_parse_functions(struct device_node *np,
 {
 	struct rzn1_pmx_func *func;
 	struct rzn1_pin_group *grp;
-	struct device_node *child;
 	unsigned int i = 0;
 	int ret;
 
@@ -793,15 +789,13 @@ static int rzn1_pinctrl_parse_functions(struct device_node *np,
 		ipctl->ngroups++;
 	}
 
-	for_each_child_of_node(np, child) {
+	for_each_child_of_node_scoped(np, child) {
 		func->groups[i] = child->name;
 		grp = &ipctl->groups[ipctl->ngroups];
 		grp->func = func->name;
 		ret = rzn1_pinctrl_parse_groups(child, grp, ipctl);
-		if (ret < 0) {
-			of_node_put(child);
+		if (ret < 0)
 			return ret;
-		}
 		i++;
 		ipctl->ngroups++;
 	}
@@ -816,7 +810,6 @@ static int rzn1_pinctrl_probe_dt(struct platform_device *pdev,
 				 struct rzn1_pinctrl *ipctl)
 {
 	struct device_node *np = pdev->dev.of_node;
-	struct device_node *child;
 	unsigned int maxgroups = 0;
 	unsigned int i = 0;
 	int nfuncs = 0;
@@ -834,7 +827,7 @@ static int rzn1_pinctrl_probe_dt(struct platform_device *pdev,
 		return -ENOMEM;
 
 	ipctl->ngroups = 0;
-	for_each_child_of_node(np, child)
+	for_each_child_of_node_scoped(np, child)
 		maxgroups += rzn1_pinctrl_count_function_groups(child);
 
 	ipctl->groups = devm_kmalloc_array(&pdev->dev,
@@ -844,12 +837,10 @@ static int rzn1_pinctrl_probe_dt(struct platform_device *pdev,
 	if (!ipctl->groups)
 		return -ENOMEM;
 
-	for_each_child_of_node(np, child) {
+	for_each_child_of_node_scoped(np, child) {
 		ret = rzn1_pinctrl_parse_functions(child, ipctl, i++);
-		if (ret < 0) {
-			of_node_put(child);
+		if (ret < 0)
 			return ret;
-		}
 	}
 
 	return 0;
diff --git a/drivers/pinctrl/renesas/pinctrl-rzv2m.c b/drivers/pinctrl/renesas/pinctrl-rzv2m.c
index 0767a5ac23e0..0cae5472ac67 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzv2m.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzv2m.c
@@ -388,7 +388,6 @@ static int rzv2m_dt_node_to_map(struct pinctrl_dev *pctldev,
 				unsigned int *num_maps)
 {
 	struct rzv2m_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
-	struct device_node *child;
 	unsigned int index;
 	int ret;
 
@@ -396,13 +395,11 @@ static int rzv2m_dt_node_to_map(struct pinctrl_dev *pctldev,
 	*num_maps = 0;
 	index = 0;
 
-	for_each_child_of_node(np, child) {
+	for_each_child_of_node_scoped(np, child) {
 		ret = rzv2m_dt_subnode_to_map(pctldev, child, np, map,
 					      num_maps, &index);
-		if (ret < 0) {
-			of_node_put(child);
+		if (ret < 0)
 			goto done;
-		}
 	}
 
 	if (*num_maps == 0) {
diff --git a/drivers/pinctrl/renesas/pinctrl.c b/drivers/pinctrl/renesas/pinctrl.c
index 4d9d58fc1356..03e9bdbc82b9 100644
--- a/drivers/pinctrl/renesas/pinctrl.c
+++ b/drivers/pinctrl/renesas/pinctrl.c
@@ -241,7 +241,6 @@ static int sh_pfc_dt_node_to_map(struct pinctrl_dev *pctldev,
 {
 	struct sh_pfc_pinctrl *pmx = pinctrl_dev_get_drvdata(pctldev);
 	struct device *dev = pmx->pfc->dev;
-	struct device_node *child;
 	unsigned int index;
 	int ret;
 
@@ -249,13 +248,11 @@ static int sh_pfc_dt_node_to_map(struct pinctrl_dev *pctldev,
 	*num_maps = 0;
 	index = 0;
 
-	for_each_child_of_node(np, child) {
+	for_each_child_of_node_scoped(np, child) {
 		ret = sh_pfc_dt_subnode_to_map(pctldev, child, map, num_maps,
 					       &index);
-		if (ret < 0) {
-			of_node_put(child);
+		if (ret < 0)
 			goto done;
-		}
 	}
 
 	/* If no mapping has been found in child nodes try the config node. */

-- 
2.37.1


