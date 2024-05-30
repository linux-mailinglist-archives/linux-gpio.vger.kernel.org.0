Return-Path: <linux-gpio+bounces-6907-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 423A58D475D
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 10:42:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6D0BF1C22C33
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 08:42:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3E591761A5;
	Thu, 30 May 2024 08:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="sle8FNIC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on2080.outbound.protection.outlook.com [40.107.7.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1E3176196;
	Thu, 30 May 2024 08:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.7.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717058522; cv=fail; b=cxIzOeL88OCInpFKVhi44iR7gO6kEqWZyraPGSNeKOAG+NX1du4tJJ32Lni9VeF2LxjX2RmRVE6WSb7pEpNyjnW1a/NHYUk86z6bFSFehCgAxVRqmE5WFwelZ26K0m2jZBqa6+hmBC8NpFGozRMzHU999il59jNuzi2IWDuuDGA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717058522; c=relaxed/simple;
	bh=5i60wpNbVCIswNe3ZHESeyc5kUsfLyNjoUDcbNXd/nI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=iA1hfmcqBIrG44o/DyO8tgwzny6Y+6Qb1FDchS8AhI1RSZR7LEHKyldVOSesdCe6CwYY8ZKgxtJu+2aBe9lbfpj1OBjR4o4H/8BqJMdKo4VjLqV8TxPDIsX/Kxkqj/Si+Hdvc3Nwm75kSLlZdcdQG6mpD782Co1nCOA9ILF29hU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=sle8FNIC; arc=fail smtp.client-ip=40.107.7.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eLM6o9X5PCcXG/pW6L58VP5ctqpvwOKZNODgOPoBNSpKOejd3YiHKm/6WFSFpHlEemip3nCL0cZGeBdK4XG9dR9/mRKgBVXJDnu0feTAKZhRzw6alJdsg5eUhIVJcF8zd36hob4EExIeE415xABRoqrzPw5Lc/+b2MR8rYnQq4w8dSNuwVoh62CQYVxXR+YAc8KktEJQf2OOGAPag75UbfNgaK4050T4n8ODgbv4dRpovh081Yjcvr1Etn1+F47+EZ/NXedCd/5StCU+FaQ6XjHh3jqyvkkGZ9nvC3QjrEXj5zI2agPsqds+Rnje7ujpG89dNZrybX1n+2tKexCa+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C7V76UDgySDnjhV7M3fUnDlnTf1EqpZ84NRA8KW6CQ8=;
 b=fBZIate9UVjIR6Q2kYWHH5+O4zFQvl8qq+8OwwP2xBYLIdh3IK/5frngR3QUtpzj18NmpqmN7Af5Hed03+P2cwokyrJr+ebs4286+QRNicdbbBDNUrhs1jTuwa9DhrZ3iy7puPhlAs7Wkg5Te0aUzqZdzIdfSPQ+sziFLrM8/lte/UBo9eb69tTv62A9WyokFF3C61jGQEcpIdow7rgMI1/QoWNVinmPa7J2553kma41pW35biiIA4YMqVEpBbLwx6oy6L+KEPMML57PrgL69YmKCDVcxAjTXlIH2WKzRGMhVEYulvsbSF2QSIJoD27anHC2K2xmlqeGZrJ7RZUyMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C7V76UDgySDnjhV7M3fUnDlnTf1EqpZ84NRA8KW6CQ8=;
 b=sle8FNICGW6rx7op6xwd2GQyyRBOGZUXliOeiuuCkdS0yttlqYFEZtbqbLtTfyPTzyKC4sQBw34WOQQkw7kwOwPD5JeBrlLcy4K7+P5+BBiKB5EDAtzmzIc36N1ewghn7UOVhNhooTcX0hJEbsinsw0UCgocW4BwwvAVlMKx6mA=
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DU2PR04MB8856.eurprd04.prod.outlook.com (2603:10a6:10:2e3::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.19; Thu, 30 May
 2024 08:41:55 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::557f:6fcf:a5a7:981c]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::557f:6fcf:a5a7:981c%7]) with mapi id 15.20.7633.018; Thu, 30 May 2024
 08:41:55 +0000
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
	=?iso-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>, Jacky Bai
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
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>
Subject: RE: [PATCH v2 04/20] pinctrl: starfive: Use scope based of_node_put()
 cleanups
Thread-Topic: [PATCH v2 04/20] pinctrl: starfive: Use scope based
 of_node_put() cleanups
Thread-Index: AQHaniTZ6VNSLl9dJE6yR3D8reUn1LGrRxsAgARWhwA=
Date: Thu, 30 May 2024 08:41:55 +0000
Message-ID:
 <DU0PR04MB9417AEB942C1EDC053B3894288F32@DU0PR04MB9417.eurprd04.prod.outlook.com>
References: <20240504-pinctrl-cleanup-v2-4-26c5f2dc1181@nxp.com>
 <96beb071-ec2c-475f-8fa2-d519a1b1dc28@web.de>
In-Reply-To: <96beb071-ec2c-475f-8fa2-d519a1b1dc28@web.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR04MB9417:EE_|DU2PR04MB8856:EE_
x-ms-office365-filtering-correlation-id: a17c9bc0-8824-4b88-17b4-08dc80845c67
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230031|366007|1800799015|7416005|376005|38070700009|921011;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?vwWKD5R/ZPNz7hT4YSpXw/38Yx8+28e/4XLE1fGHWRyd8PiR+xTbwcuZBo?=
 =?iso-8859-1?Q?IfrDgwKT5BD6uj27ZmzTsJjhbo06pgCe2p+5ueSPZq1YqfzfSLKcVb4Txv?=
 =?iso-8859-1?Q?YW9J2FDqeHpRo5Wh+zxswERh/JDlr7JSfn2xg5r75G14rvV1Mn/B4gho9x?=
 =?iso-8859-1?Q?FByN+pg1Nx5GulB5XRwP1p/PUPq/TD8C3HdxpH6FF0giXHVcL933U/8frQ?=
 =?iso-8859-1?Q?tne6V+6Kv2qtCk8/fnkyqwAGblQyjzr6EnvVtjpc0jdzbw8IDUCcWlvfj5?=
 =?iso-8859-1?Q?MVDFNrBKP0yy7XiysiDAnfHYr5ZPtyecP9lN2laEDGbh/C12QS7CP8RWm0?=
 =?iso-8859-1?Q?TEPwaMUPlXsyuehsMDMMSD2/gt1EfjX8aZrUKH4X/z7vXuH4VwZiC0gimq?=
 =?iso-8859-1?Q?v2HCNKmDltkly/EOfFW89mQKMjEQHvlLak3SNiDt293JPEX303rzfW5rPF?=
 =?iso-8859-1?Q?0k1FhBVlP9vS+TrU45/zCDSHHWd6S2JF0I6cbaetbTx66+FB1pSr23qFdD?=
 =?iso-8859-1?Q?3TfQFbEwUwYAVSLoW6k2B6bmThXbzkowaNb/c10/tmMjnppYvkdbTenC52?=
 =?iso-8859-1?Q?Cdsj+gcW8uLjEyffChAAlYByF4SPlAEsj9Qe+lBizlQNNq/n0UlCQkPxWx?=
 =?iso-8859-1?Q?l4PepLBwMo0BOx7un1f0vrDCq9pE12of+lpaB5r5uRV0c8papu8mlGB5qc?=
 =?iso-8859-1?Q?B1ha8PFAmL2hdEoEvSq4Th9oFUSXcIMXFxieRSCs1HJg33mTHdm3lis87z?=
 =?iso-8859-1?Q?s5uRCgTx3EHskuAwupNkYpPAf0BNv6IYHprWVdTalE5o5cIbm0TW8hYQV5?=
 =?iso-8859-1?Q?bxw45C7ySSSKiZ7ZMYz78VxDn+zonDHyjE7RwUX68Tida0Yq0NlDcjBOu5?=
 =?iso-8859-1?Q?/go8rZA2AvZQUdIyQ0wRhMBAtQNXLU4ctJzN0BF7QY9KNSso0FHEw1S0YM?=
 =?iso-8859-1?Q?ucAHjPRW5gn2oCFyU6SnWb1uupK4wo8e9v2sJuySac6m76sdRG29Tk7h51?=
 =?iso-8859-1?Q?TP38iTPxL5HwW3Z5TsYRU6nQG8GRG5gFGY32D7qKEIR5jxBo3LvyhdLJVT?=
 =?iso-8859-1?Q?Jro7avHMWag3j/4EwVI610Cq487BV7fzAIuOdzcAuJ8UM0BZxtic6Nw6E3?=
 =?iso-8859-1?Q?M1nRVc/6bjBejit2bntSKUVwxy8QgyJUJm7+tlGR25ky4FIMXfrcJGJrN6?=
 =?iso-8859-1?Q?IF6ea4jFvnQ29wlIijDLianGtmRpWEsJeABs6NNOeh5dAdGsMfNb1i+KjX?=
 =?iso-8859-1?Q?wtp4WLMYNtrAfN0I6RDzyEgwInNbMPrcCNUP0yWkJBjsI6a/8vzZuK02ez?=
 =?iso-8859-1?Q?6ephtZO5Ay3TtT62mCjJLqTS7POz5oZwLPqOmDVw3xhzZwQ=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(7416005)(376005)(38070700009)(921011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?erJcNYauynazoXLI4h3eC4/icEZgxpYRnfumI3n1eMrkZDIvW7TdeZflAT?=
 =?iso-8859-1?Q?cOHo0hsA2dNZIdzXdLMo8H5SDvVG04NOMtx9SwyqOlbVepcppZYuL4WhVq?=
 =?iso-8859-1?Q?haxk+DyZEQotGC4j3LnKaCTLv51AWQOQkng09eiqrkv51dFI2DsDZRr8DV?=
 =?iso-8859-1?Q?ADJKR3lzvxfnZukzPz5C6RFXqkpuioUVxns+R5F37CEs1zv9/OWJo/rJnx?=
 =?iso-8859-1?Q?uqx1JqxjUAXLobVLbFR1Kddugkc/0bcmCW58XnDK7DIAXybr+HK8nAJPtB?=
 =?iso-8859-1?Q?hF6xH/9uAy4drsrayplgl54CJg18HsMVsZZhK/mDpW2pMFt3VNIKx6A/tC?=
 =?iso-8859-1?Q?xWz1IEEXrsGC8U0aWAfnwzBBU9qFpE87m6W4LMrEhkf8BxE/P2HBP+k/sn?=
 =?iso-8859-1?Q?z7qEu/Ud5mzrok6ll7JzrInpdeNn7DrY2qbN9tkAF7KPamcdqimblT1Bea?=
 =?iso-8859-1?Q?N8RdAZL77KI0+J5bpK8rx49hRrEn2iHdlzA+ElA+t1XspvAld7giKHf076?=
 =?iso-8859-1?Q?Py1FhebVhQFbBtdz27Mv/N2SixBneo9CmGGEHSm5OinAIltOnQ7WbmoBul?=
 =?iso-8859-1?Q?GmdTVRNWMfmy0JXxwAHmbiwUNiJKmMsKd811bBKh/oJ9TXiWvjm1ZwWgbH?=
 =?iso-8859-1?Q?LfOfL+hjSOUs+RtK/xRNcBHDBIrY4Olb7LwMaQBDCuYhusScrlr2kk6gxc?=
 =?iso-8859-1?Q?2ZAcAieLqiFJJjglh7gc+ZuZeLXdg79sNpDLXvPypC/5kZHwrEAF9AOUpv?=
 =?iso-8859-1?Q?QvxCmaWJ11kbowLKxC+2xKCLjl5aBNitaIeTpyLLF1VhfN2DBH+Tuw+BbX?=
 =?iso-8859-1?Q?kXLhup0NO8AtoEKcFLF1g1NsvN3jcbGBdp/2jYn9KR32fjNyzMKFBy/Wih?=
 =?iso-8859-1?Q?tCLNWwk0KPtp42w6N9fPTTLmz9RH1Ly6exvfMmZERZ94BUB9BpGWz62+GM?=
 =?iso-8859-1?Q?BJMMTs27Dr+ps5wHGsvNpytYvWxaRmLBk4ttBvw/a2K20VJD+p9uA2go1Q?=
 =?iso-8859-1?Q?7knc/TwdNLGU8d8Ur8R5EY2fwNIfR6t2TulfwDbxcgL/LJ5BlyKIyPLtEh?=
 =?iso-8859-1?Q?qCvcZbXUFvHMsSKZscMeCjWHE8gXXzw0IZpZkA+1h1OCeL5z0IfeaRai9r?=
 =?iso-8859-1?Q?YGUQOcjnXsGOhbL4BBUe2EEYlrK4hFucOlEv8meJ1V2dlJCBkjtXO8oHpy?=
 =?iso-8859-1?Q?8Ma3u9+HxVSjr5RhqGGd4LeVQvo4llWvOiDLrdfDRe4GW1V5sZ3amZ7Cyt?=
 =?iso-8859-1?Q?xasGfth9c70/SfOAF+q2PTNL88ncgUfbDeX+hxlxb3TgSgPUfo+Fb6N4Am?=
 =?iso-8859-1?Q?ct4pg2/vV873tXfU8xgFud38F0gXgD7UHXTeX7eqmXXVcPtNBCLum3SHr3?=
 =?iso-8859-1?Q?PNWDpvlMYKxZE+KWRt3RfxFCBoN2+XtxBDwYhjVyeJKEd6ZbQYHcV6X5Ph?=
 =?iso-8859-1?Q?q8qKSI9dxUh9ij4GfJFtaeSp2a5ARSCEX/+fKp9LCeatV2sPKRu7RzMkmX?=
 =?iso-8859-1?Q?exzOZWPvMMc7AVmkpdJTOMa3rMId30rScynljpx8dYRT2AcBRSGVYXArpS?=
 =?iso-8859-1?Q?G2WzNg0fImm8leDAOJHwCvYW31q45+V+8ueY8BZ8LYuLrMmYtcdoB3khgi?=
 =?iso-8859-1?Q?AcgN/9Ev0yN7Q=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a17c9bc0-8824-4b88-17b4-08dc80845c67
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 May 2024 08:41:55.3845
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qoG7dsrkr9oh8mmGoXZheZDICE9EMpxy2yp66DuVW7+/rB4ezjGSAWkRYjEBeMcyFDWSkwcrSeju14JZyQYWBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8856

Hi Markus

> Subject: Re: [PATCH v2 04/20] pinctrl: starfive: Use scope based of_node_=
put()
> cleanups
>
> > Use scope based of_node_put() cleanup to simplify code.
>
> I see opportunities to improve affected function implementations another =
bit.
>
>
> ...
> > +++ b/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c
> ...
> > @@ -543,18 +540,18 @@ static int starfive_dt_node_to_map(struct
> pinctrl_dev *pctldev,
> >                     pins =3D devm_kcalloc(dev, npins, sizeof(*pins),
> GFP_KERNEL);
> >                     if (!pins) {
> >                             ret =3D -ENOMEM;
> > -                           goto put_child;
> > +                           goto free_map;
> >                     }
> >
> >                     pinmux =3D devm_kcalloc(dev, npins, sizeof(*pinmux)=
,
> GFP_KERNEL);
> >                     if (!pinmux) {
> >                             ret =3D -ENOMEM;
> > -                           goto put_child;
> > +                           goto free_map;
> >                     }
> ...
> > @@ -623,8 +620,6 @@ static int starfive_dt_node_to_map(struct
> pinctrl_dev *pctldev,
> >     mutex_unlock(&sfp->mutex);
> >     return 0;
> >
> > -put_child:
> > -   of_node_put(child);
> >  free_map:
> >     pinctrl_utils_free_map(pctldev, map, nmaps);
> >     mutex_unlock(&sfp->mutex);
> ...
> > +++ b/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c
> ...
> > @@ -175,18 +175,18 @@ static int jh7110_dt_node_to_map(struct
> pinctrl_dev *pctldev,
> >             pins =3D devm_kcalloc(dev, npins, sizeof(*pins), GFP_KERNEL=
);
> >             if (!pins) {
> >                     ret =3D -ENOMEM;
> > -                   goto put_child;
> > +                   goto free_map;
> >             }
> >
> >             pinmux =3D devm_kcalloc(dev, npins, sizeof(*pinmux),
> GFP_KERNEL);
> >             if (!pinmux) {
> >                     ret =3D -ENOMEM;
> > -                   goto put_child;
> > +                   goto free_map;
> >             }
> ...
> > @@ -233,8 +233,6 @@ static int jh7110_dt_node_to_map(struct
> pinctrl_dev *pctldev,
> >     *num_maps =3D nmaps;
> >     return 0;
> >
> > -put_child:
> > -   of_node_put(child);
> >  free_map:
> >     pinctrl_utils_free_map(pctldev, map, nmaps);
> >     mutex_unlock(&sfp->mutex);
>
>
> 1. Exception handling is repeated a few times also according to memory
> allocation failures.
>    How do you think about to use a corresponding label like "e_nomem"
>    so that another bit of duplicate source code can be avoided?

I have no plan to rework this series for non-accepted patches. If you have
interest and time, feel free to take it.
>
> https://wiki.se/
> i.cmu.edu%2Fconfluence%2Fdisplay%2Fc%2FMEM12-
> C.%2BConsider%2Busing%2Ba%2Bgoto%2Bchain%2Bwhen%2Bleaving%2Ba%
> 2Bfunction%2Bon%2Berror%2Bwhen%2Busing%2Band%2Breleasing%2Bresou
> rces&data=3D05%7C02%7Cpeng.fan%40nxp.com%7C293bafdf40524fa4655b08
> dc7e58f6b2%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C63852
> 4167804502915%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiL
> CJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata
> =3DKb5cz6sVxW1TNfQ8MM2F6YLIIztyjvW4wULEJLYKRM8%3D&reserved=3D0
>
> 2. Will development interests grow for the usage of a statement like
> "guard(mutex)(&sfp->mutex);"?

I have no plan on this.

Thanks,
Peng.
>
>
> Regards,
> Markus

