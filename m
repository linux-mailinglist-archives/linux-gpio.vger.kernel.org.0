Return-Path: <linux-gpio+bounces-6106-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE418BBC3B
	for <lists+linux-gpio@lfdr.de>; Sat,  4 May 2024 15:18:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3FE581C20FBF
	for <lists+linux-gpio@lfdr.de>; Sat,  4 May 2024 13:18:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B243F3BB27;
	Sat,  4 May 2024 13:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="BiuzAJRq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2066.outbound.protection.outlook.com [40.107.22.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F92438394;
	Sat,  4 May 2024 13:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714828679; cv=fail; b=p/vNYG+6u7IHsuuZYZGMx/RlfWfc1eNHhGZEuSZKbHWFo4PEiw/Q8Liz0xh+SFOieEGeyLjd4MBANNx4Ow386ChMXtJpF+iUd5i6BXl2fPUn8yw2QrfLM4ye+sU4WcCEOXd4RfUuRDQQ2lRCbOV65cX84lae1uxayBDfUlyc5c4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714828679; c=relaxed/simple;
	bh=wMNSJkH/G6gb8vDhU37wTmbLXobqUGpvvFnYEW9f+eM=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=TBTkh4ZMsufjGcWdgJWdjZL3icZnZmp7299YZ+XWNNjkThsDY4OnqiTK8WJE8IKTJKpWMs6rKsqFZiFrCNWYtObdMgeAvTDYnOu9EIrhw4uKN+X1RYfju6rDVS4VZvuTNshp/4HeeteUF8y0fs2Wx1J0Gf07t5IKgjNtFkmYZOo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=BiuzAJRq; arc=fail smtp.client-ip=40.107.22.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MeqS3lzaTiTvvMpQkhxAqx5LXu9Qz5Eun3vOl5nnj8mwXBiR+kPagCszrMCqC/HX7ErnmtqmkeHTlsQl7mCDF5OUcE2weGzTeSDHfeYnp627g+vC66DWr5E2/g0ozE3Oxe3HpjuwAK8453pa3XLNlyrFkMhz1aWOVQXdfoJJSarYTNDNhZXlFk1zo7DHTyvhVq7GQc0xx6AOWV8BG2Z343zDEYH9BJMW4vx6fWZakzmjimLoG0RmF6npsV0ooZRo3KVzUHfYatmil55/XwTirR6IhZ6eddWT/jwf3pcth51hCFg9Nw4lxdARDPsLR4HOLxLpr9s9edGjfYIKroB11A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ppg9aWlK4+huIGMqna4KeQPNUar5cHCrgX7Io5VTsjo=;
 b=eSqoOAsUP7zY+Kz27f04NZE8iZsc0ibTh/UKOCUYR1zdYHH2E8lajoRSyA8sDy3HvYin2IPk9R9VINGcz+xnoU97GgyO8xrHjmxu2PIo0KvE6tC7T/CwSOswA7haahV0t3JTAFusYl7ZfoYYlEyg3x/jM8xnEE8NlM9isHl5oWn1cm/Ts8fvWezutcVuUjLsPXSXVuNq8PsDytUlaICnsw+GZuSTWAzjFVSBxhATNrlGrb6xEVrIa8kevPTzME95TFC+O5OgK9hFHWIPZQ0VjhfolUDqh/LI067mWsjVDswRfZ9stebFk4P+850KwVhkLF2pWkabx1CYbNVTUU8lSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ppg9aWlK4+huIGMqna4KeQPNUar5cHCrgX7Io5VTsjo=;
 b=BiuzAJRqpHcg55cTD7Unx+2M7N8+VFhoSv+0CWmFBcYl7Z/WnOM/7NK2dREH09pZnPG9i0D+o39Dt0+CWJE4qgWqLizCKQMOXCFo2BGb5flRUGdzlr/E+bM7i1JWwUDG2zPwHzjuq5+8P3TF0T71rpYbqr3BGQgJwdLA/S60Cm8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by AM9PR04MB8633.eurprd04.prod.outlook.com (2603:10a6:20b:43c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Sat, 4 May
 2024 13:17:54 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d30b:44e7:e78e:662d]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d30b:44e7:e78e:662d%4]) with mapi id 15.20.7544.036; Sat, 4 May 2024
 13:17:54 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Sat, 04 May 2024 21:20:18 +0800
Subject: [PATCH v2 20/20] pinctrl: samsung: Use scope based of_node_put()
 cleanups
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240504-pinctrl-cleanup-v2-20-26c5f2dc1181@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714828815; l=4267;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=Eha3FnaEY3bzUrakRMW1Ov8R+kXDm5JzTBhq10KxbQk=;
 b=j1GGjC8jOMD9Vols6kLJMsB1llGpiQjkJR5IlNAnfWDcAKwLbiKZUAALPTehYonJf7lE4q/wH
 yzEqddp4EMID2GMdMRfAxpHQh4H/pYIY+KCEK/dlCVBsLbU5lsfKaOD
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
X-MS-Office365-Filtering-Correlation-Id: 88a760b2-963a-44f4-0ccf-08dc6c3c9b5e
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|52116005|7416005|376005|1800799015|366007|38350700005|921011;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QXR3dkpDNi96VXJwU3NaNnpLcDNSY3dCYkZrUXRvNUw2QUU2bjdmTEhYaFds?=
 =?utf-8?B?VFZ2QlhscVF1NmV5OTJranhqRE0yeDZ6YVdkcmZMcjhXS2theWVUc09nVm9x?=
 =?utf-8?B?aDJiclNJbHVxRkFFMmJ6YkVKdmthZWlxYW1KZjBCS0c3dVZJbHFBMWlLdk1q?=
 =?utf-8?B?aUxuNXVsVTZLc1F2d3FiYjlIZVRReklhWVJ0UnIyTVQ2NDN2KzQwTEUyUWZr?=
 =?utf-8?B?VGF1Y0kvVjZ0ZnpHOW9JVk1JSFdnL09zUHpya2tPYmlqVDdwR0p0VUx0M0Ez?=
 =?utf-8?B?YW5HbkQvdFRlU1pXWjR0ZEtVYzYvRnN2YTdJQnA2MmZYekJlVXpNQzVwQ0Jo?=
 =?utf-8?B?MWJKZXl1T1ZTdkk4UmdpS24rY0MydkVkSTFZc05IOW9YcmpwK3NvYUxhOGdZ?=
 =?utf-8?B?VmFLRGRISTN3MXdPWG0wTDB3WlhLbjJhODdKOEF4OHQ0anlSV0V4d0dnTmlP?=
 =?utf-8?B?cDEzZzZpWVRFQUlBbi9wZko3T0MvdlNtMUlLWGlIcFJ6cEllVTVkSjRJNC9n?=
 =?utf-8?B?N3lnVTE5ZTZmT2x5S21IVUhaT3F5cUZVSmlIVmtEbi92aUoxbENlNC91dTJy?=
 =?utf-8?B?MGNDbDhCRkUzbCt2ckwwbHRhd2FBbk95dnJ1WG1vQ1lXNWJ2MDRNaGV3Mnds?=
 =?utf-8?B?QVhraHFzTHZZeXZiOXFYN0VjTUFlQjNvVnNGUG9VL2VNOVorMDJtZjhIdm5j?=
 =?utf-8?B?THBqaU5QSlBjcUozdXNTL3NsdU1LVFFFeVZId3FqMGl6dUZaSnBjSEs1eklr?=
 =?utf-8?B?bEVwUEczSUpodEJVcjVsVExTZWZqM1NJcWdxYXlZYzR3TTRlS2FzejdCQkNX?=
 =?utf-8?B?cHc1cXVQZjNNS21PTmE4dm1WNzN5WWh6UTd2RE1DN3hybXpsU0NPU2NrN0ZG?=
 =?utf-8?B?dk9NbUVDTXhJNEhuWWZpSkZ4S05GT0FhK2R2ak5PamVla1dyS3FGWXpYSm5N?=
 =?utf-8?B?TTd4L2dUZDRMYWlWbmF5RmlFbW5zUFA0ZFNpTW9XbVpUN3lSWHIxcEtTUjA1?=
 =?utf-8?B?eW52Q25HZmVUMlZRUFRyYUdJc0IxN0xDZng0VENHQXdsSWJieG1YeXNzTHZE?=
 =?utf-8?B?Z0lyNTFmZXAvdWlQdTlqbHlIU3pLc0hUUW93WVVzRjVPb0UxeStOeWdDR0xi?=
 =?utf-8?B?d1pBZGZFL0lxakZmeHZjVWhiUmU4M3JPNTd1cWtjU1FsU0pncFVQc1h1aGlQ?=
 =?utf-8?B?NFlwUEFnWVJsVGwwNkVzNTRPV0lDUzhNOXJXaENaV25YRXRwdFNkTE5UeFVm?=
 =?utf-8?B?QzRWd3J6UHptaitxR0c3cnVGRjliVE43Y0tRV3FKTFZmTWtUNWgxalNka1E2?=
 =?utf-8?B?bzJGeDNuU09RekpNeFVzV09zTSsydlpFa0ttNU9UU2FwYkxYUTV6UFNuVVVk?=
 =?utf-8?B?WXBBVE9yMVhFTVZCS2hQRW5YOEswZnJ5QlVxb1RCSkpCd2ZLR1M3Z0hDMUsz?=
 =?utf-8?B?Wmtaa0tvTGVHeGVoM0I3dW5ZdUsxcWNKL0l1Z3dEZWVDUktSaml5Nk8zT09z?=
 =?utf-8?B?RDQ5SmpJRDF4WmVRSzdzd21ERnh5R0RzUmdzWktGeFBQMWF1eDdhVGdEYzEr?=
 =?utf-8?B?U1NQN2F0c2dVR1RLMi9wcUdMcE02b1JlaUppaWdWOERUQzZxdzF0V3psVUZo?=
 =?utf-8?B?ZUw4QVhxOHJ6SW5NRWM0OXhTQTBiSzExZHcvVlVxdGlzQ2x4L3lzdVpzSita?=
 =?utf-8?B?YXRtTkNTRmp3Z0tnWmwzMWN3aDdxd1drVXlRK255SXZUdHozSkdzZGE3VUFW?=
 =?utf-8?B?M3Rabm5ISHpoOFBMOVNEaEpIL2dnR1pQczVHQyt3L0YzRzlEbWk5M0k4S2pl?=
 =?utf-8?Q?o5nj42PJt+NXtAKdRgjYHq9jkqvSUlEv3EhhQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(52116005)(7416005)(376005)(1800799015)(366007)(38350700005)(921011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bDdkVkM1bWpaUFpJMFRRcnJBY2xKQjJTRGRGZktacDFyNFVsZnBiR3E3dk9j?=
 =?utf-8?B?NkdoTWFINVBZaDNTSmpBUjI5RThEb1VpWXdXblRGVXR6cmYrNmRDSHFTQkZy?=
 =?utf-8?B?dWRza3pOaEF2UHRsRGcvR0x2SlQxNUJVSWFhVW5RWlFnZVhKQUpLOGtjcFd0?=
 =?utf-8?B?ak1xS1N6c3lmeWhDaHJ3c3hiaDBjNjJ0MVU2dkRyazNmWFg5RFJibXlXZGFE?=
 =?utf-8?B?SG15WnpVQXkyUjEzYVdVYjRMZEJ1b05hWkJMMnpxZXhXMzE1UzRDb01mZTZX?=
 =?utf-8?B?bXpBQ3R0UWV3b2ZLVSs1dU1uWGJOSWdpUmxHR1IralpCZlZ1NGhSaXlSenJr?=
 =?utf-8?B?ZXFtckREeVBGWHhaVkdXQlNlb0E4aWhva0RocldOQzhPV0ZnUjJFeG1OUm9i?=
 =?utf-8?B?U3dTTTJldlo2anEwd2JXNlNRNjh5VElOZEtYTmVNd1NhckhyM0NHQ2Q5eUc3?=
 =?utf-8?B?VmYzRXhESWdqR0tzaVdkMEdmd0RJaGpuVGhZcEhHMkoxN0VGNDQ3bVYvWk1q?=
 =?utf-8?B?Zy8xNUt6YWZ0R3pMUFpyT2d6RGQ4eHFXQ0hZVytaejJ1Mjl4dFlHRFdPaE9G?=
 =?utf-8?B?THdHMExGOXBaTFpVYTlseTAvU2lsOHVCRHdXN04zbmpBUFZkMWF3YnF4VWM2?=
 =?utf-8?B?ZmY2RXhoYkxqeWYzZ0pseHpKTm1UdGZJVm90UTZtOEhwWDZUTm1mM01yK1pG?=
 =?utf-8?B?YzlxLzYwcDVUU3JRQ0o0ZFd5MjQ1U1MvVnBhbjF5YitTemY5bktYYjdJUTNQ?=
 =?utf-8?B?SGFXTjF6dVR0MkxudkxvbXAvY0pzbzRCWENxK1BjQWRSOTh2LzFEUDE3V1l2?=
 =?utf-8?B?T1Fpbk5OYzcyZjZzODE0b0RhU3czV2VqL1NSeklXbytDK3d3bmJqeFdLa2ZQ?=
 =?utf-8?B?elRuZjBHdXRXdUNZUzFLOFJFRkZqZnF5WlJLUEk1R3RtY0E3ZUVKZE5JYnBt?=
 =?utf-8?B?SEtxd2w0MXZQNG1jdWVCN3FPQUp2cjFOWmpDMEdEWU96azNnMWxYU0lqWSt2?=
 =?utf-8?B?UEhrTXA3OElTM3EzMkx5MEk0N0pvWVRHU1BKMXVBT0RVN25JVmpLR0tnbjRM?=
 =?utf-8?B?SnlXcmVXOEdiWUN1ZTUvUTkyR0hRWmJ0TEUvdWZYWXBMdGlaOEN1amNtaExL?=
 =?utf-8?B?dWwvSFJwTjhlVDgzZnc4T3BrRnMySjJpWUp3aUV3bDBoVENRN0M4VlZEZE0r?=
 =?utf-8?B?ZmdTbWZhRWJRTFI1TVBDdERuclZENmpaS3poSlExc0FreFUzR0h6cElIekZN?=
 =?utf-8?B?d3h4WmhHY28rakxBNVRDdkVPWDlkMDZVMWNSZGZpMUxSbktGLzYrdVhOQ2xH?=
 =?utf-8?B?TzNDZkpJTHR2LzNjei9KMXBxTHJyVnpIWksxT21FTk9zc25PbkJycTVWbTM2?=
 =?utf-8?B?aUh6Q2xLQ21JU2VZOXVGTjZEUUt3dWhnTTQ1OExkNEF5cTN3c2FYQnZjbDhT?=
 =?utf-8?B?aFE0bVFsZzBUTHhRWTl6YnRGV1hYUjVsbFEyN2dkUjRXMUF1VzE5OUhCMkNi?=
 =?utf-8?B?SGJXOXhERmVKNzZCdXA0Ykw1L1Y4YUl1bVBVM2lIKzdQZ3M1ZkpBbzVVOTk2?=
 =?utf-8?B?VzkxbTlNMWJ2MTVlcFJ2NDQ3UkQ5OVZGczRMZmYyZTVFN1NRUkhmb0xmUVdL?=
 =?utf-8?B?d2Q4T1FkOFpmbUNhakhuVC9KaFRETXlUWUdneTJIbWhhenRGTnJMNVJMbzlT?=
 =?utf-8?B?Z1dUZTdSN05HdldOckM0Ujgya2NsYlNuK28wb1VnaGNPZ0sxTXRiQWhocWZR?=
 =?utf-8?B?NjZYQ1lOWS9GQWxRU2hJRmhEMG1aWUVzVmJVakdaSlBybnVLUzZ1L3VoeTRx?=
 =?utf-8?B?cnI1VHZLaHJSc0tSS2FMTWt3cExUdjZ2elhIRy9vT2xJd1UzZlBaTlJ1enZn?=
 =?utf-8?B?V2RodWtmOC9CM3VDZFRvTG9IUG9JM0Z5V203SlQrdGFyR2xqcDhITTlQVjlx?=
 =?utf-8?B?aHR2RkVFKzFiK013K1FRREpvSUw3SWlkd3FQOFhGSnlRUStSeW9aczlYeC93?=
 =?utf-8?B?bm9ndFlpZlBCMWdiTVBWUitBMFhiRng4dzN5YzN2VDZkU3pnVlM2MDVveHZL?=
 =?utf-8?B?K0k5N0Z3RmpvdmYraFcyRnpkeUZUcUZaZWtPT3FKTDhLeUlzY2RjM0NuTFpT?=
 =?utf-8?Q?j0sc2s3iOIgmVIm42Bh4c/Evd?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88a760b2-963a-44f4-0ccf-08dc6c3c9b5e
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2024 13:17:54.1216
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Myzq3/6MY/HfklO204D+tBTrg7YaOAS/vgCDdDbFCJdHIDCD0ERvNPhbgg//sC5GpTgalc5VpfcOuOy0J9z9lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8633

From: Peng Fan <peng.fan@nxp.com>

Use scope based of_node_put() cleanup to simplify code.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/pinctrl/samsung/pinctrl-exynos.c  | 16 ++++------------
 drivers/pinctrl/samsung/pinctrl-samsung.c | 19 +++++--------------
 2 files changed, 9 insertions(+), 26 deletions(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c b/drivers/pinctrl/samsung/pinctrl-exynos.c
index 871c1eb46ddf..3775999536e2 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
@@ -582,7 +582,7 @@ static void exynos_irq_demux_eint16_31(struct irq_desc *desc)
 __init int exynos_eint_wkup_init(struct samsung_pinctrl_drv_data *d)
 {
 	struct device *dev = d->dev;
-	struct device_node *wkup_np = NULL;
+	struct device_node *wkup_np __free(device_node) = NULL;
 	struct device_node *np;
 	struct samsung_pin_bank *bank;
 	struct exynos_weint_data *weint_data;
@@ -612,17 +612,14 @@ __init int exynos_eint_wkup_init(struct samsung_pinctrl_drv_data *d)
 
 		bank->irq_chip = devm_kmemdup(dev, irq_chip, sizeof(*irq_chip),
 					      GFP_KERNEL);
-		if (!bank->irq_chip) {
-			of_node_put(wkup_np);
+		if (!bank->irq_chip)
 			return -ENOMEM;
-		}
 		bank->irq_chip->chip.name = bank->name;
 
 		bank->irq_domain = irq_domain_create_linear(bank->fwnode,
 				bank->nr_pins, &exynos_eint_irqd_ops, bank);
 		if (!bank->irq_domain) {
 			dev_err(dev, "wkup irq domain add failed\n");
-			of_node_put(wkup_np);
 			return -ENXIO;
 		}
 
@@ -635,10 +632,8 @@ __init int exynos_eint_wkup_init(struct samsung_pinctrl_drv_data *d)
 		weint_data = devm_kcalloc(dev,
 					  bank->nr_pins, sizeof(*weint_data),
 					  GFP_KERNEL);
-		if (!weint_data) {
-			of_node_put(wkup_np);
+		if (!weint_data)
 			return -ENOMEM;
-		}
 
 		for (idx = 0; idx < bank->nr_pins; ++idx) {
 			irq = irq_of_parse_and_map(to_of_node(bank->fwnode), idx);
@@ -655,13 +650,10 @@ __init int exynos_eint_wkup_init(struct samsung_pinctrl_drv_data *d)
 		}
 	}
 
-	if (!muxed_banks) {
-		of_node_put(wkup_np);
+	if (!muxed_banks)
 		return 0;
-	}
 
 	irq = irq_of_parse_and_map(wkup_np, 0);
-	of_node_put(wkup_np);
 	if (!irq) {
 		dev_err(dev, "irq number for muxed EINTs not found\n");
 		return 0;
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
index ed07e23e0912..0d4d7ebf7145 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.c
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
@@ -250,7 +250,6 @@ static int samsung_dt_node_to_map(struct pinctrl_dev *pctldev,
 {
 	struct samsung_pinctrl_drv_data *drvdata;
 	unsigned reserved_maps;
-	struct device_node *np;
 	int ret;
 
 	drvdata = pinctrl_dev_get_drvdata(pctldev);
@@ -265,12 +264,11 @@ static int samsung_dt_node_to_map(struct pinctrl_dev *pctldev,
 							&reserved_maps,
 							num_maps);
 
-	for_each_child_of_node(np_config, np) {
+	for_each_child_of_node_scoped(np_config, np) {
 		ret = samsung_dt_subnode_to_map(drvdata, pctldev->dev, np, map,
 						&reserved_maps, num_maps);
 		if (ret < 0) {
 			samsung_dt_free_map(pctldev, *map, *num_maps);
-			of_node_put(np);
 			return ret;
 		}
 	}
@@ -791,16 +789,12 @@ static struct samsung_pmx_func *samsung_pinctrl_create_functions(
 	 * and create pin groups and pin function lists.
 	 */
 	func_cnt = 0;
-	for_each_child_of_node(dev_np, cfg_np) {
-		struct device_node *func_np;
-
+	for_each_child_of_node_scoped(dev_np, cfg_np) {
 		if (!of_get_child_count(cfg_np)) {
 			ret = samsung_pinctrl_create_function(dev, drvdata,
 							cfg_np, func);
-			if (ret < 0) {
-				of_node_put(cfg_np);
+			if (ret < 0)
 				return ERR_PTR(ret);
-			}
 			if (ret > 0) {
 				++func;
 				++func_cnt;
@@ -808,14 +802,11 @@ static struct samsung_pmx_func *samsung_pinctrl_create_functions(
 			continue;
 		}
 
-		for_each_child_of_node(cfg_np, func_np) {
+		for_each_child_of_node_scoped(cfg_np, func_np) {
 			ret = samsung_pinctrl_create_function(dev, drvdata,
 						func_np, func);
-			if (ret < 0) {
-				of_node_put(func_np);
-				of_node_put(cfg_np);
+			if (ret < 0)
 				return ERR_PTR(ret);
-			}
 			if (ret > 0) {
 				++func;
 				++func_cnt;

-- 
2.37.1


