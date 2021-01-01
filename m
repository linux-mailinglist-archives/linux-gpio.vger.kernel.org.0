Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 613CE2E8525
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Jan 2021 18:09:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727301AbhAARId (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 1 Jan 2021 12:08:33 -0500
Received: from mail-eopbgr1320129.outbound.protection.outlook.com ([40.107.132.129]:1165
        "EHLO APC01-PU1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726798AbhAARIc (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 1 Jan 2021 12:08:32 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U7Ab8WuHoWUnNqTkdW0kPPQwFytieGl6pa64gvavIZUItMl79Bbn/WJ/vaTTkcYN6PxlJUqMSh8BDqBUVf1IuDPSOQtSDlVpzkb89BDDAx2cEfdVRLLT0XDZa0vNiPchX5YRvmwnusPFwIasWszlyXUyhPfWQ7QZYC/aUK+ZJDLxDzWGGb8F6bdzau1FqoSNG7HSw3+p+SKHCzqzUzmMOl4KHzZlDtDRACMHAcg8XvG/3TOhGC57efzt/Ldv2gHA+AeBbDRPWmAz0PfpeVprMuuHChxY+ywz9XCSmuzu7g+ZkTnljKvz7bRLQVTZosUkN3C3b1tv0XJphypP5dpC/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C6h+EiM/SYftFSkxbi+3SrhdnY0PS+SGnaR/EuaRexI=;
 b=cP3MhVgSb+r7RtTRF0Np6voCfMnxPTBJp/QGoEJImVu3Lygxaaf2eFQuJN8VzDmr1UjV/9tUaymEfub3a/FMKDIfys3l829uVyN1h+Gm/SHnCs+KKbFjXjzbAyBlDW2raE8BQtvzVyWnetR6BT2HE0yMlEeyCeczVb0cEDf22QA4lEffIy0ra3GvOxpWzjrINoB5lml7wJ83iEGWh91zPYvEiFr75cyfNvqgvb99zCf7yb7CMWaeMFdtrItihDxnM93uiKC5D2pfqo2+1rhCGgiKt0MAbe1uxnTHzbllAYyw78pgcv1QiuWrxFhrQH9sXo9Xs8EVzYv3BL9a56gGRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C6h+EiM/SYftFSkxbi+3SrhdnY0PS+SGnaR/EuaRexI=;
 b=rgOEzWCXuauYfTd1BPx92zhS9u/CRIqKVxSPLGulVAdSQea8kjkrj/HCFBKZNQ4PGtyGZpD9arUqsQZPanILs2iyvRAJX8YJhdcLc3ShEiFXCjHs7rPza0MGr6ii/8g5JNWrJkQBOs2wuqSSfpsCbrz7mQhnGUapbMQJzeEp5+k=
Received: from TYBPR01MB5309.jpnprd01.prod.outlook.com
 (2603:1096:404:8025::15) by TY2PR01MB2811.jpnprd01.prod.outlook.com
 (2603:1096:404:6f::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.20; Fri, 1 Jan
 2021 17:07:48 +0000
Received: from TYBPR01MB5309.jpnprd01.prod.outlook.com
 ([fe80::5d23:de2f:4a70:97db]) by TYBPR01MB5309.jpnprd01.prod.outlook.com
 ([fe80::5d23:de2f:4a70:97db%3]) with mapi id 15.20.3700.032; Fri, 1 Jan 2021
 17:07:48 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
CC:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH] gpio: Kconfig: Update help description for GPIO_RCAR
Thread-Topic: [PATCH] gpio: Kconfig: Update help description for GPIO_RCAR
Thread-Index: AQHW34s2q+2M5/DYSUWe0TG/HhDPd6oTAeBQ
Date:   Fri, 1 Jan 2021 17:07:48 +0000
Message-ID: <TYBPR01MB53095D8BBF8E17AB824243F786D50@TYBPR01MB5309.jpnprd01.prod.outlook.com>
References: <20201231153842.25782-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20201231153842.25782-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: bp.renesas.com; dkim=none (message not signed)
 header.d=none;bp.renesas.com; dmarc=none action=none
 header.from=bp.renesas.com;
x-originating-ip: [81.135.30.249]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 1e862028-2719-4c80-8cc1-08d8ae77c3e4
x-ms-traffictypediagnostic: TY2PR01MB2811:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY2PR01MB28114B25832D832E05C6417C86D50@TY2PR01MB2811.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IfAXSKV3bGbPgiVR8OMGVJi4KOIcLHUIJ5FdGrdSUV925GTPavKwnhrLx7N59dOZBR36HGS1aUNNQ6JNHac65AZ0kHVc5qesBSCGVzWmD3fbKf+aEeibHmt+VloOxWrOt2mSWYk2ieP55fvHUd5l7DYlU4/RB2VsFOjgSU1K0JKbkwbCVPruAVArT6cbrCdNIfJK5j4xV2NoN3REJ778L/jgqPDJ4qSdvw/Hpz6eQnr54RrsDr924+Yx7i2XzwQu1CFEF/PRYXzrrsNzjsvgOWbYBaymdvWOyPovEKd0GWSkoYQXEgPVcNuYHGC13dtSh5q9bVib3C9vnU2k8AwulhIMoez1YrzRsAZK7q1nHEE4OwcqO6KkBM8a5UMw3cKcWlzKmXGv13QT60CDbK5qUA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5309.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(366004)(136003)(39860400002)(396003)(66446008)(66946007)(107886003)(76116006)(66476007)(55016002)(4326008)(52536014)(478600001)(5660300002)(9686003)(66556008)(83380400001)(64756008)(54906003)(26005)(186003)(7696005)(316002)(33656002)(53546011)(86362001)(110136005)(6506007)(8936002)(2906002)(71200400001)(8676002)(15650500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?T95LYZGTUEY3ShJRFTp1HsayPRz2Qzw0bCbwepIKzrmHs0ocFLzAUfdzJZQ4?=
 =?us-ascii?Q?Mlb8usY4XZnoe1mbjRbE5aM97JhRiYth80VYCUWM+exyj67MhareM7p/zkaw?=
 =?us-ascii?Q?zyjLQRfLgLUcOfQRy4TIAIyRZ7TIX8C17QnHvuTOPKYxxtBPi+kksxkagpRA?=
 =?us-ascii?Q?tldxPofUDS1Pw2MRuDeEnLJDftiTjxvBN1jbphvxCIqnSYtXZH52xj7Ow5zi?=
 =?us-ascii?Q?3LGtZHj9lLnHDOgRfbn00yinxRHiS8Jw7LyUQyxB4zVdr1ztpK8hbLlIVTP0?=
 =?us-ascii?Q?IKOBKqMmgsbOZ63L0ze9HXAdAaoOgyTdbTV9wezumW4N2DFM0ezbrZZfi1qA?=
 =?us-ascii?Q?wIwLs1hR3ZPfguN0pMkTPUPOQgRLfc0JNQXRd7S8HdpBp+zvaXj+Gkk+ua7U?=
 =?us-ascii?Q?teWwySAkgg/3OxtA6Fp/vK0wRQCPbiNS2yDlrwRy5dFGrIRlu+tVRy4jvypy?=
 =?us-ascii?Q?RrmrpWCtuwmcLFw19y42DBNziYOXjVPOtA+sO7YOvm1miC02xtC+nM6nDJaD?=
 =?us-ascii?Q?kn39LLCSH/oeKnO+2fN/yuz7BxOYZlRpuxfcQDEHLpnHopmGIbIEZzcDSXbh?=
 =?us-ascii?Q?IMlKKyZiFs3CCOMVdIzGlFZyE8ScUsc3lrJbdMhGkXj50jdqFAtR7CPlyjYQ?=
 =?us-ascii?Q?ShC512VoHYW8ckBEOhvEF6TzhW3S2Ulmg+o9tJYB22gGluMIgxnP/onzOxKK?=
 =?us-ascii?Q?YEw75NDVVaithykvVmbxCcid8qFnfTX8bfGPYYjPTD9ooY9RhqcfG8EsxW1e?=
 =?us-ascii?Q?GgTB59VyfWKL6+67YY+HqhmXu6kuKCcMnq/Kz4z2LWMgqwTE2+mmqmUx637b?=
 =?us-ascii?Q?lj0mOeFqGgVhHGpNJ/8KvgE+11Wac0Cfen0m+yyezEfEnywGpWhoAWe7o15P?=
 =?us-ascii?Q?hB9VGV77oeecKpCHtet4B2wUPt2bndkAnNX5M7tftN0BstaSdxtFFKPyob6j?=
 =?us-ascii?Q?dZhLFFSc00zLVZRCW48iyrq29XtjaH33np4Rf3RLmCk=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5309.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e862028-2719-4c80-8cc1-08d8ae77c3e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jan 2021 17:07:48.3065
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tXuszSaff/3KrAAAa9Yfmi6Chx7gMUq9gvXXaa2bopPiC71k26WxSp89+GDkmY0SGMpzqzCtfTl/Q9x8YvytFXgbvx+CfMdM67bje8z17rU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB2811
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Prabhakar,

> -----Original Message-----
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Sent: 31 December 2020 15:39
> To: Linus Walleij <linus.walleij@linaro.org>; Bartosz Golaszewski
> <bgolaszewski@baylibre.com>; Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: linux-gpio@vger.kernel.org; linux-kernel@vger.kernel.org; linux-
> renesas-soc@vger.kernel.org; Prabhakar <prabhakar.csengg@gmail.com>;
> Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Subject: [PATCH] gpio: Kconfig: Update help description for GPIO_RCAR
>=20
> The gpio-rcar driver supports R-Car Gen{1,2,3} and RZ/G{1,2} SoC's, updat=
e
> the description to reflect this.

Not sure we need to make this generic by  dropping {1,2,3}/{1,2} and use R-=
Car and RZ/G SoC's instead ???

Regards,
Biju

>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  drivers/gpio/Kconfig | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig index
> c70f46e80a3b..47e545d71df1 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -486,11 +486,12 @@ config GPIO_PXA
>  	  Say yes here to support the PXA GPIO device
>=20
>  config GPIO_RCAR
> -	tristate "Renesas R-Car GPIO"
> +	tristate "Renesas R-Car Gen{1,2,3} and RZ/G{1,2} GPIO support"
>  	depends on ARCH_RENESAS || COMPILE_TEST
>  	select GPIOLIB_IRQCHIP
>  	help
> -	  Say yes here to support GPIO on Renesas R-Car SoCs.
> +	  Say yes here to support GPIO on Renesas R-Car Gen{1,2,3} and
> +	  RZ/G{1,2} SoCs.
>=20
>  config GPIO_RDA
>  	bool "RDA Micro GPIO controller support"
> --
> 2.17.1

