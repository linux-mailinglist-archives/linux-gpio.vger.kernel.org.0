Return-Path: <linux-gpio+bounces-3035-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A37E684B77D
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Feb 2024 15:10:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C5A721C25BFA
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Feb 2024 14:10:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 083D013173B;
	Tue,  6 Feb 2024 14:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="HaVFBk7j"
X-Original-To: linux-gpio@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2120.outbound.protection.outlook.com [40.107.113.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2CE6DCED;
	Tue,  6 Feb 2024 14:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.120
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707228627; cv=fail; b=XjBtFDZOg4SGDd8aHNUuUZaCdQtfz3NZOG2eElRigfuNu+CznU75s7VvdrBxvQBFK9cOl47PGzfoYPTHnfe4wSAtzfDty3xIcozl/CtvxDYgKHDp+ouQfY0jq0y4LPCRBiD2PrbFi+DAasF6HzFDLvHMRhXe4t7QS4G8btyEn8I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707228627; c=relaxed/simple;
	bh=Y8XgbL1FoWAK8ileqXlAsfBUhHE/v8H1owCkGjWS/oM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=lE57pFNkDz16Z7OjFXUpxwednyZj0jm4BtxEiup4jEPNmGQs79KbofXY1PBWi1yZRCS3L4d3YgRZfIdW1z3QkYtfd6Q/22CMmvt1BtUpC3y8BV1UOEYTCn2TtprYWNQQOOTAYrp4Vj/1xO46OgaRnKdg1E0AdcvmeKiNe0lXpM4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=HaVFBk7j; arc=fail smtp.client-ip=40.107.113.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zfv/qr8XD9GYYdp8PNwVKvruv1wlkXIY//66oxbbwJOkJxqLzA66S2GVMDxQj+9KYw7xsrA60cq8BPzBKk+OU7UkNKpk/VAbebGUXPxKywOIsKZPr5gx3HHbiqEI90mHQaFm8vZubIEApcZJrt9C4Fff22Z6k/1xdSf3mcDV4yjqqv5ksj6Fj5xgTgmv2R/tEJlQ5hLJSfnUm6xoKAMmp7UiIoXjSCnwR2vWVCImd9a+8qm/2npWRlUzPNaVDRsm6HkxrJYTTLF/fEiJD5yZj76ZHT3r6A9T11tmCy8cXktnHHKYP5S5y7cPjFKIlwcqXcpLPi/Wm6pDMm4ZAC5OiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/cjVCnhbKC3sfZn/xxCqWWvWW3eMv72N6xewKTO5RBs=;
 b=l7CSu3ncvD5gj+6b3USXmTbW3FD2aINZBFKM4cLkmOZeenr1ArvVNbpvg80nZeO4qdpjtEGMNcyDz+lvrXeKEPMaaDQDGibNF0wztakLwVAf6wZa3bEBeLnfhA6yA7f+5dlc4Vj3yjKnQ2SCTw2jpz3LHoWjCCz+ewMhzgPCPIQXWWbKE6imWH+rPVrYL7EbsHtlOWz3BJapE6xqq1jPoYuiSvHZduFTUPknUfrzcjlzkOdNClBskpKgJxMFSIc/IQiHkON+i6UW1xeI6l5HF48Mi2S819+GA+3YXbxOgV92T+GEMO20HFZLZjOt/au6aFomvIQO0n4bIumFvgaicw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/cjVCnhbKC3sfZn/xxCqWWvWW3eMv72N6xewKTO5RBs=;
 b=HaVFBk7jlaQclptkWdhCTg/CQflfE94dc4kSqaVRUVlIUiipTXZS4DwLZwmjT8cYWnnmMRHLxraRZnfl69Rw4h7slfPPh/wv5gz/b5MeO+uFd+j//tZcaiOddlL972UhzQ1XwlGLEhc/0HoosnLN0sOGoisk6nH8zMlDHEhe37g=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by TYWPR01MB12125.jpnprd01.prod.outlook.com
 (2603:1096:400:440::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Tue, 6 Feb
 2024 14:10:21 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::6719:535a:7217:9f0]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::6719:535a:7217:9f0%3]) with mapi id 15.20.7249.035; Tue, 6 Feb 2024
 14:10:21 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, Linus Walleij
	<linus.walleij@linaro.org>
CC: Geert Uytterhoeven <geert+renesas@glider.be>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Prabhakar Mahadev
 Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, Thomas Gleixner <tglx@linutronix.de>
Subject: RE: [PATCH v2 0/3] RZ/G2L pinctrl trivial changes
Thread-Topic: [PATCH v2 0/3] RZ/G2L pinctrl trivial changes
Thread-Index: AQHaWQOTAc7axYD1jUyJcWqWi2l9fbD9WZpA
Date: Tue, 6 Feb 2024 14:10:21 +0000
Message-ID:
 <TYCPR01MB11269C52444CD5F53B56AF08B86462@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20240206135115.151218-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20240206135115.151218-1-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|TYWPR01MB12125:EE_
x-ms-office365-filtering-correlation-id: 9b92f8e1-baba-4c1e-881d-08dc271d5afd
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 vnj99OV0o420V81AEXqIHPGDSTpFkb4ouxgwuF7cshSMAbDxRJb6Kwt9sqPcqOMU2o/Jb91P9+ajEqmKgFcljOooffn2V0DUlcJM+vRcVwuc9CzzhkMLEhRdhubAYWD/IZfDp0kKtYBNEIHGa2Vie4Dui8w8whkHsD3/qBp4G3ppZ52oOwDe9r8zWXHOHJoX8dhjN3Rc5Intgos8fcqmnTPLMdZs1tS7J9OMOl2gUJah/rF41L8o34ELG6YkmdBAmQzs8deByDk6ep1vOr4pVeoB0ELEgu/LM9Z1tdFoL8SIcG+TuvjUxKng6/lftQbgtVQJl4XLlI4NEXB66nIRFb8OkatWIhuG9NiRt+hkrHO0Rl4tX39ZmMP54uAx7VV5KJUlRCwU7MXJIDgiJFlsYCdYCtiKeaJwrylmxzrtVPuz691NJ6Ef0qdx1LZdp+UKrVF0tFYYgoT3j8aydnG4iDrDlA6zwKRdy+pCtYHHSE+/mIw21WkFSnad5vLGecUOFpWYNwcfZ01Y0KhuqzrAmfjTeLQwmiw+zV4sbmRqVJoLKabYThg03kP5cp2qbEBHBZbNELMkamEwAu2w9pimVvGIafXkkFM3bQtQbXepFor2nWQDpHUYNepFd78fgS2r
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11269.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(136003)(376002)(39860400002)(396003)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(5660300002)(52536014)(2906002)(55016003)(86362001)(41300700001)(83380400001)(38100700002)(122000001)(26005)(7696005)(55236004)(53546011)(6506007)(9686003)(33656002)(64756008)(54906003)(66946007)(66556008)(110136005)(66476007)(66446008)(478600001)(8936002)(71200400001)(76116006)(38070700009)(4326008)(8676002)(316002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?kqapuJ4WxZn6bgEQfflO/YHFx4FtUBkwSBwyAtVCseUZZ/RA+fVrvTnWf7Oz?=
 =?us-ascii?Q?Q1Ziy1sTVlPhiVDrbD5QMIrs5zVqHZe9mtOxnbDGQVijXi5QDbLlAQAxdLch?=
 =?us-ascii?Q?6GklVI+xhcHC+lauGYxg2vpYkAWqMzBkOAnDTnzQ/O+ZIunW/CTMTU0xk0nQ?=
 =?us-ascii?Q?4+8sZAKuUaiP2hKvct+pADKEdmJMPcokvIh6QwdhgIUjv1LrPu/9QbzZy4uR?=
 =?us-ascii?Q?75NyfrGDWkNZ9c0/FeWX1oSaRELM0dbG2t6/3qUluTe7oHzmxGig8UURoz4G?=
 =?us-ascii?Q?xeT40Th5leK96t+/it/jnZGK+/zG0XMHApRuUSKt8G5E94ERlRdiO399lMni?=
 =?us-ascii?Q?FDanOXTnho7X5AOOMZRt4XsYGOq1YI1c7Qsv7IEzfiueTIEiMulVna7E5IKv?=
 =?us-ascii?Q?uZUGcIETpsQ9VVCiGTzX6r3PofV+X6/BQJOSj3na9Hes2Vs/rmWFCEFLSr5K?=
 =?us-ascii?Q?PvazbYzc9JX7EajEfyplYXngvHxikBVCbm0iTCAra21kMWe6i+mf0jvQD4Ho?=
 =?us-ascii?Q?yClVp50Lt8Ndqn9UjgoiR3j8kSBX3L54dUM/bJZFJ0S6ILGRrWwXatQUNxO8?=
 =?us-ascii?Q?yat9f9XPPws+TbV1hBLVwh9SN5BgeORGGjwP01pAUMifleRMVgagOaPyg+1L?=
 =?us-ascii?Q?pq/bfForeAhl88DD0JIwZQkcDSpjYwiCvSAurMg8QKlptxmcIl84bKb5qGmo?=
 =?us-ascii?Q?2/NeJjm8o+inHZrG25W12TvCUPTXwj0DDFoalcSN/ge0goTMZQqLhu2rl7A0?=
 =?us-ascii?Q?6lfHhNo9t8c1WQIZq4HEKZ9V0yBCLybGBOv6+yQENvClkGrd/aoq+V5HzYqk?=
 =?us-ascii?Q?PII1WWnbKO3Q9EDg53H6ZEnwUI6RQyVwMa7npi2z77WI4hyVUi34bScesKUV?=
 =?us-ascii?Q?4oPBv4vK2nlZ9rny6hjoT2dM2fkVzG5l3pFDleG0QnVd8dnRbXmEf7ssrQ4K?=
 =?us-ascii?Q?30maxzGRqjGc4s0eojxJ2Q3E7Ox67Ttys0+gT+54Z4OtvERpsvZxz1qLX0qA?=
 =?us-ascii?Q?QiAQPx6gg9/RC7hHvF1luXqjrZtdYOAivD8L20Vt+q2sxf+z/1Zgh3mtOqGe?=
 =?us-ascii?Q?gBvfjoi9tyKeyGWxbaaJgWs0kmV3h9f5T53V69XghqRE79CEVEdV//S1zDeX?=
 =?us-ascii?Q?ugNPHt0JD/cpXQvkJRS4QS3roK7EwlbyBGGhVuL3qahYhCMSMrSOPXvJtSHb?=
 =?us-ascii?Q?Tf6K/SyA6O2kmA7tlKI7hRhojcK71KlRWDYeRmdcKENXpS6puf0IRu9Efxoi?=
 =?us-ascii?Q?U25YVaaE5ELpg9Polt5hnpoL+AjskZBv4wDNzyynLQRjsipJBFmeqfBcqSiI?=
 =?us-ascii?Q?JYTUIiB1jNUIga55+n2OEWRoM8KbePDM7j9ShQcRpE+VFg7EhWUnSiR36Vko?=
 =?us-ascii?Q?yVsxukCQ8HVA8NuX1TOmeFl5b9z2PXB7pJ/GdGXISlTBB3S4kHdbK+tQubQp?=
 =?us-ascii?Q?pqOLjtA12+a/wrrIBb5CoDKNFxXc2Z19ixfwF+ePWzbge2wY+kyXEPqize5n?=
 =?us-ascii?Q?MhL6Rg3k3E0m7PK+kf2bKB6EgXSoy7s33iDCBn2qFL5g5o6kOXRsq1RIjMaJ?=
 =?us-ascii?Q?G1gh00k5b+iHaRr9HloBNMPsXmvkg0yd0vOZwlJIyeReSS3RM4jEAAd00Dnu?=
 =?us-ascii?Q?4A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11269.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b92f8e1-baba-4c1e-881d-08dc271d5afd
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2024 14:10:21.3347
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /Za7y2s77odXy/8Q2/RHJPfxf8TLWQfrK6oizSwtA/FJVrC9LYv586oZJvmYHrbKsZRzgIXO2zcdPSKHGa41MR1HSQKNnrn3EhW8O9e/NBI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB12125

+ IRQchip

> -----Original Message-----
> From: Biju Das <biju.das.jz@bp.renesas.com>
> Sent: Tuesday, February 6, 2024 1:51 PM
> To: Linus Walleij <linus.walleij@linaro.org>
> Cc: Biju Das <biju.das.jz@bp.renesas.com>; Geert Uytterhoeven
> <geert+renesas@glider.be>; linux-renesas-soc@vger.kernel.org; linux-
> gpio@vger.kernel.org; Prabhakar Mahadev Lad <prabhakar.mahadev-
> lad.rj@bp.renesas.com>; biju.das.au <biju.das.au@gmail.com>
> Subject: [PATCH v2 0/3] RZ/G2L pinctrl trivial changes
>=20
> The first patch in this series for configuring GPIO interrupt as input
> mode. Also if the bootloader sets gpio interrupt pin as function, overrid=
e
> it as gpio.
>=20
> The second and third patch is satisfy the prerequisite for IA55 tint
> registers(ie, pin will be always in gpioint mode)
>=20
> Currently on irq_disable(), we are disabling gpio interrupt enable(ISEL).
> That means the pin is just gpio input and not gpio input interrupt any
> more. So, move configuring ISEL in rzg2l_gpio_child_to_parent_hwirq()/
> rzg2l_gpio_irq_domain_free() so that pin will be gpioint always even
> during irq_disable().
>=20
> v1->v2:
>  * Added as series by adding patch#2 and #3.
>  * Replaced u32->u64 for pin_data
>  * Added rzg2l_gpio_free() for error path for bitmap_find_free_region().
>  * rzg2l_gpio_free() called during rzg2l_gpio_irq_domain_free().
>=20
> Biju Das (3):
>   pinctrl: renesas: rzg2l: Configure interrupt input mode
>   pinctrl: renesas: rzg2l: Simplify rzg2l_gpio_irq_{en,dis}able
>   pinctrl: renesas: rzg2l: Avoid configuring ISEL in
>     gpio_irq_{en,dis}able
>=20
>  drivers/pinctrl/renesas/pinctrl-rzg2l.c | 77 ++++++++++++++++---------
>  1 file changed, 50 insertions(+), 27 deletions(-)
>=20
> --
> 2.25.1


