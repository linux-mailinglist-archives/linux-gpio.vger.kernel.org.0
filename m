Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3861697F47
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Feb 2023 16:15:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229767AbjBOPPl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Feb 2023 10:15:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229758AbjBOPPj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Feb 2023 10:15:39 -0500
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on2057.outbound.protection.outlook.com [40.107.8.57])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B1673B0E5
        for <linux-gpio@vger.kernel.org>; Wed, 15 Feb 2023 07:15:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X1rrumrU7l8Hz7X9gth4re7NobEQjtmpmwGzMOuW+odurvlQhD+Vqk0Wd+F6jmHNNyJNQjJVRwlF1x2QMm0FEb5/i6KhxmcsXxZ3i7NYabGOvh/hhX5dPCCFtUM5Ds4IyuNJ3fDo6A6okFM0zsBmYu+2h4uAOJMasBxYqBtaYN71w8UsaUHeaazDtCZI+MVucuMz3abDnyDTZv5NGQgrVwqEiJlJfUwsh8dNHAUEiY3/BlWtjegSBjKCmjVxAnyBRXIQ57cm+n7PMI2w+Sg9nt+dsDJ2Pd2Tjums9jKX/TDApF8x/CZXVOTtkR1KfCnSFAHIrubkpmY2TKr6RGSLTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jFAuDHj6t/k8uxTRPE9jPuQy0LxsJ31fESj6q+J0+eg=;
 b=etwNOB9VuZbdXoA8Wn1Bi7CUP1qKSA4Z8pc6Wgu2v4DFjPRYuuabxR9EGwnHLpHOcOYV2LBinkQWlEYMvc29Sgy/e3FY8uon3uhnMvozZqMpdvOr7ZulR2JvUT3iy5ps8YyXotCxNSK17l9xd9Hzg4rS3A/xckgNHH6HbId+Fxf4Pz4f5XXeO5Bj1gniT8p2L1trAzmr1If8MhgsmSnYnqGavpmM3t3UEltGidCAMi/q2KBhsUTGijkipllhyoI8YS+mvRuxT0HSKICg/qabBKpkyNw1rAuNTfgfu1v8gWhyg8m9UaVWT0LiPM+4UrRslTqILNZDE76woXzAk9grRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jFAuDHj6t/k8uxTRPE9jPuQy0LxsJ31fESj6q+J0+eg=;
 b=WUvN1S7DylSnoBiMhG+Mrtqvk+7LCC+xVZRsvfGj+YeJ710NRZebFtWKXrO3Vr2CX2+ixTzrg2ywNh8pgBDb1VhoRH6v81oF0BjeuTpWW+WaCE4LOiJHEULa09R6YvzltyLav2Eciae5Qq6fkmRUdrbSqXK4gE0GJvaw1AyU/JE=
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by DB8PR04MB6843.eurprd04.prod.outlook.com (2603:10a6:10:11b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Wed, 15 Feb
 2023 15:15:25 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::31d:b51c:db92:cb15]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::31d:b51c:db92:cb15%7]) with mapi id 15.20.6086.026; Wed, 15 Feb 2023
 15:15:25 +0000
From:   Shenwei Wang <shenwei.wang@nxp.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: RE: [EXT] Re: [PATCH 1/1] gpio: mxc: remove static allocation of GPIO
 base
Thread-Topic: [EXT] Re: [PATCH 1/1] gpio: mxc: remove static allocation of
 GPIO base
Thread-Index: AQHZQMY+KautoPumfEeVMtw/eERPeK7PrbkAgABw0+A=
Date:   Wed, 15 Feb 2023 15:15:24 +0000
Message-ID: <PAXPR04MB9185117EEFB1232A09EC97F889A39@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <20230214224642.3804927-1-shenwei.wang@nxp.com>
 <CAMRc=Mfv-fQPa6Sz9jQ-2BgcZkAsTN=T6UKKnLUUs=exRHiZsA@mail.gmail.com>
In-Reply-To: <CAMRc=Mfv-fQPa6Sz9jQ-2BgcZkAsTN=T6UKKnLUUs=exRHiZsA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9185:EE_|DB8PR04MB6843:EE_
x-ms-office365-filtering-correlation-id: 07a285b8-497a-4e7c-8b21-08db0f6776b2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: g0qCGWO8TTNKr3q/bt8ZuXDVZwZDzIestu1LYE0HIT5ObmjktkFxS6kwN7fyBhjnljs61sxtYQOtCYejQ1PQS9sw5ft3hpPbWZsFlkWMaqsMZfjr4DfagkCAlm8cBen07BbWkd9+mBk02py1ZkquXyCEzV/gqNKQfftHq1EnuyrRMxXfpsBBSn+Mau/Vrg7vYe02FX/YOATl9swal3Jk1uoKSEj2hqLBKOPd/c3BbyA22eM7pbxoWRt2Bxj+nIQTQ2mYqxRKVuln1d5g/blh49tjFNc/ltwNeD1zfoVMFNWhKQoyrYBAGxP4P2xZqIA4/MGyuE/Tf2BFYVJ/uOnJ+bBul1SY3aeHkeOJxhr1X7reTduaFw2gMhg2JKu4/kVElVcs9uwalCQOsTazcXXbVkCjcSq4qMbKqpQkRNj4gRVNRo5W+jdoRz+hRqBnsyDdJHvFuvrANVdEv2m2LwolA2clNTvdMUBXV2vx1C+vhD3xPZ60yDRrv9QhYvjRGTBrpJn5GxLShaX/+gSOw5iUx0ME8Ao0MrF4VG/VJx+zudM5J6ylOl7V4SHWDsPIYjfPOzygjJuABpc66HR/KZUCEBgz7zEblSh+e69+0c1LXuPZN8owFIPMDH9FqL/2rxb7UC1EKhbPdLQ7nakZ2TP6+ImopIJhr/dgO7ECZ2rzR8LCbDdR7h7cv3ScKZ0k2qCc
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(136003)(366004)(346002)(396003)(376002)(451199018)(7696005)(45080400002)(38070700005)(71200400001)(478600001)(966005)(122000001)(8936002)(38100700002)(5660300002)(52536014)(41300700001)(55016003)(2906002)(26005)(33656002)(44832011)(86362001)(83380400001)(54906003)(66476007)(55236004)(76116006)(6916009)(4326008)(66556008)(8676002)(53546011)(6506007)(64756008)(66446008)(66946007)(186003)(316002)(9686003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?A3xdJRBks3+Zk8b8+dEGc4CwA+Xzi3FkvwX/x1IcORp0XiyCWyOjIYeWZsNQ?=
 =?us-ascii?Q?tvCKO+dml9rWrVOzHZLnwqvCtcwIP/QYja6YCP0dXKm1DhlwJyyMMNxnaDBY?=
 =?us-ascii?Q?kTEcUEGryU5AK3XU34xhSjJSffa0N+255WPi4rlGNAzJ0wbOBLt8pQGnJq7r?=
 =?us-ascii?Q?U6p14Jd0DNnNIj2otTLIJSqVTbYPkuaOzu5ljZefPdGm4UOBPBvhk1iOIwXu?=
 =?us-ascii?Q?l+uHzlwhjpeh7ruOsTToYh3R3tUwQgcSSoJpCbg4ssT7o+IPxrzhheR+mKqg?=
 =?us-ascii?Q?g9j39f2VWW2WLUUsUlO/zu/9SmfhPTmktA4HvQxMrNjDfz7jsvaZPNw6PUJS?=
 =?us-ascii?Q?s4PnJ/C6nhBnbfb7dK7AStpSKKZgbdgV+A3XV06V61smKdmqFwRNKJHOdvBw?=
 =?us-ascii?Q?ChlVaWbIr09tIz+TritUEhgZzB5eKitxlBXF+OidceWTBpgpHjd7QtaKFYM5?=
 =?us-ascii?Q?+AThDLJAe6HyAr5gCSujqDF3sJ2ZBspV951nORgh48aqKXZEfSTi3OIDriUh?=
 =?us-ascii?Q?WVwopnn/yBMoIoYb1E+r+MSigdNDH5NTxRh9j4+/6FUgAq0DBDSe27JBa9yf?=
 =?us-ascii?Q?frtxdde6J7d2Ku3thBeRe8EoDtsAeFYhTY9ZvamuL/T5vjlSNVV3kWkZpozB?=
 =?us-ascii?Q?rKQd3V0vH6ZIj71oFu6jHlLnKi8IniFZ1NU+wmAjknQaxA6713XRaJO6qL93?=
 =?us-ascii?Q?HjMt3y53ZwUcZNsJcrUnN5hNoGhFyxaiwiCAOfaajplc+YdRGSHHr0qOtkmx?=
 =?us-ascii?Q?YafpJm1l9x7nGr1QC7UU6xEwa7j+Koof0kAaP2oC6RWk6/NEt9bxT4Xjdj7d?=
 =?us-ascii?Q?V/o5mHR+MldIlIC5S2dFNGq7gZE2/hvwnzv3ULhRqQoEC96Rg/tGq1X0+5sg?=
 =?us-ascii?Q?sdRubfBJqaBhS2AMdu8+c6tk5n3YMbD3W/hf0hiysQNvkmEHG0hBpkasnJKE?=
 =?us-ascii?Q?3mwTQmvcNSFJU75t629pZCFeXfcKHqPCKMnpkgO9xHZ06E14UwbOAKDPADRr?=
 =?us-ascii?Q?/QS99ee06IWsKbC9UE8S3BHnkpS47d2WqkY1seJtVg25Qw0NFoI0CCdptxdy?=
 =?us-ascii?Q?gLQfisWa95rSbz2qqC9QwGp5cS5nX9BbsPP8uAq+65LJo4yAjEbpVIDOjP6c?=
 =?us-ascii?Q?RKk2EgGjFSIxXz5phITckd3O6eGP5LnsfpBXmavjoZbkROrAHxrRCKkesPHA?=
 =?us-ascii?Q?ZTxCSBcmH5YAQOKs0iSSF0iCjMPYKK5b7CRRK63UqS1DIeyfKZGbEw0IVm/J?=
 =?us-ascii?Q?icL5z1ZGp5vOQ8ab6/W9aOyFWTzsnBhJSMgOwanYp8uFQRCN5PvN26wDeApc?=
 =?us-ascii?Q?1JWPCtAlNqWHmPE+LPAFqc8qQQlv79rjzDjTQKP2ICi/krQWWjBenPRQlzOs?=
 =?us-ascii?Q?PCdcxKM0mMFlt3pgFz1kbXw9N/nTEc4hD9GggBDLbXdIrle3vf4PH1Z7Q/h3?=
 =?us-ascii?Q?yg+xPVkao4P6Gjs6vSaz+PHvK9UkEbIUjV/0olDTrJjhSji5znoQa830xJPr?=
 =?us-ascii?Q?2RTUkdnJDo42lD9n2F4fRhMyRJvF/vdg1ICXbDjjv6AKjt+SuqyoplNF4/+l?=
 =?us-ascii?Q?JBg8Rbln6l37LeCPNE+P9Z/WHrex2S8lkHP7SFuD?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07a285b8-497a-4e7c-8b21-08db0f6776b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Feb 2023 15:15:25.0205
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n8y6Ngq9gM6VmD/IJ0amB4TQXeZ+/ZwgZoAJ4lQSWZhr6WrYsCcKSOnGA6c3hZSGNWwt5TWh9zRCiN7VHzMWbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6843
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



> -----Original Message-----
> From: Bartosz Golaszewski <brgl@bgdev.pl>
> Sent: Wednesday, February 15, 2023 2:30 AM
> To: Shenwei Wang <shenwei.wang@nxp.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>; linux-gpio@vger.kernel.org;
> imx@lists.linux.dev
> Subject: [EXT] Re: [PATCH 1/1] gpio: mxc: remove static allocation of GPI=
O base
>=20
> Caution: EXT Email
>=20
> On Tue, Feb 14, 2023 at 11:47 PM Shenwei Wang <shenwei.wang@nxp.com>
> wrote:
> >
> > The latest gpio driver framework will give the following warning when
> > it detects the static allocation of the GPIO bases.
> >
> > "[    1.329312] gpio gpiochip0: Static allocation of GPIO base is
> > deprecated, use dynamic allocation."
> >
> > This patch removes the static allocation of GPIO base to get rid of
> > the warning message.
> >
> > Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> > ---
> >  drivers/gpio/gpio-mxc.c | 2 --
> >  1 file changed, 2 deletions(-)
> >
> > diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c index
> > d5626c572d24..07948175441c 100644
> > --- a/drivers/gpio/gpio-mxc.c
> > +++ b/drivers/gpio/gpio-mxc.c
> > @@ -450,8 +450,6 @@ static int mxc_gpio_probe(struct platform_device
> *pdev)
> >         port->gc.request =3D gpiochip_generic_request;
> >         port->gc.free =3D gpiochip_generic_free;
> >         port->gc.to_irq =3D mxc_gpio_to_irq;
> > -       port->gc.base =3D (pdev->id < 0) ? of_alias_get_id(np, "gpio") =
* 32 :
> > -                                            pdev->id * 32;
> >
> >         err =3D devm_gpiochip_add_data(&pdev->dev, &port->gc, port);
> >         if (err)
> > --
> > 2.34.1
> >
>=20
> This is one of the drivers for which we can't do it yet:

I would suggest to remove the alias logic inside the gpio driver. The alias=
 feature should be=20
managed outside of the gpio driver and work as a separate driver to handle =
the alias
in one place.

Thanks,
Shenwei

> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flore.=
kern
> el.org%2Flinux-
> gpio%2F20230120104647.nwki4silrtd7bt3w%40pengutronix.de%2F&data=3D05%7
> C01%7Cshenwei.wang%40nxp.com%7C9a55c18e62dd414f6f5f08db0f2ecea4%7
> C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C638120465926987476%7
> CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI
> 6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DKxOAhOJ4fm1tNNc
> RLJtx4G02alhWnswQdv%2BIfkojBYU%3D&reserved=3D0
>=20
> Bart
