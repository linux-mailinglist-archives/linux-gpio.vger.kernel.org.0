Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D98833AB7C
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Mar 2021 07:13:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229952AbhCOGNC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Mar 2021 02:13:02 -0400
Received: from mail-eopbgr140050.outbound.protection.outlook.com ([40.107.14.50]:64065
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229939AbhCOGMy (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 15 Mar 2021 02:12:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ff6t5XrdwHIVOwFn0YGg8rRv8ph+SebzNqY5+OfC4qNfCiaasndQaumAoVID1SG+ilDHZdc26ywi5eas1AfX/NMp/p27VgNIFrWRf1rStGy6L8aV/uUDph5lVG+fNjF9KS5WdKWDeW1Okfxaz6ul9KLSD+1RMsSVU3Au1xIHGgD4AgdnSEwTouP8NC7PVDXP0WqJ+XqYhDftG8NNqB9zQFX6e0wSlQr237MkI6wD5xmnD4yVCs4uvHcUHkNhiqBv3KT+1piiQvu78Jus1dLvqm36FAZFq1AL4aqA5ryK4GBu97dm/S/gsxLiFidIxo2ldNk8PhmCXrMrL0tnd9VxTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vo0Cx6zEOW7H6SmlgRmoBvGThsE9sUPE3zwBee3zlyk=;
 b=hYcWVqbZ/tiOvAAzhe2h1sum7IkMNwiND9WAaaueezDfeQ4Ay4GFviuYAPbygdBy5FWvKLe0icLBE4t5W9xC3H8Hu5sagiejAb3VipOkarJbmUcC9y2/qjj+Di+vDwMwiut3xvZd39LKL45raWzHKr5KQw3FH71wLpYIqXLhkJRFIK51AwsxDXucOKIdXGielhAUcP1LWwKGUmAv+ZawUViN37p30zNjpuPwqI4LWI7ly5mLPczWd8JXh4+I3gwprbngwHrv0tlSwbXqZZT6eH30hNN1l620d+VG/WhbjY3G/IfZJbGQQkleA1twoODJ1UjkxVJcRZxsYaQIW+I8zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vo0Cx6zEOW7H6SmlgRmoBvGThsE9sUPE3zwBee3zlyk=;
 b=BrKhtODKiROfURjkl3lEwf9cmT3hBqz1SZYy2QDJCJYnjZLjIawLiLssYb19mnEWn74OryjTVlCxFBS2iFyatYE1wGXQDVKur26HGqwjeCfakTUujTaj+OTWBN61CSx76fYtztb6qm+o79l3E7/7uW4/9VSf4e40rm5JuDT4tkc=
Received: from AM6PR04MB5413.eurprd04.prod.outlook.com (2603:10a6:20b:96::28)
 by AM6PR04MB5862.eurprd04.prod.outlook.com (2603:10a6:20b:a0::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Mon, 15 Mar
 2021 06:12:51 +0000
Received: from AM6PR04MB5413.eurprd04.prod.outlook.com
 ([fe80::b4f2:d00e:93a1:8685]) by AM6PR04MB5413.eurprd04.prod.outlook.com
 ([fe80::b4f2:d00e:93a1:8685%3]) with mapi id 15.20.3912.031; Mon, 15 Mar 2021
 06:12:51 +0000
From:   Ran Wang <ran.wang_1@nxp.com>
To:     Michael Walle <michael@walle.cc>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] gpio: mpc8xxx: Add ACPI support
Thread-Topic: [PATCH] gpio: mpc8xxx: Add ACPI support
Thread-Index: AQHXFwwpLHvnJWCO3UK4nTufOmNaDqqAMZcAgAJtSQCAAfVfcA==
Date:   Mon, 15 Mar 2021 06:12:51 +0000
Message-ID: <AM6PR04MB5413D4AC1CE72AE290FBC38CF16C9@AM6PR04MB5413.eurprd04.prod.outlook.com>
References: <20210312065855.37072-1-ran.wang_1@nxp.com>
 <CAMpxmJUjzL_6rU+45qWLABBFjkXoS3hBz3TzoP3VJErNOTFdWQ@mail.gmail.com>
 <2c27e99e22169304c8fa5d3f42084b20@walle.cc>
In-Reply-To: <2c27e99e22169304c8fa5d3f42084b20@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: walle.cc; dkim=none (message not signed)
 header.d=none;walle.cc; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 591f2e0a-7415-4f20-4f01-08d8e7795d8a
x-ms-traffictypediagnostic: AM6PR04MB5862:
x-microsoft-antispam-prvs: <AM6PR04MB58624CA4D830F9F7708BF862F16C9@AM6PR04MB5862.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EEgDge6r1IG6BzMXPjAdAV9Njf8FF9xuB4BVwk9DixoMkEyxNcQzIqHXTBGY55+IvFtHJ3kYXP4GzwTCcY2tjjI0sUvIuCVzWOLjGB0qZuVF6tU0XxwlPI4rmdo3iDA3EQxcxH0jzb+5bfjk0BVLqRDt5SxzVHHFYC5W6z9vpCNMvFIxTPd0XlBdzBBZn96agnzCc/FQQsN1HfLMi4ZsJnm8D1JEumU9wh3shftE6EOrdKE51xwtIltlZHvPQLTj8IXbb/fSmKXiZH7FHj6K2WqNr0/D/aFFINRnpNp63oF5cluAMH4bR49BtkXlYFKZvdTyILkMgR846CRkW3npktwCCrckj+H7KQ2kRZHSfbL0joiFZZb2BWh6bBBeucgJJjwjX20ZO0ybIvyeQeTqYTtdgkNdjK/Wt1tMqkZnCfV7yIIFO3yJ1XpMsu7GRKpSFg2PvfBm/zWGkz7hDtUHAcTY8B8m9uj2Ikn3FShrmwqHQX7yB2/qEAXP02wtiKa4a41snucncrCIMAqddTQvlHrzAulEg2Na9CYJ55r0xa4snB8eeDeNddP4NXFpQcC4Etqv+Roi4KD7oIO15E8n0BniIfpbYN/Q1pSKPEE+peU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB5413.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(39860400002)(346002)(376002)(396003)(2906002)(478600001)(316002)(66446008)(6506007)(5660300002)(83380400001)(86362001)(53546011)(55016002)(110136005)(33656002)(54906003)(52536014)(4326008)(26005)(9686003)(66476007)(7696005)(64756008)(8676002)(66556008)(71200400001)(66946007)(186003)(76116006)(8936002)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?XBv6uT5W4MYDFGeND8QByBPaeNkIuq+X3weVe2Mys9lEnrYyrw1YEAH/offG?=
 =?us-ascii?Q?V0GGwJdZVGLMeSfya6YcEdclVhX0K6vlM3Mm7hSiiiEEYQI3xotKhcHHfFnp?=
 =?us-ascii?Q?mc4YMWFjYrohNheryVMXHT5aXQbOnuCN4ZhIpBzUB37KLBfH8XacUmeadQI2?=
 =?us-ascii?Q?75hZSceZE3u50dcUq7/CKSw50HC/AJndm1//rxKiXKa/hPPJmisouer5Q3u/?=
 =?us-ascii?Q?UZhlcDdBW7eUSNzwBdVgHTU1Y6XtMxwrALVo+8Ctf7jeT3ZR2wazSUuOv/YG?=
 =?us-ascii?Q?nSrwRTjnRsQJgRkQiOFqGwMXEI+7va6qUw3ckWgiS5wMdWsF+acvZRGw2aVc?=
 =?us-ascii?Q?7oJss78jKjGNdcUQ2t3V6Y2nOAlomh1pO0kqSgRbs3V/BZPlCE8+BgiNSwI2?=
 =?us-ascii?Q?TazDB/k8nBy0ArVAfL7UQq84ZMBRTR141YaVSdF7TXsr5CjyxFaOHWuyTdgr?=
 =?us-ascii?Q?pN278kgCwpk61rpFoyPG1qdnkIDVI9TrKf8H3renCBasUvhENPoiQ0SMB6Nj?=
 =?us-ascii?Q?uoZXsqQylRljrAI69V9oPf1yrvfPVPHqNvNnTmaEzBLcXV2zZ79EqPXOq/sM?=
 =?us-ascii?Q?/nYl3vOJ1vxJh45erClj+WqxwrNaPMukAl4d3IZRPhD0bfWdhntTTH8QKFIe?=
 =?us-ascii?Q?lEVp1Cc6Ug1Xk7LZzVTP6dIQuXQowXz7j4BDEVgaLwLyo2DBKEqLJLHr/lcI?=
 =?us-ascii?Q?O04/bmzvtICc7HOuMh0eRSspdzoq49e8SRUUw8NnkdgEnjL4QMr/mKBVRtIL?=
 =?us-ascii?Q?Hv0xWdQ2ObjmMKWjk0P6AgEtHn1Ct3+kb9o8LGSJmoyuVOT1e1TXTIQS3qf9?=
 =?us-ascii?Q?JV5qzPmblZRGDTadpMeGXco3SZTpy5a38qLikb6Qf3XpNdxgFpCVCYeVpJdG?=
 =?us-ascii?Q?H7Fw6m/QXKauGIYdu1Xv7WEJMfrCBmAZbUyMbkUxatJob2TqQHqUB/0k/tZz?=
 =?us-ascii?Q?sWM4FQ3AOGA82SXO4l6f3cPmPTOvejgWy+v9YBVXSkeBv0W4F+DhmUh/P5hC?=
 =?us-ascii?Q?Z6+/yXTrqfcoXdekYHexqWyFLEb0piP9BwMM0ozWA8Qw0/PHRjhYMVlpz1ek?=
 =?us-ascii?Q?AsCwyiMhia5UqxB79AMY+6rZcMXo5RxXGDmHr6NA/W+IsOP/XV/GO/lCXAtH?=
 =?us-ascii?Q?GdRfvQkLuqm3L7KPIONdlLb7pa814qAiMYOV8vj4rUwugDm4QV6vb6cHVBN/?=
 =?us-ascii?Q?+CYE7fJtlqW796gtTSF8GH8sxop0WsvF6bcnRoBP6NKko0I5eVtdeyUGknhA?=
 =?us-ascii?Q?q9KkXH1NllB86gPoiCW7DIBFiwE2UaTVDTfgBiT1S/AQGIqQ1ZaDYCJS5DjN?=
 =?us-ascii?Q?T7aIQPVO5aA704Z1Do0Zuvg9?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5413.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 591f2e0a-7415-4f20-4f01-08d8e7795d8a
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Mar 2021 06:12:51.8090
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r7KYuCSRyCvEwwuGtP86Gv9kl9ocR9KYkUlRP5eZIPSuFgTbq8WwlLfRyjAEl824ok2pYk/rv6B0B42PWIV7IQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5862
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Michael, Bartosz,

On Sunday, March 14, 2021 8:11 AM, Michael Walle wrote:
>=20
> Am 2021-03-12 12:07, schrieb Bartosz Golaszewski:
> > On Fri, Mar 12, 2021 at 7:51 AM Ran Wang <ran.wang_1@nxp.com> wrote:
> >>
> >> Current implementation only supports DT, now add ACPI support.
> >>
> >> Note that compared to device of 'fsl,qoriq-gpio', LS1028A and
> >> LS1088A's GPIO have no extra programming, so simplify related
> >> checking.
> >>
> >> Signed-off-by: Ran Wang <ran.wang_1@nxp.com>
> >> ---
> >>  drivers/gpio/gpio-mpc8xxx.c | 50
> >> +++++++++++++++++++++++++++----------
> >>  1 file changed, 37 insertions(+), 13 deletions(-)
> >>
> >> diff --git a/drivers/gpio/gpio-mpc8xxx.c
> >> b/drivers/gpio/gpio-mpc8xxx.c index 6dfca83bcd90..de5b7e17cde3 100644
> >> --- a/drivers/gpio/gpio-mpc8xxx.c
> >> +++ b/drivers/gpio/gpio-mpc8xxx.c
> >> @@ -9,6 +9,7 @@
> >>   * kind, whether express or implied.
> >>   */
> >>
> >> +#include <linux/acpi.h>
> >>  #include <linux/kernel.h>
> >>  #include <linux/init.h>
> >>  #include <linux/spinlock.h>
> >> @@ -292,8 +293,6 @@ static const struct of_device_id
> >> mpc8xxx_gpio_ids[] =3D {
> >>         { .compatible =3D "fsl,mpc5121-gpio", .data =3D
> >> &mpc512x_gpio_devtype, },
> >>         { .compatible =3D "fsl,mpc5125-gpio", .data =3D
> >> &mpc5125_gpio_devtype, },
> >>         { .compatible =3D "fsl,pq3-gpio",     },
> >> -       { .compatible =3D "fsl,ls1028a-gpio", },
> >> -       { .compatible =3D "fsl,ls1088a-gpio", },
> >
> > Why are you removing support for those?
>=20
> I guess because it doesn't matter because usually
>   compatible =3D "fsl,ls1028a-gpio", "fsl,qoriq-gpio"; is used.

Yes,

>But I just had a look at the dt binding and it doesn't mandate it. So plea=
se keep it.

For now, strictly speaking, QorIQ pressors belong to Power Architecture
and Layerscape processor (LS1012A, LS1021A, LS1043A, LS1046A, LS1088A,
LS2088A, LX2160A, etc) belong to Arm Architecture

Although they are integrated the same GPIO controller IP with
minor difference (endian perspective), it would be find to use
SoC specific compatible + "qoriq-gpio" to make it work for all
Layerscape platforms (with "little-endian" accordingly).

But for mpc8xxx_gpio_ids, I think it would not be necessary
to list all LS/LX compatible strings. what do you say?

Regards,
Ran

> -michael
>=20
> >
> > Bart
> >
