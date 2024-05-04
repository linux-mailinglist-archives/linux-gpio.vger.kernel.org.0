Return-Path: <linux-gpio+bounces-6105-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4471D8BBC37
	for <lists+linux-gpio@lfdr.de>; Sat,  4 May 2024 15:18:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AA5151F222AE
	for <lists+linux-gpio@lfdr.de>; Sat,  4 May 2024 13:18:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 819083A28D;
	Sat,  4 May 2024 13:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="U0oBYf6u"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2087.outbound.protection.outlook.com [40.107.22.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A31364DC;
	Sat,  4 May 2024 13:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714828662; cv=fail; b=cEvUC+T/ODzuhakcap7p79BIr4DUR0vEOlwsGID3DQB+4NlE3bbMmgsCrkSWUYkWE3JThjhHIxUMNc7dXjOBCwqWTfev8TVljZ9QWwF0VD6BINBsx17zorRzmy1jDYHsT4klLp8virT/tpmNjENhvr45E7bQm9XIunmHUo8Q1jU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714828662; c=relaxed/simple;
	bh=FyFseGQJmsq1rScaeKVJgP424XsxB+ntR+56HIl8ufU=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=m+HwH+SHcuAvTGNpnWR8l7tXHCyDlg3IbXKryo5Y9Trou7YAY2YK5hnYPdu1DRBWvgM/c7gii6IQ5YZRRaiDuGiWSAtilwli/SfCj0u/iX99kiKmhUROKw4n5aLkrZDqy8LAt5WWAH0BdAnr3vLHVaslURGL7bDxm/q8gUsSSR8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=U0oBYf6u; arc=fail smtp.client-ip=40.107.22.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kYxiRSbXrlxM0QIZzB2JKkGv1WJuFfsZ5UeNw2hEhj3s2RugeUNPmnruOs3KpMnTUl3wLULJaA9kWr825f0PL1V65U6T2VhJMZNg6Ph0uzezGyCOafoYdFqTRIhQlDiDpUXoQEGJUL4lErnu2rfYTpG+nhVzmvG1aHI3lvEULEOfMiIOVDnLQjkHBRf4LY4rE3vqHoQFP7dQQDVpZQTDZrvPf10iDSA3cniKUGIVHYDdDXKVOSWAzyNS5hYV++eY0ZwfDgQBdvuSrkqtFMqjYwLvMmiRkprFbK3D5aNugridWj1DX/Q806+Vl5faqD4ovOn++GuoFSqEgaPcixcWHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rPCG6xZzK0LC/23B+oYJdueIO/buCemfRXEoPX5rvQQ=;
 b=JTpmd+rqr42czEZb91zi5Jo2aSufwuMAvEL7P+ECrNA9kvs+uFlC3Gxy9vxOQyI3sGAPsnd63WdGDUTMPc4tAHZ6sT8MYx7Ggkuz4D18WQyO8t7vyFCMf50L4Gx3wDbm0FtBo5oANfUu3Q97gmLteAKjDQWVnh/gFvZSdvrJ//7knKIc4IK0NdDx+GLzeaHTKfsi9GFQtchFeWOvT+WnsJUjZnsQvWsNL3D/1xHK4kulYh6lfwpVp1N3hvhBTHaEfm4S25JQ2RqmZ1fZUE/cOAlDy3WY35zRWC+CalNrv7abUyspyaH+5c5EVea/DgLqQbj1FeXDUD+oXMCgoIMPPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rPCG6xZzK0LC/23B+oYJdueIO/buCemfRXEoPX5rvQQ=;
 b=U0oBYf6uD96SvqELHvZ1Dm4fRhXclJNCzV5vD9LAKg2FJer/qQAgCy33yfbFfxL6OCfoJmrvNotAl9NB5G7lmt08HgP2vvNUlIgL7KkHi/vOcbuwTCWrK0PGMFYkZMqgRM6FVRLBRnpVS9FZeYPfntla8UGRo1RGes+KL9BWCOc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by AM9PR04MB8633.eurprd04.prod.outlook.com (2603:10a6:20b:43c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Sat, 4 May
 2024 13:17:37 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d30b:44e7:e78e:662d]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d30b:44e7:e78e:662d%4]) with mapi id 15.20.7544.036; Sat, 4 May 2024
 13:17:37 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Sat, 04 May 2024 21:20:17 +0800
Subject: [PATCH v2 19/20] pinctrl: k210: Use scope based of_node_put()
 cleanups
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240504-pinctrl-cleanup-v2-19-26c5f2dc1181@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714828815; l=1076;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=58KovdEVBZIsn2lfhZ/T0dqiN9oElq31ckJF6Ac0RQ8=;
 b=Z+wSwh1JPoQAPchmd5Ic4kf6A6+OCSxNrWN3N1KhVLu4RjS5VBGAWLrX0O4aqR9c7Yhj1583S
 ps7l8SBklTdDPmAjAcjmF7u6Z9ImB7S+gJdZ3GjS/jXZ/LXZiyUzK46
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
X-MS-Office365-Filtering-Correlation-Id: 656e3a5c-55ec-45f0-bfc5-08dc6c3c916b
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|52116005|7416005|376005|1800799015|366007|38350700005|921011;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L1ZyQ3ZNZUpYdUZRUlh3S0xYTXRwNWtteTl1ZnpYa25RUEJ0dHZRNlRNbzVO?=
 =?utf-8?B?bHg1VUQxaCtZMHR6K2szakJjQStFV2RwQnA2eHlER1U2d0ZMZjc4Sy9jUXlO?=
 =?utf-8?B?d1RYSm5pRHFUNkY0MnNPbFBKK2RkcDl1YXdrYXJOR2gyY0FQcWQrdWY1Znp6?=
 =?utf-8?B?dXBQRVdBMXdVbW9Ebit5SnZJSDZnM2ZQWDBOdTdMTXE0WittVHRwMDduUElM?=
 =?utf-8?B?VUdNclhYc1VOZEIzelViOS93SUJURXVUcWxOZ0hyRXBlQjc0VUs2cEJmT29j?=
 =?utf-8?B?YzF0c09XWTQ0OFBnTWozd1dMQ3VZeEcrUExsODhkWGpZQkhXRDQ4QjlXNWVp?=
 =?utf-8?B?aC9RempqM1RiYjArdG5FL3NONkpmVVdDWDlSeW95Z2h0dUt4cm00MktET3Jo?=
 =?utf-8?B?ZVE0Z0lZeUk1MnlkakMyS1YwY2t4L3h2d0RIdzBPcG5CNWJPTHNFZitBSEpa?=
 =?utf-8?B?U1ZabW5ISDlVeHZoY082N0ZZNytCL2gzbWlVUmpmRlNpeTJpbW5DdDZKcjFU?=
 =?utf-8?B?Zmp3V1lxWVVQRWxpZE5JVXo3QmI2QUJjOWE2Z01rN05PN3VIVVMzeHY1Q0lh?=
 =?utf-8?B?UHJvNHZqejY5TnQrYXlyMDZ5b1ZwSXhna2xmZ3VsaVc2SnA4eXhrelRZQ0FN?=
 =?utf-8?B?OUxMZUM3VDV5bGE1NmxSKzRPNzRMNUVyUVRmVGhDWXRPT0s1MGw0M2dwRjZU?=
 =?utf-8?B?bnpZT0tOUXo1VHVGY1ZmeU5zQnFxMmdVcHkvZVc0QmpTclNFTHBkYTRMcG95?=
 =?utf-8?B?T2xHTGtILzMwQUowN0RqMC94b1hja0Q4RlJVQTRkOFlMOVQzcFFpVmF4T1ZQ?=
 =?utf-8?B?Q2RUWkhwNEJ6U3pKNkxXSWxGQ1BOZ04wYk05UG42NzJDWm5sbEY1RGVXTEtt?=
 =?utf-8?B?L1l4TEU1WExFRkJkZUx3UWtmQ1haSnNqZ3Uwb0dHcTNWa3krYjdVZ1JmcUV1?=
 =?utf-8?B?WVhvOHVzQzZOM3Nmb1ZvcUk5d3dDWmVxT01LbFpVbzBHUVdHSk9KV0NmcHNv?=
 =?utf-8?B?c3p6YTZBeVNIQWlIeDJMWlhFTXE3cGczTzVQQ3EwbnI0WEFtOWlyUGVqaS92?=
 =?utf-8?B?aWVSZTlWbHZYRGFhTHdHaFRUMjNPcGkrUy82d0dFN0FkUHk2YWZuUVVJcjV5?=
 =?utf-8?B?bm1PRGdXSjlhT3NaenpjY1Fna3ROSWM2Z1YwK3NHTlIyc1dVdExnVm8rNUQ1?=
 =?utf-8?B?Y2x0USt1TVhDVXdKN1NWSmE1VGJSOEpMRGorQ0g2TWhkL2JON1NPRzdsYTM2?=
 =?utf-8?B?YW5oSHl2RFFuemExUDNScEdXaGpjcWVmYVhraS9mSlc3UmREaHNVZWRUeEZj?=
 =?utf-8?B?bU0xdVptQkZzb3ZwVEtQSEU1MVFtbkJNQTdXOC9hRk04cWhVVnlxQTYwWFdL?=
 =?utf-8?B?dWd0K0xuQUlrWDFtM3FYNTJteTA1Wm1OYlQ2eGJTV1Z2bVZmWVJERmsrWUJ4?=
 =?utf-8?B?U1pJbCtrOGR2WCtPUFhIcDJ5eFBpUXV4N2hWY282aDdrOXVJSmM1ajYxaE9s?=
 =?utf-8?B?TzNpYnNMTms0U0FIUnhaalpXUW5PK0h1ZHNkSE13WEo4RlhjUk5EYWVKNTQ4?=
 =?utf-8?B?ZWE1bVZXd3Y2ZWVIVHBqQyt5UzBUZXE5Syt5SGgxTTZWVWNnT2RrTER5WHhT?=
 =?utf-8?B?QXI1UnZUd0VVaFM4YnJQYXRsbnJXdDRGUEJ2SFpzcHpSK0xLMng3TnBJb0do?=
 =?utf-8?B?UmVxeGRUSG9zaXpuaUlidmxZNE56L0JaOHV5aDVGbXIyNGZIblNnS3RwUEcv?=
 =?utf-8?B?UDlWaGxMNHVJRUZBelBEWGhlcGhVYVlOQm1mM24rS3o0RU1FYWpFWkZ3Yitv?=
 =?utf-8?Q?LPbON/1NL46Q3gcH6TAb6FqxKvSYUCBnoNRSY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(52116005)(7416005)(376005)(1800799015)(366007)(38350700005)(921011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OXJ2Mloxdll4ckJjYjBuS1l1Y29TTGFtVGVyWmJnWHpXMEV4M3A3MmNKNnVV?=
 =?utf-8?B?MFJvd05rdlliaERxeCtZcG9YS01sWWdBcUg2U29vQ1hEOWs0cTlUU215UTFF?=
 =?utf-8?B?ZXQrVm9xM1FmSW1xdmROSllTdEJzRHk0VVB3cGVjL2lkMk9ield3Z0dpS1Jj?=
 =?utf-8?B?QjdCaE9uMCtJS0Zsc3ZIejVCdEhJa3RGWExuSVl5WTQwTi9mNlptdCtVbkND?=
 =?utf-8?B?TGxhVTg5eTJHNmlleFZlK2lFNE54Y1ovalhOVlQ1V2YvV3dDR1M4K0R2Lzc3?=
 =?utf-8?B?MGtuVVNFVmw2MTVQUzFKclZScEFCWVpLQUxJbm9Ka2FETE8zRlhjV1Voaita?=
 =?utf-8?B?YnJYSEVwOTB6VXVMbjVCcVVJV05tYkEyT3lXdTZkSXVuZkwwNmNQTmcyb0xE?=
 =?utf-8?B?MWRFVUJMeityZzdLQkdhSzlxeDBjSHo1eUdWVDFrc0E0MkV0Y2xQRjF4MUE0?=
 =?utf-8?B?emxIOW1Lakxza1lGeEJ1cTNaQjVmL010clg1dlFMYUNPL3VFbmNLTG9YcDFh?=
 =?utf-8?B?cEw1dW82V0lkYk43Rkh6Q0xydU50NkFYR3JxTEVZNFRHQ04rWUlkdEJMaVJ3?=
 =?utf-8?B?MmQwSWE2ek5JY21Ja2E1bUlNaGYyczBBU25sN0JuTDY4MEhCc3haKy9iQTdC?=
 =?utf-8?B?WkRDNEZhb0lTeDVSVmo4QWdrSlZhN0dtZ1BGdkxJQUhWbk9kT2JaZlkvMFFt?=
 =?utf-8?B?L1NOdFMvQ25HZVk0a2J3SmloV1d3RnhTZENweFdvM2ZUNzlUN2Q3amxvQU84?=
 =?utf-8?B?SzVIU0VoRlUwNi9lK2tZWVY4aFJHZlNIOTJGcjdtdjlYcVZDdEpnR0RXTzhV?=
 =?utf-8?B?VlBHVWc4NG8zN1NjSnpUMFRQMHV2MDRRRGZNY09wbmJHVkMrQ1Y3QUZRdW1i?=
 =?utf-8?B?UEQ2UlMrekN0cEI3T3phSjdiREZnUG1hdVhCSk82RGJVRFQ0OHdzRGk0T0pZ?=
 =?utf-8?B?cmV0R2xIM3F5OS9YNld1b3NXemRPZVZzS1BVR3lGK0tBWFhwV2RFd2w3YThk?=
 =?utf-8?B?SWhJMmRIN2NUT3A4QlN0V25XL25ONXNwZENTNHJ2SXBZYVFEdnp4anA0ODZn?=
 =?utf-8?B?bklnbGlsZDZyWEIwTVd4T1VWenc1Z1Bhd1ZiQWRhRm1zdVIxei91ellCNE1z?=
 =?utf-8?B?VUQrR2svN241VjlEcmExKzlkY0NhVGxMR0RFNVV4YmltZHA1T1dRbzJRMkl0?=
 =?utf-8?B?dHUrbmVPM1ZLeHpQUXNsa0hoN3lNR05XQWt0NithNG1pcHpnZ3dxRHRsdGFI?=
 =?utf-8?B?NWpxRUFZNjJVVFV5ajJSUU8yMzFUd1ZjWXFYT0pQREVVejlYeEtidnZhbmZi?=
 =?utf-8?B?cGJzMHFZL1ZPaWRhOU5qY0IrYXdNcUExNzRRcU9NeGdlSW1pNnpUbzVHaVMz?=
 =?utf-8?B?QnVRMXRJakJTM0hyZWRmeFIzR0ExNmhXc3cvaC9BZ0Uyb0swU1RnelBXR09h?=
 =?utf-8?B?cUphYmcvaS93elRIdEVlOUdxUDhGWnFsK3JKeE9SdjVESVQvaHNHVUhudlAv?=
 =?utf-8?B?TXBBZ0xjUUVuUUhuOExBTnRpUmVGbTFhOEFBTTc2UTY2QmRyTnBuWVlnN2hE?=
 =?utf-8?B?bVhCR0VRdTZTMmZORStiSzZKSFJ6Rkp6NVYxWkg0U3BnN0tha25JOTNSRkVZ?=
 =?utf-8?B?ZFVuaThBZXhTVmUwUWpJMUhZUms3UzYyU2MyU3F6YktPakJ0eVVlRTBuaGti?=
 =?utf-8?B?dGJJT3h2Rk5LU29HT1NHMStzUld3SjNhUjgrUmduSjBJTXBaZitpTzFCcE82?=
 =?utf-8?B?aVNpM2MwR1RIYTZtaWhsUHdDTGJ3L1ppNjhGTjhTZE4wS1lYVTdYOW5xR1dH?=
 =?utf-8?B?NDJ5TVlmeEZJMXg0RzdiT1lQR0UvMUdFU1FSb2NJWU4vTVhyNjRNbzA3UGJt?=
 =?utf-8?B?bUw0WWl4Vkdsam9BK3J0QzJFejVOMGNVRE0wVUJyaW5peXlOSXFOak9sbTY2?=
 =?utf-8?B?NEJyVEhSVkxYSHdKQ0lRRVg1Rk55R2RBR0hHcHk2cGVla3JDbVRMWVkrbjc4?=
 =?utf-8?B?bkVPempGa0ZjQjdYMjB6TnZKbFZRby8xYlNjY3dDWTdxVjR2N0tsNnpHTFds?=
 =?utf-8?B?Y3RjNUk1ZEZQb0xxVGdCOVpJb0h0V3Z6ZGlCNTJIc1FvRVdybnFTeFI1cmQ5?=
 =?utf-8?Q?goR+YVBGb8ozJVYfDY99w9qAi?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 656e3a5c-55ec-45f0-bfc5-08dc6c3c916b
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2024 13:17:37.4396
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g6nupdqB+zySfjS5aEdMaK45BkDcQFF3xV64E9YCjbGQMY976BhNaluoO2HLwNgSGP71nunEjSbX24YIjKnQog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8633

From: Peng Fan <peng.fan@nxp.com>

Use scope based of_node_put() cleanup to simplify code.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/pinctrl/pinctrl-k210.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-k210.c b/drivers/pinctrl/pinctrl-k210.c
index b6d1ed9ec9a3..2753e14c3e38 100644
--- a/drivers/pinctrl/pinctrl-k210.c
+++ b/drivers/pinctrl/pinctrl-k210.c
@@ -849,7 +849,6 @@ static int k210_pinctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
 				       unsigned int *num_maps)
 {
 	unsigned int reserved_maps;
-	struct device_node *np;
 	int ret;
 
 	reserved_maps = 0;
@@ -861,13 +860,11 @@ static int k210_pinctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
 	if (ret < 0)
 		goto err;
 
-	for_each_available_child_of_node(np_config, np) {
+	for_each_available_child_of_node_scoped(np_config, np) {
 		ret = k210_pinctrl_dt_subnode_to_map(pctldev, np, map,
 						     &reserved_maps, num_maps);
-		if (ret < 0) {
-			of_node_put(np);
+		if (ret < 0)
 			goto err;
-		}
 	}
 	return 0;
 

-- 
2.37.1


