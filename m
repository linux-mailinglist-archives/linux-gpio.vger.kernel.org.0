Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F33F56AD9A3
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Mar 2023 09:54:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229580AbjCGIyw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Mar 2023 03:54:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230144AbjCGIyv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Mar 2023 03:54:51 -0500
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2134.outbound.protection.outlook.com [40.107.114.134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D36B51C90;
        Tue,  7 Mar 2023 00:54:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EDLNq2GlCNn9Wgr0GA34ffP8jsRd/GvUl+6iSiVrKxqHb3mP76sNF5n9Z3qoGECtXhn+goDmeVTPgad309WtUC+3qA3TTDfNcNKO2jSYSfFjMkLYaobyED7Re+xHOC3zJsRlOQnqQcwQ2Z1I0N5jrE2TJuxmhGqnx9Ar6ZWNLodZU9Rvzx4vs7uFg7Fp2G/T4nSI/PVws+JV050NT4Sh+0L2Hdl36ykZeMKiTNCXFrvvY9A/S5gTFdxttDFrmEjfDChsBcl1+2Q0i9N90AucaS5zRQLF7Z7iXiNNOX90GzIY7Us0Ywg1MwDg75qtITssgwW/KGJoCcgN5ZzYa1OFOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oyEf5ZqrDoVCyrosT+kgtr6VVpp0pnUAk+FK2F8ct8M=;
 b=Rgs+8oKXifE6L1I3XXhzW9AFC8SSgvZVv+UOERk01v/HQFAm5Cm8KUVoNukNJvMNUPwg+4Oda43qqsu+JikEcOdKxOJYKhcaX561Vk/vl9YafMyrLB5vmkTxcel5viopzQOSb5ciXNwgBTN73jlEz9rCwZBWSze+PgKOWCMxEf4/c75AkGDxH7k4IZucayeRdeP5gDIhUDuv49IJ8biWJxqP21+Li5XRnGSFYtaPvEj0Z/9n9BKuh+HS+7DKDnEQybNQzrJMft2nbJGXCFNsgtaW7NgKYoYoG3F+jNW4gxxXR2oGEXqwzQLlYpg21VtpA+IEVgevBu4bzR0pw/L9gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oyEf5ZqrDoVCyrosT+kgtr6VVpp0pnUAk+FK2F8ct8M=;
 b=KinFvgiR1pIsocuDjE/L7Dk1rtrbetIXGoURzeJ7O2AymV9k4EmwR46PutjByjYslOMMNN+s3+2wIVYCGv84fne5nUPGwaWtSlbygaCfe5hvqkhDiUyJ3Phw9iflGi71mlSHoK57+KL2TUczEcPBCKDSwJkaJRv+THxKySzisS8=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB10215.jpnprd01.prod.outlook.com (2603:1096:400:1ef::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Tue, 7 Mar
 2023 08:54:43 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::f54c:4b2:9c7d:f207]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::f54c:4b2:9c7d:f207%7]) with mapi id 15.20.6156.029; Tue, 7 Mar 2023
 08:54:43 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>
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
Thread-Index: AQHZUAod67d4ssuUm0SKoF179JRYhq7uaW6AgACbOEA=
Date:   Tue, 7 Mar 2023 08:54:43 +0000
Message-ID: <OS0PR01MB592234F8B0B0F30FFD6E550986B79@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230306090014.128732-1-biju.das.jz@bp.renesas.com>
 <20230306090014.128732-4-biju.das.jz@bp.renesas.com>
 <ZAZ5df3IyJdSe6Rg@surfacebook>
In-Reply-To: <ZAZ5df3IyJdSe6Rg@surfacebook>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYCPR01MB10215:EE_
x-ms-office365-filtering-correlation-id: 361fb860-8778-415f-72d1-08db1ee99873
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: i3V/ftvmdP4CHGF7hYp2a9buTd6fEoJQ76H57bGC+Lpi3NBNudgyN3wN7cVzfhbPj5JiQ2YgtG9mCfmiH1+UCgV0gZz5ecvIfbYS2M6MQhqGND8iUZjYFpdBiDRxu5sVsVDfTPCBt63JMXXYOZ5+ZgsVuDuZ5xE1/7QCMa3bxW9F2BFjSPCJLzveXrBIc74PXnN+Alrf/vw9Sl7PS/rnQ9WBIXrHL3hQt9THVLNcodwRi4lhySpXAZ9upFIMgTgkZ9SD/UdL7AdKy2srWeZKeJ5vp/opJFbzpG9N0SM9kmKl8Fma6e5gREyIqKFA/Herqab7hXCMWK+CXfLLAr9wtLNeM1OE7RRMGjUkOL2e2rPSkv7kYS9iN1mSQKFlvKbiOpPGhQwSyHo8zi14RoBPWgclk72CuX2RUSlZI7deYUeop9ndit9MvqCIn4PyWum/FLN7o95a7hhgwkgvqFZ5kZRy+CBfEYyYXP7C1PvXmdFWu7NDnvKx1TqoE+KIZHCWiSt9FOKuRM4/SDXBjZ78+/vPfw+2gScQL4aSR0Q8Ipl03DXZG/6y9Z+ScRbgSjL38lwZQweVZpVLzJLKvxIkRmxqa/iomK+TyTHgiBh+MKMCEkw8lx1FTmvO3x8AQj29vu6+S7HIfjwwpSYBqQ1GlYrait0KLaPVrSIsByhenw+N0k4PUsW8x8NynuuijgQnNV/8lo0U4Ri88xW0RFtqRQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(136003)(376002)(346002)(39860400002)(396003)(451199018)(86362001)(122000001)(38100700002)(7696005)(33656002)(38070700005)(4326008)(2906002)(5660300002)(66556008)(8936002)(76116006)(66946007)(64756008)(6916009)(66476007)(66446008)(8676002)(41300700001)(52536014)(9686003)(186003)(83380400001)(478600001)(316002)(54906003)(6506007)(26005)(55016003)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?KPwOVRLvnGVk7DxmvNc+VgImVr3Ho1I7RqVstr6DIlKvSYhOAPGsTo/mHY?=
 =?iso-8859-1?Q?9vUtZwchFHqBhMgIun2BWaEx/agNXJa4v8zIBVywWDlYngze0hYDV4HjYD?=
 =?iso-8859-1?Q?JtRd+CCAtpGWRp573XgOMjvbrt2rtXvyVVUqTpfeLJVEZNKEofGiyrme2p?=
 =?iso-8859-1?Q?Fk9htYed9nzryQmX7UiMtSwoGFnEBXymEQ0T1z0THistbgdlMaJ1GiXEvS?=
 =?iso-8859-1?Q?QnNqnOYpiBYFlnkbmmGyfmETYHXuV1+4ejap2Xd3VPoV87gfKNSoNe4F4J?=
 =?iso-8859-1?Q?acJj9db1LnILMwHucjU6w089/sMJoYYIgHs6NG90wwbJEqcsP8jqr3PdfG?=
 =?iso-8859-1?Q?FvkEzvaRdArrU1O9puWqA/oRnhqqt5eWINs9V5ecxfVb1YwAS4EEQy0Nmp?=
 =?iso-8859-1?Q?pTOcihGfVraxOdb4luJaXsSM6yGmf0gkQGhx19guwa5Rpum6rPY8njcK06?=
 =?iso-8859-1?Q?7jVkd9CThqxTsR66CtolLSw5hECkKIdaVabyOm0ma6lp7o/lGnexFNzfnh?=
 =?iso-8859-1?Q?SsuKWa4BwFZoFyZrORSoFmRAs47gqcbzrnwrsIemgiP8rp/pnXC4780oYT?=
 =?iso-8859-1?Q?zx6qYI3QuUnxN3v6nts7gFWukHcqvgrTTXjpnsaNhCisr+pMSfmlHr8vtX?=
 =?iso-8859-1?Q?sM3KoT+UDxezJOrzdUeyX19MU2F2IZGUMRAosOicM8k7/w8aEvOgQ1w8ii?=
 =?iso-8859-1?Q?nIGBZdEqo5BGD5G2wGoM/rTcvJAM6Qqibc6xV8BPv/nC8CSmOHNnaekjwY?=
 =?iso-8859-1?Q?Ld6ZI2kxFkNe16MHC1HqkJK+Dm3ZqnLaLswMzRApSHBZKCgMzKT5sS0IU8?=
 =?iso-8859-1?Q?0q9c64Lc7GRvggnyt54yJVpF79bAxrK4TrZLgnTZ8UT4qMmdTiESxCZqPq?=
 =?iso-8859-1?Q?NFL1ECpp+Qm2jwelpBioViOHUWk25a7PwSXiKVREfDI136tVlhaqJ2zR1Y?=
 =?iso-8859-1?Q?/hcT12mdY2mKdo/Fy8OHT+R5ZsgdsWV0j5pVW7N6hxG5FZvl8HG47cHeJI?=
 =?iso-8859-1?Q?AFgNgDntfJBn1cdXB72NfAQSmJQytvOZaKH0jI/K7/TpjkfLSoJOJEFXdp?=
 =?iso-8859-1?Q?BS65O+phTI6g5EMqGz7qTswuVEpMBEaCr8+sMbLMFby0pTBp0pLEbrMTXa?=
 =?iso-8859-1?Q?WVdXjRqEgHJVZhn6qwsFXPqJWEyD9Jm5z3fdjxwj99jsfrO+vrWSbx9Rke?=
 =?iso-8859-1?Q?AVi2gBFZ59rP4vW9tSG8daOU9FTkt/hksN8ED9awiUzosJgA4DAQJCg6HZ?=
 =?iso-8859-1?Q?Xpvt6gEJK0qtz6d+98qDWuBVP8fKoYY1vfU/gqLkTjNKC1ZWohhb7t6c+C?=
 =?iso-8859-1?Q?Q/3mgebfhEjA/aVIfsRiT+YKvNcs/4fhiKNwKGt09keybtRrl7j8Q5mZIk?=
 =?iso-8859-1?Q?Psk4HKbipCpbUxkSinRDx5S9zjd/s/VnPv+4RTT7Gry3vq0/E9ncRSU5H/?=
 =?iso-8859-1?Q?r6g2Dhao9AHBiHkKYw7MlL34bKS2DK4SHYv3d0IYm6HbuSVS6NUjdeSMwb?=
 =?iso-8859-1?Q?SMNfohk5gwaOUF6H3d5XmbzK1gZ8yzFj9IGJuY8XuQ3usuv94+Ar98dB9t?=
 =?iso-8859-1?Q?y5AzSLXB0JZze8rH4Vy1at4yx4+C7fhfdDNJhnG9tSOvSSHHNfRup8L+na?=
 =?iso-8859-1?Q?RRYRgZTdi+ig0VqQoV+Kw5lMXzP3H8lh6U?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 361fb860-8778-415f-72d1-08db1ee99873
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2023 08:54:43.6348
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W1mkHnlEUnLYqINxsbHs5DJ3t8lTgDqndpPK0eo2ydsLpQiwDbNipCNcr3PRi9G3u9ynRsik89cbs3OJpxo2jgNiFmBKv45rrnjccUDW0xk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10215
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Andy Shevchenko,

Thanks for the feedback.

> Subject: Re: [PATCH v6 03/13] pinctrl: Add sysfs support
>=20
> Mon, Mar 06, 2023 at 09:00:04AM +0000, Biju Das kirjoitti:
> > Add a simple sysfs interface to the generic pinctrl framework for
> > configuring pins for output disable operation.
> >
> > /sys/class/pinctrl/
> >   `-- output-disable/
> >       |-- configure    (w/o) ask the kernel to configure a pin group
> >                              for output disable operation.
> >
> >   echo "<group-name function-name 0 1>" > configure
> >
> > The existing "pinmux-functions" debugfs file lists the pin functions
> > registered for the pin controller. For example:
> >
> >   function 0: usb0, groups =3D [ usb0 ]
> >   function 1: usb1, groups =3D [ usb1 ]
> >   function 2: gpt4-pins, groups =3D [ gpt4-pins ]
> >   function 3: scif0, groups =3D [ scif0 ]
> >   function 4: scif2, groups =3D [ scif2 ]
> >   function 5: spi1, groups =3D [ spi1 ]
> >
> > To configure gpt4-pins for output disable activation by user:
> >
> >   echo "gpt4-pins gpt4-pins 0 1" > configure
>=20
> ...
>=20
> > +static struct attribute *pinctrl_attrs[] =3D {
> > +	&dev_attr_configure.attr,
> > +	NULL,
>=20
> No comma for a terminator entry.

Agreed.

Cheers,
Biju
