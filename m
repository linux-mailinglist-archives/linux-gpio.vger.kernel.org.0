Return-Path: <linux-gpio+bounces-36891-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SHNHAtHYBmrKoQIAu9opvQ
	(envelope-from <linux-gpio+bounces-36891-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 10:26:57 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 993C354B433
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 10:26:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 733313027731
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 08:24:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27B7A3FE647;
	Fri, 15 May 2026 08:24:18 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2114.outbound.protection.partner.outlook.cn [139.219.17.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA86B3FFADF;
	Fri, 15 May 2026 08:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.114
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778833457; cv=fail; b=S8gg2iLbWo5r/dHP69hqzEqP+LxwBKo7F2NBY4cGI7Nk6crtX26B6L8hFHWppivs35fuSik3qeuQ37WYOe5CdlJxdVTbAdAaOwZk3Qi/5zQnFMd4n9XV+wOm5749or7NxS4HHAB55rRcgfq7iPoQi7u2VLFTtWZJ805N0vBdA40=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778833457; c=relaxed/simple;
	bh=pm2XT8GRZ5gPSw8uqoJnYMVLySTkTaIN84Fkx8PpZTo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pJiJW+ziB6d5VMAcvDmZF0FdPiZV4T6lEY9LUyJNdvLUbZz+I/Q8qpWhnzEjy6hNPfyZ/QU6K8YMMQQVVxsgPiOAzHBO2g2FStGoxIOBKqMZcySq01oICIvttYIaAJKfo67KYj2hTy72YOLmKDbGfe74KnmuNA7HcFTmrfoh0qU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=daxXjwhvFY76Tyq5kD+PhoRz5jXLV8jxVt+VcRttgHJBF/s46kujtIzVBgo2xwAx/JUHbUzZmTnvmy3rkR5sZvSgZi2D8UmTzD8UU/tiO3APTnCwF1IBuiibn/Ucry83qu5uPQnMnuFeyeI5igu9M2pAfRqFuXnkXbAdUzYbsgEX8FHUhEIyVklHffgw+lqLhLy2X7Z32cqP61opvXRO1cUrPNbJ6BPOAPAqnFR2gvdm5Q4Yw7eS3gCk7IJZ5mRvX82dA2S52ztFgJhHI1an4LqAx82/8h/HwT5NPkuaU3sbyhc/+f7o0n2o0UyqP1CGbDIsUqmU8P2h4Au7mKlJxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=crYc6+5+fTEg1/1sUJaT/ZJHoWGHw+wI8oEIat34jtY=;
 b=eHEIWuy8ihzeXFoz4FTA2XKQSTlC/yQQ1EsTGhLGX9An9U/BBD5Rcfb1XncRTvvDBi8Lm38qGD03UWEkAFyNraI9zstNf+5xyF1vn9Ac0dQs1Z4cwCfVxkcefSfN4LrxFUQE89ckVyR7hVnZKt/bhdI20zpEK2CBlJZICBk5uxYY7r5xADtcM+wTIcWGbjcuRUwPMfolZ8h15J4bDdqCDFIYaZqF8+2qwpYFOxZNuVEUG/pUBon37mfdNM8ah/jJEMsL6vFAiWl4XYfNr641GNKGv1M8X+sTUIg57hJTXx541Xb5WUz+7dMcpmqbGI/hXVVpvAYycqQcKMhVej+5wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1267.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.13; Fri, 15 May
 2026 08:23:56 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9913.009; Fri, 15 May 2026 08:23:56 +0000
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
Subject: Re: [PATCH v2 03/22] pinctrl: pinctrl-generic: Make the "function"
 property optional
Thread-Topic: [PATCH v2 03/22] pinctrl: pinctrl-generic: Make the "function"
 property optional
Thread-Index: AQHc45KRzWGkgNqwEUK1h3GqM3NQzLYN3PGAgAC63ECAAByYgIAADMtA
Date: Fri, 15 May 2026 08:23:55 +0000
Message-ID:
 <ZQ4PR01MB1202D30B108C4562242C1ED8F2042@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20260514111218.94519-1-changhuang.liang@starfivetech.com>
 <20260514111218.94519-4-changhuang.liang@starfivetech.com>
 <20260514-operation-remix-9f9fcf9a6102@spud>
 <ZQ4PR01MB120245CDE718812D1C65638AF2042@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <20260515-dandruff-shorts-d7417c6e977a@wendy>
In-Reply-To: <20260515-dandruff-shorts-d7417c6e977a@wendy>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1267:EE_
x-ms-office365-filtering-correlation-id: 4761c01f-7b17-433b-ecbc-08deb25b4e56
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700021|18002099003|56012099003|22082099003|4143699003;
x-microsoft-antispam-message-info:
 aDvDVWtsUp8JGSD0JROnX4bx4KV7h5YH5cdc0APMFy0SQASjmmVtSt7zC/cGjNwcbwaKTYJn6Z3aZdySSqyjWMuKicgGOk17brFXU2b7y4rq+PrEqD5Onhim6OT3EDQm28PEA1UFy/vlm2rYQN4bcETxoeA+HSz4oCeyJCJ15CTC/hotBMDm3GRLfYENkrj50INQpfiA5SIsjUxVCGsze2QVTcuUWddZK7TgFqCQGztnQoTBl4oyo+o4TBpZ1IBJcTwvdJTTLEXadUlNniW2D/Lb/m/CeG2yUF9cfNkxlvtsliVz5yyMzk6pDyggD4Qobjgk8rk/AOvzWcE/6tZsJPAt2c2lqykFIqMjGZtrqOVeI1D29VMboureO5hFYIVOKt1M8mZ9t5Ef/4Rf4/MFOnZgQNTGxCeJrdp69eQtaWgi9Uz185+JOS3MGtPf116u/zw/tv9b91yiE6InBPtRqE8spWfYaiIOoGMWHshKLuB7CU9E94btYJwpsElRB3QskNsDkHmTmktqGNSMTwgquYeoyL7cO5eZYr1IRXzNksN7G3rLqEvbRYD1OPqnf/Ah
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700021)(18002099003)(56012099003)(22082099003)(4143699003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?aFuHZU3I6lvXhHnS88qn0xWFftBdPEgn5A8h84InXK980fW1JHNeQhJGJbRw?=
 =?us-ascii?Q?dH5Ar6gQn1pMGEkjck77h4AqPecKyctatmqbIaV5JEUMwmOUfk09T/kBSU9F?=
 =?us-ascii?Q?sSY6Gzps3LXIFrqXgQ1cxEkv83So5pIrpu+aPL7d+3AuqebVukDX53vXUd9N?=
 =?us-ascii?Q?PYfWEedrmsrfiBVGk00F4d1Q9rE1M6EaKQKLJQNXPOHSo5mqv5ONgR528CMZ?=
 =?us-ascii?Q?/t0BSTp2Q/6fVgLhMChxQ4azi/K9w5qW3Olzyv61yZeB/3O7h8xHak+wM148?=
 =?us-ascii?Q?jdqovwnSkQGHpwi7UeqBqRuO+HGysM6LtOrldqrnjcxt/D9KkwfwGqhkcIE7?=
 =?us-ascii?Q?sK2fFL8dPJ41L8Q8OSlzyhkndLOkewqK+ujCaqOhVAQ2ALTAdaFLAddnp8D7?=
 =?us-ascii?Q?CwUMiQs0CczVccn1TJ7Z4RkYPvfh6lJGgRL5lhIeIGBpzLbgb3P+W6Bodeyv?=
 =?us-ascii?Q?zizBuujb4j1TI1Hpz5R/6ZAG2vbBs6FyBzRyFbeo7WbTepktwxk+rOow28p1?=
 =?us-ascii?Q?Zm9qSosAVDaUbEcP8OccfUj9lDNOUBAIdzv2v0NCisEq9+ajcdPQ88+FTco+?=
 =?us-ascii?Q?6VdVeQluHKf3RalWcfA6iWvlTzhJH9N2ryjh9nK7YmxWuEurX2KSfUa3nSu8?=
 =?us-ascii?Q?pktpsxyclpgmJFZLQMnz1YHAuwYR6LX5ewmxoWEQNK/mlN7c93S/9XzhFLdq?=
 =?us-ascii?Q?RhHdAfqxxfiaXPZKa/NXoI6juwoSUSQUB1cwJZ7qC4Q1q9lBgTZpLT07c5Q8?=
 =?us-ascii?Q?Jsk5buFV5rIbO90qqBjVyi+/w4fR6F+4aAXPtmkT/RqP/SSG7SQQGGWpJEWn?=
 =?us-ascii?Q?0Boe0RX6LJLo2/jVFDGNtwKL8JWXVEfw1lEV894Y5WbzRF9eca/GuK5+fSZZ?=
 =?us-ascii?Q?W9Vl0EY1SDU6yq5Q31QUrnMKsIiJKac3vVzaVsC2DlqS6+UJK4/gcNPbfJ7m?=
 =?us-ascii?Q?4kpqh5rck1TBoltn/yFHvVHNhHwonssVTUZGU8Nc9Xy7Dg2p0xrT2syUyhYA?=
 =?us-ascii?Q?U+5HUu4UvJSi5K7UP7qEXOem7nlbEXlTnmvd+UsqRNhOW3FDoVKSgLREhCnY?=
 =?us-ascii?Q?Gt8n+KjOT9/34jIFjOO/WUd0I64KW3LFEVM0ijRjQdzUMJwYTuYD015z7eI9?=
 =?us-ascii?Q?997J290fDXomq+4ymGLN/l4xbVIHPLScebpZaVB9nwQxIxrxr1v9nznvYfiP?=
 =?us-ascii?Q?lcnvvqN8rZk8tjUl4HSxILGwnSZfhVfoNM6OJhdMe/ir3X1SmvJasZR2NUuM?=
 =?us-ascii?Q?AqdMyYISSW2ypvsVhtj3ERJGgicpkJuvpa7n4IP6Jy3n9apI6p21L5i4af4a?=
 =?us-ascii?Q?y1iPCtUyqspF30a9227yvJjTwMYmE1wv/Q08j1mtgBd5dFWCj15O8617r9/T?=
 =?us-ascii?Q?M+Dvi9LBgT/NxJY53Nk2sLVlVdNTh29fJdVOFogDjXkQJVtXB/CvgpwtZPQi?=
 =?us-ascii?Q?Kv9WeqmzxYBRVBGSvpguUtDMF1Z8uA2WrOJSW2lVEfsuIXpOinnxe46yGyUV?=
 =?us-ascii?Q?rxGifgPlX8zjZIK4LAmTCSpTiYcnC6iF5v855ispVbMQBfiEG9alZXpjKjLF?=
 =?us-ascii?Q?DBo18/4VquTqhbggVuLcJXzQM4hZst9dUR9QWVlKlxSuSPLjUiYyOy0S+jGr?=
 =?us-ascii?Q?qXdTXvB9g1wXu9NQMA/t2aWC7Z1A3MSpB0ojOcQxET3Qd3UkblBhUlJLO6u4?=
 =?us-ascii?Q?lO9hoUuHqvpuPcjJDXzCQODv65X6FsdPPxsOEr4zwdD4ynlqpXd/Sc5elE7S?=
 =?us-ascii?Q?B69Tv4oo78BV/DmMBnpzXuXR3dVGFA4=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 4761c01f-7b17-433b-ecbc-08deb25b4e56
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2026 08:23:55.8917
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jq1OGq1SQfD+JbrPIFSmNEPsDX5uANEcDiHvymGhAKp095vY5f4tPHOO8T7MlHlx+5R26gLOwV3HJfmwS+YdHhTk/wfKcz+CT8qgnH1XZ2Eqgw13QV/lBkHM1roSB2tC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1267
X-Rspamd-Queue-Id: 993C354B433
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.54 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[starfivetech.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36891-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[changhuang.liang@starfivetech.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.982];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Hi, Conor

Thanks for the comments.

> On Fri, May 15, 2026 at 05:55:48AM +0000, Changhuang Liang wrote:
> > Hi, Conor
> >
> > Thanks for the review.
> >
> > > On Thu, May 14, 2026 at 04:11:59AM -0700, Changhuang Liang wrote:
> > > > Some pinctrl subnodes only need to configure pin properties (e.g.,
> > > > power-source, bias, drive strength) without assigning any mux funct=
ion.
> > > >
> > > > Currently, the driver requires a valid "function" property for all
> > > > pinctrl subnodes. This forces the addition of dummy or redundant
> > > > "function" entries when only pin configuration is needed.
> > > >
> > > > Example use case:
> > > > gpios-configs {
> > > >     config {
> > > >         pins =3D <0 1 2 3>;
> > > >         power-source =3D <0>;
> > > >     };
> > > > };
> > > >
> > > > Make the "function" property optional. If it is missing, skip
> > > > adding the mux map and only process the pin configuration.
> > >
> > > I looked through the series though and all controllers appear to
> > > have pins and functions, is it the case that gpio is the default for
> > > these pins, so you are omitting the functions property when you are u=
sing
> the pin in gpio mode?
> > > Saying that the functions property is "redudant" makes it seem like
> > > this might be the case?
> > >
> > > I've got some feedback here, but I can't really provide it without
> > > knowing the answer to that question.
> >
> >
> > "From v1, copying Linus's suggestion:
> >
> > > +  This domain contains 4 IO groups which support voltage levels
> > > + 1.8V and 3.3V  gpioe-spi - comprises PAD_GPIO_C0 through
> PAD_GPIO_C4.
> > > +  gpioe-qspi0 - comprises PAD_GPIO_C5 through PAD_GPIO_C11.
> > > +  gpioe-qspi1 - comprises PAD_GPIO_C12 through PAD_GPIO_C19.
> > > +  gpioe-qspi2 - comprises PAD_GPIO_C20 through PAD_GPIO_C27.
> > > +
> > > +  Each of the above IO groups must be configured with a voltage
> > > + setting that matches the external  voltage level provided to the IO
> group.
> >
> > So your hardware has groups and support some properties on the group
> level.
> >
> > So expose these groups and make these properties configurable per
> > group instead of inventing per-group properties.
> >
> > > +  gpioe-spi-vref:
> > > +  gpioe-qspi0-vref:
> > > +  gpioe-qspi1-vref:
> > > +  gpioe-qspi2-vref:
> >
> > Create proper groups in the pin controller then use the standard
> > pincfg property power-source =3D <...>; for this.
> >
> > Example for a simple default hog:
> >
> > pinctrl {
> >     /* Hog the QSPI pins */
> >     pinctrl-names =3D "default";
> >     pinctrl-0 =3D <&qspi_default>;
> >
> >     qspi_default: pinctrl-qspi {
> >         config {
> >             groups =3D "gpioe-qspi-pins";
> >             power-source =3D <2>;
> >         };
> >     };
> > };
> >
> > The groups can be orthogonal to other pin handling, that's fine.
> > Implement .pin_config_group_set in struct pinconf_ops.
> >
> > However, I found that pinctrl_generic_pins_function_dt_node_to_map()
> > does not handle the groups property,
>=20
> That's kind of the whole point of the function, see the comment about
> it:
> /*
>  * For platforms that do not define groups or functions in the driver, bu=
t
>  * instead use the devicetree to describe them. This function will, unlik=
e
>  * pinconf_generic_dt_node_to_map() etc which rely on driver defined
> groups
>  * and functions, create them in addition to parsing pinconf properties a=
nd
>  * adding mappings.
>  */
>=20
> If you have the groups property in your devicetree, it contains strings t=
hat the
> driver uses to match against the groups it has defined in it.
> See my recently added microchip,pic64gx-pinctrl-gpio2 for an example of t=
hat
> if you like.
>=20
> However, if you are using the pins or pinmux properties, the groups are n=
ot
> defined in the driver, and need to be created at runtime. That's what
> pinctrl_generic_pins_function_dt_node_to_map() is for - it creates the gr=
oups
> at runtime when using the *pins* and *function* properties.
> It's in the name!
>=20
> Judging by your drivers, and how many structures you have that look very =
like
> groups from a quick glance, probably you can still make use of the groups
> property. The equivalent function to
> pinctrl_generic_pins_function_dt_node_to_map() when you're using driver
> defined groups is pinconf_generic_dt_node_to_map().

I feel that for the current platform, initializing pin voltage is suitable =
for using `pinconf_generic_dt_node_to_map()`,=20
and configuring pin mux is suitable for using `pinctrl_generic_pins_functio=
n_dt_node_to_map()`. Should I use both=20
of them at the same time?

>=20
> Also, I notice that you never actually answered the question that I
> asked:
> > > I looked through the series though and all controllers appear to
> > > have pins and functions, is it the case that gpio is the default for
> > > these pins, so you are omitting the functions property when you are u=
sing
> the pin in gpio mode?
> > > Saying that the functions property is "redudant" makes it seem like
> > > this might be the case?
>=20
> Are you omitting the functions property from your nodes when they're usin=
g
> gpio because it is a default, or is there some other reason why you're om=
itting
> the functions property sometimes?

Sorry, I missed that question. What I meant by making 'functions' optional =
is that I=20
don't care whether the current pin's default value is GPIO or some other fu=
nction.=20
Here, I just want to initialize the default voltage of these pins, not conf=
igure their=20
pin function.

This part of the voltage configuration only has one register, but it applie=
s to many=20
pins, so currently it seems I can only use pinctrl hog to initialize it.

Best Regards,
Changhuang

>=20
> > currently, my node uses pins instead, so it looks like this:
> >
> > +&pinctrl_per3 {
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&gpios_configs>;
> > +
> > +	gpios_configs: gpios-hog-grp {
> > +		gpios-hog-pins {
> > +			pins =3D <PADNUM_PER3_GPIO_E0
> > +				PADNUM_PER3_GPIO_E1
> > +				PADNUM_PER3_GPIO_E2
> > +				PADNUM_PER3_GPIO_E3
> > +				PADNUM_PER3_GPIO_E4
> > +				PADNUM_PER3_GPIO_E5
> > +				PADNUM_PER3_GPIO_E6
> > +				PADNUM_PER3_GPIO_E7
> > +				PADNUM_PER3_GPIO_E8
> > +				PADNUM_PER3_GPIO_E9
> > +				PADNUM_PER3_GPIO_E10>;
> > +			power-source =3D <JHB100_PINVREF_1_8V>;
> > +		};
> > +	};
> > +};
> >
> > Best regards,
> > Changhuang
> >

