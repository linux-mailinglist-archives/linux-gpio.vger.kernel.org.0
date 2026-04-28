Return-Path: <linux-gpio+bounces-35635-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KF4zI80Q8GmANwEAu9opvQ
	(envelope-from <linux-gpio+bounces-35635-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 03:43:41 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E183A47C825
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 03:43:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4BDB3301F9C6
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 01:43:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B33AF2D876A;
	Tue, 28 Apr 2026 01:43:38 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2121.outbound.protection.partner.outlook.cn [139.219.17.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C8372C0261;
	Tue, 28 Apr 2026 01:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.121
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777340618; cv=fail; b=uTZSdZTb0ZQ/bgeaEmwKGZe2gc9qI2+kt4fBmOCqmngnQAOaBy9z7pV5C0ezSQ/VHcqEux4GQtWZ7OYO6ajsaH8hn+MTKSDnnnV9SPvnR3Q2UuAT+/e8urBCju/sD+gRkOdSLzjCtWA2kZ7Oly6M8RSr2/xLgzM9a1F+74Uv9fQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777340618; c=relaxed/simple;
	bh=yFPNzycMqE3fwGCiUPBsf7ObWNYqrZ9G9QxkCNjWOKc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HVVqKT6dXPjscs/6erVuTVAeDF0Wb9kg/V7KCNlXah80HWfwWiQXSZ+IiPjfawhYJXdlD3vmnHWrBMJmTJ9cNOlcIXx4/JFfSrEyEwun8LKT2nIJK/BHwA3fNVlFkfQPkWcIcPIpwlxeYLzq9PnpMF8y35QxXkBcLs+uFNA3s4I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QMVhGwq19XpIBDxCBwre6Qcs3OmToMw/K/KKSgWC0SxvsqOu8x8YSAcErTXyl/qxewNZmIiLvRmtNoaCsZcRD++7TKxlaQKvLZpiW209uCbz+oVmzrZr6PZKRjOrAWdstqmhhGq31Z9bPfJxKP6SQ3HBJKTWgg3790aOsl5/1gSj1CpwMvKL2Q8sjMlNpR4sqzLmaKgB0TWWvjiCN/oxX+y3p/DYnh2cbwt4UifFqpQqiO5z8Fil6leuCLcYwoueFYfRwuKVBrMxBWmyfwrlqfg7gSRHYLylQ/7TpW12fYbQv8QSfqSMj+5EpIUD9PnvYBali12h8iqigZ8l8wn6ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RNvws75o3n4ZOVDFYGDEyBfqkZTYNAc0wpD0sV7PXD8=;
 b=lmxc7nzBGGNYFOyEZhq9RfItUHBu5PxK2sXthJN3UaYamR0v6XQ9igcFNh/vJAKK4PcJaZOuVSsl4RZNtByVtq88SQHvJcP73tO6l6dwZEQtWo+PEw/zVnaBgbRTV1uSCNa9lR/xZIdoeQooYiQcJMSd5kQ/2s+65ksl+Z2OPndbFr8EO2k6n542AON4cMfOgBtIjvsw7jYnRcGgTE1wpemlzGsJtFoinxuG9sp8jitwpTDHASuR6IYdJVZhCTD6DnlFQ3jSVZypPvVur6MNENaNWOurdvmwUAmzUfUw9ijbNrEaQSvRwwKjcuRbIlzQwjv4sO8dzfwMdNhvj7p+0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1153.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:13::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Tue, 28 Apr
 2026 01:28:05 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9846.025; Tue, 28 Apr 2026 01:28:05 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Conor Dooley <conor@kernel.org>
CC: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>, Paul Walmsley <pjw@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>, Philipp Zabel <p.zabel@pengutronix.de>,
	Bartosz Golaszewski <brgl@kernel.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, Lianfeng Ouyang
	<lianfeng.ouyang@starfivetech.com>
Subject: Re: [PATCH v1 11/20] dt-bindings: pinctrl: Add
 starfive,jhb100-per1-pinctrl
Thread-Topic: [PATCH v1 11/20] dt-bindings: pinctrl: Add
 starfive,jhb100-per1-pinctrl
Thread-Index: AQHc09tvLatUK5oq3keSy4c9Ncpt5LXubvkAgAVF1NA=
Date: Tue, 28 Apr 2026 01:28:05 +0000
Message-ID:
 <ZQ4PR01MB120229BE0DAC2658164C066AF2372@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20260424111330.702272-1-changhuang.liang@starfivetech.com>
 <20260424111330.702272-12-changhuang.liang@starfivetech.com>
 <20260424-mumps-foothill-ef122c1029c0@spud>
In-Reply-To: <20260424-mumps-foothill-ef122c1029c0@spud>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1153:EE_
x-ms-office365-filtering-correlation-id: 29c23a8b-15b0-4a83-1ad0-08dea4c5658c
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|366016|376014|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info:
 NcrLv0r/a7wJZ0G0YDRUo3cOmyjPXrMYr0VsCwCUNv2OjhIAh4eCgo+3/boz01su5nS6SqoeY13f44dW0IctE4Yow/4avDxcRo9I2q7HxwtpleGGEvnoG9qfekoDJo7QKyUm8MVlojMoxp8pltVVjL6UQjTJyvIrng8mas+GdM7MleHXAjyLLARKriZINO6fL5PDe2/AfwsJpAspT4TzKl+rhPShMQ6KQpQgfZ/6kg2v6nPqLfiJHdsM4L7nohs1p8txQXRu22+9XfUQYZqSRV/BvWxhxhEreTjXKkZCaNKitmPVlaq3sBcP1O9sU0Sx55P3P8FM2s6KdReUh8KKMoWuOG8o/UF298yrAMgYOFxBlIk/GkkEZkJEdV3A5377u6GpFa2WH5r81eMOxnooAfVstaZgHOuwkF/x3V3qVuQAKNR6ANTe5e15lU/962qxwPrhCfwWeHT4CI7IwzVdK5wUi2QJoFWWJZpkxCuPuBC1fUKGQaJB/HzOLuj1Fl83PSPBtncqte2I6Suki/Mj69vZjvfHAE0PLde8YeUx7PC7sT38gjJZ+Gi6eUIHyVRUYWGVMsGNPSB2GQuVr13yNLqtOYVlanPxD9kQqwro1ZM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014)(38070700021)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?QGhqt9Im15ssSVvz0hzevWhxqVj210qiZUnEzOG0E/WVVAmyPWAvGo50q6O9?=
 =?us-ascii?Q?af2QS2U1xiUhCyLe9yFqMlnfrpep+hFidVDQQ6uGdP9atg84l6TCOb3ogvBT?=
 =?us-ascii?Q?Hbw7aPKPeggp0Vzt98/qOhSiHB0ot7ZA/8nMU0ZOsEu5M9/H4WRgZoVZa5TV?=
 =?us-ascii?Q?l1eOOY5Jgcv5ZJkwNsN1aCIpGkRPfhGfNNfRm0m65RGegDcywuU/X/SMbWCQ?=
 =?us-ascii?Q?qDrBOBq1qUHaDgu8CJeTCsQOW9PFU29uwu6fcSYf43+HkJm1pz06HXyo+qmv?=
 =?us-ascii?Q?EecOwVn91Yrs8OWfZX9K4NIt31XwrFYVSBy3mrcQo+cG3FuNMEosxz7qheFf?=
 =?us-ascii?Q?TS8dwnlvfYixlX8/zZi8Ty0DO6Iuxs0WqH4U2+fPJ8k5bEegGFKQ9c2T0t3i?=
 =?us-ascii?Q?ykCJjasq1EA4s+4+Q+bOr5/p0cU0lFWYaAEq38G1HxdF7QeDK8A2tVrIhMAF?=
 =?us-ascii?Q?VcAsfb3Aj169ooRQQcvp1corPg+oKco//4uVFmfyZPSqk5A6pyUet2jCF2/8?=
 =?us-ascii?Q?Cxd75tepe2wb4Q1X7S/zzGAAX7IzxY9VW/F5/XQ6ZpBG0xdrVwlg5qlWnx2x?=
 =?us-ascii?Q?cukXiTTm+tbEVKAFgeYjAfUlmcVnt6MwdztAddBdWv7IiITmK/s3EhVuH/Cd?=
 =?us-ascii?Q?ZMJW3DK3BfxsxFeI28Uun/p24m2ptJiFSA7VoLdJcctNOKg8b4Bbj99Yh1sG?=
 =?us-ascii?Q?YVhR3PuUJ/d6MvYSfcoWbg8H4eZi8JFxvMgxkMolx/V6Gk7Q/sf8OYOKO80g?=
 =?us-ascii?Q?Xoesx5SKsYMV3qSKQj/ei7nfH6wr3UgNtUvnH6GOR6CItJ0gS/iMvYa3ug5k?=
 =?us-ascii?Q?Ha9QgxcNAnHGwjQMtp7CP61zzZReJSt7ru00nn19ba1e3RAplyWSsZWVotP9?=
 =?us-ascii?Q?SVkas1n5WuqhN6eU5M3CyDdWzexYZhwJi/HcTTIEgyZ/WMp7EJTyg0XDMtmM?=
 =?us-ascii?Q?ptX5RsQEfsjcO6I6UQ5D8i2czf66Otf3XYqwzJ3Ljpxja3BvAVS8dBPVxM7y?=
 =?us-ascii?Q?B8h2YG9NZFfqEJMRH21QjK5blImIpwaHW1PiYjR+9oOnj9vhVqEQ+LtUo//G?=
 =?us-ascii?Q?4O8bAcGm9/axnZFnAX9lBEioBgJxWEkvexsm/BelESoreZFRxTtIIIipD4Sb?=
 =?us-ascii?Q?Vh6rFgPJtS9wvCUXzZL1vWE4SOrmIWMEwEpniakWH9E3YLSppeUoirDn9FBn?=
 =?us-ascii?Q?RdVGSnW6P0yM7uYcIiYO0d3GaIPjIIDimChNOuicFna8D/udnhdb9NBBVyY2?=
 =?us-ascii?Q?8V5eh+eVBbq6+d53vHNG21sIXdqXcphJC2UDMqtqbPqxz+FMaDd/Oln0DBz/?=
 =?us-ascii?Q?Q8bJMwUgHcIiv5mjYEltbzQPIRoQB9aHdco8UuFKu/YnG4M9iohIx01bprV9?=
 =?us-ascii?Q?w3Bagwf52r6nI3+DjCiiHxskwBMQMWkpZLPvOm9ZKp9V3Qn2PfhRWoWaO8Tx?=
 =?us-ascii?Q?VvX0mrC2SBcGyJvFGvjntlcxQJU+rsCyT2oewx6oz9N/5n4DbxYbFh5hVsue?=
 =?us-ascii?Q?ejCpfJPr25w3r8WdrK3h1ceI+Gec2ua5jYHyGejcl2hXgx8sWo8kHc5okT2K?=
 =?us-ascii?Q?jDviuyL8O5zSuUq82zhRtAOaZtKuu75oH5YEx2s8rcnXCuzHejnVaihoccS0?=
 =?us-ascii?Q?/tNywhJH6dkc0MPltBiAxU03H5lhaQDPGCyD5NNYrkOp2DS2pZ4R/uRZrNYW?=
 =?us-ascii?Q?QWutaDibPDlbQYQiBN1sr2rltU+D2lsq2/ANXktgXjGDmovD+x6kSOskfL/Q?=
 =?us-ascii?Q?OO6PpG3Upj7lhLC5L8j1raX7CGnZstM=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 29c23a8b-15b0-4a83-1ad0-08dea4c5658c
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2026 01:28:05.2278
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AnxafjOrSPOCeAhUtTFGmlpT8/FL/C9FUPdFvkHQ16xQ2nZ/kMRxT+ScoboadLYhjIoUHL/B1f6z7/3Hfcq6ufCgYly9dryuMWxkYUC/vGY+Bo47vomN/tGoHydmJmGV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1153
X-Rspamd-Queue-Id: E183A47C825
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.54 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[starfivetech.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35635-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[changhuang.liang@starfivetech.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.983];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn:mid,11b42000:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,devicetree.org:url,starfivetech.com:email]

Hi, Conor

Thanks for the review.

> On Fri, Apr 24, 2026 at 04:13:21AM -0700, Changhuang Liang wrote:
> > Add pinctrl bindings for StarFive JHB100 SoC Peripheral-1(per1)
> > pinctrl controller.
> >
> > Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
>=20
> There's a lot of binding here, and I think a bunch of them have similar
> questions to be answered, so I am just going to review this one for now.
>=20
> > ---
> >  .../pinctrl/starfive,jhb100-per1-pinctrl.yaml | 217
> > ++++++++++++++++++
> >  1 file changed, 217 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per1-pinctrl
> > .yaml
> >
> > diff --git
> > a/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per1-pinct
> > rl.yaml
> > b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per1-pinct
> > rl.yaml
> > new file mode 100644
> > index 000000000000..b2af4df874df
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per1-p
> > +++ inctrl.yaml
> > @@ -0,0 +1,217 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause %YAML 1.2
> > +---
> > +$id:
> > +http://devicetree.org/schemas/pinctrl/starfive,jhb100-per1-pinctrl.ya
> > +ml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: StarFive JHB100 Peripheral-1 Pin Controller
> > +
> > +description: |
> > +  Pinctrl bindings for JHB100 RISC-V SoC from StarFive Technology Ltd.
> > +
> > +  The JHB100 SoC has 13 pinctrl domains - sys0, sys0h, sys1, sys2,
> > + per0, per1,  per2, per2pok, per3, adc0, adc1, emmc, and vga.
> > +  This document provides an overview of the "per1" pinctrl domain.
> > +
> > +  The "per1" domain has a pin controller which provides
> > +  - function selection for GPIO pads.
> > +  - GPIO pad configuration.
> > +  - GPIO interrupt handling.
> > +
> > +  In the Peripheral-1 Pin Controller, there are 36 multi-function
> > + GPIO_PADs. Each of them  can be multiplexed to several peripherals
> > + through function selection. Each iopad has a  maximum of up to 3
> > + functions - 0, 1, and 2. Function 0 is the default function which is
> > + generally the GPIO function. Function 1 and 2 are the alternate
> > + functions or peripheral  signals that can be routed to the iopad. The
> function selection can be carried out by  writing the function number to =
the
> iopad function select register.
> > +  Each iopad is configurable with parameters such as input-enable,
> > + internal pull-up/pull-down  bias, drive strength, schmitt trigger, sl=
ew rate,
> and debounce width.
> > +
> > +  This domain contains 4 IO groups which support voltage levels 1.8V
> > + and 3.3V  gpioe-spi - comprises PAD_GPIO_C0 through PAD_GPIO_C4.
> > +  gpioe-qspi0 - comprises PAD_GPIO_C5 through PAD_GPIO_C11.
> > +  gpioe-qspi1 - comprises PAD_GPIO_C12 through PAD_GPIO_C19.
> > +  gpioe-qspi2 - comprises PAD_GPIO_C20 through PAD_GPIO_C27.
> > +
> > +  Each of the above IO groups must be configured with a voltage
> > + setting that matches the external  voltage level provided to the IO g=
roup.
> > +
> > +maintainers:
> > +  - Alex Soo <yuklin.soo@starfivetech.com>
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - const: starfive,jhb100-per1-pinctrl
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  resets:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  interrupt-controller: true
> > +
> > +  '#interrupt-cells':
> > +    const: 2
> > +
> > +  gpio-controller: true
> > +
> > +  '#gpio-cells':
> > +    const: 2
> > +
> > +  gpio-ranges:
> > +    maxItems: 1
> > +
> > +  gpio-line-names: true
> > +
> > +  gpioe-spi-vref:
>=20
> Why are these custom properties required?
> This sounds like the sort of information that could be gleaned from the
> "power-source" property.

The voltage configuration here applies to multiple pin groups, making it le=
ss suitable to use power-source.=20
In patch 13, we defined a starfive,gmac-vsel property, which can be applied=
 to individual pins. It might be=20
more appropriate to use power-source.

>=20
> > +    description: |
> > +        Voltage reference value for the IO group "gpioe-spi"
> > +        0: voltage reference value for 3.3V
> > +        2: voltage reference value for 1.8V
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    enum: [0, 2]
> > +    default: 0
> > +
> > +  gpioe-qspi0-vref:
> > +    description: |
> > +        Voltage reference value for the IO group "gpioe-qspi0"
> > +        0: voltage reference value for 3.3V
> > +        2: voltage reference value for 1.8V
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    enum: [0, 2]
> > +    default: 0
> > +
> > +  gpioe-qspi1-vref:
> > +    description: |
> > +        Voltage reference value for the IO group "gpioe-qspi1"
> > +        0: voltage reference value for 3.3V
> > +        2: voltage reference value for 1.8V
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    enum: [0, 2]
> > +    default: 0
> > +
> > +  gpioe-qspi2-vref:
> > +    description: |
> > +        Voltage reference value for the IO group "gpioe-qspi2"
> > +        0: voltage reference value for 3.3V
> > +        2: voltage reference value for 1.8V
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    enum: [0, 2]
> > +    default: 0
> > +
> > +patternProperties:
> > +  '-grp$':
> > +    type: object
> > +    additionalProperties: false
> > +    patternProperties:
> > +      '-pins$':
> > +        type: object
> > +        description: |
> > +          A pinctrl node should contain at least one subnode
> representing the
> > +          pinctrl groups available in the domain. Each subnode will li=
st
> the
> > +          pins it needs, and how they should be configured, with regar=
d
> to
> > +          function selection, bias, input enable/disable, input schmit=
t
> > +          trigger enable/disable, slew-rate and drive strength.
> > +        allOf:
> > +          - $ref: /schemas/pinctrl/pincfg-node.yaml
> > +          - $ref: /schemas/pinctrl/pinmux-node.yaml
> > +        unevaluatedProperties: false
> > +
> > +        properties:
> > +          pinmux:
> > +            description: |
> > +              The list of GPIOs and their function select.
> > +              The PINMUX macros are used to configure the
> > +              function selection.
>=20
> Why is the pinmux property needed?
> Can you use pins and function instead?
>=20
> Looking at the defines that you have added, it appears that lots of defin=
es for
> the same peripheral share the same numerical values, suggesting that acro=
ss
> peripheral, all (or most) pins would share the same mux setting/"function
> select", suggesting that pins/function would suffice.
>=20
> I'd like to see some justification for pinmux being the right solution he=
re, like
> the "function select" used by one peripheral being significantly differen=
t for
> many of its pins.

We think that implementing this in the pinmux will be relatively simple. It=
 avoids=20
the need to create a large number of mapping relationships in the driver, w=
hich=20
simplifies our driver implementation. I'm not sure if you'll find this expl=
anation=20
acceptable.

> > +
> > +          bias-disable: true
> > +
> > +          bias-pull-up:
> > +            type: boolean
> > +
> > +          bias-pull-down:
> > +            type: boolean
> > +
> > +          drive-strength:
> > +            enum: [ 2, 4, 8, 12 ]
> > +
> > +          drive-strength-microamp:
> > +            enum: [ 2000, 4000, 8000, 12000 ]
> > +
> > +          input-enable: true
> > +
> > +          input-disable: true
> > +
> > +          input-schmitt-enable: true
> > +
> > +          input-schmitt-disable: true
> > +
> > +          slew-rate:
> > +            enum: [ 0, 1 ]
> > +            default: 0
> > +            description: |
> > +                0: slow (half frequency)
> > +                1: fast
> > +
> > +          starfive,debounce-width:
> > +            $ref: /schemas/types.yaml#/definitions/uint32
> > +            default: 0
> > +            description:
> > +              Debounce width 0 =3D Disabled, Others =3D 80ns*N stages
>=20
> This sounds like it should be called "debounce-stages".
>=20
> > +
> > +          starfive,drive-i2c-fast-mode:
> > +            type: boolean
> > +            description:
> > +              Enable I2C fast mode drive
> > +
> > +          starfive,drive-i2c-fast-mode-plus:
> > +            type: boolean
> > +            description:
> > +              Enable I2C fast mode plus drive
> > +
> > +          starfive,i2c-open-drain-pull-up-ohm:
> > +            $ref: /schemas/types.yaml#/definitions/uint32
>=20
> The unit of resistance is "ohms" in dt-schema, if you swap to that you wo=
n't
> need the $ref.
>=20
> > +            description:
> > +              open drain pull-up select
> > +            enum: [600, 900, 1200, 2000]
> > +            default: 600
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - resets
> > +  - interrupts
> > +  - interrupt-controller
> > +  - '#interrupt-cells'
> > +  - gpio-controller
> > +  - '#gpio-cells'
> > +  - gpio-ranges
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    soc {
> > +        #address-cells =3D <2>;
> > +        #size-cells =3D <2>;
> > +
> > +        pinctrl_per1: pinctrl@11b42000 {
>=20
> Drop the label here, since there's no users.

This label is referenced in gpio-ranges.

>=20
> Cheers,
> Conor.
>=20
> > +            compatible =3D "starfive,jhb100-per1-pinctrl";
> > +            reg =3D <0x0 0x11b42000 0x0 0x800>;
> > +            resets =3D <&per1crg 0>;
> > +            interrupts =3D <61>;
> > +            interrupt-controller;
> > +            #interrupt-cells =3D <2>;
> > +            gpio-controller;
> > +            #gpio-cells =3D <2>;
> > +            gpio-ranges =3D <&pinctrl_per1 0 0 36>;
> > +        };
> > +    };
> > --
> > 2.25.1
> >

Best Regards,
Changhuang

