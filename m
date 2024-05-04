Return-Path: <linux-gpio+bounces-6098-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F26CB8BBC0D
	for <lists+linux-gpio@lfdr.de>; Sat,  4 May 2024 15:16:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A8EDD282A4E
	for <lists+linux-gpio@lfdr.de>; Sat,  4 May 2024 13:16:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69E303C08F;
	Sat,  4 May 2024 13:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ikUa133S"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2076.outbound.protection.outlook.com [40.107.22.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE383D0D1;
	Sat,  4 May 2024 13:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714828545; cv=fail; b=cmVs+NTSjWNjcHNAVOZjEJ7116eiBdKJLGfk6ShxrV+uH9JpsZJhl6qBjj6Pxch70aEYB9EgsGgG5kSM2X295vXX2fz8ZhX2N/tOUZdKYcRwYVgLmJ3tY9OItuPj6ksret/TT/U6l1vZB3kAUn7xSfSF1pDZ2OwP80guYnDZxuU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714828545; c=relaxed/simple;
	bh=XjYcrC4knEYcZi59FiMv3CxGYKeUFr0HCFF+UrzXVqE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=bNPdy1MrdJUKSoXP+ufOKTFu23TBJotMNVff8jCHciC4Tf4jYg+fKFQrDgJljd/20o+RKnITkEVINLrOEJJVi6I78IW3X0YmFY8aAobSEttKt2da2AQxZ1ALSJ/rJImkVT8Wh2Gmj9CgmE0dDlT09LgOi6GLQTLQ4Jv1v3KsWRY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ikUa133S; arc=fail smtp.client-ip=40.107.22.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W13wp9FiM++nWc+Yz28yg2bbPZLLdw+WTg1bDgGDy97n7my34QTBMGJm9rCBvzp1jMM40UEGyYOCjXD0zS8w/4qkYpLKQvl7qMriD27ylLz18r1NRpGpx71+GEwMlRijcmKKUhs+CFXmH3G9kKcmBss3HTxz6j5/wfn2/ZkDbfipOOFZwJudnMiD2ird4Hc/j/vk2HMY4xe4rTH60RivfIHTmI/7r/gxMu5AU+cvfzkbp3oXgi+gdfEF2NaAknoNou+/0PzqNZ5+f40vNXUDVNCCLF71gCdSTz7Sj63iiXWC0PUSOU1MYg18Pk0DfHCpTkaY8eI6SEW49xo2CPrxGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lfJwrgHZf+RNEj6PZEelZwXcext4Fk8ZGEAWxpPRGZk=;
 b=EhXMCkb8gOkREMgpBl9dMK0MTGtMhyMCwsI/DCmdxXmz2BiDju4e0MARf+kdgnef3ekgtf/sA9wJjhLkLd6Woccc6Qi0oJ9qXs7HxQ4XHHn9TeSdhapuG31Hto5GwfCrDrrSFI74qAb7guux+hptHu8hvQZKzhaSYIDPhsgyorjn8xKgNNXFlwfRhwKyWTt7SG6vfhYriDHOeo0SOkJBpHhlAi6OWt4yqsUYKvHFcL4PAVylfJghDn6Pv8pNNg/UwTdNciF4jQVyFOU6oSCDIwWY4aCHM1nfV3820Dw/nCDJc4Pwz1nHR6zgMJtCOq8jckdo093BlwodHwDiJ8gSQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lfJwrgHZf+RNEj6PZEelZwXcext4Fk8ZGEAWxpPRGZk=;
 b=ikUa133ScwGjkZxB3mOk8JOHeMMaVQC05IL6z7ifMBDxhZikG5oDN5sD5QpBRr4tLPYGOACUrjCuJdwC44Z297sorvsDzH3xZIa//z39u4jVbrh6HxrLaD6DnCKoTP5EFf6x/zLkmrhHCBDTN7wVZUv4UsoaReDqBrH4StYeQPY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by AM9PR04MB8633.eurprd04.prod.outlook.com (2603:10a6:20b:43c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Sat, 4 May
 2024 13:15:40 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d30b:44e7:e78e:662d]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d30b:44e7:e78e:662d%4]) with mapi id 15.20.7544.036; Sat, 4 May 2024
 13:15:40 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Sat, 04 May 2024 21:20:10 +0800
Subject: [PATCH v2 12/20] pinctrl: s32cc: Use scope based of_node_put()
 cleanups
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240504-pinctrl-cleanup-v2-12-26c5f2dc1181@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714828815; l=2925;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=DE1TsODFhZuLZm6pDc3wReEJgqgWx9DxsgygoDyK3OE=;
 b=4lPD+sR8+ZJDBmnUSGc4BiJR63BC+fsZ9sA6ZLC22ieCU5l/dWZtPjTnnXlLTXwDaVFM8DgGy
 HeQBDCN8beEC267VymO0c1EOJ0IkKry6T9AQEMkG8hUVyAvlluXu2Hk
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
X-MS-Office365-Filtering-Correlation-Id: 0b200d19-f7e4-46c0-a449-08dc6c3c4bba
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|52116005|7416005|376005|1800799015|366007|38350700005|921011;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eEhMUEhleVQ5dHNIaFMvZXZEaThmWkNEd3crdGo0dXRvMUhUVGhvbEFZUDcy?=
 =?utf-8?B?N3JxMkRkeExOZ2tjcUZpLzU5Ymxtd3hJejYvQk92WFdQVjJ5Y3BEQ1FtMXhT?=
 =?utf-8?B?SytJcThEWCtEWWNDRGp2TEpBTXNnUVVNV0tjemNIUnpYY2RlajFqV0w3aThw?=
 =?utf-8?B?UXB3M0pmRnRVYWZvaE9YZnQ3UkhwOGRhV3FqcGJ5WnFVRmVQVWtPVHRVb0xO?=
 =?utf-8?B?TngxaVhpNDRLeDVFYTBaNCtmU1NnSmwydlk3b1RneitidUR5MGh4ZWl3MjBt?=
 =?utf-8?B?SnliWEdvdVVuYkgwOWc1ak1kRGFKVHZDdW1iSHU3OTF0cy82TFMzQ1VZV3c4?=
 =?utf-8?B?am03cUltWGczMnVkb3d0YUxRSU5XNXMyY3JCdVlGYm00Z05FQTJncytoTEtE?=
 =?utf-8?B?UzFMQnZnMjlZUWdMWnJ5NC8wWDExa2Qza0tmTUtSdms2TTAreU1yUmZ1MlpT?=
 =?utf-8?B?RFQ3bkU0Njd2cEhvL3RKUVlodnNjdGIybEFPQ0pwbUhOSURZcHQzd1hjWjhk?=
 =?utf-8?B?WjQvUm9UYXEyMFkvYjJReDF3ZHNpcWtOenlmVVFVUXNETVpORkhtd2NlRTky?=
 =?utf-8?B?K1dzUkJxd1dybG5nN2tva3FkejVDdUMvK0Nqei9lKzl5Q3FxQlhvQUg5SUVM?=
 =?utf-8?B?Q1BXNWs4S0lXWHFibjFjdmMyRkFhL0VSZGgrWU9zN3ZtMTJvbUQ0WWNPWHFT?=
 =?utf-8?B?VjN5U0Y4czZDcVJFdGVCNGhaNHk0SFprSTFHNStmMFFweTgyT0ZxVTBaU3Rk?=
 =?utf-8?B?dHhMZ3k2dCt2THdXNUU5Z0xselV3eEVGcUppdUd5Vko5SjZUbGVtUXYrYjdx?=
 =?utf-8?B?VjhRV1FHRHRid095VmNZNk5zSkRuRmRyWmxEUXp3QXhpYTRWSGVkRUFEcFdq?=
 =?utf-8?B?R2lLZGthMU5mNGFKL1d4L05OeFZRWGplUml2VnFZTkdXODBXYk9jc2NSTjRT?=
 =?utf-8?B?VzZpN2xFS2VJZnZlNjlGVE5oWE1SbDFnMEkwbGV4NGZoeXdmbzlDRTRrT0Rs?=
 =?utf-8?B?MDhUelk1V2dQZjVvKzIxTEZlQ1BweEQwNEhDRitiTWtvVVhqdzh3V3hiMW80?=
 =?utf-8?B?UEFJMGc2QWdKMlIySzAvWkdsOXc5aTJRWmliWTdjMUcrblhWQTBSMms2WXVw?=
 =?utf-8?B?Q0VQL01kNm1JMnNxMFRUekVQTVp2TCtMbExFa3hHalM4UDJmbWU2MGRVZVVl?=
 =?utf-8?B?aG9ibEhHSjN6eHJqS2tyeFY1NWNQbk0vYTNOWmphM0pGQ1BjcGVVUjlpb3RM?=
 =?utf-8?B?R1VUeTJBRVZNeTdkU01IaGIrMnQ3RlpuNFEvdUtNdmFQN2NWdm9iZ1BRZ0g4?=
 =?utf-8?B?OFNMb2lRSGRzT3ZJQklqV3BKQlh5YTl4YlpzZ0ZvUkt3TGNrOWp0VldQUm5o?=
 =?utf-8?B?a09jY2ZqcVBtTWdmd0hWS3dmY3puSSswaWRKQ3lxSmZCWmxsOEsxSjRJeXpT?=
 =?utf-8?B?OEFiNWRQVzlScDkxOGtaMjBLZGVqd0ovZDJWa0w0V3pKZ3pKNU0vNFkzSHU4?=
 =?utf-8?B?V3VUMFRJOHoyRlAwTUpscjNOWlMrV3ZQMGxxOGpIMUZRbE9Pa09DcTF6cFNY?=
 =?utf-8?B?VERtL0FUellpa0tteVc0NnFVa1lMRWRrYWRvUml1TE4wdlozVGM2UmdaVHFX?=
 =?utf-8?B?VnI3UXB6d0lkb0FCRlVSdU8venpBMFh5WERENXQwc0FXOG1yRWptbWRPbE1n?=
 =?utf-8?B?dkI5UWxScmRneGdmWkJCWHRzTTg4bFJTZndDbG83TDQ0ay9LOU8rSndtTmtk?=
 =?utf-8?B?aXFmQjgzaE51Z0c5bm9FUWY2dG5vSE9tUEhhMU1YTHhmT3Nld3pRRVZjSUlH?=
 =?utf-8?Q?LgRsGUyWyLAPOzeLd8VCUWsMPdczJRUT9D+Qo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(52116005)(7416005)(376005)(1800799015)(366007)(38350700005)(921011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cDZvNmFibnhTVDZEb0NpakZwKzJCbm8wNU5aR0d4T2tMYUFwSERWUUxacmxx?=
 =?utf-8?B?c3V4TmVWNHpWZWdWVzlyaTdrR2pwUFMyTjBwc0FUSTl6VUp2b1F2Q24xcVE5?=
 =?utf-8?B?OHFQbm96a01PMXQ1bXNXV2xTek8vSm9VSEd5NXZqNnl2R0JldlAwd1B4WWtP?=
 =?utf-8?B?amt4ZThaY3JVQ1Y5dFA2alM3NXVtZ0d6M3JTTkJ0YXl5TjhzbUZjcTZOdzA4?=
 =?utf-8?B?a1dYQUxUQTk0Z1NGZDhNY01ISEZ1V0J3KzhRODNoODE0QjM3aENBd2ZiTGoy?=
 =?utf-8?B?dmhNNkVtbEh5MlpOQWI1d2xWa3RZOHJtUGdKTUFPaFA5a0duaWxJRlBBNmM2?=
 =?utf-8?B?ZGlxMVJJeUZTRjU2R0lGRVlYMzA0aDByN0tqSXJJMzhOQ25YTThRQ2EyMkQ2?=
 =?utf-8?B?N1psZFVTRTNmeXVkNUZyazQ1UWJmZGwwbmtlcmRvVEIzYVdodVpXbDZ5a3lT?=
 =?utf-8?B?VFo4T0Y1U08reVdQSUVJd2lZOWl5UXV1WFVaN1RFWGxsUGtxNVF3V1V4Rm80?=
 =?utf-8?B?SWQ3YzRsYWtGZkJnZ2hPQW5ubVBMZ0dMSHlYNEswbjNLZzFZM1AzRElFNlFn?=
 =?utf-8?B?bzM5VWZBZ040OXNwNlgwNURVVEtXd0JWcDNxa1pLcU8rMFRtUWZQYjZWUytW?=
 =?utf-8?B?THJTWjZLU3RTZmZ3Vk9nNHNYdmhiNnpyVDFDc2FlbEVDaEdHVVkyUCtUZTl4?=
 =?utf-8?B?TEZWcjhibm1JTFJyd3lzM2xqVUN6VUhla3BBUGdrNVUzWk1rT1JPVU9sTS9D?=
 =?utf-8?B?TXJydnpoZlhVTDAzbmk4UFZ3OEUyeGlmc3VlMk0rRnVTYVFqbkprS2lGOFV2?=
 =?utf-8?B?cTE2L0JpYnEwTHlxeW1xYW1HNCswU0hrcnBXMUpUL09XYitjNyt5Qm9vVFA5?=
 =?utf-8?B?ZU50blNsWUxkRGE3Y2ZTZms4MmNyb2EyV1luTlpabEZ1ZzRjSUl1V2pkWEJz?=
 =?utf-8?B?Qm1URVFxM2crS3p2cFhKTlQ3VHFoWlBUckUwMXpackdkZUV3bE1hYWFyRkd3?=
 =?utf-8?B?QWRLYkQyYTQ3elZ0VmFPSE1yZjg3cjZ6MXJRc0RHU0JLb2FITkxRcFhoRmpC?=
 =?utf-8?B?WTFNUExtRlI0T2VzMGdrOEJKWkVHQnd2NTNvb1lWQ1QveHh2OUExNENLVFhK?=
 =?utf-8?B?ME05MXQ0c2NmLzVGL3ZkbXJsR1NnK2FHaHdlOG5vN3p4WVhMMzNua3JUcnF1?=
 =?utf-8?B?b29WM2ZDbFpETDlmTE9uVlZIWlppNU5LNWRudVNvZHBWYTBtN0VzTWNqZVZZ?=
 =?utf-8?B?a3c2WldqQzlqU2sxbzFhL3BRblkzTlpzMktEVHFRUmZkaWcvT1lEUXV5eDlG?=
 =?utf-8?B?cWdXREpRaWgzWXVVWktRMUFLd2FpTjNKa1A5b0RGdVRhQitVditJS2JBaW5Z?=
 =?utf-8?B?MGZmUkZ2VUtqR21hSjZJSklVNE5MMlJPWUxmSUExTHBkRVI5UU1kKzBpNlhL?=
 =?utf-8?B?NVF0cGQ5M3A5c1l2ZnFBa3NKZDJYWnlaNGpROXpzQ1h6b3Q3V3laaUVqUWFq?=
 =?utf-8?B?cXZzSThEeVJ5MURWSW5mRlU2S2VlSFVib2w5ZlBzcU80YlM2OTAxVmZmcW0r?=
 =?utf-8?B?ZkdFZ2phUUlqdnFXOGhaNHZqMnZHWGVvNUZScjN5ZDBSVWUyZTNwcFFDS1Nm?=
 =?utf-8?B?WE1POEhscUsvaUFqQnBCTFdIeEo4bVA1SjVlRTdndGpwcGdTVlFqaXJmQjV2?=
 =?utf-8?B?SEFqbjRGVDdralM5VU9LcjlFdEcxVUIrN1djai9URkZReG5YUHQwd01WMnJk?=
 =?utf-8?B?dHVjVFhkUVIyRk5ReEpFejAxNkh3SUIrMUFBTCswc3YvdzhTZGZ6WGxWY2RV?=
 =?utf-8?B?L3V6VDVxRHowVlpESU5RMmFZOWVJZ3hjeGRoMGxvWStPZTl3b0kySEdkOHlK?=
 =?utf-8?B?NTYvWkJFQlpHd2lBb002cGRqUUNUeGZ3ejRwR2llZFpMUEJRMDd0ZWsxZEow?=
 =?utf-8?B?UjZtYXJ5OXUwSnJYUmdzMWd1a3pnU3F2QnhoK3k4VTFZQml1alIxNXNlQkxG?=
 =?utf-8?B?elY0Lzd3aFlqdHB5VG5TNncrWUg3SVpUV0YrYkhiYzF0NU0wQkQrbDY1QnFP?=
 =?utf-8?B?QUU0c2EzTFpVOTJoZHRYNmdpVmJLbmhaeHZKYnE0bUhUNFE5QUk5U21uYVgr?=
 =?utf-8?Q?vfyGxGNZKkduzNzMELAK2Gje/?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b200d19-f7e4-46c0-a449-08dc6c3c4bba
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2024 13:15:40.5200
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kTB7cM73P9h5jqKaR9YGbwVTQwji2+xZXBGT2FJE8I8Ox6V09qZ1W0fqCU0ax8qp0sCNCd/aXZ64mGZHFKS8kQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8633

From: Peng Fan <peng.fan@nxp.com>

Use scope based of_node_put() cleanup to simplify code.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/pinctrl/nxp/pinctrl-s32cc.c | 31 ++++++++++---------------------
 1 file changed, 10 insertions(+), 21 deletions(-)

diff --git a/drivers/pinctrl/nxp/pinctrl-s32cc.c b/drivers/pinctrl/nxp/pinctrl-s32cc.c
index f0cad2c501f7..df3e5d82da4b 100644
--- a/drivers/pinctrl/nxp/pinctrl-s32cc.c
+++ b/drivers/pinctrl/nxp/pinctrl-s32cc.c
@@ -268,28 +268,23 @@ static int s32_dt_node_to_map(struct pinctrl_dev *pctldev,
 			      unsigned int *num_maps)
 {
 	unsigned int reserved_maps;
-	struct device_node *np;
-	int ret = 0;
+	int ret;
 
 	reserved_maps = 0;
 	*map = NULL;
 	*num_maps = 0;
 
-	for_each_available_child_of_node(np_config, np) {
+	for_each_available_child_of_node_scoped(np_config, np) {
 		ret = s32_dt_group_node_to_map(pctldev, np, map,
 					       &reserved_maps, num_maps,
 					       np_config->name);
 		if (ret < 0) {
-			of_node_put(np);
-			break;
+			pinctrl_utils_free_map(pctldev, *map, *num_maps);
+			return ret;
 		}
 	}
 
-	if (ret)
-		pinctrl_utils_free_map(pctldev, *map, *num_maps);
-
-	return ret;
-
+	return 0;
 }
 
 static const struct pinctrl_ops s32_pctrl_ops = {
@@ -786,7 +781,6 @@ static int s32_pinctrl_parse_functions(struct device_node *np,
 					struct s32_pinctrl_soc_info *info,
 					u32 index)
 {
-	struct device_node *child;
 	struct pinfunction *func;
 	struct s32_pin_group *grp;
 	const char **groups;
@@ -810,14 +804,12 @@ static int s32_pinctrl_parse_functions(struct device_node *np,
 	if (!groups)
 		return -ENOMEM;
 
-	for_each_child_of_node(np, child) {
+	for_each_child_of_node_scoped(np, child) {
 		groups[i] = child->name;
 		grp = &info->groups[info->grp_index++];
 		ret = s32_pinctrl_parse_groups(child, grp, info);
-		if (ret) {
-			of_node_put(child);
+		if (ret)
 			return ret;
-		}
 		i++;
 	}
 
@@ -831,7 +823,6 @@ static int s32_pinctrl_probe_dt(struct platform_device *pdev,
 {
 	struct s32_pinctrl_soc_info *info = ipctl->info;
 	struct device_node *np = pdev->dev.of_node;
-	struct device_node *child;
 	struct resource *res;
 	struct regmap *map;
 	void __iomem *base;
@@ -889,7 +880,7 @@ static int s32_pinctrl_probe_dt(struct platform_device *pdev,
 		return -ENOMEM;
 
 	info->ngroups = 0;
-	for_each_child_of_node(np, child)
+	for_each_child_of_node_scoped(np, child)
 		info->ngroups += of_get_child_count(child);
 
 	info->groups = devm_kcalloc(&pdev->dev, info->ngroups,
@@ -898,12 +889,10 @@ static int s32_pinctrl_probe_dt(struct platform_device *pdev,
 		return -ENOMEM;
 
 	i = 0;
-	for_each_child_of_node(np, child) {
+	for_each_child_of_node_scoped(np, child) {
 		ret = s32_pinctrl_parse_functions(child, info, i++);
-		if (ret) {
-			of_node_put(child);
+		if (ret)
 			return ret;
-		}
 	}
 
 	return 0;

-- 
2.37.1


