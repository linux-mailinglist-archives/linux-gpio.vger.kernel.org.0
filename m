Return-Path: <linux-gpio+bounces-29855-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF7BCDA9E6
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Dec 2025 21:56:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CFE8130221A9
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Dec 2025 20:56:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 559F2350A23;
	Tue, 23 Dec 2025 20:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=nxp.com header.i=@nxp.com header.b="SFyq7DHn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013056.outbound.protection.outlook.com [40.107.162.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FEBA34EEF4;
	Tue, 23 Dec 2025 20:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766521256; cv=fail; b=TBJksYbpeDGR9EkiLrRYFH7jnGyWnNvCMYHF5K+EnMuGTg+RwAaet7AkZN9xVk3VCspt/oLEV60BzV4D+LXM2/ZV+aa4gbVYGF767fFQseP7FufV2Ze5HfrYrmVBbcQbbE9l/EVCNNEaItfH5znXZ49rv7PE42ZbJjCYqYrWcSc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766521256; c=relaxed/simple;
	bh=RQABRgiDZVEI1sWNpz8N7LnGZtCc6L/ylT24WxgkATQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ODw12aFvDCnvnUCV1gHqdBxQbFF8Ztif22lBtC6t2FaUaMylL0SopOoaiF/nXHY2nmjpO+EG7bh0E5TFutFR24G9E5Rkmrz7tyWP955YjFw54/NyN0qv1mC/8LookA/c3Gf8OG0g4cFecD7g/nAm7IaajXtSGP1A9V/zMin/M2U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com; spf=fail smtp.mailfrom=nxp.com; dkim=fail (0-bit key) header.d=nxp.com header.i=@nxp.com header.b=SFyq7DHn reason="key not found in DNS"; arc=fail smtp.client-ip=40.107.162.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yMcLWxczfQdWhud5ddE9ehR3qfuMFMzlzZ5JkwWg3Egjf00SrOQNNm+hM3HCx0Npug57/eSSsPwgJnal9+d7mK/bs14VQqpd7R0LEIoP4mig/Ozoz+FKEF0T1b7njSfc7gwsoCWcDiB+vFYcKaLk4Nj+1sBfKKcs99j6of+N+Bu+JRhpQY2+ww8C+TwTBL5IAkH/J/jhg81tviBXaNdMR3+CTUoEmPpDyaN0ccshBJqSjyXbMK4xam5REJG7BtrQ5Uicz2jwDhJuCPxhDSv7kqF3d/hq2WpSJxnN8s46s03wIW+OegfQL4ZdwPg0wv7U265scN81JLn7yywxQFrDWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y1S5NuuxvML9//8sTdsSQEJY3YaB+KF0zwEJo+3bqaI=;
 b=Bv/Xb7YZ+DVauhARQOz7ccc2RVNgANOQ0KGzqTswO4tACin2IriR3+TAhHvNECLYqaKawMENeBZwxFnbfJaK1ldq8cP8GFtKnDOihY0ItJWJO48GMD/tjZc6KCmw0n1A3kdLAe0I8TEPvVCPvZymyza4P+3JwVTpmV8mjOmk+4AodCAS3t3/wbQgDYvJCiarLbZbM3sAr9HMzGdtvQ8QWSzKdPko6vSRyafOL1fAVmkH8qPzOHpinPBW/DqKKE+cftOKjQB3+lsE9DNvQOD/zou1FaFTj6Ruf4z1gO3IBfLeV3v9TdAiIXU1p0D0yhXWUiN6Vuhsg2GMPdupAuOXqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y1S5NuuxvML9//8sTdsSQEJY3YaB+KF0zwEJo+3bqaI=;
 b=SFyq7DHnKG2fd5/J6X2GTeQKY9VB4f87lfJHSMipHRfyKyZh63aeAlXeWCXomKKrhu5ie6tjG5fvSVL9cYWQKUCa69ppIqMP+XKIri4TLPsWziKiiUuRuUK75MVSvt+s0I5Fm1NLO6MqKtsuVP/Alo5ijlt8arNS+OsEtqXUiypdR+9aHWLQp3fZIIq+uN9qSrG3UettU+6kzlacAT/ihfX7wZAZNvxRGRvr3Wa1TwVXf2Vctj+gcSp8BALQZ0yTca+qdU/XE1ifu5grZb03LGsCFhdDMKaSYB2ruh5hvM267VeR87SacggY04yHRldH3fLG1EBXRfFIRgErFrYb8g==
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by PAWPR04MB11706.eurprd04.prod.outlook.com (2603:10a6:102:50f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.11; Tue, 23 Dec
 2025 20:20:49 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612%5]) with mapi id 15.20.9456.008; Tue, 23 Dec 2025
 20:20:49 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>
CC: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
	<s.hauer@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng
 Fan <peng.fan@nxp.com>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-remoteproc@vger.kernel.org"
	<linux-remoteproc@vger.kernel.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>, Bartosz
 Golaszewski <brgl@bgdev.pl>, Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v6 4/5] gpio: rpmsg: add generic rpmsg GPIO driver
Thread-Topic: [PATCH v6 4/5] gpio: rpmsg: add generic rpmsg GPIO driver
Thread-Index: AQHcdEmgC9js9x150UC0C7k0MUEYIw==
Date: Tue, 23 Dec 2025 20:20:49 +0000
Message-ID:
 <PAXPR04MB9185B16A2B08E739B2FB64C889B5A@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <20251212194341.966387-1-shenwei.wang@nxp.com>
 <20251212194341.966387-5-shenwei.wang@nxp.com>
 <mnpg4xanzl45lal72c6kgog7qmqgk2zcp734eqdpk3gsonq63f@vlewh6jgdjy4>
In-Reply-To: <mnpg4xanzl45lal72c6kgog7qmqgk2zcp734eqdpk3gsonq63f@vlewh6jgdjy4>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9185:EE_|PAWPR04MB11706:EE_
x-ms-office365-filtering-correlation-id: 8b9717bc-c41b-4481-df3e-08de4260c31e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|19092799006|1800799024|7416014|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?2gO0bYYt4dTvH41hm+6+ovSoR0rv2GSkUn60l2Pb7nXWuOhlccxvvJDyC7nY?=
 =?us-ascii?Q?MSmXg7A/iSQaa4mWihiKaCCr2UG//Gzi3k+lacNqIFX7PKuSEaOQKhcyON1/?=
 =?us-ascii?Q?xikgPC9RuvhyAIAPWY/QrWJJKBBBLmwHJFMZrdt5y6POHrMxMNQ/7j0He9Cq?=
 =?us-ascii?Q?tRTydMHm0ozUMz2YeYOFGJaWYaIrWiEg8du8WaICbrW5F97lg3Ry/ZybZWQn?=
 =?us-ascii?Q?lnF8IqlEM9gWsX3KPyTJRLpDInBoMujagRQ6SFpd5lY6qJn0ZlqWVPQo9bIM?=
 =?us-ascii?Q?e87lZ6EsjfixFXipXMVFiQo17kA5rso4NNwdyJmgdGA9+HZK1Ha8TzRI7evq?=
 =?us-ascii?Q?Xhhm+cCDTERzYriOdJqnC26WMExzoBaE2Yt1JSOlKPQuW3ULEgHU2ynEmwBR?=
 =?us-ascii?Q?qq2fU+oVdNvDkUSlzmo8rUIf8bxA6WxlPFDYqXU6nmVs5+yOYUPjunhQCK59?=
 =?us-ascii?Q?HwTy01/gUL7KA1ReAd3bP4/H2Wf/MnGfml+711qNTixATcmliRKKtGCGEEFx?=
 =?us-ascii?Q?RTcT/NpDZ+5bueWT6ju9Ofltks1yyP7jhEI0NZC0qiu3rhjJO4yaqxq03GGI?=
 =?us-ascii?Q?VuFN5NnH3b+49eFKFB1lr19OxVw6CWEaHObIN+DZ8wDr+krzi2xv2k4lUDvF?=
 =?us-ascii?Q?n4ozQ26ee7kT0VxLj0W1feSGBA/nDgdd0SEQwGJgnDnlLx9UEFp4IS/RNElD?=
 =?us-ascii?Q?kATf3576a0BI/74Qsg/6Xuj4YB4bk7eGgZgySxN8Rbi1GfblEKG4OIaahMNx?=
 =?us-ascii?Q?Sy6B0UIS/uRZgwdLfkM+fhyM9lgaVZh0sslOIXhcOzzPmRNtw1hLix3uZ7u5?=
 =?us-ascii?Q?9xMbkgJCVW056kBs05ClK4RuUnGvQiKjtrPpaAG3kBf6knqXQiN0IWTR9ec5?=
 =?us-ascii?Q?AyglPDEd9gEKeqBX9yPLPAfSm9uu63uTrZrDDpgK93kypQ1dBtf52k11oswB?=
 =?us-ascii?Q?EEW0Uimd18kkuFdcMuhKFcNIOBHtmV3cJ89WetneDczX7q8x+pIZYfr9HGdB?=
 =?us-ascii?Q?xCV0Iakp0jyElzZnQ+yy5+nQZUMKuAeo9JvkbLrfHUTDpfgLlpDkge8LuaNu?=
 =?us-ascii?Q?do3WHRk8I8fJe30UsJJb4985Zh3dFHqz2/L2GYmWJiFSqnwyB+E/CpuiwyMF?=
 =?us-ascii?Q?kedTLOgS9ymyr2j+6LXsbtN7GFIMR/oV+vM3pbsqFd7t5JpTnu/NQb++n1yo?=
 =?us-ascii?Q?MGwHRuhnUV/DPCbt+AhwBh4ut/Lfldp3AgxCnmwsOa7Yper5mtr5QWKpIOc4?=
 =?us-ascii?Q?lyVUbOGRl5m2EV2KQ5sXLDpQT0Yo+kWDH4YJ6G8iW+WaxTQx4+7B8kD/kqyp?=
 =?us-ascii?Q?Xz3OsE+gVYOzagU4rqJzJmodbPocM3yc/lXc0tJYKc+0Rn3nAmkwF1T5JBVN?=
 =?us-ascii?Q?InqFxXVkJtsvbdb+mTayp9f5J8uC1ABrOBWjReUTqAH++uEWjmLqpnSpkOBz?=
 =?us-ascii?Q?aF94tKo2dV13cWQesmqzRLb9xyVdhB+y5iNQ7hCiYCzI30/oLCnetW++B1mz?=
 =?us-ascii?Q?fbuR2iG5smXOvhqK1YUQNLyp27OwxBXsK1S5?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(7416014)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?jorZY8rQ5ksFbX2cpNebfJ92r7jstQbjWbdJWEzDEE/T6GNvcXd8Xon4r0Cw?=
 =?us-ascii?Q?7AbNOzdp9sxFK22WLRm9nTb8/wJkM88fwpUHJMCLUHnxCX0bYZUlIz0IWjLH?=
 =?us-ascii?Q?7/cfqxS4eQODLHyl+nzMPxcFqdGKH0yeVc9b2znEnkCcUxf8ZqxFRfdgy5tp?=
 =?us-ascii?Q?J0IPwsz4bcjXnr+eZo2/W1+3r7ADdouGn51oj7R2cDtcgh7MsIIRYiAwp2nw?=
 =?us-ascii?Q?wCap33SOHe5hCU/VtXhEQ+YrUVNitplmwKrLrDDAxog3bkHUqaF0HAkuZxo8?=
 =?us-ascii?Q?5I4DO2puSCSAAxUwOjStYdhzcstZLpHDgsD83L22Hy0+gfKmxd20WfxCvgFq?=
 =?us-ascii?Q?aO5/HUJ1CmnGRqLYz7h3i8eiG5kPuwkgPd7So3HEe7/H0PEH3DLaqR/tQHq6?=
 =?us-ascii?Q?ZrUICQMa/BV1/dQa+OvymtcuEzPYRubLF3hTwu47sOXEC6tOnE5D7W4OlhHV?=
 =?us-ascii?Q?zFsqIMijsn5o5/CF7Jo/pzulostqsx6aXOlfExIdoVgig/qFeBOZyWWw6snA?=
 =?us-ascii?Q?DLFiIrW7UqoRYsVkN+tuXtKsf/TJtVDi8nYk7aZijHExcOL/cgHq0oI5D/Df?=
 =?us-ascii?Q?peiYuitJrUPl2NKis70N8MBQD+lQmPTmm4RPK+r9zWIf7ZVTjPWCQRxlP/22?=
 =?us-ascii?Q?4bKcvo1uHjJ53omRy3kd8hSu2geNo1PjQ0FFSqa6UZyK2T89kD4I+QplX3ZM?=
 =?us-ascii?Q?7EzqXpcleOvdViyqZWyLfE4w4v9huVvY2+SS0UCGnsZqwAV+oHRdCr9piU6x?=
 =?us-ascii?Q?ANFd2FBmpuAJ7VJRGhXgf/3BkPuH19hb7i/zUxwCPoicjKsnkh8p6vDADcIi?=
 =?us-ascii?Q?xg/4yCaCvQLSzwkHvbuY1vOXNrwoXGeZ6nDJFjec4T/LOM1wu4sZ29+94nRG?=
 =?us-ascii?Q?Cp+0mRTAqfu8iOcwEG8Tfa9dUfqk/t9NEcWbokTeDmXysGlHybqoSJCGHAhv?=
 =?us-ascii?Q?gkCdcso8BpH8AltL2LxxGuV+AoHyIfxBl8FWszRi6DzvO7ivy27uFwnDrG6a?=
 =?us-ascii?Q?KLw4VXfx7NyXWvy60L1tXsPlyPeZ8un1SHcBUdrkA0M8ERzViw36PMHUKkc6?=
 =?us-ascii?Q?Q9lR/n0cvMwkULQ6HUntNJp47gbFl25ipxUnQ3Out1ejrXFDJ9+nAwAEyeiZ?=
 =?us-ascii?Q?kdJBhXoLg5vuEYiXK0HP6XwYe9dqu/t1ULLqLWErF0rq8VosTsF+QpeKfjRa?=
 =?us-ascii?Q?HrCyvf+NsbIGJgxl7C4wanQ0ZJOqXB63yWkbmIK7D27HHPP/sQqMZLRpQMhR?=
 =?us-ascii?Q?giGbEZmZr817sWPACha33FUcQut7IDL5+8olkjpxMRmDsd00qMRgAsMj/fCz?=
 =?us-ascii?Q?PsH8hYwIKsvtaXYAG24oBXBIiJX+OrqE3rT0756KMTjTwpR72SiMJw6GUB/k?=
 =?us-ascii?Q?kRhrqVu/KFVPT3zk4gFzqQoCujnWI9ul1FAGXmx3undoINo35hG+0L0YSZ8y?=
 =?us-ascii?Q?IlVpSZGwmTTezRZap62BligPrcVg42fzyi/E0ZmH0AP0boFSKCw+8K7lTEIg?=
 =?us-ascii?Q?f83/1wMlIavVAB964ZAfIvDaozSqwQLcIDx/HFw8KhjCMPvOYJfIwfQcY5lV?=
 =?us-ascii?Q?Q5MDSrLGzsBOGUhoj9uC+3xHViW4Sh9RAob2D3rtoI9+UYAOsZ7iljtYpq9J?=
 =?us-ascii?Q?i0fgNUyjfUyh/B7HL+L1wqw581W7zhKpBdZaqCO3T3CPzx3I5ZEWRBITfbgz?=
 =?us-ascii?Q?pEiybMI3y0vNPzalf/6J0465V6BFxcZMHGN/EJ4GDppgVPvR?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b9717bc-c41b-4481-df3e-08de4260c31e
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Dec 2025 20:20:49.0900
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: puT8sAsu9yB4WSrfIclXzcax7nnOAn4657qEtsw1VYDcZP63yWp3mn9eUO/rKTJfSDClQzYvBed7SXCBWXd2lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB11706



> -----Original Message-----
> From: Bjorn Andersson <andersson@kernel.org>
> Sent: Thursday, December 18, 2025 9:58 AM
> To: Shenwei Wang <shenwei.wang@nxp.com>
> Cc: Linus Walleij <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.o=
rg>;
> Rob Herring <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>;
> Conor Dooley <conor+dt@kernel.org>; Mathieu Poirier
> <mathieu.poirier@linaro.org>; Shawn Guo <shawnguo@kernel.org>; Sascha
> Hauer <s.hauer@pengutronix.de>; Jonathan Corbet <corbet@lwn.net>;
> Pengutronix Kernel Team <kernel@pengutronix.de>; Fabio Estevam
> On Fri, Dec 12, 2025 at 01:43:40PM -0600, Shenwei Wang wrote:
> > On an AMP platform, the system may include two processors:
>=20
> We have many examples where there's N systems and it's certainly not
> unreasonable to have multiple remote processors expose GPIOs in this fash=
ion.
>=20

Agreed. There's no restriction on that.

> >       - An MCU running an RTOS
> >       - An MPU running Linux
> >
> > These processors communicate via the RPMSG protocol.
> > The driver implements the standard GPIO interface, allowing the Linux
> > side to control GPIO controllers which reside in the remote processor
> > +
> > +#define GPIOS_PER_PORT               32
> > +#define RPMSG_TIMEOUT                1000
> > +
> > +enum gpio_input_trigger_type {
> > +     GPIO_RPMSG_TRI_IGNORE,
>=20
> These aren't enumerations, they are well defined constants of the protoco=
l. I
> think #define is better.
>=20
> > +     GPIO_RPMSG_TRI_RISING,
> > +     GPIO_RPMSG_TRI_FALLING,
> > +     GPIO_RPMSG_TRI_BOTH_EDGE,
> > +     GPIO_RPMSG_TRI_LOW_LEVEL,
> > +     GPIO_RPMSG_TRI_HIGH_LEVEL,
> > +};
> > +
> > +enum gpio_rpmsg_header_type {
> > +     GPIO_RPMSG_SETUP,
> > +     GPIO_RPMSG_REPLY,
> > +     GPIO_RPMSG_NOTIFY,
> > +};
> > +
> > +enum gpio_rpmsg_header_cmd {
> > +     GPIO_RPMSG_INPUT_INIT,
> > +     GPIO_RPMSG_OUTPUT_INIT,
> > +     GPIO_RPMSG_INPUT_GET,
> > +     GPIO_RPMSG_DIRECTION_GET,
> > +};
> > +
> > +struct gpio_rpmsg_head {
> > +     u8 id;          /* Message ID Code */
> > +     u8 vendor;      /* Vendor ID number */
> > +     u8 version;     /* Vendor-specific version number */
> > +     u8 type;        /* Message type */
> > +     u8 cmd;         /* Command code */
> > +     u8 reserved[5];
> > +} __packed;
> > +
> > +struct gpio_rpmsg_packet {
> > +     struct gpio_rpmsg_head header;
> > +     u8 pin_idx;
> > +     u8 port_idx;
> > +     union {
> > +             u8 event;
> > +             u8 retcode;
> > +             u8 value;
> > +     } out;
> > +     union {
> > +             u8 wakeup;
> > +             u8 value;
> > +     } in;
> > +} __packed __aligned(8);
> > +
> > +struct gpio_rpmsg_pin {
> > +     u8 irq_shutdown;
> > +     u8 irq_unmask;
> > +     u8 irq_mask;
> > +     u32 irq_wake_enable;
> > +     u32 irq_type;
> > +     struct gpio_rpmsg_packet msg;
> > +};
> > +
> > +struct gpio_rpmsg_info {
> > +     struct rpmsg_device *rpdev;
> > +     struct gpio_rpmsg_packet *notify_msg;
> > +     struct gpio_rpmsg_packet *reply_msg;
> > +     struct completion cmd_complete;
> > +     struct mutex lock;
> > +     void **port_store;
> > +};
> > +
> > +struct rpmsg_gpio_port {
> > +     struct gpio_chip gc;
> > +     struct gpio_rpmsg_pin gpio_pins[GPIOS_PER_PORT];
> > +     struct gpio_rpmsg_info info;
> > +     int idx;
> > +};
> > +
> > +static int gpio_send_message(struct rpmsg_gpio_port *port,
> > +                          struct gpio_rpmsg_packet *msg,
> > +                          bool sync)
> > +{
> > +     struct gpio_rpmsg_info *info =3D &port->info;
> > +     int err;
> > +
> > +     if (!info->rpdev) {
> > +             pr_err("rpmsg channel doesn't exist, is remote core
> > + ready?\n");
>=20
> How is this possible? You're creating and destroying the platform_device =
based
> on the presence of the rpmsg channel/endpoint, in what case would you end=
 up
> here without a valid rpdev?
>=20
> And if this is to deal with the race during removal, I guess the error me=
ssage is
> wrong and rpdev might go away before you access it below?
>=20

Yes, the error message should be improved.

> > +             return -EINVAL;
> > +     }
> > +
> > +     reinit_completion(&info->cmd_complete);
> > +     err =3D rpmsg_send(info->rpdev->ept, (void *)msg,
> > +                      sizeof(struct gpio_rpmsg_packet));
> > +     if (err) {
> > +             dev_err(&info->rpdev->dev, "rpmsg_send failed: %d\n", err=
);
> > +             return err;
> > +     }
> > +
> > +     if (sync) {
> > +             err =3D wait_for_completion_timeout(&info->cmd_complete,
> > +                                               msecs_to_jiffies(RPMSG_=
TIMEOUT));
> > +             if (!err) {
> > +                     dev_err(&info->rpdev->dev, "rpmsg_send timeout!\n=
");
> > +                     return -ETIMEDOUT;
> > +             }
> > +
> > +             if (info->reply_msg->out.retcode !=3D 0) {
> > +                     dev_err(&info->rpdev->dev, "remote core replies a=
n error: %d!\n",
> > +                             info->reply_msg->out.retcode);
> > +                     return -EINVAL;
> > +             }
> > +
> > +             /* copy the reply message */
> > +             memcpy(&port->gpio_pins[info->reply_msg->pin_idx].msg,
> > +                    info->reply_msg, sizeof(*info->reply_msg));
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static struct gpio_rpmsg_packet *gpio_setup_msg_header(struct
> rpmsg_gpio_port *port,
> > +                                                    unsigned int offse=
t,
> > +                                                    u8 cmd) {
> > +     struct gpio_rpmsg_packet *msg =3D &port->gpio_pins[offset].msg;
> > +
> > +     memset(msg, 0, sizeof(struct gpio_rpmsg_packet));
> > +     msg->header.id =3D RPMSG_GPIO_ID;
> > +     msg->header.vendor =3D RPMSG_VENDOR;
> > +     msg->header.version =3D RPMSG_VERSION;
> > +     msg->header.type =3D GPIO_RPMSG_SETUP;
> > +     msg->header.cmd =3D cmd;
> > +     msg->pin_idx =3D offset;
> > +     msg->port_idx =3D port->idx;
> > +
> > +     return msg;
> > +};
> > +
> > +static int rpmsg_gpio_get(struct gpio_chip *gc, unsigned int gpio) {
> > +     struct rpmsg_gpio_port *port =3D gpiochip_get_data(gc);
> > +     struct gpio_rpmsg_packet *msg =3D NULL;
>=20
> There's no reason to initialize msg here, the first reference is an assig=
nment.
>=20
> > +     int ret;
> > +
> > +     guard(mutex)(&port->info.lock);
> > +
> > +     msg =3D gpio_setup_msg_header(port, gpio, GPIO_RPMSG_INPUT_GET);
> > +
> > +     ret =3D gpio_send_message(port, msg, true);
> > +     if (!ret)
> > +             ret =3D !!port->gpio_pins[gpio].msg.in.value;
> > +
> > +     return ret;
> > +}
> > +
> > +static int rpmsg_gpio_get_direction(struct gpio_chip *gc, unsigned
> > +int gpio) {
> > +     struct rpmsg_gpio_port *port =3D gpiochip_get_data(gc);
> > +     struct gpio_rpmsg_packet *msg =3D NULL;
> > +     int ret;
> > +
> > +     guard(mutex)(&port->info.lock);
> > +
> > +     msg =3D gpio_setup_msg_header(port, gpio,
> > + GPIO_RPMSG_DIRECTION_GET);
> > +
> > +     ret =3D gpio_send_message(port, msg, true);
> > +     if (!ret)
> > +             ret =3D !!port->gpio_pins[gpio].msg.in.value;
> > +
> > +     return ret;
> > +}
> > +
> > +static int rpmsg_gpio_direction_input(struct gpio_chip *gc, unsigned
> > +int gpio) {
> > +     struct rpmsg_gpio_port *port =3D gpiochip_get_data(gc);
> > +     struct gpio_rpmsg_packet *msg =3D NULL;
> > +
> > +     guard(mutex)(&port->info.lock);
> > +
> > +     msg =3D gpio_setup_msg_header(port, gpio, GPIO_RPMSG_INPUT_INIT);
> > +
> > +     return gpio_send_message(port, msg, true); }
> > +
> > +static int rpmsg_gpio_set(struct gpio_chip *gc, unsigned int gpio,
> > +int val) {
> > +     struct rpmsg_gpio_port *port =3D gpiochip_get_data(gc);
> > +     struct gpio_rpmsg_packet *msg =3D NULL;
> > +
> > +     guard(mutex)(&port->info.lock);
> > +
> > +     msg =3D gpio_setup_msg_header(port, gpio, GPIO_RPMSG_OUTPUT_INIT)=
;
> > +     msg->out.value =3D val;
> > +
> > +     return gpio_send_message(port, msg, true); }
> > +
> > +static int rpmsg_gpio_direction_output(struct gpio_chip *gc,
> > +                                    unsigned int gpio,
> > +                                    int val) {
> > +
> > +     return rpmsg_gpio_set(gc, gpio, val); }
> > +
> > +static int gpio_rpmsg_irq_set_type(struct irq_data *d, u32 type) {
> > +     struct rpmsg_gpio_port *port =3D irq_data_get_irq_chip_data(d);
> > +     u32 gpio_idx =3D d->hwirq;
> > +     int edge =3D 0;
> > +     int ret =3D 0;
> > +
> > +     switch (type) {
> > +     case IRQ_TYPE_EDGE_RISING:
> > +             edge =3D GPIO_RPMSG_TRI_RISING;
> > +             irq_set_handler_locked(d, handle_simple_irq);
> > +             break;
> > +     case IRQ_TYPE_EDGE_FALLING:
> > +             edge =3D GPIO_RPMSG_TRI_FALLING;
> > +             irq_set_handler_locked(d, handle_simple_irq);
> > +             break;
> > +     case IRQ_TYPE_EDGE_BOTH:
> > +             edge =3D GPIO_RPMSG_TRI_BOTH_EDGE;
> > +             irq_set_handler_locked(d, handle_simple_irq);
> > +             break;
> > +     case IRQ_TYPE_LEVEL_LOW:
> > +             edge =3D GPIO_RPMSG_TRI_LOW_LEVEL;
> > +             irq_set_handler_locked(d, handle_level_irq);
> > +             break;
> > +     case IRQ_TYPE_LEVEL_HIGH:
> > +             edge =3D GPIO_RPMSG_TRI_HIGH_LEVEL;
> > +             irq_set_handler_locked(d, handle_level_irq);
> > +             break;
> > +     default:
> > +             ret =3D -EINVAL;
> > +             irq_set_handler_locked(d, handle_bad_irq);
> > +             break;
> > +     }
> > +
> > +     port->gpio_pins[gpio_idx].irq_type =3D edge;
> > +
> > +     return ret;
> > +}
> > +
> > +static int gpio_rpmsg_irq_set_wake(struct irq_data *d, u32 enable) {
> > +     struct rpmsg_gpio_port *port =3D irq_data_get_irq_chip_data(d);
> > +     u32 gpio_idx =3D d->hwirq;
> > +
> > +     port->gpio_pins[gpio_idx].irq_wake_enable =3D enable;
> > +
> > +     return 0;
> > +}
> > +
> > +/*
> > + * This function will be called at:
> > + *  - one interrupt setup.
> > + *  - the end of one interrupt happened
> > + * The gpio over rpmsg driver will not write the real register, so
> > +save
> > + * all infos before this function and then send all infos to M core
> > +in this
> > + * step.
> > + */
> > +static void gpio_rpmsg_unmask_irq(struct irq_data *d) {
> > +     struct rpmsg_gpio_port *port =3D irq_data_get_irq_chip_data(d);
> > +     u32 gpio_idx =3D d->hwirq;
> > +
> > +     port->gpio_pins[gpio_idx].irq_unmask =3D 1; }
> > +
> > +static void gpio_rpmsg_mask_irq(struct irq_data *d) {
> > +     struct rpmsg_gpio_port *port =3D irq_data_get_irq_chip_data(d);
> > +     u32 gpio_idx =3D d->hwirq;
> > +     /*
> > +      * No need to implement the callback at A core side.
> > +      * M core will mask interrupt after a interrupt occurred, and the=
n
> > +      * sends a notify to A core.
> > +      * After A core dealt with the notify, A core will send a rpmsg t=
o
> > +      * M core to unmask this interrupt again.
>=20
> There's nothing in this scheme that dictates that we have A cores and M c=
ores, or
> that we have a single core system on both sides, or that they are Arm cor=
es,
> please describe things in terms of Linux system and "remote system".
>=20

Good point. I will reframe the description in next version.

> > +      */
> > +     port->gpio_pins[gpio_idx].irq_mask =3D 1; }
> > +
> > +static void gpio_rpmsg_irq_shutdown(struct irq_data *d) {
> > +     struct rpmsg_gpio_port *port =3D irq_data_get_irq_chip_data(d);
> > +     u32 gpio_idx =3D d->hwirq;
> > +
> > +     port->gpio_pins[gpio_idx].irq_shutdown =3D 1; }
> > +
> > +static void gpio_rpmsg_irq_bus_lock(struct irq_data *d) {
> > +     struct rpmsg_gpio_port *port =3D irq_data_get_irq_chip_data(d);
> > +
> > +     mutex_lock(&port->info.lock);
> > +}
> > +
> > +static void gpio_rpmsg_irq_bus_sync_unlock(struct irq_data *d) {
> > +     struct rpmsg_gpio_port *port =3D irq_data_get_irq_chip_data(d);
> > +     struct gpio_rpmsg_packet *msg =3D NULL;
> > +     u32 gpio_idx =3D d->hwirq;
> > +
> > +     if (!port)
> > +             return;
> > +
> > +     /*
> > +      * For mask irq, do nothing here.
> > +      * M core will mask interrupt after a interrupt occurred, and the=
n
> > +      * sends a notify to A core.
> > +      * After A core dealt with the notify, A core will send a rpmsg t=
o
> > +      * M core to unmask this interrupt again.
> > +      */
> > +
> > +     if (port->gpio_pins[gpio_idx].irq_mask && !port-
> >gpio_pins[gpio_idx].irq_unmask) {
> > +             port->gpio_pins[gpio_idx].irq_mask =3D 0;
> > +             mutex_unlock(&port->info.lock);
> > +             return;
> > +     }
> > +
> > +     msg =3D gpio_setup_msg_header(port, gpio_idx,
> > + GPIO_RPMSG_INPUT_INIT);
> > +
> > +     if (port->gpio_pins[gpio_idx].irq_shutdown) {
> > +             msg->out.event =3D GPIO_RPMSG_TRI_IGNORE;
> > +             msg->in.wakeup =3D 0;
> > +             port->gpio_pins[gpio_idx].irq_shutdown =3D 0;
> > +     } else {
> > +              /* if not set irq type, then use low level as trigger ty=
pe */
> > +             msg->out.event =3D port->gpio_pins[gpio_idx].irq_type;
> > +             if (!msg->out.event)
> > +                     msg->out.event =3D GPIO_RPMSG_TRI_LOW_LEVEL;
> > +             if (port->gpio_pins[gpio_idx].irq_unmask) {
> > +                     msg->in.wakeup =3D 0;
> > +                     port->gpio_pins[gpio_idx].irq_unmask =3D 0;
> > +             } else /* irq set wake */
> > +                     msg->in.wakeup =3D port->gpio_pins[gpio_idx].irq_=
wake_enable;
> > +     }
> > +
> > +     gpio_send_message(port, msg, false);
> > +     mutex_unlock(&port->info.lock);
> > +}
> > +
> > +static const struct irq_chip gpio_rpmsg_irq_chip =3D {
> > +     .irq_mask =3D gpio_rpmsg_mask_irq,
> > +     .irq_unmask =3D gpio_rpmsg_unmask_irq,
> > +     .irq_set_wake =3D gpio_rpmsg_irq_set_wake,
> > +     .irq_set_type =3D gpio_rpmsg_irq_set_type,
> > +     .irq_shutdown =3D gpio_rpmsg_irq_shutdown,
> > +     .irq_bus_lock =3D gpio_rpmsg_irq_bus_lock,
> > +     .irq_bus_sync_unlock =3D gpio_rpmsg_irq_bus_sync_unlock,
> > +     .flags =3D IRQCHIP_IMMUTABLE,
> > +};
> > +
> > +static int rpmsg_gpio_callback(struct rpmsg_device *rpdev,
> > +                            void *data, int len, void *priv, u32 src)
> > +{
> > +     struct gpio_rpmsg_packet *msg =3D (struct gpio_rpmsg_packet *)dat=
a;
> > +     struct rpmsg_gpio_port *port =3D NULL;
> > +     struct rpdev_platform_info *drvdata;
> > +
> > +     drvdata =3D dev_get_drvdata(&rpdev->dev);
> > +     if (msg)
> > +             port =3D drvdata->channel_devices[msg->port_idx];
> > +
> > +     if (!port)
> > +             return -ENODEV;
> > +
> > +     if (msg->header.type =3D=3D GPIO_RPMSG_REPLY) {
> > +             port->info.reply_msg =3D msg;
>=20
> As soon as you return from this function, the msg buffer is put back into=
 the
> virtqueue, so you can't just stash a reference to it here and hope that i=
t's still
> available when gpio_send_message() tries to read it.
>=20

Will resove it in the next version.

> > +             complete(&port->info.cmd_complete);
> > +     } else if (msg->header.type =3D=3D GPIO_RPMSG_NOTIFY) {
> > +             port->info.notify_msg =3D msg;
>=20
> Ditto.
>=20
> Although notify_msg is assigned, but I never see any further access to it=
.
>=20
> > +             generic_handle_domain_irq_safe(port->gc.irq.domain, msg->=
pin_idx);
> > +     } else
> > +             dev_err(&rpdev->dev, "wrong command type!\n");
> > +
> > +     return 0;
> > +}
> > +
> > +static void rpmsg_gpio_remove_action(void *data) {
> > +     struct rpmsg_gpio_port *port =3D data;
> > +
> > +     port->info.port_store[port->idx] =3D NULL; }
> > +
> > +static int rpmsg_gpio_probe(struct platform_device *pdev) {
> > +     struct rpdev_platform_info *pltdata =3D pdev->dev.platform_data;
> > +     struct rpmsg_gpio_port *port;
> > +     struct gpio_irq_chip *girq;
> > +     struct gpio_chip *gc;
> > +     int ret;
> > +
> > +     if (!pltdata)
> > +             return -EPROBE_DEFER;
>=20
> EPROBE_DEFER would imply that if we try again a bit later, platform_data =
is
> suddenly non-NULL, that seems unlikely.
>=20
> > +
> > +     port =3D devm_kzalloc(&pdev->dev, sizeof(*port), GFP_KERNEL);
> > +     if (!port)
> > +             return -ENOMEM;
> > +
> > +     ret =3D device_property_read_u32(&pdev->dev, "reg", &port->idx);
> > +     if (ret)
> > +             return ret;
> > +
> > +     if (port->idx > MAX_DEV_PER_CHANNEL)
> > +             return -EINVAL;
> > +
> > +     ret =3D devm_mutex_init(&pdev->dev, &port->info.lock);
> > +     if (ret)
> > +             return ret;
> > +
> > +     init_completion(&port->info.cmd_complete);
> > +     port->info.rpdev =3D pltdata->rpdev;
> > +     port->info.port_store =3D pltdata->channel_devices;
> > +     port->info.port_store[port->idx] =3D port;
> > +     if (!pltdata->rx_callback)
> > +             pltdata->rx_callback =3D rpmsg_gpio_callback;
>=20
> What happens if you rmmod your rpmsg gpio driver and then trigger an inte=
rrupt?
>=20

The driver has a rpmsg_gpio_remove_action which will clear the devices in t=
he pltdata->channel_devices[].
In the rpmsg callback function, it will just return -NODEV error.

     if (msg)
             port =3D drvdata->channel_devices[msg->port_idx];

     if (!port)
             return -ENODEV;

> > +
> > +     gc =3D &port->gc;
> > +     gc->owner =3D THIS_MODULE;
> > +     gc->parent =3D &pdev->dev;
> > +     gc->label =3D devm_kasprintf(&pdev->dev, GFP_KERNEL, "%s-gpio%d",
> > +                                pltdata->rproc_name, port->idx);
> > +     gc->ngpio =3D GPIOS_PER_PORT;
> > +     gc->base =3D -1;
> > +
> > +     gc->direction_input =3D rpmsg_gpio_direction_input;
> > +     gc->direction_output =3D rpmsg_gpio_direction_output;
> > +     gc->get_direction =3D rpmsg_gpio_get_direction;
> > +     gc->get =3D rpmsg_gpio_get;
> > +     gc->set =3D rpmsg_gpio_set;
> > +
> > +     platform_set_drvdata(pdev, port);
> > +     girq =3D &gc->irq;
> > +     gpio_irq_chip_set_chip(girq, &gpio_rpmsg_irq_chip);
> > +     girq->parent_handler =3D NULL;
> > +     girq->num_parents =3D 0;
> > +     girq->parents =3D NULL;
> > +     girq->chip->name =3D devm_kasprintf(&pdev->dev, GFP_KERNEL, "%s-
> gpio%d",
> > +                                       pltdata->rproc_name,
> > + port->idx);
> > +
> > +     ret =3D devm_add_action_or_reset(&pdev->dev, rpmsg_gpio_remove_ac=
tion,
> port);
> > +     if (ret)
> > +             return ret;
> > +
> > +     return devm_gpiochip_add_data(&pdev->dev, gc, port); }
> > +
> > +static const struct of_device_id rpmsg_gpio_dt_ids[] =3D {
> > +     { .compatible =3D "rpmsg-gpio" },
> > +     { /* sentinel */ }
> > +};
> > +
> > +static struct platform_driver rpmsg_gpio_driver =3D {
>=20
> It's an "rpmsg gpio driver", but it's a platform_driver...
>=20
> I don't think this is the correct design, but if it is then this needs to=
 be well
> documented.
>=20
> Same thing as platform_data forms a strong ABI between some other driver =
and
> this platform_driver, this needs to be well documented (but should be avo=
ided).
>=20

Are you suggesting to use "rpmsg_driver" framework here?

Thank you very much for the review.
Shenwei

> Regards,
> Bjorn
>=20
> > +     .driver =3D {
> > +             .name =3D "gpio-rpmsg",
> > +             .of_match_table =3D rpmsg_gpio_dt_ids,
> > +     },
> > +     .probe =3D rpmsg_gpio_probe,
> > +};
> > +
> > +module_platform_driver(rpmsg_gpio_driver);
> > +
> > +MODULE_AUTHOR("Shenwei Wang <shenwei.wang@nxp.com>");
> > +MODULE_DESCRIPTION("generic rpmsg gpio driver");
> > +MODULE_LICENSE("GPL");
> > --
> > 2.43.0
> >

