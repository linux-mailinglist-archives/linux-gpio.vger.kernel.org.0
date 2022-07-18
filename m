Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07A8157835D
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Jul 2022 15:13:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235436AbiGRNNw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Jul 2022 09:13:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235055AbiGRNNs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Jul 2022 09:13:48 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2097.outbound.protection.outlook.com [40.107.114.97])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAD6227155;
        Mon, 18 Jul 2022 06:13:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hCgEMKw2uAkeUftTp+VpJ6XPWvSGYA7fD78b212E9+q2CkVLiThvVkp++fDdvHeR5MlYJ1p/q1Hu3WD9qjjydmAJQL0T0Ic7qax2f7vOZ1LLaKoImG8Te+GIrLVq//hOAFzrpx17kXJkk/e/UswHqthFDt3ZyzlLSdUJ19Xo5BDp5Qr8TCw9ejdzrVxvZ2uIqjKbfZ4l99tIaT/0jUr45RMI88sVR5/GWsl3ynGnlC+o3/FvVZ60TYfxripZB3pU3KgicoQVPt+vJR1w+z0hhfzMjKFSnKfckkiREDZGXWW1wuNn2IbDniBeYJuxMq734gfW4lpeIKOGnSv/LtLR8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C2/i3WE9GOU5UANb1MPVyZ6KlsRnGagIPEmiCvZDguM=;
 b=a5dA08gpE6xyT5ewN1LAczdqTXs0co7XSJEiBqT51hboMmFSbZUVPRv9elQpcTCzr372y6j7GOUlJz9pmiMQV8HSuOfzCoFgX7mZZHkMcP+5ockRi8qGQdEIMlLCFUPf/05J5+tnkBO6cvwDMqGOvtcQDq8Uoq5UZ+iEK/eiWmHZUWCndVr1LnAa7h5zjEuCfj7gAqGTcuzcFcJ4T6qibfi4LCagFlZPkG8fbCXK+hH3X0uPQLzhYnINwxKzd6sMJX4CB8QXth/nqNgPL0JDvTxnhKfivjdygofEvc6E3VFJLsuOmVPhDB5xsl29KwFjfWrSC7fhmrpIdTgLLYy/sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C2/i3WE9GOU5UANb1MPVyZ6KlsRnGagIPEmiCvZDguM=;
 b=syyxuaKH2nPhNyG2aTIXMiJh7pLBi0El9hlIHlRdQUmeEMi/G2D9WTYfoO+7QyfRjzD1GgjpM7D0WHViP9tuDBrASxAZiq6wCxNyJJ+HvE5W2Djryn6AuBt5abShpDr4t6GEYMs5GVNHgsJUzr2uqt9FlZT3PfnYchaaijwE4Yw=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYAPR01MB2816.jpnprd01.prod.outlook.com (2603:1096:404:84::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14; Mon, 18 Jul
 2022 13:13:41 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b046:d8a3:ac9c:75b5]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b046:d8a3:ac9c:75b5%4]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 13:13:41 +0000
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
Thread-Index: AQHYlsA8CcHBPp2Q3UiHwTGN6xabGq1/NVwAgAABOoCABOl6gIAAAPSw
Date:   Mon, 18 Jul 2022 13:13:41 +0000
Message-ID: <OS0PR01MB5922CD0716DF83F92BA63B5F868C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220713135528.1386594-1-biju.das.jz@bp.renesas.com>
 <20220713135528.1386594-2-biju.das.jz@bp.renesas.com>
 <24903621-358d-d380-76f4-6515c6313bbd@linaro.org>
 <OS0PR01MB5922CE20E15959AEF89C36D4868B9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <1c96a873-81f7-02c4-56cc-f33a283329eb@linaro.org>
In-Reply-To: <1c96a873-81f7-02c4-56cc-f33a283329eb@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4dd6ee22-24f4-47a7-2591-08da68bf55b9
x-ms-traffictypediagnostic: TYAPR01MB2816:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +27HyGsP+lPyaYcOHX2kU5YTDr/ahT6qkQKtVsGf/pV9DtR9ynLSBKx3ZmeJedqaow46bXRoj1AieQf3lVewuyQqwnPbZe+yStts/uA+nxJM19oKswCiK7vlyoGgpuy0yaAxur2sipdCKHmZrnFOvS+PmXigNyMTm5gLBb9ulzWY7FzWGbNwQffYA5zvgfGXhc2raAinAdsfO8zvsKvouzX/dPMZvs4fhIhOJUqOgdDINV0uZUkvqdrjzr8ez/BeuNPH9ZBzSBOIKj9NDnBxsgOIib09LQu2lSZlUi9Ld0V11OX7AsGHCM2wMhU7KK7oJpJyISVSDnFme1JV9S7gXiKJfnP0qr+ND2WdCU3lzs1j/Z4/YYaHn3o7RvgtGh7lHV+rGRNArjj2lRMIHxrzUCMxzkzOJVWJlsN6gfqjDZidKIOyfRFY9slIlsbJJpxo0MPdwzV+XQ16D28eB5crisjiRQ7+m7D0+aC+YpTOupIZGUElDT/bmz31MvJeWmt3mqAbWeKeASG4Stq/c587qCVayxQymILgyeoX4wi8kgkwq+jD+2SdQNBpiydG/SHDgSJo6CIm+vvJcdiLTbxUqb84HUwNWIuC45blPOBLwpFcUzezLkzc/IN+dLEcx5A3NJ73pZFtOLMdApTpCFBHGhual7vuEDvuGPnlZm1VBFAyaflrP4PCmvmwro6M7ZUA8X2jTX5t9Mlt1P03N1iM693elvEAz0DGFny0ypcro0HmMDzkdqzqeWlzHhoxhSCJ28FTECNv9EPiaZnAVNyAI/00/Z/2DBAi47oij/Dhs9LZNVmbl3Kc8WZT2i0/phLr
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(136003)(346002)(396003)(366004)(376002)(33656002)(5660300002)(52536014)(55016003)(8936002)(2906002)(110136005)(54906003)(86362001)(4326008)(66476007)(66556008)(66446008)(8676002)(76116006)(316002)(53546011)(122000001)(478600001)(7696005)(41300700001)(71200400001)(9686003)(6506007)(107886003)(83380400001)(38100700002)(26005)(186003)(38070700005)(66946007)(64756008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?FcM0tIj7gbEuolPliHNUiGhAeJoWrwfykM/i6NHDjHRsPCLse8nEFTZ8WU?=
 =?iso-8859-1?Q?rOSnX8kfuMYuP4Lay1g6KO94JaQt5OE7zgaKYgHlrC1KvvnAF2EA82jd6s?=
 =?iso-8859-1?Q?VumpE4KIDBvlKGE5qL/3D1+3CFekAREcUEoU5phkkb0IUQBaZlVeknIcL7?=
 =?iso-8859-1?Q?DvoW5VoLa+i8dVP+zLJ229G9lW3Px4I68CmqDe0w4VVjqYEanRSK99jjIf?=
 =?iso-8859-1?Q?coiAJpjHRlAWb57ScB1eugoVQXcVPEJi6DauekoUTZpmQL5dyiO7FS5aC+?=
 =?iso-8859-1?Q?F7bLDX7huSf5a1vCQeQ/sqpQO0bIKld/T4LR73Tz1GMJKLLWH5rTHDGprv?=
 =?iso-8859-1?Q?Elr0cGnB1NFyTIZ4wfuPMJquHxL9SqQZf0CZqE+Oz+iySnCh2P3Yf5oKk4?=
 =?iso-8859-1?Q?XxQl8BOo8XFH9aeLIdNmSy7SUIdVGScWLkzFqNnBMTyp1TwXGrF8iQzq2m?=
 =?iso-8859-1?Q?qdzRrWevL3IHPh0i3KXdlo6Hzm4V/OiaDQMs/ouDG5o6l6ba+bUWI5xO9u?=
 =?iso-8859-1?Q?rI5de7p6NPMUS+pBwSTX8/Qy+b2Mh+8fbx3pkPAs/Ee5tITM8P2ZF80zcj?=
 =?iso-8859-1?Q?CYPXs04k+D3KaprCUFRuSeSIhSfCh9cAur0ycK+kjt7zDoGqEaHjZSHBOq?=
 =?iso-8859-1?Q?m/vD/lkC+oL0V4QDxZ8ZyCV/02+YGUiwDEPvEuBXgtyzTSa9qt1Ve9a4kR?=
 =?iso-8859-1?Q?dYQh5mfhjskZLibY71ovdoZfY3nCu1ZY1G0aX5/xYW01TtdNyJNbdgdUml?=
 =?iso-8859-1?Q?9sT0TJuMziD2q5WOMmPSG8V0C1af2IYKBm/GaqnlyHaYyglXyVdhihO0nz?=
 =?iso-8859-1?Q?h8Z+4x+2RInJGZJsmVqlGUcHFU1LzVOETqtPyYNPwMmrcxYErWN2zVjWQq?=
 =?iso-8859-1?Q?HvkiHVpdC0Bg2zCuW7V9OnHKIjJW4dNKa8LVSfA+mviBmhscH90fE4JOJW?=
 =?iso-8859-1?Q?ikqfzPvDfSbEQi3n8gK/GG1s1IOOzl1nPogSdOzvgk2f1h0yu/eaRgYTOd?=
 =?iso-8859-1?Q?3q+IQo1KkQhTRpr3gpgEIiCf/Of9F8DSeVRXkD5WmrSPWMW2LPWUdhRroh?=
 =?iso-8859-1?Q?Gpk6OmlEPeMdK1U1hpP45AqBxsrAbkKxJ3GFN7gJU3FBYXzZyFxWqmNM9T?=
 =?iso-8859-1?Q?tNC0vQ/Yu0v6eBgHnUSTrIKDQcRwFRiqrGYx7dI5DaPOtv6sFiywPzsm3d?=
 =?iso-8859-1?Q?pXAQFzSzKUovDCTkUbIcVeblM89hPV9+g/q2X6CID4b72p8LznuPSiR/CP?=
 =?iso-8859-1?Q?v6Ukg054KPPq4CURTkYvLeknshNxDQ7JrMwtduOhSrYCvr3JMFEkEvCrrs?=
 =?iso-8859-1?Q?NnGyFhDiyHp8uaXEYjnfxUdFIzsgK4UxIaoSBU6QJVKU0FpqsML/URsR1z?=
 =?iso-8859-1?Q?aLWHAt7UdVw7vUcNlr7NoO1RNEfV7pFBNAk1H/p8Jc38CI2vkBtP0zfK93?=
 =?iso-8859-1?Q?0xHcFSmJ/vDzvLnPq4vdMHfpb8cMkFt2hqxQF85JU5hMplHDSXq9H1UC5m?=
 =?iso-8859-1?Q?vpu9xPhBFuXf8ULqxi00lkmswiUAO1YDPUKWudAvHdL24zfbkHL6wUaEtj?=
 =?iso-8859-1?Q?9JEOcUdUcPlv90yOPtvTIJEcaDTL3ILJg6XTrE5/iOLjqdTlXAPa1bG0r2?=
 =?iso-8859-1?Q?UxDSKQkrQWdHvxfQlm4iTWBOmhIwtPaNc2hoJ73bTDxltYNYWVgxZbuQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dd6ee22-24f4-47a7-2591-08da68bf55b9
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2022 13:13:41.2429
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IA6gfJlY214J6oBZdlLExIPddRmB1lxqyxHctrtoGJ5/8ILvlu9JHbjE9v5CJgRgFyCvBEdgNnfxdEkiXxAXcL6ECihTCDSJZOnKxckqDTA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB2816
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Krzysztof Kozlowski,

> Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: renesas: Add RZ/G2L POEG
> binding
>=20
> On 15/07/2022 12:17, Biju Das wrote:
> > Hi Krzysztof Kozlowski,
> >
> > Thanks for the feedback.
> >
> >> Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: renesas: Add RZ/G2L
> >> POEG binding
> >>
> >> On 13/07/2022 15:55, Biju Das wrote:
> >>> Add device tree bindings for the RZ/G2L Port Output Enable for GPT
> >> (POEG).
> >>>
> >>> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> >>> ---
> >>> REF->v1:
> >>>  * Modelled as pincontrol as most of its configuration is intended
> >>> to
> >> be
> >>>    static.
> >>>  * Updated reg size in example.
> >>> ---
> >>>  .../bindings/pinctrl/renesas,rzg2l-poeg.yaml  | 65
> >>> +++++++++++++++++++
> >>>  1 file changed, 65 insertions(+)
> >>>  create mode 100644
> >>> Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-poeg.yaml
> >>>
> >>> diff --git
> >>> a/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-poeg.yaml
> >>> b/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-poeg.yaml
> >>> new file mode 100644
> >>> index 000000000000..7607dd87fa68
> >>> --- /dev/null
> >>> +++ b/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-poeg.y
> >>> +++ am
> >>> +++ l
> >>> @@ -0,0 +1,65 @@
> >>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
> >>> +---
> >>> +$id:
> >>> +
> >>> +title: Renesas RZ/G2L Port Output Enable for GPT (POEG)
> >>> +
> >>> +maintainers:
> >>> +  - Biju Das <biju.das.jz@bp.renesas.com>
> >>> +
> >>> +description: |
> >>> +  The output pins of the general PWM timer (GPT) can be disabled by
> >>> +using
> >>> +  the port output enabling function for the GPT (POEG).
> >>> +Specifically,
> >>> +  either of the following ways can be used.
> >>> +  * Input level detection of the GTETRGA to GTETRGD pins.
> >>> +  * Output-disable request from the GPT.
> >>
> >> Shouldn't this all be part of GPT? Is this a real separate device in
> >> the SoC?
> >
> > No, It is separate IP block, having its own register block, interrupts
> and resets.
> >
> > Please see RFC discussion here[1]
> >
> > [1]
> >
> >>
> >>> +  * Register settings.
> >>
> >> This is confusing... so you can use POEG to mess up registers of GPT
> >> independently, so GPT does not know it?
> >
> > POEG does not mess up registers of GPT. It is basically for protection.
> >
> > Using POEG register, it is possible to disable GPT output without the
> knowledge of GPT, after configuring the Output disable source select in
> the GTINTAD (General PWM Timer Interrupt Output Setting Register)
> register present in GPT.
>=20
> Then what does it mean:
> "...following ways can be used. Register settings."
> I cannot parse it.

Threre 3 methods mentioned in chapter 19.3 of RZ/G2L HW manual for Output-D=
isable Control Operation.=20
"Register settings" referred to the 3rd method as mentioned below.

19.3 Output-Disable Control Operation
The output of the GTIOCxA and GTIOCxB pins can be disabled when any of the =
following conditions are satisfied.

1) Input level or edge detection of the GTETRGn pins
	When POEGGn.PIDE is 1, the POEGGn.PIDF flag is set to 1.

2) Output-disable request from the GPT
When POEGGn.IOCE is 1, the POEGGn.IOCF flag is set to 1.
The output-disable requests enabled by GRPDTE, GRPABH, and GRPABL bits of t=
he GTINTAD register in the
GPT are applied to the group selected by GRP[1:0] bits of the GTINTAD regis=
ter.

3) SSF bit setting
When POEGGn.SSF is set to 1.

The state of the GTIOCxA and the GTIOCxB pins when the output is disabled i=
s controlled by the GPT module.

Please let me know if you need any info.

Cheers,
Biju
