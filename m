Return-Path: <linux-gpio+bounces-6096-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 718CF8BBBFF
	for <lists+linux-gpio@lfdr.de>; Sat,  4 May 2024 15:15:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 93032B2196C
	for <lists+linux-gpio@lfdr.de>; Sat,  4 May 2024 13:15:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E6643BB4D;
	Sat,  4 May 2024 13:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="lZr7eJvK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2041.outbound.protection.outlook.com [40.107.22.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C4C83AC0C;
	Sat,  4 May 2024 13:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714828512; cv=fail; b=G0fgLjKR/eRBHNDp2CJhIIlUW41QwEHx4ppxzJ75xGzUpRI4iSagfCVRObl1mZ43/yZvMtrtHptmTKixxqjcQ9H/8xyaK3LpnPp7nukAPAsWSS5Zsw/tvIZl6J/u+Kle/3DHPe1T5hJipPady7W+FIPKjVhl0xNhORhxT2fqqYI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714828512; c=relaxed/simple;
	bh=E6ik9M6/qhOWxdXMSi5wfgwa6MozB3Zte/4KB5unPbM=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=fP07JKr0G6x5MdEAKWwKd2aFDmDHYhhmSY+4FfiSdFlf+d2q1Mx0ZG0tiM3LTQVIJ/KB/I+VTpl3MCqEJSXw07r8UH7dcDj7mroNWzKJ4IPEANfO7OMYJ2DOd1HkcUFYYshYiuhu0BVgmSFiY3nl55jkusOI6YYnha441jO/vS0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=lZr7eJvK; arc=fail smtp.client-ip=40.107.22.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oWcs9F6D1cAInFj0HNId55OgFiP/mkBRJdDBth1QPgZ5CaKgqIAALcgcQA1NjWptsksyVAzXuhsB3we/2egExl9uYbbVtaxdsq0leD3umqoNBu+9Ccxb8izBxX0JQ5w2zPGyFCIG9XcR9h6EXqpY9B2EPYkqz1V/CygsdPAe63ZvpD3Dk8JuG9HlU5X2ruOSETUaCKiZQEW253cf5Cl9oHzq5xhhjeYZR33/Siq5yx3CO9DxCQUZN4xP9Uos93z0tmyzcRg52dcbHPDW2YDrx6viOehHk+dnvXdGsJS7iqL209vw/qHQhIAGk6ML/9vKar82r7wkfCYgoO50+FPaUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RKzscdFMbKHIkbo5TBU/zyPoN0zmGs6d6fVNhcTfxjo=;
 b=h5aiCFA3yIhGGeDVFZp9kTNSwyd475ryEOK/SwQEGNwyuf8nAUKXiAKpeWOtGrkrG/DAkGmwU0FmaxJJ/Qh1ToPDh8oAQCYFNqzdxmG4x4XkI+CnQsToa3zZzW0z+Y/5kqztve3wax35JxlgJWPRQn4Cj1p84j2V3kd47RIp/pQr40bX/BY68ySZ4z7ZxdMDbCFd8EbpPEOLzCm4qeSjfrQeVc2esgF6218qpIGtcad4RckxyhOxOnng93HiR+/Vm/o3J5TAJEiDNV0Jwip3eEaq6gcIi1RI6108Cm7yMH84PCPm3puWCkSFF3Q7LIEUKhJ6cEUQ7cK9iu1lQSsOPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RKzscdFMbKHIkbo5TBU/zyPoN0zmGs6d6fVNhcTfxjo=;
 b=lZr7eJvKLCQzJZDvJgt7Naxc5QoUcJvqDpm0lF9CZdP2zjbsNCbQcGc2VU0uaTeQ1RX0b3Mq05FEoza+cTb1C87bIBo7Ud/6+Gotll2gHMQo0KA/svrXB2TElm9iznEQIx28QiSe8Fzb0dRRnqVsvZ9l0QoJ7H4RinW3AYeTC4k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by AM9PR04MB8633.eurprd04.prod.outlook.com (2603:10a6:20b:43c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Sat, 4 May
 2024 13:15:07 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d30b:44e7:e78e:662d]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d30b:44e7:e78e:662d%4]) with mapi id 15.20.7544.036; Sat, 4 May 2024
 13:15:07 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Sat, 04 May 2024 21:20:08 +0800
Subject: [PATCH v2 10/20] pinctrl: equilibrium: Use scope based
 of_node_put() cleanups
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240504-pinctrl-cleanup-v2-10-26c5f2dc1181@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714828815; l=3196;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=HA5FdeU3k8hXGIzvGdYVmDetKxvVIH+CQmWTQZMAMaY=;
 b=5/9X9Qk9v/w+LR87FogVZNrWJ/LbCFJXvedVd7p6cKDdq763RoRF3HqVmtqSayI+ZxqnUpTVv
 9nppgP1puY4C3uChQOu864GCcusz2Mno4rh5TLaHidULc7StN8ugZY1
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
X-MS-Office365-Filtering-Correlation-Id: e5a5311e-56df-4041-119b-08dc6c3c37ca
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|52116005|7416005|376005|1800799015|366007|38350700005|921011;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K2UySGRvcHJHVnJ6WHJtT0h4L2E5R1YzdlRET1BYSFpkejZzN29TMmYrLzNT?=
 =?utf-8?B?N3lwQTdjendEMGU3cjRkZVUrRFdyckJxYURzQU14T3pwVnBxdGxuTnRBSXo5?=
 =?utf-8?B?TC8vbFN3ampOcTR0T3RrOEtneloyaU14QXFjRzBnR3RBSDJodS9veHM4bFJy?=
 =?utf-8?B?SUc1UHBtL3ppNk5uN3hOdG1rRDU5ZVFqTTQ4WDcwY0hhNmNKcDlDTzVkbHFH?=
 =?utf-8?B?TWRmN093dFpadXljbGlqMG9xZ1NIT2hvK1hSeW5LNGZRYVVUWDFtQy96NFBy?=
 =?utf-8?B?QWFSN0s1YUJRRWpVU29Nb2VlMU5wYWZKWHB4bnBsRG5tUWo1T0VUVlJVb0V6?=
 =?utf-8?B?ME04bHI5RFpEeEdYWjRFUGNQdXZJUlBTRGZ6UGluSHRqNjZQR0xWUGRIZXNx?=
 =?utf-8?B?enRUd0lJM3k2OG5wRGNxV1BtV2J1Znd6WHlLRGcwbTYrenlydHVyZHlGOUpF?=
 =?utf-8?B?UUplbjl4ekxlZ0duM1hvT29HV2xweW9Oc1hSVWpIQWpoMFg3MU1vR1lBbHpx?=
 =?utf-8?B?RHdyOHI2ZCtPSE81Y1IzcGl4bUgra3ZWeGFjZDdwYXVGaWo3NnZGSVV5c0I1?=
 =?utf-8?B?c2lVa0ZvY0RUejlyVUVQSXFvbm9lZUozZTUzRVU2Ti82eTkwZ2FBa3RmbG4v?=
 =?utf-8?B?RVM2OXZUdkRwQTNvNWtDUWhYWlFmUVIvTUVSSEM3RUUxK0NDQnRXQkdvWUU4?=
 =?utf-8?B?aWc5Z1Fta3pETEUrV3JZNWtCUGVlUjJFMVNvRjduNmtRWjNnWHpIcWQ0VUth?=
 =?utf-8?B?dWU4RmhoaFFOREpCSW9DRjlsZkRiYThRQVo2Q0xSSzNpRUxZUFQrSUQ3cGtI?=
 =?utf-8?B?L1pWdHFTcFdLdTUwT2ZJd2hXOHdvNmw1djFiQ2wwakF3QWFSRTB1eVZFUlpL?=
 =?utf-8?B?QVZMSWs0M3k0MGhzblFwMDV5TWZwUFg5VThhNGVGUjBaTGg1bU50T0o4dCtm?=
 =?utf-8?B?MjZsMDhEejQwMDc1bnhCd1hLQ1g2UXB5bjNyUCtPbm1oRk5WVlhMenZ2MjRk?=
 =?utf-8?B?K20wWVhGSlR6WEtJUitpWm1jNDJocVJsVmxCd1dtam9razBwdDNTRkZ6UWhG?=
 =?utf-8?B?L0xjMk10bklQL0J1UlhSU1A5UDJMbkN1YW12ZE1uVzQ3dm1RbnhvejR2TEUx?=
 =?utf-8?B?SFVta3hWUmkyWGxKZzV2NGFISmZWRGVwS0dXY0Zvbm1uRGtYRWxrd2ZwbGJO?=
 =?utf-8?B?UCtnNEl0V09UUDBaMzBqY3ZIUzJvU0Q3KzRkZGZrUDNjMitUTytnNWlkYUlD?=
 =?utf-8?B?M25MZWQ5RVd3d2VRYUx1L3hhTzhjcG9QNnZDMnZjSUEvcHdkUFIwbU1JdVgw?=
 =?utf-8?B?NFlldkRYTDY0ZVVENW1RN2t3cjhTRmdFclhMRExGNkVLK0s5VE9RSnZYWHhC?=
 =?utf-8?B?RTJmWnVsWFR6UjRQeXNLaG5nSkMvaWpCYW84bk50TlFLc1BOYWtqQ1JGbVdZ?=
 =?utf-8?B?UWdINDk5VmlLT09KSDViYU5va2xIZXFockgxSXpqYXgrWkNMQVJWVHNmV295?=
 =?utf-8?B?NDBzTTM3clFVeGlqQmVpRndteHFRTUxjUjBiQTVmM1FTRWZMeElvc21oazBh?=
 =?utf-8?B?MVFjVG55T1hzZWVnY1BuakdBM2pOZytXanJ5dTEzR0ovY3Q2OUJYQWxQUmF4?=
 =?utf-8?B?dm1hKzBYMW9HYW1XRXExaDRBRFpNdW5tZXVRQkRWYis0WkdrRmtPMG1yVDVE?=
 =?utf-8?B?OXdUQ3RKa2xXaUxLZ1ZnL3F0NGRMMkd6a3V5VFBwUUhneFJOS1ZJZGh1MTFj?=
 =?utf-8?B?dkkwSmtsUWFtQjRIb0J4WmVWeXZ5ZVhKWXN3L2ZsVk1pTFBEby9EUWZlbzlt?=
 =?utf-8?Q?ZEu9B7LC9bIlEV3yco77GgnAwjjydpT+PXlH4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(52116005)(7416005)(376005)(1800799015)(366007)(38350700005)(921011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MTg4UXZMeXppOE44QXViRWRoK0pyMlFZQTZ1U2Y5bTduN0FNbFhxVzJSUHhw?=
 =?utf-8?B?YnFmZEZxU3YzaHFLdk5NS0pkeStHbjRvT2kvc3E3TjBUOWw2eEJJNG9iemlS?=
 =?utf-8?B?VHYvTmhxbXNmcDRWV3p4bXVPWTJWZExVQTNoTzlXZHBZQmNuL3k2eFdkcm9x?=
 =?utf-8?B?OU80UkdzN1dPbUVGMjJNbmR5UEcxYittc3BqRUJsdHpRRXh3U1BYc0xYd3Rn?=
 =?utf-8?B?eTNncXpOcm52QnhRdXgwNkQwR25BRFlZNTJTVCt4aGZsRjhocnJzeXFkVkNX?=
 =?utf-8?B?YUJUeXdUSnd6aHRmK3NZcnlLeG1uSlRPQS9BMjF1V1o2dDJRNzA0V1FoeC9N?=
 =?utf-8?B?Ykd3Ylo5SFVuNzYxbHZHQStmZGVrQjc3ZCtGeEg1V2ZYYkxTZ0IraWY4SHVh?=
 =?utf-8?B?TUFTbG1qWkI5NFFEUjhuaEZDWVg2R2JpdjVBbStqd3dVckpFRkVjM0VweFov?=
 =?utf-8?B?aFNnMHZ4TWZVa3BoMllGU2IzN285NmlaQVhTSUZra3ZsaXQwMkZrdXZPcTBW?=
 =?utf-8?B?Z3BhbnZKTyt0T1ZvdWx4alk3VU1aTGo0MDlrd3dtdHd3VjRnTXJWS2FaNENY?=
 =?utf-8?B?U1FwcjZpZERpT1lLeGZ5RmEwMW5ObklsQUlZY0JQM3N2ZDNmM1hhQTVabHFE?=
 =?utf-8?B?eHNSTjV4Q3RiNDVkTmNlbjFzYXAybFAxYmtQbEx5VzBLckNZUWQ5M0syekhz?=
 =?utf-8?B?Q0F4b0VSYU1ycER3bHYxdzEzU21IbUJLNEo5T0xOZ2VWMm14QXFjZGovZG95?=
 =?utf-8?B?aHhTY0NhYnhIV1dNWVE5N0NrUm00SjV6N3E2cE9IQ2lMREpMMlV4UUxpemVO?=
 =?utf-8?B?dUFyL053eC90dWhFTXoxM09RL1p0YVZScXdxSmpRWkg3R1pIRFZtS2MxdGFu?=
 =?utf-8?B?S2FVek1FNngwSFpteFZuSVJ6M213UXlZaXpHZEdxMlNFVUZSMkJIem56OXIx?=
 =?utf-8?B?VFNaQ0hLNVY2Q1VNYTNaZDR6NnBBM2YyRXBYdDVtN3M2KytoVVVDenlNY1FK?=
 =?utf-8?B?OGY0cmk5VCs0b0NBSDNrUXd6Ynh4S1JBRU5kN3d6OThzVEcrbWJmWlY2WFZX?=
 =?utf-8?B?WWhETWFTSlN2UVliYm0yTFV0Tm1sZFJkRmJaSXhNNXRGVC91NDdIdUlyV042?=
 =?utf-8?B?MWxXMUNUQzZmb0psUlo2UTdvK01uRjJiU3JteFUyOWVpeDZoS2hmUmNvRWZS?=
 =?utf-8?B?NDlTVXR2MTFWQm1VeVJKZERFZXYwOXl6UFByRzE2RUl1RGpVTkM3UlhxUVBG?=
 =?utf-8?B?WmNRN04wUVJWb1VhQlk0QlpMSUlVR1U4RSsxZjlaQWVYRGJjMmZaSkx0Rzhx?=
 =?utf-8?B?Ky8rOFRMajBuL2tCalhyczVaRTQxVkJFekZMT2RQeFkwZnVMWUZRa3l0RWEy?=
 =?utf-8?B?Ump5Q1F0Yjd6ZG1ta1lBUnZ2aWs1bHdKK2k3Qk9MZW5mQUxMS1JzZE9OdUUv?=
 =?utf-8?B?WVpab3lST05nRmtIRnN6Tm9kS1QxdDV3NFRaSGM4L2JieFBvenM2aE9OQjAz?=
 =?utf-8?B?N3RDQ0JWMFhWUUl1S0FVMmxxRmNQNmNGT2Eydi82L2JXcjRsN241SFVVNnJJ?=
 =?utf-8?B?N05NR1hROEltMEdVUzBFZnJLTksxd3B4SHpXWTV5ZVBHOFNONUFSZ2E2OThL?=
 =?utf-8?B?QThrVjlBMFlZeVpldTBKR3BGdWY5eWhubG1naDVOL1pnMWs0cnpmRjJWTEk1?=
 =?utf-8?B?WHViblByQlFGaGtQTitQTFNNN1RvOEJJVUxZdmw1WjQ0VjNydm0xVjRCVFhm?=
 =?utf-8?B?R3I0WFpLMXhhT3VxeXduZTg5Wm5Pa1VOWWEvNTFFcXVSL050aTQvUVFmNEhs?=
 =?utf-8?B?UHhJK1ZabWY2N2t3U2RuUUlhWjhOa2duSWwwdE9BK3ZYMzZMV1I0ckYwV1pM?=
 =?utf-8?B?a056Qnk5cktWUjk0cGFIVnNCUlc4NWpJWmdlVVEwQUZYTlI1aTRUeEFIODFa?=
 =?utf-8?B?RU5jd0NVd1Y5VHhUYmxkNXdSaWt0aDVQWFBUY0ZYcjdGTUkxTXZQZnU0QXhh?=
 =?utf-8?B?NFU4ZGRHWjBhT2d0cTR6U3Jxb2JGWklib05ZUHpRY2V6RFVhS0hmSmQrUTI0?=
 =?utf-8?B?QmJyVDhrYndxYmVsWndoREhSVG5SYzRLMFNPV25FQTFPbkZJVytobUduamR6?=
 =?utf-8?Q?MpG+xFD7kktKN64Yq6XoGt67O?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5a5311e-56df-4041-119b-08dc6c3c37ca
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2024 13:15:07.0565
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tgqzsjFOhmoOiJr4CQutCoVr54qf+mNdPaAiocqwbFYANx50RD96f41YT+/5iD2RuPK65b/qDDXMDb1ZrTn3Ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8633

From: Peng Fan <peng.fan@nxp.com>

Use scope based of_node_put() cleanup to simplify code.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/pinctrl/pinctrl-equilibrium.c | 21 +++++----------------
 1 file changed, 5 insertions(+), 16 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-equilibrium.c b/drivers/pinctrl/pinctrl-equilibrium.c
index 6e1be38865c3..e727257bb697 100644
--- a/drivers/pinctrl/pinctrl-equilibrium.c
+++ b/drivers/pinctrl/pinctrl-equilibrium.c
@@ -588,14 +588,13 @@ static int funcs_utils(struct device *dev, struct eqbr_pmx_func *funcs,
 		       unsigned int *nr_funcs, funcs_util_ops op)
 {
 	struct device_node *node = dev->of_node;
-	struct device_node *np;
 	struct property *prop;
 	const char *fn_name;
 	unsigned int fid;
 	int i, j;
 
 	i = 0;
-	for_each_child_of_node(node, np) {
+	for_each_child_of_node_scoped(node, np) {
 		prop = of_find_property(np, "groups", NULL);
 		if (!prop)
 			continue;
@@ -633,7 +632,6 @@ static int funcs_utils(struct device *dev, struct eqbr_pmx_func *funcs,
 			break;
 
 		default:
-			of_node_put(np);
 			return -EINVAL;
 		}
 		i++;
@@ -706,11 +704,10 @@ static int eqbr_build_groups(struct eqbr_pinctrl_drv_data *drvdata)
 	struct device_node *node = dev->of_node;
 	unsigned int *pins, *pinmux, pin_id, pinmux_id;
 	struct pingroup group, *grp = &group;
-	struct device_node *np;
 	struct property *prop;
 	int j, err;
 
-	for_each_child_of_node(node, np) {
+	for_each_child_of_node_scoped(node, np) {
 		prop = of_find_property(np, "groups", NULL);
 		if (!prop)
 			continue;
@@ -718,42 +715,35 @@ static int eqbr_build_groups(struct eqbr_pinctrl_drv_data *drvdata)
 		err = of_property_count_u32_elems(np, "pins");
 		if (err < 0) {
 			dev_err(dev, "No pins in the group: %s\n", prop->name);
-			of_node_put(np);
 			return err;
 		}
 		grp->npins = err;
 		grp->name = prop->value;
 		pins = devm_kcalloc(dev, grp->npins, sizeof(*pins), GFP_KERNEL);
-		if (!pins) {
-			of_node_put(np);
+		if (!pins)
 			return -ENOMEM;
-		}
+
 		grp->pins = pins;
 
 		pinmux = devm_kcalloc(dev, grp->npins, sizeof(*pinmux), GFP_KERNEL);
-		if (!pinmux) {
-			of_node_put(np);
+		if (!pinmux)
 			return -ENOMEM;
-		}
 
 		for (j = 0; j < grp->npins; j++) {
 			if (of_property_read_u32_index(np, "pins", j, &pin_id)) {
 				dev_err(dev, "Group %s: Read intel pins id failed\n",
 					grp->name);
-				of_node_put(np);
 				return -EINVAL;
 			}
 			if (pin_id >= drvdata->pctl_desc.npins) {
 				dev_err(dev, "Group %s: Invalid pin ID, idx: %d, pin %u\n",
 					grp->name, j, pin_id);
-				of_node_put(np);
 				return -EINVAL;
 			}
 			pins[j] = pin_id;
 			if (of_property_read_u32_index(np, "pinmux", j, &pinmux_id)) {
 				dev_err(dev, "Group %s: Read intel pinmux id failed\n",
 					grp->name);
-				of_node_put(np);
 				return -EINVAL;
 			}
 			pinmux[j] = pinmux_id;
@@ -764,7 +754,6 @@ static int eqbr_build_groups(struct eqbr_pinctrl_drv_data *drvdata)
 						pinmux);
 		if (err < 0) {
 			dev_err(dev, "Failed to register group %s\n", grp->name);
-			of_node_put(np);
 			return err;
 		}
 		memset(&group, 0, sizeof(group));

-- 
2.37.1


