Return-Path: <linux-gpio+bounces-36916-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oDPJHFQAB2qVqgIAu9opvQ
	(envelope-from <linux-gpio+bounces-36916-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 13:15:32 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E22DC54E38D
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 13:15:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E551B30FFDF0
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 10:45:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22339466B52;
	Fri, 15 May 2026 10:45:30 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2114.outbound.protection.partner.outlook.cn [139.219.17.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D4A4611C9;
	Fri, 15 May 2026 10:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.114
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778841930; cv=fail; b=ZKUWFxz4K+PmHOsoJ1wIQMnE2Svs3FxKSjLKwkKwrc8uifRrKc+a7Vp3ZF4jBLTCbnEXi+Z7Sz/WPd5slTqFMk3DZcY6WeVAxTA5/Boc2F46E6p8iKozOPxZq2OjWrM1j3OZAIOFiDekQe6pW4qg4pj4zTTuqh3LMBd0CErIrgQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778841930; c=relaxed/simple;
	bh=64su+T8CMm6OsxYvnQLst/B1YarmNkBMxRXQWUGc7cs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jJoOWkCUGaa/h8OzvW7VXSbX22BuS2ucBbJKP7ApVp0llo50UCwq3xGNEsgq1zElLJWyjSe+d+PzAOcELb/M2pGPH5H1VXGdVMwZo9MMcdsGeWXdT17aL/elEkR5yzZ9oLn8dfVVxYH24rqY7KITyIYKgnmFWrbPOlt6q3CJX+8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MFMjLHdkJPniFWmsMIcNyfMOdRSidR731DLqLlBBedeatkkFjbW0CkJSqkLH0yc6dIDAqiKMsm3UtZWf3LNYg7flWwHoLObBg6MiHWA5taspksDhzxWmFRz+T7yBiBtogURR5nrR9jO/0NutQ7Kj4AvEC9NIJsWnP23IIIRk4kuA5IgO9Kq9dPA7MhwFXJ7PwUPw50Ys2bjBuJGVlyochqwM9xqn5f460HsggmdnUE2RYSZwrbY1XAB6uV6DK8+RCTMOwLWu4UEcTt+7v+VvWaQv02LIXThs7Cw8o3x0bo4kGeOByVv5DYHWxUgKJ0vs7xJ0UWffbjg/m7wpHhZvhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XoWscz4PesxAvAD+70LVXjdL7/ubcL+71qVNsWvsbQ0=;
 b=JyIKCYfE3/MV53Gg2HaxUtMyORF6d+LRMk86dppNj/DYWGkAN1R7BvIcEJpCPu9sHgAN5WJ2QMJCWL5RDJS/HMaJkZZtjs7A6ltaCgY6un9dnVNDcUXkvLcSAcJFVq64kI+LO8H0xi1OZgiqy7v+nsQtf2ZTRWqjaW9z2h0DgfuPol3Y4Y5R1VFCkdUsV8VrwmIc/IgbL8emXrkkoc6lGZjmn0srdNlkfyjIUDXgq0tTzC9ohS5v9LQfIKw4oVPh/87S1ji8xDa3wLK/xGRaZSW/sbKnFHIcb7iNHJH0gjtPaCx1KO1uHc/kbGpOjxamO99AglwDcLI30iBbDq/OKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1267.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.13; Fri, 15 May
 2026 10:30:38 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9913.009; Fri, 15 May 2026 10:30:38 +0000
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
Thread-Index:
 AQHc45KRzWGkgNqwEUK1h3GqM3NQzLYN3PGAgAC63ECAAByYgIAADMtAgAAXToCAAAwZ4A==
Date: Fri, 15 May 2026 10:30:38 +0000
Message-ID:
 <ZQ4PR01MB12021791B5A255F9EB91D9F6F2042@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20260514111218.94519-1-changhuang.liang@starfivetech.com>
 <20260514111218.94519-4-changhuang.liang@starfivetech.com>
 <20260514-operation-remix-9f9fcf9a6102@spud>
 <ZQ4PR01MB120245CDE718812D1C65638AF2042@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <20260515-dandruff-shorts-d7417c6e977a@wendy>
 <ZQ4PR01MB1202D30B108C4562242C1ED8F2042@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <20260515-bounce-lather-23de8e36754c@wendy>
In-Reply-To: <20260515-bounce-lather-23de8e36754c@wendy>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1267:EE_
x-ms-office365-filtering-correlation-id: b5d3cca0-895f-4016-e979-08deb26d01df
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|4143699003|22082099003|56012099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 XH5vQRDPQfJ5PzMkis2Y+MpRr/cxM+q0EyvEOSKPQsDvzzzIeaYi00lJPT21EM61wnP8KToxd92WNq/V41bPFZWht943tCLisOaAt/VxLoPTDvgEjTQNP6kZkvZWJkjY9npys00WhmBS8sUvwFvJQqCzKFkxC1i6Au9Z+oZI9PYtkOVTzhhskZh4Hf2T26+AEG5s4t9ZDN29eZ78+Cap/a0cWWkvISJC/MNLcaBZnIvj/eTXFM4bMN4UUG3Aszd2QAbwOvvBkE7Lo0FeG6YmkR5BkVqxB5ImVQOGe38KN6Ox67v0661RD+kefotRnn4u85jf6PL5OwRHx9GzY9rk9mopJPPW7DlROhUPSX7SKSDFEEvTNbBruXATFEQeaHWT6qcIg/gvBHApaDA0F8lNCHay2mDFFN/v6rRbnTRo+KOkgsGaFY68uE2ac/tFgCRNgC/YVtRFKq433dhTzKC+QMRrpEVlNjsHuIayWAUWDgVxqJ0HcI9Go3oBKG5eW0w6Uf3CArKQk5OSzIcVQ7kq0bf6oQuWJj9e/HOiaHi9dg33NvWb1a3KbEpiovczrg3s
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(4143699003)(22082099003)(56012099003)(18002099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?ImNn2cufgY7lHZbVCePm63UdWFetAxJABqF7QrcmoEYS6YXnsY54A8xaDVPw?=
 =?us-ascii?Q?2yFqOUzwmUCGKNqfFKoxPyaSnUoAmYO4y6iYneLhQFavWoESqoldv687qEFo?=
 =?us-ascii?Q?tpBP8JX8pggaYH+SywTJuKXqs5TYHSDwHMGQQJ9Ut5M+pJXykpr5wGD5dXs9?=
 =?us-ascii?Q?Nsz7Htu177rzt7ICpEs2fjtprJKehCSzthHVXQ/sEDnnlefJ5O9kfpWZluHd?=
 =?us-ascii?Q?sOVjwNo60y9ZSebB9QXFuVIgdjPXK4vlJkdLTKxpymcTzH9vq4Tj5jA1BByW?=
 =?us-ascii?Q?jEs2vJ3q8qxR32zI6hcpXLvioN7tb8u8+LgiBn77o180Wyvo1rofaA1uCYao?=
 =?us-ascii?Q?2CTG3Nm27wh/Vf7Bl9vihnZBke9f9uwUqvMqD74dKiTYukWjTSA6vOe2LFgt?=
 =?us-ascii?Q?C9U8JMNFNvNSDrtC/dk2oeLFUAzKwfI3KTOMG7bvk59FTU8AhVhtSIiIJw9I?=
 =?us-ascii?Q?iv40W2C2U2ja2Ez1gnffbVwKlZIc/jYzCfJ7sp4CJ6V4jj4O9tl1Bz6dXx+v?=
 =?us-ascii?Q?2CDoeasGI4Ax/Q4YB3yB/BnDdC1qoGKCCwEy6sCezxt4fWcPugz1sp0dZldK?=
 =?us-ascii?Q?Ejuq+LGYBkVcIiyUUwJkh2mxrt4cgwgj8HkaEyHZW1/smJF/YZJ+gk8IPtoZ?=
 =?us-ascii?Q?5jier0Xz6Ou8Nk7Y/k97k63y71I/PKu4JvZ0Azb5fkljrqSZxGD2rXcNoSBr?=
 =?us-ascii?Q?kCp2Z6RF9/L9qNQbkPqGdFY3LB9HUGJQ9ny4E37ZA1XGDHDZFNBiM4kn7mAI?=
 =?us-ascii?Q?x4CDVTfaX/a1Bhn89K+nhQ9fy3SBPCoIbrkTp7mNLjrdzELnorn1lAq9hGSU?=
 =?us-ascii?Q?F7BUKx+ttjB3XvLibbHTvicRZOcphdItyrowmu7MOqcKCAySByFugOW2oI3H?=
 =?us-ascii?Q?a2CGcN9mf8L6CnldbLGA5/BMKefFUIpDJudpM7ebUQvGQt7MIqtJPT4W6FQc?=
 =?us-ascii?Q?gL17fjZUOgBNkU0nMomK5bgff5qoa9m0VOx4jR4T/1uRFIhTZY8YkltZCPd5?=
 =?us-ascii?Q?WalSkz3TronPuJzy5PyOcvMXXnajQ+1856oVJ4rTicJJ7GI8OHx8KqqbMASn?=
 =?us-ascii?Q?Skl/eJbjySssYNMLb24koEXvdE6C8qnsv4IAe4gUhm8j2GLz9OafNp1Q/ZGW?=
 =?us-ascii?Q?phmajMUpbTHT8nGRrQLsFACxqDvVsGnh9mweEiJpQepuhmkdk33E2LYQBFhu?=
 =?us-ascii?Q?vihd+aGVUYe2HvW/yAaGa76B0oFYw15Jj/mLljTfb4G8SXf7lAHD6jPWeOb5?=
 =?us-ascii?Q?YYjc6bv5bTIeGi5jEFhirZ+uKDyaVcgIHANlS42eVTdkyIw74Zb2ZVSUhaPJ?=
 =?us-ascii?Q?dAeWbkOOwhiDfMc4QlQhcnvBucuia9yu4xTz3K/5n83o0hwo1HlDC9hIdvUk?=
 =?us-ascii?Q?9WIPXYi3/GJtRUPfyf2iLKsKJJKR5x19swEG3gb7w3q/KBGjnyt8navZ2T9s?=
 =?us-ascii?Q?gSSgqU0tvmDWR4wTMGtIGglPGZnK5tyclfICoO081c6wswFLU4IkdRM3CbU2?=
 =?us-ascii?Q?8SrSyZFHYKLAoRjtPqWQ+8R5YAeOhocxo9DV+gSAP78NCPGlN6bpdSdIh3sy?=
 =?us-ascii?Q?A6FjYlNwo3gYgZfxcmtHMJAXr2HF/Yt1c/LHhKxFpsTLO8f1JwN7vAkprNJF?=
 =?us-ascii?Q?BCDKrwS6KU6UqyhSobVXoc8muZhYm/V/iF1R8kB8xkHREoo0+6yzybCPd8zg?=
 =?us-ascii?Q?ZjIOwgenJ8LNkp9FufUKPFaS7KJg8DoL9dre+LmsX+0MGmd97COeLjTTGB9K?=
 =?us-ascii?Q?VfXzkTrXWLVXcBeLTgDv6Gm7sum3Uq4=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: b5d3cca0-895f-4016-e979-08deb26d01df
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2026 10:30:38.5566
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bgfqw6SgenOoT+tM8I9dYdmI3aWxveqJa/ulOcKb/8h13OTETam7dBxYBzIH+9L+gMmNto1dZW7+8gEcWDxgeF37VExSkg34gUn4Ey3NdmHFwl2IrtzE31OEPE4Y08v+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1267
X-Rspamd-Queue-Id: E22DC54E38D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.54 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[starfivetech.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36916-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[changhuang.liang@starfivetech.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.983];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Hi, Conor

Thanks for the comments.

> On Fri, May 15, 2026 at 08:23:55AM +0000, Changhuang Liang wrote:
> > > On Fri, May 15, 2026 at 05:55:48AM +0000, Changhuang Liang wrote:
> > > > > On Thu, May 14, 2026 at 04:11:59AM -0700, Changhuang Liang wrote:
> > > > > > Some pinctrl subnodes only need to configure pin properties
> > > > > > (e.g., power-source, bias, drive strength) without assigning an=
y mux
> function.
> > > > > >
> > > > > > Currently, the driver requires a valid "function" property for
> > > > > > all pinctrl subnodes. This forces the addition of dummy or
> > > > > > redundant "function" entries when only pin configuration is nee=
ded.
> > > > > >
> > > > > > Example use case:
> > > > > > gpios-configs {
> > > > > >     config {
> > > > > >         pins =3D <0 1 2 3>;
> > > > > >         power-source =3D <0>;
> > > > > >     };
> > > > > > };
> > > > > >
> > > > > > Make the "function" property optional. If it is missing, skip
> > > > > > adding the mux map and only process the pin configuration.
> > > > >
> > > > > I looked through the series though and all controllers appear to
> > > > > have pins and functions, is it the case that gpio is the default
> > > > > for these pins, so you are omitting the functions property when
> > > > > you are using
> > > the pin in gpio mode?
> > > > > Saying that the functions property is "redudant" makes it seem
> > > > > like this might be the case?
> > > > >
> > > > > I've got some feedback here, but I can't really provide it
> > > > > without knowing the answer to that question.
> > > >
> > > >
> > > > "From v1, copying Linus's suggestion:
> > > >
> > > > > +  This domain contains 4 IO groups which support voltage levels
> > > > > + 1.8V and 3.3V  gpioe-spi - comprises PAD_GPIO_C0 through
> > > PAD_GPIO_C4.
> > > > > +  gpioe-qspi0 - comprises PAD_GPIO_C5 through PAD_GPIO_C11.
> > > > > +  gpioe-qspi1 - comprises PAD_GPIO_C12 through PAD_GPIO_C19.
> > > > > +  gpioe-qspi2 - comprises PAD_GPIO_C20 through PAD_GPIO_C27.
> > > > > +
> > > > > +  Each of the above IO groups must be configured with a voltage
> > > > > + setting that matches the external  voltage level provided to
> > > > > + the IO
> > > group.
> > > >
> > > > So your hardware has groups and support some properties on the
> > > > group
> > > level.
> > > >
> > > > So expose these groups and make these properties configurable per
> > > > group instead of inventing per-group properties.
> > > >
> > > > > +  gpioe-spi-vref:
> > > > > +  gpioe-qspi0-vref:
> > > > > +  gpioe-qspi1-vref:
> > > > > +  gpioe-qspi2-vref:
> > > >
> > > > Create proper groups in the pin controller then use the standard
> > > > pincfg property power-source =3D <...>; for this.
> > > >
> > > > Example for a simple default hog:
> > > >
> > > > pinctrl {
> > > >     /* Hog the QSPI pins */
> > > >     pinctrl-names =3D "default";
> > > >     pinctrl-0 =3D <&qspi_default>;
> > > >
> > > >     qspi_default: pinctrl-qspi {
> > > >         config {
> > > >             groups =3D "gpioe-qspi-pins";
> > > >             power-source =3D <2>;
> > > >         };
> > > >     };
> > > > };
> > > >
> > > > The groups can be orthogonal to other pin handling, that's fine.
> > > > Implement .pin_config_group_set in struct pinconf_ops.
> > > >
> > > > However, I found that
> > > > pinctrl_generic_pins_function_dt_node_to_map()
> > > > does not handle the groups property,
> > >
> > > That's kind of the whole point of the function, see the comment
> > > about
> > > it:
> > > /*
> > >  * For platforms that do not define groups or functions in the
> > > driver, but
> > >  * instead use the devicetree to describe them. This function will,
> > > unlike
> > >  * pinconf_generic_dt_node_to_map() etc which rely on driver defined
> > > groups
> > >  * and functions, create them in addition to parsing pinconf
> > > properties and
> > >  * adding mappings.
> > >  */
> > >
> > > If you have the groups property in your devicetree, it contains
> > > strings that the driver uses to match against the groups it has defin=
ed in it.
> > > See my recently added microchip,pic64gx-pinctrl-gpio2 for an example
> > > of that if you like.
> > >
> > > However, if you are using the pins or pinmux properties, the groups
> > > are not defined in the driver, and need to be created at runtime.
> > > That's what
> > > pinctrl_generic_pins_function_dt_node_to_map() is for - it creates
> > > the groups at runtime when using the *pins* and *function* properties=
.
> > > It's in the name!
> > >
> > > Judging by your drivers, and how many structures you have that look
> > > very like groups from a quick glance, probably you can still make
> > > use of the groups property. The equivalent function to
> > > pinctrl_generic_pins_function_dt_node_to_map() when you're using
> > > driver defined groups is pinconf_generic_dt_node_to_map().
> >
> > I feel that for the current platform, initializing pin voltage is
> > suitable for using `pinconf_generic_dt_node_to_map()`,
> > and configuring pin mux is suitable for using
> > `pinctrl_generic_pins_function_dt_node_to_map()`. Should I use both of
> them at the same time?
>=20
> No, pick either groups or pins across the board and then use the appropri=
ate
> function after that. Mixing and matching just adds complication for no re=
al
> reason.
>=20
> > > Also, I notice that you never actually answered the question that I
> > > asked:
> > > > > I looked through the series though and all controllers appear to
> > > > > have pins and functions, is it the case that gpio is the default
> > > > > for these pins, so you are omitting the functions property when
> > > > > you are using
> > > the pin in gpio mode?
> > > > > Saying that the functions property is "redudant" makes it seem
> > > > > like this might be the case?
> > >
> > > Are you omitting the functions property from your nodes when they're
> > > using gpio because it is a default, or is there some other reason
> > > why you're omitting the functions property sometimes?
> >
> > Sorry, I missed that question. What I meant by making 'functions'
> > optional is that I don't care whether the current pin's default value i=
s GPIO
> or some other function.
> > Here, I just want to initialize the default voltage of these pins, not
> > configure their pin function.
>=20
> You're making them gpios in all the cases that I saw, so I think you're b=
est
> served by using the "gpio" function and thereby being able to have functi=
on as
> a required property. Unless the pins are unused, you need to set the func=
tion
> anyway, and if they're unused and survived on the values set by reset or =
prior
> boot stages, why do you need to set the voltage anyway?
>=20
> Looking at this node, it looks completely wrong to me:
> +&pinctrl_sys2 {
> +	gpiow0_configs: gpiow0-hog-grp {
> +		gpiow0-hog-pins {
> +			pins =3D <PADNUM_SYS2_GPIO_A36
> +				PADNUM_SYS2_GPIO_A37
> +				PADNUM_SYS2_GPIO_A38
> +				PADNUM_SYS2_GPIO_A39>;
> +			power-source =3D <JHB100_PINVREF_3_3V>;
> +		};
> +	};
> +
> +	gpiow_inner_configs: gpiow-inner-hog-grp {
> +		gpiow-inner-hog-pins {
> +			pins =3D <PADNUM_SYS2_GPIO_A40
> +				PADNUM_SYS2_GPIO_A41
> +				PADNUM_SYS2_GPIO_A42
> +				PADNUM_SYS2_GPIO_A43>;
> +			power-source =3D <JHB100_PINVREF_3_3V>;
> +		};
> +	};
> +
> +	uart6_pins: uart6-grp {
> +		uart6-tx-pins {
> +			pins =3D <PADNUM_SYS2_GPIO_A38>;
> +			function =3D "uart";
> +		};
> +
> +		uart6-rx-pins {
> +			pins =3D <PADNUM_SYS2_GPIO_A39>;
> +			function =3D "uart";
> +			input-enable;
> +		};
> +	};
> +};
>=20
> The pins used by uart appear also in your hog node and...
>=20
> > This part of the voltage configuration only has one register, but it
> > applies to many pins, so currently it seems I can only use pinctrl hog =
to
> initialize it.
>=20
> ...I think that relates to the point you make here. If a setting for the
> power-source applies across an entire set of pins, there's no need to
> preemptively apply this across the whole set. It's usually sufficient to =
just set
> the power-source in the nodes that describe pins that are actually in use=
, for
> example:
>=20
> | &pinctrl_sys2 {
> | 	uart6_pins: uart6-grp {
> | 		uart6-tx-pins {
> | 			pins =3D <PADNUM_SYS2_GPIO_A38>;
> | 			function =3D "uart";
> | 			power-source =3D <JHB100_PINVREF_3_3V>;
> | 		};
> |
> | 		uart6-rx-pins {
> | 			pins =3D <PADNUM_SYS2_GPIO_A39>;
> | 			function =3D "uart";
> | 			input-enable;
> | 			power-source =3D <JHB100_PINVREF_3_3V>;
> | 		};
> | 	};
> | };

I think this approach is suitable for cases where each pin has its own inde=
pendent register filed.=20
I'm not sure if it's suitable for this kind of voltage configuration where =
multiple pins share a=20
single register field.

With this approach, the driver would end up writing the same value to the s=
ame register twice,=20
once for A38 and once for A39. Is that acceptable?

If that's acceptable, the code would indeed become much simpler.

Best Regards,
Changhuang



