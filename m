Return-Path: <linux-gpio+bounces-6103-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EDD28BBC2B
	for <lists+linux-gpio@lfdr.de>; Sat,  4 May 2024 15:17:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E94FC282725
	for <lists+linux-gpio@lfdr.de>; Sat,  4 May 2024 13:17:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EFF93B791;
	Sat,  4 May 2024 13:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Hujfgk6p"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2078.outbound.protection.outlook.com [40.107.22.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846A339FD0;
	Sat,  4 May 2024 13:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714828629; cv=fail; b=Ir+FP0J3lHtrNfUgSg/X0Za+uxixB4fBbB3uu/sAar+0eSvBNNanHxwYjD307dNTxa/g+mJXNwaIN4IjYXr5GKxvIkGpctVqmKHKiiGI6sWn3eySfycDgNjaRkz6YCN6WLBRPVKEzx81vYvJNjfCkSpevMhWTaxryfrR57sP7lU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714828629; c=relaxed/simple;
	bh=Hg4Xy0vEppWnC63RFatzWPhpn/VvXfklWFuoj2CIg+Y=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=l2zqKPPM0JfHttFrZ0g9BBrpevtssuA5qaOCOJoLyrTPt2iIg3FmI6R5s/oZMqT2vBInCN5S0zvF+oMtcybYT7F/S5xD5nUF4yWaEddkKXQcFDv9FPGWxKIgDu3t5R/eI3+sb56b028jeTtdmN5P7v4VrSLz75ZrmnImsBizTHw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Hujfgk6p; arc=fail smtp.client-ip=40.107.22.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UlggmPZvqE79ZaeW1gTAbA+cs1kIqi2SIyvOM1HB4159JF/+JtCxmfQiW0ivqdXP5CXkKje/nyrmWH/Yrn/GJo/ayUbcZ+X7nWP9o82PvscO9WYRE33rPFwr6REMQXZZgRmeuzGld47CW5hNOyINSpkGwwt41YY4W+dJkF2OBzO9Jru7wS7dw8RyU47sOrtdJeQefKEOH5Rf01ZmrXjRMuEfr+0BICN4NYt1LACPnQEuj41Jh4qqSfByzmuZ1dMuc1l7qwVm73K3m2oHRU+DAEs8Gi2JKGyam4WkrpLUqSqCD0bxtus6agOBE0cWUaxvdjW+UkG+HtJXUKZx3q8OyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OzFmWqqgAaHNbNJ4y5r21eHdO5OywXD/utfmPqrXP8Q=;
 b=TgVpot3hegYYv3qbkWnLZxHoF9Lz7u+bMV5C77TdeGnx3Ry6fBW9wp98fjl8BNVSkpfnxfSzk3ETv8W9t2zD/MuPKI01Ilsgqe23L7MPimZ4SNdsBCI/2UAeCuxN6ej1okwS8bXnqP1nsWbmIvxD1AAwBe9FFp/+vFE1GVbmZ7o0jAf+PHqp2by/jQp92NhEoS4xiFsH3W3i6UgEzOCXNB7Bx+Ti9HYrCmDvb++GAKFHiKLqPkGZY6rNJHrWf3p2+OGupUqsfQOQjc1jZs8Th7uhdyRGqBvFpKqcjOU4ReHTJRv2IQUjfDIG5+xEw4EY3//hA5atG4ZS1cixltpUMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OzFmWqqgAaHNbNJ4y5r21eHdO5OywXD/utfmPqrXP8Q=;
 b=Hujfgk6pBbJGD9Gn7U6zkbL3oeUYDzP9UMdHGvZL/K+xEh+dg1xpaQYo1lBHM8dRZTsMDLDcMg7aDlpeBuyBnsTkrCN9AI7lSKXvaG3RIin2lRLyV/vsqE6L59CW7E1hXxjdoMrKgn3ksp4JBgAQIzBAi4SZ3isnWO3ZQqIciJU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by AM9PR04MB8633.eurprd04.prod.outlook.com (2603:10a6:20b:43c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Sat, 4 May
 2024 13:17:04 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d30b:44e7:e78e:662d]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d30b:44e7:e78e:662d%4]) with mapi id 15.20.7544.036; Sat, 4 May 2024
 13:17:03 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Sat, 04 May 2024 21:20:15 +0800
Subject: [PATCH v2 17/20] pinctrl: pinconf-generic: Use scope based
 of_node_put() cleanups
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240504-pinctrl-cleanup-v2-17-26c5f2dc1181@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714828815; l=1107;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=2wM6S75hkeICu8KMVBGWw7nINzfNCEUbOtGveeJZglQ=;
 b=W5Ezlhd9RfExH8zWzuKwrmVUyRSF1AbQsCIMFKOLEKa6ZeJmr07/EaJgdP6wSTycJk1QVaR5H
 zbLbDF4FDjFBbtd58shfrCerWTDLaxNYTJIpazadXEO2mmS4+ShJxp+
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
X-MS-Office365-Filtering-Correlation-Id: 0c1176af-102a-4e3f-0f53-08dc6c3c7d6a
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|52116005|7416005|376005|1800799015|366007|38350700005|921011;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RGRpa3pES0VtTU9yOGtDQ2srRElob2g0VjNPbTZKWDh6dnIyOTNXQndDa081?=
 =?utf-8?B?ek4zcjFSMW5ndUVIcGNVMkZnUlo2OVBEcElHaFhCVTJvUXB0RysvNGZlMFAy?=
 =?utf-8?B?UUVvejI1SmRVakFnZTBVd2p0WTc3NnY2VFZRSmpnUHROc3BZOVRDZzVob0dD?=
 =?utf-8?B?dFBHMkVCblZyclVOSmsvRjJ0SmFKNVBPZzQ3RTRCbEFwWWE4ZU1RaE5CQ0lv?=
 =?utf-8?B?RVVRRlJOWjRxVHJDcStRVWxjZXlEVzBBMHhNZzc3ZU9pdk1XbmM0d2U2bXIx?=
 =?utf-8?B?eUpWa0FtQjFraXp4SEdoUndJUElzbmtHUXkzNHNlUVFxZVY1TnhNYVB0UzBh?=
 =?utf-8?B?MUZDNERaMk93RVQyVGdSUVEvdHA3aFVDU0pzOGgzbGFPQUU5WCtQMlBEd0c0?=
 =?utf-8?B?SUQybEluN0lVZFd4eG0wNzdSR2ZDQmFHNWtzSHRTd2graVMzYzNIZmN5SC9N?=
 =?utf-8?B?MnFvNDhpQ2UxbjBEM0poemhaS1AyVmFmLzlBTmpiZEFwbWNjSm1sOHAwWDFF?=
 =?utf-8?B?bm5ZM0paMXJvTXZKamZCQXZMbGthL3dFSUpaYlFYdi9qMzc0NnpFOGVteUEw?=
 =?utf-8?B?eC9FcGF4dTJkdVhZOU9SRW9jTFl2QzlJYXl2UDRGZ2FHZ3RmUHI4cks0ZXRv?=
 =?utf-8?B?ZHNPSUQxZUNsSE81ZFB2elRSMGdhL0ZFZys1dURIKzF3UVdRUUk4WW5FNDhq?=
 =?utf-8?B?T1haUG03cDRVTGRQUDd5bkVFR09MRkhXcE5BdUk5OTJmZ25VZVowQXBlRUxV?=
 =?utf-8?B?UTJJRzI3d1h6T29YaVdseWRRNnRoaGg1aUdEajdXRzZQYkVtUXRVVE90eGJY?=
 =?utf-8?B?VjhJODZOWnIxb0tNS09vZEtYcXBsaE54OW5FV012OCtBc2dBQ3VEZ3lGTHYz?=
 =?utf-8?B?eDI4RTlmMmR4UWZHN25TYUkzME12MXlHeERTeWtLZHQySDJRdVc1bEhxZHg2?=
 =?utf-8?B?VDNDWjRLVkF4bzdoMVhoeFBJaEVKNnJXa0N5K2NMZ2VSdU1xOFVJay9FQXF5?=
 =?utf-8?B?SlFnYTJiYnd1L3V0dVJhSnJ0MlRaSnRaVU0xVHduMG1vd0l3MGo1TitsZzBP?=
 =?utf-8?B?V25hNzRxT1ZuSkJMRzlDVTFvZmJDZlhtQy9EWi9LV1pzUWFCYXBuMUtPRFRi?=
 =?utf-8?B?M2trM0pKemFGWWNEQ0lSdXE3bVRBbEVXbFhieGpOOGVuQTF3OTFnTEVSelZL?=
 =?utf-8?B?SmlSemFobzRPSlkxSnUyRDZDejBERXJwM1NkekNZWFYzbDZIWFNid2lNQmJ6?=
 =?utf-8?B?RkhvU1ZWWkNJU0FCR2h2VDZGbldpRzhvbXpHMUEwY2RBRDRPazdhV3FJMWRG?=
 =?utf-8?B?VXhyWmlaNWtDNnl1UmpGd0JVWUxHSXR1TEJaenJNMHk5Ui9nRDVUbzRkQTNH?=
 =?utf-8?B?UjY0bFA1WThYSVg2SHRGQnRDd28wa2E4ekg1d2F5ZUpBNkFUS3VRNndEem1M?=
 =?utf-8?B?akxmUG5XZFpkN3pPZjkrREFmVys5WlJ3KzFMa1ZlTnJQNG1idWkxV24rSHo0?=
 =?utf-8?B?MkgrcTVZNTZZam5YN0I2VFBpSVBxOWEzVmFDMllPSDVRQk1jSVZOazd4VVIv?=
 =?utf-8?B?U3F3MGlmdnJPOEo4WGxJdGNlZ2dXbFRVb2hMdmZkelFWNlpqbTRxQVNlYmdi?=
 =?utf-8?B?L21OSjQ4YmJMQkJrUmVGSzE3VjhERE0zWmh1N2poODRlRG56TFUrMDhOM1Bw?=
 =?utf-8?B?QTkyM3BQQXlnN1g2UHRnSFV4Mm9kcnN6SXJGWFBNYVVNT3gwY1l4UlM4alVo?=
 =?utf-8?B?U2E5SEZoN1RGeFMrdkJDSkN3UWFUTE0wZC9ROXRVWGZQQUR3WStnZkl4QXNr?=
 =?utf-8?Q?UGekrTbvrNDIe8lMFMn0euljNvOtJCVLh9uYQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(52116005)(7416005)(376005)(1800799015)(366007)(38350700005)(921011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b2wwOVRvd3c3SWhzUThUUXo3eEI2M29oRzZyeHQvMEJXV0pGNmdWbyt2L1d2?=
 =?utf-8?B?WFpvWURFblphanhTS0czNUVqL0hLelpNNXBDbnBjd3hDOG85NEdCNS8wbmJJ?=
 =?utf-8?B?d1VOTkF0emM5dy9RYTRsdFJvWEVONGlnY1pabkFhNUZrMno3dWt2ZVRiNlRm?=
 =?utf-8?B?R3NieDg3clQzRjFpTWNOaWhmYkFEZHBYQkJnbStSWGRmbHhjelVOaGlJTGcw?=
 =?utf-8?B?S09TcGVGcG5RMTFidktNcnErTG5CRmpYRStvY08wYlJNczJaSnZ0KzUxT1J3?=
 =?utf-8?B?RmxoS2dDSGVIWXZqMzNqSVJuRFVDUTEyR1pOUDNhWnRoMlFOVlNiNkdRakRm?=
 =?utf-8?B?MGlicmhvWEhINXcxMXlpMEdNeEFwNmY2RE82cndvZVBzNVNjOHc3QnF3b1JS?=
 =?utf-8?B?R3MzT1EzcnBUSW0yamxKUG1PWlBCeHcreEZnWHQzdEZvaGNaV0hmbjRCN1c2?=
 =?utf-8?B?TFVYQkx4M0lTek1IeW1QYWU4akUxWTRGWHpwUi9zSE84L0R5b0RsQVloejE5?=
 =?utf-8?B?WE5oU2d5Q1c4cFIwK3pCNC96UGgrR0szNUJJK25FRU1rMGVDY1JJdUlWZldv?=
 =?utf-8?B?TnB6Y3VGcjRwVHJ4Q3ZHRWNSZmJ6d0FXekpNZ3BqODMxS1Y3U2sydTZ2eVdp?=
 =?utf-8?B?a2VFNUpJbG82ajE2WnhNbmN1cnhTZkVrenZZN3BFTW9mOEtJSHluNkxYU1lN?=
 =?utf-8?B?YnVTZzdSbWtma21QWGVBeWs4NGJCVEdjMHltRTlwVllRVGNXcTU5ell0Uk1Q?=
 =?utf-8?B?dUFWVFJJRU9TQUkwWi8rZURybTc0UGJhNUYrRmFiNCtPOVgyU1NjM2ZkQlhJ?=
 =?utf-8?B?WnhrQm5iUmtEMUl2eHI5MEZlUHFOS2lacWtaY1JxTGpPbFFyWWZlOERlMjd6?=
 =?utf-8?B?Q0t2ZlpqMXhtTlhSUW52d2o5S0t6MDFMUW42eEN6aUJHYVI4dzE2cGxRMzFZ?=
 =?utf-8?B?NFVXMXdOUUdvdFJTRnUrSEtNdUxnZUZia0hnQXRlUGZlT3BYM25HZUZpWEVr?=
 =?utf-8?B?bmZ3UTBTano1VEtIZ3VxazRlSTlhbWcycWFTa2hwTXhUdWVab2JlVERHZUhP?=
 =?utf-8?B?OWtNT1FQMkdKbFAvZkovVnF0aDhMaFFiWFpVV255Y1Y2d091M0J0VzNXRGhn?=
 =?utf-8?B?U1FIU05HNnFueWt1K2NxNmYxVkV6QWF4WUVtZDlZbHJvVE43V05uNDZPVEdF?=
 =?utf-8?B?VHpzbWRZVmdhaGthUnBxZDdxYTZhdlVWcksvZVFhdEJyeFZCQWZrejU2dU5q?=
 =?utf-8?B?MlJGaWQ0UEVSTVdzRzltWDM2bXJkK2doYWlvZkNvUWJ5N2d3MWJ4N2tvYmVT?=
 =?utf-8?B?NFNreHhyL1YrcUJpVy80NGRrTUNxSy90anJYUG9sUDBud0tTbWdzRHZGYnVp?=
 =?utf-8?B?WWE3c0wxaHIxOGR1dkpRK2J6N2FiWU9Ldys2bFEzMVh6TS9uTXhsQzJEbjVm?=
 =?utf-8?B?NlJ5V2VWZCtlbFQwOSs2TldtOHFuMTRRSHhSTTl1ZTdWbVdoanJXSTFpMnlI?=
 =?utf-8?B?Qk1KYnFMNXdJbWJYMWgvRGN3azBvc0pvUmsyZ2lFSDBpMlp0N0Y2Y0JnU0dr?=
 =?utf-8?B?V0VMaTh4Y1F3V1lQRlUwU1hHMldGVUt4ZDU0V2UrcDRqN2wweVF0VkRienV3?=
 =?utf-8?B?N3FJNmY2T0o3eGR6Ui9iNDB6cW9HdC9vT2NoWlVQOGhLVTlzZFZybmpTUGEv?=
 =?utf-8?B?VlVJK05vMks4bkVQMURHdUVpaGlvK21NWkJqNFVIaEt4Z2NpTzZmQ1ZSTHBI?=
 =?utf-8?B?b09BcnQwTGkxSXlLY3ZWUVRuN2orRFplVXc3N3V0aFVGNGo0eS9LYjhLbmZ6?=
 =?utf-8?B?VFFGZTRhUEVqZi9SMlE5ano1VUN2K3krWmpUa0ozSXRaaTgzYWxDTkhnV0wx?=
 =?utf-8?B?eXV6RGFkRHlqelpGSFIra0tFREcvaW9sY3hKd3pJMlZIZ2JOR1FjQkRSa1JG?=
 =?utf-8?B?WWovOURZSk51TThua0hBcFQwcWxSNWEwVFlHZkpCSmtyU0diQkxoV2ZadUdQ?=
 =?utf-8?B?cnBFRHJoRGpmb2hvbmllMkdZemRLamEvdjI4c0VZTER2U1I2clZQRUd5cGF1?=
 =?utf-8?B?cm1QNWRCTkR1eXowZTZJQ0pmOGREbm11UmUvQ2xGMG5kVjk2RGJiR1NTb1JS?=
 =?utf-8?Q?kpc0BrcBPbGpYrGqyMcFmCYKd?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c1176af-102a-4e3f-0f53-08dc6c3c7d6a
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2024 13:17:03.8642
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QEgJUaP4zRnl3xuiECIIdwnDgtv8meyTZQoA+0gbgaDOSP2A4ZANHr3rQdpLv48ANaBT0NARX4dl/yrvw7Rd4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8633

From: Peng Fan <peng.fan@nxp.com>

Use scope based of_node_put() cleanup to simplify code.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/pinctrl/pinconf-generic.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/pinconf-generic.c b/drivers/pinctrl/pinconf-generic.c
index 80de389199bd..a499b8af5c1f 100644
--- a/drivers/pinctrl/pinconf-generic.c
+++ b/drivers/pinctrl/pinconf-generic.c
@@ -382,7 +382,6 @@ int pinconf_generic_dt_node_to_map(struct pinctrl_dev *pctldev,
 		unsigned int *num_maps, enum pinctrl_map_type type)
 {
 	unsigned int reserved_maps;
-	struct device_node *np;
 	int ret;
 
 	reserved_maps = 0;
@@ -394,13 +393,11 @@ int pinconf_generic_dt_node_to_map(struct pinctrl_dev *pctldev,
 	if (ret < 0)
 		goto exit;
 
-	for_each_available_child_of_node(np_config, np) {
+	for_each_available_child_of_node_scoped(np_config, np) {
 		ret = pinconf_generic_dt_subnode_to_map(pctldev, np, map,
 					&reserved_maps, num_maps, type);
-		if (ret < 0) {
-			of_node_put(np);
+		if (ret < 0)
 			goto exit;
-		}
 	}
 	return 0;
 

-- 
2.37.1


