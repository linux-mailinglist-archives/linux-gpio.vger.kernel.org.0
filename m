Return-Path: <linux-gpio+bounces-6086-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BECB38BBBB8
	for <lists+linux-gpio@lfdr.de>; Sat,  4 May 2024 15:12:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 41C9C1F21D07
	for <lists+linux-gpio@lfdr.de>; Sat,  4 May 2024 13:12:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75B062C190;
	Sat,  4 May 2024 13:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="mVbjghYD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2079.outbound.protection.outlook.com [40.107.249.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45944A1C;
	Sat,  4 May 2024 13:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714828345; cv=fail; b=RZn/6nKDtgsvZCVftpGWqfML4gtjo5wOmFgvUIauAu/st5GycmR7kYx/X59DBnuvIoqWmIL0cv5TPkDDi7BeTRrI306egXJ9zcbFEH283xsWl2KxhaxIhL8KUKHAi+Dw06d1udBH76wvzJWCMt29TZ7MbIsWkxwXasi39Lxx/6Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714828345; c=relaxed/simple;
	bh=Psxl1oJ+xJ34kYUX8I+QBV4aSroRJk4mWf2+If3BgkQ=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=RbrEPwOGQ7KEHZ9HE0zYD4ENJhoRRdy2bD2SYRi8ThPq1n1ItnPX3n0Wo70+6k3brGr0w7+T661lmzO3ZQu64vw92bW1xzAJK2DvdJGYuBVIPTKKbQbgx/CeIHmMcDYouE2ZcJWRJrrPE4YrnjJRQImA8qHbWUj35OnWCMiYKcs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=mVbjghYD; arc=fail smtp.client-ip=40.107.249.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FXUDUbcDRVGIanueProxcTpJH0z2Aet1R0xqHltasXBJKywe1Gt/0WpMBQlLdGAhe5rXLowiRRY8pLc6+U5XWjbXyw4Q01SvtkWqBLzJtWk99Kbc841UFvIpZjqz0jYXtmgAPcLBjdt2Rekc1RXfnY6XUPuqXZu63XozTvfMH5ccS+1T/teMp+YGYBo0U8d9MS12xbBxRqtP/CBtHEIe3LoozsQqN201D2ywg1iC2i+95eZFIujwRzjxOlzfzo+6Ot/mjKVZ2m2i+xGFiVb9wRF6E46CwXugoF11Qsdl5jhstgyLgRoPCoX2OK/Uh3dtyxRK1S1cyOMkLQr5dSNCPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jR9dIeiHtuSRGz7ubbTGx1Y1d/RRRbeURdFmCd/Ctyc=;
 b=Ef4uXNCE0QiSoozdrN9vFmt2DCIufVrSGLI6/eSnmFbM6d9axJzCjmhXNZ7cBc4d+zRXmb+/fdWDx12hw/BhPGkpLmDo1fgdOafhnh6leAwi6PzN4QpoIIzunh101LRcvddnIGX05IQ2Rtk8TRaGuoJxrfWHVUU/8F4SV5RmxWfC7BM5nUvCz0OphjBSeNOMObmLQZ3adyDhPQH9+GgekPx0HM5gur7lPW1pdcapk293INvcJxUl7sRYjlR1Mfk3kyznV/rg3FE572FJBYsJw+U0igQ28J1+1FsfT5lrzO0JlpUOC1fqJVVg/xVZh4hcvyt2/HOXuncNt7fcxbIqtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jR9dIeiHtuSRGz7ubbTGx1Y1d/RRRbeURdFmCd/Ctyc=;
 b=mVbjghYDDiCssjCRhW0dUaabYtTf9luaTxJv+wmY7X4WVRdrnCTVVU5ajvZhFyHGJGiOODnybsedpAfpWnh2WQvjnk7NLWnxmfk9vGDy8YMEWWgd09ihvvGS0GZr/z3YwerYgSJ1HZFaiuT4/ja5FaH+fz30RiAzE9W96wq3IGk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by PAXPR04MB8174.eurprd04.prod.outlook.com (2603:10a6:102:1c4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.39; Sat, 4 May
 2024 13:12:19 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d30b:44e7:e78e:662d]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d30b:44e7:e78e:662d%4]) with mapi id 15.20.7544.036; Sat, 4 May 2024
 13:12:19 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH v2 00/20] pinctrl: Use scope based of_node_put() cleanups
Date: Sat, 04 May 2024 21:19:58 +0800
Message-Id: <20240504-pinctrl-cleanup-v2-0-26c5f2dc1181@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP81NmYC/2WNQQ6CMBBFr0JmbU1bSxFX3sOwIMMok2DbtEgwp
 He34tLle8l/f4NEkSnBpdog0sKJvSugDxXg2LsHCR4Kg5baSKNbEdjhHCeBE/XuFQSZwViFJ23
 NGcoqRLrzuhdvXeGR0+zjez9Y1Nf+WrVUf61FCSmatkHC3liq8erWcET/hC7n/AFe3iR8rAAAA
 A==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714828815; l=4658;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=Psxl1oJ+xJ34kYUX8I+QBV4aSroRJk4mWf2+If3BgkQ=;
 b=cjF+2rF7bQJj6MhGLe4rUUqhOggP0pnLi0klFDpMx8UZ0YJRw0vQ6D+zPeUCVYVlNO4REBwFX
 BBDaJVRXvQqDfPs8bJGItpx3NL+32ktRC7IYCxCnVBxC7GqD2V3NB12
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
X-MS-Office365-Filtering-Correlation-Id: 251d355e-e9bb-4ef6-8900-08dc6c3bd3a0
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|376005|7416005|52116005|1800799015|366007|921011|38350700005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TTdzSUFWOHlRc3QzZEhiQmZiYmxXOEM2RzhXaUs2MTBraEFQWWlEOEd4V1FM?=
 =?utf-8?B?Y3ArNEh4UldQN2U5WCtGZHNocXpuVUUzcERJS2lVR292Y291c2NoNXRKdG9r?=
 =?utf-8?B?TnhwQWZuR2tmeEhxNjIvcHRJY0NpblQzQXNhYndBTFNaYkovSmVzbHNHYWEw?=
 =?utf-8?B?MEk2RVpoN05DT0d4cWkwZmhEb0JRUk5YMW45S1gzN2paQWZNMzhmWjhmejk3?=
 =?utf-8?B?RG94WVpISnVraGYvbEt1MGk2cjBDL2p1bkt4ZUEzbjdLT0Q1WFV5OUcwWVVr?=
 =?utf-8?B?OEFtY1BibjRTMlcwM3hRb2diRHlyeWVhckcydW1HSlRDdFdEdzNuNnQ5aTFq?=
 =?utf-8?B?eWFCL25XL1orOTdhVi94QmhHb2ZkdE5wT2ZKNkNGS2gvZWVFV213YldCaWcz?=
 =?utf-8?B?UzZpcDFLaDdUT2F6QnhKTEI5bG9MVE1Cb0RpakNlL2pleC82U0poc3NWZVlC?=
 =?utf-8?B?MUNYR2FoVWhiTnVDUUxQYWRmUmV4VENwcmdTUjRGQ3RleTA2ZjFQWWpuYzE0?=
 =?utf-8?B?VXlpTVRsT3VPTzMweVBlc042ZmwyOVNVS1dMcnUvSHZKaVRXRi8zZGJGRXd5?=
 =?utf-8?B?aDY5R0dmRWJIVWR0UzFYTDlWN2xRRk9ZRStqVEQwN3RrWDdXUElsdkpkSXBP?=
 =?utf-8?B?c1JyV3RLMHRLT3U3YWpiZ3QreGt3Q1lOREtYSVN5RWRLaG9aS0JjVE1jMnZT?=
 =?utf-8?B?MHA0a3R3TDlDY1BMTlA4cU9jdVdXTm1aaFd4ejVsSUE3NFRmU3JtOEJSWnJQ?=
 =?utf-8?B?a1JoVlJ2YnpqVzhJaWR3S0lhNXFUbFJqNlV1bGxpT0Z4K3BDTE11bWlNZGdr?=
 =?utf-8?B?TTkxWmhHWVBrKzNoT0Vlc2tDQXowM29lY3AzZ3dSZTZTUTA1QVdCQllCVXNE?=
 =?utf-8?B?RlZkQWVuSFZsLzhCaDF4MytLdVpFbFBrTGlFcXRzelhiNjlUV2dYSUpMM0Vh?=
 =?utf-8?B?YjY1VDFZeGVaM1ZnN0wrYUN6Tnc5cnMwb2FNMkN6UGtlV2M4a25JbnMxb1kx?=
 =?utf-8?B?cmpzN0psazZPbE9oZkZVeWkwK2ttWUswbzlSMnhhdnowNHovaTIwMWNnQy9M?=
 =?utf-8?B?ODc5VVAvK29SOWNrQ01rR2tEZTlQNm1OdGFKQTFqWnNJNHV3TW5icHh3OTNm?=
 =?utf-8?B?dE96M0NXazJ4NnYxZ25LYkVKaHdTZTRlVGRNZzNwVDdqRUsreGFqOVZHRVJM?=
 =?utf-8?B?OGdtcmlxSHcwT2ZTUU1rN2syejF1MFQyMUxUUVErQVE0MWR2eGthUmNVMEFh?=
 =?utf-8?B?NytqZHhkUnA5aWtiTDRxazk1VFAyOEhiblcrLzc2b0ZNbnpRVmdzVHVkdTRs?=
 =?utf-8?B?ZUlNM0xNRHRheXEyekh6ZHBWTjhJNERDOTZPVUFsbStxV2tsNjkrbzJLNDk4?=
 =?utf-8?B?MVNhcW0xMnhpSkdscDY3N2JuOVBEcnNneTBJMGJwWk1JWWpaUksrM1U1MVBD?=
 =?utf-8?B?SDJNeTRKUmU1ei9LNnJFaHA4QSt2TmcrSWtGOUZoSHZSUTdkVS94eVJxZ1Rj?=
 =?utf-8?B?dGN6RWE5Tmg4ZTJxR0lKSnFUSHZ4c1RGNk1qS0xvTWMvSXo0bXhMQmFnejd1?=
 =?utf-8?B?OVFBeGZ5UVNaa1ZnU1d3aGtwUHFGd2NQUWFLYXJ5aHFYQ0MyNS9tOGMvVjk5?=
 =?utf-8?B?ejlsUWp6SzVUajJiNlFlVElhZktKajQ3WTZVcHZveG94anM3R0NHWmZNS1li?=
 =?utf-8?B?N21jSDMxdzNoMlhNZ3psOXNEM0NWK0hLVUIrOThCeTQrVGdjL2pmNVlTY0Vn?=
 =?utf-8?Q?qjYilr7TE0hFKLTrJE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(7416005)(52116005)(1800799015)(366007)(921011)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UHdDN3p1Y29uYUUrZkRsZ2dqOFZVZHBoWE1JajNtU21Fc3hwUElnZyt2RGhO?=
 =?utf-8?B?TnE1SFdMTEJscDNaUHZMQWFFaUlwYVk0ZnJZZ1pWY0Nuait5cUlkb1FnVW5M?=
 =?utf-8?B?cGFUdGFnQ1JQUTVINFROZGgrWG85V3dFcmJ6cFcyUDZlVFMzZVg5RVJMY0dz?=
 =?utf-8?B?a2srVytsYjh2cThIeHNkSmRqTzZyQUwwMGVwMis1azVCWWVkdngrS1BxNW1R?=
 =?utf-8?B?N3ZQN3JMbDVFZVREVjMzbzJSYW8vU0hBZmxWbGgzRnhkMWJiV0lDNkJIZnU2?=
 =?utf-8?B?UWpFT0svaE5LQ3V0SVhMZDRORjNRZzNBNXBESlFNQytySWc3K3F5SmtyTWRh?=
 =?utf-8?B?UWFxV3R2S2hHeEllajc0Mks2akhIdkFvQjZ0YmNJOUlzbWFxTXhuZWZuUWxR?=
 =?utf-8?B?SC9IYkFiQTBaVlFmaTA2L2VzQWV4bTROaGdodUM1UFFnelQ4SGZSOFRHZ3Rl?=
 =?utf-8?B?UlZBWHhodWlQQTJKTUVxV2U3c01qem5tV3ZSdEZGUEdZWEFFbUZ3cmIzVlIz?=
 =?utf-8?B?MGplTnByejRVL282aGZKbXMyYWU5V1ZZMW11UTE5OFFnMmxlUVlJUm5QV2xu?=
 =?utf-8?B?SjJReDBOYVZMdTBLanVuSHc3S2VlUi82SlBBUXV5L0hwSnFxdEtxSEdwSU5J?=
 =?utf-8?B?cXZ6NXZpS3Y4Zzc1WklEaE1SVGZMZXdkZjFDaGIxd000bWI0dVNQeEQzSkVP?=
 =?utf-8?B?d0RnUjVlblh2NXovUGVXL1NGUHErSmQ0SDZMSER0SVlITEp6d242Yzc2Q01l?=
 =?utf-8?B?ZFdBdjhjWWZFdmtxQWpTQ1hVQ3o0NEhTRlZ2VTRZYmxPK3FWdGFzUEhKUURR?=
 =?utf-8?B?RTlGT1lOaXpybW1lSnoyKzZ2cjQ2YU9CYlFzZWFWdU8yQmIyd0ZnZmxqZFl4?=
 =?utf-8?B?K1JFUCtmYUpEUCtQbjU0VVpsYVUwSlJuV1pnajZtSGZLcklxWCttZDRpUW93?=
 =?utf-8?B?MitWR3VYWU4wZnR1Mmw1eXZSemdET3UwQzVXZEhjc0Z6WGg1ZzBnRWtsaGp0?=
 =?utf-8?B?T0RwbzJ6NHY1d0gxS3pjTnVDbWs5YmZZR0RHU25tVjgrTUVacjVYVTRKN3g5?=
 =?utf-8?B?b1FTYXJXWU44cTJOV1hHc3N6dUJJbjVyV00vcFkxTG93bW1aeWMxQUNUbFpE?=
 =?utf-8?B?QTlDOTRKUTliV1dsa2RoV2kveXZpa1ErT2hZN1AzMzZUOWI0OVdTYVZOZGpm?=
 =?utf-8?B?bUlocHRhQ2lFdUFTV2RadVcxSG0zWnBHR1ZlVHVUZjZFMG4wcXNrRlN4Tk1J?=
 =?utf-8?B?MDJKa3FOZExKSWFEbGpGaG12M2lhdVkwUGRVbmE0Y1JORVZNVlF2aGVnb29q?=
 =?utf-8?B?K3dHREozNE9pdzFRME5taVQwZkkrOFIzLzBmemRaYUh1WWFuenp6YVZuWS9i?=
 =?utf-8?B?VzdjK0hzU1RqTGVuTjlRTlE0b0luNWNlQlJyODFnZjI2ZFkvZy84bVFrcWR3?=
 =?utf-8?B?NnBTMnBkUzFNbzJhOWRGVm1UajRIK1JPT1U5MlFpM3NmK3RrV0J5YWM5dTg1?=
 =?utf-8?B?WjFIaEdLL3djN1lvV1oyTU04TFhHdjFDZlFFS05qenBtZ2pPQnRJNnlFdDhB?=
 =?utf-8?B?bjRMZ3JkSGR3Z3JMOStLaDhpcFNBT3EwYzNUVFdGS09pZ1pkaG5TM1d1K3Q2?=
 =?utf-8?B?dE5RWGVuUGpXVFM2ZzQ0V1lhY0lyWm9XK3dQQmJkV2NhVnRPMzF5YVNoVmJF?=
 =?utf-8?B?Ylg2TTNLdHdNMUpNZnByR3VRTFBNUUU3UlR1Y1F1RklIUlMzdUp5VnVnWXhC?=
 =?utf-8?B?SzNrOU9LV3pPcjl2UWtGNTEwSVpxdE8zUHY4S1ZHdGh2YnllRmpDUFoyZld6?=
 =?utf-8?B?OTBXMmxlVHV4WFFQUExLQ3VVRkkrZ3A1UENvYWNGRkc3cWtNdjlCK0RkTUpO?=
 =?utf-8?B?Ukx2Tk52OTg5THloMTIwM0haRjFiajU5NWM0UlFOOVQzVnZQYzBEdHRhWTdX?=
 =?utf-8?B?S3NZS24wc1lib2FlbEY1TzFNTlNrS2EzRSsxSlJVSE9vVVJUWjNzaFhkaUFR?=
 =?utf-8?B?YVZNOHhqYUxKZHNwbXpZMjJnenphV3V0bUNreGpobWp4MEtTdWxDVlhNTlA3?=
 =?utf-8?B?SHFobit3RUQ1OXh3aUtzY3FBVXYyL0JMOWRKYkQrdy90YUFINXg5VW9zMm9u?=
 =?utf-8?Q?7P5QEXVo8iRqJuhlM3OxqsbIk?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 251d355e-e9bb-4ef6-8900-08dc6c3bd3a0
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2024 13:12:19.1441
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2FQMhTUfAZfQJS70hq3OAoIeeGhMmkBwaNi1toUM7P1Km+cABdoa91gEp06PMj/RP7svmWkPK1/CTg6KKaXHfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8174

Use scope based of_node_put() to simplify code. It reduces the chance
of forgetting of_node_put(), and also simplifies error handling path.
I not able to test the changes on all the hardwares, so driver owners,
please help review when you have time.

This patchset was inspired from Dan's comments on pinctrl-scmi-imx.c,
thanks.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Changes in v2:
- Drop aspeed changes per Andrew Jeffery
- Drop changes to code pattern that of_node_get(or other refcount
increasing) followed by of_node_put. That said, but I still have a
change for samsung pinctrl that drops several of_node_put places. If
this is not welcomed, patch 20/20 could be dropped.
- Add Fix tag for patch 1
- Add A-b for patch 4
- Drop unneeded {} in patch 8 Per Dan Carpenter
- Add a new patch 18.
- Moved patch [19,20]/20, in case people are not happy with the changes,
the two patch could be dropped when apply if no v3 patchset.
- Link to v1: https://lore.kernel.org/r/20240501-pinctrl-cleanup-v1-0-797ceca46e5c@nxp.com

---
Peng Fan (20):
      pinctrl: ti: iodelay: Use scope based of_node_put() cleanups
      pinctrl: tegra: Use scope based of_node_put() cleanups
      pinctrl: stm32: Use scope based of_node_put() cleanups
      pinctrl: starfive: Use scope based of_node_put() cleanups
      pinctrl: sprd: Use scope based of_node_put() cleanups
      pinctrl: spear: Use scope based of_node_put() cleanups
      pinctrl: renesas: Use scope based of_node_put() cleanups
      pinctrl: st: Use scope based of_node_put() cleanups
      pinctrl: rockchip: Use scope based of_node_put() cleanups
      pinctrl: equilibrium: Use scope based of_node_put() cleanups
      pinctrl: at91: Use scope based of_node_put() cleanups
      pinctrl: s32cc: Use scope based of_node_put() cleanups
      pinctrl: nomadik: Use scope based of_node_put() cleanups
      pinctrl: mediatek: Use scope based of_node_put() cleanups
      pinctrl: freescale: Use scope based of_node_put() cleanups
      pinctrl: bcm: bcm63xx: Use scope based of_node_put() cleanups
      pinctrl: pinconf-generic: Use scope based of_node_put() cleanups
      pinctrl: freescale: mxs: Fix refcount of child
      pinctrl: k210: Use scope based of_node_put() cleanups
      pinctrl: samsung: Use scope based of_node_put() cleanups

 drivers/pinctrl/bcm/pinctrl-bcm63xx.c              |  4 +--
 drivers/pinctrl/freescale/pinctrl-imx.c            | 25 ++++-----------
 drivers/pinctrl/freescale/pinctrl-imx1-core.c      | 16 +++-------
 drivers/pinctrl/freescale/pinctrl-mxs.c            | 18 ++++-------
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c      |  4 +--
 drivers/pinctrl/mediatek/pinctrl-paris.c           |  4 +--
 drivers/pinctrl/nomadik/pinctrl-abx500.c           |  4 +--
 drivers/pinctrl/nomadik/pinctrl-nomadik.c          |  4 +--
 drivers/pinctrl/nxp/pinctrl-s32cc.c                | 31 ++++++------------
 drivers/pinctrl/pinconf-generic.c                  |  7 ++--
 drivers/pinctrl/pinctrl-at91-pio4.c                |  7 ++--
 drivers/pinctrl/pinctrl-at91.c                     | 14 +++-----
 drivers/pinctrl/pinctrl-equilibrium.c              | 21 +++---------
 drivers/pinctrl/pinctrl-k210.c                     |  7 ++--
 drivers/pinctrl/pinctrl-rockchip.c                 | 11 ++-----
 drivers/pinctrl/pinctrl-st.c                       | 37 +++++++---------------
 drivers/pinctrl/renesas/pinctrl-rza1.c             | 14 +++-----
 drivers/pinctrl/renesas/pinctrl-rzg2l.c            |  7 ++--
 drivers/pinctrl/renesas/pinctrl-rzn1.c             | 23 ++++----------
 drivers/pinctrl/renesas/pinctrl-rzv2m.c            |  7 ++--
 drivers/pinctrl/renesas/pinctrl.c                  |  7 ++--
 drivers/pinctrl/samsung/pinctrl-exynos.c           | 16 +++-------
 drivers/pinctrl/samsung/pinctrl-samsung.c          | 19 +++--------
 drivers/pinctrl/spear/pinctrl-spear.c              | 13 +++-----
 drivers/pinctrl/sprd/pinctrl-sprd.c                | 14 +++-----
 drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c | 27 +++++++---------
 drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c | 18 +++++------
 drivers/pinctrl/stm32/pinctrl-stm32.c              |  4 +--
 drivers/pinctrl/tegra/pinctrl-tegra-xusb.c         |  7 ++--
 drivers/pinctrl/tegra/pinctrl-tegra.c              |  4 +--
 drivers/pinctrl/ti/pinctrl-ti-iodelay.c            | 37 ++++++++--------------
 31 files changed, 133 insertions(+), 298 deletions(-)
---
base-commit: bb7a2467e6beef44a80a17d45ebf2931e7631083
change-id: 20240429-pinctrl-cleanup-e4d461c32648

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>


