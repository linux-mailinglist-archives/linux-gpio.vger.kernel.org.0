Return-Path: <linux-gpio+bounces-6100-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C52718BBC17
	for <lists+linux-gpio@lfdr.de>; Sat,  4 May 2024 15:16:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E7E1A1C20E7A
	for <lists+linux-gpio@lfdr.de>; Sat,  4 May 2024 13:16:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A19ED39FFE;
	Sat,  4 May 2024 13:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="LbykI/RZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2069.outbound.protection.outlook.com [40.107.249.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2FA9374C4;
	Sat,  4 May 2024 13:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714828578; cv=fail; b=Ge+Dl22efjfI8LOretsl/vWJ/Ws00AzEerRzGY5F+GqD8ukg/MckRXzUWpCViHqP9/D/wl670LRfEvD7uaU0otmLhP8dscXI67pDiCHCU+SEMLPMa3RDh7sDHFo6gEk8BDA6AUSJdIA4a9ZWUvapVXdQ/dp9n4nPLrW8Z129IV8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714828578; c=relaxed/simple;
	bh=aGocML37yKFLTQmAgdHIf5uoWsvtHUPQJME8EyVoT6s=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=SGyCPYqe1yAKP1BNxwr4MOFzeDbgv1wTN5ltC/OkKrrUZfXwMstLD/QDQzTdzLJNsyCh7MQ7CfFC2diBhoZ8oZJr9Zus9Zb/7m3MFnqxGdy4ei+wVsNREbqRIBtu7L5xXIFq6CyNx5AlRyEP/YnvjkS+2oqyF1A8W+9xuReY5go=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=LbykI/RZ; arc=fail smtp.client-ip=40.107.249.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HjpbylIYacvnbNTWQP2eW4n5I4okmE77Ce7/Dl53/EpW4Yt8DXzAzkFvYu8UldsRbkKqZPe3VissAU7I5jfJT18hYiGAWBsdEdnKWAxcBtPOxibb3Uvon5JFSTkptfPnOy+MOP4npnLPhRn2tEFbe5z65Iz2iDYrAswN+z3Z5vb9513kV3ldW2CqleJMF/LBMywB+tgrfD1sGL75xCez5X2jjrv89l0qKlBZxw7i97RzX9mJjN/K+2COUQuDVL5mt5yS5gJnHUTzAtbOU9tYZw1tgYgDMOiZnkfllE34U/j8XoJKG2jhVj2zCGCbLpe2KUyy0a7olcgT55PALcNERw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YyGeWpCkYZh4WcKx5URim9X/pl2xw38Z9ho8YthB/aQ=;
 b=dqGYH1FwLeN/qpMQsYJ0OBQXmLTP3aJUc7GzoCCWjyJrF2QvI0uVycx7CRkHbtc06SSQTJXmiPi98aUf8gG+JmiOsOJZce7M9pBhnCR5rJYGyI/FtQTsCJV3takHYFyBu5OvMG5wH+3DxvDvamud9A2R1+Q2Ji6fZKFaCngPDKCeNqgasKOdE43yAK2dV8QO6XxD96iLBsLPosTkRWwlHIfemLah8ppu6psxAyg1SCa9WNfgotSaU2gMDmZjVlSeqadnP3f6fEMXWOQ2EwK9OVhXs0rWjqLeX5R6xyLhkLhONee/sWVU+hrlwhz8XbRQi4V2NZ2Z+TyEchh4//yPTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YyGeWpCkYZh4WcKx5URim9X/pl2xw38Z9ho8YthB/aQ=;
 b=LbykI/RZmuGK+O14E8wO67iqZNfdyu5EQnlofWQCNSbAHiStMpPWzUmxv9UiR5GbG2yCzkxFgz1NQ+IwIUW1ySOpuWD6sM2jl05iLgCGOtZjFpdDtSOXhpaDm8KRFQiOPoJLE8ZmlMC7w+DDbq97yjKsNdcQeIQlGxagDrmT7Ms=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by AM9PR04MB8633.eurprd04.prod.outlook.com (2603:10a6:20b:43c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Sat, 4 May
 2024 13:16:13 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d30b:44e7:e78e:662d]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d30b:44e7:e78e:662d%4]) with mapi id 15.20.7544.036; Sat, 4 May 2024
 13:16:13 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Sat, 04 May 2024 21:20:12 +0800
Subject: [PATCH v2 14/20] pinctrl: mediatek: Use scope based of_node_put()
 cleanups
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240504-pinctrl-cleanup-v2-14-26c5f2dc1181@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714828815; l=2143;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=lm1PEdHATfoxwJUL9YMs41GxvVEK/pacMdZ5mWFlWX8=;
 b=d8MWpOtXKNnFGmfz1eHOooCE8YCLHVTyQNBBLhSiEJgr+86Or3+ekvXynCYNgOqJisw6NtlEy
 IWju/BxoMOfBW/IhPYIVChwIIYZ7T5qVjSiPvU1zknqEB2Ele8EoB2c
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
X-MS-Office365-Filtering-Correlation-Id: f321deef-96f6-48ee-0b73-08dc6c3c5f9b
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|52116005|7416005|376005|1800799015|366007|38350700005|921011;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c0JCeTN0SDFDVG5oUlhXRkhxbHZIRExxVWVFeWJmK1hqR1A5Y2UyR0VyOUFs?=
 =?utf-8?B?OEVYbzZtSi9GdDU4S1NZNjVPK3lCL3VHK1BxOTFNUk1tQU5HV21LWjNnZXJn?=
 =?utf-8?B?MHZUZXNVYjVkbVNpOVc1c1NTbXYrQzdOWWRvdUdaaDNOei9qNVBWM3lvblB3?=
 =?utf-8?B?N0E2eTlMTFpLZHovM0trbitLMUdvQzdGeWFxcHV6SXNWVVVST29zMElEQ0RV?=
 =?utf-8?B?amFYTWw5TGQwZm9qNVErWkdyUkRLQWl4QnQyWHEwWjlzeG5jNmNjQ2dTQ2h2?=
 =?utf-8?B?RzU2TStMdlZ3dUI2d094RFgzaHVFMlNSL1BMakJJUjFBTVJSNjZZNlIzd1Ex?=
 =?utf-8?B?YVNQb3pOLzYwbldsRi9JaXlWZ2tONlI4a0FkbTJyeFluTm1XUGR0S2xVVkZ0?=
 =?utf-8?B?VFcxbjFRcXIrNHlsdjJTMFBySm1hbWVRUE5idzN3eHk2SzlkYmVTVE5CVnB2?=
 =?utf-8?B?OTBSenRScVEySVVZVkFWU0haSFBPdFYrVk4zSjNYSUNIazBwOFNiRzR1V0xr?=
 =?utf-8?B?Mk9yYlFZbWU5TXdBTDZxV25UWDF3N1h4bGM4TWwxL3hBY2hKbjVBYUZ4ZDlZ?=
 =?utf-8?B?M2ZMcHYrRkNOMG4yTW1XVnAyU3FUYTNIZnRJYmZDTGt5dHpMOVowYWYxUC9B?=
 =?utf-8?B?YWQvbzhaY2RYSEtNdzBBTzN5MHVoald0T21aTG52eEhvQ3R5WGJVb0hHVlhT?=
 =?utf-8?B?cjZHejZ6d2l5a29sM3dHbXJyVjdSZXhmbkFWZ3RwcGVpeU1ZSm51UVVJMHdU?=
 =?utf-8?B?M0ZWVHo2MXdGY3hDNmQzRUxIVFVmYmM4U0Y1eGNXVjBYdGhQTVhBWDdCWlZ5?=
 =?utf-8?B?d0g0VGpHaENZVjVVSEo2RDJkUktpbm82QWpqUzgrZHhVaFFOVFV2WU9ibFhM?=
 =?utf-8?B?QmdYRUpKcVQ3c0ZHN3o0NkU1WFI2TmZ5MExobHRDQjlCeEdCRFVMMkZWQVFq?=
 =?utf-8?B?NnhJQ1N4bGV5UU8vTHEwUTlaakRqY1BYTGkzWkpvUGRMaXJkQTJkY3VLMGtu?=
 =?utf-8?B?RlRWa1V1OGpGSkZCSVVINDZ4NXdLT2xJZ1I1QkRoUktCV3Q0OXkxZ1BuVDRF?=
 =?utf-8?B?NDk0eUFqY3NUNFJjVUFUYzVyeTVkdWlCSWd1Mkx0bG1vRk55RDkvWXBGWFdR?=
 =?utf-8?B?WjA5Sm1NUUZJeGhKdXJ2OTRZMTlheFJtRWthU3VFajN3aTh3eW1QbVJSTGpO?=
 =?utf-8?B?SWpTMjlkRWFZZ3BNdHBKYzNKZzhlTVExamNmRTU5d1gzanV3S3dMQzhNMXN3?=
 =?utf-8?B?a0RUbmM4a3NOOEc2Q01rS2RMamh3WlloaGtLOW8vS0w0c2tzcXNxdG5VUklR?=
 =?utf-8?B?d1c2NkFKUC9vMjRDMGhVL1hmUDcyTFlPTGQyQjN6NGRyYzk1dFNYbFViNERH?=
 =?utf-8?B?dVMvbUJSOVBocXRLNzdka3Z4S1loQUpZZ09pTmg0S0VVT3NZR3hkNDNYNnRX?=
 =?utf-8?B?bndkYjEvM1JjTFBnVzFPaThKVkNnSWEvZFpQZnhtekd5WkdETG1vbUk3Rklr?=
 =?utf-8?B?bG5TTnZCUi9UZlJLNWl6LzN6R0lnR2x1YzlwTDRqaExDbEJtZEhMV3N4alFq?=
 =?utf-8?B?S0YwNmZSVGVBaGQ4cnFYdnhwWmVJVThQUHE5M2o5Tk96d09aTDMrZGN1RjBE?=
 =?utf-8?B?amRrQzBnbFZacWxqeDVFV1drK1R4TmtuRzd0a2E0K1NNNU80bUtvRDRkL09V?=
 =?utf-8?B?OUNTRUxhc1EybEQwcmJWREwwLytVc1NRZ0NhaktHVTZyWFlIREpOS3M1WWl3?=
 =?utf-8?B?V01tWDU3M1VYRmRmMXhBS1E4dmUwYWlQNytUaUhLM0VWODJOaGh6R3RXdjN0?=
 =?utf-8?Q?RSsChYiiP4tQ4c0GA4kuFGTaAK4pCq77iXazs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(52116005)(7416005)(376005)(1800799015)(366007)(38350700005)(921011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SFgraXdDV00xaTgydFE0Y2FqdHJxZExLMjJrb25hZFVPajFPdlR5eThEclFm?=
 =?utf-8?B?NXJKdklxNFF2UHNmSkJpTFlvZmMzamwyL0cvdlhyZVZMMDFwR1JTN0RzendW?=
 =?utf-8?B?a3NHN29FNytqN0t6QzRWbU9kamcxSHI0U1l3NjkzRjZwdTEwWUpHekZNVGpT?=
 =?utf-8?B?VjhJL1d5aTF2bVJlaE83ZVFPRmtZSktqR3p4aFRWWHp0S0t3Ky90S0duNEVp?=
 =?utf-8?B?TFVlN01HSTcrVmhoVmdpb3p0RFpnNC95ck4wNXdxVWx4VGdHZTd4TFpnSEV1?=
 =?utf-8?B?blo3MmowZ01rb2I3dXpaUTkrOTV2TWlzaU9hZ1VFS0Qycmx1K3BDVGE2dzlj?=
 =?utf-8?B?cU9EU2dPYTROWFdTbXRvdjk1OURRbkZlMmVSdXp1bFRzMENpNTRuWnNwaENn?=
 =?utf-8?B?aUExQ3RuRHp5Q3lkandBRjcyQjZDb2srT2ViNzRLVnlxRHJDdGZxUEFuNDR0?=
 =?utf-8?B?bDFqSXRwdE5pOWtUYkE4Q2htNjREYTFaS0FQYVFRZTcxazhScXJEUjhzZHBN?=
 =?utf-8?B?aVR3cmxwNTdqRHFKWktRSmdQUWg5cXRhTmh6ZlgxbE5IK2VYRnZQcVRTRlkx?=
 =?utf-8?B?N05BVkQ2NUNocTB1ZVpGM2QrazlJd3JSTjZ6V0FkWEdtcTEvSFBxb3lhYWh5?=
 =?utf-8?B?aGtxbDVybU44YmpKTFdsSVdlUEl6cU5YZWZIdnBsYXEwTFNka0ZuV0UwZEw5?=
 =?utf-8?B?bGZEWUl5bTRTVjcza0FHc29JL2R3SjdZdzFMM1krTW5hZFM1ZHpjVlZldllu?=
 =?utf-8?B?UmtJMjFpcXN1Z2NvRk5pcXFKdWlJN0RMZVYyeFBqYVNxMDRRQnhWcWV2S0Jp?=
 =?utf-8?B?ek1LSHp0WEQ0ZDRvNmhqa2dnUEJFY2pRWlo3NmlVZ2w5UWpVeXlPY1Z2aWpP?=
 =?utf-8?B?a1Z3U3gwS3RDbkNjR2VqYUp2WVRRNnFiekRmYkRmOG5manhubDdXWjFaQ2ZC?=
 =?utf-8?B?S3dDQ3JpdVZPSC9qN2xVR3doSldKdlMzbzkzMHQ1RmsycWFNVE03UTA5dkFE?=
 =?utf-8?B?c291ZUdqY1ZSVDRlMmI0Y1Y4V0pCU1B6MHFmclMxZmdEWmhCM0tvNjFxQXRJ?=
 =?utf-8?B?ZGc4Q01wSHAvQXNKQnlteTllS0c5cndkcGhGak9Bb3BaYkpmVFUrOUdlWWFQ?=
 =?utf-8?B?dUtrTlpXMXF2QWlXSGhQbHYxMmxSaWdRdTM0KytGckVuY1IrMnIrNVJ2K1dX?=
 =?utf-8?B?cUNIQVpiNG5XdlFGSDYrQS9CMzB5Rnd3VWgvZUtxTkFDUG4ybzN3Q01FSHRa?=
 =?utf-8?B?Tnl1ZTMzaG11RkFyZjdJa3dNRmhmRGE3ZkJpdEZGVE42ZmFXd0RBRjVrby90?=
 =?utf-8?B?elBGT21obkg0UmZ0cUh6Q3I5UHplQjhEd0FKV1M4WEtZUzhrUVd2cEZJb2tC?=
 =?utf-8?B?T3FqdmU0SEI4YklUNUkwZmQvR1V1U2czK0dBb1Q1QmZqU1oycWxTR0Fhb29N?=
 =?utf-8?B?UHRhb2FNQ1lkSXhZTnpMRW9ySDJwajNsOHBjSTVCY1RMQ0R1aURjWUM2cEZK?=
 =?utf-8?B?RGpSNTcxU2ZHSGhBN2RXRGtDc0RSRVRxUzJCcy81bGNvVm1aK0QzemNCQjNF?=
 =?utf-8?B?c1hZRGMyL1VtdGZtUFdMSFBGTjdzSlRqTkE2RFE2TVYxNWtiTSsxWEx1Y3FM?=
 =?utf-8?B?R1ZLM2xFem9kckJ0Q1laTERDd3dJejhVOEI0ckhzQ3ErVlltZVFBZkxVaXhV?=
 =?utf-8?B?N0ZYeHNkSDlSQzZMMEpvUkJRdlRHSHdwOFlWQzBSZ3N1VVFjenNCUy9tVEVW?=
 =?utf-8?B?dWtQMTZyMkZ0SGZyN0EzdlZUZllqUWxQaTFGOUtmK3lKSXBRWHJ2dG1CZ1lz?=
 =?utf-8?B?QUZFK2xoRGZEeTdVaGxtYWN5SWwrTi95S0lZUVBqZzU2R3dmZGgraGNCVk5w?=
 =?utf-8?B?MjdEZkw4aEpYQit5K3prdGZ4eVVDckVzMW1Mem1JaGJKczBiQW5WTlVURzRp?=
 =?utf-8?B?VVFhVHAydGFwbUxMSU5uRWlqYXhnRzJSYXFLN1gyS2NJYUFWL0dWbjBDR1lD?=
 =?utf-8?B?WEszRUJhT1lmbkY4QzFYUHFyK21ROVFDZE5ETFF0OHlxaTU4b3JZeC95dzBJ?=
 =?utf-8?B?YTZJRXBBY1VNYy90UDNHejRDMU0xbnVNUnJQQTZqbzd2TmFNaHp1WkNRSHpS?=
 =?utf-8?Q?j7mJrs6vxwrXPaA9fau1ED4Xn?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f321deef-96f6-48ee-0b73-08dc6c3c5f9b
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2024 13:16:13.8452
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lasWAHSEU3CxIZoEiNBOjXZT/zjQItAD5txUd1NRZGwJarmvJdg3IsFiwxyqubcEn/E1ytvCZx3FX7rxsZyRBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8633

From: Peng Fan <peng.fan@nxp.com>

Use scope based of_node_put() cleanup to simplify code.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c | 4 +---
 drivers/pinctrl/mediatek/pinctrl-paris.c      | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
index d39afc122516..91edb539925a 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
@@ -621,7 +621,6 @@ static int mtk_pctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
 				 struct device_node *np_config,
 				 struct pinctrl_map **map, unsigned *num_maps)
 {
-	struct device_node *np;
 	unsigned reserved_maps;
 	int ret;
 
@@ -629,12 +628,11 @@ static int mtk_pctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
 	*num_maps = 0;
 	reserved_maps = 0;
 
-	for_each_child_of_node(np_config, np) {
+	for_each_child_of_node_scoped(np_config, np) {
 		ret = mtk_pctrl_dt_subnode_to_map(pctldev, np, map,
 				&reserved_maps, num_maps);
 		if (ret < 0) {
 			pinctrl_utils_free_map(pctldev, *map, *num_maps);
-			of_node_put(np);
 			return ret;
 		}
 	}
diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
index b19bc391705e..e12316c42698 100644
--- a/drivers/pinctrl/mediatek/pinctrl-paris.c
+++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
@@ -536,7 +536,6 @@ static int mtk_pctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
 				    struct pinctrl_map **map,
 				    unsigned *num_maps)
 {
-	struct device_node *np;
 	unsigned reserved_maps;
 	int ret;
 
@@ -544,13 +543,12 @@ static int mtk_pctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
 	*num_maps = 0;
 	reserved_maps = 0;
 
-	for_each_child_of_node(np_config, np) {
+	for_each_child_of_node_scoped(np_config, np) {
 		ret = mtk_pctrl_dt_subnode_to_map(pctldev, np, map,
 						  &reserved_maps,
 						  num_maps);
 		if (ret < 0) {
 			pinctrl_utils_free_map(pctldev, *map, *num_maps);
-			of_node_put(np);
 			return ret;
 		}
 	}

-- 
2.37.1


