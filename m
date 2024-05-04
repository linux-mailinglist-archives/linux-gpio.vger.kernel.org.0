Return-Path: <linux-gpio+bounces-6099-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 77AC18BBC11
	for <lists+linux-gpio@lfdr.de>; Sat,  4 May 2024 15:16:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2E185282E7F
	for <lists+linux-gpio@lfdr.de>; Sat,  4 May 2024 13:16:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B913639AFD;
	Sat,  4 May 2024 13:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="EVS5HR5x"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2078.outbound.protection.outlook.com [40.107.22.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C750E2110F;
	Sat,  4 May 2024 13:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714828561; cv=fail; b=n5KIhlAslUWQRQGwSgO3QhiJTHYb58z+oAkXDS631V42Wp4X6Ohwng5Apu6b/zq47Rj5kKOONq08LJkD/KE/xrYwWXfdcl5xYuY0Z/JNbZk5DAtakJniOJ7Bb6FoW0N7t6qAemcIedE9w3tNaUsXKT9+tsUkyvUhPWGvvAjHy6Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714828561; c=relaxed/simple;
	bh=UYDu+QLrZ0SSLpWHuRHRNNZ73xp3uVF3FfCqwL6cAd4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=i3iLvfxfl6Z0NnaVCSbMkDGL8/ZqC9W4zcseDcsNF5eGCLlBrld1LNt0dIi4r2I1EzDjv62VDyUGA85NSYwkjRE/CAFElf7cNtfT4GHh/W5h+/Q1Ld7iSCpfql+U/frmL7aVY2yoYbPQH6tMUwB8mb86NJfiT6Py81PyjdYZlP8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=EVS5HR5x; arc=fail smtp.client-ip=40.107.22.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lee+JnAzlNvpehCxhyFAeNpuVgBeieK0ADvhiJEQqhD5hrggv2Iv+0N7RubufUMVytEBTc5Z3PorTPlZQzy4on0VDWXW5O3GGi3eunGf6u8W07OKRiaMybHa6Y5gjwlJYyrivI/aFHaQEEl1THvLGBgUKsxK4PrZs60drZ4aXox2/BTK5RdlHZHofGyMOfeHw4o8PvmTQtHPWcgZDJj2Wez3FtOLBNsbl4ywsj56D3xzm8hci8kdUH5IhQqDFWLmpNNvF7UHiNdRzeDOf+t8JAxIolN9NrEYKsLnNqbQIAL2fhW83h4X9KoENDLEtBQvkFCAX3qmE9UBLfIEJxWzHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wh46VIFFtnR87VP8CR7uMzRt81dfHvC2gK19Gu2CtGM=;
 b=aEj/6j9IjzSd7KybfPLL3ptJ9WKdL0PYHrUkCXghiSmDOzxXraYQqc4iO9uTppTMoEhk1KAyvoWlN5KXwB4yWjClQoH+Krx5fBgJQu4to/2epChjSQoMNZceMY5Qtn8g5tr1QyqXgiXLku2vHu5tIAZZfKqd+SxOQiZifaagg4eXRLTOTAplderools+hJbX+qAtUxX3mTmz/15yf9jvxk2ftcyEqsj3tA7ZiUhGew41dZIxE5wASVm+7bDyCCkG8SnwS489nBvEkIYHOyOKRn/uqHpqm+pfnxnXy9xmSr/8LOpPCi0GLgi5iUJuupPbEBXdHA2T7ytaQZO3HHeCsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wh46VIFFtnR87VP8CR7uMzRt81dfHvC2gK19Gu2CtGM=;
 b=EVS5HR5xT5AFA5dsCbKK5mnP37N6m8GiH3ZoMhDe710IfMnodKMRLnfDYtCYSuzrxxLvkKC47feDQoHmqZkUF4OUrFP3o18J6dUNoJmL/+ayPxkANvxAPQMDmIaKB70JBkCdxI3cANfhpsRHxTPMF//ttNGowaREPSakeoEQ0pw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by AM9PR04MB8633.eurprd04.prod.outlook.com (2603:10a6:20b:43c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Sat, 4 May
 2024 13:15:57 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d30b:44e7:e78e:662d]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d30b:44e7:e78e:662d%4]) with mapi id 15.20.7544.036; Sat, 4 May 2024
 13:15:57 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Sat, 04 May 2024 21:20:11 +0800
Subject: [PATCH v2 13/20] pinctrl: nomadik: Use scope based of_node_put()
 cleanups
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240504-pinctrl-cleanup-v2-13-26c5f2dc1181@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714828815; l=1905;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=x+RKtlqeCysZbUAk0csydxI+b9I02cK4F7LOISGb+DM=;
 b=JE8/0bWFt0FhuoluAmwXD7cZ1NKNXM1V4n4g+hFSwn0VVc4ZZ5ApyeZfiWy4V4lQKgKKWENdl
 0jAfiJK0OOcCjOJmK2qZEUZh4Q54eqOAxtCinzihJGth/uc8xGvAO/J
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
X-MS-Office365-Filtering-Correlation-Id: b70a4f8e-bdcd-4b57-d0c5-08dc6c3c55ab
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|52116005|7416005|376005|1800799015|366007|38350700005|921011;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RTVMK0JVcW0rdk1TbTM5RnJwMlN1ZWhzVk44ckVJVGhZN1pNTTAxR0VvR0xD?=
 =?utf-8?B?Nms2WWVYNVhsbGFUVzlqUmN1U0NXdklWMmp0Y1dqOVNlT3lHM3VEYkc5V0Q1?=
 =?utf-8?B?V0NveG9SQXV6a3lWMmZSS1MvTWI0R0V3Y05nTWZTRExFQ2NTdzZ6UExUd0R3?=
 =?utf-8?B?YTc4eFQxUUdXSHVsOWRlQXZ0MmtJOGdLVXdjcnhXRHh2K0U3a2gwcTAxcmpW?=
 =?utf-8?B?OVRPNEgzZlk5OHJ6V3lUbGhlcFJ1RVhLYVoxN0kzYmJVcmlnMy9rVzI1VzBC?=
 =?utf-8?B?T0pKMkY0WUxkSUJlbkNJNGxnUW9zY1BhUGFYNFVybUZoTjlyWW5SR1h5bjNk?=
 =?utf-8?B?SFVmOXZRTjdNUnRJTmExcFlBRWZuR2dtSTRrQkJqcktzQ1F5OFNrVDFIWTdD?=
 =?utf-8?B?ZnMvazZXOFpBN203Z0hXUUpQeVBNTjJ6UXhjTFVobEJBTDBTQVVtVmpNQStU?=
 =?utf-8?B?K2orZjJFTHhlTldxclBDZHJRMjE0blZoT2diNmZZRVprVmxrUmtlL013OG9u?=
 =?utf-8?B?V1VJN3RkS25JWHU2Um9ROXhDbFRhTCtXR3NUSUFhOExEZllqaDVsd2hlV0ZL?=
 =?utf-8?B?ZG9tQzlNYnlhZVBrcjNjTEVZYmpFdU5DUVVxMUh6SlRmdnk4RzBRN1FBRno3?=
 =?utf-8?B?OU52bHhkUUlMUFlUK1o1YUlHNEZQOEJPV0JFbVZSSStXRlVJZTBmL24wUStJ?=
 =?utf-8?B?M053MUh6OEFicTF1WXc2c2tCak42R1JESmtCNEJwOTJDa1AxVmRudWpiK2t2?=
 =?utf-8?B?b050R2E2YkV4VW5XcTVVMXhsRjZrdmVKZmZ1TmRmWHlTMFRvSUx1azJPZkNl?=
 =?utf-8?B?K1hsV042NWI3SnpvYTRkdWdjdVBKZFVxaFNlZGRMejB6UkprQkc0Ni9XM1Nq?=
 =?utf-8?B?Ym1NamZDa1JsVHRXbi8yS3dEZ2xPNGxtQ09IRUNRVzZLend6cytrVWd1Zzls?=
 =?utf-8?B?eTdFdk1ZSm00T1EreE5seUJITU5IZlpOc0psWlNzejdCR1ZCM1ZHcFUraHRX?=
 =?utf-8?B?NVhWcEtYUzRXK3Rmd05zbEhiRDlwNWszWEVvYVdFZXljV3orZmtSbEpKZGNu?=
 =?utf-8?B?dXhhZGdjTEpYSCs5eXNURGZEeVlna3JFdkZ1WE5MUEVSWFZzaTVGZDVaQUU2?=
 =?utf-8?B?enNaQXBsM25WZXVYQ0hOdzNxVzlYZGVDVVB3dDIwSU9HS2FuY0lkT0JNSDRv?=
 =?utf-8?B?S3ZLM3IxWWdIY2NWVGFPZTdUbGUzRzNUbEZkOHYyRllJeTNoWXczcysvbm9r?=
 =?utf-8?B?TCs2Ym94Z2c3eVViV3Y2N28vZ2U2d2NnaURrMVpTZkE1UTJGZXBCMDNjUDBj?=
 =?utf-8?B?SldHMW1haXhaeTNqRzFGQ0JSMnRRS0IzRStKZjVSbG9LZnk4Yk9KdVlJSnV1?=
 =?utf-8?B?WFJlMXc3VEhUNVFCYWsrME5iNmVXTWZJNnBCRVlHbTBiS1owR09HbDdqRE5l?=
 =?utf-8?B?RXJiSDhGbTM5TXg5cjlSNnhXRVBTVWh3SXR1OUZMSzJVTjdIUlo5ek5RN25o?=
 =?utf-8?B?S1Z5M0VnL0lxQTdWK2hBVE0zcWRSRTFCVER2L1FXSlN4ajU4OGQzQzJ5cXJF?=
 =?utf-8?B?YVFyVVJZNVI5QW5MeWNaTG5xQ1pCVU13d2J4SDFVaE4yNzJHQ0NTQWZhRWJP?=
 =?utf-8?B?cU0xV1hJbzVEN3l0QXJpSFlCUnhzbE1wNkpwWlBYcGVYMVJoUWhOZHdvUGNq?=
 =?utf-8?B?MVZYcU43Zkh3enJneGFDNWVYcXpBNmZIeDVyc3E4T0xwa3NpczhTUFhJK0Ez?=
 =?utf-8?B?OHA3WUZIbCtDRFNabzN3dHNsZVVJYVVCMVQvc21wanQ3VEtjVjJKUXgyOFds?=
 =?utf-8?Q?Ti2NS4TsUg7PVW9cHqpBHfyE1S1gner7m8WWo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(52116005)(7416005)(376005)(1800799015)(366007)(38350700005)(921011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aFFkSzAyeVhRTi85SHhDYlpXbXIzYjRKUmJsb2MrUmp1aXdGOEdTRlRXUkJm?=
 =?utf-8?B?Q2xEa1JjTkJEMWlvNlpERXZNanI3bW9YNGI4YzBRR3VxV1pjUFdWTGFic3Fv?=
 =?utf-8?B?TXlaYWlMR01JUHBUVGYya1BqWTgyWXJRMWQ2emRsOEN1NXczWmw5VUc2WWdW?=
 =?utf-8?B?TXhHUkI1cWNZS0hoNUt2NEJqeG45UktZaVl3cm5UZUVmeE1vWGFtT3lPWEUx?=
 =?utf-8?B?cThUdHA2VjcyUjZxb0ZWZk1rZWVHZk8wZVJYeFpTMW1nVUxaLzRYSXRnd29p?=
 =?utf-8?B?Q1haRWdtQ2hBSGNNMjNBb1NWLzlDVzlmVkt2Sjd2SFR1ckt2SmhPTWlOMmll?=
 =?utf-8?B?YURydXV1d01QYTdJbmZsbXZmSUpQNUdCS05vb1ozdGhiZUFVSGJHbXppSm5M?=
 =?utf-8?B?cXpyanJuMlJ6WlVyY2RHTmhacHovaUMxSXlaMm9OL0ZXWnJ5cGVHVjMxWjhH?=
 =?utf-8?B?T0FrWjd3UWFjNmViR0lPMHpNWFRNUytmbzQ0N1NaK3V2NThpWnZ6Q29MQy9k?=
 =?utf-8?B?NXl5dDJQUUpZcG8xR3JnTnhaYjFZZ3Y4MzNRNjlTUFRCYVFUc1grblpoOEdG?=
 =?utf-8?B?dVMyQTM1Ly9oQlRtNlh2T3dCQjArSW9BQ2ZaeTlYT0xoN3lIdHZQdWw5MHlI?=
 =?utf-8?B?R01ySGtNaVhlRlhHcHFSaEZDZUFjUXNXWjNSa2FVZlRFZUVvZXBMcjBHUUZL?=
 =?utf-8?B?ZnNrSy9mN3V3Q3ZwRTFjeVduZXpCM0RqbmdXL1I0YWZuV0RyL1V2T2ZsbUhV?=
 =?utf-8?B?VzRGaWNlZGJxZFhBOE93WERwU3VqSFlob3FkVURzNHdLSDdiQXh5eVlkN2xv?=
 =?utf-8?B?UXpkTm81YXBXeFllT3dSSlpJWTQ0Wk5acm9BMktHNldwTStZa0cyZEszQzBY?=
 =?utf-8?B?cGJENzJSV25QWkhaaDl0K3F0Q1haMGtSeTlsTzZRZklwS0ZmQ1NBQnN1RGZx?=
 =?utf-8?B?bnhFVVFvbng1UmFuM1R0R2NTS3lPeERQeG9tblpzUTFyVHgvaDBzQSt4OFY1?=
 =?utf-8?B?cTdaUUxSMGhqZU96TnNTcExZeDAyNVE3eVpsd1VYN09BMWN1OXo1a1V5b0s3?=
 =?utf-8?B?V1g4ZmRqQW5Qa20rUWFxTHl3WDlpS1FZa2VCWWxydlpPNUxQVXdNM21CU3NG?=
 =?utf-8?B?SllXbEhUOU1YbWZsSzJmZzdIazJJb3dseEI0OERUTFhST1JrZ3IyWk1waEFK?=
 =?utf-8?B?ZERUOHJJakdZa3N2QmtCZHF6OUFQMEFjbkE3dGtaZUtudnRhdlpjM05ibm1w?=
 =?utf-8?B?TWdaQnpGRnUzWGU2NWxoVzdvR3RQN3hqc1A5MjdBS2k4am00a2RNQ1grMnRi?=
 =?utf-8?B?TmxqcVpzb2lsd3BBVjhMNVRpem0xODdIMVdPTXpRN0pJOFNzU2FxV0RKM3l2?=
 =?utf-8?B?eG5KcEM5YlJ3ZnZyUTZ6bWlGSStmdzJxM1hxaXVrKysxNDdXYW5CWHVpaFFJ?=
 =?utf-8?B?NGZhS3RwV2QvQXJWK3FqNGdodUFDWlZFdzEvM3dKS2pYVXZLanBuL0xyQ1lV?=
 =?utf-8?B?M1V6SVlHSTBrdEIyaGptbmpOUW9nRmJRN0VUdWY1L0NxVGI5SGQyL3pMMk9v?=
 =?utf-8?B?ZjU5UEFKUExaQkwzdVhxRnFoeURyTXN0SFI4dEVOQ2ZhMVE4Yjh5ME9NMGV6?=
 =?utf-8?B?N0hJMlluWnpyUXEyd0U1aHhZQUlkNnoyVjVIb1hlTnllNmhTZ0U3RDgvS3hP?=
 =?utf-8?B?SGZDRU4rSUlmZ0I3bTZBTGlaaHdaSyt0Nm9YRDZPZjl1dUxoSlBFdU1mRlR6?=
 =?utf-8?B?RmozRXMyOXE4RlFYNGZDazVDbEwrb1RxeWh6TVZQWUU2QlRJaC94ZmdoNE5u?=
 =?utf-8?B?VENZTHVWM2Z1TUNMZDlCRHpnZDM2RDA3SGJCYzlsclVLK2F6UldEUjdVaFl0?=
 =?utf-8?B?OVk3elBwL0VPMlJTUU1ySDJjOVcvMTVIL0JHR1VIODN4OTF4T2FtVHZpaEdC?=
 =?utf-8?B?bVFKMHNEWkhsMU1RUnVmb01SRUJlV2VNbllBd3pjS1pLN0duUUEwMmZ0OGFO?=
 =?utf-8?B?KzJQTFRFUjRmaEV6MnNocEJyZEFURDRUQ0VjMFJkYTVvVWRoRUVVTDVneWwz?=
 =?utf-8?B?a252RTFUbyt4N0N6QzdJQ0w5cGtIZTZBNCtlOEFRQU5oR0R5LzhNTG1ZUTc0?=
 =?utf-8?Q?K7kZ9zVoNRQRzk/x3SCy4hua6?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b70a4f8e-bdcd-4b57-d0c5-08dc6c3c55ab
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2024 13:15:57.1871
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UNrCeNgMIYVy+8heMkCZBvq6g6j6oQC/D98TXd5g78WaLKxK+Hl3hAFwJCgy7l9LEl9URhHECQ/dXLSXji+JsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8633

From: Peng Fan <peng.fan@nxp.com>

Use scope based of_node_put() cleanup to simplify code.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/pinctrl/nomadik/pinctrl-abx500.c  | 4 +---
 drivers/pinctrl/nomadik/pinctrl-nomadik.c | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/nomadik/pinctrl-abx500.c b/drivers/pinctrl/nomadik/pinctrl-abx500.c
index 80e3ac333136..47f62c89955a 100644
--- a/drivers/pinctrl/nomadik/pinctrl-abx500.c
+++ b/drivers/pinctrl/nomadik/pinctrl-abx500.c
@@ -811,19 +811,17 @@ static int abx500_dt_node_to_map(struct pinctrl_dev *pctldev,
 				 struct pinctrl_map **map, unsigned *num_maps)
 {
 	unsigned reserved_maps;
-	struct device_node *np;
 	int ret;
 
 	reserved_maps = 0;
 	*map = NULL;
 	*num_maps = 0;
 
-	for_each_child_of_node(np_config, np) {
+	for_each_child_of_node_scoped(np_config, np) {
 		ret = abx500_dt_subnode_to_map(pctldev, np, map,
 				&reserved_maps, num_maps);
 		if (ret < 0) {
 			pinctrl_utils_free_map(pctldev, *map, *num_maps);
-			of_node_put(np);
 			return ret;
 		}
 	}
diff --git a/drivers/pinctrl/nomadik/pinctrl-nomadik.c b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
index cb0f0d5a5e45..fa78d5ecc685 100644
--- a/drivers/pinctrl/nomadik/pinctrl-nomadik.c
+++ b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
@@ -804,19 +804,17 @@ static int nmk_pinctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
 				      unsigned int *num_maps)
 {
 	unsigned int reserved_maps;
-	struct device_node *np;
 	int ret;
 
 	reserved_maps = 0;
 	*map = NULL;
 	*num_maps = 0;
 
-	for_each_child_of_node(np_config, np) {
+	for_each_child_of_node_scoped(np_config, np) {
 		ret = nmk_pinctrl_dt_subnode_to_map(pctldev, np, map,
 						    &reserved_maps, num_maps);
 		if (ret < 0) {
 			pinctrl_utils_free_map(pctldev, *map, *num_maps);
-			of_node_put(np);
 			return ret;
 		}
 	}

-- 
2.37.1


