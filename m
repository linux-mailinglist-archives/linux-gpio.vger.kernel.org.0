Return-Path: <linux-gpio+bounces-36894-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2ENtJk7gBmp4ogIAu9opvQ
	(envelope-from <linux-gpio+bounces-36894-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 10:58:54 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EBF654BD9A
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 10:58:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 726DE301DC06
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 08:53:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D73041C310;
	Fri, 15 May 2026 08:53:20 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2098.outbound.protection.partner.outlook.cn [139.219.17.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F1040FD92;
	Fri, 15 May 2026 08:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778835200; cv=fail; b=n5uS8w9tQt21mv4OlOkj91N7eWnDtILHHfl43wydGyJ5MudjmEzOSJSU4UcrKFioH+r90jHGRjTbfZXIrA/K2bYQeNoAio4Vg1M8KBVqiNXX2cQtDs5Yoc35EinQMvO5nEJyEofqHM+nMvKmlJTY5S3OGEwqdfkAw5hM3GnEfpk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778835200; c=relaxed/simple;
	bh=GnQobF201UliiA7XDAdnm8vc1vE0mkfDYnVxLESzJ4Q=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=mx2aF3qsA9MfSSKXAiAMJ7XMWyZsD/TS+A35GcRbY3Edd5kz9e13V/qhnkv4ruywstUhY1zQ3SE3+dF045dJHLWN0hx3xpuqI5O72eRxd4HotxLAkK7odGskJsL/KR81y2egJn2N9MV/D62BJ4lDlCOdESXTbSFQdXiB7t4R1DM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ny1/OmIMDvDlZ0gAIxsd7J5fucaL/4CXT2vDpXx7v60VZc8yS6gp9ei28L0NKZgosGEOiNZnkapT6iMQrIJhyZHXm4kwPaCAXplkczi/87hgd5RBpEodP/0b4O/Anfp6afGj0b2ehsFEZ3Nn/9h/bJfPj3WNjCUF5C/xzo3Pv5mCSSVp6FS1vc+5BdE9lOdzx7i8PRrQq/vKzkRCg8dBJIhxszSVGwd115YWfs1cC3tIIbbb1mC+W1n3T83qok4y5gipcL1kRDK5Pp/Ab0jnA7tF/cem2GgOFGN3c7odvT4vlETs/9K/T1J8YcQM4OrwUFu4kDLiOwzMZGcKy7D6cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OmZTvKCLwfhBq97T+N9oMPC0HiqvAJP0vUED9HZnIik=;
 b=YyUtrMD++96niu1aNWZSMc4zdHxhu2hhw7WL9IN/7EZ5t+by+sUIbF6gAqlIK0Hn1rSgnhvUlJNaA8MLQPms8F4hO5Z5L0Jzezf3LUpg9nHvvEyyjNdEMsU6QyEkDbgCUE0gGqEp+rdCnM9P9kX6gXN9ILfIZxtT4lKVUOtz1+Pfe5csiziAcBPH+b+feKtQhw0EAY8gc/g3w9NIFKb61ltFi+MvSDWaDT2b8e8xN3/yewd6+g6NY3qureHARVWNvR+KC85wSPFkzPvmh88bCUQrQgmEA4OglYJ/+OKyhNxnt/4Amhs9T3ms6FgUOIhH1fL52RRaj25b/oTBmq3Iyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1315.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:15::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.13; Fri, 15 May
 2026 08:53:05 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9913.009; Fri, 15 May 2026 08:53:05 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Conor Dooley <conor.dooley@microchip.com>
CC: Conor Dooley <conor@kernel.org>, Linus Walleij <linusw@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>, Paul
 Walmsley <pjw@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt
	<palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, Philipp Zabel
	<p.zabel@pengutronix.de>, Bartosz Golaszewski <brgl@kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Lianfeng
 Ouyang <lianfeng.ouyang@starfivetech.com>
Subject: Re: [PATCH v2 04/22] dt-bindings: pinctrl: Add
 starfive,jhb100-sys0-pinctrl
Thread-Topic: [PATCH v2 04/22] dt-bindings: pinctrl: Add
 starfive,jhb100-sys0-pinctrl
Thread-Index: AQHc45KRvsqG0r7N2ECAW67mfXLNbrYN3n4AgAC9aVCAABQvAIAAGT8A
Date: Fri, 15 May 2026 08:53:04 +0000
Message-ID:
 <ZQ4PR01MB1202A1C94D9A17C1F85FF1BDF2042@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20260514111218.94519-1-changhuang.liang@starfivetech.com>
 <20260514111218.94519-5-changhuang.liang@starfivetech.com>
 <20260514-undermost-gray-6c9967b363a3@spud>
 <ZQ4PR01MB1202BD7677ACAF6EE18D062AF2042@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <20260515-eligible-greasily-257029ab1720@wendy>
In-Reply-To: <20260515-eligible-greasily-257029ab1720@wendy>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1315:EE_
x-ms-office365-filtering-correlation-id: e75b3d45-7336-4aa3-31c4-08deb25f60d9
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|7416014|22082099003|18002099003|56012099003|4143699003|3023799003|38070700021;
x-microsoft-antispam-message-info:
 HuoiPgLtZFCHOJSuTMFbqOUJjb9ZdLPjx8aEYOZ0jI3zH0sp0jO2raL+7DSWGg55XhN8gfL86pkfSBlWwIiRPwtlmXwEdJSiESw7pgKz+o+zVp7PqFc2X7e/C5G15c83k1lCBJYz7tUhqMMsnfRmulUuaEVFfzhjnjgsn8A9u/wlDP+8pYm41+lH8ALarq5m0jwvo521E8qnZBNeIrUzWa3ChOOz/Q4hxEBaq4Fdva+aMKaqYmcUbPVQfzmBMrvXzqxhRyftufdwtoPKhvC+FJZOJMSchrqYfus1ba/lSqf6ve8kUVyrVfSKt6TEnPvDwGx1bcYV1BogWUNkz1PDbil6+hHMEzFpft0a1coM/WoacOgQg+3z1MKe4EmL4ugY/o8HBDq6bSe8OKPLj20J3iGnBMdyKbA63XylUzgiPSyhELR/GsSKEKDIqjshXsokThIDJqnpIIItQHhNrIZqGoteSnmR7OidoxlorNknzMP9sBbaciTXnRPBTcT2/FDKNBaVgkvTgrq9ASUNA26HZ1BcG4IRKp+Zn4r7Gwn/jRuIwUnaESUUlXXWZgwcrniV
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(22082099003)(18002099003)(56012099003)(4143699003)(3023799003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?NpwrGNuhfRXfhNP7EJqdBtQK/oOyANDPnco4zO4L457OVazhxAoVv/do92VH?=
 =?us-ascii?Q?jx2QPK/sVt1WINzjRI94VcNOpFGTJX2bzrHW2N+gbDnLC0GAg9LjYvqep/2F?=
 =?us-ascii?Q?ua7r/VGdSWDgBIHRdOac/IwdnmCRqveNt+vsLn4XcOgQSCi2+C2uDc1KD2yD?=
 =?us-ascii?Q?/OGXq+ak7/Wv/N9+YfPtXal8Rd8QhhFOgQCi50nLBGwo1ji6vEMCWFfjt6tH?=
 =?us-ascii?Q?TZMUZkAGqNBjlCn17jMLAYvVcGgtbmwrLsOjMbZKAEkJwIgx7+oDCfClQNIg?=
 =?us-ascii?Q?2S3e/Qm47fjRVz2Ug/TuTM0OL9tFIODGNgNOK5XDPMijNXWMRyG4Hm9TDIiF?=
 =?us-ascii?Q?1UR2ONkpCpmcndKBI9WGxy0flQzXcc2s3zUtYLmVLSYIxRnlYdZyGcyhtHF0?=
 =?us-ascii?Q?1koGYRha64SB76xEQeSZj9uaeQ84o80MJZ8hRY7QEWhmxeoKVTTjpSv1X6I/?=
 =?us-ascii?Q?cKRtXL1E+D/3SDP1v0sb5/Jfq2H0vluCgR693ZYFsqwcVkp9WWXEUUwhYetc?=
 =?us-ascii?Q?1mCuFKxgHa4t/6agVxI2g5tv30JgXOU9KXAs5ng39QXSb6yrVrTtzKnEKGAj?=
 =?us-ascii?Q?m0IZGjYww569trggf+AcYTYMzajKZksy7pxQXjpsomE1hS5kCPtikGEz7ArA?=
 =?us-ascii?Q?n6PS/6OtTkJE7ZQGLW2VEpSL1ZKLvkQoTZl2+X255XR56eY9aJQROTArW6cF?=
 =?us-ascii?Q?2l1tjRXOAfPcDk67WyDYBIGkmwnaHaE9YH1+rQke4JXTV3pGpeMC33Cm7A/X?=
 =?us-ascii?Q?XvOz1RgnddMxM5Y+uQTT13MDDJXFMzYOrChnyN/eL0jh8ODYz4B/47rLF+6U?=
 =?us-ascii?Q?2OQumu3H+Rh/SttenNrrEB6foM1nECcwVcbr8qQ7Dccbm3ytVHqJaR7DWGDa?=
 =?us-ascii?Q?f96+zNJqBhHov7QQ0YCurKq1oeuKoxjzHINbSNuXu9req5FoIHyKjPzg2DSn?=
 =?us-ascii?Q?55uaYJvYC9y92s4s2ZBQjJeuzmEgUtm6dNW1GR4gM1pVEkrCTBKX9/7Rcubq?=
 =?us-ascii?Q?b8oSYCztMXgHpJgRYRGcW2W3ZKKsf7LckbXGnauc/25w9mERsohLYtrs0t25?=
 =?us-ascii?Q?tauGibjOG2waa2ioXRlvFJy6HUrT101iI3q6DYyvH+vFTnVA0xuQRE9nps2F?=
 =?us-ascii?Q?HRMwdTumBXg/PF1Lz7BKx1+4CGzwo2f6MlcB5Nv1wEDzlIfMK2XdYd3lYsDe?=
 =?us-ascii?Q?o5KKoAmyENbYXIbj7TiK6pcwnlMirh6GQKf4VY4zCVXpE2ja8BbUbhjtdz3X?=
 =?us-ascii?Q?xwYe8ctw8B546zU5jrWlSrOwuj/WwtXpuOPT5FEk+Id0fGF7LOCObAguEDLO?=
 =?us-ascii?Q?oB8F5hNYrikU3EAhLTqWNOUk+fBD1lQuo1SfKYi71Ch7lPHDAy4R3EP84t6O?=
 =?us-ascii?Q?uxVe0/kMV88LYPsmgWvQ1lN1sTMTfwygU4naMKT1GZn9Zu42M8D5FozCxJEn?=
 =?us-ascii?Q?s1jcD64OucFsrX67sDcxkezwoz+hpLYutxapgmdA/c40PjcoRe2DxBB3ACc/?=
 =?us-ascii?Q?kRlls8C6sOsa5ljrhFbcSQtaK1Y4RWqRMw3a7hPwlUQ46p2Grm73eiurrObP?=
 =?us-ascii?Q?Ag9xTHWITPbrCuVnwlaGr9XZeM4ZXoHirS63vgr1xxOJTUIB902vmObwIsO0?=
 =?us-ascii?Q?K4ouqVfapwgcDP/PzAY2o6KxXazTRqCRcLaqtRR/7HKrj1fKsLUb/PElkaHt?=
 =?us-ascii?Q?zp+TrTvBhu0Z66CQxxgU5EQVfGrFNBOsLIRGH9Wltxm5C/QOQC/LljyH/RX3?=
 =?us-ascii?Q?VSBq6r66GoxqpmgGWP/IbDFqI1kSClM=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: e75b3d45-7336-4aa3-31c4-08deb25f60d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2026 08:53:04.9518
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vPZ2crvOp/O0x1Msm2t/dxk1FF3YW6GgsfVVFA8DCl1mdbsADFOM/o9W/kvy7qht8lrIGhyWLtmHNO6YtzIAKSvnndszcppso3tHWxWLbF79lUw3bBEXF1rcC73kERRn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1315
X-Rspamd-Queue-Id: 0EBF654BD9A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.54 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[starfivetech.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36894-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[18];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[changhuang.liang@starfivetech.com,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.987];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

Hi, Conor

Thank for the comments

> On Fri, May 15, 2026 at 06:10:28AM +0000, Changhuang Liang wrote:
> > Hi, Conor
> >
> > Thanks for the review.
> >
> > > On Thu, May 14, 2026 at 04:12:00AM -0700, Changhuang Liang wrote:
> > > > Add pinctrl bindings for StarFive JHB100 SoC System-0(sys0)
> > > > pinctrl controller.
> > > >
> > > > Signed-off-by: Changhuang Liang
> > > > <changhuang.liang@starfivetech.com>
> > > > ---
> > > >  .../pinctrl/starfive,jhb100-sys0-pinctrl.yaml | 175
> ++++++++++++++++++
> > > >  .../pinctrl/starfive,jhb100-pinctrl.h         |  17 ++
> > > >  2 files changed, 192 insertions(+)  create mode 100644
> > > > Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0-pin
> > > > ctrl
> > > > .yaml  create mode 100644
> > > > include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
> > > >
> > > > diff --git
> > > > a/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0-p
> > > > inct
> > > > rl.yaml
> > > > b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0-p
> > > > inct
> > > > rl.yaml
> > > > new file mode 100644
> > > > index 000000000000..21d3693587fd
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sy
> > > > +++ s0-p
> > > > +++ inctrl.yaml
> > > > @@ -0,0 +1,175 @@
> > > > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause %YAML 1.2
> > > > +---
> > > > +$id:
> > > > +http://devicetree.org/schemas/pinctrl/starfive,jhb100-sys0-pinctr
> > > > +l.ya
> > > > +ml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: StarFive JHB100 System-0 Pin Controller
> > > > +
> > > > +description: |
> > > > +  Pinctrl bindings for JHB100 RISC-V SoC from StarFive Technology =
Ltd.
> > > > +
> > > > +  The JHB100 SoC has 13 pinctrl domains - sys0, sys0h, sys1,
> > > > + sys2, per0, per1,  per2, per2pok, per3, adc0, adc1, emmc, and vga=
.
> > > > +  This document provides an overview of the "sys0" pinctrl domain.
> > > > +
> > > > +  The "sys0" domain has a pin controller which provides
> > > > +  - function selection for GPIO pads.
> > > > +  - GPIO pad configuration.
> > > > +  - GPIO interrupt handling.
> > > > +
> > > > +  In the SYS0 Pin Controller, there are 4 multi-function GPIO_PADs=
.
> > > > + Each of  them can be multiplexed to different hardware blocks
> > > > + through function  selection and each iopad has a maximum of up
> > > > + to 2
> > > functions - 0 and 1.
> > > > +  Function 0 is the default function which is generally the GPIO
> > > > + function  (or occasionally, it can be a peripheral signal).
> > > > +  Function 1 is the alternate function or peripheral signal that
> > > > + can be  routed to the iopad. The function selection is carried
> > > > + out by writing  the function number to the iopad function select
> register.
> > > > +
> > > > +  Each iopad is configurable with parameters such as
> > > > + input-enable, internal  pull-up/pull-down bias, drive strength,
> > > > + schmitt trigger, slew rate,  input  debounce nanoseconds, power
> > > > + source and drive type
> > > (open-drain or push-pull).
> > > > +
> > > > +maintainers:
> > > > +  - Alex Soo <yuklin.soo@starfivetech.com>
> > >
> > > Why is Alex the maintainer when you are the sole author?

I will change it to myself. Alex has already resigned.

> > >
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    items:
> > > > +      - const: starfive,jhb100-sys0-pinctrl
> > > > +
> > > > +  reg:
> > > > +    maxItems: 1
> > > > +
> > > > +  clocks:
> > > > +    maxItems: 1
> > > > +
> > > > +  resets:
> > > > +    maxItems: 1
> > > > +
> > > > +  interrupts:
> > > > +    maxItems: 1
> > > > +
> > > > +  interrupt-controller: true
> > > > +
> > > > +  '#interrupt-cells':
> > > > +    const: 3
> > > > +
> > > > +  gpio-controller: true
> > > > +
> > > > +  '#gpio-cells':
> > > > +    const: 3
> > > > +
> > > > +  gpio-ranges: true
> > > > +
> > > > +  gpio-line-names: true
> > > > +
> > > > +patternProperties:
> > > > +  '-grp$':
> > > > +    type: object
> > > > +    additionalProperties: false
> > > > +    patternProperties:
> > > > +      '-pins$':
> > > > +        type: object
> > > > +        description: |
> > > > +          A pinctrl node should contain at least one subnode
> > > representing the
> > > > +          pinctrl groups available in the domain. Each subnode
> > > > + will list
> > > the
> > > > +          pins it needs, and how they should be configured, with
> > > > + regard
> > > to
> > > > +          function selection, bias, input enable/disable, input sc=
hmitt
> > > > +          trigger enable/disable, slew-rate, input debounce
> > > nanoseconds,
> > > > +          drive-open-drain, drive-push-pull, power-source and
> > > drive-strength.
> > > > +        allOf:
> > > > +          - $ref: /schemas/pinctrl/pincfg-node.yaml
> > > > +          - $ref: /schemas/pinctrl/pinmux-node.yaml
> > > > +        unevaluatedProperties: false
> > >
> > > I think this should be additionalProperties, since you're citing all
> > > the properties you do support below.
> > >
> > > > +
> > > > +        properties:
> > > > +          pins:
> > > > +            description:
> > > > +              The list of IOs that properties in the pincfg node a=
pply
> to.
> > > > +
> > > > +          function:
> > > > +            description:
> > > > +              A string containing the name of the function to mux
> > > > + for
> > > these
> > > > +              pins.
> > > > +            enum: [ auxpwrgood, gpio, hbled, pe2rst_out ]
> > > > +
> > > > +          bias-disable: true
> > > > +
> > > > +          bias-pull-down:
> > > > +            type: boolean
> > > > +
> > > > +          bias-pull-up:
> > > > +            oneOf:
> > > > +              - type: boolean
> > > > +              - enum: [ 600, 900, 1200, 2000 ]
> > > > +                description: Pull up RSEL type resistance values
> > > > + (in
> > > ohms)
> > > > +            description:
> > > > +              For normal pull up type there is no need to specify
> > > > + a
> > > resistance
> > > > +              value, hence this can be specified as a boolean
> property.
> > > > +              For RSEL pull up type a resistance value (in ohms)
> > > > + can be
> > > added.
> > > > +
> > > > +          drive-open-drain: true
> > > > +
> > > > +          drive-push-pull: true
> > > > +
> > > > +          drive-strength:
> > > > +            enum: [ 2, 4, 8, 12 ]
> > > > +
> > > > +          drive-strength-microamp:
> > > > +            enum: [ 2000, 4000, 8000, 12000 ]
> > > > +
> > > > +          input-debounce-nanoseconds:
> > > > +            minimum: 0
> > > > +            maximum: 4294967295
> > > > +
> > > > +          input-disable: true
> > > > +
> > > > +          input-enable: true
> > > > +
> > > > +          input-schmitt-enable: true
> > > > +
> > > > +          input-schmitt-disable: true
> > > > +
> > > > +          power-source:
> > > > +             enum: [ 0, 1, 2 ]
> > > > +
> > > > +          slew-rate:
> > > > +            enum: [ 0, 1 ]
> > > > +            default: 0
> > > > +            description: |
> > > > +                0: slow (half frequency)
> > > > +                1: fast
> > > > +
> > > > +required:
> > > > +  - compatible
> > > > +  - reg
> > > > +  - resets
> > > > +  - interrupts
> > > > +  - interrupt-controller
> > > > +  - '#interrupt-cells'
> > > > +  - gpio-controller
> > > > +  - '#gpio-cells'
> > > > +  - gpio-ranges
> > > > +
> > > > +additionalProperties: false
> > > > +
> > > > +examples:
> > > > +  - |
> > > > +    soc {
> > > > +        #address-cells =3D <2>;
> > > > +        #size-cells =3D <2>;
> > > > +
> > > > +        pinctrl_sys0: pinctrl@13080000 {
> > > > +            compatible =3D "starfive,jhb100-sys0-pinctrl";
> > > > +            reg =3D <0x0 0x13080000 0x0 0x800>;
> > > > +            resets =3D <&sys0crg 2>;
> > > > +            interrupts =3D <56>;
> > > > +            interrupt-controller;
> > > > +            #interrupt-cells =3D <3>;
> > > > +            gpio-controller;
> > > > +            #gpio-cells =3D <3>;
> > > > +            gpio-ranges =3D <&pinctrl_sys0 0 0 0 4>;
> > > > +        };
> > > > +    };
> > > > diff --git a/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
> > > > b/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
> > > > new file mode 100644
> > > > index 000000000000..6d8f5516a178
> > > > --- /dev/null
> > > > +++ b/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
> > > > @@ -0,0 +1,17 @@
> > > > +/* SPDX-License-Identifier: GPL-2.0 OR MIT */
> > > > +/*
> > > > + * Copyright (C) 2022 StarFive Technology Co., Ltd.
> > > > + *
> > > > + * Author: Changhuang Liang <changhuang.liang@starfivetech.com>
> > > > + */
> > > > +
> > > > +#ifndef __DT_BINDINGS_PINCTRL_STARFIVE_JHB100_H__
> > > > +#define __DT_BINDINGS_PINCTRL_STARFIVE_JHB100_H__
> > > > +
> > > > +/* sys0 pad numbers */
> > > > +#define PADNUM_SYS0_GPIO_A0				0
> > > > +#define PADNUM_SYS0_GPIO_A1				1
> > > > +#define PADNUM_SYS0_GPIO_A2				2
> > > > +#define PADNUM_SYS0_GPIO_A3				3
> > >
> > > Does this provide any actual value? Across the whole series, most
> > > numbers you put in this binding headers do not appear in any drivers
> > > at all. Seems like these defines should appear in the dts directly?
> >
> > However, the current series of drivers will use some of these definitio=
ns.
> >
> > Copied from patch 12:
> > +static const struct pinvref_desc pinvref_desc_sys2[] =3D {
> > +	{
> > +		.name =3D "gpiow0",
> > +		.pin_grp =3D {
> > +			PADNUM_SYS2_GPIO_A36,
> > +			PADNUM_SYS2_GPIO_A37,
> > +			PADNUM_SYS2_GPIO_A38,
> > +			PADNUM_SYS2_GPIO_A39
> > +		},
> > +		.num_pins =3D 4,
> > +		.range =3D BIT(JHB100_PINVREF_1_8V) | BIT(JHB100_PINVREF_3_3V)
>=20
> Can you explain why you need something like this when you're using pins a=
nd
> functions? These look a lot like your own home-rolled groups, that exist =
just to
> set the range of permitted values for vref?

This part of the voltage configuration only has one register, but it applie=
s to A36/A37/A38/A39.
The range field is used to restrict the valid voltages that can be configur=
ed.

> As far as I can tell, the only controller that supports something other t=
han 1.8v
> and 3.3v is "per2", so you should be able to apply the restrictions here =
entirely
> in the dt-binding?

Okay, I will provide more details about the power source and set limits on =
the supported voltage values.

Best Regards,
Changhuang

> I notice you have
> > > > +          power-source:
> > > > +             enum: [ 0, 1, 2 ]
> in all bindings, but no explanation of what the values are. That needs to
> change, and you should not permit 1 in anything other than "per2", since =
that
> appears to be the only user.
>=20
> Also, you've not responded to my other comments, one of which was a
> question. Why not?
>=20
> Thanks,
> Conor.
>=20
> > +	},
> > +	{
> > +		.name =3D "gpiow-inner",
> > +		.pin_grp =3D {
> > +			PADNUM_SYS2_GPIO_A40,
> > +			PADNUM_SYS2_GPIO_A41,
> > +			PADNUM_SYS2_GPIO_A42,
> > +			PADNUM_SYS2_GPIO_A43
> > +		},
> > +		.num_pins =3D 4,
> > +		.range =3D BIT(JHB100_PINVREF_1_8V) | BIT(JHB100_PINVREF_3_3V)
> > +	},
> > +	{ NULL },
> > +};
> >
> > Therefore, I have uniformly created
> > include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
> >
> > Best Regards,
> > Changhuang
> >

