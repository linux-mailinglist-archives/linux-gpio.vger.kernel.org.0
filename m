Return-Path: <linux-gpio+bounces-6092-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D718BBBE4
	for <lists+linux-gpio@lfdr.de>; Sat,  4 May 2024 15:14:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 17F2728094B
	for <lists+linux-gpio@lfdr.de>; Sat,  4 May 2024 13:14:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA00B37152;
	Sat,  4 May 2024 13:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="K9HoFs+8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2068.outbound.protection.outlook.com [40.107.22.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE262D058;
	Sat,  4 May 2024 13:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714828445; cv=fail; b=K71+/2QVqCxiL9jHW4ewZ/iIXDcU/TcBEnTfIaG6/NnYGIS7cXj29BM4zLw2LrA66B3SWuz7CzQVlh7oKuHjuyeFj7V/4Hpp7nuc1r/xxMrc+JKdAhga8Ij82oqut0GwKpxyIR/96zj/ZKNcxhCu8amo3el1KG4MUli9XDppmNg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714828445; c=relaxed/simple;
	bh=OInO6yAg14U2A4TIttQDy/mS0VvP7xhIZA0f8KUS5dk=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Q/PervaaOdNx1hxFuWunhL0wwFOs9vyT3ePpuYKlVzI/x3l1urrhJ53oXL8KvxCGmTcT9fW8hllizBTh8gw7Ry+7paqNOfI9npN0MxVuAsyj4HMDqAiokVsEHxfouPXWlMNoNN/J7PhIjZlBmvov5i1Q5EKFFJIVjJahEQERshI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=K9HoFs+8; arc=fail smtp.client-ip=40.107.22.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BB++BuCWovknZieJLe0ezXwJ+LlNNUJmOh0r5XrnwAwWqL9Hl8BKUM0C1XizqtjYZfZ0i+bX5qH2cv/biMOHoFZfdjxbjDDKaGwbGOEPf1+IEnCLneloZqj0Jfpk7hNcEFVo1Yr39KkUcd8NAwWmbp6oKWLA2LvtQ8EfgcZd8cYg8xeV0LUBUUOkt3FoC2GUyBsVqSZNOE0XExVjRQkd6RC+joEfrvaxBYs9aKd5wlylLZNXITXpAF3nHYZKHlIBPD0EevH7lE2F0rIbmam7K+ZeUxgJkrZwhh01QyD+qBT41Smn0I3+pq1mVBkvLLqKX8M49lpF9HY4ADjmZdX5JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Eig9P6zNNvksUOs0mChTICwLK4o4MZg7g2lLrYGu3MU=;
 b=ZmFpipRA/d0vqDXvfI9t2oC+JpQwtgSv3XbrgR6cvNx9nIZBw60DisGv1ZoNEkio6wqCcHPrpGcw+J6e/JtxkGU9mWcbYR+OyORhMgz0tI+G2p2uZPpyIqJjMH6IwEv8+zIQZb/tjOAfpqPCbenJPKDPneP2+gQeqimhb3fDzspZNZpMJSIhbca0rKMq6r7GpAnOoLDN2ssRp9kaiWoVK3Q+rnj0Ph0r1NZBS7ZqBZc0ug7hhBF4OHZ1dFVAfetlD2YqudsOGFYdL5cbwD997ZgQJIe5/ETDjVZWS9sz6fU+kqHQwF0KEwQQAvR/rbAcryerI8aZdLy2tLxWwCA34Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Eig9P6zNNvksUOs0mChTICwLK4o4MZg7g2lLrYGu3MU=;
 b=K9HoFs+8inZwiLNq5Z6MwNjq7DYsbc8JTeDqn/VxH2PSLW/7PNxhcix9EnzKWVNkwzRETbUqiIwcU4dbsWNglLL+0n+O7EcO+MsssmI20feQ0DIJuT+FAKpwdmWX0s03dV+f9DS7nr36WsAprRd03x2hSVbg/RedEz8stpoDajc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by AM9PR04MB8633.eurprd04.prod.outlook.com (2603:10a6:20b:43c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Sat, 4 May
 2024 13:14:00 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d30b:44e7:e78e:662d]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d30b:44e7:e78e:662d%4]) with mapi id 15.20.7544.036; Sat, 4 May 2024
 13:14:00 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Sat, 04 May 2024 21:20:04 +0800
Subject: [PATCH v2 06/20] pinctrl: spear: Use scope based of_node_put()
 cleanups
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240504-pinctrl-cleanup-v2-6-26c5f2dc1181@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714828815; l=1599;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=gLxq6qceZG7Nsihhv4/AWrdppvVafau2eKIInT5INMM=;
 b=5ffTl8ZtioLSYaaZNjD41K3m0KxkH56uyb2/IQ3LQ/eLhFTIgJ+z+teWheN9sal8KHmc+TJHg
 AnbJfBYdZnCAlHsBRS1fxFEmq8MQgiKr7ur+z8H1JXy6MJM4yebyMux
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
X-MS-Office365-Filtering-Correlation-Id: d6598716-c0c4-479f-c7a2-08dc6c3c0fe3
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|52116005|7416005|376005|1800799015|366007|38350700005|921011;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?djRRUUQ0YXJxcDMyNHh3RXUwSTNYZW5YWUZ5dXc0NGpGNHk4Q1hiZWt0SWlh?=
 =?utf-8?B?KzRlZE1sb2V3Z3Y0SmlqM2N2RHA2NzJRR2FodHF6RzBOM2hCWTI0SlhWYWNQ?=
 =?utf-8?B?aFNBMG5rWXlNbks5WVc4dmIwdlFEZmxmVVZoMFM4YnNCWjVFT2lrTldhRlNu?=
 =?utf-8?B?RG5YK3AzMkpoa3JzUXIvSU9hUGhiWjZjSHZwWjZiZnJYZHlyZUozVDF4VzV4?=
 =?utf-8?B?Y3N0UkN1NXVnT0pFN2J0ZUxORDFNL3h4WUFXWXhhU2hhRENqeFg2TFNzVGZV?=
 =?utf-8?B?bmV5U0RDdVhPRWEzdXhPUW5XL21XOXRwaWg0d2FxWU0vU0pqTkFlc21wQ0V3?=
 =?utf-8?B?MDRHM1lTSGhQQmpyMlE4NDZnLzdXMWZOZG9wTTFrZm9kRGpzQVQ3azBaVVdJ?=
 =?utf-8?B?d0lFYUVRT01mcGdJVGNaU1lQL3V5bStIVGNFSE1zZjdyTTFEbjNXVStXZ0lY?=
 =?utf-8?B?R0JIUmZGTk5sZU90cnBjdkI2S1pMR2ZwNlNDYzAzOW5OVkU3WlhXQllTVitW?=
 =?utf-8?B?alphdjZMVmE2Z0JwZWl5cUQxWU95R2dZaDVBdHYySnFkSzkzSVIvUnhLakd2?=
 =?utf-8?B?Z3N4WlA4WGlma05Ob0hSTTZKQ0NnSmdzV0pNVWp5TTMraENnem1wQnUxVGo1?=
 =?utf-8?B?bVVLWWdiOEVsWFozelQ5S1NzeXM3VEJINzJmc3VybUNpdGZ1VXV2NmVTZVp1?=
 =?utf-8?B?M29UN2lHbFRQdFhoTnpManRoVFdEbnFiTDM1eGxhUWJwOHhGTk40S3h5RDhm?=
 =?utf-8?B?TFM3YkZLNHJEUmF6d0EwQXo2aTZBQ0hrbGxubWtJMnZvaDV6dEJaTFEyV3or?=
 =?utf-8?B?VGNwY2trMTFKc1I4SUZrS0FCOUFxNXFuK3Z6Rk9JNyt2VkxLbGZ0TTQzTVBy?=
 =?utf-8?B?aFJ2UjVGTm5LOXIxZURiRWNuZEpZdlFCcWhqeUM1UC9PclA4YWk3cDYyWlNV?=
 =?utf-8?B?RC93OUhMdEdHY2E4VXNlMFZBelE0SUlrbGNHT01xV28rOWRNS0VXUGtWMG1l?=
 =?utf-8?B?clVCbk40Zmh3MDR6cHhxc3NrUEJhL3ZqTmV0ay9zdVBnRXpjUzdFUDdmdWxL?=
 =?utf-8?B?eE5ZSEcxR0VRRDNmRytpRG81c1A0Zkhtb2lKYUdraEwwdkFEQUt6VmlNRlV4?=
 =?utf-8?B?L3drOUtxWVNBY1pRU1lDSlEyV1JhdThQL3EvN1ViZWcvaDR4Y1dQdGhQUkJI?=
 =?utf-8?B?MmEzTVY3elh4Q2VUMGRtK3RrdFZrNVFwdysvdTVLQnJ2WE1TczV2dkNydXgy?=
 =?utf-8?B?MGY5b1M2TitwT08yWE0zSHI3Vm1VNm1Bb2l4WU4wTEtncVc2TTM5R21OV0s0?=
 =?utf-8?B?MXpwTDBXTjZ0UXhpYmpiREk5MG80QjBiUkVraXhkSjJoWDhtd1Y2RTRrRFJk?=
 =?utf-8?B?bHloOXZTckxmZGhCMzhwOFZyVU91a2t2SGZqM0hLUE5MQXpIMmVpNjR6dGVX?=
 =?utf-8?B?V21FUUdiYWlmVmorcXFhRUU4Ukw4MWY1UHpIK1kycmprOTVic0pGTVpja1Jp?=
 =?utf-8?B?eHNmN1dyL2l3Q2xocUFQd3pNM0VnMkh1cm9nVFZud3JwUVdVdTJtZXdUV0VL?=
 =?utf-8?B?Rkh5SDUyMzFxYnY4L0pGdEloRy9oS0lsNWF2b1JNVkJsSGNTYk1DdnpMSTI1?=
 =?utf-8?B?UGxEbG9GdVVJdm5JNm9oTXdVMWJmcHVFL0xZMlRrblRGQlc4Y1F3cmNhZ1J4?=
 =?utf-8?B?aEkyOGtacnpUSkhJLzQzdzRFbC8zL3pZdUd5VjNxemRyUTlwa2E4UWljak5P?=
 =?utf-8?B?MGphaWZNZG5HaDlRLy9wUm1ZNG9ZUXh1ZXlYdDhFZUZvclkrLzFja21HZ04y?=
 =?utf-8?Q?nPodn+Cxj++E8zHGQSs6kMG0dJETboHMXr7ZM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(52116005)(7416005)(376005)(1800799015)(366007)(38350700005)(921011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L01Da2pYNStpbEhjWWZmNGFmT3J3VXA2WVdUZ0RlUXhtZTltdmxDS1FMOENr?=
 =?utf-8?B?SGRjR3pDSGxYVkNFY1pZVUU0eG9TUmVpY003TmpETGw4c2F3VyttZ0lEczla?=
 =?utf-8?B?MVp1cHNKRHd6SU5FdTdIK0k0V1dZQmNIeVZMNDNZOFlKZXArYjAyRUdQS01G?=
 =?utf-8?B?ZkZuRUJHTDlYaUpuYUozbkpxUjBKbmhkTnBrek1Ydk9OMllZZFc4Y0dpTU9G?=
 =?utf-8?B?THI4Q1IzQVBIUXlMY3pVZ1k5dlBUK3g4UlFjL1h2RUx1TUpDWlY0eGY5NFJK?=
 =?utf-8?B?ZGVlaU0zbHFUM0hVV0tpa0xxNElrcEFMaEVueVhtMTBEMkJwbmxTSzl0c2NX?=
 =?utf-8?B?QTRGUWo0a3VHY29CYVdEeDJVa3QvOHhhQTUyblc1ZmRGTGY0aGVzSHB3Mi9y?=
 =?utf-8?B?MTQ1WnU1dVBiYkpDNTlzVzQwRHZpSkJuTVpYOGt6bmRVUXVZYmxoVzhTbXpE?=
 =?utf-8?B?czR1a1ppVmhONnprb3MwWHBXOEs2U1pMeUgrZDJEekNFTzlpRW92NFh5Q2Zy?=
 =?utf-8?B?RVlacHozUnlFUG10dStSK0ZEUDdmK3V0aUFQM2lxSnpkR05PUnFoczRIYnRx?=
 =?utf-8?B?YStGZVhyak5SdzFLR1Z1TitteldPMXNCbktMVCtPTlFVZ1dmMHlBdVhLNzlJ?=
 =?utf-8?B?Nmh2OWRqZmJTN0ZkZnFuenZLdGhsMmcwVU9OYThBRVRoeVVOTDYyTGQxQkVO?=
 =?utf-8?B?MXFXQ2ljZXNSTmJxUEIrWWNtUXVQOXl6NFRaekRkVGpPdngxbGwwYkM0S09q?=
 =?utf-8?B?ajFDcjFnQ2EyWno0cG1NT3ZMSml3Z3BTdHBuUUJoOGY1cUUrNUJweW1QRDZR?=
 =?utf-8?B?SEZrOFJPVTB5ZGZLRXBKSzZITm8xemJYYmJzVzlpVUN3dzJSTWdNZTh1NjNp?=
 =?utf-8?B?cm5zbWxSOU1qMzNwYkxycDYxalh5OHZNN1lDVFNQazFML25wUTVHS0d3N0lk?=
 =?utf-8?B?b0lKRll4MXJucUlpZ0hUZ1NGY0wxUUdNcXdsREkreDRCQ25ack1qNjFMVG92?=
 =?utf-8?B?ekZjekV5UWR0NVRsMGYxbm10OUVFNDZaWXN6R3JMMTRRQ0tYaTA5WFM4SlpD?=
 =?utf-8?B?WGgvK1JXMGpKL3pSdmw1MC94Zlk2ZlJGTEw0UUw1Q2tKWSsyQ1ZQOVJlTUkv?=
 =?utf-8?B?aXRBb3dnbDM0YnVyRkdNT1c2SW0vTmlHUXNrS0FHVHp4NVJjemE3UTV5UEg4?=
 =?utf-8?B?R0dQbEhqV3Y1NERpZWhEamZYM3oxdTR5R3MybithNVcrTHpmVnVnL0NKMXRU?=
 =?utf-8?B?SmN0RW9kR0xVK3lmUC9hZ1p1K25rMnU3NXZiTkZUQXV4S2kyNGIxWisyb2l4?=
 =?utf-8?B?RmlzaE5NU1NLTUhNNTBVSDFrVHZOSjBOR0xOelpoOWFqV1g0VFQrL3FYMVJ4?=
 =?utf-8?B?cmNmNnRReUtHTTF3cVZYVG4xa0x1VDdUL3pFRUdkY2xka2E3L2pmbVJPWHVt?=
 =?utf-8?B?aGF0YnRBODV0Z0pQb1VLZXdaN0p2QjNUS3lqZWtITzc1b011dXNlcGNPcTFx?=
 =?utf-8?B?bko2ZTErSUZ0WElnMmVZQzBHaEVlU2gyOWwzc1d3cEEySzkzRGVZMUpwTDZk?=
 =?utf-8?B?UXozVFltanV2b0Z3QStWY0R4SGpqdG9LcmUyQ01QOVFmWnZwZUpvOUNkSTl4?=
 =?utf-8?B?RmtHWDYySnZEUWxZNllOQm1ubWhITTVYYml5V29iazZUR2FxV0JJY1lZWWEr?=
 =?utf-8?B?SU1XNVZ4Y3B6a0MwakR3VjFsUFljaDRnVzQyRFdOZHhTcVVVTWdWYjNxYzlr?=
 =?utf-8?B?Tkx3MzZmUStWTG1CZjRmWXpuTStpVGdEZWlvdWJhSlpXcTc2N0xGRmx6MDZM?=
 =?utf-8?B?NUpWTGlLMHE3NmY2eXcxRWJhRmdZNUlmQ1o3SE1XQkowaExGckhpTndJSXZH?=
 =?utf-8?B?ODB6NlR6UGh0WnpJZG9uRzRwK2pPTU0xMHNnbllxOWlIazNiWkRXdmc2Mnhi?=
 =?utf-8?B?VDNGUm45NVBVR0U4dWtKaDdQVzZHV3hTbmlNVDlwVXcwWVNlcFBDaHVESDNR?=
 =?utf-8?B?Rkl1czc2VGF3QndQKzl5RE9DNUJUVml4V3hJRHdLeS9hWmQxTG5wdHJOc2g2?=
 =?utf-8?B?V1pKZkMycGYraENlWEVUemRrQjVHM3JtWUczdGRqU3VCdEFnbmlLMkJjVVdK?=
 =?utf-8?Q?1GaUFhRg4MAwPgc8fNxfZlsKA?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6598716-c0c4-479f-c7a2-08dc6c3c0fe3
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2024 13:14:00.1186
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T+cymmIPNQaUTjAAeGY7giHGdI+UShMOKcu96YfvdEpUl5E3Du0kUO7KnLBy/GG82X25bBpZf2YVHU7iNXWLEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8633

From: Peng Fan <peng.fan@nxp.com>

Use scope based of_node_put() cleanup to simplify code.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/pinctrl/spear/pinctrl-spear.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/pinctrl/spear/pinctrl-spear.c b/drivers/pinctrl/spear/pinctrl-spear.c
index b8caaa5a2d4e..a8c5fe973cd4 100644
--- a/drivers/pinctrl/spear/pinctrl-spear.c
+++ b/drivers/pinctrl/spear/pinctrl-spear.c
@@ -151,24 +151,19 @@ static int spear_pinctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
 					unsigned *num_maps)
 {
 	struct spear_pmx *pmx = pinctrl_dev_get_drvdata(pctldev);
-	struct device_node *np;
 	struct property *prop;
 	const char *function, *group;
 	int ret, index = 0, count = 0;
 
 	/* calculate number of maps required */
-	for_each_child_of_node(np_config, np) {
+	for_each_child_of_node_scoped(np_config, np) {
 		ret = of_property_read_string(np, "st,function", &function);
-		if (ret < 0) {
-			of_node_put(np);
+		if (ret < 0)
 			return ret;
-		}
 
 		ret = of_property_count_strings(np, "st,pins");
-		if (ret < 0) {
-			of_node_put(np);
+		if (ret < 0)
 			return ret;
-		}
 
 		count += ret;
 	}
@@ -182,7 +177,7 @@ static int spear_pinctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
 	if (!*map)
 		return -ENOMEM;
 
-	for_each_child_of_node(np_config, np) {
+	for_each_child_of_node_scoped(np_config, np) {
 		of_property_read_string(np, "st,function", &function);
 		of_property_for_each_string(np, "st,pins", prop, group) {
 			(*map)[index].type = PIN_MAP_TYPE_MUX_GROUP;

-- 
2.37.1


