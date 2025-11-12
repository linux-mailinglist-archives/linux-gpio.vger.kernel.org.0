Return-Path: <linux-gpio+bounces-28387-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6904AC5231E
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Nov 2025 13:11:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 48EE61885F9E
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Nov 2025 12:07:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97CA0314B91;
	Wed, 12 Nov 2025 12:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="VvZIkDyU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010030.outbound.protection.outlook.com [52.101.69.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B22A2F361F;
	Wed, 12 Nov 2025 12:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762949193; cv=fail; b=Wk873Wyymq5SNsdiz3jQlAfavgwu9RUOIkZ9lDOUaS8WvnV382U5EwlMawIG0dMV/nMWZZxj/k4qqMizHkqSCOjmPCc0Mq8uvpWQyJcuMWgbMvrkp5GBg4KKfcph1KeVVal/Myb46aGWRFB3SbfPlfKuPTnhAhEmqMAsMVByef8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762949193; c=relaxed/simple;
	bh=o3hwNnkEXozi+YLUiP2kXIl5ZwFmn01O612W3yy4+Ak=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=EPoYeBSZWMdCOqZFsa4AxhdPdVZDZ0fmP+PHDZMC5h+SyDmgjonaUf0OeZC2W976U73A6Ai5jyT4Ae8aXRi972HcI1EPf+rswbvpVkvXfqvcVTO0KtWhi12XuH4BxBVrsS29uEmlBbjLSsWkLdPvkS1NIxzSXs2OgQSbz20onIc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=VvZIkDyU; arc=fail smtp.client-ip=52.101.69.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PvfhmxwYILvJmYsX3PaHuCPUZ/5ASd9TU98t0c8LkzvOTHu1fA5Dz1/KIu4qlXJCarqaL8bqxxMlMYMIbpnVmDlLQ8B+9+hAla5BWlLjTLNl+VG1QQsVW49AerYoe0fgq1BvcjG7zEAAsTvLAn+EEmt6Pchb0xsBbNfiYIbcIp/dYhNRhjTFenVVZBadhAf8CUDKC3eo3l4GRFynoym2S8b8UtGMywYa+XKr2QXQ6w60b5v+SZ4MphQwBiUK7WBzWPtF7/0cfNTQLnrtduWHscH2rwgRScuaGX05s5exDYhgpwLAYxNUKAa/w7csRLs422T+v4NBp8jviUrB1kz/nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o3hwNnkEXozi+YLUiP2kXIl5ZwFmn01O612W3yy4+Ak=;
 b=TSZ/8UcMTVcks1cXGWG1KnnOJ3E8GSCSbZrSEateUl/q1xfQCeN/Lrif4atETlUqLT0GnmRabITvLCEdqWoL6j1l8ZgIjBKyhJA7zIk6ulbdqVDRnE341RwCl4JRJtYtLDx/yRhFrnHByttDuylK4ESI57j53k2qEkEkG6vwtxTC/H5jxkUmlvfcwSmLr/xxPuFHWmptq61Ni6JtDgn5PBB25xGKWiTHPdGBFI0huY/tuFB8XdAiCBtYgTR9izh9IDW3S9WY3GuBRakxC6iGTzeEwGzp3Q+D41+h4DazsFwfQzyMPpuPobrLdC/MWHnWBIUtdhMMTOcUqiHTXBQzJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o3hwNnkEXozi+YLUiP2kXIl5ZwFmn01O612W3yy4+Ak=;
 b=VvZIkDyUt4UUK9h6aHQ2rIiv7FDozHnWW+IS0egn2XMFtlqIhcQRygBs09wKV4rLRCha3SIyJVWCby+K7pQWznJepjGr8sVSsuowzy6DqsvVydf6SeqCY+uhGJwQU6KuK3BHh4oJ3U0XmhOTv5ydIGz3JOK6clRgmzdGeHDg8HDZGP/a2P2XnGBmA4VFAM9aKjtltHXT8fqHxelPqGSm8gGa17n2MfinswjXGR8CpC00zfDdz+F97pbZZgXD73aUZA4EyDTx8QIU7JIS9EXgyR5jvkADBVvqpFYjMd1T2A/iBW+LiT+kiJgCdG5I/uvCNkpaohJ23XBnl1M43R9MSA==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU4PR04MB12010.eurprd04.prod.outlook.com (2603:10a6:10:640::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Wed, 12 Nov
 2025 12:06:28 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9298.015; Wed, 12 Nov 2025
 12:06:28 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
CC: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun
 Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
	<broonie@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Bartosz
 Golaszewski <brgl@bgdev.pl>, Alexander Stein
	<alexander.stein@ew.tq-group.com>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, Markus Niebel <Markus.Niebel@ew.tq-group.com>
Subject: RE: [PATCH v2 0/3] ASoC: codec: Convert to GPIO descriptors for
 tlv320aic32x4
Thread-Topic: [PATCH v2 0/3] ASoC: codec: Convert to GPIO descriptors for
 tlv320aic32x4
Thread-Index: AQHb8ZgF1861pkxgOECg22UOPJgi6bTvhqeAgAAuD/A=
Date: Wed, 12 Nov 2025 12:06:28 +0000
Message-ID:
 <PAXPR04MB84599C6AF01C9C1E152C204E88CCA@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20250710-asoc-gpio-1-v2-0-2233b272a1a6@nxp.com>
 <aRRQPz6xZyHJDps-@black.igk.intel.com>
In-Reply-To: <aRRQPz6xZyHJDps-@black.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|DU4PR04MB12010:EE_
x-ms-office365-filtering-correlation-id: f13d002f-5da9-4f0a-d111-08de21e3e912
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|19092799006|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?FAsCPyBpnbyOV+g9dEKsecEga9muh1xZyVuRnL1QtR/P1sbg4AKa/YszI8aV?=
 =?us-ascii?Q?6nWgjYsbkpToi8KZmzWHWDUOzfW+/pAWov6qSRI+cspJ1vxjjWCIawb3UqCV?=
 =?us-ascii?Q?le1Rf7xk1dJCmkPYVSbR4G4Nlk8S8vQ6SlEE8hya1llBA892wDyJ7mue67mX?=
 =?us-ascii?Q?TtLsB0FPkCikKVYm6AdjIPJLjqZSKrKG7qUA8rMc/2QghVnVCLqmzZK9A9kv?=
 =?us-ascii?Q?tH+3TwC1OGa1kDmrRaVy9mZV5zFxgS8AU12KNgU7DdMBEoPPxB3bNHA+NV6U?=
 =?us-ascii?Q?m04sOb6xRCWH8Dtm571pXlcM1AmhebJdLCalsd1jzJKikNvFrHgNDfwJn6o8?=
 =?us-ascii?Q?YSY+F0nkiI//xaof0KHAoDEUEzDFJd2QkWPGV07MUMlHCDBgBJkPymrkXnOF?=
 =?us-ascii?Q?prorhOmGXVH8riTV2GWq0DOE25legzj4Uf98nid8OLCzY2dARSq2CTiOZni+?=
 =?us-ascii?Q?mZVzzLEYBXFZJsAHSI1Gk27YYpUu4F/EknH66EGe1YE7dFWEpQUN6a6H57XP?=
 =?us-ascii?Q?ZxbcIcxXoz5EZMG6ZsqmT6/axBG9SvcWLl06NO8aseyLE6L+Zc2zcKbTCsF8?=
 =?us-ascii?Q?kmmIh64Lx3Z4oZ3fEE+Vms8g/tt1wV3A5wSXZQBuBQdtWGmt7Uy/oAMvIJop?=
 =?us-ascii?Q?ZjC4PatB4Nz5tWAsgtakYAyfQGwcOEkI0rhuffj0Kg8UIf3ND46w4tq9bnH8?=
 =?us-ascii?Q?TYqx9Y2+LxzGJOu92LqxqPGgLQ2qxoiBo1Nmijpvu4OZKJZy/7i6jJ43Denf?=
 =?us-ascii?Q?AcTpUHy9sLNzuEaoxv3QYXH70PS99XiyWKRSDRlxeWh9tj7T/R0+gJ4bmTOh?=
 =?us-ascii?Q?jG7rxUMqepCM3x+oQhEVYXoJrz7NeZNBxRrC/ZGgd0D9d7G8mIsnSH9Zh1r8?=
 =?us-ascii?Q?2n6zKojFDMlOtEPyKzeRZDO7H/tiQLjJMGxjR5ZCcnHCulq3mkl9Qs8j6ZXo?=
 =?us-ascii?Q?tWxZqaaWinkzCwHoQl+jeVpZcpP8Vu1ETU2o7RZ/9+Fv0zcrC1wu9+S7ZjNx?=
 =?us-ascii?Q?neXrdn5wLGCms7KWhwn9YPTaY7NsP8Zv/mzPHHeZmtcu8lgh0LT5qsqqb5gm?=
 =?us-ascii?Q?OSo3+q9Tbtwq0A4zvx04UNdlar/R6H0WNOy1uEI/4Oj3SayIrZnpA5gR3/mk?=
 =?us-ascii?Q?B6ZHI+UbkNCCMi+r0E/Br2GJKoo0HQ4ZfPeZ7tSRwqHVwHk0IPeVUFrPZrUS?=
 =?us-ascii?Q?rF6rAWUKRD8B2MzmjHXe/etYx0qMfygpo+aar9ObE6EPKujtUrGqnfldA4D5?=
 =?us-ascii?Q?A72OELh9wAbm2WwlXcxmL6bluv3Mkz8FWr6kk5/NiWYP640BYqRsOL/OX/Ar?=
 =?us-ascii?Q?Bx65lzSqHUow66hOuxbj2pF08g78L/E651khgLQOHWZC5O1OaH+nomwmR+R6?=
 =?us-ascii?Q?Ur2qxe1+W++C7se57Cf+oCVwZY/VIDD74E/A6Tn1HvNHEefzepjcBFkreVvF?=
 =?us-ascii?Q?iu7KlFo9Svo/x6NFwIIGNOXTqthHxpG1yUggbuJr9JZpU4lYruz/1f8QouKu?=
 =?us-ascii?Q?ufWiucuNcTT7lcGreOaCscPZkJL3MrRKwm3O?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?jrvR8cfMvOZXOs9mtrmesT4p3a7etmHEebhmwOsyV0+3cLjol3ZXgIVRwGcc?=
 =?us-ascii?Q?7ejixir7I9Y1agY9jGHGtoBS+78UKGiw65ApHu+yXf95lHbi6mG8/MQzLgl2?=
 =?us-ascii?Q?LYFg38VE6QP+baPD2j0CzVFlPTuNlVFWedGfjriE8ldTBcN4ju6DU8d+hYt4?=
 =?us-ascii?Q?+bRuuyNhGaL6FGH+KnnC94F/8vrzDl71PtMN6zRyDSbgQzQWOAZnKLDUsQBM?=
 =?us-ascii?Q?t818X/3CwqGWFtvv4fgh+rq0lAcTE4ccZMLa1gVCHiRFUPS3Ny/0eaV3oOoJ?=
 =?us-ascii?Q?4qKYa/8XY2pDciz1cuXC0O7wJ8ShZljLqi5JcxofAhVRMOj1Xwgxw/QMTK8X?=
 =?us-ascii?Q?dgRcKYVC8qyGeuUBw5xT8GTmbabpNmg6/FttjS4eAVbG4oJ3zBi76zVHOizY?=
 =?us-ascii?Q?YK4kR62ky/gX8o5qoLmCxyDfmWY93mOqjSTTUXlbw08sOFU+C/q7Wl3TM//d?=
 =?us-ascii?Q?fWwijEFIwrtWNcziYMR3zTE6VpyUfC3+GXqvc+ssutm7dVZdTLnkKeDCY1DJ?=
 =?us-ascii?Q?H1Jyu7EW41eLg00vaDLkCz2Ye7VG3wC+nZY0wS7HOkeyB5aSdY4DDkMAWSr8?=
 =?us-ascii?Q?okMwNmYVuwXju5Iu5hq84qmtmHLmOML+oiuSNqbAOntL6pIdRZY8r7jjmIkp?=
 =?us-ascii?Q?4A0VFXJ1N4QLbVIFwQ7EvM0k5i8UCRSuK5fgAAmFUiUmqn3iZIWgAVkrlj61?=
 =?us-ascii?Q?Ala5UhYsrgbmZMKuci0QlNUs/LAEGkxcuYVeWap46P3hXnMujb/2OGd4J8iS?=
 =?us-ascii?Q?hgSl9QFtxy3duv2Ee1eAaNHhr6qxYr2x0Qw5kHFA1jKuL67xGxpSmxOJox49?=
 =?us-ascii?Q?ZCY0I5hjG2VCBFGEIIG06dru2ZGuWTwC8LooqrPRrU4/tQgfv0u+gz3o603h?=
 =?us-ascii?Q?sQRXCaGKDd2N85F+oJy37zu+peKshE4/JG+5bxmxslKOCzA/LrFl1lQcppXn?=
 =?us-ascii?Q?196rcv3uU/udV5ShJpycNaqJvAKB2JtB+gHf4t8fgern/VfM2hR3WdQ0TnoL?=
 =?us-ascii?Q?K9epEczxaNzL2YnyRjW1YKSDmFkwJfFSgBq4xObWhKi05+e3z/RGgmSM1Spv?=
 =?us-ascii?Q?LbbyO0yM6cXG1UAtJDlrrG6fCEhUdwSkWY29WB3YPnjVBbl89SFaERMEXtnm?=
 =?us-ascii?Q?VH6e76GEKRQOcVNijdQR+yY5Mm683Lu8Mmq63u4Wx84sawc7sook0ktIg9zt?=
 =?us-ascii?Q?QjMrnEGwmnUaJWYUGGUNV6QhWliPaih9MqqrHWKzOK0DwlFfm+Gv+Vjdh/vi?=
 =?us-ascii?Q?b7LtHnqqpJ+H/VC5IblwTbfMFwbiV3qWjqOb3BsknM258CDxR8SfF09v905K?=
 =?us-ascii?Q?5NPl3vHCvw/z8ZIuCaAhYnJCS0b/pug2c/jTD4v6CDXgzfuAjUwg6DRUQfWr?=
 =?us-ascii?Q?RzyNKCaK/MUs6FZXdFD2tLMouFSMJR2cLjRGIusiXPzO3X5Ve440Q54mG4t+?=
 =?us-ascii?Q?Ht5aBRsjSA5iDyaQSOmww7sOgiHJdmxC2ZsKx2gE/B/gVmvUsNQlKA2FL7ew?=
 =?us-ascii?Q?RTPs+Ev/LlcnwZBjMmt7x+d8o8FtdMiaw/ji8uqukBQcVk9ajXg0JzKSmlVg?=
 =?us-ascii?Q?B2gxiIDoBy5ADQoCy70=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: f13d002f-5da9-4f0a-d111-08de21e3e912
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2025 12:06:28.4775
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ikcpk9U2JxXJxkxM/iQStqNwQCKvhgnBMcUOWV2RJgVV4TJtKXT6zI5N5ZlyyGEvAEbIfyGyNC3a1xa/cecCyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB12010

Hi Andy,

> Subject: Re: [PATCH v2 0/3] ASoC: codec: Convert to GPIO descriptors
> for tlv320aic32x4
>=20
> On Thu, Jul 10, 2025 at 08:40:00PM +0800, Peng Fan wrote:
> > This patchset is a pick up of patch 1,2 from [1]. And I also collect
> > Linus's R-b for patch 2. After this patchset, there is only one user
> > of of_gpio.h left in sound driver(pxa2xx-ac97).
> >
> > of_gpio.h is deprecated, update the driver to use GPIO descriptors.
> >
> > Patch 1 is to drop legacy platform data which in-tree no users are
> > using it Patch 2 is to convert to GPIO descriptors
> >
> > Checking the DTS that use the device, all are using
> GPIOD_ACTIVE_LOW
> > polarity for reset-gpios, so all should work as expected with this patc=
h.
> >
>=20
> Peng, if you are still interested in continuing this task, you can focus =
on
> converting the drivers that use gpio_request_one() and
> devm_gpio_request_one().
> These are some like a couple of dozens only (in comparison to the
> gpio_request() and devm_gpio_request() users). Some of them are
> resided in the ASoC subsystem.

Thanks for sharing ideas on the cleanup. I am happy to do that, but
I not have time on this in the following month. If you have plan on this,
feel free to work on it. If no, I could do the cleanup at about the end
of next month.

Thanks,
Peng.

>=20
> --
> With Best Regards,
> Andy Shevchenko
>=20


