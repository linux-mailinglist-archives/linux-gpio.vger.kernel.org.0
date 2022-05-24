Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0001C533142
	for <lists+linux-gpio@lfdr.de>; Tue, 24 May 2022 21:05:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240845AbiEXTFR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 May 2022 15:05:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241009AbiEXTFH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 24 May 2022 15:05:07 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2112.outbound.protection.outlook.com [40.107.114.112])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E80CF2F;
        Tue, 24 May 2022 12:04:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dID/ZIoR5L2hB/hyuq+XHnmDyKCxYeclpLBMhmArw6WH4928gBWFg3QJZ0UPMz/5auamWkwPv4rF9gAXuk3TUmpr5QIg3szF28FwG7m4UOALuI8pq1H+BPr3yLG/uS5JFIKXz3DWQdvKU9myt4hkclATZxcqb0EqmGA5Niyc8i+E5b53zEjakaOR+JXSamwT3Pu8K7MrjCcF0NEZFI233R80Mgg3PcQdjEPmYkwuLHKFjlXdqnvYciTQ6r0HEW8jhl/Ceg3v+CzGfEzpJm2RWxz/q/0Ll7H8g6xOmagBIvzoWTlT2G2c9GKpP6OK9wAvL2Xzh3K/DVANVtzpmTwuww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iD+fekhtuxPuoCrt6NvCPmgaR3/4PrP1IdeY8AWhAr8=;
 b=ExCgGkrlmo4TjBlksieyNlvV9ZDuhe8FKxz6XnXoyQjMpjGmbbdpr28dh+tdJCiLXYbj1jn4NnFJtFydqIscxzF/8uk0ZLFvEY/pnIwy3VOh8Db03OsJu9FbyJ8x35UF8FkXIumOrpQBjhk3GK7p7kjW9Me0OLBFbQNusG27FKVQ6X14dDTwHvLjrh8BFNEytHV5Gpi+hgttKIargysLIh3N9eEczT9DzIlgBdzR3ATyjGPLuJlz5hgeRd5F2sh4SMLV9MmH3EujYqAfZifBJjFgEf0zJqJx1o6OwKNMC8kxWZOquph6qXb2LckE1WX1I7teaQ+MBHiOdfANcAQJIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iD+fekhtuxPuoCrt6NvCPmgaR3/4PrP1IdeY8AWhAr8=;
 b=Cr1QWz2PizTv9q4JkZxfMOaMzNrBSoY10AW1RmTtEkmmJAilY+Y1YssjXaYkVWIKfUXn/+5oM5Yxv1AeAGb76NhQPSTly4qljx+im1bDmU7Ie93dOTCRo+C8gVC2wM5gu/i8yJ4yc9RXEniM/Eri8xOXqgnead/sQ+rSgHA02iM=
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com (2603:1096:400:de::11)
 by OS3PR01MB7683.jpnprd01.prod.outlook.com (2603:1096:604:14b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Tue, 24 May
 2022 19:04:41 +0000
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::e180:5c8b:8ddf:7244]) by TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::e180:5c8b:8ddf:7244%8]) with mapi id 15.20.5273.023; Tue, 24 May 2022
 19:04:40 +0000
From:   Phil Edworthy <phil.edworthy@renesas.com>
To:     Rob Herring <robh@kernel.org>
CC:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH 1/2] dt-bindings: pinctrl: renesas: Add DT bindings for
 RZ/V2M pinctrl
Thread-Topic: [PATCH 1/2] dt-bindings: pinctrl: renesas: Add DT bindings for
 RZ/V2M pinctrl
Thread-Index: AQHYbGAJuUt0o0UhwkGKZGmmj+mQHK0uZKUAgAAEFEA=
Date:   Tue, 24 May 2022 19:04:40 +0000
Message-ID: <TYYPR01MB7086F6CF69073EE5B6A86A80F5D79@TYYPR01MB7086.jpnprd01.prod.outlook.com>
References: <20220520154051.29088-1-phil.edworthy@renesas.com>
 <20220520154051.29088-2-phil.edworthy@renesas.com>
 <20220524184720.GA4138401-robh@kernel.org>
In-Reply-To: <20220524184720.GA4138401-robh@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 825a92f3-51ea-4693-813a-08da3db8418c
x-ms-traffictypediagnostic: OS3PR01MB7683:EE_
x-microsoft-antispam-prvs: <OS3PR01MB7683BE4B98DAB3F00B6B3283F5D79@OS3PR01MB7683.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qlEx7md7MUDcJU4b8Eg0sQAJTmJSaDQ1otgBaCVDkHqce/dJiNdk5t/TpNGkV7BgEklT42s2O0Ue9BcOgHDqrVB9/Subsj0UvJUAQqxcKPWmpii3RN0M+xUA/Cj9mr0cTNO6VQC7dAAJX7F9hQHtNv1t+eO4DgzYcpTzFRc8z4w9U0BR+MUzMnMqv3HeaHYeg559mbrjwrhXqNhRYz/XKUvePtB0L9+g0ELjAgLPPdzgFHvJ/Ct0pkq86Q/FJfVnCdpT/wVEyatMApcTYNYTeg/fjeh/5ufy2026xYjFmT3tWcR+qpR183bkmO5CrKd6AND3hfI6aqwB1UdIqKK++aSlQaHELyhpWo7uJQ7OFM+yiZL7QE6s2cHqj0Rd0D3BL6E41pTF/gRcQpNffGxGvA4e6tdhC0UvTXSh3McJ6R7e12FqUE7719YMq9bl3f9HEeln3T9AhyK/rb42S2eXE24uUAx3V7k9rp7yGhLZMVVlrfZr2icOXU/o1LWeplEcaKMHTeebSOuo5FketnIknDYRyh4a7l5Y44Ov4W+GGuvvo4SpCsf1448iU9UXiwD0rE3hRLwNonBv2PRBDgagrslhYEJfJXTzwD7IrsHuDaqtBPAb/uU+mwQAXxYLiHeiK7QLu8izrmjw7QQE84xUx91XTjbX/6nOlmDAVN3b3YmvdN6I69bW9MDY7gI2J1SQE6ane++gWOLXkD/MkiSHqoTIjID6VAXWILSYpFJpeoWE3Cc63nEwTd+U46IG+eh5kCc9D68DpWpO6yFlWXBtRurdF1/IsMV19onUZH2ojQo=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7086.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66946007)(6506007)(55016003)(26005)(9686003)(66476007)(4326008)(66446008)(64756008)(44832011)(7696005)(66556008)(8676002)(76116006)(71200400001)(86362001)(508600001)(5660300002)(33656002)(52536014)(2906002)(966005)(122000001)(316002)(38100700002)(8936002)(38070700005)(186003)(6916009)(54906003)(53546011);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?VhSOnVstezbG10wsoO/Tu9EFXHoYkYJud5ofvgFDmD8NcXlVfF/NUQjeVNWo?=
 =?us-ascii?Q?LN4aQOBLvOJV6rPc1Umz5BET0u37AW6cxWFOjdDAAdkIH8XYhP4AmiJTBvFl?=
 =?us-ascii?Q?46lUMpNKdfhSS4ne/KnsS5/UKL9FK6UD7J8mUbdROv4ImmqpK7/FcCDKYUZ6?=
 =?us-ascii?Q?Os7SLeLaFTcemTGBNNC/F0qfZDdNt/+lXZNfd893zx3gHpnBaOhXVXAXBp7e?=
 =?us-ascii?Q?D2LHSdgkbL6PMvlmwyLfmmtHK1eNX1k7R0cTzXdE0g2APV5D4a94+QhF9TCF?=
 =?us-ascii?Q?+STQZymztRfryZ5t8wf2mgDbjpxgOp0FoLvYKYSNNv7Px4M49pxKs1v5a9Rs?=
 =?us-ascii?Q?7l5yWre+23CpByVjRmJYF8AJXyK18Osk9k+cx8bIdpJiN0b46HcJdB98E1kg?=
 =?us-ascii?Q?1ziw++OTvIGNEu7GuO9ymfpFsNRIh8ELa4gTzI8QHIzNMRhJXu6zcL/5JAV+?=
 =?us-ascii?Q?CHIn+kjybSWfNtTeB79pTKmpCPtlHqQDycc96cHX/1f3Mk5RyOZD1XF0HbAH?=
 =?us-ascii?Q?yI6mcLTJIAy4DEljmNYu24n8sXXn2EFFQWYciq1xg8XYLszgXizzwMjHbChE?=
 =?us-ascii?Q?qcCmQMnAz4xOAZT7nC4zvROAru0qxy9Kc77u+mk1D6L4x+LJSBHpk9Cf0KEd?=
 =?us-ascii?Q?cMMwvHM0nlgW8Bq3RWi7OZqo7zXZm72+LHhKgdAoqzDZkEXN6o+3AHVaOff/?=
 =?us-ascii?Q?E06cmuhJIa7eX8SBEO453otgG0iNLgCaerrgdTCaLuxcyoixqqnP7kti6lqk?=
 =?us-ascii?Q?vco7VUuMrVsAWQbBViuethGjApY67Z58zX+v0V02WrwaM4wOVBSlkilK0h6H?=
 =?us-ascii?Q?U4pa+jN7fAs7fgGZOvhHLfHttcIEr9yGp6476Dmto9kYnbLlTxtJIt6YJcnU?=
 =?us-ascii?Q?UgAC2i2jml7cbI4an8vU/H82ox/8L8Wi/BIfM5ZcTmM2S6gtIDLcS8RF2GXf?=
 =?us-ascii?Q?Wv8IOllh3pEJiUGB+k8kTVC8825QxrrYUzXXBBLvU5ldaa44/AAD42i3ptEh?=
 =?us-ascii?Q?syvJhGfZ3KR+GZQbWCgZVmRnSdCxKnh203cc7juyrnNBfGlqvmoHxzwh70xM?=
 =?us-ascii?Q?bIfZgvUzZfKTg2byhFcFRZrJmz+NvtBwCy8gLrE6DWQwiE16MF4MeVykIYwe?=
 =?us-ascii?Q?voTD1ANjdFXR/Oo/GGi/1iGWv8FARZP2yyMUN2ijd0Td8jcaDdrETVqM82w/?=
 =?us-ascii?Q?saZunaxaXFD8F5QWOUJyjdu0wNaoW5nqoteMRZh10Pcv+Q7qtAq+qqBqXjDP?=
 =?us-ascii?Q?g1G9LVqNfFYUpuNbZ/d6HB5yWVG3ktW5ULRIxGVxi9Gi8o+SahGYMJayfjZ5?=
 =?us-ascii?Q?rGMgK6jSd40Lld5YA2O4Tr5E8M9q9F5HTf07S9UVBLaLhptu2TaM9pIWDsn1?=
 =?us-ascii?Q?omqo+V2vOdAmvFVL4MxD4Mc+wubXUVNqeAY+u+ciiSJfhkcfXactvuZ1JPVA?=
 =?us-ascii?Q?HOMtchBpOym7S9BeEJSQtLJr3jSMWSepDk++py0p7h6ukKhk6zLIwNyQoYII?=
 =?us-ascii?Q?+zR3yKBISPJEYL06rtxPEVpkip4LPfmqRVI0coarcS4iZv/QA5llGck7rWPM?=
 =?us-ascii?Q?dDIUPRGEpCgajXrb6WAtTcvfEJxh5RG+TLb2yKq0kqMTkTZGBspY1deD4m0C?=
 =?us-ascii?Q?3LcjlTsSzzTyHyAMdbNObitLnpSUQxW2sgchRpXxyFucRfKMdbTzqfFy0Nr5?=
 =?us-ascii?Q?eIN10uE5t1gDiFPwzHFugmuldRPigMTjm0cAlcPizd85CMFC/MfGRunpSi0J?=
 =?us-ascii?Q?kVn4xHKMOtYULwz3Wa5y0yGBtyYtRPY=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7086.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 825a92f3-51ea-4693-813a-08da3db8418c
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 May 2022 19:04:40.9038
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7Dp3mxqog44X09DVNcN3bNplZqYttEbNczUzaIrwIj0XM7t3KwAkR+Lyc+wbXuEYwGNn27t0ZvlPlkeXzRqw/VTdsBkDD7MULogpHsFwXJ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7683
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Rob

Thanks for the review!

On 24 May 2022 19:47 Rob Herring wrote:
> On Fri, May 20, 2022 at 04:40:50PM +0100, Phil Edworthy wrote:
> > Add device tree binding documentation and header file for Renesas
> > RZ/V2M pinctrl.
> >
> > Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> > Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  .../pinctrl/renesas,rzv2m-pinctrl.yaml        | 174 ++++++++++++++++++
> >  include/dt-bindings/pinctrl/rzv2m-pinctrl.h   |  23 +++
> >  2 files changed, 197 insertions(+)
> >  create mode 100644
> Documentation/devicetree/bindings/pinctrl/renesas,rzv2m-pinctrl.yaml
> >  create mode 100644 include/dt-bindings/pinctrl/rzv2m-pinctrl.h
> >
> > diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,rzv2m-
> pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/renesas,rzv2m-
> pinctrl.yaml
> > new file mode 100644
> > index 000000000000..305e836cf0a3
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pinctrl/renesas,rzv2m-
> pinctrl.yaml
> > @@ -0,0 +1,174 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/pinctrl/renesas,rzv2m-pinctrl.yaml#=
=20
> > +$schema: http://devicetree.org/schemas/pinctrl/renesas,rzv2m-pinctrl.y=
aml#
> > +
> > +title: Renesas RZ/V2M combined Pin and GPIO controller
> > +
> > +maintainers:
> > +  - Geert Uytterhoeven <geert+renesas@glider.be>
> > +  - Phil Edworthy <phil.edworthy@renesas.com>
> > +
> > +description:
> > +  The Renesas RZ/V2M SoC features a combined Pin and GPIO controller.
> > +  Pin multiplexing and GPIO configuration is performed on a per-pin
> basis.
> > +  Each port features up to 16 pins, each of them configurable for GPIO
> function
> > +  (port mode) or in alternate function mode.
> > +  Up to 8 different alternate function modes exist for each single pin=
.
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - items:
> > +          - const: renesas,r9a09g011-pinctrl # RZ/V2M
>=20
> With only 1, you can drop 'oneOf' and 'items'.
Will do!

> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  gpio-controller: true
> > +
> > +  '#gpio-cells':
> > +    const: 2
> > +    description:
> > +      The first cell contains the global GPIO port index, constructed
> using the
> > +      RZV2M_GPIO() helper macro in <dt-bindings/pinctrl/rzv2m-
> pinctrl.h> and the
> > +      second cell represents consumer flag as mentioned in
> ../gpio/gpio.txt
> > +      E.g. "RZV2M_GPIO(8, 1)" for P8_1.
> > +
> > +  gpio-ranges:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 39
>=20
> Needs some description as to what all these are. If it is not all the
> same kind of interrupt, then each one has to be listed.
Ok, I'll see what is best to describe these.

Thanks
Phil
