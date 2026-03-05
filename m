Return-Path: <linux-gpio+bounces-32545-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QFLiDVtRqWmd4gAAu9opvQ
	(envelope-from <linux-gpio+bounces-32545-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 05 Mar 2026 10:48:11 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D5120EE47
	for <lists+linux-gpio@lfdr.de>; Thu, 05 Mar 2026 10:48:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 33A983016D09
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Mar 2026 09:47:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3E753793BD;
	Thu,  5 Mar 2026 09:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="E46wSqLX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011044.outbound.protection.outlook.com [40.107.130.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C4BD377547;
	Thu,  5 Mar 2026 09:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772704069; cv=fail; b=CzJMEbgdpSMAQy5h2K9WnAj+QPapcvx0wqJ0vrzyABWFJyh4o4xxADsKBPfD17Pm3yiQj0kqeZGD1E8CuUWCFREcFB/l43cu2T4o4PqFntR6GmSmPsDSYGC8CH16qrRI1+bsOteW5qClg4RP5Pv5ZiN5vQjV/tKm0g5PunIQTVQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772704069; c=relaxed/simple;
	bh=SElxhSndhNrZIo746nRK7HWTE0URnaXabyCkj670QDU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Ksy6MEdojIQHrkANJEDUKzGLaE736m4rtNZr24PAEq6D5Gb93zddvKPxXcSkljDfS8hflrD/Y7Bk2+npNGik8GcX5nnwPCVup370Xi4pICh9TdDGyPmRIsjfWMRo1h07U0QS+dnMnZK3vW0mhW8DZSjuC13f0OVGqTZT0p3ZQ+s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=E46wSqLX; arc=fail smtp.client-ip=40.107.130.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mxCBVzbaYfAnf0RKMlIZgd9H+G1x44jRn2JAHFw4OYUPFWnEB3o15sfc2biIuNEx/HAKV/vUDkCwrHW5k+B9R1nySMCMqWb2j7n9SbpMf91JpdKdFMqJZcaRDNat9o97Id3wec68T7v07Mfb0IcPPHx3vSVa/iqkSXs1yOha0vy4GkLi5nN/zVFYIXVikgWqh7VxSZEvBtigxAsbctjjLQ9hUbfxUXonZ4xLTmmWYDhAsJNgVuP67JQSVlkYeOV7Batdt4stfYOd/IUTRZM3GGczx8KcG9AlotX4K6MC2c3lihOBFbonbT2Z94N+x7LpeBEG3x78xIR0iS+48ZbpWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SElxhSndhNrZIo746nRK7HWTE0URnaXabyCkj670QDU=;
 b=tN1gjOos2sP9Fp8KOIZeKdldyp/vYP1/e2ocCeK1wnbw7TcpzUSTSfGRFNSNcd1Cy5mpAtGncQK4buOlAtoSQoIzk2gvs8lMb3HA7r6KZGweXLvhDLCEPwwEB6DivFtvD14ziGWLB7RD9IdL9pghwn2IMccx6n91vDVcDfp/96HgTwQvn4b7dLNFMqjAFR9iqZ77+6UJdZxIhy+BWsjOxQ6wn9cLIfAWNBKT7JH+3sm9jueAC6ynxfmtCtzYlKPbrWuWeKoRalfGkJ7yASn3oWi/JQrODJzngPKXrA8WKVtxkUJfRlPgLbeCXsA7h/gSXNFmPMUnajkcIaCT0wOWzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SElxhSndhNrZIo746nRK7HWTE0URnaXabyCkj670QDU=;
 b=E46wSqLXxPLRtkSubh+26PJ5V3zzlBwDBMkuqUVdcvwToEjcPtHFWU7XT2tY9UzYudqU52omZNsi7vkYR4ma2MN5nSLr/JeAlrbReYSCqKfd6Nw/WCF2AnSBmH7sreNSSYX5GTvpA3GAZ42m3vb8z9hu4qeK4eDwLZD3yy0Q1sh3aA2+55/HNUPUDllFUaNhG9NtZdm0dXvd5d9tluhJUt0WzMh/+D/0G+R5KKrQyVTC7WxQCtpSrVbVTtQoKIBRc3lAt57Vn6Al4Tts5syV+QRE5ANB7r6mV8ourv3Wf838MQRXRY1lzT02lbEgfy7fmjc+Nrq4Fx6lrXvTHebieg==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by FRWPR04MB11150.eurprd04.prod.outlook.com (2603:10a6:d10:173::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Thu, 5 Mar
 2026 09:47:42 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%7]) with mapi id 15.20.9678.017; Thu, 5 Mar 2026
 09:47:42 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Aisheng Dong
	<aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, Frank Li
	<frank.li@nxp.com>, Jacky Bai <ping.bai@nxp.com>, Linus Walleij
	<linusw@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi
	<cristian.marussi@arm.com>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	dl-S32 <S32@nxp.com>
CC: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2] pinctrl: imx: PINCTRL_IMX_SCMI should depend on
 ARCH_MXC
Thread-Topic: [PATCH v2] pinctrl: imx: PINCTRL_IMX_SCMI should depend on
 ARCH_MXC
Thread-Index: AQHcrH8zn/nsy8P4xkW8wBLU/36NjbWfsPnw
Date: Thu, 5 Mar 2026 09:47:42 +0000
Message-ID:
 <PAXPR04MB84594FE554D46CC2F995C1E7887DA@PAXPR04MB8459.eurprd04.prod.outlook.com>
References:
 <d5aff6931bbc95a16f049163c682ad08d1f0f04b.1772701307.git.geert+renesas@glider.be>
In-Reply-To:
 <d5aff6931bbc95a16f049163c682ad08d1f0f04b.1772701307.git.geert+renesas@glider.be>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|FRWPR04MB11150:EE_
x-ms-office365-filtering-correlation-id: 6023b9e4-9589-4c97-bcab-08de7a9c3ed5
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|19092799006|376014|1800799024|921020|38070700021;
x-microsoft-antispam-message-info:
 v82yZvJ4HUfj+svK3pPPZObkmZx1cz5dWjHsUPom39ljJoGptlKL6wR0IHFemUG9axywGSnYVkuJrqdcpeHDJaKdH26o1qZVl6Wc4jj4vlOssIAtnTc4IWRxOF0HA2A1PUV9nI9YLDb6IUYXKfZKrjo2lQKyoFogo80qu3OXA7ZnoZvhtYeDj86nvSkQf8AH4bRWDDznu4UuvhIpVPQN0/XzoQEfODBsyVDogBqj/CRVeofisEBLmNQYyi0zDk+w/MQYyJNv/MO8E1NLYB8Aq0YzAoKmVAgj6osgdf1eg+qo5CbCqECz9xw/Z/q8+LftNKGA5gJZBac6qgDQIRHLI6w+PhSr2r++3AVUQ/H9xM5zfRFZK/IYvUgjjeoJU0E+6kTwyV6NYyi1FkW0YxuYWkw0YEQLK/ZQoEcMDqZfSekPQgUNZEeWCGMJQ1QOEbn8fLH+JnTVoic07Ai01oxNCGCAhiHsNMv9OH4BtvRGhCgq03HGu4CmiY0Bu6p5iCUKvzNkDP7mMDG0xLdLMbVo8BYMhby7PBMv0sMbr7IDNxYxP1AZ6JIyTcWpsRZqTMEHysvYRgRWJta3C4zr80j+VDDWNKXkMoJ02Z1AOEGNZ67rxmtUZbhsLrIju7+d4eErwbLZu67J5h084xRgUnSCxx8jD54Ju2Sa9G2MUbz+mo+RXhciGpHUqP+/JwXBFxXSOMbzg1TYqk6RJWd1sjuyls3LRIlEd9Zi4LSHgR68nnauyH8Dz2h/3Ohcui9RsvYrBiuZtg6oiM1mpdByp/nbV5OoYs3GlA6nW9VdyJP2a9iqke06EIA/BPxslh159KGN
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(1800799024)(921020)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?SXkYdxLW5zogkTYt8O6E0RSx1QA8EuuzrUHYxs3xQsbD90oLLMjyWcfsF04x?=
 =?us-ascii?Q?Ik2xTchOhciY3QwoEN5grbDEt4A7GTdrfDvaOq13bGN+O0d/47jqWj19dx73?=
 =?us-ascii?Q?Wq/8fsUGfn3BOGUjIlCOWJGoXMnqzZB41jx6d14SqDk2TOcLWMewOdO2Buz5?=
 =?us-ascii?Q?HviX5oqSrn/4lSb/w2xFE6WijA3Artwa/l2KKwz2CTV+lzjmYsuz/Pm2pULe?=
 =?us-ascii?Q?mDHO6OFb9IsCkxVc42l9L1BO/KWjm6Lcg+nVr6Vs2SBu93DZyY/8TxOorniH?=
 =?us-ascii?Q?/JSCPi6GzuZM5Fz69qa6ylDD5bDuqjczaMX85V67pDXob7vv0yHc9xlO9VJz?=
 =?us-ascii?Q?lrcsAzJG9Iqi11ENtLBoa1w05+0ID9WpqioB/NCYSw8OcN2O8xiXZZLrIP3t?=
 =?us-ascii?Q?/ka59eMolnG3PCSfZ6dmIObcCZGY+wpMRYBso5J4fVw8NyLk5meeHe1AS8hQ?=
 =?us-ascii?Q?5jTMSO5BeLxc7RCwGW+6dMBqJsjmIfSaPsGk5AmuknO5i7XpH7mD4+PHHjDg?=
 =?us-ascii?Q?USeu3cZIhnrC7MGo1YDFdBZp8chEjfdGS3aL8INnjE3tU2Fl4WX6FHLv9gBq?=
 =?us-ascii?Q?Zrc1/XIDq81shDib9yQ+Vif35XEbOWP+BPAfyuzhVVU/8F7k/5Zjoa8tkNQk?=
 =?us-ascii?Q?GTFbVwc6CkmTqflciHr6denKT4SJmBCwwMjoB5Qz/DVQKCsWmL9h0ZbJugxt?=
 =?us-ascii?Q?N05+jsMysdA9smA8Gh7hSyy4zBy8t4nCr3MP+9Q9y/f85UefDMaSGsoR/HKW?=
 =?us-ascii?Q?L971PPl5LG5TKMOnC+FX7BptLJvhKW+OJ+ikr8rP7OzGsCASro1wgZu4SQZC?=
 =?us-ascii?Q?aid2Xiec8gYtIJVWFBzhoLDh0pHyOdnnn0v2xRyaWORLt96/cIv6rhHdpdI6?=
 =?us-ascii?Q?Er/0CEfIBFmNWaS1f7Cmp8obVVTyIXVruomekBBTG3QIV5S2Jicv5Tv7LSL+?=
 =?us-ascii?Q?Cbqst65TYNnLCz7GsGx76AQneT2dqtQ31iD72C3DBgWXNwedxUYBmZnX2vJH?=
 =?us-ascii?Q?CCDCQivmpOIUXyKEOVhH3DMyxbTpjWhFzMQM3qFtXeKrCL++8ZvMKunHXa/x?=
 =?us-ascii?Q?Q+qNehUImBvZB0pWculVvjM1qWJdWFo/ZpLQow7hQuSvCEmPailtql65blUM?=
 =?us-ascii?Q?v4NDjqXlMWNAZzClyq8QWvsEnn2qLHaQDBMY5TryOO/GmmLDnQkZZSzbyq0u?=
 =?us-ascii?Q?Hgdwbb+fGJTGYca6GLYruqnUXUgxVIeLoJ+oAAuK3YzWLfYPKhUB4lFHxlzc?=
 =?us-ascii?Q?c7DJFseUKfURzJKf4C4Cxzsz3xXvMhB6VVIu4v++0ABx3JP5IfdvXTlx1bId?=
 =?us-ascii?Q?+cgUw17/CyTppj6fsrpBbsJgExP7R2xX7A1j5u36L86qPniMc2TZbVdt0fDC?=
 =?us-ascii?Q?e+dW4yX9vBGznNaa8hOxpozQH+WE7/98WqkATOeabgbmlu9DBkn1l0bncXPd?=
 =?us-ascii?Q?Psjjxo39cmyzbnHWNFU6P5kN0/t8cdtVhANTnzOQe1KVfg9/LIpBH6aO1ZQS?=
 =?us-ascii?Q?4MzcCuiT4GlroDNuamdz6cUXIoP00GrJieVgysN++KzoOp4v3Y53DYFhUN42?=
 =?us-ascii?Q?eccT5RoKoxLOCb32TiOwpTq9mmrdLlcto6k3/HDZYLlX6iRsOR3cgHxowjiC?=
 =?us-ascii?Q?2PScAnQTuew2cGyXlzjDNI4UDIlLboQ8ojgzVotw492P4kYh3+BSQaGt1j81?=
 =?us-ascii?Q?+6AvU0IoFA+SfcjDyeLXjD5VNYzC8oHQeobylvctVHenA2xp?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6023b9e4-9589-4c97-bcab-08de7a9c3ed5
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2026 09:47:42.0533
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vRvAPKyAqbbKbIder6NgdjDKBKJY0JNMZTpBwiYxU/Ww2rBNdPXxShA2uyrqZzpfHv/d34Ol6UfQf9KwbYpf1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR04MB11150
X-Rspamd-Queue-Id: A2D5120EE47
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32545-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,nxp.com,gmail.com,kernel.org,arm.com,pengutronix.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peng.fan@oss.nxp.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	NEURAL_HAM(-0.00)[-0.993];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,nxp.com:email,NXP1.onmicrosoft.com:dkim]
X-Rspamd-Action: no action

> Subject: [PATCH v2] pinctrl: imx: PINCTRL_IMX_SCMI should depend on
> ARCH_MXC
>=20
> i.MX95 SCMI firmware is only present on NXP i.MX94 and i.MX95 SoCs.
> Hence add a dependency on ARCH_MXC, to prevent asking the user
> about this driver when configuring a kernel without NXP i.MX SoC
> family support.
>=20
> While at it, relax the dependencies on ARM_SCMI_PROTOCOL and OF
> when compile-testing.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Peng Fan <peng.fan@nxp.com>

