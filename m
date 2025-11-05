Return-Path: <linux-gpio+bounces-28053-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F835C339C3
	for <lists+linux-gpio@lfdr.de>; Wed, 05 Nov 2025 02:14:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 63C9A4F7A2F
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Nov 2025 01:12:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74AA4243387;
	Wed,  5 Nov 2025 01:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="TZwomtfS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011015.outbound.protection.outlook.com [52.101.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2511C27462;
	Wed,  5 Nov 2025 01:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762305145; cv=fail; b=W3dL3M3ydhIcT2chuTNWZy8jvedIjbL3j+FLEbU5KXmV4xBDtNUxaL/9xCJlJRcZoo2DeVZdRguDS7xrf5Y0UbC2D0wI4QGlU3EybSR+LQlGrsqmiC9m2pPu8wyIowVgAN0aB0AeI/eD7/4JZ33u3J7oB7HRmGXmLn7OlpIbKWk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762305145; c=relaxed/simple;
	bh=3wRCSz/cef6ech44zO3mWuIUsFXsiF5S5X4d339kb/I=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=eOu/DMzYnTlY/CE9EPHm/k7VAwLHG6Gm5IU9GOq6wS6T/jnpJh1Y2KTse7dRx/3tTFe7M2sEiq9TeGoeOgcsMulDRxPhbaXCfOOq5nAwXPtxyZR/OjRUTKknNJqFNwRedGFo+9ZQBiKV7dx8DZ2gy+h2kYu2eDLVUDdM4XSCYIU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=TZwomtfS; arc=fail smtp.client-ip=52.101.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q6m2VACB3XtTzJb2D9aClPEz6iYaxVobChN1h1bpwCGm0qqf+8VpTKPqWM8Z5S/+yeflkfy/BwYU9Virr0lw5dPJK6tUGTcNsoOOr98s/800vpBdCtf9ELNlvmkxtCTQivjZPDgTELahMREtkBVmdtAxdCBsSpnZaHuHE+KVkTn44hS/55qnClqhIkSeWAnnd+P+sxE7giDQNLRLsEb6pSapxL02C/ta4TjHTTyWInJLG1quRTtkdxQemeEmZk1y6xEzUllj61hrASJ6vCjax4bkp27kXCi+G5AX8ssDVS25/6ed2SJpH+33k1AYDChrFOXIK/SWgmU1fFvOtx733w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3wRCSz/cef6ech44zO3mWuIUsFXsiF5S5X4d339kb/I=;
 b=eSMfbNQFEMPoNkv1hHgWZFn3tz6T0OLGEFiU2zKtu/P8e2yrfIIe/4fDAZZiVrIqNXljbw+XSYstOfICy70RhxV1mK3w7+T+G6kTdrk7XzbUmjN6n625vuM7HIyY+aM2/VrdaUjjnJMplSJFzTohIL29wHSpNuIzIBGhUzhgF0bQAKjdlZKbXjbc/z0DLthpw+UCBtwRpu7+oYReUxctqUcUBpNGvLLukzcusoPyyArUFDA/S6miP0P8vda5WH9rojQqZ1tyWiOU32GI1radjwRqzdsUFuZpVMbOp8g5i+jpiBW5brBljjl2unegalTJXEkjKxFFsXeJqlPIW7mn2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3wRCSz/cef6ech44zO3mWuIUsFXsiF5S5X4d339kb/I=;
 b=TZwomtfSyTV6ALmVQ9eaKGAIBj8b27HsAIHKiST3Xg1g0sUaA3TiMfNyaC+lLAV8WxqZQaIBG1i9IkVx3qK9PpYHyDiM+zV6sZT43Z80Visngp7mkqaxfJIH0vcPh6HkcV1TELSZrdDDTGJn2w6+w2TQnxvHNpNvxOx038+tVjY/yCGvJfNhVsWZqQ+A+kilKuYvCMxng7Nr59lf7D1l7GVI2ztXyxDArvxLdzXf4wsRHAjIVkx5q7rhuoACIL0zxodLiAIBp4Aqfz/K1k7XgogVE0XM4ABnZxKxs+TzY4HrM2eLodvtYzb1tKLcgHT4uUH6LDj69+G91voWfQfPHQ==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA2PR04MB10124.eurprd04.prod.outlook.com (2603:10a6:102:407::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Wed, 5 Nov
 2025 01:12:20 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9298.007; Wed, 5 Nov 2025
 01:12:20 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Shenwei Wang <shenwei.wang@nxp.com>, Bjorn Andersson
	<andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
	<s.hauer@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>, Linus Walleij
	<linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Arnaud
 Pouliquen <arnaud.pouliquen@foss.st.com>
CC: Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>, "linux-remoteproc@vger.kernel.org"
	<linux-remoteproc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>, Randy Dunlap
	<rdunlap@infradead.org>, Andrew Lunn <andrew@lunn.ch>, Arnaud POULIQUEN
	<arnaud.pouliquen@foss.st.com>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>
Subject: RE: [PATCH v5 0/5] Enable Remote GPIO over RPMSG on i.MX Platform
Thread-Topic: [PATCH v5 0/5] Enable Remote GPIO over RPMSG on i.MX Platform
Thread-Index: AQHcTcppMmwoPwDY30GZG1dngQbkQLTjQM9g
Date: Wed, 5 Nov 2025 01:12:20 +0000
Message-ID:
 <PAXPR04MB8459C54EAF106184E7A378D888C5A@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20251104203315.85706-1-shenwei.wang@nxp.com>
In-Reply-To: <20251104203315.85706-1-shenwei.wang@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|PA2PR04MB10124:EE_
x-ms-office365-filtering-correlation-id: 017f4942-5761-4bce-0f96-08de1c085e56
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|19092799006|921020|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?EnHkBwTuh95NY2yh1FD94bnV2ezieluWhGA/e3NKbide0DuExzeIas4o7M0E?=
 =?us-ascii?Q?SUQbLPRTs2w0MLnqxmDomVlrm8OD1dHatifaikV/daW/ueRLcpsCz/wrHe9q?=
 =?us-ascii?Q?FcoriqqunpC8lN1qvIivTfa6/z7S6cajzdN/HaQe9zXoOJFKOq9PVfgo5OPd?=
 =?us-ascii?Q?Kjt6FC/oHBMWR6vGPKmnLid77DkG0vU02gvgJW5xz6/jWbtPjMGhAeRMGajk?=
 =?us-ascii?Q?09HB5rbfLApZHFTBDqRooHagZoei6e1LeAmDhGUFRhjhu4/75GmszQnrEJFg?=
 =?us-ascii?Q?MZg/rDRUW7yDQ6GHOp4imqXDNq5j73hcYQd673F0hddzlJAKr1TBPVDoV2n3?=
 =?us-ascii?Q?olkQ6LBNZwbRFl/bVVSrKNOa3WfErCI+RKH6dfjWkT+P9JAr5SSE94WtDCQQ?=
 =?us-ascii?Q?jTl3+Tjly5IcZGZ+qMG2RYzBtuZFvoN8WteOg7oyZHNrSXIQS5EcljWhHMvA?=
 =?us-ascii?Q?lirUWNr8WnwzObupzFLopKintfFFXLuZQPiWDd3emf7jdRkHY+Xr98FyCUU5?=
 =?us-ascii?Q?yKBeQZyp7J7IPdCrx6sbJovQW8FJGsjXhCNXqJG7LIxHaGYgXwAXpkLNm5Kr?=
 =?us-ascii?Q?buQSuk3DpO+kSAThuV/5ZDEQIOC+lwtUf7NzkvE8L3lSIEi+nLjdc0aLOD3U?=
 =?us-ascii?Q?QFaWmZRxJzOhAmwWilehRxexNXyuGnbN1dki7rmMyJtLj1+2qFgThwNaa0bc?=
 =?us-ascii?Q?vZGu9D5kYmCW+Pte5AAagSbaOX3SzmwSbLlion1KLUSbFjS7+RKPsL9XdZUt?=
 =?us-ascii?Q?fsdzDz/1egFyf5VSGPFN7Uk5d3Dbv1UFkA80Z6z8zxdaJWFzQotg3MJfJOOK?=
 =?us-ascii?Q?kYSuRUVnfOK7FqQhweEXO81EvlznD82JKeB3RzYmAowpgDeBbdRt9ORu3kn0?=
 =?us-ascii?Q?7ZqRK7btGauTAbsCTY1AjlouQHsstYGu46QOKgrOCEAh/grGrU7+xVrzmVBW?=
 =?us-ascii?Q?bHXvHUSZP5efme1Fh7qbJJSYsdGXu67zmlxiZFlZBnZUlcbqokfc0C58/CF2?=
 =?us-ascii?Q?tN97PQbsPpuHMxaOVvmUkfilQOfOLl1QgYO1gLxImjIjm7WKE1EEggUfLTe7?=
 =?us-ascii?Q?RlJ15R5xrV1UmWbw/B+DHX+DGDNRpXLBuPiPP6KmZajyISlMh8STgrdQpae9?=
 =?us-ascii?Q?XCtWCIdU1Z7b6Anz2lsUQis6/sVzlpWryzc8i6U86mHXtCDT9vvtL6V5YTe2?=
 =?us-ascii?Q?07m5QmqXIbVbVJmWW/WoriPlEITfk3guGJVIoZnksuVTyz6pBkxKulpkMPHn?=
 =?us-ascii?Q?Lu66r3HUs8wXbNZPE+N6+rfENH9KFh28PeyO6JuP9eHcWbF83AbVK3wFqbW7?=
 =?us-ascii?Q?y0vy3/gBADsBlhGecbIA/DzFW0IVTird9XKo9Z/ZkyYGwnDACmrOtqW18k8V?=
 =?us-ascii?Q?o3IaQWgfarJjzk63DQHkwt6NdkvYI5R8mh4tt2FBEv9YsEnFIe+l8ipu9l6Y?=
 =?us-ascii?Q?SxweNbXfYsCPlkUdrlkK9FdjNQF06RRicUT/rEL7G/HSJQyi0CP6P27mh3v4?=
 =?us-ascii?Q?1HeBcrNXp/K/8lWqTRBTaZgUXpC86S+9XIf0TB9tWxJaPCfx3aqZmjI/0w?=
 =?us-ascii?Q?=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(19092799006)(921020)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?BSSwAmTBzidof/gepm8OcbPkKeJmLDxJFPn/AEjK46d51jPudin/WOFUa+9S?=
 =?us-ascii?Q?zbUM574W7nPJh/T/zyFPB3CGIrJ/3AEyLxCCyatIpdD9aP2lnxl5JufZUIvh?=
 =?us-ascii?Q?dlzlOSsmMYHQf0Fcn5sDjy6s73HHxo2RmupOaGm0I4XVMBFg4Ws+42dOpILn?=
 =?us-ascii?Q?bOhPmPnlzElHB5vspmAKFhohy41iYIxtOkQLr8xXvP+cK4wCo50gCa9nhH0y?=
 =?us-ascii?Q?LFW2WJQJzULZzRfMSdbD/ksyLQdRbamrh8DK/52tfBpVqpP7sRbBePCumKb9?=
 =?us-ascii?Q?HsfxGlscuFiyMG1oChaWu42hp9/w/b2oNeKyTsewF2g5G+sMXVARLcrHMTTE?=
 =?us-ascii?Q?0vougVF8nmCBowRWOoVoS+du/lgxt8dzXndy67gbGfMcw2FjRMueKwNgLT72?=
 =?us-ascii?Q?bDLyQYDMpu7qBRjk3ymf1C4J2Q5t9hrefx7uOVooPZKbv6UaO8w6WVFIjlq/?=
 =?us-ascii?Q?8yK/hz9pWbuxA/PPbeqbKx9c6o5Mds1OVq/YeAhY6cRY7RpYBxP89VaKRODX?=
 =?us-ascii?Q?zI5N6UFcU9kzeKuIXnk8PJOFzbJ/ABkNX/HbSEvWCiUhmPijwocUbu6GPsBq?=
 =?us-ascii?Q?F9hXnY2MI4FF9wiiM2lpsJPdGDlab9xcp+dSVO3mZ+Bxnlf0qWReCiCRtSjY?=
 =?us-ascii?Q?eUXYf+ytpYf3XVILJQcOgn0Gpsrm6zAArlJPLMRBPxOgM+GnYrxDB4FgIuDx?=
 =?us-ascii?Q?SXCsdfHHfFxV5FEY9No8iI1LkCVHql9qskcL0mu9qDHaizbGrEuSwr+Zn5Pn?=
 =?us-ascii?Q?DphcGr2+FYzzvKEfEMJpl40SPFK0Sd6X4uBh/Q+Sl7wVI8uHVjqie/dFZZf1?=
 =?us-ascii?Q?q9J/W8ZjWTyy6atc4S+qjdBN88XWv5hKgFo3vuB4ISpx3OfC9JstYrp2HuBb?=
 =?us-ascii?Q?4h1UwPKmd5XkIJ0OD5Ya/Kq84IlbTg6HMBO/yhY+kH0zXbt1j8cpYyeuxuol?=
 =?us-ascii?Q?JP6gAs7ebKdQ9XaQWuRvg7nnzqA4WgdMtSnWepWZqwELPnWyVPaUxMiBkooZ?=
 =?us-ascii?Q?62M6htzWdzCfyKJEYg4ju3KP6QuxpfAuYmWJaKosnTd18RztqF3s3xQ9CxCw?=
 =?us-ascii?Q?or4l9QaDG9rezO4RRtj9C++tlWuf5gofUDjznIXmo1BUeBq8PJPqZjUA/Mcj?=
 =?us-ascii?Q?4FRz1+QBa1MW8YzADCMbaOTwsAYvA99z1Jx5itiEdk8lF+EXKdf2pz6DWiQA?=
 =?us-ascii?Q?BtXuUDZzIvFEIHYpIOY+wZYyQ/7DW/HlMN5fIgEvc/ZccC8UAsp+THBaXr7S?=
 =?us-ascii?Q?zXfwktIPkD9wa7YJg5AIYEFoi6LmuFVpoTrGD5CrGS38DyTAuUWyC5szi+G4?=
 =?us-ascii?Q?qD6sDnCLPrkvdyFHGx6G3Wnehxxke3u1iDmrxmxCxcbqr6AOp4yQudmey/uf?=
 =?us-ascii?Q?vcJGpc8sloGRO2TxiR5d9QX93gsskRjPQjGMWFEVnO93Cu/ha1xXo8nd5V56?=
 =?us-ascii?Q?aXGzgX8hOEXt/ud3V+DHhBbJRg2He3U/yRW4xm6b7u2LBxxsTnwXLzRHJ5MM?=
 =?us-ascii?Q?hMijHj+6M93FF1ij30YbvOFulgTVGIt9JWTeyiQ5KeGV+eOeecOJ3g8GZ9GZ?=
 =?us-ascii?Q?FSBFSWqsKtJTstpzcfU=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 017f4942-5761-4bce-0f96-08de1c085e56
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2025 01:12:20.0775
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gaCktk6xR9+raKZgT46tHD4wUaKsOzVcwEDRx/QAaAroXP+Ca0zj2iJ/vUce5G5TkSBcCg/fN8//ZhajU9suuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10124

Hi Shenwei

> Subject: [PATCH v5 0/5] Enable Remote GPIO over RPMSG on i.MX
> Platform
>=20
> Support the remote devices on the remote processor via the RPMSG
> bus on i.MX platform.
>=20

I have not look into the details of new version, but before that,
just want to check, have we agreed on what Arnaud suggested?
or continue to proceed to be this as i.MX specific?

Thanks
Peng.

