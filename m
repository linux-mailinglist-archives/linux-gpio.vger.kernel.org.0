Return-Path: <linux-gpio+bounces-6104-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4B18BBC30
	for <lists+linux-gpio@lfdr.de>; Sat,  4 May 2024 15:17:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C7131C21157
	for <lists+linux-gpio@lfdr.de>; Sat,  4 May 2024 13:17:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D95822EE9;
	Sat,  4 May 2024 13:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="jqHBIut/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2051.outbound.protection.outlook.com [40.107.22.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 780BB347A2;
	Sat,  4 May 2024 13:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714828645; cv=fail; b=JqmKQOv58B4QNnn62xP3gFDKNLnGgfLPYS4Bp7YPPItZ7lVG1mxDV8e9N2mdQeD4IeykFxkmlvV4ZhbY3ABAsYxSt7n1dagC86gMJkHe8m08BhtEdHmd8PTAcRjqhRXoN506ed3TM5tT9ul7Cl8CebzoWFgdZFLMQkKxJd9FtMg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714828645; c=relaxed/simple;
	bh=VIt+S9lqc+k4TIsuVnBU6FhhXcdzzv/izY3n11KkU7c=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=pd58cPwY/oGQe9je8VcGC4xejWvuNNXV/AKnph0B1QYgjkc6lYawbkmacH4VDctzcmgu77wNB940BtHN4IcCutNQS5dQSr+Z4wwU0UY3UD/qkcIpCeEk1BYchJTU8iRf5wvAjxbDCoWpz5eBWyj5yZTdW4I+Z6TeTZ3XhKAjB0Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=jqHBIut/; arc=fail smtp.client-ip=40.107.22.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uit+z74daa9mOsT6ePUJ2VMAVskH21u3nzQSgbWmY66uHTJ/hJPh1jE2HKUZb6uVYEyh9QWswo0MpHO5IRoT3gaPUQ8ozqL+Zol0j8WJTB/1Bg9/eMtv3pEgYzA6jo96MlfZ6HRJ87eGzlxhc2oetuS3TMwOhqbF/52fIV9eHEewG4Rz/IO5TFnv8WDYQma1FaukRc7KZGSJD8jiuIt/olxWiHkrxwJidc6F6x/q7x+uqxpYfLP9BVTIK7jNmlsbWAdJ98bwwxslgbyXMhrZhGwr+AfrVapxsgbV3SzIiguWOuoxbpsm03n1hioZxn1LE/JYKOI8rYqMJ0PxPefLBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b/qD4YQU9UBX2QLemhdFC0vYRw50NOR9F8fnfRi2ujg=;
 b=OSk6CPQoV8WoO69chXXc/btdybtOIRVLJPiTTfEB5l1MdnqEtN958wiXrp9lYGxp9hIJpgEIkQqLpT0OmxHgBKme/YUWV7INO6IHFnNXbjPyMae0RDCRa/oTYCmWuj4Zf8oTzVeEPND8FPz7b0fUw+KzjMhbgES8lmowZv5ACW/WQuxDyS+LRkDiqyhLFbZZY7e45IvTmYRjZy6Qmxb8K2F1f3Ycapp56u4pSIujKebpsUkM9I5lNGnXlfQ96BOn7wba1CmZdyXzyZyiloWMV9OqB5IMsW31w6WPQ6K/ibTBWbm1PZVqk3VEaddsQbo6T9ynEZnv8miZ66x/pzQwZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b/qD4YQU9UBX2QLemhdFC0vYRw50NOR9F8fnfRi2ujg=;
 b=jqHBIut/ZxbfJT53SP+F1q1/5XOg6UM2ONcAdAT67c+od0NBJAE39H3VHJG1SWx0ywtzj32TlW1Fd/AIhsGyWwULIsjQ0WpPgHOiFzXGz41QPlJDF47l7uhM5BRFfOR60nmc3R4N2OZlOD9/XhRjUIgsj2lBom2qTdNGz8hJ7zQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by AM9PR04MB8633.eurprd04.prod.outlook.com (2603:10a6:20b:43c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Sat, 4 May
 2024 13:17:20 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d30b:44e7:e78e:662d]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d30b:44e7:e78e:662d%4]) with mapi id 15.20.7544.036; Sat, 4 May 2024
 13:17:20 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Sat, 04 May 2024 21:20:16 +0800
Subject: [PATCH v2 18/20] pinctrl: freescale: mxs: Fix refcount of child
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240504-pinctrl-cleanup-v2-18-26c5f2dc1181@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714828815; l=1008;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=n5zUltymbb2QT8OVUi0ykdiDnyL/KXFAnvLfuklG8sk=;
 b=VlM2s8MWPklorkSZy9NCPoYCC+X1qhpT9U8O+RJ4UAzCFrQN9FgW0mVCVJh3cOF27q65t8QZ6
 Ls7HHept/5WDey6gNVcw0jH5LWh2wGBBfxXZKtcPS/ES2kVoImJ3XLa
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
X-MS-Office365-Filtering-Correlation-Id: 4a333ccc-4d63-4645-7e99-08dc6c3c875d
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|52116005|7416005|376005|1800799015|366007|38350700005|921011;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c3pvWFRSTm94VGN1REFOTC9hdnZqbGxyUHVjVDJzNHViMDZ0b1dpeGlMak4r?=
 =?utf-8?B?MmI0NEtYYk9sVzNOeit1OHpIYlpNZzlzV0RLRU9mQ1UwWktNZjBNMkpwVFky?=
 =?utf-8?B?cVhlOVBGTU5JUzRWS0MvSlFtd2g2ZkV4R3lpNjFmd1grdFpJU24rVmJ6b0M0?=
 =?utf-8?B?MlpqVW5SczloL25POWFTLzhvMWo3UEdGZGcwbjRTdFlHVDZHaWNoZVpnNTMz?=
 =?utf-8?B?anA3VVFRWWp6d25wY2FXOEpNZElSb29EdDhsNlVqYjlWTnkyWCtleVFmb1BZ?=
 =?utf-8?B?azlIN3RtVTFqa2xqNStpRlgyMVY2S1F3dGlkdkFiUy9WUHgrV1lWUFVLL1V4?=
 =?utf-8?B?NmdNRHd6ZVRKc1krUVBSd3R2K1hQMGJCOXBLc1d6QTR2NlBrNXNPUW90Zm4v?=
 =?utf-8?B?RkpKMGFQbHVWcDlDWlNMTy9PdTJwSnJaZkIxRm9adEVabkRSRXl5MzZyRmh6?=
 =?utf-8?B?ZWZISjJKUElUcFUvbk9QMkVmSlNpeWFoL21JU2dCeWhIZHNLRTJ6bnlVNVRz?=
 =?utf-8?B?NE0rTHo5aGZYdnJ6eDNzSHNZR3A5NlVtMHVGMnJYaUYrdE1TWFhMSnIzZW9S?=
 =?utf-8?B?ZVphay9kNm1JV3luMHduN0c0aHd6ZXlmbHdUWHp0em5VekhYejlFSnl5V0hC?=
 =?utf-8?B?d25GOElTVVYxdk9KdFp0UllqTER5ZVRtWnZpV2VXYThoRzNBeGpPVFZ4Y3pv?=
 =?utf-8?B?dXdCaUEvQm1kNU1KS1dZRlVZd1pJa3crc21MK0NXZWZwQjEwZ0daQkhuMTR3?=
 =?utf-8?B?VGU4c1duMXIwZ2lSUHdlKzBNNUt0R1ZIYS9lNWlsL3RNVC9INnZGRWJScXV1?=
 =?utf-8?B?K3BzcFc3Y1FBY3JCdEdaWDM0ZWNoVTJzR0ZhWkFGMmpGQmU5bVhMVXAwZk85?=
 =?utf-8?B?RTlzajh2cDR1eDQzd3FPVXVSbXgrRTdkSGpFZ1BIZVdISUd0VDZ0MmVuOGpG?=
 =?utf-8?B?aUozVklrNW9BdHlCTHRyblBkckpINFdzYmV4T3ZsbXpZWUNZTFNFa3JtZlBm?=
 =?utf-8?B?RWp0TXM4Tmd5OXNQMTFlZzMranpKZkg0azkrMmVaTHZDTjJFUHFheEJmRjA0?=
 =?utf-8?B?MmZPZTA3ODZJYkRYSkNWZTJpNGxDcVdrTTdwd3NxRklXTnZVWVRobVlad2k0?=
 =?utf-8?B?d0tqQjBmQ3FwdEtzeG5zMjE1b3J0UXpnc1dsb3BMMFZuQmVnUFFlYUlvbDF4?=
 =?utf-8?B?ZDFqSkwxb1dhc1pMcWZ1RFVYL1U3bUxHNXBGeTF6TG1WTm1IR1NWOHpnRFlj?=
 =?utf-8?B?Rm9CSlcyenB2a2I0Z0d5Wk5xWlRKZFdTc2twbExaZXJKeHE5dHdlcEZEL2dF?=
 =?utf-8?B?ZmFmelRjczlHemZra0ZYanMrVE9VNkk1dVBmSnJYVndodGNpNkl4Mk00TG1U?=
 =?utf-8?B?bm1UUjdZcGw0OTNmWWFHekh4VGM1WWF3dFliYTFCNlhtQlEyRHpjUjRFUWJF?=
 =?utf-8?B?MituM0FrZUZtaU9xdmIzSXZ0TmF2WmpMc1JXTDZlUE1VOWdheDMrSXFSV1BY?=
 =?utf-8?B?Z2p6SGo2dFppWnRNRmRha0JCZHFBTkN0dkNvaHBFdkJ6b25HUnE0VjlmTkpr?=
 =?utf-8?B?Ykd1bEsyeXZiRE5Zd0ZtVERtQUsyaDJzYzRjR1lxejNJSHhOOGVSMm1KWmZ0?=
 =?utf-8?B?aVFrNk1HcFZhaEM0NDlML0owWDQ4YlMwVlQweU9JVHRNNTdYMGxoSW00VUpa?=
 =?utf-8?B?OGhGQXdHRDlidERObkdmZTJNTk1CNDlWQ2pvdEhNWWtJRXcyakZGR09UaFcz?=
 =?utf-8?B?QTJwYVVlRzlSUXFKSUE3bEU1RjUyNXRCZVVkZm4vTnBJV2laS3Y0UDh1ODlh?=
 =?utf-8?Q?1qenO5INjoactfyJKvsSx1utsUO2mruGz39w8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(52116005)(7416005)(376005)(1800799015)(366007)(38350700005)(921011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WlVZODB4bG1qNm9zQ0d4eXVxOVJhLzZoeFpGWGNjdVd4b09na2JKOGtTZkV4?=
 =?utf-8?B?Z09xS1VIZnZud0hYVmdnQ3Y0Zmdsb0UvUEE4MnZqSDgrUXdzenNlTmljSEpU?=
 =?utf-8?B?dGR2bUdtSnkyZFJDY1dqT1NhT25peUhYaGhncUVoTThXaE1rWjdIOURjTzh1?=
 =?utf-8?B?eDEzZmFXbWl3ak5Zb0RPaEhYaTJhS2lEL29yc08rcXZoWmQ0ZStNTkp3ek5t?=
 =?utf-8?B?dms2VkdTWWdSbk5RN3d3Z2FDTGZSREpZZTFoaXFGYWF1S0xKa3h1UnVCYnRM?=
 =?utf-8?B?MHlUMjVIWkFsbEQrelQwWmlqQk13TzZoOHp5cmVJQVgvS3BPNkZQK0FrSTMy?=
 =?utf-8?B?bG8wSDV3U0VxNDZ1WnZnS0J3REt3R1ZPV1VzVHZsUFlyNVk5VVJvVmJMODZu?=
 =?utf-8?B?a210M1pBOVJyVGovd2dzVGJ2RVJIampHMU8vaTZZcTN4bVlDSllFS2FRbzVD?=
 =?utf-8?B?dGtSb0lmUEYvTjFYSFo1bDRBZExXY2ZXbUZuNmlMUllOdHVjbjFNS0hpMzhu?=
 =?utf-8?B?ZTA4bFV0bXpmWGRFQS9wam1ieWhrOUtjNFRrYWFlQnNZTlFsellrZUduOUhO?=
 =?utf-8?B?RVNmZjF5bE1zOGs4S0JvWmZOd2t5L1h4UzlpM2NtNEVLV3YxVG5NVGJ2YTRr?=
 =?utf-8?B?MHM1cS9tZWpVN1d1R200ZFdqNTFhWnFpOFEwSkNsQ05UK3FwNFJObXhDcHgz?=
 =?utf-8?B?VXoxNVdudnVoWHJJSk43VGsrY1NRbHZtVC9lT3BqOVRLVUF6Z0lzZ2JxSWlH?=
 =?utf-8?B?dWZCSlduZlFVeWc1bzdZL2JpN0NQZHlzaDFyQVh2ZzNCWUo3NHdNTXk3SmR6?=
 =?utf-8?B?OVhhTHVxd2pPU3BBZDZ5dE0vZHFpZUU5S0lUWDFkQUlZNGc3THJ4bHQ0NC80?=
 =?utf-8?B?OFBKYnkxUFlCczh1dmErWmxxMnNndVNLdHg0ekNHSm0wNXhNbGZ2aGxaSHo0?=
 =?utf-8?B?cnkwN1FRTXE2cFhLQXVrQkVlWDZuMVFTQ2l6aHdacFA0QVFaRzlITHBoWFJ2?=
 =?utf-8?B?VENwSWMyNVNSOEk1YW9hUE10b2NFODJPN3R4VmdzeEdXZFNiOVdlb1p5d0VG?=
 =?utf-8?B?c1RJL1BmR0djZmRUZWkwTWRnNWdiR3NYdGRGa2hlVFdrWGlxZjlma2VuRkMv?=
 =?utf-8?B?SnNINk9zdGliTkdmQUFES2VmT1pFL1g1S0xyeHZRZUlpTTlQY2x5dkpnZ1pj?=
 =?utf-8?B?Qnl0TnJPb3hibVJrT1p0cEN3dUR5RDFudmZUcTZpdHNmVStCVXN6RGVFRFFt?=
 =?utf-8?B?ek5HeEU4bnlUU0N0OE42VTh0c0F6QitVR1FBQVdLUEhIWHRPa1hDaklRRkFy?=
 =?utf-8?B?cXpwRGFIWlExQ2pIYk9PdWFvazQ1d2drMS8vamUxbjhVQWRyMmVDeVdFZG5V?=
 =?utf-8?B?WHhLNUl0cXJxNkMyRUM2eHU3bDlWR0JFb0piVEQxeW9VTDNXQk5DRzdFZ0ZN?=
 =?utf-8?B?cmEyYnZ2VXEzUHBlY0xDaVo4Q0FMakJVYVNDcm5jOWxCVSsvTTlxOGtQMGtJ?=
 =?utf-8?B?U1JvUDFzeVFsenlyMkZ0cndwNkxzVDFCUitYeVNHQ1gyeTlxMkhVMGxleVph?=
 =?utf-8?B?eWcxSFloYnRoeksvd3BKY1lpaEZkMlFYaytoVTNTRUNnRXU3UDZpWDUzY3B2?=
 =?utf-8?B?U3QzYjdLSHIrY1lRTWM1bENDNDNrajFYT21TYzVzeExuQUtQZU5yVVhSOTh2?=
 =?utf-8?B?TlJSTWJjTzd6K0dVZ3NZMTd4cnFZM25QR1JqNlBYMXAvRnlGRnZOUGFGNjBt?=
 =?utf-8?B?Si8vMVZvaHRMRGgvd3pzRC9raGh3c3NoQUxLWWR4RG04U2ZKY1F4N1ZUOUg0?=
 =?utf-8?B?b3RLTnpRb2FtbjdsMTNiTWw2YituVTVRN3pGZm5YMGxnWnZZVFRvc0NMUzBY?=
 =?utf-8?B?dmhsTzhGVnFIUWhBakltY2lsbEJzNlRELzFDSDQwZ3k1UXRLY2h2VXZpZFFR?=
 =?utf-8?B?a2MwNXdJbDllaEhVM0o0YXU1N2NqZVNRcmZFY1BzNFVUWkZMMlltaGxYK1lS?=
 =?utf-8?B?c0dCV2VLY0ZJc09DVXkybGhhNkVaaXJkVjVtL09jYnFXdDBFOGNicnlhelB2?=
 =?utf-8?B?bW5CRDBBMGlkdmJjMVlRMUhiNDdKSUt6RXJOMVZ1M0RpQ3U4VTZlNE05WDcr?=
 =?utf-8?Q?4e6Ap0jTJmqhLemodOOEYN6aM?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a333ccc-4d63-4645-7e99-08dc6c3c875d
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2024 13:17:20.5544
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eS0Hqw20bfQUZBCxvAY/jHXjr5fiJodXMP/iYb+b2NEaYZD9Se67ioovz8+ccXYKulvQ7D65SmO1VsXjEHyfdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8633

From: Peng Fan <peng.fan@nxp.com>

of_get_next_child() will increase refcount of the returned node, need
use of_node_put() on it when done.

Per current implementation, 'child' will be override by
for_each_child_of_node(np, child), so use of_get_child_count to avoid
refcount leakage.

Fixes: 17723111e64f ("pinctrl: add pinctrl-mxs support")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/pinctrl/freescale/pinctrl-mxs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-mxs.c b/drivers/pinctrl/freescale/pinctrl-mxs.c
index aee70fa55bec..edb242d30609 100644
--- a/drivers/pinctrl/freescale/pinctrl-mxs.c
+++ b/drivers/pinctrl/freescale/pinctrl-mxs.c
@@ -413,8 +413,8 @@ static int mxs_pinctrl_probe_dt(struct platform_device *pdev,
 	int ret;
 	u32 val;
 
-	child = of_get_next_child(np, NULL);
-	if (!child) {
+	val = of_get_child_count(np);
+	if (val == 0) {
 		dev_err(&pdev->dev, "no group is defined\n");
 		return -ENOENT;
 	}

-- 
2.37.1


