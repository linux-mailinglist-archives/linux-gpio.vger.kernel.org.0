Return-Path: <linux-gpio+bounces-29743-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B950CCC581
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Dec 2025 15:54:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E7BF930334DE
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Dec 2025 14:54:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A87BD32F74D;
	Thu, 18 Dec 2025 14:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="HpPI0VSL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013016.outbound.protection.outlook.com [40.107.162.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C57327BE0;
	Thu, 18 Dec 2025 14:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766069642; cv=fail; b=l5uZK5FGdHReBIM/RyIzxH6KH5YamHtbM+ACcCxQl1Bp7xlhWCAeUBuIEFfzRaxe101LhSmQyONwlw27w4QOQ9LdVKVEwjbkZIXzPuINHiX10fvb8K0c1s9Pn446vpMOEWQZ3PVbOUHiAGv2oIxUUDAC4XgotsIQ94gaRFo20xo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766069642; c=relaxed/simple;
	bh=ZrXd34hT5bqmoyqBqtOgYK2Q43gTF+g5p72X3L7fyjc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QyTWl7ilZHGBkseC67E6/TYdGfb6N0oChuxPY7fAt9j5ZESl4kOi43r+geDYn9PJuzqccK5EnqiebJT9BkaJUSBE0uG5oF5fc/5hE+A63ZRLEW6eZ/w4+TS4wahtVc61wtUbYm2M1SCLxu9m6WF+DcVXpezxwmRcghypNcS1AKg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=HpPI0VSL; arc=fail smtp.client-ip=40.107.162.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wmi6dECvC0xB57fn4ukBNRbaaf7hpumnMLQMYlpwqIQP0U4etHMVEKLjfSVgiddMWb3adViTinvvRiD+dzXbRiQAPzHg8iXfOhyGfVwvgi40g99m+tag5sGwQ3BX0oruL0LxjX0ptnoAHCV+C0vkJ/blXVZqVBCQk027TCuibbYA83nH3dUOfJjmRgVl7CHXFe3iZagGg1fyMMWxJUhpmRbyVdblpLYm5Deb6Tdm9zOT9FU76T09P+gDjeFxQP7j2hYoOL8hDaks9ummvJou0VpkBDcfybH0QMasQIGo686ACTKqd/6+Yqdt1FyMeAmqjFgGZ16fB50fHyYn3N+/4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L7vKTTeoUuwb6jOBegA0oNX0lf+wGVFG76G7578l3ro=;
 b=nYBtxSCfjih2WPqBc8Pwv1fXfl+0oz3lXB5IZEfTLZIxmEDLsNdNPL6nmn8y8AzTIqW9IyMLCwy7hxGo/ZVgPaDkGFv3oWa5m1aN3UK3yhCdGi3EyDP2ueV7t+BNHTFVnvKY1Rv6VkAVaTLJYINyi2U/BGy8ogXtaq3SnTgXvYdFi2eioztT/quxOeVI4wCSmQDwGXGmO9CxhKw4qDm3kg7A4gm6ZdH+IZHgrjL9P+qzPahH9Qlz25hYJDEgu/cwZQ4eUi/agw81TScdk43xwmqT+iY3/YF0URbgYe0cGTS2zDDfPkiMXeigDQ2nNpBQuIiOHOFixZyAszvSmmeJAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L7vKTTeoUuwb6jOBegA0oNX0lf+wGVFG76G7578l3ro=;
 b=HpPI0VSLIYCxL9TRGa/kqk3NxrWEDknBS+v3hRIYVxGzlypaU1wmFBI3CsQs/t/yeovS0zqb6+DoIpfNR4RMYvg8fDdHZx4HWBYq7liKP3IE/dwmcOEw1SIiVG5FI4vFCm8iH8XUSkzJOf36d+DRVLn2BOErEZXoBTW9Yzdw8u97mwS5Njm1/HIDL00xBhrexmDqqYdVyg/gH0PX8EU3Q+r/2lC1RvXDGu6b1g+7ZBbJxkRuUZe/A2qyX7oQb1Urrf86lUWgKE3NnC5NYSQhrL1A+/85tM08MWICCiJJe1Qmo/wmGmpzoFA9OOTCXci/10RaqCQk0ojIiHBXQ5ko4A==
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by PAXPR04MB9218.eurprd04.prod.outlook.com (2603:10a6:102:221::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.7; Thu, 18 Dec
 2025 14:53:55 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612%5]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 14:53:55 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, Linus Walleij
	<linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Mathieu
 Poirier <mathieu.poirier@linaro.org>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>
CC: Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH v6 1/5] dt-bindings: remoteproc: imx_rproc: Add "rpmsg"
 subnode support
Thread-Topic: [PATCH v6 1/5] dt-bindings: remoteproc: imx_rproc: Add "rpmsg"
 subnode support
Thread-Index: AQHccC4hz+aC8+IZZkGsM1CDssj1CQ==
Date: Thu, 18 Dec 2025 14:53:55 +0000
Message-ID:
 <PAXPR04MB918536F2859B9A57A0BAE84E89A8A@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <20251212194341.966387-1-shenwei.wang@nxp.com>
 <20251212194341.966387-2-shenwei.wang@nxp.com>
 <f53639e8-feef-438a-9b1a-c349fc17d0c6@foss.st.com>
In-Reply-To: <f53639e8-feef-438a-9b1a-c349fc17d0c6@foss.st.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9185:EE_|PAXPR04MB9218:EE_
x-ms-office365-filtering-correlation-id: bb045e35-2e5c-4a3a-9970-08de3e45445c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|19092799006|376014|7416014|366016|1800799024|38070700021|921020;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?BoJ1uY6XmdZZoHfYuAGMBzuKTy/O/Kog+RFEGoOK6p62Gpx3JRp+wXXdeXuc?=
 =?us-ascii?Q?ujdHJGUKxqO4QWv2lh56rGtTwcKAneQZlKlHq5VI9bD9pBCbS9KrzAWesvx6?=
 =?us-ascii?Q?ttf7VUCIA/SOP4wRN4lffjSRAUr488gvB8I7yxrkLxfJbsdByKDQZrNpwZCm?=
 =?us-ascii?Q?LOrlTBeCKNmqtTYbz9zLMK3URXHkLwtspVJnWIS0GRKnRTzaVvfjJibe6/Gp?=
 =?us-ascii?Q?Xf/R9rmwaJiwr3tCymgFHQii3CUz5IU7bxKJWSyDNXLbkkIIvunivWY3zWbW?=
 =?us-ascii?Q?l9HMYO2/lcFz9KmcWtt30U4WUZpJdDTbebseaPJwU0vyRS42n7F22ufPrbXM?=
 =?us-ascii?Q?Gy5CZReoJTlKvAxOhoNXoqGoeONmXkg7++rAqPB2kORey2z8bGpsI0lfnsNn?=
 =?us-ascii?Q?tZG8WItC50rF4Bat7r/xj5pOC22LdGkpKyTSG3BbH39xC5WRIsLtwEsM5bSX?=
 =?us-ascii?Q?f3NLY9ZrL8Rd34ZS3V1WcAneuF7RkIl74G0V2hpxT421bzdLEQXgU8WkW92l?=
 =?us-ascii?Q?TRSAfZvuuq/egDUERC+EP27CFYP3OjBNYMwnBCnSBYHSrQeHKr5qWy6s7hvN?=
 =?us-ascii?Q?dV+ajkh3smacFmaHNNKYTHg56can3MC0QsQVk2nYC2cZZKFwXoh7V0Wfobpn?=
 =?us-ascii?Q?bjQvep1QXrk+1r9FT/pEy4VO5mM0VxuX/ofvcMBKMBntYEsKxVY8tSB78vTB?=
 =?us-ascii?Q?1jBSoBKuSUy9GbLDWmTMOX8i2/vq/bLJk5bCeSFSnJEGx/cPWv0sUmFVmGRK?=
 =?us-ascii?Q?rH3TBgvAHUwNN9lMI8Cyi8oDkdM4rtjcehdIPJADY5m+eRF0bD5qIih6I3MX?=
 =?us-ascii?Q?syxTShZFBoM8aOV091YzXZaCF+jCn2c84cbMYpqJU4u3CR/hvzTpMlTA1L9n?=
 =?us-ascii?Q?buiX1aQ9cMoSjOOG38HuaUFGufMbljrlMLCVVv202IGZ9Yd6kSuBtWb67Kbr?=
 =?us-ascii?Q?P2vXIneT54a8Ww1vj89NxEJFwkdqjAfTInm+2d8kDS0eFtP/kZWnDkDGnfrd?=
 =?us-ascii?Q?gAZzUQ6XIF8VspWBtyNAkzzN3PkK0NY0oY4t97li70sA8ufQf87i2+aRKh6+?=
 =?us-ascii?Q?Ac0+AcC+XMflLEhod0AW7bgzzNs+60uXjcJ3j2TPLR9iSP2gcCDhdurXAgkq?=
 =?us-ascii?Q?ijzIcf1PzfNblWg+xPUF7DON6V9MGP3iuRpignc1KzPOxFHWFOc3BfXUurAP?=
 =?us-ascii?Q?jiq+Y0+GrcBxd3mH5s0lrzlGjfmJksYBlxRpALFp0R6aP2yjDbn2FEJYRCxu?=
 =?us-ascii?Q?k9IicrKwDkWMjlMInsqzgPcbADZgEzjHCK/iN9ZC1Hlso7j6dsK7K9K8n4Nr?=
 =?us-ascii?Q?OGRZI5didNOcwgTbTs7wqB/ZzEV1Biy5dIphyBHCkD6HK8uLY0+6FenWRASU?=
 =?us-ascii?Q?x4u4edBAPXz8hZ+H9IViPngkDwUrUwiFuZoey5ztAjZUZxWpfaElgnOa0y0O?=
 =?us-ascii?Q?bGuLBSAiTS86yNO3P9DVnM1ViY2T2plQiEybN20/HEahR+Rbb8BOlZQBW+L/?=
 =?us-ascii?Q?HTyzbK2hEGDmkCt6nZj5Aa5oGSVgN4IuGYA1cBloB1nGGl3q64rPhQAZkQ?=
 =?us-ascii?Q?=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(366016)(1800799024)(38070700021)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?+fHj95mh4UyEoK3dFKXOH8Egt4luRI0uL1Q6Ill71Fe0u+IpaE23U2qZQr6b?=
 =?us-ascii?Q?OrCnx/bpN0KQusK5GVtAIHNkfH03LYrAvOXIf1PaxK+oFXn+U1XqedIakh1j?=
 =?us-ascii?Q?GnS/XAcDXBapyMQwtMZsvktJCtqWW8RW1a5/XqxREiZ2u6iGffCTMtxd/2bM?=
 =?us-ascii?Q?HnTstlIARAwk4EjGw/anlbC5NLMu9NYilyXHTXPGPaxulECMpIvCDXjpXHDL?=
 =?us-ascii?Q?Xa8reKoC91iXrAnOBtdgwfyaO75uYQ+uGUsRHB/l8tzsMIHvmbcuj+HKvCNL?=
 =?us-ascii?Q?o0v+piZsY0cffCVMzZV/CREaaJ2bx5R8030Ldo3ZchcRaW8wBnp5//g/nPVi?=
 =?us-ascii?Q?1AFdHA1NPdNLXS7nG8Tb59S5TiNZS3NYWliW+nY/17hcVBYpYe0Qu85GLKM/?=
 =?us-ascii?Q?TIjsImbyjwb/DFGyCY/s3PpTRhFv32BBVxxIPAEQmJhrUIoh20XDrrql8LgS?=
 =?us-ascii?Q?06IMRRAUH9bv1eR3pCYKJy7oR91FvZCOn6/Y/dYoq7l2wUg6wJGaZy9v2T+d?=
 =?us-ascii?Q?18jndbdRjzTgXaIWRgZqeVzcvnKGyAV9v/YuDxrneuOMyNIEVxUBexIROD1b?=
 =?us-ascii?Q?xEPQMOKQ8cQuGq6YJ+2X2mDpKNOoCymylw4Km2DdC7HnFtOWMtAOoXz9ydV1?=
 =?us-ascii?Q?dmjvPXEdXIaqlLAd6ADl2nru6Jc/jbNFlqFccnsuY2d4m0h2cL95YxSyrmBB?=
 =?us-ascii?Q?FxlktJbL896wmqr+R83WhqRRNgAVBAlx+CTIRs27RQhsGpNtJ1GEIMx4NtUq?=
 =?us-ascii?Q?2mpZ1bgTc8md4jWsy4pQROWXXD0cTMmyKCIJ7VK6gExMY2TD4RzxCeenkbgb?=
 =?us-ascii?Q?NFcf8IChsXhpgz6C6m/SFtwTz5On7TIqgj1/pOEAImtvAZkqh6SCQcKoC/vV?=
 =?us-ascii?Q?MwjQt+gRs5xOAHulUlwY5vXOx+hyGt21WnQZdjczmPkvwQlUKnbwtwY781ss?=
 =?us-ascii?Q?0uL9MUx0ddKM3SKE0FnjQPkZqpxWpO6dpR5WH1AFcfkCyQ7FYN8Rmjd7jwMJ?=
 =?us-ascii?Q?m4QKqJCFpaKJtsMsM+KhEhMcWkhQr2ywttR11xpzrIIC6yhaTZiLYPpcViGN?=
 =?us-ascii?Q?LiqBbmjO2zbLrqFDvtHpGXqoDCA7nZpsCQyitjP+aBGjIbg4f2Io5iLxOTzK?=
 =?us-ascii?Q?J3aXPXxXKaCcfRB4Wx1X8xgwexZJr1Ku4TPkhZC7Aan9WuKQsPljOQu8/I9g?=
 =?us-ascii?Q?SqMkLU2qsEnsFWECrtCo0vRmm6mnhH1CGJiaGkEjvZH4GM6WP5R+uYKtNw1v?=
 =?us-ascii?Q?GK3DtgFfTeB/EAgRsx55qSoCO001D8y16hm5e4KSbktDdKnvuMFWad3buLWz?=
 =?us-ascii?Q?poemMCHI5rbogPb2H4DqdZv6yNJKGtA3W9lnwpp6UiC+BgbLmtaa+nbNxqfT?=
 =?us-ascii?Q?xHOpLqiurxL8K/YhGo8yjPZ5oTtvH16Tu832xB1nntk9y395Zq9lHAkOfOVv?=
 =?us-ascii?Q?C0XI+vwdPiD7HnaEYIqhCiCzsRQtnaEG9tb0ZW7RSPJYXQYHioTHZalsncJB?=
 =?us-ascii?Q?uokRpse4y5ldMKNMqbJZEaaxZwnqhQE15CYVIg2xXZzpR3FBaMwEWMI7CPL3?=
 =?us-ascii?Q?+sdocv4MJbKuEh6jshusdst7jd5JDHonS06rrzQS?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb045e35-2e5c-4a3a-9970-08de3e45445c
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2025 14:53:55.3628
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: syUbHG4HTXw4i2ob2fysttm9bFVzOJfGsezXVAkkzvG7x74zj/yTXEIH+3c2sRaaeneSypQe73ChAILrsvKWHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9218



> -----Original Message-----
> From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
> Sent: Thursday, December 18, 2025 4:30 AM
> To: Shenwei Wang <shenwei.wang@nxp.com>; Linus Walleij
> <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.org>; Rob Herring
> <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor Dooley
> <conor+dt@kernel.org>; Bjorn Andersson <andersson@kernel.org>; Mathieu
> Poirier <mathieu.poirier@linaro.org>; Shawn Guo <shawnguo@kernel.org>;
> Sascha Hauer <s.hauer@pengutronix.de>; Jonathan Corbet <corbet@lwn.net>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>; Fabio Estevam
> <festevam@gmail.com>; Peng Fan <peng.fan@nxp.com>; linux-
> gpio@vger.kernel.org; devicetree@vger.kernel.org; linux-
> kernel@vger.kernel.org; linux-remoteproc@vger.kernel.org; imx@lists.linux=
.dev;
> linux-arm-kernel@lists.infradead.org; linux-doc@vger.kernel.org; dl-linux=
-imx
> <linux-imx@nxp.com>
> Subject: [EXT] Re: [PATCH v6 1/5] dt-bindings: remoteproc: imx_rproc: Add
> "rpmsg" subnode support
>         syscon =3D <&src>;
> > +
> > +      rpmsg {
> > +        rpmsg-io-channel {
> > +          #address-cells =3D <1>;
> > +          #size-cells =3D <0>;
> > +
> > +          gpio@0 {
> > +            compatible =3D "rpmsg-gpio";
> > +            reg =3D <0>;
> > +            gpio-controller;
> > +            #gpio-cells =3D <2>;
> > +            #interrupt-cells =3D <2>;
> > +            interrupt-controller;
> > +            interrupt-parent =3D <&rpmsg_gpioa>;
>=20
>=20
> "rpmsg_gpioa" seems not defined, or I missed something?
>=20

That's just a reference alias in the DTS example, so you can ignore it. I c=
an also remove=20
it in the next version to avoid any confusion.

Regards,
Shenwei

> Regards,
> Arnaud
>=20
> > +          };
> > +
> > +          gpio@1 {
> > +            compatible =3D "rpmsg-gpio";
> > +            reg =3D <1>;
> > +            gpio-controller;
> > +            #gpio-cells =3D <2>;
> > +            #interrupt-cells =3D <2>;
> > +            interrupt-controller;
> > +            interrupt-parent =3D <&rpmsg_gpiob>;
> > +          };
> > +        };
> > +      };
> >       };
> >   ...


