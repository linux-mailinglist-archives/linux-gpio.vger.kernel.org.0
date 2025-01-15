Return-Path: <linux-gpio+bounces-14819-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6877BA11AD1
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jan 2025 08:22:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A92C3A68D6
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jan 2025 07:22:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00D9B1DB122;
	Wed, 15 Jan 2025 07:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Ypi28Ca1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2072.outbound.protection.outlook.com [40.107.20.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519191DB120;
	Wed, 15 Jan 2025 07:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736925761; cv=fail; b=rKFpZ1mm87uR7jgg2SXcmQFJccvpQS3GApVXGUwYlphhjasE1qemAb3cyWylPIefIfbqqkU9lqE8vXv9ZimNfuf2dzrogL9tMe27nNVppfiGN5k5UIlt8kgkmMtBzwDTx5HFT7qEIHtC5UWZ3ys59+CBeuXpEa8YbJd30aYhm3Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736925761; c=relaxed/simple;
	bh=s2EDA8CqKMdZR5Fm67Ma6C1GHvnVEoFNHaEDAbizGVQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=mSysHA3mar6g88XVY8nw0k9FdC/bPN+49DKdS4ACFzSqJ5gh9FXKDl9gPuZhSlJHC+yqYtnwDw6JumTpx6YPXrUu7sWASzFWXDelBtvBYNeHpqQEyGdWU6u/NmJgDIIiL+FKZof4piZvkolmAdqiyjw9HOyR2250o1q+iR4IQME=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Ypi28Ca1; arc=fail smtp.client-ip=40.107.20.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UlnqbG+MEm3ftcGPrY2w9Q375spuykWlnuh9Z+tbngTl5kmghIwgnmsDD3TtQNDiiI+bmRRw41J9SR8A5gj2Rbh3IbH8azEgJCtusMHjao2TUtBnIRVBDH7QX4YetOlQ6D+9+GxxHFs3H/yzLsLjCnER/S+7Gd6r3k8PcYtfemCrjs0KdRpuIIobHnzCThwwLiG9RlbJfkUaC3F428/RJ8tKKisk8/ENIwCFqSB5Eait+HqH+vVNOMePm5nUh4d7FoGPLrgtioihpKCwi9f/5D7UyYhQ0eo3IP/LLHmX2ka51NJePRPR+o+rXGfK1rxPaTr7Q6cDXTkKKM56BPUvBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J7b18xmo5Vf6lwf0KmXV3qi/a5Zv36iNjNxLHEnNTms=;
 b=iNezaUawiCsLhEnc3cXNhxWptOqCGLsdeYNAiILYTgokiwPD/0qoavLvbTwHytnK8vPMJFFc2pNRJYKzsRMi7RTtQdcinYJ+JoRtQowninMYH+zYhJOm2xPifbegh+/0XwsFvLTs/x0xWz4Hoo+Fv6meMimlFQwXvnFyQrZBmIDm7z4Swe2RbGCzZCt1wvIGMMjS6hWC5ZIHkWAlaL64coPnvpArLarT9p2KZuQ4XcTgGOsKHP0i8EWlDwb4pGNNbAepGBwQg65Z7L1Rj7DCaatbFOYIkyJzj6yVnoOpXLZ1qpRHRca5OdZOihFmagbHL7c8Fo5NiS2aod4RZJuzfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J7b18xmo5Vf6lwf0KmXV3qi/a5Zv36iNjNxLHEnNTms=;
 b=Ypi28Ca1JuvlUTlEVklo8pfVn9+V3LzJ4QmEms5HPNyMsKE71JrU6MH2DyeV7pdyUfdXnUKSDEV+gxkO+qwX7ybACXfnLHDqeLjtPeeCUdypL7Kwq6Or3BkaknN4rpUhwBEcsnBWpjx/zhevO5ITjBv9to05rV+Ijb+2JtYVNuCysxx2gwoBNgBLzdPxhCKK0BjEjHhZpdWxNcf0X12A1DHUfve3nW1GrpBHE0KU6/DiAKT2xxrzI26D9KjgtIAWw8aGR6KlC6m6MLj+qu/L+lLV41fpyFCCQ0W/RurqBmdeS9O7+kosSvKlKJY4C8X4NqGPwcwxAMmGDByummoNww==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM9PR04MB8812.eurprd04.prod.outlook.com (2603:10a6:20b:40b::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.19; Wed, 15 Jan
 2025 07:22:36 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8356.010; Wed, 15 Jan 2025
 07:22:36 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Cristian Marussi <cristian.marussi@arm.com>
CC: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Sudeep Holla
	<sudeep.holla@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>, Linus Walleij
	<linus.walleij@linaro.org>, Aisheng Dong <aisheng.dong@nxp.com>, Fabio
 Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Jacky Bai
	<ping.bai@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha
 Hauer <s.hauer@pengutronix.de>, "arm-scmi@vger.kernel.org"
	<arm-scmi@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: RE: [PATCH 2/4] firmware: arm_scmi: bus: Bypass setting fwnode for
 pinctrl
Thread-Topic: [PATCH 2/4] firmware: arm_scmi: bus: Bypass setting fwnode for
 pinctrl
Thread-Index:
 AQHbVqX+0+eluachFU+QGh2fdZQsprL6Oo+AgAZ4SQCACIpSAIAM0h/QgAAbiICAAU+CUA==
Date: Wed, 15 Jan 2025 07:22:35 +0000
Message-ID:
 <PAXPR04MB8459B208BB8FE391C5E58DF788192@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20241225-scmi-fwdevlink-v1-0-e9a3a5341362@nxp.com>
 <20241225-scmi-fwdevlink-v1-2-e9a3a5341362@nxp.com>
 <20241227152807.xoc7gaatejdrxglg@bogus> <Z3Q07EDfN0kTiVRV@pluto>
 <20250106044120.GB14389@localhost.localdomain>
 <PAXPR04MB84595C6840D6B79B728F8B1B88182@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <Z4Y3OE8ubIWGiDhb@pluto>
In-Reply-To: <Z4Y3OE8ubIWGiDhb@pluto>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|AM9PR04MB8812:EE_
x-ms-office365-filtering-correlation-id: ccc698af-9ce9-4432-119b-08dd35356294
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?HwDIhNzY4dbXJQ9wT+6LSIUNGgHK7HXtb+sg8SE7DXxJANDWr9Qi4HbROMcz?=
 =?us-ascii?Q?yPJC+A0L1ryaDfB7wVHubqmn8tGpNjf/MdnqtyY1EgaJbhsZOXibcxs7jAj0?=
 =?us-ascii?Q?8OZA03gtE+77qa3jxMj2DzlhEwoOHPVogBID1I37dCmhvWpBqwSReBy0FFxB?=
 =?us-ascii?Q?UhRcZ5OXL5/RWmoDODVcAMuJo3vThdWFhrGQeHi2Ve0STs6QypOb1ij6NXG3?=
 =?us-ascii?Q?BspixgwDHYx9O/LlytcU7XtX6MdeoT2Kj8M05VijICBVP3tSqNiWhLyV/yDH?=
 =?us-ascii?Q?9hTRu6GzGME2zDshgdHwdgYNyVLFO+se4NssV6j7OacodoOnAdDmOUOgxB2r?=
 =?us-ascii?Q?mQEJMnYJsERdLOYOxhOEiY4HyJdBr4dt6VD13kjPVHhmAUeEgUtu8MmvNGj+?=
 =?us-ascii?Q?FriTK2vNFSBYJygd9ffNLXth0qB1/RfABQllxkZHvjKX+lX+jsBbOckEnCp4?=
 =?us-ascii?Q?KyefcxFitCDLlRGOFcaSjKzXx+N6xmDLUEOYuG0vuakSnqK2B+uo1EGmSyg1?=
 =?us-ascii?Q?9+KST+858mBRYkI92dndt60RtTUcMxV6IZ664BCPK6w8ARaFVuXGar9NabWQ?=
 =?us-ascii?Q?DO97EP1dqmhcitFyQe6brd91uvo5jpcXXnDBldEkez5Duwh1/WfEx2au+toK?=
 =?us-ascii?Q?TMYORXOmqLKkscOnkGZJnbTLSE2h7h4I+adLY4EnL/NnswHtIT3lQ8yNDJd2?=
 =?us-ascii?Q?CRrsA/acz1R1KivW3xAR4rhVddhio4jkX2GTZuYIFYBufR4jlZgvM4sF8syH?=
 =?us-ascii?Q?XHXAQ81gZmz9zkL+v6p2LVt6xdQxUB0xYHZeWc3lWyD7LowKfCRCzZB47H2/?=
 =?us-ascii?Q?oF2aizawDXUhCbslIQTywVlhKINNYGu3NOfCAzFQPUn3pV8XvknsQ8yMCt1n?=
 =?us-ascii?Q?2Kum6kJXx1noiHs0epDOwsE05BnoWuXaXnRkSHfm0JezyJsG0ckaQA4zT4lU?=
 =?us-ascii?Q?cHDig/Ok+PoiX9sXWt+zcrnUt3yaOPbLOmUR2QDzTg9u4mWhBH8ie+kUACiE?=
 =?us-ascii?Q?DHgkJo2vOnj++MUlZaht3isXko2/J9f5e46V2E8nD9hcssg4BPsNPUygVMNs?=
 =?us-ascii?Q?6h1taINcQuF9MFI2U6y/qHPNTsHxHp5cXl1kLG4lgHVoyQYYcEqEqJ2XHg8q?=
 =?us-ascii?Q?Y6ErKaCM3kEJ7yzBNosrzMrRQNTe4dhCprGmW4iyjJHjUFLq8OrAJWyrmdnE?=
 =?us-ascii?Q?EFECrxeQT3dmacq3wzlPFXRhU/UhTcKPpkLup26lQ5ivS9UczjBSMU4yCeLT?=
 =?us-ascii?Q?yBL0Sm3WhVLouczug0Xp9YI2tmlvYOPTUsyafizGByIOkx1hA3RFhh4WLIp+?=
 =?us-ascii?Q?kBhS0jWZ96rwyjzfQcf7v/S6Gl5AyPzAEWbc6+rGCr1E85xhdSyu6aaAE/+b?=
 =?us-ascii?Q?RlcqMG0oqMDBgYKfXdC3r4ol7UCT+tnm9La6a4pYZ8KwTkKlZSzR4Ajn1YDz?=
 =?us-ascii?Q?bhghUnS2Uqo=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?XASHl28l/qKPz2x+DtOYBALLnVrjT/22fXB841O2wh8BEAJt0BqzbmcJZKXx?=
 =?us-ascii?Q?H7KLpYIjFac63WUjztlwXC+zaMznNMvvxEm7RizQkpll2e0rFFA9+6Suf/Gk?=
 =?us-ascii?Q?gwGfNnM0fitFLP7nj0a8SaYl47LNEN04Dhq6zCXm2pRswxEX0v8wAr6hdfoi?=
 =?us-ascii?Q?3GeuqgCV8lpk43ZLe7nclnKVjljvFXmHWgYX0tX86tbC9HH21x2zpoHywlse?=
 =?us-ascii?Q?FoorP9OXI7+6a6gG9g+c+YTa4mxACNJ0IR67Bm02b/eihKeYOtAKonWsAMmO?=
 =?us-ascii?Q?WRFteHn9DWu2u/qUbY3ADuLv6oKa1NBDFthW63GZSengE+pmu7abrTcEoygO?=
 =?us-ascii?Q?IDf6DaJHtFEcS3V8nbuik80wCZpjHLVVNd3xxdQSVo757lem6FHzBdH+xXyj?=
 =?us-ascii?Q?PgT0396stLPU2oVi/1uCzMptM2mlWKlpQvvTFpFj0emLwDdCbloEPG3UVAoW?=
 =?us-ascii?Q?VqvagK465NmfonOFPviS60YXj6BmczZsfiUYI8WonB7IVo4wLUg7wPYYT/8h?=
 =?us-ascii?Q?6wNVyiuyXxoHlrqZ1OPcA12WrOXPy3RBRBjvqQHvBvksWxMtdypFtgzQl7My?=
 =?us-ascii?Q?ybsxUo1+jkcQD6P/TANgH3dTZB1MtPgoFAtYAdxWxS1QKZ/QJaAdqidkMs5+?=
 =?us-ascii?Q?UtNDzjHu+RqenKXTY/EVoGxo6jkdTzxBfmqUQHZnnsVw1BwsXnz+02s0kEo1?=
 =?us-ascii?Q?p9LnNeR1142OweFmZAxwihZk/ADn1SM/3cEwsz+wuTsIrXXF5wdxJxk4Zztr?=
 =?us-ascii?Q?xpsXYIf94CAhMQ/Ypaew2NYTJVUwRYr++ekdPiJa2zrFb5R0HbgwMXg5iXUX?=
 =?us-ascii?Q?IVFPcvrqtPwBkukXwplH4azD/opRpjsAmCn/+877y4KNcwpOmwJD+BqIlv9X?=
 =?us-ascii?Q?xaXoAHmfMs0b6vH7byUhN12PxLRoHjeoL6apZ7bx6qUQpSuwjxQvjB3bGNWb?=
 =?us-ascii?Q?z2u5SW8S4J3gJJ4yH7cKYN8VPx8q7VWbYD8OHN8enyzxDPhsJswjJG1K7rPf?=
 =?us-ascii?Q?7uuyBgW2gIAIoKsHje9n3wgWvVlOkLINmLddfq88u3+77CAK7dcnbESgUWnq?=
 =?us-ascii?Q?rGGO3fdkn3vkXCCoK8osdcvPzMg2ZJ3kZxK8F2vRDlCNpabI7dWfpOxA/v4C?=
 =?us-ascii?Q?H07LiAHJXPM3UH/dtPYJMtznmCceWByajtFZrjVbXr9wusgbmXp6GXhoO0PR?=
 =?us-ascii?Q?5SYGlLbHDR3BkHa/BeMcH3N8octgC8eUEARsM2m0yVPPRbicdYxYJ6jiwLPu?=
 =?us-ascii?Q?15LjdXqSQwBi5WmX20lihT5ejTVXN/YYIlnCPfa+JJc1bpPIo0yU7NW2lqmZ?=
 =?us-ascii?Q?EQUNW2vsFIh8jGtYQzvbS1bWPgGaE5dYK/FxnwTWhHxk9i2/Ltw6xIjX1jCU?=
 =?us-ascii?Q?FWtlOh2PT8Cswx9vXoJpFvUH54CW0NF3s2uCa6fnA43wv/zSmO+HT0qYCDDi?=
 =?us-ascii?Q?elVxAMenv31/rmyn+yuyRFEbSWPNHB6ohWvpK4ppLMgThr4eTpgZk4Tyh14U?=
 =?us-ascii?Q?d36eeVh3e493UHyVJc3ezy9MDMCpjpD2HVLyVqwpgB5p47OesQb46LTn0RlG?=
 =?us-ascii?Q?hGadYvWDjXXOaj/qWhA=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ccc698af-9ce9-4432-119b-08dd35356294
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2025 07:22:35.9533
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BX+aAxmEjslwgv3tpR/YI4ufwyeWZFoB/hXFRXDfUg/A7rbIkj8MTtDCYvUV5YXGxaciNtigbarV3+74SWtY8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8812

> Subject: Re: [PATCH 2/4] firmware: arm_scmi: bus: Bypass setting
> fwnode for pinctrl
>=20
> On Tue, Jan 14, 2025 at 08:31:03AM +0000, Peng Fan wrote:
> > Hi Cristian, Sudeep
> >
> > > Subject: Re: [PATCH 2/4] firmware: arm_scmi: bus: Bypass setting
> > > fwnode for pinctrl
> > >
> > [...]
> >
> > > >> fix here) than this change.
> > > >
> > > >...or indeed this is another possibility
> > >
> > > I am doing a patch as below, how to do you think?
> >
> > Do you have any comments on below ideas?
> >
> > I am thinking to send out new patchset based on below ideas in this
> > week.
> >
>=20
> Hi Peng,
>=20
> sorry for the delay.
>=20
> Why both blacklist and allowlist ?

Because there is blocklist in pinctrl-scmi.c and allowlist in
pinctrl-imx-scmi.c.

we need to make sure only one pinctrl device are
created when both drivers are built in. So to pinctrl-scmi.c,
use blacklist, to pinctrl-imx-scmi.c use allowlist.

To vendor protocols, just need allowlist.

Regards,
Peng.

>=20
> Cristian
>=20
> > >
> > > With below patch, we could resolve the devlink issue and also
> > > support mutitple vendor drivers built in, with each vendor driver
> > > has a machine_allowlist.
> > >
> > > diff --git a/drivers/firmware/arm_scmi/bus.c
> > > b/drivers/firmware/arm_scmi/bus.c index
> > > 1d2aedfcfdb4..c1c45b545480 100644
> > > --- a/drivers/firmware/arm_scmi/bus.c
> > > +++ b/drivers/firmware/arm_scmi/bus.c
> > > @@ -55,6 +55,20 @@ static int
> scmi_protocol_device_request(const
> > > struct scmi_device_id *id_table)
> > >         unsigned int id =3D 0;
> > >         struct list_head *head, *phead =3D NULL;
> > >         struct scmi_requested_dev *rdev;
> > > +       const char * const *allowlist =3D id_table->machine_allowlist=
;
> > > +       const char * const *blocklist =3D id_table->machine_blocklist=
;
> > > +
> > > +       if (blocklist && of_machine_compatible_match(blocklist)) {
> > > +               pr_debug("block SCMI device (%s) for protocol %x\n",
> > > +                        id_table->name, id_table->protocol_id);
> > > +               return 0;
> > > +       }
> > > +
> > > +       if (allowlist && !of_machine_compatible_match(allowlist)) {
> > > +               pr_debug("block SCMI device (%s) for protocol %x\n",
> > > +                        id_table->name, id_table->protocol_id);
> > > +               return 0;
> > > +       }
> > >
> > >         pr_debug("Requesting SCMI device (%s) for protocol %x\n",
> > >                  id_table->name, id_table->protocol_id); diff --git
> > > a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
> > > index 688466a0e816..e1b822d3522f 100644
> > > --- a/include/linux/scmi_protocol.h
> > > +++ b/include/linux/scmi_protocol.h
> > > @@ -950,6 +950,9 @@ struct scmi_device {  struct scmi_device_id
> {
> > >         u8 protocol_id;
> > >         const char *name;
> > > +       /* Optional */
> > > +       const char * const *machine_blocklist;
> > > +       const char * const *machine_allowlist;
> > >  };
> >
> > Thanks,
> > Peng.
> >
> > >
> > >  struct scmi_driver {
> > >
> > > Thanks,
> > > Peng
> > > >
> > > >Thanks,
> > > >Cristian

