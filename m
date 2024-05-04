Return-Path: <linux-gpio+bounces-6091-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 433348BBBE0
	for <lists+linux-gpio@lfdr.de>; Sat,  4 May 2024 15:14:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 468A6B20F68
	for <lists+linux-gpio@lfdr.de>; Sat,  4 May 2024 13:14:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31B2E35280;
	Sat,  4 May 2024 13:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="NpK/lcod"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2040.outbound.protection.outlook.com [40.107.249.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45362383AE;
	Sat,  4 May 2024 13:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714828428; cv=fail; b=e14jzCFZJfCE4bGMpbDXHtXxlIrE3zxhus/u1gc87zWOKtQyBL74vF/CMBTKKIhMUTcFbgGC1uaOY2L7eQM1PdfzgDUgM/+L8UJqntK8LZUNlUL0dhyiLLSzj5QRxeuHzxoDiI5pmgMnzwW64q3Ejv78a5Q8OFfbeBl0yH2OCpQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714828428; c=relaxed/simple;
	bh=8+3VXwLUrYD3nDfOr7HntPuhh41zJEyci3faFCn1b9g=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=L/wk8ifc/hMxW94EZ2cRcMIiB7w3RTYlO4eCNwjSrL1Q3HjmkxxlfyoW2WvZ+T8Kd4f+lMMSmI10M1Mfg725uwnEWiHMQH13Lw5p3UF1VYP3HGWrklh0I5f5az/Bh8Sta6qy4f31dM6DkgASNdFwvqZfh10vDzLKyffccnuWN68=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=NpK/lcod; arc=fail smtp.client-ip=40.107.249.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZEjKrZo35vprb+ulRKgA5XEBXHoWfX08dfs+rfUGfxW0PsNaNSU9X++A0D91rq55txf6Zy4S4ePWFyc3OH82pZbecy7zdz7TQC7fBUgYQcgPAO7Q3IrNPuR9YSP7nw8jtNStd/k8cZXy7gFXjRR990xlCjeastrPzUx7wQ8z4Vyz2vO1Eq5DpKinHWAYdVbDIJws0noJf699InJsQBHFd9+kvwCiPaoFVx/lluCamNaECO4LCyNpV0YvyHioneC+69uXv90rVJuM4ZtfC6HbwLccnV8tt1fEXn/Z8aD1bdmXDcBmh0tKeQX9tGTkLtESbvGMP3WyPY5LLbLDbSQ2sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wlbn/xB/PZwPV7ROj5DqSEALVDss+DndXNnPfNwAESg=;
 b=IpRShFXqryoEfTWHOcp1CIk6OH6s0zqw6wy9MuhFPbdKWLEcGix0ULHFmGU9yaQCohNtVQtwHDMyceNi6KhS+hQpo/s+Chi4ZII9dJ2p8Zk/ItIfMODcyWvD4kQlaiFlSl237zSxkn/KWkkWUgbCkvwYuxDVH4d+f+IBu3BeilfYqQhoDFcEI4jfy1fVOvpPbdVboWQlXCIIMI4c37exFBI1IyMV4Rrt8At9gyOXWdHgvKk0h2ACW3ANF/2IWzzn+e7HI6zDdB6ZiqLI4NNUNjafCqWulT0cqU6iXvfYw1jgXJB83eb6u8Dvr1NOER0e5eLy1yDLjCIBwpzBP0E2UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wlbn/xB/PZwPV7ROj5DqSEALVDss+DndXNnPfNwAESg=;
 b=NpK/lcodQ9pE5BbJNbhQk3YjH5Nhyb1JmDwtplCNwBMtXa1WcgJG0yq/JeQCSa8Mi+kNwkwFW2xk+0BZq+jFo54RLX+6FZWwJajiEHumfZuG9ozhKXVpQS9IfB03auLP+qXSrU6Nn0lrmX0rES7yPc3mbezMfUNTvvJLmgrVtSM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by PAXPR04MB8174.eurprd04.prod.outlook.com (2603:10a6:102:1c4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.39; Sat, 4 May
 2024 13:13:43 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d30b:44e7:e78e:662d]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d30b:44e7:e78e:662d%4]) with mapi id 15.20.7544.036; Sat, 4 May 2024
 13:13:43 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Sat, 04 May 2024 21:20:03 +0800
Subject: [PATCH v2 05/20] pinctrl: sprd: Use scope based of_node_put()
 cleanups
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240504-pinctrl-cleanup-v2-5-26c5f2dc1181@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714828815; l=1540;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=BMqLHOrX8EQjg9Z3uUGPLv8QrQVTIzjrj8QOQ3y5znM=;
 b=Ugm0fFZvckU11/gZlb9LPokzX1/XETwbD8kMAjOF5h1wfoVm6mH4BII4a8+jjdOKtEdnq6kb6
 jei5lzvJulvAYZ2W6id9lnxq2Oa6z3vUfHWLegACPLLaaZYeJIhnMjE
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
X-MS-TrafficTypeDiagnostic: DU0PR04MB9417:EE_|PAXPR04MB8174:EE_
X-MS-Office365-Filtering-Correlation-Id: ae48280e-1957-4ec4-2bf4-08dc6c3c05d4
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|376005|7416005|52116005|1800799015|366007|921011|38350700005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YlR0UUJmS1IzU0J4VTdPMVAzV1dmRG54RzZHUzlid2RHK0t6UnBHLzBncEVH?=
 =?utf-8?B?NXRNc0lHbDFyTlVKN3QyWnFzcE9HZHZocHBRWlFDZU9vSW8yV3FZdEdXMGI4?=
 =?utf-8?B?NU1KRzRuZFc2S0xiV1d3bm9jUGxvbDlZMVpPOVp4MzYxTVpJMkpkUGpVM0Yx?=
 =?utf-8?B?bkE0bThTRFJLUksvL01QQTFYU2NiYUsyL2J4YjRpSjgwZ1Yxa2hvZjVDVVRS?=
 =?utf-8?B?cmJFdHp0SDF1WkRqTGZTSk9oVlVMTUJBYjB3dGF5MHBjSGVzRmRvcFhXY1F0?=
 =?utf-8?B?dERzTVJpS0U4UFpXU1QxeVI2U08vaWhSUkkzMThSWElTRzczSzNXVHpiY3ls?=
 =?utf-8?B?Rk5mTk96cTYwZ09sbVFndElONVFsbVBDTGs3R2Y1RkNWaDlJY2dzWENaUEh2?=
 =?utf-8?B?RnlIMTJVdWQwazRWZGhEVWMrTmlqOUNtMm0wbHY0Wms2RTdaVXgwZGl3WEFn?=
 =?utf-8?B?cGVYMEFHS3hTazlyaGNtRUxtUzFpZDVaaThMelBDWXVGeEN0enZvczY1dFVz?=
 =?utf-8?B?RGg0Yk9aRnZyemF4S0NLR3RFZXMxai9GclRHbFhsMnZuMnQ4VlpmQUlwajRk?=
 =?utf-8?B?bG9pWjRjalpvUnQ5NmY2c3U4UHdNMEo0dG9LS0JtdVlHOUdES0ZBMTZQUW10?=
 =?utf-8?B?clhiQmtqMW16ZnBTK3dvWDE0QUIwZzVLdlVIR2lFclFZZ1pNb3dHYlViRFk1?=
 =?utf-8?B?OERGN3lJVlVNSU1SM3JNc0tOY09qQlEyM1lDQml4UVgweDZNMWNxbHFLT0s5?=
 =?utf-8?B?Y3owVzdnZGR2OHM0a0s4QzBtQW16czZOMmZKVXIrQnFDK0hPQ1FENTVoWUxQ?=
 =?utf-8?B?dk5xN3BpQWE0QlYwNGprWjJWSFZwd2d5eFJyY2Y4c1EwN2pGWngraEVLZXpl?=
 =?utf-8?B?a2FOZzNLUjZ5amFKcFFXeXhqRWZmWi9wSVVsaXc1bHFEOHU4aCtOckZPVTQv?=
 =?utf-8?B?VFA0djB1MUc1MnVsdzVBVGlrem9nUlZVZ2F6eFJPUmhiUzk5TTVNVlR3T3Bp?=
 =?utf-8?B?TVZHMXNhUnExSE1wMkxKNGRDQ1lpQm5PNlp6bTMyeERBSjVETHR3bUh5dlFh?=
 =?utf-8?B?MVlTb2dSemRiZm52MUZzYi9lQTBOUEY1UytvenNLYkFRQ3JyL2ZxT0djRm56?=
 =?utf-8?B?YmtmaHVTYXl6b2pWLzJ0RGxFdFliT0p4S2lzSWlpZW5heTh2anhQZURLQjNV?=
 =?utf-8?B?SHJBdXVNbSs0WkM4MzQ1MXU1VEVSc2dBSmUxcnhCS2RpNWQ4WU1kZ2diMFZw?=
 =?utf-8?B?RnBFb2hBOVprWmRZUXVxWUkwdGRMdmNiZmtlU2NVS3ZOOGFBMjNFUXBkVkMr?=
 =?utf-8?B?TVN1T1NCVnM0TERQMXF4bG9QdG5Sd1UwNUs0NktScXMzc0JkcHdsSVdBdEhX?=
 =?utf-8?B?VWFSWGtLa0luNk9RV3IxeFVhNEF2RXYrZ0VjcnFiUFVkQUkrSTI0SFZ6ekNy?=
 =?utf-8?B?eUNqdTB5ejdJdHEyRFhJeDZzR2VDdDVQZldZYklnQWZSR0V3WmhsanRHRkxR?=
 =?utf-8?B?b29jL1BzaWRveHNhM1RBUHBSUVZZQ3FJUDBRNGFaZmpXazArU25jSWozNEM5?=
 =?utf-8?B?UjlXU09YeFpnR052amtUM3dBaGxJMUxGWEtlMlJIY0dBQ0pjb1V3UWVtZS9v?=
 =?utf-8?B?Wkx0S3JxTGNHNFE5U2Q2d0o2dXNhc2tOUHpSNmxGbmVFVXdxMEd5MEkxbHc0?=
 =?utf-8?B?UTZrd3lweHRMei84RHVpTy81TG9FQ1J4WGFVNFQ4dEVpVytSR3RmcVp2NkVy?=
 =?utf-8?B?YW9QRzB5VVRoV2xZNmsyb0hhcTRtcVpldEVTa1ByOXNaS1J1N0Q0ejZWNjdE?=
 =?utf-8?Q?RGjTow0l8Koi2XeQGjRkSP1bAuF9+W/v3yXEw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(7416005)(52116005)(1800799015)(366007)(921011)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K1I3M05jWUw1SDRETVQ2cDVTL2dCOS8raXhYcW9Cc3Z0S0xDU1ROWTV4U2pB?=
 =?utf-8?B?cHg5VTZTWGFCZVRuM0pEODNmVEFzTzB1MXd6Q0YxNWJDMTJVaU9KbTRKWkpk?=
 =?utf-8?B?dWVaaE5Cc3BQN3E2YmpuZDhFazVqZ3c1ZkFLVW5OU01ONGhFYWJBaVhENHU0?=
 =?utf-8?B?am1wTHpxVzNqVjg4b0JBTnhtZjZuUnlPall4bm5oRklLMll6SU1EL2t6ZlhD?=
 =?utf-8?B?bGg4MGRGcGZMU1NCWEV0SGxxdE1PTXBXcFFuRkpKZDhGejFnWFNibHMvTnAw?=
 =?utf-8?B?ZVpLSllUVVUyVFF5eS9LdlkxbnlCeERsaHRLRlQzK2prNDA1VjlBcHJZL0lv?=
 =?utf-8?B?SlY3MjQ3a2kwSlJKdkk0RWFkSjNsOWFZSmwvelRVMkpCREh5Um1VYjRkV2JW?=
 =?utf-8?B?MmdNMDRNV28wakZvWWxPeTdrcVJndW5CdWh2anc4am05RmdhUUw5UkR0UDVv?=
 =?utf-8?B?dExBQlJOMWxVVm9LdVlWaWEzZGJDWDhwUnpRcThyYjhhS2liZ01Bend3VnBo?=
 =?utf-8?B?cU5JbFJvcmZDMkt4dHQvT3hpa05HdldGTENDcTJQeStJSWdCZ0JwMHgvbnRV?=
 =?utf-8?B?Y0dhSkN1RDNKS3VMYjgrVDV1YW83UG9IeG9rTVJ4TDhuNFhCcGxna0pEdFdU?=
 =?utf-8?B?NmlhMDR0MjNKV0pKMzdhN284OVRGVTFhVmljQkFrZjltbG12QmNSNnBZQWFi?=
 =?utf-8?B?ZmpwaHpndE54SW5VQ3dsYXJiZ09jeXBpWmJncHhxZHkyaGpLR2lHamZiQnd5?=
 =?utf-8?B?M2llT0Fxb1pVRGc4cUhFQlBPb0RsZFFkdWN5U2hLdXpNQkxkaGkrMHFLK05v?=
 =?utf-8?B?L1FGVHBRVXU1NmlyWm4vdXpsZnJsNEViK0V1YXVIY2tyRjNJK1dWZDhWWTlr?=
 =?utf-8?B?Q1VMclRmVms5dDNXRzdMc0NIdVB0VElPbk5TNWYvYnpzbWFXTklPM0V0S3Zt?=
 =?utf-8?B?MlRXOEN5UDBlcS9vb2Rhdm1XQm9qc1BIQjFoNDhQM1l2L0ZQSDRzNHFCS294?=
 =?utf-8?B?TU56dlZ3Zm1DOXdCZCt0V1dXdzZ6eDVwWEJtU3dQNFh3c1NqSzhXZGZ5cFI0?=
 =?utf-8?B?dXpEeThNdS9aM2lWVUI4d3NYWUFPcEY1bHBybEJYYjVWcklON2NrMmpoRjFy?=
 =?utf-8?B?OTlmQmwxNlN5YjRnNWR0d05LM3hCem5kSlozNHFpakZYZGZteHFDT0tpQncx?=
 =?utf-8?B?ZEwrMlY4VDVNenUvblNmT3pSeXRYMGVCNGVCZURUSjVsa3lBVUM1WUpCb1J0?=
 =?utf-8?B?KzZOMCtjdXEvNlhsYk1YR0RvQXhaaVpJOUMwb2dLZkNPSktBdzRra2YyaldC?=
 =?utf-8?B?UWFGb1NsbEhVWmx3cHNMVTMvUGk1Z2d0bFJpcnNYeThDZEFkTEh2dTVxRmJR?=
 =?utf-8?B?c2kzdmtQUFQ1TXJrN0xpLzV3blFnVitZV0xtdmVlYzZVWEhSYkNqWllna2J4?=
 =?utf-8?B?UGZnbUtOa1Jqbk5XWS9WM1c2djFZeGVUVFFOZjAxeHhicGdDV2UrMGJWVW5x?=
 =?utf-8?B?UVl5RHg3dUJtcmxPN3lBVWZnQklHU3lDQ3F4L3V3RTBmRjZBWkF6NW5vV0VR?=
 =?utf-8?B?L3lKVUwxMkpiQnRkRTA4VklsYXRSeUphK09lbWVhMWxVbHdXL3FmSVBIeEdR?=
 =?utf-8?B?WjNpVEJac25yQXpaUEQrNHRkUkNxNWZObExEcmo4TG9NQmhUeVcwUGorbUlT?=
 =?utf-8?B?Ym81SVl4V3JMK0FrWTg2SVhVQXVmOUVqRmNyemJtRW9DVlZpVU5sVzhtaXN3?=
 =?utf-8?B?SjJWNGZjZ3dLdFRPOStyUlpuVWhmQzl2R25XWXZmdzczQytlRXJzd0NkQmFi?=
 =?utf-8?B?RHJEUnZxRXh6Z0FpS28rUWF0S0V2cyt6YXdlZzFWNWhIV3ZUUlpUeFRsV00x?=
 =?utf-8?B?MTBpNlpkZkEzNWtLcWpiZnl4alNoVmk2WUVlWkZJZW9mbVZuQVdyaHZPZGhI?=
 =?utf-8?B?R3I0VXVTVDdXZFY1UTZEKzI1STBVcHltYnI4YkxMN2hBQWJEcGxaMmx3VTVa?=
 =?utf-8?B?OFliUlR2dXRLWm15N1UvR0RJazVSRzlxdjNuV1JvVTlYUk1VZ1hxWWxSaUFS?=
 =?utf-8?B?ejJ1NDBoaThodENIb0RDNGlJVkdBaTFia0x4dGt1K0tpTTV4VXdXTDM4ckFE?=
 =?utf-8?Q?Vr0BaQNkVughI8/WS0Bc8JzhX?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae48280e-1957-4ec4-2bf4-08dc6c3c05d4
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2024 13:13:43.2390
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xBz/wo6jszy9seIjpFniB9zAk6LmJZ++0AvHsX+MUpveQib2IRf6H7bVmdHZ7jXUcpz7/Ua5/Cme+TomydhrMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8174

From: Peng Fan <peng.fan@nxp.com>

Use scope based of_node_put() cleanup to simplify code.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/pinctrl/sprd/pinctrl-sprd.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/sprd/pinctrl-sprd.c b/drivers/pinctrl/sprd/pinctrl-sprd.c
index d0b6d3e655a2..c4a1d99dfed0 100644
--- a/drivers/pinctrl/sprd/pinctrl-sprd.c
+++ b/drivers/pinctrl/sprd/pinctrl-sprd.c
@@ -934,7 +934,6 @@ static int sprd_pinctrl_parse_dt(struct sprd_pinctrl *sprd_pctl)
 {
 	struct sprd_pinctrl_soc_info *info = sprd_pctl->info;
 	struct device_node *np = sprd_pctl->dev->of_node;
-	struct device_node *child, *sub_child;
 	struct sprd_pin_group *grp;
 	const char **temp;
 	int ret;
@@ -962,25 +961,20 @@ static int sprd_pinctrl_parse_dt(struct sprd_pinctrl *sprd_pctl)
 	temp = info->grp_names;
 	grp = info->groups;
 
-	for_each_child_of_node(np, child) {
+	for_each_child_of_node_scoped(np, child) {
 		ret = sprd_pinctrl_parse_groups(child, sprd_pctl, grp);
-		if (ret) {
-			of_node_put(child);
+		if (ret)
 			return ret;
-		}
 
 		*temp++ = grp->name;
 		grp++;
 
 		if (of_get_child_count(child) > 0) {
-			for_each_child_of_node(child, sub_child) {
+			for_each_child_of_node_scoped(child, sub_child) {
 				ret = sprd_pinctrl_parse_groups(sub_child,
 								sprd_pctl, grp);
-				if (ret) {
-					of_node_put(sub_child);
-					of_node_put(child);
+				if (ret)
 					return ret;
-				}
 
 				*temp++ = grp->name;
 				grp++;

-- 
2.37.1


