Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F87D6CB7A4
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Mar 2023 09:07:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230226AbjC1HHb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Mar 2023 03:07:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230047AbjC1HHa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Mar 2023 03:07:30 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2093.outbound.protection.outlook.com [40.107.114.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B85B3591;
        Tue, 28 Mar 2023 00:07:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fSaPJ2ib+s6QOdde60uUjgXoPYjZDpKAltanWjZDCLUDaei1T/C0vcVsh0XL28hyir40+zA2wO1/5r0/dgwWoeiDc677iQkiYmbSEHG7TWE0048I+CHmlc14XbkDO9c8v8chOJQGYRQ1rWcT8sXaX92Dkm71Nhq2kleG3gBRcEpk5t6fuZjSThKbeKvBHBm+52Gb7sE0Usa/R4ccsrbv8Ux4XeixgP35lQrTYR6C6o9zXedNFsI6svAg3vKE2dyGy+Z4YOzgYPyLxhTKZkvnTqbAEm9vj5CKzbmXGJq8+ftmMUP1MJT3ALGiYncehy6cZSv71Gf+zNq6Ob1Iu1Tukw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ajFphbrgzSORuhiqS0r75YV+EcLgF3eWeMd/cA51+es=;
 b=iNcoAaGss/BaABJ6kwjYuX26OcSdxMb8LLhxIrlonuAG1OyUhG6ptTZ4lY8Hb42cBH8QjNNaCg/yckQAgufAuJy/L+1m3MF4EEbIw23OzLN2P+vGFTcfAXaQmvUq3L7sH8LEZ/UJ1i/K7zO4SMZYDgXrrM8BOcPkfj4iWNX1Q/YF4YUnKXl6X18oy65PP+Pk+ONlM/1KMhBYb+r5nC0w8n/dQb0GMqTGTnkiclYav2A85/6VB2mFfE6J6KPm+6Zlh6EbuL7Z/G1xsQ5L+VosEbKF3zrPrzd4IxBrqR2oaLYS1zrNn85mSEBa8+8kZLZPQP6LsOvhaHzo/Ki3sirn0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ajFphbrgzSORuhiqS0r75YV+EcLgF3eWeMd/cA51+es=;
 b=W9Lp79UePVwnVQLDNyn5BKApWFPiplmYLZdQGPx+5u9lNUq2yYTUw8eJtqOUtEDw1zYJ+ys1mRM32T0DQJuXrLIz9ldMry9nTTnjiOpn5AUt+NtsT4bs6HTTWicCLk3xeT8j/bFJSKkYsMYkGtIljAnlZ05+oBzvB+BRN0zvz00=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYWPR01MB11077.jpnprd01.prod.outlook.com (2603:1096:400:398::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Tue, 28 Mar
 2023 07:07:22 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::e521:994c:bb0e:9bf6]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::e521:994c:bb0e:9bf6%8]) with mapi id 15.20.6222.033; Tue, 28 Mar 2023
 07:07:20 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Greg KH <gregkh@linuxfoundation.org>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?iso-8859-1?Q?Uwe_Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v6 03/13] pinctrl: Add sysfs support
Thread-Topic: [PATCH v6 03/13] pinctrl: Add sysfs support
Thread-Index: AQHZUAod67d4ssuUm0SKoF179JRYhq7vVOYAgAAGQACAABQOgIAgd2rw
Date:   Tue, 28 Mar 2023 07:07:20 +0000
Message-ID: <OS0PR01MB5922E1A368373F97C42F549286889@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230306090014.128732-1-biju.das.jz@bp.renesas.com>
 <20230306090014.128732-4-biju.das.jz@bp.renesas.com>
 <CACRpkdb-gyn29ns3tGXXnrGgySNP7R90h0M7fan=zeNMU7-QKg@mail.gmail.com>
 <OS0PR01MB5922171F49133EB3793BCDBF86B79@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <ZAdVDaxoSuwd57hP@kroah.com>
In-Reply-To: <ZAdVDaxoSuwd57hP@kroah.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYWPR01MB11077:EE_
x-ms-office365-filtering-correlation-id: fd15d4dd-c4c5-4fda-a076-08db2f5b12e7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: h9XDV3bmM5FVWy4rpVKIdN/d0+GuXXcMh4A8tGgjPtqS8SjcXF75GvevGIZzNkcyB9WT4P947TpYgLPZ/SVQjNTbqMkY7nn6m3R5yuFG0Yzlqm4y+HYlanTrhmZCJOSC3UxEeXvfSaqQGR8WDZmEFTtE/651dQBiD+sc30e4ksHcrQqn2yubkReygDs9ibXnACAONuki3+kXGK528An927V5gk1JOAoA+apFtX+5cEpwoKP9j8Q55hDxdji9jB1ACIAeATzuv0wnXVnC0WsLx+YoTDEfNDwqFEjDYZR1MOgRxeXG3y4PKUlA7DPRWrnOXuSuSl4blDnP2arwGcjFmvGcrdIjiuKNyeVcTB18+8ECcxiIRPqxpiaMPdX7tL4l9o/MybgW1Xe4GDlW/58ZApZnHNsSGqGCPvlpbzWmvn6pl7hZT7SdlOZuNgDARipauYsl6ajL7jSqKFw2dst5MbR/b7xp2ge84P5vw4PxNU6f8BG5yxarQOHHAUr/MBwMOWdlAryJ87LsJK1ARJW0SkWTXkwtxaeS298WORVGIes/7qRypyGXeA/2eJpD6iAatXtFHkcJyqJyApcpfE3Ldy2qeA+qfnJFmbtzs9kiVL/mgwMzB62gs4MhUq7thMbj
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(366004)(376002)(136003)(39860400002)(451199021)(53546011)(6506007)(9686003)(26005)(76116006)(83380400001)(186003)(71200400001)(4326008)(7696005)(316002)(54906003)(41300700001)(64756008)(66446008)(66476007)(66556008)(66946007)(6916009)(8676002)(8936002)(38070700005)(52536014)(5660300002)(122000001)(38100700002)(2906002)(66899021)(33656002)(86362001)(478600001)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?7Izc2837dJRAms1VmyarXmimQ5WlMISEGFpwtiU0D++hMOdFb+3MpG4+CA?=
 =?iso-8859-1?Q?4VfK2i1guW0DeQnueS/7CCx8tcjbPJx/wyxnYj1sOnuPiQMXbQ+cewwtUS?=
 =?iso-8859-1?Q?bbSmKdVwgqQkrIxm5sFA4vH+hhSSgyDNvwArLWa18/yGOze4APeyYFIL8f?=
 =?iso-8859-1?Q?OA7+RJ5n9eP3wHC7nH3jbV4BzTriCC2zZQ9c4G81vLrcXpQFhoBlO4AFvf?=
 =?iso-8859-1?Q?aSov2awCzoXW5uxywI6xFk9rqMJmclKR3v3x6gD0gqQJ6euAQGBZPDr6x5?=
 =?iso-8859-1?Q?U1+GcAWhFUHzi3zg55fyAKW8X8nV3h0Ektn5khS0sPcaLll5Wv/7vLyIMJ?=
 =?iso-8859-1?Q?1Nn+06xJ7WiRTADlD1pz9A/sKck96jtKtHiB6igdTwvObxMguqbk+mRE7M?=
 =?iso-8859-1?Q?elpc3fKiQWvQVaoJwdXC0eio1ioQ/IC8e8n1knqjjqIijI0sIzPFH3Yt7Y?=
 =?iso-8859-1?Q?tbm012YW/DgUOV9AFkQ9pRFNUlCIZcDhlihAFK93qXu/JNsk1mhcQGgi5m?=
 =?iso-8859-1?Q?TSzSvGhsl2v/q7Aow62ZSDJvsz+q0ENGpIbLUk0yBu7W6AwC/Bw9r09++n?=
 =?iso-8859-1?Q?oN3d+VD6XDFSNJYXKIiLwnl2pSSr07mKtsfGlddTrEo/9yQDzdeK+yaJxK?=
 =?iso-8859-1?Q?RZwrGMd7HinEyPiFWYytowSFn9H9fgTCwoelnn8u02K2w1Wu6ykuIArQit?=
 =?iso-8859-1?Q?Z9A6hNdF+LMtxX16TKndH14PtXBJ1NnFxlNf/PsxpVvjso3hV2tjjyLLJY?=
 =?iso-8859-1?Q?mw4kNiB+z5WIzkgRHDS6DRmurIHnFbiqcMHiBYCuRpHc9flzFXk+h4QeMV?=
 =?iso-8859-1?Q?Sk/lHwi04Fqa9F9poCMxKPPivavGsUUYAwtoe270pYezJyq1uiJsWkkpAa?=
 =?iso-8859-1?Q?0jRwSFFcXGPxRcyfESQViniYuwGP6dBFdtNqogMDWWWY/JYiKtA2AMxQ5+?=
 =?iso-8859-1?Q?En8ZA4P2dz33wXQcR1iPXSzLFTmODyKpK9A/Pk4joNxN2Yntgnynonheg0?=
 =?iso-8859-1?Q?J0eWU9+crQ4e14piiEg2h49YcIIg22k2m2pvwrv4lHBNAW04mlKNcrYdRO?=
 =?iso-8859-1?Q?4qEZnca+0F6jAHfbrTvcSmEMmB/wOee5KsPBA9NOGC3GOdZSzcnV68p3mF?=
 =?iso-8859-1?Q?cDUzLDhi95ByNTwTuAMYte4WnEg/byIrJ/onhyZPniLyI0CxND07pwjqvt?=
 =?iso-8859-1?Q?nnnIchiOj2kowNoXt/BNQ3avSTjBFOqTWj0EVN42wfhmFbc3wEiaYw/Vsr?=
 =?iso-8859-1?Q?/gzMm1BYLyIYeHoLJ2nOm86zZILJzwEAx4Rl2m23LLUvc7LUmVh9JxyaGu?=
 =?iso-8859-1?Q?bwIgP+dYB1dq4uTaIflbYFIbqs+QhltuNqimNXZGQTypgo2TZ8LlSINEpD?=
 =?iso-8859-1?Q?KWZXRKKBgX/3X6CGYJUSO5Qyf6MEjKD/iOFmBYiU9d8pZV7SEJ2omJjZvX?=
 =?iso-8859-1?Q?CIyOdcoUTrfyxk1o8tlbUy419q2VttLi1Xtmu6294kXJ7XKVzveMULyXqq?=
 =?iso-8859-1?Q?Sk4Gn10Argeo7ANdoRas745JWoLGHpYlLJL0dspokTqHPiueRmsJ7eBh4B?=
 =?iso-8859-1?Q?xFvg+KYc2k9QNqcAXC52aQwNubVblYSYF1TyRaaj45IR30smrCHA8/1pgJ?=
 =?iso-8859-1?Q?O0RVJ8f94ykhaNvSTs32P3Kf5oBcl1PqJn?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd15d4dd-c4c5-4fda-a076-08db2f5b12e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2023 07:07:20.8294
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Vga//UeTCghqeYV/kLbj1PQfIcA+XDijHy0ZetlN8aF87dPmw4em3NfB7tKwbIooogITGyPbn9CVyd8v32OI3xbFvp1ueNXL0cD90ujXs4Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11077
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Greg,

> Subject: Re: [PATCH v6 03/13] pinctrl: Add sysfs support
>=20
> On Tue, Mar 07, 2023 at 02:43:54PM +0000, Biju Das wrote:
> > Hi Linus Walleij,
> >
> > Thanks for the feedback.
> >
> > > Subject: Re: [PATCH v6 03/13] pinctrl: Add sysfs support
> > >
> > > On Mon, Mar 6, 2023 at 10:00 AM Biju Das <biju.das.jz@bp.renesas.com>
> wrote:
> > >
> > > > Add a simple sysfs interface to the generic pinctrl framework for
> > > > configuring pins for output disable operation.
> > > >
> > > > /sys/class/pinctrl/
> > > >   `-- output-disable/
> > > >       |-- configure    (w/o) ask the kernel to configure a pin grou=
p
> > > >                              for output disable operation.
> > > >
> > > >   echo "<group-name function-name 0 1>" > configure
> > > >
> > > > The existing "pinmux-functions" debugfs file lists the pin
> > > > functions registered for the pin controller. For example:
> > > >
> > > >   function 0: usb0, groups =3D [ usb0 ]
> > > >   function 1: usb1, groups =3D [ usb1 ]
> > > >   function 2: gpt4-pins, groups =3D [ gpt4-pins ]
> > > >   function 3: scif0, groups =3D [ scif0 ]
> > > >   function 4: scif2, groups =3D [ scif2 ]
> > > >   function 5: spi1, groups =3D [ spi1 ]
> > > >
> > > > To configure gpt4-pins for output disable activation by user:
> > > >
> > > >   echo "gpt4-pins gpt4-pins 0 1" > configure
> > > >
> > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > >
> > >
> > > You have to run things like this by Greg K-H (adde on To)
> > >
> > > > +static struct class pinctrl_class =3D {
> > > > +       .name =3D "pinctrl",
> > > > +       .owner =3D THIS_MODULE,
> > > > +       .dev_groups =3D pinctrl_groups, };
> > >
> > > Why are you adding a new device class?
> > >
> > > IIRC Greg don't like them, we should probably just deal with the
> > > devices directly on the bus where they are, which also implies some
> > > topology search etc which is a feature.
> >
> > I am ok for both,
> >
> > I thought adding new device class will be more generic and people can
> > use simple sysfs[1] like pwm for output disable operation rather than
> > the SoC specific operation[2].
> >
> > [1]
> > /sys/class/pinctrl/output-disable/configure
>=20
> That's fine, but you don't need a class for it, use configfs for configur=
ing
> things like this, that is what it is there for.

As per discussion with Linus W and Geert, it is agreed to use configure thi=
s
settings in device tree as DT is the best place for system config like thes=
e use
cases.

Cheers,
Biju

