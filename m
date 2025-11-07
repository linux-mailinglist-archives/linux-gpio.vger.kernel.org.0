Return-Path: <linux-gpio+bounces-28257-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 545F5C41D94
	for <lists+linux-gpio@lfdr.de>; Fri, 07 Nov 2025 23:40:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CBEC81896EC6
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Nov 2025 22:41:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E9DF3101BA;
	Fri,  7 Nov 2025 22:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="NYyfQXof"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010071.outbound.protection.outlook.com [52.101.69.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E4214F70;
	Fri,  7 Nov 2025 22:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762555237; cv=fail; b=EOu2U9Y5ajD+qPR1HWqG2DSy46F2qmcGyQidGx7oQq0a3ugBAbWdziHADKSGij9JkHFVYMJvElrb3l5gWjFazmN1ZkkM0vwR6pzbpSlADFp3bu+Y/axL2Fl4bXZCrhd0841K3ooKu/sC5l0O8xoLEOX0c+sk2ymRnKFuB7fjlD8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762555237; c=relaxed/simple;
	bh=M+ktYBPPIbQMXVUqupBitsKPjd9YASNwKmVDQpE4kKI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=eq6LbGOkVTLmDdcstmXkEDPhHeFhso66yMgF5Dl3ufkPY9MOEKgpu38U5V8+EUXLL7+UhD+Ro6TLW8N2ChBIdMUkG3KO6auaRnIiHzoFOM8iLyF4MdMQEjay1IDPa1QXYKd1YR8uyy3yJhtgB65jWfm08rbv5kpGPBc2e3myneI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=NYyfQXof; arc=fail smtp.client-ip=52.101.69.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iH+Hg5FnfFsftuxLfUXUbhOg/lUjnRUxen4MC+hexhu8n2LJHjmcre/RVn+HPwC3F9xz7PunC/G+R9OoSBbrTlCoS+JeCUERNEwjsZbZVWRf7TMqpLJA1nsSMjCV+ABhzkYdsl00BBnMDzommGbrIRz7xoWaQ6ecT+eyiKRkBXm6oW9CrEgce8UOowhwpJd9JKCigERIArCRWFZwdELh2UtwBDvGSo2flNCsloI1f8U8zkRaar7L5EMYRVw766g5oKqgTVSVOTmwHd1fRaP4QVbdMWd305Y77hQW3OwvT2mmYjlZyH6UBjXxsTC6p5pRU35DOyr93NGtGAgKsPW6xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M+ktYBPPIbQMXVUqupBitsKPjd9YASNwKmVDQpE4kKI=;
 b=aT7Z9UC9hvk/8XcwfAPMHAzPVEcJii+hASFrcmwxygH86zBEt/lj+BqdOdTXzOYXieHrIDeOV6RXvLP75Yt7jhm3eViDxulY3tY/7ZTXxDhsAg/oCaSL67bNuuaWgEEgX8i8iwr96Ai3ACl1DU21Rzq0EbT3DbmbaCFAdGsKLgMSVLQCrQZ+oU8qfXc1wWVzAeOhsUlabqYQ9mFn6f8qoJp8DEdraInmOPtWtKRg9PfOn9irqOLYme7nz3OXSj57ih+9dnV8TFupnaOrAubo2xLQ9Rxd+o72vyfFSeI/GGSZuQxhLQQh1RNXb1HePyGW0GcGm2JlMxwxuT2G0iWiIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M+ktYBPPIbQMXVUqupBitsKPjd9YASNwKmVDQpE4kKI=;
 b=NYyfQXofXK0BQxslIqurC/VSUIqkonwoEFm0X1wsFTnz1aBfPC8W8hkcz7hrSIdRo/3sC5TOfbkJIBJ+/HW24F9oq6A/10mllUDlqBOz+QH7Az6MJf/4NKta3fyxdgG8KUs6HppObgx3P83Flw6hRzA+5lf01ezuLaSfFE54FHWW1/Q/qNnZeFz5vbnyWjm65v92hFiiM2MZQD7kZHb1ej/jTE3XxFke4bS5TaB3am8qoNNOeADmRUhv/133NeaI5Jv3EeQUgyCW6FW1gDO37375GupyPTutvV+kYPNOvoZ8KlrbSeqNONQ4WFOTEYa3ri9iz4qhca8A7z1fADxjkQ==
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.13; Fri, 7 Nov
 2025 22:40:29 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612%5]) with mapi id 15.20.9298.012; Fri, 7 Nov 2025
 22:40:29 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, Peng Fan
	<peng.fan@nxp.com>, Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo
	<shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Jonathan Corbet
	<corbet@lwn.net>, Linus Walleij <linus.walleij@linaro.org>, Bartosz
 Golaszewski <brgl@bgdev.pl>
CC: Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>, "linux-remoteproc@vger.kernel.org"
	<linux-remoteproc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>, Randy Dunlap
	<rdunlap@infradead.org>, Andrew Lunn <andrew@lunn.ch>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v5 0/5] Enable Remote GPIO over RPMSG on i.MX Platform
Thread-Topic: [PATCH v5 0/5] Enable Remote GPIO over RPMSG on i.MX Platform
Thread-Index: AQHcUDeENiClhU2cN0+mEEQO6WPB2w==
Date: Fri, 7 Nov 2025 22:40:29 +0000
Message-ID:
 <PAXPR04MB9185B5AD1105E00FF48152A889C3A@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <20251104203315.85706-1-shenwei.wang@nxp.com>
 <PAXPR04MB8459C54EAF106184E7A378D888C5A@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <05a0c630-3bd5-4307-8b94-1889ba191c33@foss.st.com>
 <PAXPR04MB91858EA1057672295ECF793889C5A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <aff734de-0d61-4239-9e67-78a4ab258c30@foss.st.com>
 <PAXPR04MB918581030A9FC05E13874BDB89C2A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <734f830c-947c-495b-ac9f-98d439e821f2@foss.st.com>
In-Reply-To: <734f830c-947c-495b-ac9f-98d439e821f2@foss.st.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9185:EE_|DU0PR04MB9251:EE_
x-ms-office365-filtering-correlation-id: ef3191aa-3a5d-4111-a1b8-08de1e4ea72d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|19092799006|921020|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?XOnqEJIEVuOJwceAboL6Kw6y0MVc/wz5tqcHISSJ6ZddGvSUEYQIpN+ioH9q?=
 =?us-ascii?Q?SBzU1d9pxSugffX6KmDufMkvRqiEIFQ58AW78Ohw57rR5l2RW/KMSDw5zEVg?=
 =?us-ascii?Q?LDzsg5fizb82JEJQvvqbLK/Bl+DrHZT4F1SLvmAHXZZixBAcKb0kwVEl+aPm?=
 =?us-ascii?Q?3H9Xr+5z0eCDyF87kNSKq14fEpzdkvNhjvmMj9ayspaApqo21mgR65dyBRY2?=
 =?us-ascii?Q?zJMy1eQQ2HPDfiQHRTxcFofsQquvlHsEKCK9lKF8596egg90SmzLlg+bcPbH?=
 =?us-ascii?Q?YurgUaA07cwjUWzR3F/rthKrqkP9VHR88Zn40CMTiQLgS3ZIG73gDtrHx6Y4?=
 =?us-ascii?Q?8+h99zj+uhkt7A48pFbp5ory+73NrLqQmTae8MbQxchWQfrM8tKHJXJUfuFm?=
 =?us-ascii?Q?AtijX/X2NiVjhblstfd0M65r+yuZqsCXUDvxjgwI8qYM1EMkXMRcNPTrua37?=
 =?us-ascii?Q?3T7FmgZUof+RHcH+vkA4xj/o+3BZNhDVGOB4OHxmLqKRmffcFXi8aT/zT+v7?=
 =?us-ascii?Q?g0Ac7U4WlB1gUPDkGPhQujMejMpYp3noqr6TJOZSYvVjVAHEeMkGzCQ5s26b?=
 =?us-ascii?Q?RqxhsuhpnJL0G4QQynwqoptnx9lrhFFg7WzO3FgKAaacDRBYK1rTNx8b6fXI?=
 =?us-ascii?Q?YxtTreIiN9l2eGTPA7p3SIJaoRTqOeVdMRgDWxMvmPucrFAk88YqHNadpZzA?=
 =?us-ascii?Q?jjK41HnDtbIL27DggPTSGSrp9fLpVqJ+3+NR99arU0CH9mJguP/zZs6VbmFY?=
 =?us-ascii?Q?pkDNyQgkA36krXlrCXEl1OCu3gTFk4cRpUNDi1+ExmESAoc8wcn2OwKrkZR8?=
 =?us-ascii?Q?YIXpRBIcBivcpa+FKq6lNzo7VB3evtQROOEjfaBhG+E7PkahKigXPD5MecDS?=
 =?us-ascii?Q?wgBg9kO4MT8DH4Fbyh6eCf615+CAiGP2pJFT9o12X/PlzBRShQKdoR4dtoKr?=
 =?us-ascii?Q?CyTPyb6wyzOu4MKRsLHRTl9rmnlLpot4Jekm2qpdyvpHniI+cnpw+4vI/rLD?=
 =?us-ascii?Q?n5IBRtNQkxeF8J7U1WgVY6X0XCb0/T8FjjFnBZ8WVjnaMoPOmYq8tM3O3/nz?=
 =?us-ascii?Q?31ly8Fy4LG31god7adjXwSHdIPuibxO4BnrcO/4O6l1Vh5nyhgirrrOaTTkT?=
 =?us-ascii?Q?Tz5aSaA4uIuOscaZwknQpcK279WSDLLnDzEGjk00iYvCEVpDelLjkqpNaAux?=
 =?us-ascii?Q?ixXVigB2Q30+uLP2WT8DWmXjuEbL7W5ABgCBF3ERYQtQEPKOKXrxkjjfLMfu?=
 =?us-ascii?Q?h/YD2niuTXTF8Dpsjd0mwLZ/iGoZmwmRMx123f97GPSVj4UPF0uA+wOQk0Oi?=
 =?us-ascii?Q?KM5JmKXawHslU5D5cLWkrtcNF5y3z2hPk6HQ9wmdKnQ5WrGkBOamaYaHOxBE?=
 =?us-ascii?Q?xATlHrrevhaT1vYMVH61dST4kOddoCoXby3ZjETPvSRvrrLFGKca+hD7x4CW?=
 =?us-ascii?Q?E2r7E53LIHQ2AsirvtGc306ymzgp1L+Z46ugr6GinaBM5pwBRbGbEg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(19092799006)(921020)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?jhkwect+TAlELzetd4SRvKHlatrTF+RsPcIex3d+H0kA69QSDBDLADGaTIsD?=
 =?us-ascii?Q?kGLCfPEnnkoOESaDHgf3zEGz2kSz8YoUZ5+CEDrN3rQI2i/mjIYwfD82Agxd?=
 =?us-ascii?Q?AjTUYB6eBt+5JGZS8mAdukOB33OJnWWVk9K15/JeSj6zuJ04WafzS4GYwEuu?=
 =?us-ascii?Q?z+nw9QfGoRlQo0UhVnSLws9h4u6X+brOUaTV3DPyg2hJ/hDUadx7Zn3LGiho?=
 =?us-ascii?Q?1PF9i+cnru4Gu2tmz0f8yMzjQl5s6aemX2zchKQfdqWM9VRetpRABeEnhVXP?=
 =?us-ascii?Q?mTssHuFOxSL/vDnNkwN9YL1G6dY+eXj55o5QIzSKqDjGFjy7Vs98VwmeIfV9?=
 =?us-ascii?Q?7P/1awgL7Lw2s9KHI2c385+8pLHNa9Ebm/1R2kwBf2hSoC+Z7pWaM7gI2+E8?=
 =?us-ascii?Q?BTBKfDlCvD8b4YNhPUvkhCbqMgL1eph/x0a/uG88zvl2olAbGrxZx/cQBoLV?=
 =?us-ascii?Q?7D+nrYFaWpj/miOgX/pdHnrf315PYz69RGmpv+iwIyrhfBN5tfCWkP62hbXX?=
 =?us-ascii?Q?bdpR7DM2JyYCmyErDKgUNicDPSrXzC9NZjAiA5xGNOQ/wi35ENSxXR/kzbAz?=
 =?us-ascii?Q?BETaBJkodXFzlthp3yDCFNZQcIeHGr3WAfMgxHmqlJbbYx5WxXdDUBOu3RTN?=
 =?us-ascii?Q?9znWgGRxnJ5ahgRctxbh8fLrXE8Bs4k+KDMtpVnBOr/axBYdEQyOv9jbc4Ae?=
 =?us-ascii?Q?xc9m7kzG6Kj8jz1oMdec1KsokWXgmwBXJD6SNzedyJDuXTGDgQt/8Y971fVq?=
 =?us-ascii?Q?tFd81iTXue4j1QE3LFO7K/P91+azY6JA/HI7JrnFuFBUyjQGrNgWTdxw6F6l?=
 =?us-ascii?Q?Ul3c3TFeYm2v3jPOIU1RQaECSUIKgSTHdfsA8F1BcyCVGyMi/Dmxl92CgUJY?=
 =?us-ascii?Q?x/2a2IpLowzlOfrcq083+wZoVBPcAwnqJcqD3qY7f8pxqeC04j2ESGAjb5tL?=
 =?us-ascii?Q?gXuL/TD8ia6W2xP4x+ToHwIKyDa80eg4I413r7jHgttu6B5F6ntr/KZt9HeD?=
 =?us-ascii?Q?rnh5WdfHchi8Z1x/Bj4E4yzlj6mW1YM1o+ehskd/NBpKZT4r8VPyI0oRwsaN?=
 =?us-ascii?Q?B2IzxKXvYaX2xZF5EGydp+8pqAEgt+KyychTMSDx4CKtBuINzyKOX9Jpx5qs?=
 =?us-ascii?Q?RamgwBTkSsiVavIrZ4nDR1q7JHu+BH3a8qJRcr1i8MEIzzBjdCkrDyj647NG?=
 =?us-ascii?Q?PnC6DY8v7wPnRpL40GnYgDDbsuouS/Tax5rmPttnAc2lJG7ZnwJwVEm9Uiry?=
 =?us-ascii?Q?MmOsDPIyqq7/6LwIHojQ0/xTROLibvqZi5SZnHPMYvS+4j1RAFHvv0ttN7Rl?=
 =?us-ascii?Q?Xy0IwM7IpEeiTi/qER9Fz8l+4xmIb86rDmJyT7DvwDb97CJhHpr9u34qEkHi?=
 =?us-ascii?Q?Rt5z9cBoyXRaxUmguJz5J6e4pMgn+9UuEBgXUuj5T8dUQ//vq//5CNXvkgSC?=
 =?us-ascii?Q?yThkhPs+MDf9QCHT058S1rxjigRXOmvPUoWlN9fJ9cETVFZ8Am99bs4cV+7C?=
 =?us-ascii?Q?jlfnXOrSrHAkrf9NqwuieLAvyTWqBqBFabd+SE2Y1uGPSfLP+QR7ns67mOOA?=
 =?us-ascii?Q?IKygXqneCfaSiMKL2YQ=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ef3191aa-3a5d-4111-a1b8-08de1e4ea72d
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2025 22:40:29.4191
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W7PzbH5DH+U1HcltxXpcVYHgSDNTJA77IG/cW5PKUe5AFr5Tv5T1UizNoQaYFHuGAWcosoygReJQ5uZgTtaxcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9251



> -----Original Message-----
> From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
> Sent: Friday, November 7, 2025 11:18 AM
> To: Shenwei Wang <shenwei.wang@nxp.com>; Peng Fan <peng.fan@nxp.com>;
> Bjorn Andersson <andersson@kernel.org>; Mathieu Poirier
> <mathieu.poirier@linaro.org>; Rob Herring <robh@kernel.org>; Krzysztof
> Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Shawn
> Guo <shawnguo@kernel.org>; Sascha Hauer <s.hauer@pengutronix.de>;
> Jonathan Corbet <corbet@lwn.net>; Linus Walleij <linus.walleij@linaro.org=
>;
> Bartosz Golaszewski <brgl@bgdev.pl>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>; Fabio Estevam
> <festevam@gmail.com>; linux-remoteproc@vger.kernel.org;
> devicetree@vger.kernel.org; imx@lists.linux.dev; linux-arm-
> kernel@lists.infradead.org; linux-kernel@vger.kernel.org; linux-
> doc@vger.kernel.org; dl-linux-imx <linux-imx@nxp.com>; Randy Dunlap
> <rdunlap@infradead.org>; Andrew Lunn <andrew@lunn.ch>; linux-
> gpio@vger.kernel.org
> Subject: [EXT] Re: [PATCH v5 0/5] Enable Remote GPIO over RPMSG on i.MX
> Platform
> >>>>> I have not look into the details of new version, but before that,
> >>>>> just want to check, have we agreed on what Arnaud suggested?
> >>>>> or continue to proceed to be this as i.MX specific?
> >>>>
> >>>> Thanks, Peng, for pointing this out. Regarding the V3 discussions,
> >>>> it seems that I am not the only one suggesting a generic driver.
> >>>>
> >>>
> >>> As I mentioned before, the only i.MX-specific part is the transport
> >>> protocol over
> >> the RPMSG bus.
> >>> In this v5 patches, we've included detailed documentation for the
> >>> protocol in a separate file. Any platform that follows the same
> >>> protocol should
> >> work right out of the box.
> >>>
> >>> If you spot anything that could be improved, please let me know!
> >>
> >> My concerns remain the same as those shared previously:
> >>
> >> 1) The simpler one: gpio-imx-rpmsg.c should be renamed to gpio-rpmsg.c=
.
> >>
> >
> > Agree. Will fix it in the next version.
> >
> >> 2) The more complex one: the driver should be independent of the
> >> remoteproc driver. The rpmsg protocol relies on virtio and can be
> >> used in contexts other than remoteproc. In other words, the struct
> >> rpmsg_driver and its associated operations should be defined within
> >> the rpmsg-gpio driver, not in the remoteproc driver.
> >>
> >
> > The GPIO driver operates independently of the remoteproc driver.
>
> The channel_device_map table in imx_rproc.c would give me the opposite fe=
eling
>
> It functions based

The channel_device_map is used to control the order in which devices are po=
pulated.
This mechanism is key to implementing the probe-defer feature for the GPIO =
driver.
For those who don't care about the probe DEFER, you don't need to put the d=
evices in the map.

> > on the defined GPIO-RPMSG transport protocol. Any remoteproc that
> > supports this protocol can exchange data with the GPIO driver via the
> underlying rpmsg bus.
> > Placing the rpmsg_driver (which manages the rpmsg channel) within the
> > remoteproc driver is more logical, as rpmsg channels run on the rpmsg
> > bus. This bus is defined inside the remoteproc device tree node and is
> populated by the corresponding remoteproc driver.
>
>
> Regarding imx_of_rpmsg_node_init(), It seems you rely on device tree in t=
he
> rproc platform to register rpmsg drivers. This implies you are creating d=
rivers
> based on a device description. To me, this does not appear to be a valid
> implementation, but perhaps such an approach already exists in the Linux =
kernel?
>

This follows a standard DTS population approach. Regardless of how the code=
 is organized,
you need the logic somewhere to populate the devices. Placing the "rpmsg" b=
us under the
remoteproc node is more straightforward because the bus depends on the remo=
te processor.

>
> For your information, I'm facing a similar issue with my remoteproc_tee s=
eries
> [1]. The advice I received was to look at the PCIe DT implementation (I h=
aven't
> had time to explore it yet). This advice also seems relevant to your seri=
es.
>
> Do you also have a look to rpmsg_virtio_bus ? it seems a good candidate t=
o
> match the device tree properties with the rpmsg device?
>

The implementation is actually based on the rpmsg_virtio_bus. The rpmsg_sen=
d
Will finally call virtio_rpmsg_send.

Thanks,
Shenwei

> In the end, this is my point of view. Perhaps it is better to wait for ot=
hers before
> deciding on the direction...
>
> Thanks,
> Arnaud
>
> [1]https://lists.infr/
> adead.org%2Fpipermail%2Flinux-arm-kernel%2F2025-
> October%2F1069154.html&data=3D05%7C02%7Cshenwei.wang%40nxp.com%7C0
> 2b24edd459f4d349b2608de1e21b45d%7C686ea1d3bc2b4c6fa92cd99c5c301635
> %7C0%7C0%7C638981327288728022%7CUnknown%7CTWFpbGZsb3d8eyJFbXB
> 0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCI
> sIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DKHeu3GVR%2BYvFnNh%2FgwizEr
> bu%2B0UnwkB5vf%2BuLrRQReE%3D&reserved=3D0
>
> >
> > Thanks,
> > Shenwei
> >
> >>
> >> Thanks,
> >> Arnaud
> >>
> >>>
> >>> Thanks,
> >>> Shenwei
> >>>
> >>>> Thanks,
> >>>> Arnaud
> >>>>
> >>>>>
> >>>>> Thanks
> >>>>> Peng.
> >>>
> >


