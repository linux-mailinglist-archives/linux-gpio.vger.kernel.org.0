Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6BEA3416EE
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Mar 2021 08:57:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234181AbhCSH4v (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 19 Mar 2021 03:56:51 -0400
Received: from mail-eopbgr80052.outbound.protection.outlook.com ([40.107.8.52]:8101
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234219AbhCSH4h (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 19 Mar 2021 03:56:37 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WWiktmY6u/V2H24stgQ1X0BmdDQ56hsvCQmKnRvRymj2X5y+2UJf04kudFCHdu28vgyr52nduQo2TBBB/L/c9dK0LhxVs02YJXuhYAZLwl4KyjXFFmSaDEaA98yusIFadJOQp9N9iEYouhZ66LkX8VmTn8KsGJ5r4eUIt+cn3SaM+7d5/ZvRgVcnDcAHSll6+jZErim2sii6xDyZwugrdIil07uKiGL3eWvuZKmAVD1Yu6DkLmic57jgqLGmZhv8yBN3rDD5KarUlRgz+kBBsNjUgdYDb0eWjUyE2qQA0Ac6nz3zurUKNBw5onNcuRxZWzv5x28Yy/73kVMoqBxnJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h1ztl8+QHxCyTUNCquVG36qmshdN3HiSHSu71q4UDbg=;
 b=Upi4s0sJ23gYEPvFXrOOos3jMinE2UCq8LdHxVy+myTE0fGCoykPJFCHvV36E+pas4KsZG913L7rgyscBmeX4eWNDviHlygk+7orA6X3DQXQLmCinIGjm1QjX0yBl9KLnAg92M83+62KKExgx1NjGfvAbtWrSnsV86INE+C9bNzE8MMMlKUEUYTvvzHxawa+T57T6S+B36udFXWQreLk29GYUiwRchUq4nVh2/aZFcYiQRhzqospvzIsmUT9a+ctZirBaSwx6WgHdAaCaz/miNomhK019VdzWyyIASSf+FSku6LSNB9Jy7wK/+u5yrhLFeXOWUF9Oi7CET9tRR9Mkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h1ztl8+QHxCyTUNCquVG36qmshdN3HiSHSu71q4UDbg=;
 b=kA4ewxzaam11CBQbDKFIA8kqXnlsy+UP9Ilsr72hPxCmchR8uU52mGA3NOeWMmhz5YRNfncHB0XExWbw62lvPUMQohDx17nIzdsyIuJWFlZxmenSJa3wv5MfCXfF04MtN8say21HuBNv3pzxnrOib6YETYJxtePn7fdtVG7KEWY=
Received: from AM6PR04MB5413.eurprd04.prod.outlook.com (2603:10a6:20b:96::28)
 by AM6PR04MB6293.eurprd04.prod.outlook.com (2603:10a6:20b:71::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Fri, 19 Mar
 2021 07:56:35 +0000
Received: from AM6PR04MB5413.eurprd04.prod.outlook.com
 ([fe80::b4f2:d00e:93a1:8685]) by AM6PR04MB5413.eurprd04.prod.outlook.com
 ([fe80::b4f2:d00e:93a1:8685%3]) with mapi id 15.20.3955.018; Fri, 19 Mar 2021
 07:56:35 +0000
From:   Ran Wang <ran.wang_1@nxp.com>
To:     Michael Walle <michael@walle.cc>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2] gpio: mpc8xxx: Add ACPI support
Thread-Topic: [PATCH v2] gpio: mpc8xxx: Add ACPI support
Thread-Index: AQHXHGoX3ImMIOC4Y0GVVlL7LtAO2qqK8IyAgAAAknA=
Date:   Fri, 19 Mar 2021 07:56:35 +0000
Message-ID: <AM6PR04MB54136819BA7C627BCB569C8DF1689@AM6PR04MB5413.eurprd04.prod.outlook.com>
References: <20210319025332.36659-1-ran.wang_1@nxp.com>
 <ab9cca747b83ab1083b86d3aef9156ef@walle.cc>
In-Reply-To: <ab9cca747b83ab1083b86d3aef9156ef@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: walle.cc; dkim=none (message not signed)
 header.d=none;walle.cc; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 62de8cc8-9a30-48a5-6bae-08d8eaac84bd
x-ms-traffictypediagnostic: AM6PR04MB6293:
x-microsoft-antispam-prvs: <AM6PR04MB6293DF3A757009043DBB4F30F1689@AM6PR04MB6293.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CL91oCjnH+fN52tNo8mjjToZ+nwWdbUmSW3cMnN8DlnuCiLm2Z1RLQEGk7lxOiPeAzkFahCVWdzMixkz+vMWAlIExfAF8rdtASoCuMPhcqeFPB6DeBQfuzp5bajUH67GqBfion5/F4mUN+arFUuhprLLVsL9UCSX39wH1wUm4+dr+2dM4ruO30oO8qhYodssj/EHzc43XgMu+PsSKrtno/Pzr+e2WidwIdTs3jbcqqMOAKquglEs1v7Tq3vDmexoQoXz02ZfUcX3lOil+6vynP6+PMRyXnQ8u+2jUEA98cwPr/TlZXcCB4TgSn7J7ZCIye9MZ4HLGC+FsDs/0BpOa7Mfdl4DHXPCdiHiekN3yNkDQWDdXo7YX25Tr9ujlxMHNBYAe+W3Pk/f8y5HjhwSM3L19sw+mJtzAmBvLWJhvsHoZJUmEjElz0HVsbC4lvUjIXAAvKUD3ItkJApQYXfBWsvX6zyid6kjJNe9YfMjHpcNvKkybo/3Zbyt3yBlZuVVf4ovhAON6iqTp9Qly/QJaJ5/4Hl6vV51xfFAiwySddlHQNgd6XZCF4xbWbA1Nd8vcyA1HLbUueN4+AccRIEfUXIsbMOJ4kjPwFpO4q5uE+KfpnwjcqZyghOP9R37g2EKU9E4FUOmGeimMl253W3nIVNV/amyoHTfrQAj7d6kU0gf3zcHqByETe1/bUFC/zwL
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB5413.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(136003)(346002)(39860400002)(376002)(4326008)(478600001)(9686003)(83380400001)(33656002)(5660300002)(54906003)(8936002)(7696005)(6506007)(71200400001)(2906002)(38100700001)(55016002)(6916009)(26005)(186003)(66476007)(64756008)(52536014)(86362001)(66946007)(76116006)(66556008)(66446008)(8676002)(53546011)(316002)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?wGeieHf7SBPcr/SqR12kFt4AJzj1SZWB2zDW9AsejEObOLcW14F26oQrZTjL?=
 =?us-ascii?Q?/uiJ/BRnnaJL+hMGNjsrw5+cv2FdOF9BNHLDwRBGvzkRcgk4mMCIrcF8Lj+D?=
 =?us-ascii?Q?8w2Zwejd4WVdsI+DzF4ThrNvY11/6L4yLOd7BqHLNHDQVKopoRTewknBXX7K?=
 =?us-ascii?Q?WTcuiN9qdxlhphSKPd15F7cVnKYQsszDzgG98cR691CSETBMD6RUa9QSWFb3?=
 =?us-ascii?Q?JIAYFPQCYC5l1Eq+DPaU5E43eI0hE8cs42IrEGrGRwDQDJbySSy0tzJ8qUmO?=
 =?us-ascii?Q?J1J5zl5uHB0uZGrNOdt7h+mLGkXsnnLL2WmJ03svZndYC24VF7dK4jUp7tXX?=
 =?us-ascii?Q?GgSF/F/p3GdJjwfvrBuMlJsVxKSvuBAfkKF9eqkhMrYYfSTlAwwCEm+eUMLh?=
 =?us-ascii?Q?pMYSKcB8YM5obEFIByqXPtYm3+gcpnZK/CMHXtP1qeJam/0TnsXj73KW6NkS?=
 =?us-ascii?Q?B0RxuI1C6E8Rq8S0lR65Y9xHI5q5W05D1heSjFAIII8Y3d/90vl9l7LYkUZR?=
 =?us-ascii?Q?BN3CzL4XWuhyg1dBxBdtzsnuv3mb3UZ4BcuBrGaAtnEsSTMUTbZ9iFtBDqir?=
 =?us-ascii?Q?SLMiZhf52Xw02rBELR7viftV2LK7xYGNqKXQ/4SFWdrfFWTIuZLiCzDyXMed?=
 =?us-ascii?Q?do8+bKZH4LSte6eojtByn/oH41l7ojmnx6yNV36adWVAEk+NO8NUcr+8o/t4?=
 =?us-ascii?Q?EqfxQPatoStdW8ORf6O+3ypb/j33rxfytpik9EHLY7zDc0F1AzWzGuZdEcHW?=
 =?us-ascii?Q?+YJuKDX1dEkCEhlIK4DNiKQk6BATzzKzGp8bgSYNprPHorXBpNkrXmBbsotF?=
 =?us-ascii?Q?vaGMWAUJMhmGv4ibkuyIEkEPG80YU1VrnYmQNiPNmc+3FBJIdUJdD8woO3ja?=
 =?us-ascii?Q?Da1i+zfiaKKc61iyr4agsN+E9hVGMpgYE3hJCW2mV1q5SlgGnUBfpB2T0NuA?=
 =?us-ascii?Q?lm/vOuJwzxF28Jb7QNZASo9Wg47tPBCbPMOoDuydLQEyCBmtIXFt/xztFM35?=
 =?us-ascii?Q?DtagvZ5bpET+0cbHknKg/pJ1ubW++2qexOqt7WBmBHq/NFa0UQslMAKxRC+f?=
 =?us-ascii?Q?NzsNR7liTpzGmzN+JhCqMuIFPcYXeegteKdX53CHGKKGF+Kuhq6cnVNR2CwZ?=
 =?us-ascii?Q?SfHmdt7UUz6l/RvK3nISA4wB8+NHyUcyQnBL0PZKXmlhWac8tIbnCrIAVzxU?=
 =?us-ascii?Q?IwlA97txESKstjOyFfC6shMOmZ90p73dXorVg9IXPVqdWmk+XOzCJWfSnmAp?=
 =?us-ascii?Q?C9C9QoLzy61+y9TAfwLOLOAFGKTxmgqJ2xY8mlSBvFnXxnlIpcH9Yh+LsYcD?=
 =?us-ascii?Q?E/rf3rdfH6xCoNoJPLbnH8O7?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5413.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62de8cc8-9a30-48a5-6bae-08d8eaac84bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2021 07:56:35.4576
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7DEj3IwTnQk4Q5KdHARfNRg1UpuHfQPfeLhm8thA0dB48A48lfRGaHTcK2bkhT03Tt/kGlB8jZbaHbj8QB4svQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6293
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Michael,

On Friday, March 19, 2021 3:52 PM, Michael Walle wrote:
>=20
> Am 2021-03-19 03:53, schrieb Ran Wang:
> > Current implementation only supports DT, now add ACPI support.
> >
> > Note that compared to device of 'fsl,qoriq-gpio', LS1028A and
> > LS1088A's GPIO have no extra programming, so simplify related checking.
> >
> > Signed-off-by: Ran Wang <ran.wang_1@nxp.com>
> > ---
> > Change in v2:
> >  - Initialize devtype with NULL to fix compile warning.
> >  - Replace of_device_get_match_data() and acpi_match_device with
> > device_get_match_data().
> >  - Replace acpi_match_device() with simpler checking logic per Andy's
> > suggestion.
> >
> >  drivers/gpio/gpio-mpc8xxx.c | 34 +++++++++++++++++++++++-----------
> >  1 file changed, 23 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/gpio/gpio-mpc8xxx.c b/drivers/gpio/gpio-mpc8xxx.c
> > index 6dfca83bcd90..646225fa3e73 100644
> > --- a/drivers/gpio/gpio-mpc8xxx.c
> > +++ b/drivers/gpio/gpio-mpc8xxx.c
> > @@ -9,6 +9,7 @@
> >   * kind, whether express or implied.
> >   */
> >
> > +#include <linux/acpi.h>
> >  #include <linux/kernel.h>
> >  #include <linux/init.h>
> >  #include <linux/spinlock.h>
> > @@ -292,8 +293,6 @@ static const struct of_device_id
> > mpc8xxx_gpio_ids[] =3D {
> >  	{ .compatible =3D "fsl,mpc5121-gpio", .data =3D &mpc512x_gpio_devtype=
, },
> >  	{ .compatible =3D "fsl,mpc5125-gpio", .data =3D &mpc5125_gpio_devtype=
, },
> >  	{ .compatible =3D "fsl,pq3-gpio",     },
> > -	{ .compatible =3D "fsl,ls1028a-gpio", },
> > -	{ .compatible =3D "fsl,ls1088a-gpio", },
> >  	{ .compatible =3D "fsl,qoriq-gpio",   },
> >  	{}
> >  };
> > @@ -303,8 +302,8 @@ static int mpc8xxx_probe(struct platform_device
> > *pdev)
> >  	struct device_node *np =3D pdev->dev.of_node;
> >  	struct mpc8xxx_gpio_chip *mpc8xxx_gc;
> >  	struct gpio_chip	*gc;
> > -	const struct mpc8xxx_gpio_devtype *devtype =3D
> > -		of_device_get_match_data(&pdev->dev);
> > +	const struct mpc8xxx_gpio_devtype *devtype =3D NULL;
> > +	struct fwnode_handle *fwnode;
> >  	int ret;
> >
> >  	mpc8xxx_gc =3D devm_kzalloc(&pdev->dev, sizeof(*mpc8xxx_gc),
> > GFP_KERNEL); @@ -315,14 +314,14 @@ static int mpc8xxx_probe(struct
> > platform_device
> > *pdev)
> >
> >  	raw_spin_lock_init(&mpc8xxx_gc->lock);
> >
> > -	mpc8xxx_gc->regs =3D of_iomap(np, 0);
> > +	mpc8xxx_gc->regs =3D devm_platform_ioremap_resource(pdev, 0);
> >  	if (!mpc8xxx_gc->regs)
> >  		return -ENOMEM;
> >
> >  	gc =3D &mpc8xxx_gc->gc;
> >  	gc->parent =3D &pdev->dev;
> >
> > -	if (of_property_read_bool(np, "little-endian")) {
> > +	if (device_property_read_bool(&pdev->dev, "little-endian")) {
> >  		ret =3D bgpio_init(gc, &pdev->dev, 4,
> >  				 mpc8xxx_gc->regs + GPIO_DAT,
> >  				 NULL, NULL,
> > @@ -345,6 +344,7 @@ static int mpc8xxx_probe(struct platform_device
> > *pdev)
> >
> >  	mpc8xxx_gc->direction_output =3D gc->direction_output;
> >
> > +	devtype =3D device_get_match_data(&pdev->dev);
> >  	if (!devtype)
> >  		devtype =3D &mpc8xxx_gpio_devtype_default;
> >
> > @@ -369,9 +369,9 @@ static int mpc8xxx_probe(struct platform_device
> > *pdev)
> >  	 * associated input enable must be set (GPIOxGPIE[IEn]=3D1) to
> > propagate
> >  	 * the port value to the GPIO Data Register.
> >  	 */
> > +	fwnode =3D dev_fwnode(&pdev->dev);
> >  	if (of_device_is_compatible(np, "fsl,qoriq-gpio") ||
> > -	    of_device_is_compatible(np, "fsl,ls1028a-gpio") ||
> > -	    of_device_is_compatible(np, "fsl,ls1088a-gpio"))
>=20
> Again, please keep this. The DT bindings don't mention "fsl,qoriq-gpio"
> is required. Alternatively, change the binding (ideally convert it to
> YAML) and get an ack by Rob.

OK, I will keep this in next version

Regards,
Ran

> -michael
