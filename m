Return-Path: <linux-gpio+bounces-6090-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB698BBBD3
	for <lists+linux-gpio@lfdr.de>; Sat,  4 May 2024 15:13:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9B5D41C20E40
	for <lists+linux-gpio@lfdr.de>; Sat,  4 May 2024 13:13:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB966347A2;
	Sat,  4 May 2024 13:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="EPpXBiBu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2045.outbound.protection.outlook.com [40.107.249.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F59B2869B;
	Sat,  4 May 2024 13:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714828411; cv=fail; b=JQYGd/J2iZ3Nql/hzozIRk4E16DUJVPwUNAA3/oLV64plyEj0b6zUESFGBsnd2ZPFxWjEUObcZ/Mbz48vk8ygluoC6Ccjr5OtP3TnhOxl992hKnFnsk/bqgSWaKiU56uqbsOE0mLFc5ZkSAksY6bzKuyRrzojMCoXdGGaiW511g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714828411; c=relaxed/simple;
	bh=F+EfADWV2CbYDvWUwfS8uybiJnwFWQ5dJTGce5wgt0c=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Y6iO2vFqUKYrbr6ymha6wKogSkvnbF2PpBUBRzTWjMyzuY1xP2fbFTa14SBkxxuYo+xlQuT3hRmlTr7b7hUq77NE2MXzxDGixlVc9VLs9aKqti6skCJzIUxCcwFSuUGZrA8aXr/ZTbdTzsokZQg52PJ2Seg6uHGf1/H2/08Whxo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=EPpXBiBu; arc=fail smtp.client-ip=40.107.249.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W8dFrHb4e4KL7HwgGceMdwnIPATbwEajoCf0r1L751fG9TntfkojtXEFdwtU3+h4mGisBNyqodX9P/617fvvKWFPWxKVesYpSiNfQ8n/RRhkSVTQR/G4CqrXUZe5kqbNc18EwGKBOT+1RnK8SpANUOyYwY+SEYB4G6SDHCGZzWU8pzS94pMbF3xGWG6I0U1Y/Ik6reegZfH/pLahiWARc/kW1s+u3iYzsC1rwNBokyY+YWDlIXGS8lXQsaXkiRuluFYQu/tKOoN4SjT/5FMPs72IDiKaNoTvOWhm9gEZs1CAFtzVyUqLHFEOiFHuKC8zBN3OvjtFjjADEq70ZaZa2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2P30wZxS8Lt+11rd/nJOtDx2uGO5cN4rLrSAJ1jfCLE=;
 b=O62izbjHXj+4zdPt7+GiEoTPn8XodB2piI+Ga/xTuqqDcmWL9YM1JeivlJYchx61wb9HDbYxTJLgAgFo78/feSpBITmSsIsQX2uoJDhSRcT6zzZFFHcazvbiyvXEQYS8Aknsm1YD2Fgtg5D7ju3xiiP0MhbXDCDxFyRAUr7g8L8rP1Flxz13XuN2u1BOr8zF2XKrHV35s8AmEKn2fFtROZTMDgax8b0ny/gsVv4roL7RxmNYmvTuEgeMn5UjyvjEDOO+UCObxyNXu7b9BuyuGZTJPIdJO3NFSvTsSEj3lqXZTbU2W9zhsII+airVQrB9JAMhp7lkwyNT4Cu3blGHoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2P30wZxS8Lt+11rd/nJOtDx2uGO5cN4rLrSAJ1jfCLE=;
 b=EPpXBiBuohwFfGAUtTWvLzMJ2DMt4ltyln5SdZNBx/EDHOeCEMyumXCN8/sG48I8pRdal8qf6VU3jh7h5UhovOLHJgRoiDULw+dFDM21AVVJh135v+SO6E5K4vjpdQfOU1ITVUyr8xhWADRG989kAil8xzzq+wC9G2PYy63kYBw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by PAXPR04MB8174.eurprd04.prod.outlook.com (2603:10a6:102:1c4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.39; Sat, 4 May
 2024 13:13:26 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d30b:44e7:e78e:662d]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d30b:44e7:e78e:662d%4]) with mapi id 15.20.7544.036; Sat, 4 May 2024
 13:13:26 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Sat, 04 May 2024 21:20:02 +0800
Subject: [PATCH v2 04/20] pinctrl: starfive: Use scope based of_node_put()
 cleanups
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240504-pinctrl-cleanup-v2-4-26c5f2dc1181@nxp.com>
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
 openbmc@lists.ozlabs.org, Peng Fan <peng.fan@nxp.com>, 
 Emil Renner Berthing <emil.renner.berthing@canonical.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714828815; l=6725;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=Y9g/ve7R+m3W/e7zIx8b/uEfWQwRmgNvX+GDch7Of5U=;
 b=3vMnbw9Ysa7jrTpC44efhMT+UFQsFvhEKHMRSieT7F1Sbddy2bEGEc5EfpALwgSvWWAxat145
 9aXjF5wEdpVCTILYnh3hhNbtAWkA3LZyCxa8WDZMWvRG7MOlkDt1Wen
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
X-MS-TrafficTypeDiagnostic: DU0PR04MB9417:EE_|PAXPR04MB8174:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b5c4df5-44d8-4c73-20b1-08dc6c3bfbe3
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|376005|7416005|52116005|1800799015|366007|921011|38350700005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K2dmcncvYzBhVU9RQzdhRk5BeGNxTzBiaHlVVjA1MkZSTUFYeGhiUzhZMFJR?=
 =?utf-8?B?Sk0wdUJoOGI2MDkrZ0dORzltckxJa2pIZUU0YStDRzBpSElpWVpPRU1pL3Iz?=
 =?utf-8?B?d1FmRUJMa3EwT0Y3eHFQUExMcW4xRVJWcE1YSnhKcFBWWCtWVUc2aVpOV1Q2?=
 =?utf-8?B?b2NDUWxjc2F5TEdJNjJIbGRXeTRUcSsxNjQ2anh5Yzdydm95UlVoZENWOGRk?=
 =?utf-8?B?bjFHYitickNuUldOaVRTRGNFemhHVjlsSUlqV0g2Z0tsSHgvTGpKalBsS0NE?=
 =?utf-8?B?NGFZMCtzTkVtYUI4bzB4aC9iMTVtYzBFalMraTRzbkNnajhPbldGaXR4dXVB?=
 =?utf-8?B?SzFVbTNXK2szRkVXYzFRQUJNS3VoZXNLdHFnRmRkZDIyVEJEendka3hLRnNp?=
 =?utf-8?B?T3ViNGwyWG9XUFBnSGdFUkoxM1RZSG9TVmlUNFlnQzVoaXI1YXpLczQ4T3Rn?=
 =?utf-8?B?NUY1ZFJWQWE0U3JYR3FIZks3QnJBVTJaVmZMdEI1QlhtMDQzZitQQ2JuM3l3?=
 =?utf-8?B?ZCtvbm5tSlR5RFNBNGduODVKRmR2eVYybGFjcnVuSmsvL2pmNFhaUW1CMFM1?=
 =?utf-8?B?OTdUZURxanpDcmkvOHhZWWJyeGNycTNFN0dyZlJ1b2FzQW4raGw1QVkxaEI2?=
 =?utf-8?B?a1pRdkgrQ0dCeVdWZU80TStTdnBBYmpQYXZ6ai9nMGljc3pUYmF4Z0hMV1dI?=
 =?utf-8?B?NS9paWp6dDB1djRBT2k1RmNoUE5VQ1Qyb0FGcnZRb2ZYNjA4SHNRU2Y2U1Y5?=
 =?utf-8?B?cDJYMmVFaFhTY29iUXV4TUxWZ0thcTFsaWFvdGNoQnhqa21nUVR3bHZMWnQy?=
 =?utf-8?B?VUkvc0tFbTRLRkVRbFA4dUtPQ1JIVHZwblZmREh2WERaMkhVUWNkVWd5bFFn?=
 =?utf-8?B?MHBhTG9FRXViVHptNHNMWnlYZmg0T1FjcGtKMTB3NFNreS9uNTRZZWNhMzF6?=
 =?utf-8?B?Qzd0bTUyaklST01UNzBCYldEekFwOStqU05qb2hEK2lwaW1XL04vQ2RKUFBo?=
 =?utf-8?B?TFlaajBhS2Rib1h6L1lWVGJEVWFacGFtZFlKbUhMa1BJT29pRWQ2TkN6MnVR?=
 =?utf-8?B?eHoydnlmeXZ3a2tOUklMaTUzL0pNaWRXUnNPUkdpbldMRHRCMWNlR0dJZkhU?=
 =?utf-8?B?YmRYWFJ1eXRsZ2ptTU5tWmxWTUQ3ZityMjRMZGoxQTlhQU9LM0hjcGdIR0xV?=
 =?utf-8?B?SHBuMWw2VEZtSldTVEFXZ0M1bGxnMW1DUjNjSDNNRUhZOEcvaU5ZakhZM0xM?=
 =?utf-8?B?Nmh2RXdOUmNnN3llM0RmQXRLandPTXhXMXREK2lhd2RkQnk0RW5QOFh0Q291?=
 =?utf-8?B?VXYxQzhiV1YvM0dzTk1yS24wVkFpdy83c05aWDM2aXo1bDFROGJIUGdzRzFQ?=
 =?utf-8?B?OXg4TkNZTmtPcTBORUs2SlU5VnJWZkxVTzJ6L3RsTm1qZUt3emUvTzhScU9M?=
 =?utf-8?B?ZCtJUngvL3JPaVFMSFROK1pPZktWS3UvSTlVeUMyL1E2RzB4ZGNyU2RLRFpv?=
 =?utf-8?B?OUdOK1d1UW1FWlAxM01HNGtLTnJBbGNTQ1g3RWdQU0doMk1sb1ZVaFVpdEcr?=
 =?utf-8?B?WXk5cHJLZVdjU21BWVNVdzM4KzlzSWlIN3dMZG5WV2pEdkp4Y1dHdElJNmpX?=
 =?utf-8?B?MW53ckFLeWMvYWxza1BWUWxxVjJEbDN4eTZGdS9MZE5UUjBWVmZBZC91TFFx?=
 =?utf-8?B?YnpOTDNvSS8yUCt0RHZqKzVLWXdQUG9JaldFMDN5NWxkVTlCeEppdGtNV3Rq?=
 =?utf-8?B?Mldsa0VXVkovZkg2b2NrU0tsM0ZCdWZ6Nkg3UDdjcGJZM1prd2hXcitVeE43?=
 =?utf-8?Q?WtDpFuauAHUjj4roOv7Z8aHFjl3q8i7IQtP6s=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(7416005)(52116005)(1800799015)(366007)(921011)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y21NckFlRUVGb25nNWQzbHJ6R3ZQNXAwbTM5SGtJR05yUHZOeFZzUWRsdjJs?=
 =?utf-8?B?dVlaNjZYd1RQQnllOXFNUm53VFFZWFpkaVlLSE5HTUhyRmdXU2lXTUJrZExy?=
 =?utf-8?B?K0ZmU1d4K1NwbnkrNHhrQTRmVG40VkRQNGovSG52ZlZEUGpUMHZMR1g0ZFhP?=
 =?utf-8?B?by9MTWIrZHY1Qk8xSUg3WlFveTBzUmFJVk91VFJMNmFCQWNiOUdaTEZCTG5w?=
 =?utf-8?B?YWNlZ1ZBT0x3NE51dVBFcG0zRkcrMk1MQk5YazlHbEZOM2ZSeEU3NzQ0Sk95?=
 =?utf-8?B?MTJDbFJ0bXZ4eU5HcVRzSWhWak1JNFg2VW9qMDdzYU5ibGVFem0xT0ZyOVNw?=
 =?utf-8?B?TzhQSFFrMkFNMGV6R2JkdWhCZE9MbzI0cmkvYnNGTmVIcmlCNkV1LzRNSCsx?=
 =?utf-8?B?ZHUvdUN1SURCZkJDazJ0RHMrUGVJSUo4TjBBTjdhTW5Yc1pYK1V3ZEhzVVBD?=
 =?utf-8?B?dnp1VmtBMTlHNnZoMHpla0ZmcjJmakZGMmFCZnp6WEFoWmVXZ1JKTUtTSjc1?=
 =?utf-8?B?WUw3eXEwVmhpYzJZTEhMR1hJODRMVklsaVBKblZ1ZHdXUFZwcVBRUWl3dGlW?=
 =?utf-8?B?aHJpVHlCRWh3cVR2M1NwK2hLbHU2YTBSQkEzQm5UOTFKK0s5VlM1L2hlM0hl?=
 =?utf-8?B?MXFyNmFIYkNoVGdEUm1jdzhYb1FMRFNscTE4MWErTU9vRUtDVEFJVnZRM3dq?=
 =?utf-8?B?SmNjTXF1VmhoMEZ1NTJBYnBZS0ttS0dDalRTVEQ0MlMvc1N0ZUJENDF0dHhp?=
 =?utf-8?B?MlNUUmh1aUVOZ2hIaEdmNjNsbWZ3Q3djZlkrcFY0WFZMN2ZNUmxHTVc4cDdn?=
 =?utf-8?B?UTVTbG9XM20xNzR3ZDJGVmpKSVNuM1lFTXNFUlFYeUVmYUcxVjJEeUpNN0x3?=
 =?utf-8?B?WElpVXBxRmJ4UnozTFpNWDdiOXE3ZmlUZWhXMG9KZFhoU0lWK292bG9LZWtv?=
 =?utf-8?B?cW1SMnVBNjM2ZFNvUlNYcm1XRlRuMEJSUHV6MHNlTWVZcW5iRDFrVFJtZUVD?=
 =?utf-8?B?T1JKNmx1QjkrV0NIaGdVSVA5bllyYncrUis5SlcwSUVwYnFDSGw2dEVRNStL?=
 =?utf-8?B?VjVscXZuM1JZTndDM013QWJtcHh4VlJWQjdhRnkxeTMvaWhUc2FuOXBLSHAv?=
 =?utf-8?B?V2pQZlBMSlhqODNkK2E3VEl5bG9SRVZwUkt4TzlpUjlrK0VXc3RYTDZWRDZV?=
 =?utf-8?B?cjA5VTZtemYzVGtLbnFGYkc1QjBsMTdBNFVZNGVvS0xodko5VENhVlJQckhj?=
 =?utf-8?B?QkN5bXh1bDhJVEJQMjNBMGROYVB1ZDNtSFVtOCtybHlTZk02RkJFeHM0ZmVp?=
 =?utf-8?B?eS9iUVBzNWtXZzdzTlpuTVNYNjRncmtVK2xLMVlRT1lYK1JWWnArUzRjOEQ3?=
 =?utf-8?B?VTgycm9FRGE0ZUdLcjZyRmVWT2p2OGJnVXdaZXViRjBBelR1RG54WWcxaFR5?=
 =?utf-8?B?cUlQNzUyRWhGU29LUmRnVHhpVUFuVGlDOVRoU29iTlpueFRQUkY5bER6b2pR?=
 =?utf-8?B?Z3FndHBaTGhSU3p3ODBjc2p5NWVwYWxYUEkvR3FaaXB3QUppUFRnQlRkREtC?=
 =?utf-8?B?L1N2WTdKL05zZDI3RURWTmpLVFhBMnBXRDdwclZZYnlJK2twWHhpYmhDUEFW?=
 =?utf-8?B?aXFqanlwbDJsR0FwRkpkQlVEOUJtK3JsR0xKeEk0cmg5c3A5cHlxdmU0Z2hB?=
 =?utf-8?B?dkhwaCsxTVBLbzJvWEtha3FrWVJkUUdOdWVyVkhmd3dBeExabVZFTEVGRW9S?=
 =?utf-8?B?dDl4dVVoeERTNXZ4c3dCd1RZQzB3YnIwNnRhK0EvOWRYZklnak8yb3FTbVIy?=
 =?utf-8?B?alNxaDRmdkhnUUZ4bEJZdjlkYUYwcm50ZHpsalRsWGcxS3VNQkdkQkxiL1k1?=
 =?utf-8?B?Q0xDZnVXQkNGQlhySnhpZCsyOWNOUjdidE13L1NxT2xKRzZVOEM4NGVVMnlz?=
 =?utf-8?B?S0xXcXFjQVZNdGlnMTVhRnpOd3NjeHI5L2IrcDFYejFINXVUeVByTG4vZm5x?=
 =?utf-8?B?aFNnbDVGcUFjbllteFlQVFRjRTc2aW9HTktISkJCYVM2T0Fxb0NORXlJWlJw?=
 =?utf-8?B?Qyt1eHg0OUtIeEhUSm5kYWNZRGxmVE54ZGNDbkh6dWlMMnJ4TkRaWHRoREg0?=
 =?utf-8?Q?qtOAYpv32DzYh9COHf/VGFMxv?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b5c4df5-44d8-4c73-20b1-08dc6c3bfbe3
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2024 13:13:26.5554
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IsKCV3MzsPaHV6FuLQIUwE1z3AlbnmuFE+6k6bOen/PYAptY1ACmRlUrV16UCorDIjT5k+tijSoDho+Qyfas5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8174

From: Peng Fan <peng.fan@nxp.com>

Use scope based of_node_put() cleanup to simplify code.

Acked-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c | 27 +++++++++-------------
 drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c | 18 +++++++--------
 2 files changed, 19 insertions(+), 26 deletions(-)

diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c b/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c
index 6df7a310c7ed..27f99183d994 100644
--- a/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c
@@ -480,7 +480,6 @@ static int starfive_dt_node_to_map(struct pinctrl_dev *pctldev,
 {
 	struct starfive_pinctrl *sfp = pinctrl_dev_get_drvdata(pctldev);
 	struct device *dev = sfp->gc.parent;
-	struct device_node *child;
 	struct pinctrl_map *map;
 	const char **pgnames;
 	const char *grpname;
@@ -492,20 +491,18 @@ static int starfive_dt_node_to_map(struct pinctrl_dev *pctldev,
 
 	nmaps = 0;
 	ngroups = 0;
-	for_each_available_child_of_node(np, child) {
+	for_each_available_child_of_node_scoped(np, child) {
 		int npinmux = of_property_count_u32_elems(child, "pinmux");
 		int npins   = of_property_count_u32_elems(child, "pins");
 
 		if (npinmux > 0 && npins > 0) {
 			dev_err(dev, "invalid pinctrl group %pOFn.%pOFn: both pinmux and pins set\n",
 				np, child);
-			of_node_put(child);
 			return -EINVAL;
 		}
 		if (npinmux == 0 && npins == 0) {
 			dev_err(dev, "invalid pinctrl group %pOFn.%pOFn: neither pinmux nor pins set\n",
 				np, child);
-			of_node_put(child);
 			return -EINVAL;
 		}
 
@@ -527,14 +524,14 @@ static int starfive_dt_node_to_map(struct pinctrl_dev *pctldev,
 	nmaps = 0;
 	ngroups = 0;
 	mutex_lock(&sfp->mutex);
-	for_each_available_child_of_node(np, child) {
+	for_each_available_child_of_node_scoped(np, child) {
 		int npins;
 		int i;
 
 		grpname = devm_kasprintf(dev, GFP_KERNEL, "%pOFn.%pOFn", np, child);
 		if (!grpname) {
 			ret = -ENOMEM;
-			goto put_child;
+			goto free_map;
 		}
 
 		pgnames[ngroups++] = grpname;
@@ -543,18 +540,18 @@ static int starfive_dt_node_to_map(struct pinctrl_dev *pctldev,
 			pins = devm_kcalloc(dev, npins, sizeof(*pins), GFP_KERNEL);
 			if (!pins) {
 				ret = -ENOMEM;
-				goto put_child;
+				goto free_map;
 			}
 
 			pinmux = devm_kcalloc(dev, npins, sizeof(*pinmux), GFP_KERNEL);
 			if (!pinmux) {
 				ret = -ENOMEM;
-				goto put_child;
+				goto free_map;
 			}
 
 			ret = of_property_read_u32_array(child, "pinmux", pinmux, npins);
 			if (ret)
-				goto put_child;
+				goto free_map;
 
 			for (i = 0; i < npins; i++) {
 				unsigned int gpio = starfive_pinmux_to_gpio(pinmux[i]);
@@ -570,7 +567,7 @@ static int starfive_dt_node_to_map(struct pinctrl_dev *pctldev,
 			pins = devm_kcalloc(dev, npins, sizeof(*pins), GFP_KERNEL);
 			if (!pins) {
 				ret = -ENOMEM;
-				goto put_child;
+				goto free_map;
 			}
 
 			pinmux = NULL;
@@ -580,18 +577,18 @@ static int starfive_dt_node_to_map(struct pinctrl_dev *pctldev,
 
 				ret = of_property_read_u32_index(child, "pins", i, &v);
 				if (ret)
-					goto put_child;
+					goto free_map;
 				pins[i] = v;
 			}
 		} else {
 			ret = -EINVAL;
-			goto put_child;
+			goto free_map;
 		}
 
 		ret = pinctrl_generic_add_group(pctldev, grpname, pins, npins, pinmux);
 		if (ret < 0) {
 			dev_err(dev, "error adding group %s: %d\n", grpname, ret);
-			goto put_child;
+			goto free_map;
 		}
 
 		ret = pinconf_generic_parse_dt_config(child, pctldev,
@@ -600,7 +597,7 @@ static int starfive_dt_node_to_map(struct pinctrl_dev *pctldev,
 		if (ret) {
 			dev_err(dev, "error parsing pin config of group %s: %d\n",
 				grpname, ret);
-			goto put_child;
+			goto free_map;
 		}
 
 		/* don't create a map if there are no pinconf settings */
@@ -623,8 +620,6 @@ static int starfive_dt_node_to_map(struct pinctrl_dev *pctldev,
 	mutex_unlock(&sfp->mutex);
 	return 0;
 
-put_child:
-	of_node_put(child);
 free_map:
 	pinctrl_utils_free_map(pctldev, map, nmaps);
 	mutex_unlock(&sfp->mutex);
diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c b/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c
index 9609eb1ecc3d..4ce080caa233 100644
--- a/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c
@@ -150,7 +150,7 @@ static int jh7110_dt_node_to_map(struct pinctrl_dev *pctldev,
 	nmaps = 0;
 	ngroups = 0;
 	mutex_lock(&sfp->mutex);
-	for_each_available_child_of_node(np, child) {
+	for_each_available_child_of_node_scoped(np, child) {
 		int npins = of_property_count_u32_elems(child, "pinmux");
 		int *pins;
 		u32 *pinmux;
@@ -161,13 +161,13 @@ static int jh7110_dt_node_to_map(struct pinctrl_dev *pctldev,
 				"invalid pinctrl group %pOFn.%pOFn: pinmux not set\n",
 				np, child);
 			ret = -EINVAL;
-			goto put_child;
+			goto free_map;
 		}
 
 		grpname = devm_kasprintf(dev, GFP_KERNEL, "%pOFn.%pOFn", np, child);
 		if (!grpname) {
 			ret = -ENOMEM;
-			goto put_child;
+			goto free_map;
 		}
 
 		pgnames[ngroups++] = grpname;
@@ -175,18 +175,18 @@ static int jh7110_dt_node_to_map(struct pinctrl_dev *pctldev,
 		pins = devm_kcalloc(dev, npins, sizeof(*pins), GFP_KERNEL);
 		if (!pins) {
 			ret = -ENOMEM;
-			goto put_child;
+			goto free_map;
 		}
 
 		pinmux = devm_kcalloc(dev, npins, sizeof(*pinmux), GFP_KERNEL);
 		if (!pinmux) {
 			ret = -ENOMEM;
-			goto put_child;
+			goto free_map;
 		}
 
 		ret = of_property_read_u32_array(child, "pinmux", pinmux, npins);
 		if (ret)
-			goto put_child;
+			goto free_map;
 
 		for (i = 0; i < npins; i++)
 			pins[i] = jh7110_pinmux_pin(pinmux[i]);
@@ -200,7 +200,7 @@ static int jh7110_dt_node_to_map(struct pinctrl_dev *pctldev,
 						pins, npins, pinmux);
 		if (ret < 0) {
 			dev_err(dev, "error adding group %s: %d\n", grpname, ret);
-			goto put_child;
+			goto free_map;
 		}
 
 		ret = pinconf_generic_parse_dt_config(child, pctldev,
@@ -209,7 +209,7 @@ static int jh7110_dt_node_to_map(struct pinctrl_dev *pctldev,
 		if (ret) {
 			dev_err(dev, "error parsing pin config of group %s: %d\n",
 				grpname, ret);
-			goto put_child;
+			goto free_map;
 		}
 
 		/* don't create a map if there are no pinconf settings */
@@ -233,8 +233,6 @@ static int jh7110_dt_node_to_map(struct pinctrl_dev *pctldev,
 	*num_maps = nmaps;
 	return 0;
 
-put_child:
-	of_node_put(child);
 free_map:
 	pinctrl_utils_free_map(pctldev, map, nmaps);
 	mutex_unlock(&sfp->mutex);

-- 
2.37.1


