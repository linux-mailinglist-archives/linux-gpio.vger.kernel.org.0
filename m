Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B303575F3B
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Jul 2022 12:18:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231564AbiGOKR6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 15 Jul 2022 06:17:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230258AbiGOKR5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 15 Jul 2022 06:17:57 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2128.outbound.protection.outlook.com [40.107.113.128])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EE7D823B2;
        Fri, 15 Jul 2022 03:17:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=acJ7Kg9paI1m+ZhicQLMjT5KM21spfAeq+rr1UZapXNc4NO2mFaiT55l0erTQDJiZTK9ic0aOCOmk/9DHfi7LhvSS+P4IGJ9rVXAqWxLRpHbMMtEUxx6m9cmHk+Zo90tnPuG5+8MH8dnDvPPvc6kdXwTMh80ShIBCwZz10Pe23wz8SZ2Nvk8GOuMrlVZjSotck5tfaZanTDACbdLpai7u35+ACH414TVTFURbaXTdTP598yQouSQD/2LBLqOPUa1iAZi2/mIsvug9vcm1B9iCEtTNMmv7NG5KeQn70p8z4E01ijq7x+eMlog3niAFLOz8GpjsyiJhivPbnxd/XGWRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f61EvI+pBjHc8ZQpBzhEUxBUbj51rzKVznqgxoooHno=;
 b=PvsSFcpmzZW59MrGfK75Xij+nYWZLXKy3KgnQP3FRw22H+79B65xmr0vC+xXaZpVpGoSb8hAPWY7CkabrTbEHl1iIE5cF9B8kFYiKYueydmGxVMIEYVJ/gUFesNzu+ODa+YLnpAeI6dVHTLJsyNvzouORZD0p8Jdy3L6zeOuPbQAfrmKHNK6wHglOCeviV+gjmORta3VIsjKv/Auw9xLko0mI7tD5kdkGrAU80vI4iAGZPE684D1ps1xmyha4S2mvNOPv7MLvc+YKg1TDa9XWXrY7hWVAA0bSW7GjYox03RHDQ5b2xCmEorw6+U1RCntWrxYuze3ixllk+n5AeBDaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f61EvI+pBjHc8ZQpBzhEUxBUbj51rzKVznqgxoooHno=;
 b=mEz60wcRysjaxucSrluPv6c+f1OmoN2MZnn0flSMVMoQeU6n83ID4mRoJTNEAbfpBBPzF7zr7xGtKJ1NtNQQpn2LDaPYiNLvuzr/JMKr//+RyjZp7pvc6UQH/EyXHL6FqxVsSXfI5ys9Ev9wGdNpSz5Urz5D6iZyibW5r4Rd5mo=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYWPR01MB9608.jpnprd01.prod.outlook.com (2603:1096:400:19b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.25; Fri, 15 Jul
 2022 10:17:49 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b046:d8a3:ac9c:75b5]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b046:d8a3:ac9c:75b5%4]) with mapi id 15.20.5438.014; Fri, 15 Jul 2022
 10:17:49 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC:     Geert Uytterhoeven <geert+renesas@glider.be>,
        =?iso-8859-1?Q?Uwe_Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 1/2] dt-bindings: pinctrl: renesas: Add RZ/G2L POEG
 binding
Thread-Topic: [PATCH 1/2] dt-bindings: pinctrl: renesas: Add RZ/G2L POEG
 binding
Thread-Index: AQHYlsA8CcHBPp2Q3UiHwTGN6xabGq1/NVwAgAABOoA=
Date:   Fri, 15 Jul 2022 10:17:49 +0000
Message-ID: <OS0PR01MB5922CE20E15959AEF89C36D4868B9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220713135528.1386594-1-biju.das.jz@bp.renesas.com>
 <20220713135528.1386594-2-biju.das.jz@bp.renesas.com>
 <24903621-358d-d380-76f4-6515c6313bbd@linaro.org>
In-Reply-To: <24903621-358d-d380-76f4-6515c6313bbd@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4c33d6a0-d7ba-4cae-2b06-08da664b4556
x-ms-traffictypediagnostic: TYWPR01MB9608:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gZcIAtXhJdw/x/H6Tp3dGE9B+biYrbjLE0J19CuLrYXhHV6eJwSgCPBgDM+ZeRrmjjILYfYfOe4cA23LFiZAaSmgssC7hRVbSQz49rEv+Q0hayNxHufULqPxQ2vfZV/V8SK6iu/z78G7HKO3uRHwPhziO+KlgCt3OlloGbvYfSHBlY4Y3W2L8Uu6oiknK8uA8mNXlucb5LJR/8lqJO2/CANdliGucjnUU9hWviyQXs4V769fYFt9iMW3PXlo4y/wpIZIUS8RHuWcNfPPx0bg+cwlMHz6EpMZvmGZ8lFiomaSsOggZq6oM9rw4gn1yqNRqrtCMb3ISxtRcDaGhLAmL2aASESf+MzapyorCgbkVnlXchA51QdlLD5swHkeNxHmZSLcej/D4p83+VBw0c5LYqyzyuXhyGyPAG+1rQwtvoSXd9GsCQVWc6se5bdwRIQuJsPK/RAW+vZygqxucWNsfKG7m0iL848Vc6LWl+v1E+lEQrpZwtvygAuHFdjFk+Tw4mLaDfIQWE5YCBGaw+vKVVxQH2fUgt4DjxODkXbXVV8sODr1xV3jHNPPiEh0yT0W+aVPqSbK3iUfA/GEDDVaCH4fasaZYhAaz9kbAQqvtmj8mAmsIRrnSzaALdm8e7Y6gaj9i3GPqshFRcblmxVy5mn0thKJXg4eCGoqFvx8Qjhyd70D5UQmEl8d1k+26SH8UCFzHm73TiA6xbXiN2kh8/wiMu+JWCZu9E7AbAMMFyU9DQLyC94V8kg5ZQyoKFp2S3p0sFOOsqZLZTu7RtmFjITYnHQFQTqQjWlB163n7zmXFhSDzaGrA6iwELvbXQWc4dyGioa43Z5qBUtshCWCAw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(136003)(366004)(39860400002)(396003)(4326008)(186003)(66946007)(38070700005)(66556008)(83380400001)(107886003)(2906002)(8936002)(52536014)(5660300002)(76116006)(33656002)(8676002)(66446008)(64756008)(66476007)(9686003)(55016003)(110136005)(71200400001)(966005)(316002)(6506007)(7696005)(53546011)(54906003)(26005)(122000001)(38100700002)(478600001)(41300700001)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?Nwo4HvpecO3Ax4KcSxQvsPMjdAAzL219kiTq8qGzQQDFKb8/gkRuvA0doi?=
 =?iso-8859-1?Q?hAFLA9EiaOvUQx8zjFA4RM9SpLU/vsX/uR7Z8erkRS8hF6h8aVrhc7Xhwt?=
 =?iso-8859-1?Q?oy93f7X6qiheay+xTasL1HE6BHvg4NujEVrZS7KwXyJVoPTOGNIgXCTETT?=
 =?iso-8859-1?Q?Wf1VgZuVNyE7GyxrzuB/apqJn1tfwHLQk++qdVEEPUuJW38Yx3oarLkEb+?=
 =?iso-8859-1?Q?WJxTEDkUG5MLxFB82uqwetR1ZIEJ3IMUW0oUzLRJYhTZnQiw/9P7CKoWc+?=
 =?iso-8859-1?Q?WXUozuKIBbdWQhqghpqw8RMtzNNpdKAGCFBlbV5Conx728/l30qQIf8hur?=
 =?iso-8859-1?Q?ggdSH86s+5ZaOl3a8ZJADJPZAM6+T2HZkNRuIuluxTp9ym11vaPBuCXCbK?=
 =?iso-8859-1?Q?0cn3BMLFED0Bxo793HUcwQ3CMA/e64spxZEWWi2MNiT7BkqfOvvFtYUwio?=
 =?iso-8859-1?Q?XMUTdmVQrR3QKrA63QmZfj1WoO88wNDuwTjz94J9IATeVxd9QO5xUqCeeK?=
 =?iso-8859-1?Q?QuyNp1ZIbl4dLhqTY3riMb3zWPm02/8WsLDME04Nw6YnKfjj/inLHx9fR6?=
 =?iso-8859-1?Q?xoMDGNEVEZ7M+dr2NmyBdgJe6ROv47eacKdmCvaH6awnjXJKL98On3b9nl?=
 =?iso-8859-1?Q?aPGjdIue7vZeMG8gr5s0BHuV/zi8R+AoCczCh2vBz3pOK2R+Wgq6s7RY4n?=
 =?iso-8859-1?Q?84Qc5qlxEzzOJs0Lt6qypzpip6GUPZUzU0w7J7himIoudDjv4IeJXkN7y7?=
 =?iso-8859-1?Q?M/bOKyTA+VT8v2Zxj/11N7aPEYJGAyEKDzVcIXZzPxPv3F9F6SKmFFHQ/D?=
 =?iso-8859-1?Q?igjPbwIkIB/4m7/klLKNV2JV+57+ykXpMnrere9z6HJCs3DEwQYBEAoCaP?=
 =?iso-8859-1?Q?/eefSgP6SDGCYdwHbJ3Zkqgu3O5yABd6RQWvdTL5FFPN9fixzTsdlnvXxZ?=
 =?iso-8859-1?Q?nTt5BcZrdBqbsXClOhwrP9hNi2hFHAsRI4ows3yfSrpSAx+9cWfcGy2DI9?=
 =?iso-8859-1?Q?9vywF0viPkulp4Mw1BwkSJ2Eb/PE/x3NPb+CuI9p4kk0rZwlWBKwVyVxkG?=
 =?iso-8859-1?Q?+eQk/J2DSK6kD5Gn3dbmMG+eMgMIbDlLMP42+1VzwO+2qYXLMCTzs2Yo/Q?=
 =?iso-8859-1?Q?JkmJh73EJYtchkmLPyNx+y36ZZ2fuY9jtpfDQKh4Eb3PuVTgk1ybGKWdAb?=
 =?iso-8859-1?Q?9klXZyMBhz6gVQPbm1FZcyOYBzgqspLPrIMPXjgc2R5gZT/XpniXDWkB49?=
 =?iso-8859-1?Q?R4bQ8tqRiiJwBnxZrqi9gQNDuhzGN5RoHbspbbdBhdwFCBLKRUJATE8S5g?=
 =?iso-8859-1?Q?zQY4iDI6kLfCIs6Tzke5CQTOXFyG2bOezj6qhaAUjBBPG9u2LkllebK66y?=
 =?iso-8859-1?Q?hM+42kNbIZH/AeNYVTig6op0LGe+Q35PppV4ag2zUqucuELEnY08k7Zmei?=
 =?iso-8859-1?Q?Gn5XL1Iok8HKxjY6ysXLNT6x83unpe6oVOJbyYapxioDdIfgbXH06cEPqU?=
 =?iso-8859-1?Q?TRJIAOaKddvfxY+RTlV5WGiLvqSYENf7DOOebTDO2PBA1LPa7wjpF3sPC2?=
 =?iso-8859-1?Q?dLRbRdRRzbSAyX58RsGRAMDXeeuLt3YYB2/Ow1FuMQPkjVxWiHiruR7vUF?=
 =?iso-8859-1?Q?pNmmKAEr9o/sKJwrlOJvbix6D8Cvw4bQyRY1ji64E3sSG7JBzXVF6olw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c33d6a0-d7ba-4cae-2b06-08da664b4556
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2022 10:17:49.7577
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A52itvE5PG3P0cHtOrtpUrYmBQzqeVcV1zoaixU7OlqweqWNimhOELfH6V09iTh5k8pgvZFmWR4ruLgK/BFQe705b4aaGgf0lgkYbcv3NUo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9608
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Krzysztof Kozlowski,

Thanks for the feedback.

> Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: renesas: Add RZ/G2L POEG
> binding
>=20
> On 13/07/2022 15:55, Biju Das wrote:
> > Add device tree bindings for the RZ/G2L Port Output Enable for GPT
> (POEG).
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> > REF->v1:
> >  * Modelled as pincontrol as most of its configuration is intended to
> be
> >    static.
> >  * Updated reg size in example.
> > ---
> >  .../bindings/pinctrl/renesas,rzg2l-poeg.yaml  | 65
> > +++++++++++++++++++
> >  1 file changed, 65 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-poeg.yaml
> >
> > diff --git
> > a/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-poeg.yaml
> > b/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-poeg.yaml
> > new file mode 100644
> > index 000000000000..7607dd87fa68
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-poeg.yam
> > +++ l
> > @@ -0,0 +1,65 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
> > +---
> > +$id:
> > +
> > +title: Renesas RZ/G2L Port Output Enable for GPT (POEG)
> > +
> > +maintainers:
> > +  - Biju Das <biju.das.jz@bp.renesas.com>
> > +
> > +description: |
> > +  The output pins of the general PWM timer (GPT) can be disabled by
> > +using
> > +  the port output enabling function for the GPT (POEG). Specifically,
> > +  either of the following ways can be used.
> > +  * Input level detection of the GTETRGA to GTETRGD pins.
> > +  * Output-disable request from the GPT.
>=20
> Shouldn't this all be part of GPT? Is this a real separate device in the
> SoC?

No, It is separate IP block, having its own register block, interrupts and =
resets.

Please see RFC discussion here[1]

[1] https://lore.kernel.org/linux-renesas-soc/20220517210407.GA1635524-robh=
@kernel.org/

>=20
> > +  * Register settings.
>=20
> This is confusing... so you can use POEG to mess up registers of GPT
> independently, so GPT does not know it?

POEG does not mess up registers of GPT. It is basically for protection.

Using POEG register, it is possible to disable GPT output without the knowl=
edge of GPT, after configuring the Output disable source select in the GTIN=
TAD (General PWM Timer Interrupt Output Setting Register) register present =
in GPT.

Cheers,
Biju

>=20
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - renesas,r9a07g044-poeg  # RZ/G2{L,LC}
> > +          - renesas,r9a07g054-poeg  # RZ/V2L
> > +      - const: renesas,rzg2l-poeg
> > +
>=20
> Best regards,
> Krzysztof
