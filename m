Return-Path: <linux-gpio+bounces-6990-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C9E8D58DE
	for <lists+linux-gpio@lfdr.de>; Fri, 31 May 2024 05:07:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 316371F259E5
	for <lists+linux-gpio@lfdr.de>; Fri, 31 May 2024 03:07:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C7BE78C73;
	Fri, 31 May 2024 03:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="Q59/ouzq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2067.outbound.protection.outlook.com [40.107.22.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D311836134;
	Fri, 31 May 2024 03:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717124851; cv=fail; b=Ylveh5vHXpnmgHXvTJzjkw4cogGOiIHG18g/xJnC9zGRqOW36/tT+sE6SpsVGIBiHmw1WPkXdAZTFIov6zY2iq00oNWLeMRsqfuDV1bZBsng/YDZA9c234Wblaya5CsJfSYf/WYmo+K2yzUsrUSZ1V4A1ui0VHJVVfJoE5NBiAU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717124851; c=relaxed/simple;
	bh=vImCUN9tf1bdcFM4/Fc7jN1GDT1kccBTz3ppSdRIRZI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=uvjMl94n18+bwdClJG+KXJK2qV6/0rvPXmiNmx/80Hzq3HS/GYk82NJemi+Tfgexl05V5rDgKtSTeUXoAB63dRq3RkSfxQbmDMR14L36mXwrp9WuqjiQm3oIHHigzGbaVfpqUYoaUf3RqcWAvB1Ts5DEtUDAiupFZVyq2yHomkg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=Q59/ouzq; arc=fail smtp.client-ip=40.107.22.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TYyRCv5Df+ri2805+V8UXE9kK/r7faQcpH2OvHFIxmGctuFc7q8R4dQI8v1SIiXVs6IxaErz5cwIXtmTqqsl5zAN4F88DTgj+txwasXIYDAvNt0UNl7AhKloMz4yqF2hNH8tKHATQyQX1oeccyLniCiabHcdT7qqfVneKsP08sL2MH57RmCLTJD08upikEMAF2Ft/XR3Cy8f+5Qv26q5vig6WFETb+u6maHV64QZD3StKbg1KZHiW6HCWnaRWH50/P+kRDGD8fDvAdj7hGLjSBZV4w2n1IfMHYEZaf5ZQcciMu0WVq31gn8MGiwiiTPRl4CX1xEBWw+EAP74LeinJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vImCUN9tf1bdcFM4/Fc7jN1GDT1kccBTz3ppSdRIRZI=;
 b=bdibCwsHH5i6cmpF/EHuCRJd1TzMVmpj7YfgpMiSjewvamgezUzNXFUFb21OWQ3YcteYVd+S0YY0++Igb0znbkfbtHCEw8ZJwi0nHcvAMDlCCwPDThyn8Ejy1wt4qEeARn/qOVkS6pKkI+vpFZWKA78RF1jBexJoHJDe1M1/fJ2k1g/ChrPRFW902Vrc/X1z3n/5+ILGd1Q6G+dklp2vz1bvajqpYpUNvP57MYnc0NTsx28apUl9zRvXQkhw3Bqz/7IW65ui/YE66yaHmBFM2r2TVggx5Ayzpip9aflffnCH6Wd/4i1sJop6dC819pW8kUz0uPVi8XrLIeECEPxmVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vImCUN9tf1bdcFM4/Fc7jN1GDT1kccBTz3ppSdRIRZI=;
 b=Q59/ouzqaiT+feG1GlqMigKAQeGI2MUMS03GFhW+L03l3StrUEjCkz+OPczTDb3i1yVxj3f+AJJLfSD6fzm/Ha9oqQmK9myzVh4jxuKi4j298/NeEAEnqAx9TCBYcUsQ8NRoGG2dbKG+lh5/LotoE+zc20JNEcJWvLwEHM9jntA=
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by AM8PR04MB7761.eurprd04.prod.outlook.com (2603:10a6:20b:248::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21; Fri, 31 May
 2024 03:07:25 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::557f:6fcf:a5a7:981c]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::557f:6fcf:a5a7:981c%7]) with mapi id 15.20.7633.018; Fri, 31 May 2024
 03:07:25 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>, "Peng Fan (OSS)"
	<peng.fan@oss.nxp.com>
CC: Linus Walleij <linus.walleij@linaro.org>, Thierry Reding
	<thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Dvorkin
 Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Emil Renner Berthing <kernel@esmil.dk>, Jianlong Huang
	<jianlong.huang@starfivetech.com>, Hal Feng <hal.feng@starfivetech.com>,
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang
	<baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, Viresh
 Kumar <vireshk@kernel.org>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
	"soc@kernel.org" <soc@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar
	<alim.akhtar@samsung.com>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Patrice Chotard <patrice.chotard@foss.st.com>, Heiko Stuebner
	<heiko@sntech.de>, Damien Le Moal <dlemoal@kernel.org>, Ludovic Desroches
	<ludovic.desroches@microchip.com>, Nicolas Ferre
	<nicolas.ferre@microchip.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Aisheng Dong <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>, "Ghennadi Procopciuc (OSS)"
	<ghennadi.procopciuc@oss.nxp.com>, Sean Wang <sean.wang@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Sascha Hauer
	<s.hauer@pengutronix.de>, Andrew Jeffery <andrew@codeconstruct.com.au>, Joel
 Stanley <joel@jms.id.au>, Dan Carpenter <dan.carpenter@linaro.org>, Tony
 Lindgren <tony@atomide.com>, Stephen Warren <swarren@wwwdotorg.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	"linux-stm32@st-md-mailman.stormreply.com"
	<linux-stm32@st-md-mailman.stormreply.com>,
	"linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>
Subject: RE: [PATCH v2 00/20] pinctrl: Use scope based of_node_put() cleanups
Thread-Topic: [PATCH v2 00/20] pinctrl: Use scope based of_node_put() cleanups
Thread-Index: AQHaniSxdGSRMxSwNUygtutwA8lIt7Gv1KQAgAD9rtA=
Date: Fri, 31 May 2024 03:07:25 +0000
Message-ID:
 <DU0PR04MB9417FF2632A278BF6605AE1F88FC2@DU0PR04MB9417.eurprd04.prod.outlook.com>
References: <20240504-pinctrl-cleanup-v2-0-26c5f2dc1181@nxp.com>
 <CAMuHMdVprgpjDP6PDn7appofJv8Tv30nRA4+7n4sR8n6n4qy+g@mail.gmail.com>
In-Reply-To:
 <CAMuHMdVprgpjDP6PDn7appofJv8Tv30nRA4+7n4sR8n6n4qy+g@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR04MB9417:EE_|AM8PR04MB7761:EE_
x-ms-office365-filtering-correlation-id: 8c710791-4815-4578-6f3e-08dc811ecc56
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230031|376005|366007|1800799015|7416005|38070700009;
x-microsoft-antispam-message-info:
 =?utf-8?B?MjNUWWFtWi9vTDA3L2Zlem9TaTVSSGZyc0RYQUZKOTBqNWhxVklBOEJjODlw?=
 =?utf-8?B?WlpRaUhtVm5jRXE4aWZYUVFXazhCODNMVHV3YUIvLzVPOXV1OFkwMHlUV3N5?=
 =?utf-8?B?SFB4U3k3RE0yb2ZhYU1zOXUzZVR4Q3prU2RTTDNsUkJhQkxBbGpOQmVKYk9m?=
 =?utf-8?B?SEhtVUszODZwT2J0ZVNFVUVCekZXVWRIRVNRcDhNMWhub0xFTzluSTdISERQ?=
 =?utf-8?B?My9QaldHd1doY3Yra0xlUko5dmR6MFc2U0QwTUduN1NCUzBrMEthQVBVVHhy?=
 =?utf-8?B?K2VkZ1lsbHFvTUJmaFN2VjJjY1QrV3U4enlaYWEvaEdkL0owTUhsWFlSbCs3?=
 =?utf-8?B?amxWOXZ4Q1ZlSzE2TDA4VEVBU3kvQm0yRm9SWloyeEZZdHBZYnEzK0VQeTV3?=
 =?utf-8?B?aVJFamFtb0Z0bFFJbE0yMyt3bUlrMmpSQzlRK0hsM3gwNGkwcStDTGFHSnkx?=
 =?utf-8?B?cHB4cm9UTS9BUWQwRVQ2VGFwdHdCQXh0b1JhWDFuZEJOM1VlN1RTbzNnUVpL?=
 =?utf-8?B?czZoQ0lNaVJMM0NadWo5NkZUNmZTVkI2cTVEZlhQbUxjcHVEWWVXSWJ2OUJj?=
 =?utf-8?B?b3Bhb3Y5bWtLS0FHM05LRHF1aDMzNG1pOWxVQm13RGtoUnZSUVptN3IyOFhz?=
 =?utf-8?B?dmhhWjE3b2wwSjAwakNDVjBLMForUlhwSDMxVTNvV2o0ZkVkRTNycWFGVXBJ?=
 =?utf-8?B?a2YzZDRDc1JjTXNFa3RjcXdjeENrOWsreHRWenlIdUV4Snc4OGRNUWxiZlJG?=
 =?utf-8?B?U3c2RWwrWG8vSlJHV0t6UTZTWE0vaGZFNFYvTUdMNTI1UVgyY3R4VW9rbnlR?=
 =?utf-8?B?NXI5N29XeUJjMUp4eHV4VW9sL2wzQ1dsc0FPTmpuS3BvM0lzYWJQQk1kMDcy?=
 =?utf-8?B?Vi9STVBCS1VjQ3V4S3V5QkVTb2dQNXBGK0I1MmxOQ3pzVTJlMDBHWTlIdytC?=
 =?utf-8?B?UWpZeHo1eExFbFNkSXZBNDErdWNGbDE5OTZCNCtCcUYxWkNvWkN2WWxBUFlX?=
 =?utf-8?B?aW0xUmg5WUYvWGpvbkpRdTdTVHZ2MkZtMXR2MHJrWlRvRjRvc0cvdHR5Vktp?=
 =?utf-8?B?YkFXVWo0bmFlZjBNU2NLUXE0SkNGaGdzZEM1V2YvMVdTK3JITk5LbTJwQkxl?=
 =?utf-8?B?YUppVExsTzJzNHpSemF2YW1MM25kbzN3Sld2V1Q0OVgwS1FjaUxJOUNROEtR?=
 =?utf-8?B?MjlaTTdZUnZTdHBnKzNRMmlUQWFqUXFuWGZrZXJsaDk5R0orUDBvQXlxYkM5?=
 =?utf-8?B?VGt6T2kyWlFmRGdwek5keitrSGxFYjIyRFQ2QjMwKzk0SkhXMTJLQkZNK1lV?=
 =?utf-8?B?enBYZXNyUURBUFZVQ1hLU0MzaHNpNk5ySnRKdDg3TXA4b29yUzhRTm5sdFR4?=
 =?utf-8?B?NmR6bG9jNkpZdHFPamlnNVhPMVBBZngyVWJRRVFwSmc0ZlN6N1VMa0Y2WWhY?=
 =?utf-8?B?aFBva0NtZmlOMEpscklxZGtMS0tOenBvMlFtajZQSEhsdnFtMHkwWG93RGVU?=
 =?utf-8?B?bnNBQUVJZDRxSnkyR2RXNmhtNmJ1a3N2NnhRVUJQaVdVczZBV3U4MTd2ak0v?=
 =?utf-8?B?R3lpbEQwQ2dEYm1iWndJVWlRUnJjMFhpc1FWOHRvM21kVHpCMERwNW9qSkxU?=
 =?utf-8?B?S1krWm1xMVcvU1c4T24wZzRUN0xmQmE4TCt2NlhNRFA2eXVnT0VHUGR4bzFs?=
 =?utf-8?B?SjdFNnpDSEUyWC9VS2dvTWRxdlk5eXZYNjJUenpOamdVVUxwTEVCcVd0UG1K?=
 =?utf-8?B?aXRjMnVlYTg3ZDdNL0lxLzcvR1E4cWZ0MWRGRy8vVDBmM0VnMGJPcmtHYnJ2?=
 =?utf-8?B?OFM3WG5nNmp1SXVuQ09oQT09?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015)(7416005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YW5HUkRPemNBQlM0cStROWQzd3FBMTU4Z0lqcEJZVFg2MnprU1ZQRGlKWnBj?=
 =?utf-8?B?QUhSR1ZhWGFONHRHa3BuYzVCampEb0xVMVZOdEJqOWx3S2JOQVF4UGplWnA5?=
 =?utf-8?B?NkV0VEROSnVOeEcvZTZVeTRLMGJGMWJZZEhic1A3d1pvMkFOOUJLai9WS1Vu?=
 =?utf-8?B?YlMzcFFsUUF5SWxLNkhJTm1nYnNHV2ZYU2U1R2ZsMWFqY0tPb21EOHVIdmN3?=
 =?utf-8?B?UTFja29QeDQzS0V4R3NDNHRBMDNET2dJZXVEZ01Ia1JlSVR0MU1vTk5EVEtO?=
 =?utf-8?B?ZGdUc1E1VGtrekEwSkplZFJtVEE2WnBqaEhVK1N4b1g1aGV3TC9wa01mNWg0?=
 =?utf-8?B?ZDdvYmpuV3MwVkZKSGFqS2ZvMnkyb04wQ0FJalB4eVJ4aCt0UG02M1FicU1F?=
 =?utf-8?B?ZE1laFpjN2ZzREpNWUZzT2phZW5lN1RJSTZtaG9QRVVsOElMK0paUUlaS1ZI?=
 =?utf-8?B?VE5BRGJKajcyajdKRTBXcUoraXlNMEtid1ZJRnl6QzNSMjBlZXdrdCtXN3My?=
 =?utf-8?B?czZiZDlnRTNxdjRSOW9yRnZnK3ZnUjBSL0Z2cDFDdkpsK0pvVXV1WGJ0MXF1?=
 =?utf-8?B?Rzc0T3g1YjRKZWI1M3l2TFgrQVU5STFMaTVXUnRSZmlhS2RXUWdTWjVUTTNt?=
 =?utf-8?B?OTlhQXRpR014cXlQMk9XVC84MmFTMmlrcW1wZTlNb2dYOW5SN3BTZVFvckdn?=
 =?utf-8?B?VCtVbm81V0V3QVNYNmVWQTBQdUIrWmRDN2hNOEhyb21CUy8vdy85cDZXNXVX?=
 =?utf-8?B?a0gzN0NnQTBYa1poc1hIZW45b1hiZVJZTkJ5T09idk5FNGthWHo2QXdlNldD?=
 =?utf-8?B?eXJ1TFJPZlN4NzdPODBZNVhYVGFkaVFHT0VaMEwwSVhGcTczRkg1QnNudkpQ?=
 =?utf-8?B?TGM0OGtpUThBby9KaDhtR25yeitEZHpkTGpoOUo5N09PWDdJY3VTTEUrakR3?=
 =?utf-8?B?N3NVdGNRdHljMFhteGpuRFI3ZGtWaGxuejVpUVZyNU5PNW1uK1hUQ0ZrbzNB?=
 =?utf-8?B?bkNjWkE1VDc5SXRPZWk2YnZzLzhvL3IwZWRSTTdFM3R0QmM2Q1JPUEIva0tm?=
 =?utf-8?B?cEF0RGZnRGwwNGJDSWM4VW5PbVZUb0w3UXM3UHdyWXF0aU93ekR1dzduemJl?=
 =?utf-8?B?R0lOUWU5dWpVK3ZrRnVLR0JFZS9HYndGajNUTWpRVGpWVHNieUJ3Um1wN1A5?=
 =?utf-8?B?bjl3NFRGdWVoZkVLMCtaNzNnMXljUkY0c2ZySU0remJHaGlzMEtabnhmTlI0?=
 =?utf-8?B?WTJ5TStVbk5jL05JUEhoTFZpRnlCSGhWVTBVY2UvSFVzYVJDdnlMN1U0NGdK?=
 =?utf-8?B?dURqWnJZQUxNRVN3UkdKbHVNOUJCd0NPc1ZrVVVRZ2Z2eXQ1aDhKRU5TS3pw?=
 =?utf-8?B?VjZxSXI4WXo5SFp4Wk1aUkpEcCt3cjhTSUdUaGFGNEZlY3UzZ3dsUEtkejk2?=
 =?utf-8?B?eE9Fd3FEYnNtMEVjdmZoSm15dFIrcURqTG9ncnY5dzd6ZnRpVW1vQWpzNE5s?=
 =?utf-8?B?bFRpeHhCMUp0anp0cW1senpHUEhKR0JBZVg0QVlmNERRZUFGS21IMlBCSGxV?=
 =?utf-8?B?aXZMM0V1NmZEYWhPaUFGZURtdU9sWURXVDdlRUJhMmpBNVFXRW9VcWpsLzlp?=
 =?utf-8?B?SVlSeU52QWsxOTRjK1dnV1Y0RG9xQXlpVTVMUnJIMnZ6cERrTDFUVy9SN0dl?=
 =?utf-8?B?M3ZRdVoxMURvcy8yb2NsNjI4L0NkVFVuWUlJNHpSTWJucm1VY3MxTFpLVys1?=
 =?utf-8?B?WWxKbE5KQXVjZkRLbzdxbUw0Y3hHN1JDWGRGL2U3VXRGRlNqTGluaXVXQktH?=
 =?utf-8?B?emQ1WUZSTlQ2MFdRNWtLNlFHb0s4OUpaK0VwUTMxaXBGZDFIRnRpWHZVR01G?=
 =?utf-8?B?VjlQMTkwUzBVVmVubE43SWE1NGNtVU5LeGVpeVloRHVOSzBkaXgwdy93WVFV?=
 =?utf-8?B?S3lYS0s0L0pneEhad2lseHNWNDFaTXNUOTlVd1RDOXQ2Uk9CUzUyZ0FsaXdI?=
 =?utf-8?B?a3pMcllQV0x0RUNNc3BSUmMvQ29ZZm5hNGl6NWJxbGpQdFNVMEVEZjkxbzNz?=
 =?utf-8?B?dVdnL21oYm00TlEyTTVXbTBlSEZvaitRNll6MW55WUZmcU9ZY3FhRTg5K1ZD?=
 =?utf-8?Q?1gJc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c710791-4815-4578-6f3e-08dc811ecc56
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2024 03:07:25.6586
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 92xh82Slv39xsQw+LZS1GW4o02a9/W/7DaFtp+6efPXGwLZ5qo5bBZA2wQCK2jLR1RicrUOacSdEvxYaOvnDpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7761

SGkgR2VlcnQNCg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDAwLzIwXSBwaW5jdHJsOiBVc2Ug
c2NvcGUgYmFzZWQgb2Zfbm9kZV9wdXQoKQ0KPiBjbGVhbnVwcw0KPiANCj4gSGkgUGVuZywNCj4g
DQo+IE9uIFNhdCwgTWF5IDQsIDIwMjQgYXQgMzoxMuKAr1BNIFBlbmcgRmFuIChPU1MpIDxwZW5n
LmZhbkBvc3MubnhwLmNvbT4NCj4gd3JvdGU6DQo+ID4gVXNlIHNjb3BlIGJhc2VkIG9mX25vZGVf
cHV0KCkgdG8gc2ltcGxpZnkgY29kZS4gSXQgcmVkdWNlcyB0aGUgY2hhbmNlDQo+ID4gb2YgZm9y
Z2V0dGluZyBvZl9ub2RlX3B1dCgpLCBhbmQgYWxzbyBzaW1wbGlmaWVzIGVycm9yIGhhbmRsaW5n
IHBhdGguDQo+ID4gSSBub3QgYWJsZSB0byB0ZXN0IHRoZSBjaGFuZ2VzIG9uIGFsbCB0aGUgaGFy
ZHdhcmVzLCBzbyBkcml2ZXIgb3duZXJzLA0KPiA+IHBsZWFzZSBoZWxwIHJldmlldyB3aGVuIHlv
dSBoYXZlIHRpbWUuDQo+ID4NCj4gPiBUaGlzIHBhdGNoc2V0IHdhcyBpbnNwaXJlZCBmcm9tIERh
bidzIGNvbW1lbnRzIG9uIHBpbmN0cmwtc2NtaS1pbXguYywNCj4gPiB0aGFua3MuDQo+ID4NCj4g
PiBTaWduZWQtb2ZmLWJ5OiBQZW5nIEZhbiA8cGVuZy5mYW5AbnhwLmNvbT4NCj4gDQo+IEFuZHkn
cyBxdWVzdGlvbiBhYm91dCBjb2RlIGdlbmVyYXRpb24gb24gYSByZWxhdGVkIHBhdGNoIG1hZGUg
bWUgd29uZGVyLA0KPiB0b28uDQo+IA0KPiBPbiBhcm0zMiwgYSBjb252ZXJzaW9uIHRvIGZvcl9l
YWNoX2NoaWxkX29mX25vZGVfc2NvcGVkKCkgc2VlbXMgdG8gY29zdCBjYS4NCj4gNDggYnl0ZXMg
b2YgYWRkaXRpb25hbCBjb2RlLCByZWdhcmRsZXNzIG9mIHdoZXRoZXIgdGhlcmUgd2VyZSBleHBs
aWNpdA0KPiBjbGVhbnVwcyBiZWZvcmUgb3Igbm90Lg0KPiANCj4gSSBjaGVja2VkICJwaW5jdHJs
OiByZW5lc2FzOiBVc2Ugc2NvcGUgYmFzZWQgb2Zfbm9kZV9wdXQoKSBjbGVhbnVwcyIsIGFuZCBh
bGwNCj4gYnV0IHRoZSBjb252ZXJzaW9ucyBpbiAqX2R0X25vZGVfdG9fbWFwKCkgY29zdCA0OCBi
eXRlcyBlYWNoLg0KPiANCg0KSSBhbSBub3Qgc3VyZSB0aGlzIGlzIGFuIGlzc3VlIG9yIGVsc2Uu
IFdoYXQgd291bGQgeW91IHN1Z2dlc3QgbWUgdG8gZG8/DQpJZiB5b3UgdGhpbmsgZXh0cmEgNDhi
eXRlcyBjb25zdW1wdGlvbiBpcyBub3QgZ29vZCBoZXJlLCBmZWVsIGZyZWUgdG8gZHJvcCB0aGUN
CnBhdGNoLg0KDQpUaGFua3MsDQpQZW5nLg0KDQo+IEdye29ldGplLGVldGluZ31zLA0KPiANCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQNCj4gDQo+IC0tDQo+IEdlZXJ0IFV5dHRlcmhv
ZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgt
DQo+IG02OGsub3JnDQo+IA0KPiBJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5p
Y2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0DQo+IHdoZW4gSSdtIHRhbGtp
bmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxp
a2UgdGhhdC4NCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2
YWxkcw0KDQo=

