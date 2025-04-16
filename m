Return-Path: <linux-gpio+bounces-18919-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 191F5A8B3E7
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 10:32:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 34F323B0514
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 08:31:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DEE522DF80;
	Wed, 16 Apr 2025 08:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Bm7P4f4c"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2046.outbound.protection.outlook.com [40.107.104.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1036F21E0AF;
	Wed, 16 Apr 2025 08:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744792275; cv=fail; b=Sx8Jpk9TyFFuAxHd8W9pxL2M8/SUeIwsHFqjB6DTJpqa8eBN09WYTOKKhWwFMvkcrRx3O2h+jAz0dYieGqtBNpyDNkXR3eCmTrOoRlf0jD8C07VgeBySfzkzUDNqusQ2/aoryy/e2VhJaK4fQU6oxRiacm9Zw5ExnpjgUDzsELM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744792275; c=relaxed/simple;
	bh=qhNK93N32Z5UC0JOm28HO+sKz+OLFlyIX3groDFAkWQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cFX8z+gIh2cA1brOYw3vpcmVgqZiKxclZ7RDtbZEPo5Lrqm8ySemhkUp3KGmvcG3IEzGJb25h04na941atM+NXeN/qSPethE/R57tbsMZXRXC8XQQihsuTh3ag3a52hsARPt7qeKo8g9sA/o9pAskuU/JEQY0XZZfcIEDAI984Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Bm7P4f4c; arc=fail smtp.client-ip=40.107.104.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jAHDk3uFx34qrpKZV9620PVIMIqhkJCroiyHQBBx/FX4qVBIArD7pFkD9AucTQBcxSveYm++Wz6JQOTPdugYGiH4TaKS2j4fXbmxBWtleuydQBjYa4+Jb94hdQVQAlOONcbaw6XcEL3r5kEl0ehlwD88T8O/qve4oDn4QQtKAKk64DLMMRHjpc01kmn2XkqldROcL1Tz/ONEglNySz1QSMCZGH5KZ8M4t8tQlMbIMr3Lg4LaZAV4MQj6n5uZ2ZFRkvZSek0ZxZWmZEiv7Jj6tHDJLLPzhFBKvw5tPN+LaQVzBhLAQDxwS7HW7qsQYFbj61ZGDnxmgQOwfeJKPlGPgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IXMor9WWdnnf0gtOe9QbAhP+S3Nk3sskCgZIuT5G3sU=;
 b=GGvkeghfaEoZI47cSmxtmiuu0X/o2kjY/e8qMZtCs9XsYLdLPJES7Ew3CSZ8CjI/jafFwdCPso7JFNbei0Vl3DEqFa9/pwtxvmxAF7VT34fyQUl0BTeKOJ2c/Mg3oVFEe2L4EkKOo5YXj3q82CdWnDFryE0aBEYbtDqgcsSaXsMju8g8GlaAyZGZrpadKEFjE1t/gnY5MG4NaA/Rwg7b6Vjt2lb8yLIlnQYwGnKwMKllIZyNzLrO0bu6AhETfau0LMcWbzhT7uRJA3u3LVaD+tgeXqc1dU0pXgkmIYvqJE7Db3YA9+Sg0SlC1fgZ7O3VP3SxRCA1YymVtkIWY8NYcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IXMor9WWdnnf0gtOe9QbAhP+S3Nk3sskCgZIuT5G3sU=;
 b=Bm7P4f4cQbsO7912ldt+S/pmtG3YIUq/JELdIsuHomLl1/dlI3Ua2l4L4Q/EcQv45F6y2wWT9bXGYVyPUYMsWuvRMyphuvHRIh3jWpL1Pj1AXS98J7zMxeKDdjQpQMbjjkEm2eDsUUyWk6QHBeRRxLJ/EILgs4nV6IvIYPOb28c81cMHdskiRA0JxM9Nzb5KSHWcFD2Pg6HXiMhj5X3X8H+3Lfc4O31CeUVero2SQ1GLtvazFpECHelmcxItGtu9JMn2ejK37t6IwjlvDcLS9VSNlVIJ/UJ6BVIURLbvtY7OyHGMhqZuKTYoidJYAyppkYu7PSkU+iHgyD6/LqBL3Q==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DB9PR04MB8363.eurprd04.prod.outlook.com (2603:10a6:10:24b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Wed, 16 Apr
 2025 08:31:10 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8632.030; Wed, 16 Apr 2025
 08:31:10 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>, Shenghao Ding
	<shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu
	<baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
	<broonie@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Bartosz
 Golaszewski <brgl@bgdev.pl>, Peter Ujfalusi <peter.ujfalusi@gmail.com>, David
 Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald
	<rf@opensource.cirrus.com>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
CC: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"patches@opensource.cirrus.com" <patches@opensource.cirrus.com>, Markus
 Niebel <Markus.Niebel@ew.tq-group.com>
Subject: RE: [PATCH 2/7] ASoC: codec: tlv320aic32x4: Convert to GPIO
 descriptors
Thread-Topic: [PATCH 2/7] ASoC: codec: tlv320aic32x4: Convert to GPIO
 descriptors
Thread-Index: AQHbqCdZrPtIdUF+p0isj7v1OJfF/rOkyy6AgAE1xOA=
Date: Wed, 16 Apr 2025 08:31:10 +0000
Message-ID:
 <PAXPR04MB8459F40C66870CE6FFFADF4988BD2@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20250408-asoc-gpio-v1-0-c0db9d3fd6e9@nxp.com>
 <20250408-asoc-gpio-v1-2-c0db9d3fd6e9@nxp.com> <5004055.31r3eYUQgx@steina-w>
In-Reply-To: <5004055.31r3eYUQgx@steina-w>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|DB9PR04MB8363:EE_
x-ms-office365-filtering-correlation-id: 214f106a-726f-4d83-6e0a-08dd7cc10a73
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|921020|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?5nJmBtTo0xNhtqiHoAiNnzYgulsfVgqX1lfbj/EwPqDbez46id6q3USbsb?=
 =?iso-8859-1?Q?c47z52JBYObHkmoyoDNBWboPbUsxWU9lMaKD5gTlD17FSmS2sjoXZ60Nd7?=
 =?iso-8859-1?Q?d0s06Yc/zjQvZfQfBTK3yieRbiTOp5T5CAxaMng1xeB/BWgoWRatQ+pz9A?=
 =?iso-8859-1?Q?DubAoZBeVN9lD4WsvdafJAKSJEZRB7JsKPzXdNjr6euV3ksOYJiEnwFqgW?=
 =?iso-8859-1?Q?0gEtecYTNsXccvHLMLdPk1dujNOkeoTnWOa+eHO8uNgrK1+lJi0c7oXe9h?=
 =?iso-8859-1?Q?mg28MyiaUeVhS2WgvT62XZUBXkr5eGEnEIXOSN/6j9CE1sdmMKzjDYHtUf?=
 =?iso-8859-1?Q?XKGYEfsehyjOCIMhqzEpD+V+pBt4DEaXJpUGw84hCS9sZKj4wmOnXAnN4q?=
 =?iso-8859-1?Q?Lbhnt3riNkE8CXml2Ayl5wHDQbyb+46OAvmxJnL6kp3VMO1EEAxnszG1dg?=
 =?iso-8859-1?Q?pLXsaFQifljtIrlBukBD28dg1GUKpzrh9fyhrT8NQSTieCuFtmqS7TGfJQ?=
 =?iso-8859-1?Q?8Z+qpFC0QS7R9qRjxcDA4cs4PVc/7x0U0avX4xvYuMfN3TZgYYqsC+Lnxt?=
 =?iso-8859-1?Q?sGKyyCfmGF3rMEBRdoZ3YdPrPCjAc4Lp8LXJwkQ2IEVj3hZhbioWGwTaT8?=
 =?iso-8859-1?Q?IT52g7zTcUALIv8VWsRLaMbjhP8w/6Vhl5avtiwPqf0o0c5fCFjbxSjAji?=
 =?iso-8859-1?Q?OYRynM5sgW6AhzlUhMwP935aIGNqkcoEbfLX8r45GxEJM6TY0kwJ7eaCgx?=
 =?iso-8859-1?Q?IHPQBI5e+22b6IcMXdmEO8hpEicLyL274f5Bv7EDdo9wI+YxjOaYTnTyfh?=
 =?iso-8859-1?Q?9X3xSBTyeqNQznhfQKYK4UD0ZOBVl1wlPdOJW4C11diwTMsM9NLsOyS4AZ?=
 =?iso-8859-1?Q?VopAsfUE5jvPGubAU+oTSaBJaXVxdqtbfGxGcy0j8xglLJzQGDrXFc5FIB?=
 =?iso-8859-1?Q?Ppkvbf3IUYf36WfTB75hv357LA/3GDKG2/V5sXf8OKMA6OA0JZSHRAmKi/?=
 =?iso-8859-1?Q?ijKuDMTXmt97Dj2OOFp/gbRXFCV3gCgSAs8mFZhlkVvxNfwgtfNA/kSKto?=
 =?iso-8859-1?Q?21uxYs3TAdS1VA6Ydf7NiZZBDWCGNhmlUmspz854gNDtqEAQ5DV6hVkcjq?=
 =?iso-8859-1?Q?AgAuUx5xsHweEUOi7AMA7sJ8tNMA7vP3isxHpqQJXaGZ9UbbLhFulo8vth?=
 =?iso-8859-1?Q?+VHv+OI4ZK/urQkx+j+FVvGMByQI6jzJAHIIwbE+RY3fKSQi0FoLkunvdX?=
 =?iso-8859-1?Q?NsMomfggHXfZ6FUcEdgFpHHGSR3+anQF4afoxVLqLmz7CIHH5gq6lK88JB?=
 =?iso-8859-1?Q?Z+LQgIab/hQ/OSipA8gN+9ReTBxo1YTst46isGPnVA0k1VCAtOn/gLhO+5?=
 =?iso-8859-1?Q?M9IlKqsoGqLPwWia3DtCAz7PltK0vpVdf3qRNVTFmZ6Rz8BDXEX0dBxuNO?=
 =?iso-8859-1?Q?ZOahCZOnbo3Wwfv8d+g2cIudBH56N2Mxl1QQawpAiYVpEDl1/Cw5/rXMNW?=
 =?iso-8859-1?Q?LPI+NYdzq63B0tasdhQvtQ?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?xnyeyESjahuXpQRZ7qDY/ak1KskcQcygThBOVQWRc/tniNusMXM9tu+aHt?=
 =?iso-8859-1?Q?DMIZ0jAQiKJRoFJEnQKrW3AvB3Vr7fC1tgWj8wQHp6xe6CX5f2EQotiEI3?=
 =?iso-8859-1?Q?2u+vnQax1Tfkl0aEN9Zxpn9yHkpsNurA6dQ/VYp7D/lD0OmbG23PnvmdPX?=
 =?iso-8859-1?Q?fbxEeFPUwjw/YWzS5dBvKRO0Ajutrdgh6ttMvkdqH6VzlXtUz0OcPqpEYA?=
 =?iso-8859-1?Q?FLAbEJ3mc+b7GXidbcpmZvugEihDOzSBo0ypigfzWI+npPMEfIkjQ01b4l?=
 =?iso-8859-1?Q?3k5jNjFrIGx1DSYEpc8IIjkH6bJRfcUKH/xI/xYn+/3HSWcfcoMJSw3e96?=
 =?iso-8859-1?Q?QyDTc/auSiX9zkh5iYqMPrG9KUDwySqE8FcQ8+qXeCh9Wk5dA4U2iETn2S?=
 =?iso-8859-1?Q?1KJdrNzZXIoXM5jId+9fIsiacetmIWC5/cx2cPpG69qEbHiLnktouswWhJ?=
 =?iso-8859-1?Q?a7bQ4LwwikOvCg4SO+pmb3NSwkAtYh+yVgqrQS15+PUXedKNiTtaI0DlGD?=
 =?iso-8859-1?Q?GNT3MlrASSOo6b/kbrvdJo7KAeWYiM5rEcP1pbkfIDuLXUz4rLfBLFtrdk?=
 =?iso-8859-1?Q?LOhLPNdJa5k9irS1RG9FEMD2qm+lasx9ROe1j5ydNUcr90quWo+B6TyvEr?=
 =?iso-8859-1?Q?kYHa4krL/Jy2OjGf5L0COUrGf54kKAMPE4hes6VdrUqPpg6dFV0dynh2NH?=
 =?iso-8859-1?Q?EMpLaYGmz7829btv+14Yahi5qF+BWR40+nsTMSwBavdlTT5BQ4t5yxHPeL?=
 =?iso-8859-1?Q?PIwa8emqj5jwVL3s1xnRikKZwRh+71aWmm4tst38YdcsAdsOZDZJ52MX66?=
 =?iso-8859-1?Q?6z92w0n54bn1e9N5gEFKbUgIKreECO8jh1ILW/92IqR7ywQvjFsBhZdVch?=
 =?iso-8859-1?Q?qY+il36Cdb2fr98f6uTgKUf8hT+KfwZq/Re7+cVbP1XJBuO50MpO4L38WO?=
 =?iso-8859-1?Q?Yh9ugifKADWCFQWiNlfKFluWwAum6p9gR4r6lAEBTE7M5Z2MG/CzV9cY4T?=
 =?iso-8859-1?Q?cb5yJ/wCFaSPROq+43eecAQB0wG/fFE5crwYpA/BgOveg0FZhcLE1IlJPa?=
 =?iso-8859-1?Q?xK+N9AM3S2WJttqh8ygxuNk87pgdhbe4uOos8rXitC+qvc3opN09TGCVk+?=
 =?iso-8859-1?Q?IuY0njbLOfovrXCxNhjmPNgxBJmsepE7Gdu0Fhb6yWtMBCINtj1TXOyUiN?=
 =?iso-8859-1?Q?G7q8WijwG/hMHnAGkdhjvyv9L8R0nEWGMWDjRO8Xoifi7Z58Bk7fzL2S5t?=
 =?iso-8859-1?Q?Nl52UGD51PyyseluXzaKXn9O24bgyCu4Xz/Spip61ygBsX8uirqsRpiEF8?=
 =?iso-8859-1?Q?eLXYgU+TzjuMwoZCulEWtF2vn1kTio+jUjMloyVoy4ZWM5p78AI8Z6layC?=
 =?iso-8859-1?Q?WzVvm1K+gLrODJd+toF4dX1GjY/v70zbuHUVdi3NGWR/2MpXCmXCNC+lfa?=
 =?iso-8859-1?Q?+xSBdoeYd8R+njP6bOmBozv6jbiEnNcVN+88vu7OclfZgjhILtFf3vFmQf?=
 =?iso-8859-1?Q?XDtelNYBM9rBoSics0mPSASmVLFdoCNZlK7BVBtyQdppCnn72+/DTVAJmY?=
 =?iso-8859-1?Q?r2QJyhPI5e2afjdWKqw4QulLJvXmuIgZzlTwLip6tEljUj6AZvRusUH9Hd?=
 =?iso-8859-1?Q?IOCOjv9mSCMPU=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 214f106a-726f-4d83-6e0a-08dd7cc10a73
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2025 08:31:10.2201
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Qjslq3XHpTOund5iLWiD8KSilzHd+NUrE0A49BqbkqUc2Kt5JZHeXRYLOenopiwNWsw3djBV2m+nUHcRpBGzXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8363

> Subject: Re: [PATCH 2/7] ASoC: codec: tlv320aic32x4: Convert to GPIO
> descriptors
>=20
> Hi,
>=20
> Am Dienstag, 8. April 2025, 03:39:58 CEST schrieb Peng Fan (OSS):
> > From: Peng Fan <peng.fan@nxp.com>
> >
> > of_gpio.h is deprecated, update the driver to use GPIO descriptors.
> >  - Use devm_gpiod_get_optional to get GPIO descriptor, and set
> consumer
> >    name.
> >  - Use gpiod_set_value to configure output value.
> >
> > reset pin is active low, so when request the gpio, set
> GPIOD_OUT_HIGH
> > to assert reset and later deassert reset with value set to 0.
>=20
> IMHO it shouldn't matter if that pin is active-low or not. You want to
> activate that reset, so GPIOD_OUT_HIGH is correct. If the GPIO is
> active-low then nice, everything will be taken careof.
>=20
> > While at here, reorder the included headers.
> >
> > Checking the DTS that use the device, all are using
> GPIOD_ACTIVE_LOW
> > polarity for reset-gpios, so all should work as expected with this patc=
h.
> >
> > Cc: Markus Niebel <Markus.Niebel@ew.tq-group.com>
> > Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
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
> > +GPIO_ACTIVE_LOW */
>=20
> As stated above this comment shouldn't be necessary, it might be even
> confusing if there is some external inverter to the GPIO.

I just write down why use GPIOD_OUT_HIGH here.
of gpio API not take polarity into consideration, but gpiod API takes
polarity.

By adding external inverter, the reset for the codec is still low active,
but the gpio output from SoC should be high for the codec to stay
in reset state.

Then need a driver or whatever to describe the converter.

Here the reset-gpios is for codec.

>=20
> > +	aic32x4->rstn_gpio =3D devm_gpiod_get_optional(aic32x4->dev,
> "reset", GPIOD_OUT_HIGH);
> > +	if (IS_ERR(aic32x4->rstn_gpio)) {
> > +		return dev_err_probe(aic32x4->dev, PTR_ERR(aic32x4-
> >rstn_gpio),
> > +				     "Failed to get reset gpio\n");
> > +	} else {
> > +		gpiod_set_consumer_name(aic32x4->rstn_gpio,
> "tlv320aic32x4_rstn");
>=20
> Any reason to not set the consumer name to "tlv320aic32x4_reset"? I
> assume the 'n' implies active-low. But this is something for the
> devicetree, not the driver.

I not change the name, it is same as original driver
-		ret =3D devm_gpio_request_one(dev, aic32x4->rstn_gpio,
-				GPIOF_OUT_INIT_LOW, "tlv320aic32x4 rstn");

Regards,
Peng.

>=20
> Best regards,
> Alexander
>=20
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
> >  		aic32x4->mclk_name =3D "mclk";
> >  	}
> >
> > -	if (gpio_is_valid(aic32x4->rstn_gpio)) {
> > -		ret =3D devm_gpio_request_one(dev, aic32x4->rstn_gpio,
> > -				GPIOF_OUT_INIT_LOW,
> "tlv320aic32x4 rstn");
> > -		if (ret !=3D 0)
> > -			return ret;
> > -	}
> > -
> >  	ret =3D aic32x4_setup_regulators(dev, aic32x4);
> >  	if (ret) {
> >  		dev_err(dev, "Failed to setup regulators\n");
> >  		return ret;
> >  	}
> >
> > -	if (gpio_is_valid(aic32x4->rstn_gpio)) {
> > +	if (!IS_ERR(aic32x4->rstn_gpio)) {
> >  		ndelay(10);
> > -		gpio_set_value_cansleep(aic32x4->rstn_gpio, 1);
> > +		/* deassert reset */
> > +		gpiod_set_value_cansleep(aic32x4->rstn_gpio, 0);
> >  		mdelay(1);
> >  	}
> >
> >
> >
>=20
>=20
> --
> TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld,
> Germany Amtsgericht M=FCnchen, HRB 105018
> Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2F
> www.tq-
> group.com%2F&data=3D05%7C02%7Cpeng.fan%40nxp.com%7C85c2dca
> 8a42049d66eb808dd7c24eac6%7C686ea1d3bc2b4c6fa92cd99c5c301
> 635%7C0%7C0%7C638803220194936731%7CUnknown%7CTWFpbGZ
> sb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW
> 4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3D5
> MgiAxA1ccqvepsjo1%2BPD%2Fv2dMiMNe%2F%2Fmy37xvSk5Wc%3D
> &reserved=3D0
>=20


