Return-Path: <linux-gpio+bounces-6097-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F1D58BBC04
	for <lists+linux-gpio@lfdr.de>; Sat,  4 May 2024 15:15:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA3481F22078
	for <lists+linux-gpio@lfdr.de>; Sat,  4 May 2024 13:15:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAFD8374FB;
	Sat,  4 May 2024 13:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Q4Jz55xP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2061.outbound.protection.outlook.com [40.107.22.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8DB374C4;
	Sat,  4 May 2024 13:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714828528; cv=fail; b=AryvWqtp7YdjoLkRLY4mUVKipCBm7LlSSehuZAEgKincTouvhYaWudE6S+C3kSVeN1SMYaA+MxWsktxpaZeT7CehlxEcBnLYY01aDtwllBlbUJCUlaPYknGaOZ/xmbgQ7LSLmzuOvXVwQdDmvX7MiVuchg8PeRTE2xEw1yM5UdE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714828528; c=relaxed/simple;
	bh=vjEL2SocH6lGT0TAwBIfY9y3UDdKYLa1JTfpR+eS2MI=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=kTysqc5GK2K6olGAbocV601QXNzM0cgMxbfX9sOWcwx7ag67lCDv7bj9gou3aMR/S81+pBjoc5ZZoGo7pXvRaWXBBp/Gm39OT3FZnnm7msEJLToz6YwrAKrPMRu4U1wZqsr4VoDzmZb/4MPrQzTqOnFnjidxRm4gaI0Mz17Aauo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Q4Jz55xP; arc=fail smtp.client-ip=40.107.22.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hRU9oD+gCI8AllMgq87kzYL6LXgAyv72q3OQ/wuyed31OEyiMWOvAbbwCe2VDTrMGg7Z21zT+QvWhPpvyATZZMARpENnA7ZqepQTlF59zLf/X/5AKmsBTq7oII/9pZCf4A8a5FXe+t/s4ydIlnhtAALAj1ZAHuDhPyqevcT9D0pS/vhtA1V8oQA3nI4y8DXqMbQpAdIQG+bAmklpviHJtaa7JL+EFiUXCq6rnh1KlJCM+36n4EMM/PaMbLznoADLf3DD1Xm7VspxiWLIQN0tuesytE2bO6iUuPFugXeufpsK5ZfKDIj7HMeAoGtj6duSvp7FYuPxZXwYr0gR7HzuCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UOvnEs+skM9QGzIMn0U2l0iY/qhwIQjWYjJlD4x3FDU=;
 b=ZQtFwx3xBDkDdEM7F4IIc7StjJF8bribsUK4x97ROf6xfiiuumqN/lvIh7FUz8Iu59kbTzrkml1QsvEM6yerGPDt6zeKLxPxQJAmbjQ5N+fBGpw1Id6veuETaP3d58OA/cA/fAJrHAnl4RU3DPIUXJRBfURgNkL9hpwMKkrGTVxE11hHopj/LbpBrpzYRHU4kGoyR/QKTrwg3lJ3nIEF12N9WrPjS1tGVUHdBXs1v+AlZZB05s5XqqafSvAW0WsFMQlc/3x0Mg8RmvUOPQ0XfQrGYpvU5TLE/WoO5evD3aNPKGs/C4+Ce5jawr+/iu+J74MUNt5OOPmTIHNKkvaXaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UOvnEs+skM9QGzIMn0U2l0iY/qhwIQjWYjJlD4x3FDU=;
 b=Q4Jz55xPVklCOEhMsIghTu/K3ZsdV8zlhwWv8DIvis7TbOkzUaaeOjLpP4fFECNj86SLMjx1DeNL3Nk+SB2N0h7fVfvvayuYmpqAUl5oH567Kmet+LwjgGAEtCb5RJAh7fyYnmONkciEG6hEXyTcmCRq0yjWkgehl/QCgbrVwM4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by AM9PR04MB8633.eurprd04.prod.outlook.com (2603:10a6:20b:43c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Sat, 4 May
 2024 13:15:23 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d30b:44e7:e78e:662d]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d30b:44e7:e78e:662d%4]) with mapi id 15.20.7544.036; Sat, 4 May 2024
 13:15:23 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Sat, 04 May 2024 21:20:09 +0800
Subject: [PATCH v2 11/20] pinctrl: at91: Use scope based of_node_put()
 cleanups
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240504-pinctrl-cleanup-v2-11-26c5f2dc1181@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714828815; l=2885;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=PFAUzME6mdXWvdeIt8xe3iTmfwle3TOSpNkHGUiPLOM=;
 b=ZSqBon2rMgrekfypu2BMfK1KhgN2I4TeLQnuA6cTenlBlAU32e6ztk3KfhwVMkDVeeE23HHUz
 fSXhosqCh2LAS4Z1TF9PJfbt7eER3+wURlcwJ8y4XASWKf8a+ucTYNC
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
X-MS-Office365-Filtering-Correlation-Id: adcae72d-abe6-4074-1525-08dc6c3c41be
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|52116005|7416005|376005|1800799015|366007|38350700005|921011;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d2d2alZMNXk1eDRUTjJDVDZsNTRYOGdTRUNycUNFbm5OY1ByZFJOZVAvb21O?=
 =?utf-8?B?ZVZRM2xoeXNJZDBUOVBVZ3MxcElUNktickYzMFNrRVpnVCtHbzRXdXpxOGM4?=
 =?utf-8?B?MW91MTEwd0pDK3VNOFV1dmNSNGNhVG1SMGdldXNhMTNRbmo5Z0dRekl2WEVM?=
 =?utf-8?B?dEJGZUM1aDNwY00ybm5FRkZvbW42RzhrRWFXUXVxTzI1VXp2cEM1eS9saHds?=
 =?utf-8?B?b0NYbmxZdk9tVEEzNTAzRENxa2t6WWl0SFJZajNrVTcvbDYrcnhvZ3p2Z1hL?=
 =?utf-8?B?SDlSUndFWGIvRmlZR3BKVXAwcU5ETjRUL0hoSzFQZVFqR3AzN0xXYXBQem9C?=
 =?utf-8?B?Q09kWExuSDRWcnl2aFgyVnN6bFg3WnQ2bU45c1BlQmpLeFluOEJxQjZzOFFR?=
 =?utf-8?B?dDRiclJGdkgveGoxcTJGRkdQRlIrMGFZTXF0eGR0VjFOMWRPM2VOWHNuWHkw?=
 =?utf-8?B?RklQTTk3Wk1JNEwzY3JsS05xeWlOYmFBZENsNDV4S2UxeVlYd0U0WkxRNW9Y?=
 =?utf-8?B?UzZUUDRJWVlFN0dqYVF6U09keDJNOUlTZm5kT29iSFVydzBHbUZwMmZLUDhZ?=
 =?utf-8?B?QXplYm9RVW92Q1picWxNREo4MkUyY3NnQ2NSb0k2U24wRFkwRlByZlFzWEl1?=
 =?utf-8?B?VHgyeTZxbFZzZUNCNDdaYjhKQnBVd0J0OWRIbHdlaVhwVnJMZ25RL0NXMGZM?=
 =?utf-8?B?U3pzSU1EdGNSMXVQV0J6Vnp5cVduL2RqNFdJcWViTVdhMVBsOFVIbFoycU1v?=
 =?utf-8?B?aDVvYXltWUVENExZK0pwQk1PTHBJTlNWNFhXZ0d0TW1BRVZWWUFZVnkzR3JC?=
 =?utf-8?B?NzZLUnFwS3lHd21GYVMyK1BxQmt0QlpuL2Z2dCtqQmxoR0pnNVFWM050Nkcx?=
 =?utf-8?B?MkhZS0NSbm16U2s4UExDVjFIZGRUMExEemJiTkcxWWN2SG9JYU5WeDhyZDNM?=
 =?utf-8?B?TjAxNkdLa2o0NkN2eEZFWUZHREpaOXVwek9vMWtkTDg4SXdPY3ZYT3cvMVNr?=
 =?utf-8?B?Z0VYUkVpUVNVeElrd0dHZk4rMytoa0o2MzhSZ29tOXZIckc3cDdsOUp2blNh?=
 =?utf-8?B?ajF0MGs4Zi9nNUtlbGFDQTBXTlA2V1RXS2k0R29LRkZvemo1ZElwd0tsSk41?=
 =?utf-8?B?Y1BraTdDeUJGWHhFT2xMZ3o0TDJGc2xQY2cxdnN2alZ1SHArRnlYUFQyVlc4?=
 =?utf-8?B?eWtKa0hIbEFFKzMvUE9XaFYrOVh5c0ZsaU91bmU3MGVGV2hGWTNSVC9sQWJu?=
 =?utf-8?B?K2lRcmJDOXJiZEU4YW1BNTAycHFPR091a1U4aVBOTlFyZTA0ZUdCQVAraGo2?=
 =?utf-8?B?aVVKSnNQcEMycGppV1dYb2NyNm1VRnVsZUVCLzAxeFg4WlJMa3FkdjROTjBy?=
 =?utf-8?B?clA0NUNTWmZhZHRVdlAwaFoxcXlaOFRsa1lJandvVVY2NytVV0ZXTzE5UFJw?=
 =?utf-8?B?VGZybmxhSXUwdVNXd1ZyVXRLcExnVDBUdGFKR3pvMFV2MnMxS2RJUUtxWnVu?=
 =?utf-8?B?N3Yyb3JYMmtSR1NaZ3BER3llbmZleUFKWHpzdTM0YUNXdWluU2R2SnZBT2VO?=
 =?utf-8?B?SDFFQytKY3gxNjNhRk9NM0lrNm51aXJrQnZxUjFteDEvaC9VOTE4Q3NKWktn?=
 =?utf-8?B?cHdOWEhiMlR5dUNLNjJjZTQ1U1lLN0puZHNpME05VUNqWElwU09DaXI4NXhC?=
 =?utf-8?B?bC93aWFMSzg3aHJNL0hSN2pKSE9GbzJnS0NmeXdKWmZpWFB4T2tXZTBjbEJs?=
 =?utf-8?B?cTlvYzRQRXVZRmhxd3R1TlFKdVcrb1h1OXFVdzQ1bGpSVnYycS9DKy9TdS9O?=
 =?utf-8?Q?AeNgSFXZ1D4SbbfRoC/28qHQUav1CRC/GCi+c=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(52116005)(7416005)(376005)(1800799015)(366007)(38350700005)(921011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TzV2RktubG96ZnVOQTFBK2djcE44bXpDeU53dVRQbVV6WVAxV1cxWXFkS2RM?=
 =?utf-8?B?dVRvUmVVajh2VmsxVmRKRnJVdlZPbmR2bzhGVytwMi9EWVVDM0xGZFJKa1BU?=
 =?utf-8?B?eklERXZ0SXVmaHNrbnFPOXQ5MmxpMjZiM01MZWFjam9ucWdkT2JZL3RpYmRq?=
 =?utf-8?B?cTdvdUhIdWVWWnlOSkFmcUY1QVhPbkZ3aFBYM0VrWHU4UEFEQjlTOE0zUGJs?=
 =?utf-8?B?M2tJK0U1TjhpVVczaWRLbG9nTlJpdnRkcnpmOFlvTzBYTTg2Zk0yYTcrQ0lP?=
 =?utf-8?B?TEtYeGZkb3BZaTM3UmcyWTZmVHo1RzBTdVhQcUxiZ3AzUThJT1dxUzQyT0Z5?=
 =?utf-8?B?K1ZvRnJHa0J4WFhWOGZOOXJLRU1JRDZYOXFsQ3lCcW4zMzIzdHJBMjNrczlO?=
 =?utf-8?B?VzhuRE1KT29CR2l5SkY0QkNScFFHTnd2WUN4Z0JDbXZjeEs1SzkxVXpYbjRt?=
 =?utf-8?B?UGFFZkdLdkpPa0J0WFlyOGRJbDg0bDJBa1diUUZ4OEtKemlmWGMxMG0welg1?=
 =?utf-8?B?cEpabzcwMUhKQUs3cjMybGdnaW16L1FmZ3NqcnB0enA2WUxyekZPby80YWlI?=
 =?utf-8?B?ckI1UjZCS1FDZ0hDY1dzUlZvK2hBZ1kxL3VRc3J3bW15eC9Xa25WYnFMTWs4?=
 =?utf-8?B?czA3OUcyV04rZFBNdFF0ZStDYlpBcGF3NytSaHJHbGtURVpmVlUxQXlNTFV4?=
 =?utf-8?B?SUlsMW1ENEducDE5ZitFOVNnUmJ4ZFRMK1ZDTkVOalUxczFmMDE5VkVBTWdJ?=
 =?utf-8?B?Y2sxczZXQ1dja2NCWUpBM25GT0RZYktaczU1RWluSmdsT3B4ZTVhdkxJMnVZ?=
 =?utf-8?B?eVpwYkFRS0FGQ0RsTldDOVp1dnU3eDhtZi96c1h2eWRtVXVYYVlmaysrL3F4?=
 =?utf-8?B?REJmYisxTksyYXdYd3hQeDNmL3F5cit1S0E1SEtsaDh4SDA5VGpqbi9JZVhu?=
 =?utf-8?B?SllaWTRlc3dCeVo4OVIzS3VqRndTSmZLOWxxNURyT0krcVQ2NmVELzdOVlBN?=
 =?utf-8?B?SjBXSHBuUDFDV0FGS0crSlgxNm05K1JEMkE1c2dab3dZNFA1cEJhNGhvYno5?=
 =?utf-8?B?M0h4ZnJabGRZMTQ1bG5WeFpsR2RMdWNsTmRzaGdjenk2TElXaWd1b1ZaV1Ur?=
 =?utf-8?B?dXZZYlJjcmR4aWFuWnAySWJMVk9VcnIrdGVDWm45VTVFUXVpaHl3TGRobVdY?=
 =?utf-8?B?Q1N4eEtoUkd6Q1RvM05YRHEzZ0R5VlEwc2w1UmNaWmFxMVY3aTVjK01tTDRi?=
 =?utf-8?B?WGdoOFVKQWpQYkU4WnZQbGVSQkpYMFd3V1RzMU5MZnkwQldPMVBnUktxQ09V?=
 =?utf-8?B?NnMrOU5JY0Nmek9MejlUY0JhM3U4ZzVodXdmTmhXd3MySWJHRzZ1NS9MM1Rm?=
 =?utf-8?B?dHI4RGU0SzlmNVZnZVhSWGVKNUVQSWJGT3lXNVN6WUlDSSt0UzZja2xLZndM?=
 =?utf-8?B?Y25HVVNFMS8xMVd1MG9WMUVzamEyWmd1TWg3aUVPR0tYVG1QL0FxbzJJSHhz?=
 =?utf-8?B?anBBSTBWaFVrSlcyVEhSK3l1Rm5pY0lYdko1VC9KaWN5SDJCeXg2NXpDZk15?=
 =?utf-8?B?U3BVbFV1YnZEQTBkeHdOMW9jdHJ5UEh3SXJEQk5KT21mcVUrdjdTdU1MQ3ZL?=
 =?utf-8?B?WEZCakRiSkV0RUhGZXE0YkhYY2tVMXYzaGtOWUJUdGpVS0JoNloyVW9wUVR3?=
 =?utf-8?B?M3pKaS94TUQ4R1VZeXlHS2VUOFJWRnBMUWlXcDJ2NG11NUd0bzQ0Qkk4bmNQ?=
 =?utf-8?B?WXU3d1pIeVdpeVBaNVgreFNGUUhrajRmWFFWN0RMWUVNajFOZUJlYkp1Z3ph?=
 =?utf-8?B?UURxNjRWbExNTHErS1ZWVVVmOHJrWGZ0U1ZBOEtyWEZyLzBtVjBEVndtanJm?=
 =?utf-8?B?cUlmM0JocFlzNHBYMk5wYjBDdG9XdWVMV3h0RzdMQmhxeVlGT2Y3aWVLUG5j?=
 =?utf-8?B?NnRJUVpWbGJHQmphaTIwU0wzMGE5ZVN1S052RnVVK2FEcTdmTlZxY2tSSXpO?=
 =?utf-8?B?SGUrOG9ycE1YYnFkYTZYOGJPUW9ROHRuMFd1SUhudUpkaXNYSGovcnUwR1FH?=
 =?utf-8?B?cDlnMExJU1B4TjdMa3ZNZjQ4ZjVSUXY1RlJPY3FXU3B3MlIyTVNpMG44eW81?=
 =?utf-8?Q?vNmDwXu6KJgBACKRzrJkDD5gF?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adcae72d-abe6-4074-1525-08dc6c3c41be
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2024 13:15:23.8049
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sfw12hIrvLjOgg5lbK8eknU3BCindbFYEf8fy2r3veI8lqSY9cN3GZHug0TMbaqAxJ3Pgh4eLG/BLrXZbhpy3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8633

From: Peng Fan <peng.fan@nxp.com>

Use scope based of_node_put() cleanup to simplify code.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/pinctrl/pinctrl-at91-pio4.c |  7 ++-----
 drivers/pinctrl/pinctrl-at91.c      | 14 ++++----------
 2 files changed, 6 insertions(+), 15 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-at91-pio4.c b/drivers/pinctrl/pinctrl-at91-pio4.c
index a27c01fcbb47..8b01d312305a 100644
--- a/drivers/pinctrl/pinctrl-at91-pio4.c
+++ b/drivers/pinctrl/pinctrl-at91-pio4.c
@@ -632,7 +632,6 @@ static int atmel_pctl_dt_node_to_map(struct pinctrl_dev *pctldev,
 				     struct pinctrl_map **map,
 				     unsigned int *num_maps)
 {
-	struct device_node *np;
 	unsigned int reserved_maps;
 	int ret;
 
@@ -648,13 +647,11 @@ static int atmel_pctl_dt_node_to_map(struct pinctrl_dev *pctldev,
 	ret = atmel_pctl_dt_subnode_to_map(pctldev, np_config, map,
 					   &reserved_maps, num_maps);
 	if (ret) {
-		for_each_child_of_node(np_config, np) {
+		for_each_child_of_node_scoped(np_config, np) {
 			ret = atmel_pctl_dt_subnode_to_map(pctldev, np, map,
 						    &reserved_maps, num_maps);
-			if (ret < 0) {
-				of_node_put(np);
+			if (ret < 0)
 				break;
-			}
 		}
 	}
 
diff --git a/drivers/pinctrl/pinctrl-at91.c b/drivers/pinctrl/pinctrl-at91.c
index 5aa9d5c533c6..b3c3f5fb2e2e 100644
--- a/drivers/pinctrl/pinctrl-at91.c
+++ b/drivers/pinctrl/pinctrl-at91.c
@@ -1244,7 +1244,6 @@ static int at91_pinctrl_parse_groups(struct device_node *np,
 static int at91_pinctrl_parse_functions(struct device_node *np,
 					struct at91_pinctrl *info, u32 index)
 {
-	struct device_node *child;
 	struct at91_pmx_func *func;
 	struct at91_pin_group *grp;
 	int ret;
@@ -1267,14 +1266,12 @@ static int at91_pinctrl_parse_functions(struct device_node *np,
 	if (!func->groups)
 		return -ENOMEM;
 
-	for_each_child_of_node(np, child) {
+	for_each_child_of_node_scoped(np, child) {
 		func->groups[i] = child->name;
 		grp = &info->groups[grp_index++];
 		ret = at91_pinctrl_parse_groups(child, grp, info, i++);
-		if (ret) {
-			of_node_put(child);
+		if (ret)
 			return ret;
-		}
 	}
 
 	return 0;
@@ -1296,7 +1293,6 @@ static int at91_pinctrl_probe_dt(struct platform_device *pdev,
 	int i, j, ngpio_chips_enabled = 0;
 	uint32_t *tmp;
 	struct device_node *np = dev->of_node;
-	struct device_node *child;
 
 	if (!np)
 		return -ENODEV;
@@ -1349,14 +1345,12 @@ static int at91_pinctrl_probe_dt(struct platform_device *pdev,
 
 	i = 0;
 
-	for_each_child_of_node(np, child) {
+	for_each_child_of_node_scoped(np, child) {
 		if (of_device_is_compatible(child, gpio_compat))
 			continue;
 		ret = at91_pinctrl_parse_functions(child, info, i++);
-		if (ret) {
-			of_node_put(child);
+		if (ret)
 			return dev_err_probe(dev, ret, "failed to parse function\n");
-		}
 	}
 
 	return 0;

-- 
2.37.1


