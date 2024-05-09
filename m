Return-Path: <linux-gpio+bounces-6263-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE8F8C09B9
	for <lists+linux-gpio@lfdr.de>; Thu,  9 May 2024 04:24:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6975E28262C
	for <lists+linux-gpio@lfdr.de>; Thu,  9 May 2024 02:24:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41A2F13CAA9;
	Thu,  9 May 2024 02:24:24 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2099.outbound.protection.partner.outlook.cn [139.219.146.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E39513CA83;
	Thu,  9 May 2024 02:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715221464; cv=fail; b=dKhGm3EbOhoR6s9i9+zSGM1FrUJLEd8/F881U9s43/eRmHarurm1kgQMmMw498uBOyIzeLvgqKC8LrTrjK3AQKWqT07brZk31aXWzjX+Q1H0LYn4bJWoARmUYiFqupg8rY87suOTHwE6th+QXncq2xvvHvj2CWsWKpt9iR+Eqcw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715221464; c=relaxed/simple;
	bh=CdaaH8VTHMOis4IawMI5sw+emcoJzif5qCmpIHh77Ns=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QAuAxC7enwZb7VUphmqI92hofJ9wgVGLiajEAXwjaUqVRcqMlpwdv4/40SOtTCAN1Q3Ts2dc7xi8Bld4kXODzNaDAo8vobYbr7k74KY8bDPTir6+VASAFX0PWw4X1MsjsLy0GszfUfCRLYNAvsSHP3gHUcVayeXFQYwt1Kv7vWc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T6NnfagripZzYJfZXAQNCcj6Nhrlwh+/cT8PuVe/16aWbLqEVfA2PROiiU4nd+Js/BXz4gMof39QQi1FwpWNNO04IXIUm0MNjC2skZGAETeXkitHdGMGV/TLwC5EuQEcPv5pM8VIGixxrZDFcKfMBNiXCrTTzfFuyvdkuLWQ8ATIgvp7RxZWukmbyThCCPuwpuwOPTkiZq//MvTs//8/arxh3hdlfZ1xGmURzJZW3/uJVU/QioZ7c/eH9er66YUsLLyuB9DLzonMm85T7n9xqEaNRh5HDj6SCSu4a5CLFqx6WqEJFVimk1XdAqkQbv+5BVBnCwpzt6E2eKWWooae1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RHOfTe2NDSm8IX70nCtwPxIKNOvsa5X47EeFmMGRxEA=;
 b=FjJ0xr9yUqI8mZ9lfuhSgH5V8rympna+TanaJoGcigWREGWrEed966CS97oyxMWhYRKzqaJfh1v2EhLRGeR2xh/NDhF3dP7GTWKIVt21/EBuKsxd9kS9mQmRS7HbJ54dHs9FNsJMTzG4ptNDMvxRpPSPxJ37FEV6tNbnbMC+41MD4U5MUbBLcvksgL4P2vLzjiiCimHHOhQ0i5S/EsgyK252gLxE+KDNUL8KgqgxwjnJ1kO8PdBKLRk2dwFx5FoCcVow/AaWqYoeqxJcGmZpekhd0BkYyRgjIRQ2lEn+eUV4L52LLS5sIPHQRX52iZNtGVcr3hlRUAAgcqe4TKed0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ0PR01MB1176.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:19::9) by ZQ0PR01MB0965.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Thu, 9 May
 2024 02:24:10 +0000
Received: from ZQ0PR01MB1176.CHNPR01.prod.partner.outlook.cn
 ([fe80::feb4:a4b4:1132:58f4]) by
 ZQ0PR01MB1176.CHNPR01.prod.partner.outlook.cn ([fe80::feb4:a4b4:1132:58f4%5])
 with mapi id 15.20.7472.044; Thu, 9 May 2024 02:24:09 +0000
From: Yuklin Soo <yuklin.soo@starfivetech.com>
To: Conor Dooley <conor@kernel.org>
CC: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>, Hal Feng <hal.feng@starfivetech.com>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>, Jianlong Huang
	<jianlong.huang@starfivetech.com>, Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Drew
 Fustini <drew@beagleboard.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Subject: RE: [RFC PATCH v3 1/7] dt-bindings: pinctrl: starfive: Add JH8100
 pinctrl
Thread-Topic: [RFC PATCH v3 1/7] dt-bindings: pinctrl: starfive: Add JH8100
 pinctrl
Thread-Index: AQHanUsd82+KI3pjk0uPcQoiFxOkhLGFrVeAgAiF91A=
Date: Thu, 9 May 2024 02:24:09 +0000
Message-ID:
 <ZQ0PR01MB1176A591EE2AB5487D45D2F9F6E62@ZQ0PR01MB1176.CHNPR01.prod.partner.outlook.cn>
References: <20240503111436.113089-1-yuklin.soo@starfivetech.com>
 <20240503111436.113089-2-yuklin.soo@starfivetech.com>
 <20240503-undress-mantra-e5e46b2f6360@spud>
In-Reply-To: <20240503-undress-mantra-e5e46b2f6360@spud>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ0PR01MB1176:EE_|ZQ0PR01MB0965:EE_
x-ms-office365-filtering-correlation-id: 4d1aec90-cf48-413e-aaff-08dc6fcf1bff
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 mHdulBqYTTxXlv6LckIUT+I0xj1miPqhHtOxJVUGGFis91Kvi7/pNhf3hA134N9uo2ElsTCCVdwnhlrnhPj9D0605rozN0jr0rvbv5IfNTOGBUknQfdFpg7tRAQZVnZgHCoWP7BfuXtOm1CV+7VaKK+SCql3L7YpvzNWJHOQKQy39Jxd1svZborKxNexDkwjBDwS6GvqfAPCRx4kSPzGRZe8mQByXGqDPNig7BrrkQK2pQD96GxiM6ATCQWrv5hGidZ8UxaXv8gfrgTE4gUG2zgRUIjs/6z+uzYXB6iI6tR2zuODq8Al7yRTqSnbHTDwgwgFD1Ukkj/I02BGCLAMP+RVBY1OVkH0ewCx3PdJNYzRfqKf5m3/WYlFJ+4sAEJKa60h2SQummco4efn2GeiWROK0RO8g6S6Pk6WBysePVed3fzFGAkQDQ+PkeQKi0MBf5vJGh2/BKYqMDq35DIT2RkX7EiCL+KoTfpZCM2b06tmxsa6u4uRiqZOGhFhOoDkT9Avlhcr5m6ABV8j4puRZw0YS7zdNxKdpEo/dNZ7OHYZyjq6EgFSsXfhkdLW2+hIk8rpf/mGoGnwM04dilHaoEPABSeguOE3DVmSmXu39ykx3DBp0Fwwemzv+DiOj+3/
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ0PR01MB1176.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230031)(7416005)(41320700004)(366007)(1800799015)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?4U0+XR0sl2A7Cg8UwNerBnWSqVqLG8hqRA0D3LtqYUN9G1B4vQsYxQTE5PHs?=
 =?us-ascii?Q?ifMeTwXyPNCbbNASRjOPGyejdsSEd+92DyFcT2yB09X/iGWXpY74kGeCLvoM?=
 =?us-ascii?Q?0NougcwsrBmvnIX9Kj5gw5oKZxWdmVYMcBFwerYffR+SfYVVk2l822naLPTl?=
 =?us-ascii?Q?tJS+7WwlFuwRk7PsusZTwtnKepph2i4EYNgPrm5Sl4X2HDIPKNfjx0hJ3YAj?=
 =?us-ascii?Q?XRrgCwmWfmy9Z9WuQqPwrtyuqVq8WBmtivAzhi/hCqhRxUFtGCiQYbEvDJiP?=
 =?us-ascii?Q?FSYMwqH9+jNWm7d7llEivwTKUDslIcwHjngD212qBO7e1l0Ajw4rUa+Nt4V9?=
 =?us-ascii?Q?Py1to9FvA6jJiyERLhMz0lkOx0BTFJtl1EyWkAEtdmkAA1ya77bDKQJ/9PU6?=
 =?us-ascii?Q?fYWH5eW5eMYvGlWt0KsFxpylcb38eUwzXmnHpMmnDSaQ316u5EoAJxjkmfx3?=
 =?us-ascii?Q?eyI3M5c3aP6D4DLzj3Oo6kT+IVtNXk/yAtqHl3x/fxELOILhS0dD8mT6/hb+?=
 =?us-ascii?Q?ChYAdQ1IGFbIXP7t1m32+kuC/7BwXnZ1/y0IcGPnSirQK8kOxWxYRO7laeoI?=
 =?us-ascii?Q?E8Iy6afgbpC5H5yt4qSdeNO4HBWeGlaLfA1lswPXJ8hdrbk4RdzST0UTjI6w?=
 =?us-ascii?Q?JkwFUlQZSUADLVW+2yVbuXtGa3J3xo+8DuHQzDaVY9nZF6EqOf6sGuckm4B7?=
 =?us-ascii?Q?/igIrPARIriT4ykRZ9LU7KmotiJ8Pou2h4ZJ3/Mp0wWOXPjiF4BOKJhBpe5E?=
 =?us-ascii?Q?JA1A4Jk6noo8OrH0zYcg22lCkIQKNoG9+l9j60O2W+durmXPQMNoxX3M+IL8?=
 =?us-ascii?Q?V785C0q8+XMLpVllRVK+D461OCT/cTxlbGpfFu2CuA0y+bqTjdoXJKg+tAvG?=
 =?us-ascii?Q?3BodpjXE4a27wuyqBMAczWeIlhI39sUQ69NAtiwNZV1vANiDywVi/7Spw2zf?=
 =?us-ascii?Q?caNwxxEIfkIWAMTwgQNRHWGovBy/wNhOWRIQBWFkC5cEPIQ7D9Kb4MfEeh0m?=
 =?us-ascii?Q?vkTvS4HhRIHo3j5vqk3GSbGSPGPwVOlyf2IuNFnGrr01VZG1Epa5EFoHzPF6?=
 =?us-ascii?Q?wdCITDHWJrD/azQyl/+jAobDlI8VLCVCiVCBQNTky1b5bnTE1fC31ZIArpQf?=
 =?us-ascii?Q?cCfKse07Dw3TyLv/ha5d0Joj3HY3dPu9/k4CIZWXLi2e8Fo0FIe38qKYJ56P?=
 =?us-ascii?Q?yIcjvsElKUfnhyjj2XrXHusgwJrpXQwJ3APGfBbzJ5V+mbjM/lOcNFCgscW+?=
 =?us-ascii?Q?sHiFX2GrGsCjWVu5Gp57TvDNiwmHJwzFpecISdUjDXqd1y0+WPpYqgyXZ4BY?=
 =?us-ascii?Q?iC6eNb3jex+bewMg1lwJDrg2UPH7rvWG6PJ+KjaIWAp9TkYGcysA85ezeTVn?=
 =?us-ascii?Q?3I54AWh0r28gMF7oBOR1KpaeoF/hu0/9Rir7CaLJSHg2HqISbAsRijUdUH7m?=
 =?us-ascii?Q?mJ/lAggoJ9iH0NXwp9UmHwY9PFzgBSZnc7lX+mBMAdeQXECA7lsXUtrO9+oE?=
 =?us-ascii?Q?XfLl2yAeZttqciLlWIepZ90CvDRv0/Lb5Y8vmBsPXcCNwate7cQsqVSgBzwI?=
 =?us-ascii?Q?Qfeb6hVeVydI+oJvUTrLSdnmz6lyBiX13FuaX2rSlK7WZpXmF7bwI0DOBW35?=
 =?us-ascii?Q?Cw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ0PR01MB1176.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d1aec90-cf48-413e-aaff-08dc6fcf1bff
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2024 02:24:09.8198
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D+zMvUVdEMz1aTNzFny6n/pL8qrJNFUkTWuQhmOg2gpY2cG/rMupiU8vRYFGdpjOTWKTXZSaGd+ni9/v5cr8E5xnEpVFOiM3T2f1MEUa0YA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB0965



> -----Original Message-----
> From: Conor Dooley <conor@kernel.org>
> Sent: Saturday, May 4, 2024 12:07 AM
> To: Yuklin Soo <yuklin.soo@starfivetech.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>; Bartosz Golaszewski
> <bartosz.golaszewski@linaro.org>; Hal Feng <hal.feng@starfivetech.com>;
> Leyfoon Tan <leyfoon.tan@starfivetech.com>; Jianlong Huang
> <jianlong.huang@starfivetech.com>; Emil Renner Berthing <kernel@esmil.dk>=
;
> Rob Herring <robh@kernel.org>; Krzysztof Kozlowski
> <krzysztof.kozlowski+dt@linaro.org>; Conor Dooley <conor+dt@kernel.org>;
> Drew Fustini <drew@beagleboard.org>; linux-gpio@vger.kernel.org; linux-
> kernel@vger.kernel.org; devicetree@vger.kernel.org; linux-
> riscv@lists.infradead.org; Paul Walmsley <paul.walmsley@sifive.com>; Palm=
er
> Dabbelt <palmer@dabbelt.com>; Albert Ou <aou@eecs.berkeley.edu>
> Subject: Re: [RFC PATCH v3 1/7] dt-bindings: pinctrl: starfive: Add JH810=
0 pinctrl
>=20
> On Fri, May 03, 2024 at 07:14:30PM +0800, Alex Soo wrote:
> > Add documentation and header file for JH8100 pinctrl driver.
> >
> > Signed-off-by: Alex Soo <yuklin.soo@starfivetech.com>
>=20
> > diff --git a/include/dt-bindings/pinctrl/starfive,jh8100-pinctrl.h
> > b/include/dt-bindings/pinctrl/starfive,jh8100-pinctrl.h
> > new file mode 100644
> > index 000000000000..153ba950c062
> > --- /dev/null
> > +++ b/include/dt-bindings/pinctrl/starfive,jh8100-pinctrl.h
> > @@ -0,0 +1,13 @@
> > +/* SPDX-License-Identifier: GPL-2.0 OR MIT */
> > +/*
> > + * Copyright (C) 2023-2024 StarFive Technology Co., Ltd.
> > + */
> > +
> > +#ifndef __DT_BINDINGS_PINCTRL_STARFIVE_JH8100_H__
> > +#define __DT_BINDINGS_PINCTRL_STARFIVE_JH8100_H__
> > +
> > +/* Pad Slew Rates */
> > +#define PAD_SLEW_RATE_FAST		1
> > +#define PAD_SLEW_RATE_SLOW		0
>=20
> Should this really be in the bindings? I don't see it having a direct use=
r in the
> driver.
>=20
> Also, if this is the only header you have, I think the RFC tag could be d=
ropped,
> since there'll not be a header we need to worry about getting into U-Boot=
 etc
> with values that may change when the SoC moves from an FPGA etc to tape o=
ut.

I will drop the PAD_SLEW_RATE_* macros from dt-bindings header and move the=
m
to the DTS header file. Will submit the next version (V4) without the "RFC =
PATCH"
subject prefix.

>=20
> Cheers,
> Conor.

