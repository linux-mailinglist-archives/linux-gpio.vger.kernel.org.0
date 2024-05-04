Return-Path: <linux-gpio+bounces-6094-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 939BC8BBBEF
	for <lists+linux-gpio@lfdr.de>; Sat,  4 May 2024 15:14:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 093C91F221E9
	for <lists+linux-gpio@lfdr.de>; Sat,  4 May 2024 13:14:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1135B37143;
	Sat,  4 May 2024 13:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Dj+fXKXO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2068.outbound.protection.outlook.com [40.107.22.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79CB72868D;
	Sat,  4 May 2024 13:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714828482; cv=fail; b=Zmd9D4oFaKyrBZSlCFp0F/jfrCzQ3f7/JdzYjVvapc3t3+6wYETvP/NG4YL/ajHIebw3bJYLJO81EufoA6aaHn0egBlQkfrS5D4Msobh9rBKy63Xms1/0boCMnS026eBG43qcyo+peCVdvm0kplq8rPXuJ0YP5F2jAvXkJ08JPI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714828482; c=relaxed/simple;
	bh=9hvlVy6b1eo5pxJBgdmpuQ0CR5gv9409rTkOxz7XFTQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=sYO0t3YPqO+LEE4m4J5NG57Ejxb0/EU80m3ibtAI6rumv5yCi2h+raAbfgL4lrIWu77QNvRQGfBsLhejD9FCLg2PLYDNT2+EIf1K9KKvJR/zOS0ewuapQR4aYNwDsVWlVvqzfhbkzbyrArWJJQeSQh1WwuJF3UDlkLKB6IXSpvo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Dj+fXKXO; arc=fail smtp.client-ip=40.107.22.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fWXn+HNPyiNYRoDQDcAcXp4xArKAw/y8SFe/oayt6TItkT60kYUvZw3LsUO5+w8cIdM28YEM0q3jSoDZjWtLjKH1vMktTx9G+Rp5tw8tG12E6+Jkd1fCM9BArtum/H5wgxpfn1Bb95X/Ews/RyLiMruVN8cDELzVsEVzY1UZR7wDnWfqeWkTRZsRQul+UTPmSVatWS6CuqONLusUSbHNXhVzqEp9DU8Jpng59kI0wbZ+aka+RHpz8K7LuIDqhqXDn7JAlA+XA8ctk8Rejq5LcG4LSEBMHd/ol1CU6A6CLYrBkyC1MCdthm5B6uK6B7xi9RiEmCOL7f4rpMLgcjOnng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=epf4L/dpti+hg620NqhC5qYH7xMXGAi+pTHVtvEELiU=;
 b=AW82+A8IJYGHbQJto/aGxXBevTqLMwgnJF8ET8BsnuEFzN9iskxYO6ib6PxRmfaZWPiWt+n7+enL4Qs1oUPPHwzPF1+IRaClEHwU23lvKPCVfhAMYmdw+FVBMlmjAwgWulJcaoSsBR6Km8JFlf2uVzuu7QM8GYd2DQ3zFM832wieBJatzEggMThrR7I4RlTruCweTk3JYo2qhhEAjP59J+lNCok7UKn5smB2TedoHc+hkW6nd0R5dqf42vkE5U7Xj1B0UMBl8jxKKFgS8AURB2VnJwOhyz2TPbFrjS1u/vt8ZpXUjNbcRJHiu5uloSUKjJAVtMndf/iI34wVaebWSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=epf4L/dpti+hg620NqhC5qYH7xMXGAi+pTHVtvEELiU=;
 b=Dj+fXKXOBD1vI5VZVLaZnuBzZPwOSlnDkyrIq5Iit8VQPl/2J45TnEi8RICFxnOSUXd56kwto8odRlP5WmKXOXHlN4n/sHVH7BL856t0WxL5kawMYOTMcVZNHJ10JhXQq8plNmxx/hBcrYzNdjuJ6B0Oi//pM+j3bXhvDZtgjOQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by AM9PR04MB8633.eurprd04.prod.outlook.com (2603:10a6:20b:43c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Sat, 4 May
 2024 13:14:33 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d30b:44e7:e78e:662d]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d30b:44e7:e78e:662d%4]) with mapi id 15.20.7544.036; Sat, 4 May 2024
 13:14:33 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Sat, 04 May 2024 21:20:06 +0800
Subject: [PATCH v2 08/20] pinctrl: st: Use scope based of_node_put()
 cleanups
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240504-pinctrl-cleanup-v2-8-26c5f2dc1181@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714828815; l=3917;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=WkwqgZKiLgnl2jfID+Ud31pueZUfzLGyRuwnbdcTMcE=;
 b=54q7MBEBsmgWVOdKQelInf02EJz/WtXPNBQuDk5mK2LcLLCBCOXVl32net6pxq9g8cBTu/cs8
 PgTb3cxhzI5C/dbPij4nnc9A51CT7/Xx+UEJuEZwAX3+3Z+P3Zwv4ES
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
X-MS-Office365-Filtering-Correlation-Id: 9f5ee1a4-bb1a-48ca-a0c5-08dc6c3c23c6
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|52116005|7416005|376005|1800799015|366007|38350700005|921011;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dndIdUpNdDhGZmJpNlBSRVNKekRYc2ZUajhFMDlENXd1U3dYTTJEUFpSeW1v?=
 =?utf-8?B?empJcSsrN25RWDVBa2lrQ2V4bTlHVFN6T2Q0THJ3YUFBTUxyWkZyTDU5MzVM?=
 =?utf-8?B?Wm9JbWpxTzVES09wOThnNDEzSEtyb2psZTA0UVdqMVZjRCsvcHRmUU9nWTlC?=
 =?utf-8?B?dnl4Zkh4c2tEZVFuakZCZitjeDNqOTRHMFdYNzNEdzk0ekpjQnBWVmdQNEVy?=
 =?utf-8?B?ekxOb2p0UUhrbTBjRktPTlFFVU5PR2xKMmRvNU1OUkpHR0RmMUpwVmxlRGZD?=
 =?utf-8?B?MkZyM3ZJV2lSb2R3aFVhMm4xeFhNcUR3aTFnMHNtbk02VmlmK3lxNUt1Tm82?=
 =?utf-8?B?Um51WGs0T1lReGNIalJEa1BwMFNxWWF5ZkNLcWRldVBTYkc5dWU1U0tkdGxE?=
 =?utf-8?B?THdmWlBRY1BoRk9Md0ErREhZamZ3R0VLLzNmWWE5ZlZ4UmFvQW81SXZuT3FQ?=
 =?utf-8?B?aU9KeDI2azliQ1NqK0RPLzF6WW5LVnNBdklodEJQZTlYcXNWT1JvOGtoMHlv?=
 =?utf-8?B?MDBydGtFcGJOQmpFSytBYW1tWURjZ1pIdnRLQ01CdHc3RlRwU1NIODQyNVFz?=
 =?utf-8?B?c0F1c3VZT0Y1R1FPdkZaOFc4V1p6YWVUMXdmdHZCOGh2c0pCWkk3TDlhWHls?=
 =?utf-8?B?SWplUXkxbVR2VEIrUGtvSGhFWjVLZmJFUStlQ2RTcEtuZGlXMHJUOHM5bnlK?=
 =?utf-8?B?S2Q2cDdWZVNJN0txRXNhb05EdjhUM1VTNmNQeUdOYmc4aWFXQkxGRSsyME5a?=
 =?utf-8?B?WHZYVjI1Q3gwYmtDNXMwL2I3YUN6aTBnRTJLaUxNN0xjNFVwU09LSVFCcXZq?=
 =?utf-8?B?aWhDa3NPK09CZjFBYjNUVURWN3lNUW5OaXFwczR5ck1weE9jQ1BvOUlCUTBt?=
 =?utf-8?B?TGIzU0tMTUFBeEptdCtHWjFSVTZwZVFTTmF2R1hFM3dNdFYxb3lxRmtyYVlX?=
 =?utf-8?B?S1oxMFJyb2lYS1J5NEVtdVp6TnFKWFkrY010bzRGUjdBWGVIallMR1hiaXo0?=
 =?utf-8?B?Vk52QWJCNi9wVmp4WElHd1VDTWU4M3NIVTR1QUdRWVVsR3V3aC8zVFlUdW9Z?=
 =?utf-8?B?MS9vcTcyUFFqYWdBYWg4RmlvM2l3RWQ5dGVPVjBLOFFjTUtHbzIzNzdyWDNx?=
 =?utf-8?B?TWRWdm9uenFlalcwbWcxbmR2ckNrT3F4bW1pcXovR1UzSm1nM1ZzL2xxV0gv?=
 =?utf-8?B?MDRQTSt3Y1o4NG1IRHRSWW9qTHBtdTQ5R0VFRDY5L0Q3aU1VYnltV3AxMGVy?=
 =?utf-8?B?UUF4U3VYOWxUSDdtdUlSVUNCQnhTdDFZNjd6ZG5zTC9vdVAvTTA4bDc5MlVw?=
 =?utf-8?B?MUtoQjBZZ3JEUHNBbUprWSt0cTJiYWsyTE1mSHZvVWFwOGNEb3BSMGJ3eWFR?=
 =?utf-8?B?L2puZ2FZRko4T056N0dFb21UY051M1VpeVpMRndQNkhXVzIwNTJRaUVhS3Vj?=
 =?utf-8?B?TUs2WU1acys1dWpiU25XakhGWndSVy8xY2VsYVpFQ2FUN2cyTVFvb05BMktq?=
 =?utf-8?B?aWU1cGNQaERVeXdyVnZHSW5JUWJrNUh2RzBpQklqaEx5TkFTdW9TSEV0SDNS?=
 =?utf-8?B?elJuQm1TNFViMmlJQzYzREJvcG1aL3B2eXBjZjJjRGthcDZjVEdtMWg3aG91?=
 =?utf-8?B?WEdHZ05JSFlLZUQ0TE5WUUExZDc2bk9JQklGY3lvd21Sdk5xR25MeENlTG15?=
 =?utf-8?B?QVQ2aDNXVVpNeXVZN09uVEpoU3h2VXMxakRlVlhVMnlZY2dGYmdjNG5paGZ0?=
 =?utf-8?B?Q2pkMWZsMzdYdnEzNm9iSWtHMitFZnVEOE1CLzY1QVl5NXRZVkkvTUR1bnl0?=
 =?utf-8?Q?DjelFG7iO47a6QAQMfnjcLCWggrfmndhlPIQc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(52116005)(7416005)(376005)(1800799015)(366007)(38350700005)(921011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R2FEVGxmNWtFdlJ0S25BaFJOZ0xjYTZlWmRQMTB1SU56Snc3STFlRkgxYis2?=
 =?utf-8?B?YTAyNTVPaVBBbnZlZ3RvdjIyZDQyQTZibTFoRThOc2dYbUhqR2pqUG5GS1FU?=
 =?utf-8?B?QUZPcU9Wd3dVWXRCY09KY082ckxOMVNKQlVZRWJneC9sVTRUODR0RjAyNFhq?=
 =?utf-8?B?cDdLQXFzTHpiTjVWRUFkZFAwRHRDaXNnM2cxbGd6UW9KV0RiTlA4amcvaUQx?=
 =?utf-8?B?THdQemdIZlJBMDNtMS9ZbzlLbTA0R0pubHFPRVdxWG5kZFMrUWQ3MjJjbVFi?=
 =?utf-8?B?OTI1WjJFNnhLVzBEdnQvZlVOZFp3SXBBc0pWSGx3UkMvR1hMeC9WQjVYZEhW?=
 =?utf-8?B?UldsMTdmUjVzQ3d4bHFxNGsrNUYyMHZLUkNtVUkvbmQzM3NrOTlhS0dGSUlV?=
 =?utf-8?B?eU1UNEJXaW1EYWhZSHE5Vmd2akNrT2V4ODVFVFlBS0hFeTE4dWhVMVNjRi9p?=
 =?utf-8?B?TGdkQmQrSXJwbTNXMjR3cEMxeis0N0NSL0x4RDl2TC8yTjNKL29iZkxyZkVz?=
 =?utf-8?B?YU1NZlpoYkxXakdmamlkSms3UWk4TWhmWmpRVDNmVW1ZV1A5T0Z6Qjd1T3BO?=
 =?utf-8?B?MUx3ZFJHRHRlN1l4S3RtSHlyc2R1b3BTbnppZmFyZXNsQXkxUUtJclYxRFJs?=
 =?utf-8?B?NkptekVoelB1TXV4TUxPd1F0UGpzTXROZnZtd0pVbXFZMDQzZ3dPZUpmdDB5?=
 =?utf-8?B?NHQxbWIyK203RkpUV0xuOHEzdTBwVi8wZ2hkaUcwMTd2ZTlFckk5V1VSRnlD?=
 =?utf-8?B?Mlc0TWduNlNMa0x0UmxhcEtrejNSNmJRcXRuRjVzajhtOVEvOVlpRnowang1?=
 =?utf-8?B?czYvU0FoYVRDeThVNytPVTJpSEJkcWJtdjE3UTVCSWlGd3VuMElFUzd1OERx?=
 =?utf-8?B?M1JnVHNvVC96b1RVd09kT2s3ZHhOelk2SkF4K0Vkdm1NblA4ZzViTmpVVEV6?=
 =?utf-8?B?K3g4cm5SaHg5NVZRZjlLdFJ3Rk5XL2QrSTlPL2s4SVpGQ0NxNUNmeEk0SDQ2?=
 =?utf-8?B?VC9wd0o3WlhZRWR0RVpQZ3dwdzllYUdtYnhVaUN3aWdvZHM3QTd5MkpHV2hX?=
 =?utf-8?B?d2xBbW5FMGxxOEF2b2ZvZDVRTncrcXZhWHg2YUJmb1BGcHFnNnNBOWQwMW9k?=
 =?utf-8?B?RzhQTlUxWDgrYVkzK29SZW41TU9Oc2xLSFlaNGhmSWFxdHdBUjRTc1NkNWw3?=
 =?utf-8?B?aFNuelVFRnNLeHBIVzFXRjhjWExIaC9sdmlXTHdiNlc4aGdvdGNlWDVaUkRu?=
 =?utf-8?B?ZWxTRE40UDAzdWxSOXpTRm82em9mazU3UVk2ZWx3RUVaYlhpK1BRRjRFTWM1?=
 =?utf-8?B?S3BiaGNGZ0tQZjVCTUMvYk9OYVR5VEpSQ0MxNHJEUEd0VnAweThRUnRseDJ6?=
 =?utf-8?B?Zm4zaEJzcm9VdExlK0pyVDFXcFdweGRrUTI5NXVEN3F5RDdIRit5d0p6amJN?=
 =?utf-8?B?eXJaQ3BCUy9rbW5ENy9wUjJSaDhqcTd0cjFuZFA0YzNsWTZ2Mkt6UFZveGto?=
 =?utf-8?B?TTdZek5VRVB0czVwMmxqbTh4ejBBNDdpVkJMZzlYZmpQQmJNem9oeWVTbEhG?=
 =?utf-8?B?c2Zzazl4K0QraGs3OWZpcEJaVnMyMEJNbmZQa2JjMUtlZ3IxVUhuaVpRbWI0?=
 =?utf-8?B?SUZqQURHM05nV3BwODJVby9LbGxGUWlPRDE1ckQrSm0zc1NkVHJSYUlDS25O?=
 =?utf-8?B?Sml4cFRsTWxLU3luTnZ6Q3M2MmR2Y2lLcFNWS2ZxYzNVMWp1WDlzV3AwSmM5?=
 =?utf-8?B?OXNWT0szSjdvZjZlMGcyd2RXWWlsZFAzQ1k3Y05uNFJzL1NhYy9oMVMwTzVr?=
 =?utf-8?B?UDhwdkk4REVxQytLTVNtY0dUenQvNDU3Y240aWtycFh6R3dvWFVmL2NQelVz?=
 =?utf-8?B?M1YrSHAwYUwwaUlkNVU5WlZnQnpuSVBYbnNUNUFyejRMN3EvUXlyaUZmbFdo?=
 =?utf-8?B?ZnlPM2thVkllalJLTkJQcHNGN1FWbWNNOHplWDRUaTV1SnI3M05IL2lNRjBk?=
 =?utf-8?B?dHJLTWQ2YWRGYmVNaDBCUmJPSzZSNzRROGpKZ3ZXa2ExK0hKeEpjc3JTZDVt?=
 =?utf-8?B?c0xtc3NrbHBLRFg4V1BuK29sbHpJZjdKUlV6NkN4SkhqVUludlVMSDcrYVRP?=
 =?utf-8?Q?eQ/3zzyoUuSI3gnMabyiQmTmK?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f5ee1a4-bb1a-48ca-a0c5-08dc6c3c23c6
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2024 13:14:33.4684
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cffexWyhFxcbCs7yVHPCRoKq8Hz6oeRtownJutulL+N/e5mtXIytW8fqu18Jm+yYgRBqEfJGqV/mzLUkkQYPDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8633

From: Peng Fan <peng.fan@nxp.com>

Use scope based of_node_put() cleanup to simplify code.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/pinctrl/pinctrl-st.c | 37 +++++++++++--------------------------
 1 file changed, 11 insertions(+), 26 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-st.c b/drivers/pinctrl/pinctrl-st.c
index 5d9abd6547d0..fe2d52e434db 100644
--- a/drivers/pinctrl/pinctrl-st.c
+++ b/drivers/pinctrl/pinctrl-st.c
@@ -1195,10 +1195,10 @@ static int st_pctl_dt_parse_groups(struct device_node *np,
 	struct property *pp;
 	struct device *dev = info->dev;
 	struct st_pinconf *conf;
-	struct device_node *pins;
+	struct device_node *pins __free(device_node) = NULL;
 	phandle bank;
 	unsigned int offset;
-	int i = 0, npins = 0, nr_props, ret = 0;
+	int i = 0, npins = 0, nr_props;
 
 	pins = of_get_child_by_name(np, "st,pins");
 	if (!pins)
@@ -1213,8 +1213,7 @@ static int st_pctl_dt_parse_groups(struct device_node *np,
 			npins++;
 		} else {
 			pr_warn("Invalid st,pins in %pOFn node\n", np);
-			ret = -EINVAL;
-			goto out_put_node;
+			return -EINVAL;
 		}
 	}
 
@@ -1223,10 +1222,8 @@ static int st_pctl_dt_parse_groups(struct device_node *np,
 	grp->pins = devm_kcalloc(dev, npins, sizeof(*grp->pins), GFP_KERNEL);
 	grp->pin_conf = devm_kcalloc(dev, npins, sizeof(*grp->pin_conf), GFP_KERNEL);
 
-	if (!grp->pins || !grp->pin_conf) {
-		ret = -ENOMEM;
-		goto out_put_node;
-	}
+	if (!grp->pins || !grp->pin_conf)
+		return -ENOMEM;
 
 	/* <bank offset mux direction rt_type rt_delay rt_clk> */
 	for_each_property_of_node(pins, pp) {
@@ -1260,17 +1257,13 @@ static int st_pctl_dt_parse_groups(struct device_node *np,
 		i++;
 	}
 
-out_put_node:
-	of_node_put(pins);
-
-	return ret;
+	return 0;
 }
 
 static int st_pctl_parse_functions(struct device_node *np,
 			struct st_pinctrl *info, u32 index, int *grp_index)
 {
 	struct device *dev = info->dev;
-	struct device_node *child;
 	struct st_pmx_func *func;
 	struct st_pctl_group *grp;
 	int ret, i;
@@ -1285,15 +1278,13 @@ static int st_pctl_parse_functions(struct device_node *np,
 		return -ENOMEM;
 
 	i = 0;
-	for_each_child_of_node(np, child) {
+	for_each_child_of_node_scoped(np, child) {
 		func->groups[i] = child->name;
 		grp = &info->groups[*grp_index];
 		*grp_index += 1;
 		ret = st_pctl_dt_parse_groups(child, grp, info, i++);
-		if (ret) {
-			of_node_put(child);
+		if (ret)
 			return ret;
-		}
 	}
 	dev_info(dev, "Function[%d\t name:%s,\tgroups:%d]\n", index, func->name, func->ngroups);
 
@@ -1601,7 +1592,6 @@ static int st_pctl_probe_dt(struct platform_device *pdev,
 	int i = 0, j = 0, k = 0, bank;
 	struct pinctrl_pin_desc *pdesc;
 	struct device_node *np = dev->of_node;
-	struct device_node *child;
 	int grp_index = 0;
 	int irq = 0;
 
@@ -1646,25 +1636,21 @@ static int st_pctl_probe_dt(struct platform_device *pdev,
 	pctl_desc->pins = pdesc;
 
 	bank = 0;
-	for_each_child_of_node(np, child) {
+	for_each_child_of_node_scoped(np, child) {
 		if (of_property_read_bool(child, "gpio-controller")) {
 			const char *bank_name = NULL;
 			char **pin_names;
 
 			ret = st_gpiolib_register_bank(info, bank, child);
-			if (ret) {
-				of_node_put(child);
+			if (ret)
 				return ret;
-			}
 
 			k = info->banks[bank].range.pin_base;
 			bank_name = info->banks[bank].range.name;
 
 			pin_names = devm_kasprintf_strarray(dev, bank_name, ST_GPIO_PINS_PER_BANK);
-			if (IS_ERR(pin_names)) {
-				of_node_put(child);
+			if (IS_ERR(pin_names))
 				return PTR_ERR(pin_names);
-			}
 
 			for (j = 0; j < ST_GPIO_PINS_PER_BANK; j++, k++) {
 				pdesc->number = k;
@@ -1678,7 +1664,6 @@ static int st_pctl_probe_dt(struct platform_device *pdev,
 							i++, &grp_index);
 			if (ret) {
 				dev_err(dev, "No functions found.\n");
-				of_node_put(child);
 				return ret;
 			}
 		}

-- 
2.37.1


