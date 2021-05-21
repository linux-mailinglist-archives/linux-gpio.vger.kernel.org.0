Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE10538C236
	for <lists+linux-gpio@lfdr.de>; Fri, 21 May 2021 10:45:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230442AbhEUIrN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 May 2021 04:47:13 -0400
Received: from mail-eopbgr10076.outbound.protection.outlook.com ([40.107.1.76]:24321
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232539AbhEUIrM (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 21 May 2021 04:47:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aNyNHthpftT4+VuX9nNAF8e6kF/q0D/07k4IWD4MTXCEtjB5lLtHXnncqC/glGuKSDpj8E/fV9yytgGj4K503FclZZnWEX2bWZM4rR77SZUkjkN6It4pUlK0IavPZHOMQUC5iFZ4pzjrLT8miBmydyQ53LOSI1mBZNelZqswsNJ3ujyTkbTJHl198MIgfaGeRjotvvIZJS1LpmX3tT8+IDRkWbSrX63A1iyQL+2Ru3Y9M8D495jtJ3/kYKhnb7qDT/QXUBPUy3GLMyjm9mhzUr9znVKdSHOn2UXiNxYQywqkwgy0D1q3KdMU6bvxMdLIwznHhy4A4GfwKOFy78itOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bEE+01nKc22+Lhf6IAOYbrdJ3CR8jZRNiZpxkZDzzb4=;
 b=U9xCsZwT0qE7qMZMKpm80lqvINmEF0Wr8L3ao0FiJltRza9YQ/GE9Z56g8c4i9CLXdjRxcV3LRhTEZN+E/qdOFkgPhI6b2Lbx8qV8BrEdX7/hDyS0aj6Vye3EUauwN5QZbEE8oLzyD+vc1DPw+f8H7Ps+TK5kZk+TPRE1xGOMBbrRi/0RaU0iaqvqu34QrI24qcggOJa4NUUj9cfiQ0Q6GdSpwhNzjFtIb+B10sLQXFrs9+SQKYPJGzMgFE8FJMDpEQsyI9XW5SWChB2iTASDthJcKQk9dd5jIFua0SwWGmN+qdLM16qyPGUqjFa3dQ2HAwwCIHzjvBbF2jlZ2z8tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bEE+01nKc22+Lhf6IAOYbrdJ3CR8jZRNiZpxkZDzzb4=;
 b=yfejm2cGTPTy9ubZ7GebJmR9o4jr/1bw7kmVzLEDbtrNlwkYCD9JoLBiDJzCaITiG0QFcOYyCne/vYineTjtsd1NgXdsyHW/3D7HQHEq/samyTNfeLi+6RO3Ma3CL7UczH/8NimRbQvOKFids/9ewUNpcD6v1Yvb4qS6F6Ol+Vo=
Received: from PR3PR10MB4142.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:ac::5)
 by PAXPR10MB4750.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:dc::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Fri, 21 May
 2021 08:45:47 +0000
Received: from PR3PR10MB4142.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::c8ee:3efc:16a5:3d84]) by PR3PR10MB4142.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::c8ee:3efc:16a5:3d84%3]) with mapi id 15.20.4129.035; Fri, 21 May 2021
 08:45:47 +0000
From:   Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
To:     Alexandru Ardelean <aardelean@deviqon.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC:     "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        Support Opensource <Support.Opensource@diasemi.com>
Subject: RE: [PATCH] gpio: gpio-da9055: remove platform_set_drvdata() +
 cleanup probe
Thread-Topic: [PATCH] gpio: gpio-da9055: remove platform_set_drvdata() +
 cleanup probe
Thread-Index: AQHXSKLSflOU5D2YnEmwJKERwf0IKKrtqdMA
Date:   Fri, 21 May 2021 08:45:47 +0000
Message-ID: <PR3PR10MB4142D5A98C0B0E4C08CBAE1C80299@PR3PR10MB4142.EURPRD10.PROD.OUTLOOK.COM>
References: <20210514092332.19966-1-aardelean@deviqon.com>
In-Reply-To: <20210514092332.19966-1-aardelean@deviqon.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: deviqon.com; dkim=none (message not signed)
 header.d=none;deviqon.com; dmarc=none action=none header.from=diasemi.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [147.161.166.124]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5d095fa1-0a92-4eeb-fcf0-08d91c34d45e
x-ms-traffictypediagnostic: PAXPR10MB4750:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <PAXPR10MB47505303D9DD053A3451CEBFA7299@PAXPR10MB4750.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LCgtGEEB3dM4Rjqd7uKP2b5DCe1WTl+kQRPz+q0jGOQn2TrK2xO7Pm7fhLk5DRI3qn7yyk+PQG1Y6hF4fr6He41K42mrTS2q7WXAhHkcaYlINrbdaWwYPXF4QsFRst55rvXB1UtYQBmuqD5d9LgS8k745J18cr4wQaSF0rPlqSvI7yHWMY+tEIATs2gRUhCwszzeou3WnA3QLDejPJimJShdb7qOfKpmHXdnCYfGEwmaejTKzYgYlKNMLuL0+JraGe1qOAzC9Dh1VG5+ZMIHd+M+aIi03GDsFBRmHk84SN5A3MFIVTr8MDu+80UWGCoAKw2oej0AH56NErIO0YEluNmjuYuTl4cGu8e72BYRarqVH1lEE/7csfGC2rFctFc80fM10oCj4XcZsa/wNrG1Qjtu5QUasoCaoF3KzUeWizdmPpOH7n86G/4IFUo/VQhtOEAGe//wDThKz/hq9lpjpgEHW4odKzdivoMtVxzJ0YIz1qENoMZx287QI5foOymSlK66zzVCTI1ErYAbhbPmP2bhRbkODMjEyc/kflppT54aFlWvMgreTNmc75yMT4NILf6vN1gM5Z9waHrLLpkE0AONvv4kQ3FbH2A9yqs+5oA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR10MB4142.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(346002)(39860400002)(376002)(136003)(366004)(396003)(76116006)(38100700002)(83380400001)(9686003)(7696005)(4326008)(6506007)(8936002)(53546011)(54906003)(2906002)(186003)(26005)(8676002)(478600001)(55016002)(110136005)(5660300002)(66556008)(66446008)(71200400001)(86362001)(107886003)(316002)(52536014)(33656002)(122000001)(64756008)(66476007)(66946007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?vwatcBf0HrZR3iniagC48ZbK0J+mzhHNE3JgfhOAdy8HXNpH5dVWgKH4PT/L?=
 =?us-ascii?Q?G3YDGDKcztF03sLhm3awGLhZ9Ia5rCxHHTUo4udLJgW+V+KqlziCRjkJH46a?=
 =?us-ascii?Q?D6u0NrwziPFThyLOhHPND5OcFXzohUcCqVk/0c6zOjrRn9KE7oY+LiAQkUAl?=
 =?us-ascii?Q?4vrQ7qQXTkjh/Mc5jHKLlhW6ZKiLuLhjg/KkiqPYlpOxlbt5V0cN16IfLhbp?=
 =?us-ascii?Q?qoi8m0+uJ3FS9YKlhY55Vszr5qIUy5zDhsh7dftkwN2YHyeU6GNI46/nMSA4?=
 =?us-ascii?Q?95lMm6R7u9vVluLwq9wP3lIHDe9Ilype03ACJM5TUVSPV40auOnCTL+rVYk3?=
 =?us-ascii?Q?kImYzKUBd/E3Ncf5RETS1cMlQf7nS+V5vVk0+0LOs+EAAUK2GyDvynAn1/5F?=
 =?us-ascii?Q?cUfHbh0Hc2P6BfH21+5g+hQUytYyKyCrAwZwgWLmoz6OQXXEb0PKllLTej55?=
 =?us-ascii?Q?9W8Qchb4pVr5bWEYEArMXUb1gMrBNC0649tmSZtoRL17O7ytyShpvTPiFZ/+?=
 =?us-ascii?Q?tSreX3oyH1n3cHeOS+3TNteF2psLkYYya2Nmm2TpN82IPB/+3vri1xLBDvnB?=
 =?us-ascii?Q?mqb7cr8CaLP1MEdzZKa+whVumid7zTF6EH4FMK1RfmScro/Irc8hkfOD+sBG?=
 =?us-ascii?Q?O3KJWIhsAmIOlI/7r8ZoBNwjSbjl+c1zEV2R+YIjC16bzBEdkcqklsME3ute?=
 =?us-ascii?Q?FYpCuWGb2X0tzP2OmV+pbBrqAt8OCa+gb1f4QhBSjGc7TRA37pDh7tipV+t8?=
 =?us-ascii?Q?77AknkpX9x3dQ/k6WLEe4HtMu8LcK/mhw+kOO+1A5+JMSZv6ykRGrycA8xPG?=
 =?us-ascii?Q?QlzG+IIqw7gcDkNc+sGzgHdxyYSIsjRG+uXYIoWqPo7H0GBJb1Zczzs4Jy3p?=
 =?us-ascii?Q?exJSeFj+0BIGUCI3Eh+j7PN+FBrm6OAWyOqK5Zmmh7o02W9l3x0b57fFFSNP?=
 =?us-ascii?Q?ee3NZU6mxZ31N77f380ff0GIGlc8X7b71qPABlsfL5yya0YnHuIzIAASv3VN?=
 =?us-ascii?Q?7/SABjBQK/MTl1PtJf1t1tgblC/5ChQ+rJklqUEg/pp0LjRJxy2iaq+b1DrL?=
 =?us-ascii?Q?SaeZ+WNvt67tXDO5V4pajJp6cSeFZq2vYnrJpjCjvpaPXC0OryubxXrclqWq?=
 =?us-ascii?Q?0TwhGKZG0pyzu8cR7fy24ACJGxH6uL92xefTWtorPIycyNHlcZNh3Sof5KW/?=
 =?us-ascii?Q?eswQUcklwhbJjPZdhtyGfjYgW/30dE/5STJYevT7cVJpV4CdgeWq/hE7qzF3?=
 =?us-ascii?Q?PcjP0caJuj3Dv8Q7YkC720Q5yl4hrSOUtYCD/a+/gEjBq7ZuAL57dn0dYw7w?=
 =?us-ascii?Q?09zA4QSGGeAiOqTtyspYz2LI?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PR3PR10MB4142.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d095fa1-0a92-4eeb-fcf0-08d91c34d45e
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2021 08:45:47.5024
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X+rSkhzGd47D3dPSCsNGWy3XR3C5ZerynDgd4LeZoWJVtMUIggmS4DWqAH2tgeO7KZob9sFnQWbIbACYjxf7ShsDKw3OXG3nGtMDMxrtkQM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR10MB4750
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 14 May 2021 10:24, Alexandru Ardelean wrote:

> The platform_set_drvdata() call is only useful if we need to retrieve bac=
k
> the private information.
> Since the driver doesn't do that, it's not useful to have it.
>=20
> If this is removed, we can also just do a direct return on
> devm_gpiochip_add_data(). We don't need to print that this call failed as
> there are other ways to log/see this during probe.
>=20
> Signed-off-by: Alexandru Ardelean <aardelean@deviqon.com>

Acked-by: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>

> ---
>  drivers/gpio/gpio-da9055.c | 11 +----------
>  1 file changed, 1 insertion(+), 10 deletions(-)
>=20
> diff --git a/drivers/gpio/gpio-da9055.c b/drivers/gpio/gpio-da9055.c
> index 6ad0c37b862e..49446a030f10 100644
> --- a/drivers/gpio/gpio-da9055.c
> +++ b/drivers/gpio/gpio-da9055.c
> @@ -133,7 +133,6 @@ static int da9055_gpio_probe(struct platform_device
> *pdev)
>  {
>  	struct da9055_gpio *gpio;
>  	struct da9055_pdata *pdata;
> -	int ret;
>=20
>  	gpio =3D devm_kzalloc(&pdev->dev, sizeof(*gpio), GFP_KERNEL);
>  	if (!gpio)
> @@ -146,15 +145,7 @@ static int da9055_gpio_probe(struct platform_device
> *pdev)
>  	if (pdata && pdata->gpio_base)
>  		gpio->gp.base =3D pdata->gpio_base;
>=20
> -	ret =3D devm_gpiochip_add_data(&pdev->dev, &gpio->gp, gpio);
> -	if (ret < 0) {
> -		dev_err(&pdev->dev, "Could not register gpiochip, %d\n", ret);
> -		return ret;
> -	}
> -
> -	platform_set_drvdata(pdev, gpio);
> -
> -	return 0;
> +	return devm_gpiochip_add_data(&pdev->dev, &gpio->gp, gpio);
>  }
>=20
>  static struct platform_driver da9055_gpio_driver =3D {
> --
> 2.31.1

