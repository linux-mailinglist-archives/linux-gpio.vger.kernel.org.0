Return-Path: <linux-gpio+bounces-22836-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D045AFAB19
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jul 2025 07:41:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E5A901780C6
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jul 2025 05:41:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 750F5273D89;
	Mon,  7 Jul 2025 05:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Z53vhf/S"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012034.outbound.protection.outlook.com [52.101.66.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F1E2701DC;
	Mon,  7 Jul 2025 05:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751866868; cv=fail; b=Tu/z096xnfmPrn7xRFme39wmueBnc9yMUxL1Y7JceQTvS3ULpw1q67uXYI1iXxUPy4xRKsyAahfvjL+VCdg+jcImiOYXO5aQbajmqu2+EvnogVQcTE1hHtKWUnjgdp0ahAOzYGzAw/ddNQ7cxfgusfyHxu06AWmpxrxZVUnbjxU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751866868; c=relaxed/simple;
	bh=H3me1hcVfTIgNN+C3tarBN7Khxokphdt+cDByk6RsBo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PGvuPqgnf7JyK5uvv9an+S9PhJvTiKbmPPqPYSJqyfeO7NUDIn+JIFuic9nlnqJWGblxjoZ4kzT2cMm1x+vxUEkFkh/7AAkL+bPDiVRgufKrWSZ623kRkzoqrVaXJzsgekT2l007AYzD5LI4rNwpkUNr+a1r5pbBavC7xNPyR6s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Z53vhf/S; arc=fail smtp.client-ip=52.101.66.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oe4en0mSP4f1F7/8CiA7DQP2e0q3+pWbLe31akA8B2CCiP2UYELoHKr7yc/rrFkNfpVOnVLlY+xZdlujj7NYqSkMD5stvprzIEQ8hDMiE6GGQo++ss+RsQGAvGT2nYhaGW4poRgmsVWDO/aTEu/TIMXHK9Z8u8ZWqxfBRpmP/L7OtjleKxCDQ9Um3HTyoK97CJ7PxaWj8EzGvt5QfHgIFuTu5SKR/Xf2vJzhHSFmeYurksVytGZ4JEfuV6YtTCjHOg31GJwXg+LX7hXtql04iHHDgmJcczUaZTNwW7qekiZ5J2PwX+Or0PX+bHVpKYhzQcoT3LK8liYQw99ES4Q1rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D9KCGhXjIeZGdrtiGTE0a3NhCZ92IQyy++++fMSxh/w=;
 b=xhP/U+72qWrcJv+ekCjsgqwWcZQBLzW+2k6kw6nHnqVxHlc7QkmpfEJuj0o5SMInHJzMAjktnNZzpTi1jxTBmVbFpLWl3O0Yv0yNdxuPgT+FAXZFaa0qO1uD7MKjEgdCCRJ2PI7p57cPo7Kalb/DAG3z4bNTBSMvYjtutuKrltR12yoVI46/71kARlEliLZIycRF9yGXdEnSBQ3JDohUnCtEqczh7IHtxpEnqQl+Kqzbnrk9oJ41EOZdhdW66ky2vfNjpSnXeqOyxw6xMLJ2ehOsOzZgrx5rbXQLflvB+aOTaG6AbEKHUwCNWXnyV7sFZsazAUc1lRtdOz+9QRN1Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D9KCGhXjIeZGdrtiGTE0a3NhCZ92IQyy++++fMSxh/w=;
 b=Z53vhf/Sb6687mFAfBK2Xo6vpw3j/4Mn5oD3Id4yC30sovv+WTMrthI+JcXkj0ERFm+v2Gw5yL0CeGLJZr0tVPMGPhOdt049gECDnSXll2ZUAdQQojI/jhVEPTZBvfAfcDdlHmwa3lP+xFGwlGNtvMol3d9Pit8Zr5JL+auu9FQhMXhjleHYdknGWXvAfaPTI4TQn57ZpkIa42Pq52UXEvGPq02pdzlPC34k+A62qBAJLRc+NUAI68RfFpAzjMDZgLTRC2D8P727r2MaWME2r84dfSx5zNEIfzhU7OUf+pjiZZdNJ+L/PddJrBRw00/8oiCnXzmZseRVRXG3pOmcYg==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PAXPR04MB9122.eurprd04.prod.outlook.com (2603:10a6:102:22d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Mon, 7 Jul
 2025 05:40:59 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%7]) with mapi id 15.20.8901.024; Mon, 7 Jul 2025
 05:40:59 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>, Shenghao Ding
	<shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu
	<baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
	<broonie@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Bartosz
 Golaszewski <brgl@bgdev.pl>
CC: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Markus Niebel
	<Markus.Niebel@ew.tq-group.com>
Subject: RE: [PATCH 2/2] ASoC: codec: tlv320aic32x4: Convert to GPIO
 descriptors
Thread-Topic: [PATCH 2/2] ASoC: codec: tlv320aic32x4: Convert to GPIO
 descriptors
Thread-Index: AQHb7hI4TV7TfIaSMUCvi05VKVrQh7QmIkCAgAAEfqA=
Date: Mon, 7 Jul 2025 05:40:58 +0000
Message-ID:
 <PAXPR04MB8459091FD195321E9E39851A884FA@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20250706-asoc-gpio-1-v1-0-f0912095e923@nxp.com>
 <20250706-asoc-gpio-1-v1-2-f0912095e923@nxp.com>
 <3372384.44csPzL39Z@steina-w>
In-Reply-To: <3372384.44csPzL39Z@steina-w>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|PAXPR04MB9122:EE_
x-ms-office365-filtering-correlation-id: f45b9c55-067a-493a-6c6f-08ddbd18da07
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|19092799006|38070700018|921020;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?AsB8yNqu+BHogBmZc0arZ1t+MsdVegdDCWhBv1FUbbWSKr6hC2xEp5WaAXVA?=
 =?us-ascii?Q?KMsKNKDizyxOVZez/1hfBJpikeOjMM9hgcBLzySF3CEO+gM0Rs++vU5xbcXS?=
 =?us-ascii?Q?LAFSu2VJcnf1EzH7oG1mokuEYIfEmRM6HLqjq+N08z7HxI0QgVg270uBX4LK?=
 =?us-ascii?Q?N20vFr4WN0NqzMpcBDTKvuR/Tt3oyCyoBdfxVSJLY6qI+AeK6rRCNWgdDqNI?=
 =?us-ascii?Q?tPog6rkpU1edBhQMOP4U38dbEBINnTLH2IT13jhXjg/f9jT6Zd+G3Eni1jLb?=
 =?us-ascii?Q?N7ek4y8qYASwt+n6+dNC/UuMC8pd78VyO8kx6J9I8WqWnQliH4oApYkRXucB?=
 =?us-ascii?Q?ztI9NyBfnjjfR8+d7JgqccPL1xfewGSmcp0rKaurGLxaEVfk2mLB088eBBqt?=
 =?us-ascii?Q?jRqw7bYRNdP7/tuaws5QNTeb1yX0ZQGOSGNWKH6bgtqTZImLUvxr6Q96/TSe?=
 =?us-ascii?Q?gRNtvRgYXTnrDDpkD2Xz4ekbIbN1Rcd9VWuxmmivKYui7AYj/czwzk3mG5Os?=
 =?us-ascii?Q?iJ//cjn5xrIaWpZ6AHaBlbwWsidx9AP3qQ8dmfVIpQFJo1IH1cSAVOVgSECZ?=
 =?us-ascii?Q?ycP4shOqJo5j2v7/obShxBAz8UZWAoOy6bdB9Gs8Lszsx9QJa+zgKdAStwLj?=
 =?us-ascii?Q?nrCheqLci3h/zihWXSo+uEcSQhzP2Nh6y7CF7laYpaMVrs56/wH8M+pn9vTx?=
 =?us-ascii?Q?ObRdjXy8V28DCC1X+cluIgHoqxww9Fu74Q+hF94IE21xdZcsKHNdFirHuoRk?=
 =?us-ascii?Q?pxWoeQFtpktighL4Hlgv6DUBLyHMGE7UkSaNhci58xkhPIswsl1xgcQy4Lv/?=
 =?us-ascii?Q?rO9oapEB1j7e58U8GRpIvvzmMr6L3aXvaNCgc+4UFVWDhpYldsAwc6MxK5wI?=
 =?us-ascii?Q?cI4fTc3kQIl85xYnXx2gozLpHvY9W7S2/U85rovxaJh/5xjxD8uk3sF0djAX?=
 =?us-ascii?Q?BzH3PwMguRR8SeLV5pjFMvCh01/gROEC3Ee7VOS1VKbrijOZln/W8WcugTgZ?=
 =?us-ascii?Q?c1azg1e9JOHY5q0+rnvDcTnnazYDlcLHk4xqkx27x0s2pAgZWol8IDzFPbgj?=
 =?us-ascii?Q?rwFEwvpt+L6ICogexGbMAXzhgqe+iNM5Dpis9T+lsVx4CY0oLg6MmKcnZQ5x?=
 =?us-ascii?Q?0CQ2SqqgrXh67w+3zp0EvzAMc6bYSyFfY3Sej5Mtd0Pp60Lv3vU4WuGy+zIc?=
 =?us-ascii?Q?UMwP38V2lh3Q+7hcZqR1rdhX+5G+d9vZ83HDcEGAaPa1MtKl6rWAgxOZhztM?=
 =?us-ascii?Q?311RZrWYD3cGb45UYNOfP3DLnW50aZtBQvc3DvlLEwGKH6gWFwuCvXtlYCGk?=
 =?us-ascii?Q?KFb9IIuFcCT77WblIZ5UPeqZL3SdM9T4SW8+poNjWye+bPKAlVkMAAKfEkPL?=
 =?us-ascii?Q?phaCGFU46Xga4xf0nYbRMzhNi9uQzmm8O18ZLjuqs+kZjtqFRbKok+ohbvLN?=
 =?us-ascii?Q?/HJCHTtHDF6tE8kCbWfqOIfJZio2wHK0D36zhuX6/OICLH3TgTYOur7w9py3?=
 =?us-ascii?Q?B2/4KZ+oU0pb0cs=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(19092799006)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?B93tW5UwrSpn+x8BUL0kfr+6PYsPrC/+TT+n51LiM2sbZ1bxn7e+YVaDSnkT?=
 =?us-ascii?Q?QxvF/zHuevpXx/OUIuu+LOhqTh647gurPYjQKUGHslTeLE0l5za1Kv+nYGUb?=
 =?us-ascii?Q?qxnjypdOsr+wM5idBF0Tt/5clSLSaT5lwkhUREAZ9OTdb13/OBcNX7HMQpSC?=
 =?us-ascii?Q?BQjh3pzXqB8FcJIbdbcspP8qIYgS/SSn1tcaCbkXTomdBjgZfvaPHcnfW5lu?=
 =?us-ascii?Q?lMhoS0yNTCWOqtKAqSW24K7uc68gp9VzsA2gAXDMCYf+Mrx3jZM8JJ2cHg/m?=
 =?us-ascii?Q?rSpVMwpiglQrT4lq+Z2b/Jvqlj525Zj4fjM58H7J1HUIMjVdlT4mYHjuIfEP?=
 =?us-ascii?Q?l6ASPkcaXfyzChPv0Bjva4XCjGW/6FcdwwKNuJNqXGAasC0ktsKeXBrPKJAG?=
 =?us-ascii?Q?RTEk3hGThPIr/VXvuL6QnBYA97pM2SEEoI4RnV1GHsM19h77RCjzxJmuhTgS?=
 =?us-ascii?Q?PPEGo1gn0nnVLRxV3VgVUgBmTuPEDfj/uvMzxI7DMUy31ENd0U4WR2P/KzI3?=
 =?us-ascii?Q?EjCld9l7wy2o8WhfyZGH1FHkGQGgd49wpZ3PLsqTY1WbE4M5+tYMnZN1hSMH?=
 =?us-ascii?Q?MM+KFhEbpkgWGJjlQbcz+rL+VX2+aPelm8bZONnkPvTcQ9+dmXUj4C307KoH?=
 =?us-ascii?Q?O5V9o72BdRpsHoAuDYqNbXklVYi+y0Q3Gt9RBxC0igWlrq11PViDt+ffa264?=
 =?us-ascii?Q?HEYNDdX7hIRO6rVbX/n4SLfMDLb9l/whOYbUv3ccmiP6iHeAyQnFBGYKAi5u?=
 =?us-ascii?Q?i0rXz2DdsJIPRsN/4r6a6p35vfZrr+x+PY43YPqMtFqMpd0lV/nldaJnyLPz?=
 =?us-ascii?Q?h1KF/pBdLa1AbLQPaTOCt7wsWXXmyeVz9HBlaxQTsZwYgjSnooZx4fHwzNts?=
 =?us-ascii?Q?KQDk8IQFD/7hS4qdSeVuZxTFDE86I3X5oPOPw9nRjmPF0S+L2Ic3xxSDeSwb?=
 =?us-ascii?Q?KxnANf4snOlw4/FzxGBSsyuc8Jkxkxzz3ZzakyimBgtc+j4V03+ymbc59jWf?=
 =?us-ascii?Q?gL90e6OTcI0Zv/6MCm1tpFVtHzUtrZXf2HROqYpJNyDxE6m1DveQWlLbEgn6?=
 =?us-ascii?Q?M0VO3ittL7kTxK0mD85XcBnsg4lZq5wT2/reynaH+pF+XtLauGLgtWHRNVyt?=
 =?us-ascii?Q?P9P7XT/mmDiv6uyc9+UbFvn/5GPKgPWLuheeJmVzwBupoicU9ZvKkoT4cfXL?=
 =?us-ascii?Q?wlESxW2Qd5DWFlNJSS7HGRGJrcak1HwR+/Ctv4unQ4E5kkUEHQKr7zuPOERe?=
 =?us-ascii?Q?nMt5PgbpRLSn7JyRAPk4+zIDdGSZPfrDi+eCQjNnmO5FkQEuxCwMHsmhkXpE?=
 =?us-ascii?Q?o7JR47w9a3O6rM/0od8BLMvcmgDjcO2qZiy+J4de1zRzCVbwzdLLnqBfM7Z+?=
 =?us-ascii?Q?r6L9KNpTTqzF+hPdOPmRxrKqDtILnN3IjQKpJWcoCkUpD2WCIbU0iVKrWtvn?=
 =?us-ascii?Q?8rAodvJ3mMwOe3VmaZNJ29kS+rbFsx1GR6r38XHPgJXAE5NPXdMl4XhHDTi1?=
 =?us-ascii?Q?Zf720cPSQAl9qhsOWDx3nGoz2zc1rXNtZ6F9Dk2ddQQC1UQkWD//fPE1+rEK?=
 =?us-ascii?Q?focfOujS9yS9ZL1O1qA=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: f45b9c55-067a-493a-6c6f-08ddbd18da07
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2025 05:40:59.0693
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9PjG7WBAyqslMmymfkhQOBDpnwmcrzd07SCDCgluPcwItHncAUWKFzFqnLxTAkNg20Sxkm4JbRWUUBqjv8LV2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9122

> Subject: Re: [PATCH 2/2] ASoC: codec: tlv320aic32x4: Convert to GPIO
> descriptors
>=20
> Hi,
>=20
> Am Sonntag, 6. Juli 2025, 03:04:24 CEST schrieb Peng Fan:
> > of_gpio.h is deprecated, update the driver to use GPIO descriptors.
> >  - Use devm_gpiod_get_optional to get GPIO descriptor, and set
> consumer
> >    name.
> >  - Use gpiod_set_value to configure output value.
> >
> > While at here, reorder the included headers.
> >
> > Checking the DTS that use the device, all are using
> GPIOD_ACTIVE_LOW
> > polarity for reset-gpios, so all should work as expected with this patc=
h.
> >
> > Cc: Markus Niebel <Markus.Niebel@ew.tq-group.com>
> > Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > ---
> >  sound/soc/codecs/tlv320aic32x4.c | 44
> > ++++++++++++++++++++--------------------
> >  1 file changed, 22 insertions(+), 22 deletions(-)
> >
> > diff --git a/sound/soc/codecs/tlv320aic32x4.c
> > b/sound/soc/codecs/tlv320aic32x4.c
> > index
> >
> 7dbcf7f7130b04a27f58f20beb83eb3676c79c3d..1423186f5a6c181a2
> 0dd2dd55267
> > 9d33174edaee 100644
> > --- a/sound/soc/codecs/tlv320aic32x4.c
> > +++ b/sound/soc/codecs/tlv320aic32x4.c
> > @@ -9,27 +9,26 @@
> >   * Based on sound/soc/codecs/wm8974 and TI driver for kernel
> 2.6.27.
> >   */
> >
> > -#include <linux/module.h>
> > -#include <linux/moduleparam.h>
> > -#include <linux/init.h>
> > -#include <linux/delay.h>
> > -#include <linux/pm.h>
> > -#include <linux/gpio.h>
> > -#include <linux/of_gpio.h>
> >  #include <linux/cdev.h>
> > -#include <linux/slab.h>
> >  #include <linux/clk.h>
> > +#include <linux/delay.h>
> > +#include <linux/gpio/consumer.h>
> > +#include <linux/init.h>
> > +#include <linux/module.h>
> > +#include <linux/moduleparam.h>
> >  #include <linux/of_clk.h>
> > +#include <linux/pm.h>
> >  #include <linux/regulator/consumer.h>
> > +#include <linux/slab.h>
> >
> > -#include <sound/tlv320aic32x4.h>
> >  #include <sound/core.h>
> > +#include <sound/initval.h>
> >  #include <sound/pcm.h>
> >  #include <sound/pcm_params.h>
> >  #include <sound/soc.h>
> >  #include <sound/soc-dapm.h>
> > -#include <sound/initval.h>
> >  #include <sound/tlv.h>
> > +#include <sound/tlv320aic32x4.h>
>=20
> Mh, maybe create a single commit sorting these headers.

ok. Let me do a v2 for this.

>=20
> >
> >  #include "tlv320aic32x4.h"
> >
> > @@ -38,7 +37,7 @@ struct aic32x4_priv {
> >  	u32 power_cfg;
> >  	u32 micpga_routing;
> >  	bool swapdacs;
> > -	int rstn_gpio;
> > +	struct gpio_desc *rstn_gpio;
> >  	const char *mclk_name;
> >
> >  	struct regulator *supply_ldo;
> > @@ -1236,7 +1235,14 @@ static int aic32x4_parse_dt(struct
> aic32x4_priv
> > *aic32x4,
> >
> >  	aic32x4->swapdacs =3D false;
> >  	aic32x4->micpga_routing =3D 0;
> > -	aic32x4->rstn_gpio =3D of_get_named_gpio(np, "reset-gpios", 0);
> > +	/* Assert reset using GPIOD_OUT_HIGH, because reset is
> GPIO_ACTIVE_LOW */
> > +	aic32x4->rstn_gpio =3D devm_gpiod_get_optional(aic32x4->dev,
> "reset", GPIOD_OUT_HIGH);
> > +	if (IS_ERR(aic32x4->rstn_gpio)) {
> > +		return dev_err_probe(aic32x4->dev, PTR_ERR(aic32x4-
> >rstn_gpio),
> > +				     "Failed to get reset gpio\n");
> > +	} else {
> > +		gpiod_set_consumer_name(aic32x4->rstn_gpio,
> "tlv320aic32x4_rstn");
> > +	}
> >
> >  	if (of_property_read_u32_array(np, "aic32x4-gpio-func",
> >  				aic32x4_setup->gpio_func, 5) >=3D 0)
> @@ -1372,26 +1378,20 @@ int
> > aic32x4_probe(struct device *dev, struct regmap *regmap,
> >  		aic32x4->power_cfg =3D 0;
> >  		aic32x4->swapdacs =3D false;
> >  		aic32x4->micpga_routing =3D 0;
> > -		aic32x4->rstn_gpio =3D -1;
> > +		aic32x4->rstn_gpio =3D ERR_PTR(-ENOENT);
>=20
> Shouldn't this be NULL similar to when devm_gpiod_get_optional()
> doesn't find any reset GPIO?

There is a check in driver, so NULL not work here.

        if (!IS_ERR(aic32x4->rstn_gpio)) {                                 =
                        =20
                ndelay(10);                                                =
                        =20
                /* deassert reset */                                       =
                        =20
                gpiod_set_value_cansleep(aic32x4->rstn_gpio, 0);           =
                        =20
                mdelay(1);                                                 =
                        =20
        }

>=20
> Despite that, looks good and works as intended:
> Tested-By: Alexander Stein <alexander.stein@ew.tq-group.com>

Appreciate!

Thanks,
Peng.

