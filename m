Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A386354A99
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Apr 2021 03:50:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242072AbhDFBuI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Apr 2021 21:50:08 -0400
Received: from mail-eopbgr140057.outbound.protection.outlook.com ([40.107.14.57]:43008
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S241950AbhDFBuH (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 5 Apr 2021 21:50:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RHnfkMPmKVQfEYzf7ZfNHOqGcEYqkU4PqZ+0rxmAHn/rBEQXoXXIY6xNVwKPk4dHwuMVeTjHRvE9tlMSFFQl0+RlclfEdfNDlFhBJa1ZBCGUPmSpFTe5Oqgl6gMjuPYLLSISFi4f8waGWS9aKA/Gttxoco2Hn2QOvzo8KFrY7HUN7mYkH/DVIroalfDB3qmhwZFRYMtHpcV5BCZ0U8DL3ITaVWmuAblFJzQy0atDExlrQxirHGUY43ZgK0Xcg/HS0TPkzbulMU/gmjjDvMpVR2dek/QBHDhBM60lsyHht8AoSj9imIvTcIl2v7tJwCNlPwgr4eHDfgEke2+j2xrYwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AmOLgxYtcrFojJlhQ7/BPpSP0bBl4JM7D8GzX5TJs9Q=;
 b=jHaaFiZL/gUOvB3R5c7HTu5N24VBkKhQ+JDzOW+wY8PqFe8xDLx3ODYxalOzaT98KKKjRj3H8zfp6OcjER4ETaIPG1oOfzq0Gpwuc7OEDSuhFer+iwvjcmNKQq073tqpdaTKI7ACfSjfkq55qqldXXCXnZNZRTIq1eIBrjfP6q9jCdFFVV63SpA54e0WlIy72d3ZR37ILgnsGjx4RednWeWffqSwaxmhRaVQBEzsB+l+pzwQT1jWS6ScsUDIbUCHyaDHrr8udPIbD95Eqc0JTAjT9yXli+SjUU0lZ9AEUzQGL7RZqJ7L02cnDyaTob5Ixq1U2anqnsdTnW1KFYPYuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AmOLgxYtcrFojJlhQ7/BPpSP0bBl4JM7D8GzX5TJs9Q=;
 b=P0bsocquor1ASO2KxOhYCJf/iLQAGW7X+WYQygiJDcytfl5jzqKdA6AuhstT1xCcDk9ieVrKrKGhtBJa9cdMfpyfGEHjP8m48JjO+rpVkEaRYh/RbMyHDCVzpoKIFS2VVNNlepdUVgwCP4eX9jF9KcyGttaP0qecbvgjsqiT5Kw=
Received: from AM6PR04MB5413.eurprd04.prod.outlook.com (2603:10a6:20b:96::28)
 by AM6PR04MB5863.eurprd04.prod.outlook.com (2603:10a6:20b:a5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.27; Tue, 6 Apr
 2021 01:49:58 +0000
Received: from AM6PR04MB5413.eurprd04.prod.outlook.com
 ([fe80::2c18:5961:ebca:dfaa]) by AM6PR04MB5413.eurprd04.prod.outlook.com
 ([fe80::2c18:5961:ebca:dfaa%2]) with mapi id 15.20.3999.032; Tue, 6 Apr 2021
 01:49:57 +0000
From:   Ran Wang <ran.wang_1@nxp.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Michael Walle <michael@walle.cc>
CC:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Ran Wang <ran.wang_1@nxp.com>
Subject: RE: [PATCH v4] gpio: mpc8xxx: Add ACPI support
Thread-Topic: [PATCH v4] gpio: mpc8xxx: Add ACPI support
Thread-Index: AQHXHsvnTdlcbx9xZ0aLPy5qSiDFR6qmz/cQ
Date:   Tue, 6 Apr 2021 01:49:57 +0000
Message-ID: <AM6PR04MB54134144991AB746382FCC0BF1769@AM6PR04MB5413.eurprd04.prod.outlook.com>
References: <20210322033846.39882-1-ran.wang_1@nxp.com>
In-Reply-To: <20210322033846.39882-1-ran.wang_1@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d30cbca1-f102-4d20-81d6-08d8f89e482e
x-ms-traffictypediagnostic: AM6PR04MB5863:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR04MB58634F48D1AE81FED0604064F1769@AM6PR04MB5863.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3alBRJdvKbrhCcFfbNcLf27jZmrDLl+jjXiwm9zzRql7DInhDEp7zkf3H/YyrAWdRVkW8n2Pelu2f8Mb/YYEMQt8b/BirVjC9ZNgmUMEhzjcxZU52mC4KwBUh7SgfuLgtvzXimcKZ1CSKUd1e2briPI2vKY1nc9BfGwcUNRwCKpeeo5EbPv23hiwMS05SvmRu9MfwCd1+9jJf0LVS8BXttFwZnt+jbXVK4qDuj0vmtlhSo56qmW+hsuvjiKk7hjhv/QJ6wGhfSFGmDvFqd9UDA3KeAJUtnB0ijxcAOlupuUdHxhLPbKcpJpzK5EK/p6MIF6nHmD9SUEsh8MEzEKMZzIfBuzDGifjpMht9XLCM1zuJuaqUDnDfOr8XSnbr3vn7qNi45XC0RrLpOjODrqx9wvGVw3B6jbuBJAEh1/a667fJ0RkLIH4CO5l6mJc5PueNg8RhH2e7RdnEq4ck+etgJRb4u0oiZGIUTx3D283AnmvsHMbqe76SiBqiaKcWmYtlTIC3M1j7lntVCeMlgVCckxnia6/0pJxI/L4s8oU3KQgOvdEDeoLHgBANuGJhm7OshzvXOTMaxO34QG+vtaDs/ehh/yvt975KnJ9+dKuzAg4KE8X69sZyVd8/PKDzlVb8yce2GbHW3Mwk/Cg0wq2ejpZjqRdH8c75x9sZ6jm6ntIJ1MlEzrWCvXf9oKLXhzL
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB5413.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39860400002)(136003)(366004)(376002)(396003)(4326008)(2906002)(186003)(83380400001)(478600001)(66946007)(5660300002)(316002)(26005)(9686003)(38100700001)(33656002)(53546011)(6506007)(7696005)(71200400001)(86362001)(110136005)(8936002)(54906003)(66476007)(66556008)(66446008)(55016002)(76116006)(64756008)(8676002)(52536014)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?ZY9eijAv1y4fmDQ27feGYe9OWPwVhqpdELoNSximu0I1pF05Kgo0iPA0yJ+t?=
 =?us-ascii?Q?+WczdmzOAThrtfOBmUrUmS8YA6Lc00bRnmpkwyO5gquGK4n4LieHNa42pYk9?=
 =?us-ascii?Q?XKli3t8qWgoEsB4SeiAQwx1SFo/hUu0ZR1J0SXYjv628fuSpnYeTM2RP5Xkc?=
 =?us-ascii?Q?KVjYLhkLEGUJ8lWyor3i9+Kw88jY45Ye5rP18ZPmU5fQDiS1nQbRcV2VSdLU?=
 =?us-ascii?Q?yDUTGze9NS5W9dB2oouEfAU3Fat8095aKD9VdQHKo16H+Y9it4i0S8/rxVdK?=
 =?us-ascii?Q?ihic0JcBA5xvyyWWERTlbF7hdxveVwk9Z781A0n07yX5TnMvP+OfyLJTo0sj?=
 =?us-ascii?Q?Ugae+NC9QRyL/q+RbAwGKcKQQG3vw0Ir3XluPrM6JnxND2MDJWOn/qO4vK/6?=
 =?us-ascii?Q?yr+qTENdupT+n+ZWErycqQ2xSDUVPV1X6CWGe3D0kDUHtkizemRnvcjwP3HN?=
 =?us-ascii?Q?vI9gW3lgCZpbMa7eQP/JMPQoWCi0/WzQSMXTspnNbvaxRIwEHMNHYX0ZZ5kG?=
 =?us-ascii?Q?PxGIzZyOizgvDAZP16S1gbkm++bzZu2Ef97tQu2WEiOsCrCFVCOYdQ6Dbjow?=
 =?us-ascii?Q?qtIuwpxcV7lX+gSrJifstQ3fMl5hG09Kq2MZb2QyX2SEqUmF1yAdlOJCFEjv?=
 =?us-ascii?Q?/QaHjWi4AFCN2c1ky1HgttPlij8b//gf+3UPRKBONoliqfFEYHigYNIumI40?=
 =?us-ascii?Q?5I4GYRDuX4My4o8TKam9Eb789aOypwzUoyuMalZlPN1dKzcnLPEhRtMWIykp?=
 =?us-ascii?Q?OGrLevqO+RPWTkc4ctGu4uYOK/BPPf6B/tUIVVhcI9Lb2jVctHbuD/hnD91H?=
 =?us-ascii?Q?jlQ5x3ZW9/qagwJwNkTbaTJSKqMqNQwM3tiRSViEyYZQvhGjlq/Ksqi/JwQi?=
 =?us-ascii?Q?xh/yTxhALIjyx7W6QjsBREUzWgc8KynA31zcpNEe+O9VBh33+gA4vlATrChe?=
 =?us-ascii?Q?bB2EWzAqV9qQ0rQ16IPEqx6C2yIsiWtin/hDy6nXB/6wo4mvQljCkfnIwIKa?=
 =?us-ascii?Q?PTDKh7+Bdwyk69eERv8T58txVS7SQq85sirNTlurHoy5D/+fvoaQ9YniLKXV?=
 =?us-ascii?Q?cTjaIczoIsImITLqQlgW7U0RZnNRqGac2RvCyRYXr1UCsOKVWp2Idx6G3eMe?=
 =?us-ascii?Q?AMO+G0SqV/oBuHHglKlhKLtyWjKiCRYr18PxKnCFdrZfa9PcjLHOgXeacawG?=
 =?us-ascii?Q?oEH8/5OBNE6S+UNiALB0vOExL2lIMy9UHI/N4JgAlDY9qFe4f3/mhn4ZXYux?=
 =?us-ascii?Q?B1K13Brzkqn7bBLmxcNVhmOhZl9aotpajNj7/fgOnHral0/5WqMoiAcJ2z9Q?=
 =?us-ascii?Q?ECZPLgYTygumv7aTA0mEklZb?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5413.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d30cbca1-f102-4d20-81d6-08d8f89e482e
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Apr 2021 01:49:57.1584
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: clcazd9usN9SgEEHwi/FNvyAbXEdD/OvrMd/A0BPbY3X06x76fQK+wWcwMTlOyumg0U1WRPolg23sq56xmHAww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5863
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello,

On Monday, March 22, 2021 11:39 AM, Ran Wang wrote:
>=20
> Current implementation only supports DT, now add ACPI support.
>=20
> Signed-off-by: Ran Wang <ran.wang_1@nxp.com>
> ---
> Change in v4:
>  - Update error print for gpiochip_add_data() to fix wrong info. in ACPI =
case.
>  - Update error print for devm_request_irq() to fix panic in ACPI case.
>  - Add include property.h and mod_devicetable.h.
>  - Correct error handling for mpc8xxx_gc->regs.
>  - Replace "!(IS_ERR_OR_NULL(fwnode) || is_of_node(fwnode)))" with "is_ac=
pi_node(fwnode)"

Could this version be accepted, or any comment/suggestion?

Thanks & Regards,
Ran

=20
> Change in v3:
>  - Recover ls1028a and ls1088a compatilbe checking logic
>=20
> Change in v2:
>  - Initialize devtype with NULL to fix compile warning.
>  - Replace of_device_get_match_data() and acpi_match_device with device_g=
et_match_data().
>  - Replace acpi_match_device() with simpler checking logic per Andy's sug=
gestion.
>=20
>  drivers/gpio/gpio-mpc8xxx.c | 47 ++++++++++++++++++++++++++-----------
>  1 file changed, 33 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/gpio/gpio-mpc8xxx.c b/drivers/gpio/gpio-mpc8xxx.c in=
dex 6dfca83bcd90..4b9157a69fca 100644
> --- a/drivers/gpio/gpio-mpc8xxx.c
> +++ b/drivers/gpio/gpio-mpc8xxx.c
> @@ -9,6 +9,7 @@
>   * kind, whether express or implied.
>   */
>=20
> +#include <linux/acpi.h>
>  #include <linux/kernel.h>
>  #include <linux/init.h>
>  #include <linux/spinlock.h>
> @@ -18,6 +19,8 @@
>  #include <linux/of_address.h>
>  #include <linux/of_irq.h>
>  #include <linux/of_platform.h>
> +#include <linux/property.h>
> +#include <linux/mod_devicetable.h>
>  #include <linux/slab.h>
>  #include <linux/irq.h>
>  #include <linux/gpio/driver.h>
> @@ -303,8 +306,8 @@ static int mpc8xxx_probe(struct platform_device *pdev=
)
>  	struct device_node *np =3D pdev->dev.of_node;
>  	struct mpc8xxx_gpio_chip *mpc8xxx_gc;
>  	struct gpio_chip	*gc;
> -	const struct mpc8xxx_gpio_devtype *devtype =3D
> -		of_device_get_match_data(&pdev->dev);
> +	const struct mpc8xxx_gpio_devtype *devtype =3D NULL;
> +	struct fwnode_handle *fwnode;
>  	int ret;
>=20
>  	mpc8xxx_gc =3D devm_kzalloc(&pdev->dev, sizeof(*mpc8xxx_gc), GFP_KERNEL=
); @@ -315,14 +318,14 @@ static int
> mpc8xxx_probe(struct platform_device *pdev)
>=20
>  	raw_spin_lock_init(&mpc8xxx_gc->lock);
>=20
> -	mpc8xxx_gc->regs =3D of_iomap(np, 0);
> -	if (!mpc8xxx_gc->regs)
> -		return -ENOMEM;
> +	mpc8xxx_gc->regs =3D devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(mpc8xxx_gc->regs))
> +		return PTR_ERR(mpc8xxx_gc->regs);
>=20
>  	gc =3D &mpc8xxx_gc->gc;
>  	gc->parent =3D &pdev->dev;
>=20
> -	if (of_property_read_bool(np, "little-endian")) {
> +	if (device_property_read_bool(&pdev->dev, "little-endian")) {
>  		ret =3D bgpio_init(gc, &pdev->dev, 4,
>  				 mpc8xxx_gc->regs + GPIO_DAT,
>  				 NULL, NULL,
> @@ -345,6 +348,7 @@ static int mpc8xxx_probe(struct platform_device *pdev=
)
>=20
>  	mpc8xxx_gc->direction_output =3D gc->direction_output;
>=20
> +	devtype =3D device_get_match_data(&pdev->dev);
>  	if (!devtype)
>  		devtype =3D &mpc8xxx_gpio_devtype_default;
>=20
> @@ -369,24 +373,29 @@ static int mpc8xxx_probe(struct platform_device *pd=
ev)
>  	 * associated input enable must be set (GPIOxGPIE[IEn]=3D1) to propagat=
e
>  	 * the port value to the GPIO Data Register.
>  	 */
> +	fwnode =3D dev_fwnode(&pdev->dev);
>  	if (of_device_is_compatible(np, "fsl,qoriq-gpio") ||
>  	    of_device_is_compatible(np, "fsl,ls1028a-gpio") ||
> -	    of_device_is_compatible(np, "fsl,ls1088a-gpio"))
> +	    of_device_is_compatible(np, "fsl,ls1088a-gpio") ||
> +	    is_acpi_node(fwnode))
>  		gc->write_reg(mpc8xxx_gc->regs + GPIO_IBE, 0xffffffff);
>=20
>  	ret =3D gpiochip_add_data(gc, mpc8xxx_gc);
>  	if (ret) {
> -		pr_err("%pOF: GPIO chip registration failed with status %d\n",
> -		       np, ret);
> +		dev_err(&pdev->dev,
> +			"GPIO chip registration failed with status %d\n", ret);
>  		goto err;
>  	}
>=20
> -	mpc8xxx_gc->irqn =3D irq_of_parse_and_map(np, 0);
> +	mpc8xxx_gc->irqn =3D platform_get_irq(pdev, 0);
>  	if (!mpc8xxx_gc->irqn)
>  		return 0;
>=20
> -	mpc8xxx_gc->irq =3D irq_domain_add_linear(np, MPC8XXX_GPIO_PINS,
> -					&mpc8xxx_gpio_irq_ops, mpc8xxx_gc);
> +	mpc8xxx_gc->irq =3D irq_domain_create_linear(fwnode,
> +						   MPC8XXX_GPIO_PINS,
> +						   &mpc8xxx_gpio_irq_ops,
> +						   mpc8xxx_gc);
> +
>  	if (!mpc8xxx_gc->irq)
>  		return 0;
>=20
> @@ -399,8 +408,9 @@ static int mpc8xxx_probe(struct platform_device *pdev=
)
>  			       IRQF_SHARED, "gpio-cascade",
>  			       mpc8xxx_gc);
>  	if (ret) {
> -		dev_err(&pdev->dev, "%s: failed to devm_request_irq(%d), ret =3D %d\n"=
,
> -			np->full_name, mpc8xxx_gc->irqn, ret);
> +		dev_err(&pdev->dev,
> +			"failed to devm_request_irq(%d), ret =3D %d\n",
> +			mpc8xxx_gc->irqn, ret);
>  		goto err;
>  	}
>=20
> @@ -425,12 +435,21 @@ static int mpc8xxx_remove(struct platform_device *p=
dev)
>  	return 0;
>  }
>=20
> +#ifdef CONFIG_ACPI
> +static const struct acpi_device_id gpio_acpi_ids[] =3D {
> +	{"NXP0031",},
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(acpi, gpio_acpi_ids); #endif
> +
>  static struct platform_driver mpc8xxx_plat_driver =3D {
>  	.probe		=3D mpc8xxx_probe,
>  	.remove		=3D mpc8xxx_remove,
>  	.driver		=3D {
>  		.name =3D "gpio-mpc8xxx",
>  		.of_match_table	=3D mpc8xxx_gpio_ids,
> +		.acpi_match_table =3D ACPI_PTR(gpio_acpi_ids),
>  	},
>  };
>=20
> --
> 2.25.1

