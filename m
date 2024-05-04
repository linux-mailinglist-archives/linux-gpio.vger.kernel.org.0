Return-Path: <linux-gpio+bounces-6102-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCCEB8BBC25
	for <lists+linux-gpio@lfdr.de>; Sat,  4 May 2024 15:17:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 93C53282EF7
	for <lists+linux-gpio@lfdr.de>; Sat,  4 May 2024 13:17:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 705E43AC0C;
	Sat,  4 May 2024 13:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="hkF9lq/j"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2062.outbound.protection.outlook.com [40.107.22.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 683B13C08A;
	Sat,  4 May 2024 13:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714828612; cv=fail; b=PXToDImcbk8MwRhoWBoX7fM9CCtB5gRd5A8LBdiTMzR9Ee+tRqo1ZC4oyzdfKeu2+8A3HdkjkHY2nzksJcesVQoUehpBIYT+6OgEmqctl+DQirS7usoMJNDITjjcYfR6e7DKSffvSNDwMWe2LQfIzAgM0Gs8s8/lIda5hPkEQ4M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714828612; c=relaxed/simple;
	bh=o6F5l9CsoiURStmJJEE9Qa953QXfjAQBUVSJDbNbaG0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=geURmRg8XFBO0EVXnNcrsKT5y4MR5R7DmKkoLIWttzEg9NU9JLE2eXO39gNtl5/dYg2e0Lt6aqs6ryzrmU0cQLODMCtVB3+IBPVXo6qKdRkwAJ5EuJNunqHxpelp+6SymvINNhc1Z+Q0V6Ed1+Z4OjwuLMuE+oNwx1nSjemp4fQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=hkF9lq/j; arc=fail smtp.client-ip=40.107.22.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Iq0+wWzoQ8QOjJwjhT3U65H2p8s/t/dew5fgj3ZBpZzUk94yZ5xiSQTXDrbvtCsvKitephcf/XzfQs2ZViYgQN5gfd6ViC1nVLrEVKjEmQtDI4l/MsJXIB9Nbl11lNRyFIUpXHNqe9487vJW2J0u2NthW+NgwEvEoDOzbc1p/zC/rNwQTER8ZCEnPsOhweUwo1Z3BsPvJYle71vu8RTC4FvzBKeeKBmkimz6ADvmiRhfBlwz6HKqi5qgB6kSQ00sLNpMBiuILfp4na8qWwd8okkSij5ege9oLWCgBwWWZ/mME405ItQu9locoPpASh1+tFLf8mTXySgGLz31lgnu0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b8YW68N9lyxeJ9/mVk16q9wzxsh3g7k9BYoR+TfhQy0=;
 b=UE4qcH8Qe+cAnvJzlJYA4nduogUPkrcB6BJOqMOhNnPn8IiDdbCGoFpdL4StqFnNlceH/+46kN2heoV8Vq8jSzfqVwyLVn8w8uLkokRQbDw5ny+DnsqRNsXWE/5oG93KFp0cxGHLmXyTz7jQsI39SL1i21jFaSrstmClmLbCn1LOH17wXCa18NxKP5h8/5EQNSax2tXAEda3a5T/G/Kh6h0hC6qMrJ8I6Va0KrnV6MdQLiIl+CqLLuJf8YGyrg1b1QKAcDuVcD0m13hywuqt9PIJ141rjv2TbAl4BdEMo/W9C1KzPRsnlAwdGNZLXQkgsy5U9DBnPZpzPCakUyiaIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b8YW68N9lyxeJ9/mVk16q9wzxsh3g7k9BYoR+TfhQy0=;
 b=hkF9lq/jMcSmd1vDCP4Xw1FUFal2vtMiBcdMIM9IGtY/RbMqABtrwAJ/XD3hbLK8tTye+IspbuC5y1BpSRyaRYHzAlK6rsUAqHloELbRn+VX1eNkANyQqyLBPRR0toDsqQl3oXPWoUwPEZdh+ye/fqC2fSv8iNNIsw0PwMz2xQU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by AM9PR04MB8633.eurprd04.prod.outlook.com (2603:10a6:20b:43c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Sat, 4 May
 2024 13:16:47 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d30b:44e7:e78e:662d]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d30b:44e7:e78e:662d%4]) with mapi id 15.20.7544.036; Sat, 4 May 2024
 13:16:47 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Sat, 04 May 2024 21:20:14 +0800
Subject: [PATCH v2 16/20] pinctrl: bcm: bcm63xx: Use scope based
 of_node_put() cleanups
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240504-pinctrl-cleanup-v2-16-26c5f2dc1181@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714828815; l=1176;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=ngb8bjYWoY2vP8GroJ6WPcYXu1rPDt13jwjXmDP0P84=;
 b=DCvLS+tJSjIJOYzv5GBcRPWdyszwIStRArI44CNxG71LlT4DW0wLaiJVWa3krSYbnAQteIYKQ
 axMlCLkIflgBmSjBIiiZAA++axwuvzMqZXOU/It10tJ/dOb4zf/rLxO
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
X-MS-Office365-Filtering-Correlation-Id: 039ec075-bd8d-4c85-d9a6-08dc6c3c7377
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|52116005|7416005|376005|1800799015|366007|38350700005|921011;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?LzduUWVNSlU1RG1jTWZIRVhQT0R0QlJYbUVIYnZWcVB5M2NVUDMrNDRZODQv?=
 =?utf-8?B?NG5RTDV0ZEkyWlVnSzdiR2pJazBNaVJoZU56bkpyUkRFaklUZ0YvTG1uNHdi?=
 =?utf-8?B?Rk1kV0JSUWhBMjJlejRTSDRodTBhbS84VEVVbHdNamMwN3ZXVUFPcnFiRzdM?=
 =?utf-8?B?cUt0OGtkYTRhR3VwbUJNdjFaT3IzTXZqZkhwdEFLUkQxREhzVmNwUHc4RktV?=
 =?utf-8?B?bWZRanAzTzVQMU1TeWlMZnVwSk1FYnhjU2VYN1I1ZHoxdzV5OE9veE0wcjFa?=
 =?utf-8?B?cEJxNTlkaHp3S0w5NGpCODhqWS9ESVdSYWhvMzlnV0J3c3VTNHhkUnZQL2Ix?=
 =?utf-8?B?T3IzUkRSaVo2UUN6bFNhNXJqa2ZudDRCampJWjFRU0JTWVp1dmtjYTE4UE8x?=
 =?utf-8?B?TGEyMG5YQmt3NEk3aTNpKzR5TTN4bmRDbGNDb1J6bUVTaHI1dHVDRStIUDV0?=
 =?utf-8?B?RE5FeFhiSkVFYWEvQWw2Rng2Nm5UR1ZyaVNrd3V6TDhWb0x5RFpvVkcxQ2x0?=
 =?utf-8?B?WmlkRkZnOVNVZ2NBWWxxa21pRnVtNGprTnFuZHF5djkzS2F0VXZrSWVUTFNC?=
 =?utf-8?B?NWlFOGFObDZIMHRINXVkRHpQYno2T2Q4YU9yZ0Rxb1ltM0kxdWFyc2psdWZQ?=
 =?utf-8?B?eGUzYWdHV2MyWlZpbExiZE5qeFFIRkJSM3k1KzdjaVZkOVFTdnJTdDdoM2ly?=
 =?utf-8?B?NDFMTnhROTV1YnhxUXJEUU4yWjM1TEZ3UE9tVFNKdXIwU1NSTGNRd1ZsNlJP?=
 =?utf-8?B?SHFWV2pVNGlvNGQySGt1WWNMRU9zdVN1STkwVWZwcHhlMjVjYVZrQzVGVjdL?=
 =?utf-8?B?VnVmdWxuN3ByUW5nS1lyK2dyWm9LaXlRNTFDSDRnSDk0dmlmdkZTNys2N3dx?=
 =?utf-8?B?YWVZQ0JhYVdLYm12SnlTdlhjNmNRcFk1M1RkZitPUU1NVWZjV1A0bEZwWTZQ?=
 =?utf-8?B?RFBHbHFCRnZMZGFieGlPd1ExeTRoK0JWNld3RDJ3c0xUMGZXVitVMW1uOTg3?=
 =?utf-8?B?NnhUQnZWeHg1TTJibzFVcDE3aFRoU0NEc3d1enJiM2Z4WFZMU1lsRkVHM0NH?=
 =?utf-8?B?RVFsbCtLNmFNT3JqcjlZUGFOS0pualdEY3d2N3BrVGtaTERRY1pMRlVWem9Z?=
 =?utf-8?B?UjVZenlMbkRKN1F5Rm5vV0FaSHNabGJnRDUwOGZKWGVpU1NrMzErb2VqelN1?=
 =?utf-8?B?RUFSYWU5cnM1NG9EU3hVdjBiYVMrelMyNUc1UzIwUU5CN0JPTEhuc1p5Q0I1?=
 =?utf-8?B?NFFaTnZwaDNsRkUrRVVGcHkwQk5qNS9SQmh4ZmdVVWM4cmxGZis0dVpBems0?=
 =?utf-8?B?TzdsUjR3Y0lVVjZYQjVPVUZ6L09PUHp1YWlJZVNsVDBueE5NL2E0USt5YWJL?=
 =?utf-8?B?QzdTLzZQWFRZRVZyaXd6SHN0NlluNXduV0RPNlZqcmtHU3o3dFFOU2hCcDZV?=
 =?utf-8?B?bHZDNm1vc09NYmVSMHB6K1RITGV2Y3V0OURSdUdJaHpKZEJvZk0vbHRPNGVv?=
 =?utf-8?B?VHI0dEhNaiswZUNoQ3ZKckpBNDE3cmY4Smtra0cxdDdkcjI1bytHL1pJUWFH?=
 =?utf-8?B?WnZEYzdzbUNXVnEvSzloYUNGNDNudU56QTE1UEI0MDdQS0ZGUlJrRE9MblhD?=
 =?utf-8?B?TVJnRHovSFNHZnRJK3djdTU4NWREMzRaTWlScDdBdFpNQyttRFpsUGRTQ29s?=
 =?utf-8?B?Y0ovNHNHOUJYTFBjdlVYelFzS3dVSkN3a08wOFlhVGdmSTVPNjh6OEtqcG9F?=
 =?utf-8?B?R2kxVXRJaStPWGpQQ3pncVhKaGs2UnNTTXB2dVFDb3dZVW5rdHNmR0M2cGFW?=
 =?utf-8?B?d3dZaG1INGhTMTdpaHN5Zz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(52116005)(7416005)(376005)(1800799015)(366007)(38350700005)(921011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cEdxTlNOZE9IQ09XNDRkeTRFLzhLeXdxTnNtVmVSdkEzVGNZTnhLM1RZTWxL?=
 =?utf-8?B?ZTZadC9IUmtLdndtR0FqaG9lQ0pybDF5WDljY0xnUzF4MEVvVFIrRDd1TGtL?=
 =?utf-8?B?OFNOdEJnZllNVGFWNUlBRTVDbWtMUlhiYzB0WHFKZ01Lc3B3Nk9VRStNWkRF?=
 =?utf-8?B?eDZIblphSXQyaDhxN3o0U0RmZzVnN044UHIxWExFSTFPTnVibVpqZS9qeUhZ?=
 =?utf-8?B?cUROTmdlNXlrWm16bzhOWm50S2RHOG9RV3RVRFVoSHh6NUxWUi9YSTdOeDB2?=
 =?utf-8?B?TXRNQ1prbEpHZHZmMXpHTHZ5d2RQcTMwN1kyeVRCR3lWVmFnRjBLL0VCVWZG?=
 =?utf-8?B?Wm1raGdXV3dkaVM1WjdSWHUxT1NkK2p4KzlSUDVzK2hPYm1kYk9Yb0xMS2Vx?=
 =?utf-8?B?dmxIYmlyUkU5SVlMWE1ZcUhPL2IzTHZiZFFRakVtOGEydkVURzNMMUVMTU91?=
 =?utf-8?B?OTRCNjZWa0pyR0ZBUTZFbHRmR20waWVQMksyQktVMk1sOFVaUFlUSnpIaFlG?=
 =?utf-8?B?cEFrcDdaVmswT2E0NjZ3dCtaQm0xNytCbFl4SXVLQmtIRm83NTBmcll0cXlu?=
 =?utf-8?B?L3lVL2plOGMvTVU2OVFDNUgzaGZGTEFYNGJkcExjcEZueE50QzZiMVhHNG5B?=
 =?utf-8?B?NGlKWXZGZVdJcUZvL2dFK3ZoRUlyZWZ1TjE1VlVjdkdlcHJDMWo5QnJDYUQx?=
 =?utf-8?B?OUE5NFYyK2U1czVzZWcrazNONHpJbmVYWEhCYnMrZVc1MGlkRk54V005NlpQ?=
 =?utf-8?B?TkUrd29BcklJM2oyTUlkOStGeTE2MnhuWW9Wem94WENYY0drS0FJdFVSRTFq?=
 =?utf-8?B?Vlo3dzNNUVBOek9NWTZMcWk4Zjc0UUh4VXRQdDdiN0ZUYjRVSFpidWpCbjB5?=
 =?utf-8?B?QjY3MmR0UkNIUTlCZVpTRjY3YitIUU9pM2o3SFFkWHFrNlZvRWdZSDNHZDc4?=
 =?utf-8?B?S1NLOENseDcwOWkrUFJHdjkxYzRpSXU3NUhCUk5qaGtWT3RkSTdVbGNJZmtv?=
 =?utf-8?B?VGRmcWFPMXJiT1NqUThyTytWRzZwS0ZkcWtRcjM4OVU5LytuUCtGUGNXZ2Mv?=
 =?utf-8?B?d3hWKzlsMEZKRkZhdGgyMENSajJEMWJDWEE3ZkNkYlllUmhPaWtDMFRYR256?=
 =?utf-8?B?YWkxb0hybXJMYittaVY5OTRTZVR4QTI1dy9LVjBUbmJ0NWJ5Z3JZQVdadVdN?=
 =?utf-8?B?OTJWb2JxNE94b3RMNkRaazV2V0NvalBuSDZGUlZJZGJzQXZqM1d2VEcxNFBk?=
 =?utf-8?B?TlRmNUlrallucTdGZEpPTXJyVkJNTStTY3hpRUtaV3RkV3JVSkR1K0F6TTFx?=
 =?utf-8?B?YWxxbk8za3RoajJ3Nnl0V3UrOHlUeWhlL24zcUNsTzUxYmxXLys0TW9pY0VG?=
 =?utf-8?B?TUZBcVJtTkZ4R2ZET1Q4ZU5rVDRnTzdsZEVrdDluTDl6WTRyR0hVY1Y0bGZa?=
 =?utf-8?B?WnVnMzJNK3UvTFd0QmJHVnNUY3hvaDV2dUhBajYvWmd2STUzTHdTMUVIT3ls?=
 =?utf-8?B?L3VXWEU0blVoVUYrczVDTjI4dDZQbXVEb1pUSlRwc3dvZVV4TGlNSllQZXlZ?=
 =?utf-8?B?dWUwWlBDa2NhbEVnbmttd1VKTW5NWW9tTnY1Ym80b3ZLSXc5R2FvZUkvNjRO?=
 =?utf-8?B?ckNiTU81WUJESkpZUnNGMzFsTVlFZlNsak5jeHVSQVVqTHNmM0srNDk5TlZl?=
 =?utf-8?B?c05VUVdSZm5pYkhGR0RSTERoYm1HWmZETTBjSlB1ZklYd3pEU3hqaW1Ua09X?=
 =?utf-8?B?Y211SkVoSW9DRml3T2tHZ2Z2STBKd2VBWURuOHBqUTJ4SUVTSC8yVEQyRjVJ?=
 =?utf-8?B?WTMwQUdrWmlkamlXdVlnaTF6OUtHZzNPYTVTMDBhbW5CWEZOU1pNOWdEMllO?=
 =?utf-8?B?VDRzc3hzK1BZc1RITUlRdTh0MXhBNWRGTW51S2thdVdPL3h1ZW1qQUtPc2Jl?=
 =?utf-8?B?TnVjaEU0YnBiT0xuc1IyUlN2ZzZXRFdWVzNDRnY5akg1ZHMvTVZqZVhFUnBP?=
 =?utf-8?B?RHBYcUw2dWZJY05DZDNteEx1NTU5d3o4K054Y2RGdGlCNDNiSVpNT2VabU9m?=
 =?utf-8?B?S2tsWHhuaVRWUjJBR0NYVSsxdXFlcEthWCtBY0dyK2ZMbUcyMWp6UmN1cTYw?=
 =?utf-8?Q?l3l98y3cuPmFhHCzZOaoEXeOt?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 039ec075-bd8d-4c85-d9a6-08dc6c3c7377
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2024 13:16:47.1839
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: shY0dafUZUsi2/PfSPmiPNkIGEOpXTthpisY1rGu+XtACuv/H167vsA0VUdr90Fmv7gkwOa2dZP59lS30mxyRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8633

From: Peng Fan <peng.fan@nxp.com>

Use scope based of_node_put() cleanup to simplify code.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/pinctrl/bcm/pinctrl-bcm63xx.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-bcm63xx.c b/drivers/pinctrl/bcm/pinctrl-bcm63xx.c
index e1285fe2fbc0..59d2ce8462d8 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcm63xx.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm63xx.c
@@ -67,7 +67,6 @@ int bcm63xx_pinctrl_probe(struct platform_device *pdev,
 {
 	struct device *dev = &pdev->dev;
 	struct bcm63xx_pinctrl *pc;
-	struct device_node *node;
 	int err;
 
 	pc = devm_kzalloc(dev, sizeof(*pc), GFP_KERNEL);
@@ -94,12 +93,11 @@ int bcm63xx_pinctrl_probe(struct platform_device *pdev,
 	if (IS_ERR(pc->pctl_dev))
 		return PTR_ERR(pc->pctl_dev);
 
-	for_each_child_of_node(dev->parent->of_node, node) {
+	for_each_child_of_node_scoped(dev->parent->of_node, node) {
 		if (of_match_node(bcm63xx_gpio_of_match, node)) {
 			err = bcm63xx_gpio_probe(dev, node, soc, pc);
 			if (err) {
 				dev_err(dev, "could not add GPIO chip\n");
-				of_node_put(node);
 				return err;
 			}
 		}

-- 
2.37.1


