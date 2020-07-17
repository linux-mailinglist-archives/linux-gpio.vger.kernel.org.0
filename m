Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09200223716
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jul 2020 10:33:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726463AbgGQIdw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Jul 2020 04:33:52 -0400
Received: from mx0b-00128a01.pphosted.com ([148.163.139.77]:41858 "EHLO
        mx0b-00128a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725970AbgGQIdv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 17 Jul 2020 04:33:51 -0400
Received: from pps.filterd (m0167091.ppops.net [127.0.0.1])
        by mx0b-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 06H8Ojbp008918;
        Fri, 17 Jul 2020 04:33:48 -0400
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2172.outbound.protection.outlook.com [104.47.55.172])
        by mx0b-00128a01.pphosted.com with ESMTP id 32as9htatr-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 17 Jul 2020 04:33:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SVb+ARwe/OJP9dr5xLEsxq8Otdc6A2giD4hr09SqQXFMwJAtpZQTadIO8t4qB08uA9cSDIqf7VMkb6vFNflKdoXjVqwgfL9I6ylmIh8Gc8coyd9ZonOgra0V+yhl6PXtMQNOIhHhsiaC5QZct7eBW55fZJ+LbnTjUOVsJG+snapQKtDOB6g/63AIo3dA8kZLy2e/T9B2aX7LFM7KJ9QyCg/jZ2UiCCGtZ5Z+tc8sVj9JchbMEokVIhBFbUs7WsR729+LGVESZZ8HGH1m210AsSnNPERaO4JBrS6JGv/aCXrijKkybRJ8i3XH3+gC62vYP5KUmoG4QjVdiMJBjAFSgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ijicEtZiRuFHIETsk+UqHgh0x0roddbnb4nImz0Ck+Y=;
 b=HaeB0/lVx3HYi04SCGtETRkkQUcZzexOok8MzxaIdybQz/uCzL3mxDUhk7RIW9taXzftJqzvk/vz5acLqaEJ2lSh/sqhxKOwyuuvRpST2QGfLJAEeLCd9eOK8Zx7nk9lmPECt38xy513us7Np6GnIBl9izs7PRu+5htogw4lQXxNhjlBy3IjqXs5J5tarjWsq7gD+CUQsoYr+Z1EaDfehRIeCeygiAJ22+MUu7M2h24ld/ZmKzP0T+usBSuYZtxJTVp/2sdanL1n1KIjw9awBUrwUe3gkpIisSG/PLY6ORvFQTc9Ecj+4wVPAcX5KW48DYLJhnG7tKu6S5eeils4Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ijicEtZiRuFHIETsk+UqHgh0x0roddbnb4nImz0Ck+Y=;
 b=00HvuYiHRtd1bbeKP8JQhLbyCp5dqSu5IQZySfoLRUla+bP9djUdCEfkW2VmrozR/1YmHrAIYWVb2qHMTa0IVSicsmkJo/Gm5i6tKVyzTOKfkLk8S8CkyN63Zc7+OgyZhDgKMVK+3ex4B7fzwvyrnkw50tOsH7BJZ3ARORLMZFk=
Received: from BN6PR03MB2596.namprd03.prod.outlook.com (2603:10b6:404:56::13)
 by BN7PR03MB3937.namprd03.prod.outlook.com (2603:10b6:408:2c::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21; Fri, 17 Jul
 2020 08:33:47 +0000
Received: from BN6PR03MB2596.namprd03.prod.outlook.com
 ([fe80::7ddb:b5e3:4dd0:dcc9]) by BN6PR03MB2596.namprd03.prod.outlook.com
 ([fe80::7ddb:b5e3:4dd0:dcc9%8]) with mapi id 15.20.3174.026; Fri, 17 Jul 2020
 08:33:46 +0000
From:   "Hennerich, Michael" <Michael.Hennerich@analog.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
CC:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Nikolaus Voss <nv@vosn.de>
Subject: RE: [PATCH] gpio: adp5588: Use irqchip template
Thread-Topic: [PATCH] gpio: adp5588: Use irqchip template
Thread-Index: AQHWW4KIcmPfpXHhMkSR0Nm2d8O/yKkLctZQ
Date:   Fri, 17 Jul 2020 08:33:46 +0000
Message-ID: <BN6PR03MB259607433CECFB0B654D2C618E7C0@BN6PR03MB2596.namprd03.prod.outlook.com>
References: <20200716150502.195821-1-linus.walleij@linaro.org>
In-Reply-To: <20200716150502.195821-1-linus.walleij@linaro.org>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?us-ascii?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcbWhlbm5lcmlc?=
 =?us-ascii?Q?YXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRi?=
 =?us-ascii?Q?YTI5ZTM1Ylxtc2dzXG1zZy0zOWIyNDZhNi1jODA4LTExZWEtOTAzMy00ODg5?=
 =?us-ascii?Q?ZTc3Y2RkZWNcYW1lLXRlc3RcMzliMjQ2YTgtYzgwOC0xMWVhLTkwMzMtNDg4?=
 =?us-ascii?Q?OWU3N2NkZGVjYm9keS50eHQiIHN6PSIzMjgxIiB0PSIxMzIzOTQ0ODQyNTE2?=
 =?us-ascii?Q?ODk3MzQiIGg9IkE0dEVyanhFcjlOenFhZUdvUHN1dkpYR20vVT0iIGlkPSIi?=
 =?us-ascii?Q?IGJsPSIwIiBibz0iMSIgY2k9ImNBQUFBRVJIVTFSU1JVRk5DZ1VBQUVvQ0FB?=
 =?us-ascii?Q?QUdBd3Y4RkZ6V0FXWng0OVZ1WDAzK1puSGoxVzVmVGY0REFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFIQUFBQURhQVFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFFQUFRQUJBQUFBYVBTNzl3QUFBQUFBQUFBQUFBQUFBSjRBQUFCaEFHUUFh?=
 =?us-ascii?Q?UUJmQUhNQVpRQmpBSFVBY2dCbEFGOEFjQUJ5QUc4QWFnQmxBR01BZEFCekFG?=
 =?us-ascii?Q?OEFaZ0JoQUd3QWN3QmxBRjhBWmdCdkFITUFhUUIwQUdrQWRnQmxBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUVBQUFBQUFBQUFBZ0FBQUFBQW5nQUFBR0VBWkFCcEFGOEFjd0JsQUdNQWRR?=
 =?us-ascii?Q?QnlBR1VBWHdCd0FISUFid0JxQUdVQVl3QjBBSE1BWHdCMEFHa0FaUUJ5QURF?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFRQUFBQUFBQUFBQ0FB?=
 =?us-ascii?Q?QUFBQUNlQUFBQVlRQmtBR2tBWHdCekFHVUFZd0IxQUhJQVpRQmZBSEFBY2dC?=
 =?us-ascii?Q?dkFHb0FaUUJqQUhRQWN3QmZBSFFBYVFCbEFISUFNZ0FBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFCQUFBQUFBQUFBQUlBQUFBQUFBPT0iLz48L21l?=
 =?us-ascii?Q?dGE+?=
x-dg-rorf: true
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=analog.com;
x-originating-ip: [137.71.226.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: a24212a7-3550-4501-55b8-08d82a2c1f91
x-ms-traffictypediagnostic: BN7PR03MB3937:
x-microsoft-antispam-prvs: <BN7PR03MB39376FAD3A382A0A79DF35848E7C0@BN7PR03MB3937.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: X0U6xfYq6d/HiKn2SiLlWSCq4oMgAN181lskLar/DkAv0QLv+oUvSbCP36/bjeMPMhYrtzwrB2aP7hgm6HSaCghwl5uZE1FZwXAXjk78kfNm6XgrriYhOfc7Xa++KMokQonOkYz1bIQhP16hOZQmInyfhFv/m2Y7MNyOYdxZP7AK1l1wZrU5FxfmxMTy2HZJr5ko3I912zFpflqN3ccosTnFqa6xwXkPINd/56rUED9HfwpVHsADF3j/zK1UwbAF4hSVDU482lrg3wrr+qTu03wJ7ldlf3UGp+m+JSsfoX8bbMVCAxbeGxq4T2ynwCPkTm0wa19QHZvwoF+1wMcbzw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR03MB2596.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(376002)(346002)(396003)(136003)(366004)(39860400002)(64756008)(186003)(76116006)(52536014)(26005)(66946007)(86362001)(66446008)(54906003)(110136005)(4326008)(8936002)(478600001)(316002)(71200400001)(5660300002)(9686003)(2906002)(55016002)(6506007)(33656002)(53546011)(66476007)(7696005)(66556008)(83380400001)(8676002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: Dzi3HXVIxtINPBYhCWonCBOwqWGhJ5h9EnyKUX8qK22QaZZrk95fHfEjr6lZlwVwOhkUfQ3FiPgtql5FD1jirDGRVCvZtoBGAkK1ycMBeCNDo6BIrU0pEAglO7p6BbPdo5M5TcqG6qVI0Q1VPp2uDcqvQmUkKoITRB2tT4mcpT5tkdd31BgEgeQm3l1dhTce4jDSnvOoC8TLdPgNefEemUO7wbW6TQobdrgmjxISMeLyX80fJLQHQL36KeDkzT6L1fdYaKQpevU/PHBvrNbKAxnyKkoOKEWgOUydnV0hZ8MVAqvWTy5b1XZQQ4Ilv9Ia/EtJmnNFdxqQf6lVOhatWnUGxMtpI5y+fgtnSAJ4ZL7tw7jGJpT8lwS4Vv774dbD2BI51ScKHdIMSU2gDk39Q3Kxq5f4QERE8GftDNgo7QSNuSCsxkc5K0uL9rtclJEbpB4ieFzXTZw0HB6C/hXQSJrgpLq+/q337+xTX7ZBvwBTyUAUlmBanyG9ZWVJmraF
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR03MB2596.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a24212a7-3550-4501-55b8-08d82a2c1f91
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2020 08:33:46.8041
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: drMDDa5IwPkPI67dcHQaVQz82h0ZtmH5+DXC/KasG35I5T3qUT3TmEtg3gXOLvfA2SEI6X9ddDr31uYrHkxwg8QUuziUhgBd151gZa3ZqO4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB3937
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-07-17_04:2020-07-17,2020-07-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 phishscore=0 mlxlogscore=999 impostorscore=0 suspectscore=0 spamscore=0
 adultscore=0 bulkscore=0 priorityscore=1501 clxscore=1011
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007170065
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

> -----Original Message-----
> From: Linus Walleij <linus.walleij@linaro.org>
> Sent: Donnerstag, 16. Juli 2020 17:05
> To: linux-gpio@vger.kernel.org
> Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>; Linus Walleij
> <linus.walleij@linaro.org>; Nikolaus Voss <nv@vosn.de>; Hennerich, Michae=
l
> <Michael.Hennerich@analog.com>
> Subject: [PATCH] gpio: adp5588: Use irqchip template
>=20
> This makes the driver use the irqchip template to assign properties to th=
e
> gpio_irq_chip instead of using the explicit calls to
> gpiochip_irqchip_add_nested() and gpiochip_set_nested_irqchip(). The irqc=
hip
> is instead added while adding the gpiochip.
>=20
> Cc: Nikolaus Voss <nv@vosn.de>
> Cc: Michael Hennerich <michael.hennerich@analog.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Acked-by: Michael Hennerich <michael.hennerich@analog.com>

> ---
>  drivers/gpio/gpio-adp5588.c | 39 +++++++++++++++++++++++--------------
>  1 file changed, 24 insertions(+), 15 deletions(-)
>=20
> diff --git a/drivers/gpio/gpio-adp5588.c b/drivers/gpio/gpio-adp5588.c in=
dex
> 49f423d7beba..f1e4ac90e7d3 100644
> --- a/drivers/gpio/gpio-adp5588.c
> +++ b/drivers/gpio/gpio-adp5588.c
> @@ -272,13 +272,24 @@ static irqreturn_t adp5588_irq_handler(int irq, voi=
d
> *devid)
>  	return IRQ_HANDLED;
>  }
>=20
> +
> +static int adp5588_irq_init_hw(struct gpio_chip *gc) {
> +	struct adp5588_gpio *dev =3D gpiochip_get_data(gc);
> +	/* Enable IRQs after registering chip */
> +	adp5588_gpio_write(dev->client, CFG,
> +			   ADP5588_AUTO_INC | ADP5588_INT_CFG |
> ADP5588_KE_IEN);
> +
> +	return 0;
> +}
> +
>  static int adp5588_irq_setup(struct adp5588_gpio *dev)  {
>  	struct i2c_client *client =3D dev->client;
>  	int ret;
>  	struct adp5588_gpio_platform_data *pdata =3D
>  			dev_get_platdata(&client->dev);
> -	int irq_base =3D pdata ? pdata->irq_base : 0;
> +	struct gpio_irq_chip *girq;
>=20
>  	adp5588_gpio_write(client, CFG, ADP5588_AUTO_INC);
>  	adp5588_gpio_write(client, INT_STAT, -1); /* status is W1C */ @@ -
> 294,21 +305,19 @@ static int adp5588_irq_setup(struct adp5588_gpio *dev)
>  			client->irq);
>  		return ret;
>  	}
> -	ret =3D gpiochip_irqchip_add_nested(&dev->gpio_chip,
> -					  &adp5588_irq_chip, irq_base,
> -					  handle_simple_irq,
> -					  IRQ_TYPE_NONE);
> -	if (ret) {
> -		dev_err(&client->dev,
> -			"could not connect irqchip to gpiochip\n");
> -		return ret;
> -	}
> -	gpiochip_set_nested_irqchip(&dev->gpio_chip,
> -				    &adp5588_irq_chip,
> -				    client->irq);
>=20
> -	adp5588_gpio_write(client, CFG,
> -		ADP5588_AUTO_INC | ADP5588_INT_CFG |
> ADP5588_KE_IEN);
> +	/* This will be registered in the call to devm_gpiochip_add_data() */
> +	girq =3D &dev->gpio_chip.irq;
> +	girq->chip =3D &adp5588_irq_chip;
> +	/* This will let us handle the parent IRQ in the driver */
> +	girq->parent_handler =3D NULL;
> +	girq->num_parents =3D 0;
> +	girq->parents =3D NULL;
> +	girq->first =3D pdata ? pdata->irq_base : 0;
> +	girq->default_type =3D IRQ_TYPE_NONE;
> +	girq->handler =3D handle_simple_irq;
> +	girq->init_hw =3D adp5588_irq_init_hw;
> +	girq->threaded =3D true;
>=20
>  	return 0;
>  }
> --
> 2.26.2

