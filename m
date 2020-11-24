Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C7AB2C227F
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Nov 2020 11:07:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726105AbgKXKFa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Nov 2020 05:05:30 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:42125 "EHLO
        esa4.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728872AbgKXKF3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 24 Nov 2020 05:05:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1606212329; x=1637748329;
  h=from:to:cc:subject:date:message-id:references:
   content-transfer-encoding:mime-version;
  bh=e9l8e++pF/+TPdH+k7RyD/7T1jcZRcFhUKgVyMnPLNs=;
  b=J+suLB1SrNl9o7QwbMzNttx30ns+t+sxSuZSgTU467OYVLbWzjn201wa
   ZFiyo//LiH3UE77wIYznChEfgkQksxdcZ5xDfqD4TMQgTXBIe2XOtAFx6
   7VNovkkeCdbOGVQM1t3yfA9+ictmUeF0FY1HMknQMADVPVJYUp8q6iEDp
   nhXYcFI0IgiWrq77mwReqQ3R/9PuSfZI0KfEQAiMPOW4uJoYpWCEQrmd9
   2xHRWswrSOcc9qu6NhgulI9P6WNLZ2WM+3PWVuGj7IGnfdkiFEmDx7U+p
   cmMm12JSRO2OUAfJQhnIXHrU+W5CQugPNoonhiHgqCJOrF0NMeeoLfBmH
   Q==;
IronPort-SDR: S9lG7gYF/fuNpudSBwHZD5+0rf1N57FXBBfG2l9wWqdso320jiMcQCi2U3WzYNpYHiHcGsEqRl
 RpOKq7xokqcjEyogu1LLWgm1eMp1vB6SSRaRRrHUnmik7sUN4kcScIURde+00IHkro1idgtpvQ
 IIVixoLUxU2ayW24YdOBgWQUTaMNKbDhG+qSH8b+IGtXKK/cSwJ3/6IIFPxh0BocXV8T03mvU7
 QtjN9kpj15QdcYWnj3Yq0pTtF8I0c0di2Fkzzr1m167tagpi3TvZ4FBtuVfCyYJFW61U1PBc9S
 42g=
X-IronPort-AV: E=Sophos;i="5.78,366,1599494400"; 
   d="scan'208";a="153248338"
Received: from mail-dm6nam12lp2173.outbound.protection.outlook.com (HELO NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.173])
  by ob1.hgst.iphmx.com with ESMTP; 24 Nov 2020 18:05:27 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U61omKiXvucSPLzGA67fLwu/UHPWY0F57OdVQelvJzO1EE7nGHCDduX1vOJ8K6GZmAAqCu8dVQsCf4Ev/1JmFttNieAymVTntxZ5BRYIs/5q9W/rQa4+/M4ibkwMeLY/BfqUCWrOPaLdgwcfMIQSTB24ZvpCcbaAQIwIwJjha5H0M5MHsJR2gMM6PobkIjCclwn4GkrpHXYh+lU5QugWzAnF9QWffm8NsNKzcuSy5/hIKIM7rgfZjLhIUoZ0vJn1BxzHyLoOfM3rBnIsHBm62ThhQfUu2XoZ1M+xx+LWvNFb3jD2KB5hiYOwf3G9sYrt0eHvM3dTsdOm6SAFXCtFPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gU2qmvbV8wge+LjfgGsNeEMo8AKtCeuVRgfvH9NEunM=;
 b=dE3E2H953ogF0qFgg1NGvhY0vm3ucHhhIc22T9BXuzqIIJpsoooEt4pZZT+ZKBrgU4CSThzXev+owLDahDfF+EvBNcGLGFn20TgD4g0LW9ZU/5ogyFx8ZVOorwqgixZn5KkF++InR5M8xDtAwfoF/0co3yw9q9Rtse4UoBrJNVHY8IhOwy2qzxuyjb0dv69VmJk45kqB9i5dLiVvIEvSVHzzMZtvmTZqt3ItcCxQjWYSixKM15/u0SH/ClspTuabPaSmgK21cMqR5IDV0yghkfyIwI5g9J+jFV8anUtasyMu4uB2Og+5gY21uAVVPINPpTzHK2uNfA+snHlbO2KR9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gU2qmvbV8wge+LjfgGsNeEMo8AKtCeuVRgfvH9NEunM=;
 b=pK/I5+3LJIh2H/mfYlmkL/lSpshAQyORD38E/rLv/h64sAEXxGbgiyT47ZbBC7XHxzg8bBtqSzq1xD9WIQNcjHpHFS1WQvkVZfGmeCLs0krx5cCAdX8+WPs+lATTqOBIHYzWAu3R2AQn8zxSIcicBxDRYOA+4nqmbwS44ahlJ3c=
Received: from CH2PR04MB6522.namprd04.prod.outlook.com (2603:10b6:610:34::19)
 by CH2PR04MB6871.namprd04.prod.outlook.com (2603:10b6:610:a3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Tue, 24 Nov
 2020 10:05:25 +0000
Received: from CH2PR04MB6522.namprd04.prod.outlook.com
 ([fe80::897c:a04b:4eb0:640a]) by CH2PR04MB6522.namprd04.prod.outlook.com
 ([fe80::897c:a04b:4eb0:640a%7]) with mapi id 15.20.3589.022; Tue, 24 Nov 2020
 10:05:25 +0000
From:   Damien Le Moal <Damien.LeMoal@wdc.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Palmer Dabbelt <palmer@dabbelt.com>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sean Anderson <seanga2@gmail.com>
Subject: Re: [PATCH v2 09/21] dt-bindings: Document canaan,k210-fpioa bindings
Thread-Topic: [PATCH v2 09/21] dt-bindings: Document canaan,k210-fpioa
 bindings
Thread-Index: AQHWwhuTTl+n9RngRUi4SREztTsSrg==
Date:   Tue, 24 Nov 2020 10:05:25 +0000
Message-ID: <CH2PR04MB6522F476C51D4C65F116BE9EE7FB0@CH2PR04MB6522.namprd04.prod.outlook.com>
References: <20201124043728.199852-1-damien.lemoal@wdc.com>
 <20201124043728.199852-10-damien.lemoal@wdc.com>
 <CAMuHMdXov3Dr7EmAeE7yrKRmtu_L3539u9cjeiGiaRu32YVPQQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:ccb9:9212:86f5:6af]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: c1a6edb0-737d-4e7b-aa8f-08d89060767d
x-ms-traffictypediagnostic: CH2PR04MB6871:
x-microsoft-antispam-prvs: <CH2PR04MB6871AA4F7C18E3587358A105E7FB0@CH2PR04MB6871.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3iWVproal6e0zlwDoujtfRSZym4VKuYcLFgDctOoXMmOVi1H6vC4eitNjFf2QniHCFnlRzeVvqlssAt6v58eTxnFIZ/Kwfi/oJgoWkgCWzl0wzQOhS7A4mRytFaOUuRapPkIl1V05AS7njcg7Y9c1VQtLEpznfCyNXDd/xVroThjNFdKPDZfea8he7/vnR3H9RSQUKxv2xk1DKw77wWAXnOgWe6l8tkvxUUdxIjyqR5yQmRJqDj5aZ980FSlQQ2dRqkcpFb67FcGBd69ouHPQVawsjo8uPQgxejbg0jcvpruNOgS5ALm/lZOXojhHCaeyBGJf7knIyfEpC2zWPWSuA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR04MB6522.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39860400002)(376002)(136003)(366004)(396003)(86362001)(8936002)(66446008)(7696005)(66946007)(64756008)(52536014)(76116006)(91956017)(66476007)(66556008)(2906002)(71200400001)(7416002)(186003)(8676002)(53546011)(478600001)(33656002)(4326008)(55016002)(9686003)(54906003)(6916009)(6506007)(83380400001)(5660300002)(316002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?fxN1S4osD4z7mDUA7H5ctzMFuFw/yPmbLrj/ic++rV3cIhVoWTUF+fmY9bZo?=
 =?us-ascii?Q?G/2e545qLi698qf2wJUTRvtfCAG+ieW0ftyfftGIpB+VzCglrnwdztg0S47F?=
 =?us-ascii?Q?922QdN9xzknpt009e9ENlS4wJyj0ltI0h4rEYMaCMTI8QFr4PqhRFEZvjFdq?=
 =?us-ascii?Q?k9gCbBjg6IkBQhtbKFYCdIK1jlApiBOHsxjTz234v4h4uRTnkYKyMif3KAhH?=
 =?us-ascii?Q?1+JE8B+utMrMxKdy7RvmmZpDvcQGDCWigvCKHAMkaj4UYv8R2vezokCxIyV0?=
 =?us-ascii?Q?1Sks6iGbWsk3IE9gLGBs5hif+7O8O/8lYqR+ROWqxygnK2trYH3gf4di/VGq?=
 =?us-ascii?Q?CuAz+6n6ah6oxrjUakN8HYPKyI5rwKdm1QO71JYP6wYNczgiKCxwxlE2qaZd?=
 =?us-ascii?Q?mQ8ZtpMg/1Fo27eg+rp6+VQzU2Kvgx4UmTPQmhG7+qwB6B/Pxzxc+4vBxO4w?=
 =?us-ascii?Q?RBqeM+D+V8b/8ZTZ7lsHP6zgGsfkT0adC0cXiS375UjwA3imkwPBnQwMq67O?=
 =?us-ascii?Q?hpeFDiTuCIZpfgz1gDsctjidH9MhvQPmX5rWCotshJBWQNHb+hAagb6aFtMZ?=
 =?us-ascii?Q?okYE3lwejfD7Kp7qa5LVZX6BXDameVgFKNk6ZC6UGp9+dusymGZN5IB8PWbI?=
 =?us-ascii?Q?GumVx3t+TW2duPZIHfo9rvhvqFdBNmxG5+O0LEI+vwEHm4SNvp3Zibl/QaIp?=
 =?us-ascii?Q?na5Xwh+naT2yHr1nTeJOm+1pvia0+hGOaxGOwECDWhSZmrcthPGcT1HYoKU3?=
 =?us-ascii?Q?OgrhejkEerWZswErkCFSr5e7+ASFyaBeZ3bVA8F/M73otEBnXiYplJbvzfW2?=
 =?us-ascii?Q?v+39B+g75E16HYe144UmoPorxmCLTBEtnIr9t7X8vyn5CCTG9nuGHu+0pJk/?=
 =?us-ascii?Q?uAHB3TS1uaavFIvLAZI4I6NwbcOrgGd2ZFL82nwOlmUmh2zo/1aHAeTBqB7x?=
 =?us-ascii?Q?zBCZq/9mRKPgXjUizE/ZhQ=3D=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR04MB6522.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1a6edb0-737d-4e7b-aa8f-08d89060767d
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2020 10:05:25.1316
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vk9snIOLBnSYs2nA2+i6rtqu/9fBRhJBB8KHNZpNj2yrd1CYu9l76vljG7gLmei+JfpcOZTjnyuYO1HZvb3yCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR04MB6871
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 2020/11/24 18:49, Geert Uytterhoeven wrote:=0A=
> Hi Damien,=0A=
> =0A=
> On Tue, Nov 24, 2020 at 5:40 AM Damien Le Moal <damien.lemoal@wdc.com> wr=
ote:=0A=
>> Document the device tree bindings for the Canaan Kendryte K210 SoC=0A=
>> Fully Programmable IO Array (FPIOA) pinctrl driver in=0A=
>> Documentation/devicetree/bindings/pinctrl/canaan,k210-fpioa.yaml. The=0A=
>> new header file include/dt-bindings/pinctrl/k210-fpioa.h is added to=0A=
>> define all 256 possible pin functions of the SoC IO pins, as well as=0A=
>> macros simplifying the definition of pin functions in a device tree.=0A=
>>=0A=
>> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>=0A=
> =0A=
> Thanks for your patch!=0A=
> =0A=
>> --- /dev/null=0A=
>> +++ b/Documentation/devicetree/bindings/pinctrl/canaan,k210-fpioa.yaml=
=0A=
> =0A=
>> +  canaan,k210-sysctl-power:=0A=
>> +    $ref: /schemas/types.yaml#/definitions/phandle-array=0A=
>> +    description: |=0A=
>> +      phandle of the K210 system controller node and offset of the its=
=0A=
> =0A=
> of its=0A=
> =0A=
>> +      power domain control register.=0A=
> =0A=
> Your k210-sysctl-v15 branch has a bogus trailing space here.=0A=
=0A=
Oops. Forgot to push the fixed up patches. Just did it now (forced update=
=0A=
k210-sysctl-v15).=0A=
=0A=
> =0A=
>> +=0A=
>> +patternProperties:=0A=
> =0A=
>> +  '-pins$':=0A=
>> +    type: object=0A=
>> +    $ref: /schemas/pinctrl/pincfg-node.yaml=0A=
>> +    description:=0A=
>> +      FPIOA client devices use sub-nodes to define the desired=0A=
>> +      configuration of pins. Client device sub-nodes use the=0A=
>> +      properties below.=0A=
>> +=0A=
>> +    properties:=0A=
> =0A=
>> +      input-schmitt: true=0A=
>> +=0A=
>> +      input-schmitt-enable: true=0A=
> =0A=
> Do you need both?=0A=
> Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml documents=0A=
> input-schmitt-enable and input-schmitt-disable, but not input-schmitt.=0A=
=0A=
Ah. Yes. My bad. Will correct that.=0A=
=0A=
> =0A=
>> +=0A=
>> +      intput-polarity-invert:=0A=
> =0A=
> input-polarity-invert=0A=
> =0A=
>> +        description:=0A=
>> +          Enable or disable pin input polarity inversion.=0A=
> =0A=
> Still, this is a non-standard property.  Do you need it, or can this be=
=0A=
> handled by the software GPIO_ACTIVE_LOW flag?=0A=
=0A=
For GPIO, yes, that would work. But not all pin functions are GPIOs on this=
 SoC,=0A=
and the hardware supports this. Strictly speaking, this is not really neces=
sary=0A=
as pins that needs inversion have that coded in the function code given by =
the=0A=
pinmux node. So we could remove this. But that is not a lot of code at all =
in=0A=
the driver to support it and the hardware allows that to be set per pin,=0A=
regardless of the pin function assigned in the pinmux node.=0A=
=0A=
> =0A=
>> +      output-polarity-invert:=0A=
>> +        description:=0A=
>> +          Enable or disable pin output polarity inversion.=0A=
> =0A=
> Same comment as for input.=0A=
=0A=
Same answer :)=0A=
=0A=
> =0A=
> Gr{oetje,eeting}s,=0A=
> =0A=
>                         Geert=0A=
> =0A=
> --=0A=
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org=0A=
> =0A=
> In personal conversations with technical people, I call myself a hacker. =
But=0A=
> when I'm talking to journalists I just say "programmer" or something like=
 that.=0A=
>                                 -- Linus Torvalds=0A=
> =0A=
=0A=
=0A=
-- =0A=
Damien Le Moal=0A=
Western Digital Research=0A=
