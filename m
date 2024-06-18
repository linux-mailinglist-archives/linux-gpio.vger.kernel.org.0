Return-Path: <linux-gpio+bounces-7525-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B768190CADA
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Jun 2024 14:01:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BA3FD1C23831
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Jun 2024 12:01:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75E8113E3E7;
	Tue, 18 Jun 2024 11:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="Olab9tLo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2075.outbound.protection.outlook.com [40.107.22.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C4613E3E8;
	Tue, 18 Jun 2024 11:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718711553; cv=fail; b=f3uyb6z5TlEleIhV4FCJUfl2c1Q1hsrTS4SVF7RyrPz0e08Vav5kEdRqM3lJPhk+dVlZNq4xR9iAd8lEtWyfNRrjTaOhUGp+p81KGH0f0kF6rRwUvQtEdZWzlCpYHuz+4cjptG3mDWrSp7e10Bjugty3CkXUnkVlpW5eo4dZ8DM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718711553; c=relaxed/simple;
	bh=ob8M1bPNzqLDN3k9UxJQTeihDCtpO6gbZ63AwWYXKSE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=SpIeZCMm94/tyDJzXZnm4256hlbEUpN4v7GALNucKCrF8zAyFHS4jXWmg+/G8B9SKFx8gpvCPRpfNo7RMhsSLXpB3YagyopSjXBDK02LDWcBBWX3d/6lHj7/oyGN9y7kYLUyr+I0SCz7sBvxL/WfjrWOKpeY/dsVOi1HRnlj5Dc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=Olab9tLo; arc=fail smtp.client-ip=40.107.22.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XvwV+VOGGV5RKnUN5mL3ik6RWJOHV0NzdbVLN0P6D6ErZkiNnR506+2MIfTjJGtucYuBBBbuZgCiHW3aNT0Z15lMbi5HSebBAvrdYtoKOKvW//vSiMv/1R7whNiIw1F9ucDkyCXHw2Vdf0K8KJujr0vTh9FZb6m3YueAzgF+rOOtwikDm36bolfC28KTmIXluyQguQi6NyT001O9u2cz0JIhdMBftOAGBeyOwTQlfaYOsXffOOr2xqo3KoBOnrE5o/4cYam8js3rLQgu397BL+n5l9mm8+8eHEqQahRrVPZB9Pnpus4dc78+cQSJlxeX3EfAoVDaXwXoC2VK7F1GxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ob8M1bPNzqLDN3k9UxJQTeihDCtpO6gbZ63AwWYXKSE=;
 b=nVg0BMaM5RQCg6iffvgLxoJt3aDzHfu7PmSh31i56NF8vTMvAUGYJqn9NOr0XNtOBy3t5dyYMphYyBrjaqb2ooLtIR3OtoWQ7O1ZjtgqzxtP1/WD1CqG4M6JTDiA0YOPFoHyN47W0b6ovzzg0thclhuAegrdAl8BSQdw2xgKdeV/ZjBye7tKLnRTy5Jmu0sK0Mb3En7LvjdsRnMeCwQsIj3QMLn5LcIYRIYwVeBmqBUcY+YyMYDPRKi3g6N7UOnoAw3n/JHPfr2fXRaKLkOFRYjVndhvcetfDJLYwo5v2XHu35aXfOAT5n/SyonbFUt3UI+gnA5TYp9d/1yRYK57zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ob8M1bPNzqLDN3k9UxJQTeihDCtpO6gbZ63AwWYXKSE=;
 b=Olab9tLokXMkmdZf0aQEV89Z3YGpoYteKk8mkcdM4cbKYW5mU4JoVH4O5hsn41YYM1unXrmgpz92j6L1tweOPyxQIyiQMkxFS2yatl20KLChrYzel2h/Mc8FQOZ2yxsj4A8fypo6RZwTipo4sYUvO4cSA7KHiH17vc3yRFoHyE8=
Received: from AM6PR04MB5941.eurprd04.prod.outlook.com (2603:10a6:20b:9e::16)
 by PR3PR04MB7323.eurprd04.prod.outlook.com (2603:10a6:102:88::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31; Tue, 18 Jun
 2024 11:52:27 +0000
Received: from AM6PR04MB5941.eurprd04.prod.outlook.com
 ([fe80::9f4e:b695:f5f0:5256]) by AM6PR04MB5941.eurprd04.prod.outlook.com
 ([fe80::9f4e:b695:f5f0:5256%5]) with mapi id 15.20.7677.030; Tue, 18 Jun 2024
 11:52:27 +0000
From: Peng Fan <peng.fan@nxp.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Linus Walleij
	<linus.walleij@linaro.org>, Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, Dvorkin Dmitry <dvorkin@tibbo.com>,
	Wells Lu <wellslutw@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Emil Renner Berthing
	<kernel@esmil.dk>, Jianlong Huang <jianlong.huang@starfivetech.com>, Hal Feng
	<hal.feng@starfivetech.com>, Orson Zhai <orsonzhai@gmail.com>, Baolin Wang
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
 Lindgren <tony@atomide.com>, Stephen Warren <swarren@wwwdotorg.org>
CC: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
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
Thread-Index: AQHaniSxdGSRMxSwNUygtutwA8lIt7HNryvQ
Date: Tue, 18 Jun 2024 11:52:27 +0000
Message-ID:
 <AM6PR04MB594163BAB898D8689A94056F88CE2@AM6PR04MB5941.eurprd04.prod.outlook.com>
References: <20240504-pinctrl-cleanup-v2-0-26c5f2dc1181@nxp.com>
In-Reply-To: <20240504-pinctrl-cleanup-v2-0-26c5f2dc1181@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM6PR04MB5941:EE_|PR3PR04MB7323:EE_
x-ms-office365-filtering-correlation-id: 8c85b28a-9d67-45fe-bd67-08dc8f8d2053
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230037|366013|1800799021|376011|7416011|921017|38070700015;
x-microsoft-antispam-message-info:
 =?utf-8?B?aWRpL3NsR2IzSEZ4dmYzcGVsQUNUMnA5bzFtZEdKU1Nhb3gvOUlIVzFDMjEx?=
 =?utf-8?B?L0c2T1dFcWkzRURxSzhSVU8weDAvMExETytzYTJjazhBcWp0SG40VDR1ZHlR?=
 =?utf-8?B?cFdhR2x3RHZzYytIWVZybWNtQ0ZsOTlJL1BTS3NuNEE0STltdEdwcjJxdURH?=
 =?utf-8?B?Q01JWFU0akVWd3FlWVZFTXY2R1V1US9uQlo4cVRTVXQ1ZCtLb0x0NC92akV4?=
 =?utf-8?B?Y3ExVEhqRTQxOGxqMmIvckVKOHlMRVFXMzZsQ294cG1BVjhHSytpSTJjSHN5?=
 =?utf-8?B?bVBEblg1c2ovM3QyeDBWcDRsdFBZZk43NDNOWGlFbGQ4NkNHemp1WDhySGho?=
 =?utf-8?B?dXlrelpJWENoWUx6RGFpSVd3MmhiYjJjaHUzVmtVSXpPTGRqcE1oZlBMZ2xv?=
 =?utf-8?B?cVNQR0J5MHFLR0dXVE9PTTZlRHZLNklxaDhPdGRKMVdLR0VTSE5rYU1EWjR3?=
 =?utf-8?B?eXVZd1EyV0FucExjZ3lJTitnQkdiVWJoNVlPdWNtTWhrRjB1SEhmcndaQ21m?=
 =?utf-8?B?d2R2V1pCZUVFLzNlVWpOaDZtcEhvNERHWDFFSXg4RlRkYnNvb1FWZjg5cHA0?=
 =?utf-8?B?dzd2M2F6dVdMUGpYRk5zUFcrdTc4L1VhKy9UMFJuaSs3ekgzOFhMdEs5bWx6?=
 =?utf-8?B?MHIxaURtNE5YSG5DejZPWWl0Q3VvdFVIdmx2cE1RRTRKUlNMOGsxWWdJV2t1?=
 =?utf-8?B?VWdEMjBHMGV5eXkyckRaWEcwTmd1b0Z3RXVjcXgyQ0ZKN1BLY3U4c2VmVlJj?=
 =?utf-8?B?L08yNGNZdGlxVlBNWWZnVE5EOUhGbjA3bzdRNmN4NDM1YW5WZjVsMzVyQW5Q?=
 =?utf-8?B?KzlHZFZwOWF3eHo4K1NmWUN0N0lMQTFGaHJDQVZ3Nk9RTys1UjV0ODk5VG13?=
 =?utf-8?B?bGpoVXBKNG9pT0pxTUNvRzZGd0Qzc1JYSGZKQ3JweVZrN2xIbGUwZGtEQjYr?=
 =?utf-8?B?TVRmb05GWmFKMU01TVhmWFBJcEpOeGFBRk05aHNhVXRPNENIbUpLKzNoSlVS?=
 =?utf-8?B?RjVieE0wTVg0MmlEbEQxVzNZSnQ5V2RQM1VDTXlhQUV4bEpaamhZclRlOHhy?=
 =?utf-8?B?QmpJMzh5U2VqYjJER2ZMUGc3ZkZUYjM2Y0gxOFIxcFcxUkRmWjFqaVVCVXFk?=
 =?utf-8?B?bWFKWllLVVFCVFc3a3dwUDdDZlNXN3pnOVBPdGFYMStBT2Q5aU9vY3p3U0Rq?=
 =?utf-8?B?NkMxb1UyaXIrcHVWY2lCNmVmUXpmRVc2QWhTYkVBYjhiWmJGOVhvMTNLbi9R?=
 =?utf-8?B?VkYzYjRkZU81TnlZYjFRT29DQ0s5Q3h5NytSNC8rMDNEbys2amx0LzFvcG5t?=
 =?utf-8?B?YzAyZGlrVld3N2tZNFRPNUNxdkdIaEt4QmgxVXVidmltWC8zeTVBVkkyaEdy?=
 =?utf-8?B?VWY1SWhCOU9rTVN2TFA1aEdqOFBTRU1OOXhVZFFycjhldkdwY3E1bVY0NDU3?=
 =?utf-8?B?Z2tnZ0dtNVJKd0NJa0JnbERuWEY0dWlmczZ5bWVEVWljNXFiWmdvUTVJUUxj?=
 =?utf-8?B?YmtXQzlnMkgzUjExZ0x2aisycFhid3Urd09GTVR1UlJRVWg5N1NjM0RaN2tt?=
 =?utf-8?B?bjZ1NEJpcEdRVWJndTRZWkpqZDJzMW5QRmRDTWgvY3E4L0JGQ3NNVTFJMFIw?=
 =?utf-8?B?NElzRnl1aFJPdGdObkIyR0E5dGFJYkZzeW9WVGVJSW1PbGw5Mit1VXR3MWpX?=
 =?utf-8?B?eXY5UEJCZWtoSkdVTUFOTFA2akxFMzI0MzNia052dFNpNXp4T1REMmQ2Q2pi?=
 =?utf-8?B?VDIyaHpJRkZ1SUduUXVYQTlQMGo3aVB4Vm83cXAwYnRVU2Q5Sk14OVlCdk9s?=
 =?utf-8?B?RE1KU3hvTkhiUkp0bXRiZz09?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB5941.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(366013)(1800799021)(376011)(7416011)(921017)(38070700015);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bnVCTzRMVVRPbHBOTTJ3UmRpb1VMWlB1VVpTakxWdHMrSG5nbzNXeGwzWEYx?=
 =?utf-8?B?SzhVUnJpOG1VS29rbFluVWxyR2EyY2FMNHN0SjJzWHhMR3FVaFQ3cld6aGNv?=
 =?utf-8?B?Ny9DdUZWMFN0LzZKQ3NSazJuV3ljOVlZNmp5N20rQTUzR3hnZ3MvSHh4MTVE?=
 =?utf-8?B?cWRRdCtkY0JmS2VOUW5NZ2Y0WGlDR0xRMm1mNE50Qzc3ZldXdkpmd1VDZHVH?=
 =?utf-8?B?WmRtdHZ3ZG9XMDFxWlJLdFgrNkxhNFFNcmR2RWk3QWQvaTV5OXV6NEdmRE5x?=
 =?utf-8?B?enZEL1lPa0ZOWnMrMkM1K29PQWtkbkNWVSsyU1hVN1FSenB3ZEczaFRid3Z5?=
 =?utf-8?B?TTQxNmFlMXR0OTZkVzhDckRRdXA2b1MzWlFkUE5yQXlZdnVPbENZYk5EQmFG?=
 =?utf-8?B?V1VWRXJsSHJtQ0N1MmI4eXU3U2w4T0ZpWXRlODVacVFmek5PckRLaDBpYko0?=
 =?utf-8?B?UTBXNTNiRlpwU1ZSS3oxWE9KS2NNekwrNm13Q3BobVBuWTFZYy9nbTRDTG5p?=
 =?utf-8?B?Q0FBZkRSN0xoK1NjanRZZENLRjJFYk9QcHNMOENaWkcyOWgwNEdLZHoxTGZN?=
 =?utf-8?B?cTdMdDhMcWh1QkpDRXhLMS9xSy8wWUw0elpaajNOWFJIOUdLMFZ4MUJQZCtx?=
 =?utf-8?B?dXhPUGUvS2prODNVcjYxTVdtS3FOWElSaFVqOVNYT1BtMk1EU0g0ZHJ0VWk5?=
 =?utf-8?B?cjFldWUzRGJybEVxRUYxeDhMNVlpakF2eWNvREpsNklnc1lNa2paenlRbkFU?=
 =?utf-8?B?K0kxN1J2b0J5bkxvZHdJaVp2c3ErNFNiUDhvTk1RRmozSWU5WEErU3FwUCtN?=
 =?utf-8?B?UUo5U3d6Nm5ScmdiNEdhRE0xVGJQNWpmZW10RnlqRGdobFFNTUlwMFMrdEZX?=
 =?utf-8?B?MUViOGIwUkU3VXZaZkpJRDMxYXdrYmNBVXdxaUJEMDV3aS9lZldvdXhibFo5?=
 =?utf-8?B?OHQzWWlvd1U1NEtkTktibXRacG5jQk5laVE3ZFVITWdyVFBCSlNSejFNM0Z3?=
 =?utf-8?B?WXRkc3I4VlYyTThhek5QZE1kQm1udUNIMUVDeFY3Mk9SaTFtRnZsdnNvMkhB?=
 =?utf-8?B?RWxPV29FYkNoUEw0U1RYeFFqQkxKbnkyL3NPL281eCs5RXIvcG5CNFBVZWNm?=
 =?utf-8?B?NVNFSTJlV013RENjSzNscEpiZStGNXUyekxPOWRPRWovakdBY1hYb28vNExJ?=
 =?utf-8?B?NktDME14UFJVMTNBWFc2OHFjNWE3L0VrVEJ1UFVrNEFGRWhIY3I3emEvdHZO?=
 =?utf-8?B?b1ZuR3JaNG5LelJKTy9hWEVKUHd2dWV1QXUxN2RRbFFzaVdKNXJ5K3ZEOTRh?=
 =?utf-8?B?Y1Nlbi9DQm0vdG00ZjcwY20zdkRnck1nODdoQ1E1NFpHNzFsU3dMNGkwMHF5?=
 =?utf-8?B?Q3ZuV2x4WEtkWFhiamsycHpZMGZPOGlBY012YWdxTVNDUW9iajlnZ1ZSbG1w?=
 =?utf-8?B?MnhldksxL0lvQkx1aGhzdUorLzNFSkxtcUtrdE9vN3YxbG55bERsNXc0K0ZO?=
 =?utf-8?B?ZUU1TmxkRzFNWkdEYmUrVWRaMlpBZUVSbEduc21qUk1VM0llNnZ0Uzg1TEhT?=
 =?utf-8?B?YWNCdVNBVEd5V05lUzJhZEx5V0NZblRUTjZFN1dubVlRcEtCZ3FiNGZJZnc1?=
 =?utf-8?B?VGgrQ2RFV1o0Vko5cXA4REUvRTFTN3paS3hWZ2VnV0F2ckFnaVQrM1hwVWov?=
 =?utf-8?B?OHpxNE1GZUpNMCtjZWE0UXpRbXBmalpza0paM2xUQm5qaFVFRGY2SzZJL1F4?=
 =?utf-8?B?czVqWUwyWnBkZTVWRG1MaWJqcG9SSFMybmp1VllPQ2RUS29INkQwUHlxSG5O?=
 =?utf-8?B?M2hvYk1GNFFBa2s4c0RBNEhtQjJ3Y1ZqbGxNNytkMFpJWVkrTjhXaUN1UnFp?=
 =?utf-8?B?N2Y4dmVuZ29YTnJnV2Y3cnVRODA0dzhlaXRLYlJTYXVpUnJtejJBYWpiZkRz?=
 =?utf-8?B?cjNEcjd4N092WTBWR2dLWE1zZ1hMdUpQcTk5cm84YlplcFJtZGR0bGdvMVFv?=
 =?utf-8?B?VWh0UEYzZk91TExTTjBzV2UvS1hPU2FWdkxjaGpnTnNxK0ZqV3B0dUhZaVQx?=
 =?utf-8?B?OHhXY3kva0FmU2l1M213VHRiR1RmSUx2YXh2b0d1L1lkMFcwQlIySXlRMDdM?=
 =?utf-8?Q?g2FE=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5941.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c85b28a-9d67-45fe-bd67-08dc8f8d2053
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2024 11:52:27.4786
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FhHfvr7PNMfBbKPFZDejAS8RHoY9ikJ+MPeT/Yr0kyIlzeFbGybLNj73Xnfbk4CS0Jvwt1OkDQrBlig5aE49DA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7323

SGkgTGludXMsDQoNCj4gU3ViamVjdDogW1BBVENIIHYyIDAwLzIwXSBwaW5jdHJsOiBVc2Ugc2Nv
cGUgYmFzZWQgb2Zfbm9kZV9wdXQoKQ0KPiBjbGVhbnVwcw0KDQpzdC9zdG0zMi9yZW5lc2FzIHBh
dGNoZXMgYXJlIHBpY2tlZC4gV291bGQgeW91IGhhbmRsZSB0aGUgcmVtYWluaW5nDQpvbmVzPw0K
DQpUaGFua3MsDQpQZW5nLg0KDQo+IA0KPiBVc2Ugc2NvcGUgYmFzZWQgb2Zfbm9kZV9wdXQoKSB0
byBzaW1wbGlmeSBjb2RlLiBJdCByZWR1Y2VzIHRoZSBjaGFuY2UNCj4gb2YgZm9yZ2V0dGluZyBv
Zl9ub2RlX3B1dCgpLCBhbmQgYWxzbyBzaW1wbGlmaWVzIGVycm9yIGhhbmRsaW5nIHBhdGguDQo+
IEkgbm90IGFibGUgdG8gdGVzdCB0aGUgY2hhbmdlcyBvbiBhbGwgdGhlIGhhcmR3YXJlcywgc28g
ZHJpdmVyIG93bmVycywNCj4gcGxlYXNlIGhlbHAgcmV2aWV3IHdoZW4geW91IGhhdmUgdGltZS4N
Cj4gDQo+IFRoaXMgcGF0Y2hzZXQgd2FzIGluc3BpcmVkIGZyb20gRGFuJ3MgY29tbWVudHMgb24g
cGluY3RybC1zY21pLWlteC5jLA0KPiB0aGFua3MuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBQZW5n
IEZhbiA8cGVuZy5mYW5AbnhwLmNvbT4NCj4gLS0tDQo+IENoYW5nZXMgaW4gdjI6DQo+IC0gRHJv
cCBhc3BlZWQgY2hhbmdlcyBwZXIgQW5kcmV3IEplZmZlcnkNCj4gLSBEcm9wIGNoYW5nZXMgdG8g
Y29kZSBwYXR0ZXJuIHRoYXQgb2Zfbm9kZV9nZXQob3Igb3RoZXIgcmVmY291bnQNCj4gaW5jcmVh
c2luZykgZm9sbG93ZWQgYnkgb2Zfbm9kZV9wdXQuIFRoYXQgc2FpZCwgYnV0IEkgc3RpbGwgaGF2
ZSBhIGNoYW5nZQ0KPiBmb3Igc2Ftc3VuZyBwaW5jdHJsIHRoYXQgZHJvcHMgc2V2ZXJhbCBvZl9u
b2RlX3B1dCBwbGFjZXMuIElmIHRoaXMgaXMgbm90DQo+IHdlbGNvbWVkLCBwYXRjaCAyMC8yMCBj
b3VsZCBiZSBkcm9wcGVkLg0KPiAtIEFkZCBGaXggdGFnIGZvciBwYXRjaCAxDQo+IC0gQWRkIEEt
YiBmb3IgcGF0Y2ggNA0KPiAtIERyb3AgdW5uZWVkZWQge30gaW4gcGF0Y2ggOCBQZXIgRGFuIENh
cnBlbnRlcg0KPiAtIEFkZCBhIG5ldyBwYXRjaCAxOC4NCj4gLSBNb3ZlZCBwYXRjaCBbMTksMjBd
LzIwLCBpbiBjYXNlIHBlb3BsZSBhcmUgbm90IGhhcHB5IHdpdGggdGhlDQo+IGNoYW5nZXMsIHRo
ZSB0d28gcGF0Y2ggY291bGQgYmUgZHJvcHBlZCB3aGVuIGFwcGx5IGlmIG5vIHYzIHBhdGNoc2V0
Lg0KPiAtIExpbmsgdG8gdjE6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNDA1MDEtcGlu
Y3RybC1jbGVhbnVwLXYxLTAtDQo+IDc5N2NlY2E0NmU1Y0BueHAuY29tDQo+IA0KPiAtLS0NCj4g
UGVuZyBGYW4gKDIwKToNCj4gICAgICAgcGluY3RybDogdGk6IGlvZGVsYXk6IFVzZSBzY29wZSBi
YXNlZCBvZl9ub2RlX3B1dCgpIGNsZWFudXBzDQo+ICAgICAgIHBpbmN0cmw6IHRlZ3JhOiBVc2Ug
c2NvcGUgYmFzZWQgb2Zfbm9kZV9wdXQoKSBjbGVhbnVwcw0KPiAgICAgICBwaW5jdHJsOiBzdG0z
MjogVXNlIHNjb3BlIGJhc2VkIG9mX25vZGVfcHV0KCkgY2xlYW51cHMNCj4gICAgICAgcGluY3Ry
bDogc3RhcmZpdmU6IFVzZSBzY29wZSBiYXNlZCBvZl9ub2RlX3B1dCgpIGNsZWFudXBzDQo+ICAg
ICAgIHBpbmN0cmw6IHNwcmQ6IFVzZSBzY29wZSBiYXNlZCBvZl9ub2RlX3B1dCgpIGNsZWFudXBz
DQo+ICAgICAgIHBpbmN0cmw6IHNwZWFyOiBVc2Ugc2NvcGUgYmFzZWQgb2Zfbm9kZV9wdXQoKSBj
bGVhbnVwcw0KPiAgICAgICBwaW5jdHJsOiByZW5lc2FzOiBVc2Ugc2NvcGUgYmFzZWQgb2Zfbm9k
ZV9wdXQoKSBjbGVhbnVwcw0KPiAgICAgICBwaW5jdHJsOiBzdDogVXNlIHNjb3BlIGJhc2VkIG9m
X25vZGVfcHV0KCkgY2xlYW51cHMNCj4gICAgICAgcGluY3RybDogcm9ja2NoaXA6IFVzZSBzY29w
ZSBiYXNlZCBvZl9ub2RlX3B1dCgpIGNsZWFudXBzDQo+ICAgICAgIHBpbmN0cmw6IGVxdWlsaWJy
aXVtOiBVc2Ugc2NvcGUgYmFzZWQgb2Zfbm9kZV9wdXQoKSBjbGVhbnVwcw0KPiAgICAgICBwaW5j
dHJsOiBhdDkxOiBVc2Ugc2NvcGUgYmFzZWQgb2Zfbm9kZV9wdXQoKSBjbGVhbnVwcw0KPiAgICAg
ICBwaW5jdHJsOiBzMzJjYzogVXNlIHNjb3BlIGJhc2VkIG9mX25vZGVfcHV0KCkgY2xlYW51cHMN
Cj4gICAgICAgcGluY3RybDogbm9tYWRpazogVXNlIHNjb3BlIGJhc2VkIG9mX25vZGVfcHV0KCkg
Y2xlYW51cHMNCj4gICAgICAgcGluY3RybDogbWVkaWF0ZWs6IFVzZSBzY29wZSBiYXNlZCBvZl9u
b2RlX3B1dCgpIGNsZWFudXBzDQo+ICAgICAgIHBpbmN0cmw6IGZyZWVzY2FsZTogVXNlIHNjb3Bl
IGJhc2VkIG9mX25vZGVfcHV0KCkgY2xlYW51cHMNCj4gICAgICAgcGluY3RybDogYmNtOiBiY202
M3h4OiBVc2Ugc2NvcGUgYmFzZWQgb2Zfbm9kZV9wdXQoKSBjbGVhbnVwcw0KPiAgICAgICBwaW5j
dHJsOiBwaW5jb25mLWdlbmVyaWM6IFVzZSBzY29wZSBiYXNlZCBvZl9ub2RlX3B1dCgpIGNsZWFu
dXBzDQo+ICAgICAgIHBpbmN0cmw6IGZyZWVzY2FsZTogbXhzOiBGaXggcmVmY291bnQgb2YgY2hp
bGQNCj4gICAgICAgcGluY3RybDogazIxMDogVXNlIHNjb3BlIGJhc2VkIG9mX25vZGVfcHV0KCkg
Y2xlYW51cHMNCj4gICAgICAgcGluY3RybDogc2Ftc3VuZzogVXNlIHNjb3BlIGJhc2VkIG9mX25v
ZGVfcHV0KCkgY2xlYW51cHMNCj4gDQo+ICBkcml2ZXJzL3BpbmN0cmwvYmNtL3BpbmN0cmwtYmNt
NjN4eC5jICAgICAgICAgICAgICB8ICA0ICstLQ0KPiAgZHJpdmVycy9waW5jdHJsL2ZyZWVzY2Fs
ZS9waW5jdHJsLWlteC5jICAgICAgICAgICAgfCAyNSArKysrLS0tLS0tLS0tLS0NCj4gIGRyaXZl
cnMvcGluY3RybC9mcmVlc2NhbGUvcGluY3RybC1pbXgxLWNvcmUuYyAgICAgIHwgMTYgKysrLS0t
LS0tLQ0KPiAgZHJpdmVycy9waW5jdHJsL2ZyZWVzY2FsZS9waW5jdHJsLW14cy5jICAgICAgICAg
ICAgfCAxOCArKysrLS0tLS0tLQ0KPiAgZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL3BpbmN0cmwt
bXRrLWNvbW1vbi5jICAgICAgfCAgNCArLS0NCj4gIGRyaXZlcnMvcGluY3RybC9tZWRpYXRlay9w
aW5jdHJsLXBhcmlzLmMgICAgICAgICAgIHwgIDQgKy0tDQo+ICBkcml2ZXJzL3BpbmN0cmwvbm9t
YWRpay9waW5jdHJsLWFieDUwMC5jICAgICAgICAgICB8ICA0ICstLQ0KPiAgZHJpdmVycy9waW5j
dHJsL25vbWFkaWsvcGluY3RybC1ub21hZGlrLmMgICAgICAgICAgfCAgNCArLS0NCj4gIGRyaXZl
cnMvcGluY3RybC9ueHAvcGluY3RybC1zMzJjYy5jICAgICAgICAgICAgICAgIHwgMzEgKysrKysr
LS0tLS0tLS0tLS0tDQo+ICBkcml2ZXJzL3BpbmN0cmwvcGluY29uZi1nZW5lcmljLmMgICAgICAg
ICAgICAgICAgICB8ICA3ICsrLS0NCj4gIGRyaXZlcnMvcGluY3RybC9waW5jdHJsLWF0OTEtcGlv
NC5jICAgICAgICAgICAgICAgIHwgIDcgKystLQ0KPiAgZHJpdmVycy9waW5jdHJsL3BpbmN0cmwt
YXQ5MS5jICAgICAgICAgICAgICAgICAgICAgfCAxNCArKystLS0tLQ0KPiAgZHJpdmVycy9waW5j
dHJsL3BpbmN0cmwtZXF1aWxpYnJpdW0uYyAgICAgICAgICAgICAgfCAyMSArKystLS0tLS0tLS0N
Cj4gIGRyaXZlcnMvcGluY3RybC9waW5jdHJsLWsyMTAuYyAgICAgICAgICAgICAgICAgICAgIHwg
IDcgKystLQ0KPiAgZHJpdmVycy9waW5jdHJsL3BpbmN0cmwtcm9ja2NoaXAuYyAgICAgICAgICAg
ICAgICAgfCAxMSArKy0tLS0tDQo+ICBkcml2ZXJzL3BpbmN0cmwvcGluY3RybC1zdC5jICAgICAg
ICAgICAgICAgICAgICAgICB8IDM3ICsrKysrKystLS0tLS0tLS0tLS0tLS0NCj4gIGRyaXZlcnMv
cGluY3RybC9yZW5lc2FzL3BpbmN0cmwtcnphMS5jICAgICAgICAgICAgIHwgMTQgKysrLS0tLS0N
Cj4gIGRyaXZlcnMvcGluY3RybC9yZW5lc2FzL3BpbmN0cmwtcnpnMmwuYyAgICAgICAgICAgIHwg
IDcgKystLQ0KPiAgZHJpdmVycy9waW5jdHJsL3JlbmVzYXMvcGluY3RybC1yem4xLmMgICAgICAg
ICAgICAgfCAyMyArKysrLS0tLS0tLS0tLQ0KPiAgZHJpdmVycy9waW5jdHJsL3JlbmVzYXMvcGlu
Y3RybC1yenYybS5jICAgICAgICAgICAgfCAgNyArKy0tDQo+ICBkcml2ZXJzL3BpbmN0cmwvcmVu
ZXNhcy9waW5jdHJsLmMgICAgICAgICAgICAgICAgICB8ICA3ICsrLS0NCj4gIGRyaXZlcnMvcGlu
Y3RybC9zYW1zdW5nL3BpbmN0cmwtZXh5bm9zLmMgICAgICAgICAgIHwgMTYgKysrLS0tLS0tLQ0K
PiAgZHJpdmVycy9waW5jdHJsL3NhbXN1bmcvcGluY3RybC1zYW1zdW5nLmMgICAgICAgICAgfCAx
OSArKystLS0tLS0tLQ0KPiAgZHJpdmVycy9waW5jdHJsL3NwZWFyL3BpbmN0cmwtc3BlYXIuYyAg
ICAgICAgICAgICAgfCAxMyArKystLS0tLQ0KPiAgZHJpdmVycy9waW5jdHJsL3NwcmQvcGluY3Ry
bC1zcHJkLmMgICAgICAgICAgICAgICAgfCAxNCArKystLS0tLQ0KPiAgZHJpdmVycy9waW5jdHJs
L3N0YXJmaXZlL3BpbmN0cmwtc3RhcmZpdmUtamg3MTAwLmMgfCAyNyArKysrKysrLS0tLS0tLS0t
DQo+IGRyaXZlcnMvcGluY3RybC9zdGFyZml2ZS9waW5jdHJsLXN0YXJmaXZlLWpoNzExMC5jIHwg
MTggKysrKystLS0tLS0NCj4gIGRyaXZlcnMvcGluY3RybC9zdG0zMi9waW5jdHJsLXN0bTMyLmMg
ICAgICAgICAgICAgIHwgIDQgKy0tDQo+ICBkcml2ZXJzL3BpbmN0cmwvdGVncmEvcGluY3RybC10
ZWdyYS14dXNiLmMgICAgICAgICB8ICA3ICsrLS0NCj4gIGRyaXZlcnMvcGluY3RybC90ZWdyYS9w
aW5jdHJsLXRlZ3JhLmMgICAgICAgICAgICAgIHwgIDQgKy0tDQo+ICBkcml2ZXJzL3BpbmN0cmwv
dGkvcGluY3RybC10aS1pb2RlbGF5LmMgICAgICAgICAgICB8IDM3ICsrKysrKysrLS0tLS0tLS0t
LS0tLS0NCj4gIDMxIGZpbGVzIGNoYW5nZWQsIDEzMyBpbnNlcnRpb25zKCspLCAyOTggZGVsZXRp
b25zKC0pDQo+IC0tLQ0KPiBiYXNlLWNvbW1pdDogYmI3YTI0NjdlNmJlZWY0NGE4MGExN2Q0NWVi
ZjI5MzFlNzYzMTA4Mw0KPiBjaGFuZ2UtaWQ6IDIwMjQwNDI5LXBpbmN0cmwtY2xlYW51cC1lNGQ0
NjFjMzI2NDgNCj4gDQo+IEJlc3QgcmVnYXJkcywNCj4gLS0NCj4gUGVuZyBGYW4gPHBlbmcuZmFu
QG54cC5jb20+DQoNCg==

