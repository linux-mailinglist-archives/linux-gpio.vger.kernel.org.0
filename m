Return-Path: <linux-gpio+bounces-6935-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 395988D48FB
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 11:54:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7CCECB21739
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 09:54:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC2E515B96B;
	Thu, 30 May 2024 09:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="qrcxz7FQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04on2055.outbound.protection.outlook.com [40.107.6.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD5A2F32;
	Thu, 30 May 2024 09:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.6.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717062868; cv=fail; b=E8RiHfrsbQhYRlfmX0g99CDwQ7ctcfA2FWfkR2p1TrRnzkbZ+oF0cw3+YJALPNYlcOzo7isKFgc6kocVNkJX+RRUuyWqa2Nb/Srq8UtDP2R745sQ8FZQVgV536PHPd1cbmFWDD9pYczow0gCDOTEu0ZK2mCwIQKsKxcKE8IoW84=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717062868; c=relaxed/simple;
	bh=aVBMVA75AFMIO1svCaZQxOytIMz5WusV8uuGlLldlpk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=E+BamQPFDA7/naQfBvcLakqpZq4ml9wfKaoCRqtj5ohCA4WUtE9Dw5jECdFj4Pg3Vf+CBq6w3dd/GsNZYyO5pTjr2Vc7Bte1Zl+CHp0zLFcRlgMNxjHv2dTq8s+Suyj9NnsBX4Euw80uPoY2neX/zD1EHipOsSVf1xdCmYya2Gw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=qrcxz7FQ; arc=fail smtp.client-ip=40.107.6.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tl5M/t3u8+BD+1n7srhkihuQnzBNfsSuDqemyxcczZ6qmEdrj1mRIFdhCtNr0jWR2X5r0e+Y/73lYQUVdvJcAmYigBjECWqWxs91Q0t5fDdzC1bkPGwqhxWiMloaZQ7MchqrMVHRWwWqmqVBl1AVlKTlaqBzNWI1+86fhUF+0U0mv9E0WOIRpL2/eXZySgEGKehdQuCgE70pH2Ln6lqaerIq06l2iu8qVh1i1ViYT82bS7UioSSDQgsjC/0mVdbel/vRr4ynteNI1IqQdPYgQh7z5nMEZQLtC4o6P3i9BUFgDOb7DFpChe/zNkYtI15jUrT6MivrpHms9fh9ZyZyAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aVBMVA75AFMIO1svCaZQxOytIMz5WusV8uuGlLldlpk=;
 b=JeGx7uamHulWBURe0PtO9Cv9EFCJwvGW6YPXPepiVhQRsgc+RkgMPyZVB/8TNEMFwU1o6rJjTa1xJ9oYOy1gOFpo6egvU0dNU3cmCGm6hE2hOKqttH7OFrlIfXcTEJ7Du43IvINQfSvqHbwcEG4JEafiOw1B786TPZ/UunC3xOm7YWrWcSHkxoY7VJTYA/X692WeY2V9fcijmRRXRUkoMY3At36xpBKn9DtUK5wJeQFhTmJbNkVyENS5ikDMQIbPL3gJ/rmQMnRhWhJH3W0MBoXSjfdyCi/dGZ556EhUb4ipDON5bx3FIjvLKdECJ192rxqqqTVXje7hVwYiCypCKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aVBMVA75AFMIO1svCaZQxOytIMz5WusV8uuGlLldlpk=;
 b=qrcxz7FQfrrgeMH+LKEksrU6dI+FP0Cjbs0VSFFNbwkENqL9paCA2KXc0s79wNj7sBN4IxxTVwEo7tq/bODcdTIZGRgGFhSyQw5tyw3s5+CTLTE6wNNuF232pCVueBAwpo5wGcW2Fe+hrrvjc+5f4ptGahuTuQawUVAJHzr2GlY=
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by GVXPR04MB9831.eurprd04.prod.outlook.com (2603:10a6:150:11c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.32; Thu, 30 May
 2024 09:54:23 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::557f:6fcf:a5a7:981c]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::557f:6fcf:a5a7:981c%7]) with mapi id 15.20.7633.018; Thu, 30 May 2024
 09:54:23 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Markus Elfring <Markus.Elfring@web.de>, "soc@kernel.org" <soc@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, Alim Akhtar <alim.akhtar@samsung.com>, Andrew
 Jeffery <andrew@codeconstruct.com.au>, Angelo Gioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Baolin Wang
	<baolin.wang@linux.alibaba.com>, Chester Lin <chester62515@gmail.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>, Claudiu Beznea
	<claudiu.beznea@tuxon.dev>, Damien Le Moal <dlemoal@kernel.org>, Dan
 Carpenter <dan.carpenter@linaro.org>, Aisheng Dong <aisheng.dong@nxp.com>,
	Dvorkin Dmitry <dvorkin@tibbo.com>, Emil Renner Berthing <kernel@esmil.dk>,
	Fabio Estevam <festevam@gmail.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, "Ghennadi Procopciuc (OSS)"
	<ghennadi.procopciuc@oss.nxp.com>, Hal Feng <hal.feng@starfivetech.com>,
	=?utf-8?B?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>, Jacky Bai
	<ping.bai@nxp.com>, Jianlong Huang <jianlong.huang@starfivetech.com>, Joel
 Stanley <joel@jms.id.au>, Jonathan Hunter <jonathanh@nvidia.com>, Krzysztof
 Kozlowski <krzk@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
	Ludovic Desroches <ludovic.desroches@microchip.com>, Matthias Brugger
	<matthias.bgg@gmail.com>, Matthias Brugger <mbrugger@suse.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Nicolas Ferre
	<nicolas.ferre@microchip.com>, Orson Zhai <orsonzhai@gmail.com>, Patrice
 Chotard <patrice.chotard@foss.st.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Sean Wang <sean.wang@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Shiraz
 Hashim <shiraz.linux.kernel@gmail.com>, Stephen Warren
	<swarren@wwwdotorg.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Thierry
 Reding <thierry.reding@gmail.com>, Tony Lindgren <tony@atomide.com>, Viresh
 Kumar <vireshk@kernel.org>, Wells Lu <wellslutw@gmail.com>
CC: LKML <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linux-tegra@vger.kernel.org"
	<linux-tegra@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
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
	<openbmc@lists.ozlabs.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>,
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: RE: [v2 18/20] pinctrl: freescale: mxs: Fix refcount of child
Thread-Topic: [v2 18/20] pinctrl: freescale: mxs: Fix refcount of child
Thread-Index: AQHasnbfxjMqW6dTMUak/dMe9Bcf87GviTCw
Date: Thu, 30 May 2024 09:54:23 +0000
Message-ID:
 <DU0PR04MB94176E5675F443199330960888F32@DU0PR04MB9417.eurprd04.prod.outlook.com>
References: <20240504-pinctrl-cleanup-v2-18-26c5f2dc1181@nxp.com>
 <aa58efd3-b502-4bed-8c84-e5d78da23fbe@web.de>
 <DU0PR04MB941783DEB48C73844CD3FDBF88F32@DU0PR04MB9417.eurprd04.prod.outlook.com>
 <1f40d455-556e-4ba8-96dd-40b49f8cc3b7@web.de>
In-Reply-To: <1f40d455-556e-4ba8-96dd-40b49f8cc3b7@web.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR04MB9417:EE_|GVXPR04MB9831:EE_
x-ms-office365-filtering-correlation-id: 403ae6b2-94a9-483f-9d72-08dc808e7be3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230031|376005|366007|7416005|1800799015|921011|38070700009;
x-microsoft-antispam-message-info:
 =?utf-8?B?VENJZUFMUSs3U1ZwZzJrbkMxemhTZnlmM2UyajIwMGp0V2FBZWpjUXpBL0dJ?=
 =?utf-8?B?dERnaVBLa0xTRXVzOXJ2a1BVWkpTUXMxd3pLczNQVzd6RzErVUNjVlBoR01G?=
 =?utf-8?B?U291cnFDV0tndVJnTm1lUEdxSUpRbjh3d2g1Tkx3dE03eUR3MXM4V1J2VU5J?=
 =?utf-8?B?YWFKQnV2ZTVIL0VLWVlPNEovSU1rNGZVMXZnL0VtYUJrOURKZlA2SkV1N3M5?=
 =?utf-8?B?MWtEdEhYUmJrTk05LzJGVHEvN0lWU0w2NWJiSnBaL2U3b1Vkb1JNa3BQL3Nh?=
 =?utf-8?B?YVR6OVRJVEszVTU2MmpzV2VlUFN5U2ZscTJ3YlhUREl2Z3RPTWg2bmZZRWNq?=
 =?utf-8?B?NUdIVHRkQTBkOHNab29lc0V1VjR1MUxXV2NBdDdnMFdxa2UyYjFQMUlRRmZ6?=
 =?utf-8?B?Yno0WU9udzZoa3lSNUY3ZUprTUg2TFkwSzRobkNJQko2YjVkUlV1UjB0M0RQ?=
 =?utf-8?B?d0Fnd3lpZzdBOGFkQmgxSVB3K2hPL2ZaWkx2TVlGQWZQeTVVU0kyY1Brb0cr?=
 =?utf-8?B?d2pPOTZUZkZ1N3NlTmkvWm1sOHdBZ2xoM3kzN3Q3eHp0bnA5TU9MTnlnTTNj?=
 =?utf-8?B?cnRXRGVlazFrNTRXdGhxNlZPL1h2U0MzVTlXbVA4RjN2QngwcG4xMFFENGc5?=
 =?utf-8?B?dzJmZDZuKzdRT3daZUwvWm5kdG1wT2tmL3NBY01La3F1cVlmVm0rc1JLWUNh?=
 =?utf-8?B?T3UxZXd3OG1TRlRQNnlXOWZrRjlHb2Q5dDhXQ2ZGdU5vKzBWOEtpVG44ZVlJ?=
 =?utf-8?B?ajRsekVsU3Q5Q2k1MjE1SmhwVjBXaDZKZ1YvanhUZFlXOHRCRGI2TWlMNzVG?=
 =?utf-8?B?K0FBSDJUMGduRk5ua1ZaOGp0dTdtNHdHbmFia1JSbHZkcHErQitwcjNTdEgv?=
 =?utf-8?B?b0VMbTZKaldCa0EvWFpPU3NicTI2ZGFucDhPYWt0VmZCQmVMQjB2SjBSWHM4?=
 =?utf-8?B?QmJZNmZLcFdpL3VpR2lxZGFXdUtqL1NJYU5KZW1BeEZ2WnkzRGVXL2psZ0k0?=
 =?utf-8?B?QjVzdXJYWFgrVHh2NlZtNWE1MFFjeEVpQXBObDY2RmwrVXJ5dTVSZ29kZUYy?=
 =?utf-8?B?bDlkWFhwMDNCSDFHY3hMZXNMNU9mVm9UeUV6eHNXNE5PdXJqVnVxYk5iUWts?=
 =?utf-8?B?YnR1Y3AyYkFMd2l2RHVPeXZmbXpRNjZicUs3U2VCbE1NY05zeUxKTTZsa1RF?=
 =?utf-8?B?dzB2M3hwSXZjdmlPTUpJKzZPVVQ4SDRoL3V6c2dnemdZcDcvMVlmQkZFeTNz?=
 =?utf-8?B?S08vc1lxZlFobHZjT3puaTN3UWhxOFRjem5hVk5JWU5zY2ZFYm84WjlDeEhm?=
 =?utf-8?B?dGxqdUhJWC9IL2wvSnk1RGVnM3g2V0czcFBkQ3ZFeWVyZy9YQWVXUVBueFc2?=
 =?utf-8?B?WFNBUTFIdURlbi83Y1k0YW1Ia2hqMkU4dlpGQ0JuenRZb0tiaWk1eHNCV0VG?=
 =?utf-8?B?QXZzQmREODRuNm8rb28wZk5ZSnZCM2d2UGxJY0x5b0xJRUdXb3JJWnp1NGxv?=
 =?utf-8?B?RkxOb1dlckxoaFJHZ0kwU2wyWk5yT2dUVXVCa3ZwQjBldmhJS0V1bVVTMk53?=
 =?utf-8?B?bG5Xenl5TWo0L0NXSUJyUTVoOEZqdXA3U3hXN2l4SFlNd3NJTTkxQmhyR2xo?=
 =?utf-8?B?bGFHQm01MEJKcUhGaDdsTTVnQ0RsL1VWUTE3MDc2RXVSR3BGUHoyMURlbjht?=
 =?utf-8?B?SzlRejlEdThhODQyYlNZdkh4ek0wVWVwak5TdWZ5N3ZGUHpVSTBDY3IyL2lQ?=
 =?utf-8?B?TmZoY1JDWFhWTFNzT0cydWEzL0trZWpwVml5UWsrakpjL00wWGxjRnpLSzRt?=
 =?utf-8?Q?uNoVhqt/zaHRRtIgjgxHAu4xGOJz0q20XnGe0=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(7416005)(1800799015)(921011)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?anZiSy9NNitpcDh3RE1PV3BIQ2drL3RhNjFNd0NWTHNSbEMrOGhERll2T3I2?=
 =?utf-8?B?d0h6MHk4SmkvOUEyT1hRNGFxVVJmRmE3T2hGbUNZMTIxdUNyU3RDR1Q0NWRM?=
 =?utf-8?B?WktyRUszRitDRithOFlkT3pEcVlEbi9ucWNjcEdNdzlFZ0Mrb3JpUUtQemMz?=
 =?utf-8?B?V2NBSWF5aXFVbjJVOHphR2lYTHI2WUNkWlZaMll4NDRseDhqNjBXQ00rbUpF?=
 =?utf-8?B?NUdHdnJFV2lZYVZwWTdvWjNOMkF6R2lsb01uL1BVZkpJMnBIUDhpWlN5M29p?=
 =?utf-8?B?SzBKOEtXenBZQTRRK0I3NHJxZ1ZkMnBpaU9NZ2Y1VXVjNllrOU1hU3NMSGpY?=
 =?utf-8?B?QzMvazJGTEVpQnd5Nm1nSnlkWGZ4aTUzV1VYcVhrU2VwbjY1MGhqaDd3T1cr?=
 =?utf-8?B?ckJmaFVtUVZkRTAwOVlYYWtmb0NiTEtWbTIrTnFWV0k4SWsxUlAxMzlpcVBn?=
 =?utf-8?B?Yk8vc3I4Tms0YjJMS2N4RjZNZWNTQVRVUzJiYXVZUnpQWGI0N2R0VmZYdWlU?=
 =?utf-8?B?TXlDd2lRYmxORExqdmlpMEdHV2E3ZlJwejlBV1Q3Y1ZzQzZPR3EycFNPQm8v?=
 =?utf-8?B?ZzBzMm1UVFVOaWFVdGdVREw0VTU5OTBTUDVMUXFVUlNQVnU4WElZU3VWRUsz?=
 =?utf-8?B?aWxxQ2RibytJTXRuOFFBR0c5NlF6Zjcxc1hNR2hzOFI0UVEySWh4bVk0MFJI?=
 =?utf-8?B?Y0c4cjk1M1Q5d3RZd2lYaFptZGYraFBPeHhsSXlnUkhLdURoc1l4OS95b3hn?=
 =?utf-8?B?QTBYK21HbzBEdnNIS0xJL3FqMUxSMzlJVDNZbjNQSFNYc3dGM3RkNTNEQ0Vx?=
 =?utf-8?B?cHhPTVVkNjU0RlJ1WGplUXFtYndsaThYVDNGeWhhWkZWSGVteGRSSUFJTlVH?=
 =?utf-8?B?b2V6c3UwQmdNL01MSHJnUERNY1VCR2sxc1RDUTlrOEpReHhaZHR4REF5dk5n?=
 =?utf-8?B?YjdsaHlzcyt0UVhIZkpUZUlGRHRMUnV5dmZpVVoyem04S0VRUWZyZk94VVhL?=
 =?utf-8?B?OXRIOURyeVV6ZFJoalpBUTAyOWhhSFJYdHhsV2hlamp1SmU5WFVzMEtnak82?=
 =?utf-8?B?ZkxkVFN0bDdzTkh2YkpDWk4xTUtTblFmZDdUMkVyNlR4K0ltWjV5Q0czZFlz?=
 =?utf-8?B?YnlkRHJDNGIwcWg4MGN3aHIrTGY5TklBamY1RVc3QTVsOERWTEp1RWc0bUI2?=
 =?utf-8?B?U2VoUjROWloydDdTeW9TMEg1ZEpCdnlKbk1tR21XS2FLMFJzaGRGaDVwVHg1?=
 =?utf-8?B?Qk8wVmxLWS9hOXZ5M0xHK0I1Z1VkSjQ0ZWZRb3d1akxyTTdJNW1aOVJ4bk5T?=
 =?utf-8?B?a1RDbWQ2QThlSmRrYVB6ckNRN09vY3pYRjhiUUZqZlpRdEMyTUhJdUU5UEpX?=
 =?utf-8?B?WXNsTXQzVDNvTG9TaXVKOUNic2RHUlVwNGZnR1RyL08yZWw1VUJrRmxpdTcy?=
 =?utf-8?B?NHRlYk1ReXpxdysyMjgwSitxYUwyZzNzUXFWMmVKTTB2SUN3QjNyUVNkMmNW?=
 =?utf-8?B?SzFncHo1OVQySmxrUlBGdGw3WVVmWmJyK2xoSEVPUVVrRDFYVVJxVkRoNmNS?=
 =?utf-8?B?ZCtMZEtJMlZLMU9yZllzZXRyQlc0QmZvamtIVjZXOGJVVlROSlQ3QS9EbDBV?=
 =?utf-8?B?QkkybkpSV2xteUs3ekxGL2J1YXNObkhiYWVNVmoxVFhqUW1uQXFPb2NLRGpn?=
 =?utf-8?B?ZmZlRlprVzRYMnYxaERlMXlRQTUzcEZmSGFSMG1EUEkwNjh1RmtWSVlvTGhF?=
 =?utf-8?B?Y2RtWnZYQSs0QkZJcElpU0lOL0Z5Q1NKZzF1NkNXSWozTVpaRER4aDFhdUJm?=
 =?utf-8?B?bjYzV0FzL2doQ05HTDNsNWwzVkttMW1zdE4xWDlzNzk2ZnFUYTduR3o1Sk13?=
 =?utf-8?B?QzF3eDhUUHU3bG5TeXRPT05nSFQvNHFGQlB5MEtJTGFmSDNSN2ZibUNDVlA0?=
 =?utf-8?B?R0FWOTRVRHBhQ0t0MjFobWYrNzB5RE4zSmdxWE42V2ZKSmlYSXNoZDVwL0ds?=
 =?utf-8?B?Z3FFOEdGaDJyQUdKY3Q1SmJZNXYrWHo5ZmFoU2x1UTU3cU9Zd3ZITjloK1FZ?=
 =?utf-8?B?RkpUZnpwOGhZQlU1ckN0RlFwNWc1a1JBVkVZMHg3bHdBM3VVQnpsSEp6c1ln?=
 =?utf-8?Q?vGFI=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 403ae6b2-94a9-483f-9d72-08dc808e7be3
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 May 2024 09:54:23.1447
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tCkwz/WjwRery8Uw5tOjY2qvgf8dF7wRvgZdU7tGGJblRrhlZlyo56ALhUif7v/18g4xkiBTwnSp1M+vhf1Aiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9831

PiBTdWJqZWN0OiBSZTogW3YyIDE4LzIwXSBwaW5jdHJsOiBmcmVlc2NhbGU6IG14czogRml4IHJl
ZmNvdW50IG9mIGNoaWxkDQo+IA0KPiA+PiBIb3cgZG8geW91IHRoaW5rIGFib3V0IHRvIHVzZSB0
aGUgc3VtbWFyeSBwaHJhc2Ug4oCcRml4IHJlZmVyZW5jZQ0KPiA+PiBjb3VudGluZyBmb3IgY2hp
bGRyZW4gaW4gbXhzX3BpbmN0cmxfcHJvYmVfZHQoKeKAnT8NCj4gPg0KPiA+IFRoYW5rcyBmb3Ig
cmV2aWV3aW5nLiBJIGhhdmUgbm8gcGxhbiB0byByZXdvcmsgdGhpcyBzZXJpZXMgZm9yIG5vbi1h
Y2NlcHRlZA0KPiBwYXRjaGVzLg0KPiDigKYNCj4gDQo+IFdpbGwgZGV2ZWxvcG1lbnQgaW50ZXJl
c3RzIGdyb3cgdG8gdGFrZSBwYXRjaCByZXZpZXcgY29uY2VybnMgYmV0dGVyIGludG8NCj4gYWNj
b3VudCBzbyB0aGF0IGNvbW1pdCBtZXNzYWdlcyBjYW4gYmUgaW1wcm92ZWQgYW5vdGhlciBiaXQ/
DQoNClllcy4gSSBoYWQgcmVhZCB5b3VyIGNvbW1lbnRzLCBzaW5jZSBJIG5vdCBwbGFuIHRvIHJl
ZG8gdGhpcyBzZXJpZXMsIHNvIG5vdCByZXBseQ0KZXZlcnkgY29tbWVudC4NCg0KWW91ciBzdWdn
ZXN0aW9ucyBhcmUgZ29vZCwgSSB3aWxsIGltcHJvdmUgaW4gbXkgZnV0dXJlIHBhdGNoIGNvbW1p
dCBtZXNzYWdlcy4NCg0KVGhhbmtzIHZlcnkgbXVjaCENClBlbmcNCj4gDQo+IFJlZ2FyZHMsDQo+
IE1hcmt1cw0K

