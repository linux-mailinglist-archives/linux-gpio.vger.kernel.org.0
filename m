Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BA852D24E9
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Dec 2020 08:49:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727167AbgLHHte (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Dec 2020 02:49:34 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:13597 "EHLO
        esa3.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727010AbgLHHte (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Dec 2020 02:49:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1607413773; x=1638949773;
  h=from:to:cc:subject:date:message-id:references:
   content-transfer-encoding:mime-version;
  bh=JijVjlT+wmn691kvw6dKiFPRly79I7iZrQBrb/430FU=;
  b=HPGdXoCSptHRMd/7wAaQqt2/hk8T27ToizdSerdf878gvuuCwyNlCXrM
   HbpPU8syNtoFZSEJdCqu1KMG8FpwJ63/NsdBb4of8AvKjBepAdpxHnmjL
   YcLcSGMx6C4fkAZGE5z1oWUMTVEVcPdPMflXBxNoQ3xreLwCTew3WzriD
   QrFHKQZrC12ESOtSwq41FufZR/wvpwTwSEtZPi8Tdk1Gzo/ox96EQ751a
   d0et6ovM+awhCCdAnhvdbE22GcMoBwicoifikfenH4eXEGnuyy36+liFy
   sMATC5EJklxB6hEIH2VEazshuiyf92CC0fDLrLU9R1fJ1841KwAaXvGVg
   g==;
IronPort-SDR: M8qdSyUOGIgc8ZE5bASayDV4IBc7Xr4izFRVkVYJqCilloiPLb0EDQfbrbmtfLq/d2EHwOXY6N
 SbXHV1PM2h91sOjQ7KOIsmCJtKwIRgANrnvrLxywkiNtpRPRMACyKXH/22sM7m2F6mTA0a7hOE
 kL07b3oBxXPyH+MIRfCJWdyZTceKHtLGpNQw4dqiVt7Nx5jZu3cgMpOL167nXyExYgw/X+/j5l
 gjtYhdIaFwNrO3O7TZQtmqw5zTBUpCJyuzg5tNRkjQHoYSXSQkvogWk//MZAo6WIoDIXOYfuMZ
 rrg=
X-IronPort-AV: E=Sophos;i="5.78,401,1599494400"; 
   d="scan'208";a="159125907"
Received: from mail-dm6nam11lp2176.outbound.protection.outlook.com (HELO NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.176])
  by ob1.hgst.iphmx.com with ESMTP; 08 Dec 2020 15:48:27 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WABishG//mfq3x7wDtxIUgRLpkGh1VgB6/Meg5+oRf339yJfMZBy/kCM2khAQ/62C7Oy7hVmPt9Xo1nTm095fWXyXi0P02gZpGgoxof/Jowoi4mF5T8p2D6NJZUjUsFK1yidJkKiu8RZsFs++/HOgiZCDCq0NALe2bWC1WVryaWF4g0czlPWP6ocIu7afK+gCpYovN1GzSVVS453+uyHIeX7fH3QSq1EOcpTjP5PCiDVc2fGKp8K1Ejv+tnjzMNPgQI6QlDbxf8LsgA472m09QeOUmLryEIr5jU8YUILhe8Lu3GTT0VVDc2TXb6keW+3n8b77P3OGR8pbJdAvCExiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ioBzt6s4hrIFoz8M5QkOKTvmNmIFjd5phHfTgMrFcIE=;
 b=GXmOZI7JclTgqixOYIvtD6Sv3kGCiwZhAZ//Uj1bPE0z0vgEvJFBAIBLft85kSd80MNdAWLKL2h29VIFDq5GOB/62WKAUkriljU3p4h9fu5oLpoEErQnsfd9xjqcvWp0c2IhadwiQsuf+y9eP3lz2LHkFj+zDZN+1y4loS8Bk0t6ERwIf9uJgJrKbZ/mkkN1VetGPGxxmPH0+Un7xx14jz+GeYqowHACfsy53ek/F+PWYpicfAb+G9/I0G/65Lngy9b3GmG1zdEzRM942Lijoz2wgbhrPu18mXNb5L7/3doN86b6ecwSMdlSf56F/I0OMW1Uf5BIgzUVM3AxPlOZsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ioBzt6s4hrIFoz8M5QkOKTvmNmIFjd5phHfTgMrFcIE=;
 b=rMlD2R2njoJ6udF0d3JRYEUqYeK7AKLBkm3ouEoZI5dmXZ58dn7/bQj2KKlCx8SdYf9f89zCA7Bt2gZTI83JAWiHAh9EeqnJxZyplC65F1USmdfnyVxhFAsvDo4Pt97s9gP8EgvyNiQ2/aDh6avJQLCLVx49frMHxyueWqV+hV4=
Received: from CH2PR04MB6522.namprd04.prod.outlook.com (2603:10b6:610:34::19)
 by CH2PR04MB6886.namprd04.prod.outlook.com (2603:10b6:610:94::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.21; Tue, 8 Dec
 2020 07:48:26 +0000
Received: from CH2PR04MB6522.namprd04.prod.outlook.com
 ([fe80::897c:a04b:4eb0:640a]) by CH2PR04MB6522.namprd04.prod.outlook.com
 ([fe80::897c:a04b:4eb0:640a%7]) with mapi id 15.20.3632.023; Tue, 8 Dec 2020
 07:48:26 +0000
From:   Damien Le Moal <Damien.LeMoal@wdc.com>
To:     Stephen Boyd <sboyd@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        "palmer@dabbelt.com" <palmer@dabbelt.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
CC:     "seanga2@" <"gmail.com seanga2"@gmail.com>
Subject: Re: [PATCH v4 11/21] riscv: Add Canaan Kendryte K210 clock driver
Thread-Topic: [PATCH v4 11/21] riscv: Add Canaan Kendryte K210 clock driver
Thread-Index: AQHWyFrJ31Bqsdz07kaNo2YIn/vMLQ==
Date:   Tue, 8 Dec 2020 07:48:26 +0000
Message-ID: <CH2PR04MB65226B954871D20537655AE2E7CD0@CH2PR04MB6522.namprd04.prod.outlook.com>
References: <20201202032500.206346-1-damien.lemoal@wdc.com>
 <20201202032500.206346-12-damien.lemoal@wdc.com>
 <160714919628.1580929.1456162330322523777@swboyd.mtv.corp.google.com>
 <d9aec92299e5f427aaf5c5e892194e27006f8bbc.camel@wdc.com>
 <160736612827.1580929.7802371235304556600@swboyd.mtv.corp.google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:1cf3:4043:c21d:e871]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: d070cd64-2cf9-467f-9c16-08d89b4da57c
x-ms-traffictypediagnostic: CH2PR04MB6886:
x-microsoft-antispam-prvs: <CH2PR04MB688697C170D990A148456EA6E7CD0@CH2PR04MB6886.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MTleQuf4DjxgUwfZAkUtFuP5yUNB7EwAba7cdXZCboNjdh3m0awPPDhiwMCOETWlMt/aH4iTm+jp8BtmFRUC6Jr60+IKdd/MVaEQFUIzBuCzd4gJWDc+wdtatN4SVAuImJAretHAksh9GLEAV6zB3Eu7GcmjrfIbDDH6R178kO29wl5x0fdVOyaY77r62uXDXO4pHRjsqpvHvNRRoxQS3cEn/JiIxmBss2cMSXU8ZfxJ7pKyd5gO2BLr7GEGO+5pxluI+37l655438xKEbuNjzryENriVMkczsMNUywkSlUtnMUVmShFwNN0D4DwwCCtlouFYyyoB+1LeX/YydE62NhpS7qWuWyX8xfOBBRhQXMZep3eK0YVRNzp89dGHm6y6T6j2JVLmEoLMT2cDzWekw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR04MB6522.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(346002)(366004)(396003)(39860400002)(9686003)(66476007)(66556008)(53546011)(71200400001)(4326008)(7416002)(66946007)(76116006)(66446008)(64756008)(8676002)(2906002)(186003)(966005)(55016002)(5660300002)(478600001)(83380400001)(8936002)(33656002)(7696005)(6506007)(91956017)(52536014)(316002)(110136005)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?78WamEh1CefEaA0e7pxp2kAhmW+pswPstQ0AAGwmy6ljGi6L4RKiatZtuy?=
 =?iso-8859-1?Q?SAsdQeP7UiCFkLLGwZ9+tfVG+8Ls3G5hiOj68msflwJxPECzrleQBi4n2r?=
 =?iso-8859-1?Q?qsQ0SFcvYnW8g4wFLggj0yj20f1Hp55pqbrUnKGnv4q9xooT/cqhtY/llZ?=
 =?iso-8859-1?Q?NITRvnr1sUv6nW3TXPlhZHUbYyDSQgYu5mq9pIeBD9eZV9j8PEBdhEHHnQ?=
 =?iso-8859-1?Q?fWCkxAvaXtWMGMdN2CB1vjn24RlRgeSNWPOb0c3Wg/KzvJ08RXvStKJ5tZ?=
 =?iso-8859-1?Q?A3pUKc4Vg4KS5yq9brBHyTpOfy/L0Yil0VgCqMbUOi01/wbTWSXmnPc+s9?=
 =?iso-8859-1?Q?DTOtbLJiB78cW63eGi0UsXTIdio5gIgCpmQHvEJEjKDsXwTPss+sFHeip2?=
 =?iso-8859-1?Q?a7T5Eb7Q60AVOk7vXlZ1J88PI2mvPTXjeFgXontocS7OnQUY4JrthZf7G2?=
 =?iso-8859-1?Q?C2RfPz+l/tBRo6S+CWDIFXe10ka9l7yvMEQd07KY6Fe+ZXuLgMCmWIM8zR?=
 =?iso-8859-1?Q?Pku6k2e9EC7gfBdBLjz+ZxlN0GGEemQJKefxokt8VhU2VEq/cKfRYKl9lP?=
 =?iso-8859-1?Q?dlNMx+ergetIEmqT18SN7hPGOyO15cjowQQC8NzuTustsDaixWDuOSFLzX?=
 =?iso-8859-1?Q?L2zfmK/yEVUw7Ul5wPqWhd75s4zNUkMHD+CbloNMDQGiFbinjwyGOccc4x?=
 =?iso-8859-1?Q?m1/ztEj24WU9Lxiq8ndB6jTfTDBkBPFiFpDlnzJs/wz0m/L77t0gInn6ln?=
 =?iso-8859-1?Q?r8hgRnnuf9ePPbN7Nn3h8y4rHaeQM66L4CODAr/WT9a7iQNqBXhIOkPsZ3?=
 =?iso-8859-1?Q?KldEWMex3CeBR2p/1IZ1Lyw2BHFRQzsdCNJ6eBS/WPJVEPnZTOb0lzqtht?=
 =?iso-8859-1?Q?bSFHAukU6DxC31QSYqfPJusyEaxU14J+VErt1g2flDGjaWytLkijklp6Ds?=
 =?iso-8859-1?Q?swH6CWWV05FPJTCMuzz1SXnklLnn4Yx+Zdxro1QbBozqv+FcUaHWh0pTwl?=
 =?iso-8859-1?Q?63qws91A3BwfjFoz57MFMrw9eedD97Dm6JuLbNNLL6ZwMfBhW8Bk3FXvrk?=
 =?iso-8859-1?Q?vE6YyLlW3USJlEmhTrYQU5H+hyPzFDB2sx86QoivrbX+?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR04MB6522.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d070cd64-2cf9-467f-9c16-08d89b4da57c
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2020 07:48:26.3402
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AZ6Cw7pzLzZ5aGqiY+QQmohUNQkZS7VZZe3DjnMShVUGdYylSaNAittvMupw2r4hbrJ9d20isUi8xq9Kr9cQmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR04MB6886
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 2020/12/08 3:35, Stephen Boyd wrote:=0A=
> Quoting Damien Le Moal (2020-12-04 23:43:14)=0A=
>> Hi Stephen,=0A=
>>=0A=
>> Thank you for the review. I will address all your comments.=0A=
>> I just have a few questions below.=0A=
>>=0A=
>> On Fri, 2020-12-04 at 22:19 -0800, Stephen Boyd wrote:=0A=
>>> Quoting Damien Le Moal (2020-12-01 19:24:50)=0A=
>>>> diff --git a/MAINTAINERS b/MAINTAINERS=0A=
>>>> index 2daa6ee673f7..3da9a7a02f61 100644=0A=
>>>> --- a/MAINTAINERS=0A=
>>>> +++ b/MAINTAINERS=0A=
>>>> @@ -3822,6 +3822,22 @@ W:       https://github.com/Cascoda/ca8210-linu=
x.git=0A=
>>>> =A0F:     Documentation/devicetree/bindings/net/ieee802154/ca8210.txt=
=0A=
>>>> =A0F:     drivers/net/ieee802154/ca8210.c=0A=
>>>> =A0=0A=
>>>>=0A=
>>>>=0A=
>>>>=0A=
>>>> +CANAAN/KENDRYTE K210 SOC CLOCK DRIVER=0A=
>>>> +M:     Damien Le Moal <damien.lemoal@wdc.com>=0A=
>>>> +L:     linux-riscv@lists.infradead.org=0A=
>>>> +L:     linux-clk@vger.kernel.org (clock driver)=0A=
>>>=0A=
>>> Is this needed? I think we cover all of drivers/clk/ and bindings/clock=
=0A=
>>> already.=0A=
>>=0A=
>> I was not sure about that so I added the entry. Will remove it.=0A=
>>=0A=
>>>=0A=
>>>> +S:     Maintained=0A=
>>>> +F:     Documentation/devicetree/bindings/clock/canaan,k210-clk.yaml=
=0A=
>>>> +F:     drivers/clk/clk-k210.c=0A=
>>>> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs=0A=
>>>> index 88ac0d1a5da4..f2f9633087d1 100644=0A=
>>>> --- a/arch/riscv/Kconfig.socs=0A=
>>>> +++ b/arch/riscv/Kconfig.socs=0A=
>>>> @@ -29,6 +29,8 @@ config SOC_CANAAN=0A=
>>>> =A0=A0=A0=A0=A0=A0=A0=A0select SERIAL_SIFIVE if TTY=0A=
>>>> =A0=A0=A0=A0=A0=A0=A0=A0select SERIAL_SIFIVE_CONSOLE if TTY=0A=
>>>> =A0=A0=A0=A0=A0=A0=A0=A0select SIFIVE_PLIC=0A=
>>>> +       select SOC_K210_SYSCTL=0A=
>>>> +       select CLK_K210=0A=
>>>=0A=
>>> Any reason to do this vs. just make it the default?=0A=
>>=0A=
>> I do not understand here... Just selecting the drivers needed for the So=
C here.=0A=
>> Is there any other way of doing this ?=0A=
> =0A=
> Could use the 'default CONFIG_FOO' on the CLK_K210 symbol instead.=0A=
=0A=
Got it. I made this change for the clk driver and for other drivers too.=0A=
=0A=
> =0A=
>>>> +       writel(reg, pll->reg);=0A=
>>>> +       reg |=3D K210_PLL_RESET;=0A=
>>>> +       writel(reg, pll->reg);=0A=
>>>> +       nop();=0A=
>>>> +       nop();=0A=
>>>=0A=
>>> Are these nops needed for some reason? Any comment to add here? It's=0A=
>>> basically non-portable code and hopefully nothing is inserted into that=
=0A=
>>> writel function that shouldn't be there.=0A=
>>=0A=
>> No clue... They are "magic" nops that are present in the K210 SDK from=
=0A=
>> Kendryte. I copied that, but do not actually know if they are really nee=
ded. I=0A=
>> am working without any specs for the hardware: the Kendryte SDK is my ma=
in=0A=
>> source of information here. I will try to remove them or just replace th=
is with=0A=
>> a delay() call a nd see what happens.=0A=
> =0A=
> Ok.=0A=
=0A=
As mentioned in previous email, I kept the nop() calls as using delay()=0A=
functions does not work due to the early execution of this code.=0A=
=0A=
> =0A=
>>>> +        */=0A=
>>>> +       in0_clk =3D of_clk_get(np, 0);=0A=
>>>> +       if (IS_ERR(in0_clk)) {=0A=
>>>> +               pr_warn("%pOFP: in0 oscillator not found\n", np);=0A=
>>>> +               hws[K210_CLK_IN0] =3D=0A=
>>>> +                       clk_hw_register_fixed_rate(NULL, "in0", NULL,=
=0A=
>>>> +                                                  0, K210_IN0_RATE);=
=0A=
>>>> +       } else {=0A=
>>>> +               hws[K210_CLK_IN0] =3D __clk_get_hw(in0_clk);=0A=
>>>> +       }=0A=
>>>> +       if (IS_ERR(hws[K210_CLK_IN0])) {=0A=
>>>> +               pr_err("%pOFP: failed to get base oscillator\n", np);=
=0A=
>>>> +               goto err;=0A=
>>>> +       }=0A=
>>>> +=0A=
>>>> +       in0 =3D clk_hw_get_name(hws[K210_CLK_IN0]);=0A=
>>>> +       aclk_parents[0] =3D in0;=0A=
>>>> +       pll_parents[0] =3D in0;=0A=
>>>> +       mux_parents[0] =3D in0;=0A=
>>>=0A=
>>> Can we use the new way of specifying clk parents so that we don't have=
=0A=
>>> to use __clk_get_hw(), of_clk_get(), and clk_hw_get_name()? Hopefully=
=0A=
>>> the core can handl that all instead of this driver.=0A=
>>=0A=
>> Not sure what new way of specifying the parent you are referring to here=
.=0A=
>> clk_hw_set_parent() ?=0A=
> =0A=
> Use struct clk_parent_data please.=0A=
=0A=
I ended up using parent_hws instead of parent_names in the init structure. =
Using=0A=
parent_hws was simpler than using parent_data. That nicely cleaned up the c=
ode I=0A=
think.=0A=
=0A=
>>>> +=0A=
>>>> +       /* PLLs */=0A=
>>>> +       hws[K210_CLK_PLL0] =3D=0A=
>>>> +               k210_register_pll(K210_PLL0, "pll0", pll_parents, 1, 0=
);=0A=
>>>> +       hws[K210_CLK_PLL1] =3D=0A=
>>>> +               k210_register_pll(K210_PLL1, "pll1", pll_parents, 1, 0=
);=0A=
>>>> +       hws[K210_CLK_PLL2] =3D=0A=
>>>> +               k210_register_pll(K210_PLL2, "pll2", pll_parents, 3, 0=
);=0A=
>>>> +=0A=
>>>> +       /* aclk: muxed of in0 and pll0_d, no gate */=0A=
>>>> +       hws[K210_CLK_ACLK] =3D k210_register_aclk();=0A=
>>>> +=0A=
>>>> +       /*=0A=
>>>> +        * Clocks with aclk as source: the CPU clock is obviously crit=
ical.=0A=
>>>> +        * So is the CLINT clock as the scheduler clocksource.=0A=
>>>> +        */=0A=
>>>> +       hws[K210_CLK_CPU] =3D=0A=
>>>> +               k210_register_clk(K210_CLK_CPU, "cpu", "aclk", CLK_IS_=
CRITICAL);=0A=
>>>> +       hws[K210_CLK_CLINT] =3D=0A=
>>>> +               clk_hw_register_fixed_factor(NULL, "clint", "aclk",=0A=
>>>> +                                            CLK_IS_CRITICAL, 1, 50);=
=0A=
>>>=0A=
>>> Is anyone getting these clks? It's nice and all to model things in the=
=0A=
>>> clk framework but if they never have a consumer then it is sort of=0A=
>>> useless and just wastes memory and causes more overhead.=0A=
>>=0A=
>> The CPU and SRAM clocks do not have any consumer, so I could remove them=
 (just=0A=
>> enable the HW but not represent them as clocks in the driver). There is =
no=0A=
>> direct consumer of ACLK but it is the parent of multiple clocks, includi=
ng the=0A=
>> SRAM clocks. So it needs to be represented as a clock and kept alive eve=
n if=0A=
>> all the peripheral drivers needing it are disabled. Otherwise, the syste=
m just=0A=
>> stops (SRAM accesses hang).=0A=
> =0A=
> Ok it seems like these could just be enabled once at probe and then=0A=
> ignored? I prefer that as it's simpler.=0A=
=0A=
I removed the CLINT clock as it is completely unused. I kept the CPU clock =
as it=0A=
is referenced by the uarths device node. The 3 SRAM clocks are not referenc=
ed,=0A=
but I kept them as is as switching to special code for these instead of usi=
ng=0A=
the clock infrastructure would have just generated more code for not much g=
ains=0A=
(beside a tiny memory saving maybe).=0A=
=0A=
>>>> +       ret =3D of_clk_add_hw_provider(np, of_clk_hw_onecell_get, kcl-=
>clk_data);=0A=
>>>> +       if (ret)=0A=
>>>> +               pr_err("%pOFP: add clock provider failed %d\n", np, re=
t);=0A=
>>>> +       else=0A=
>>>> +               pr_info("%pOFP: CPU running at %lu MHz\n",=0A=
>>>=0A=
>>> Is this important? Is there a CPUfreq driver that runs and tells us the=
=0A=
>>> boot CPU frequency instead? Doesn't feel like we care in the clk driver=
=0A=
>>> about this.=0A=
>>=0A=
>> There is no CPU freq driver that gives this frequency that I know of. Th=
at is=0A=
>> why I added the message since the driver basically just comes up using t=
he=0A=
>> default HW settings for the SoC. CPU freq speed can be changed though by=
=0A=
>> increasing the PLL freq. Just not supporting this for now as it is trick=
y to=0A=
>> do: the SRAM clocks depend on aclk and PLL1 and if these are not the sam=
e=0A=
>> value, the system hangs (most likely because we end up with the sram ban=
ks=0A=
>> running at different speeds, which the SoC cache does not like). =0A=
> =0A=
> It would be visible in sysfs if there was a cpufreq driver. Can we use=0A=
> that?=0A=
=0A=
I checked and there is no cpufreq information is sysfs. So unless you insis=
t, I=0A=
would like to keep this message for information to the user.=0A=
=0A=
> =0A=
>>=0A=
>> [...]=0A=
>>>> +CLK_OF_DECLARE_DRIVER(k210_clk, "canaan,k210-clk", k210_clk_init);=0A=
>>>=0A=
>>> Is this needed or can this just be a plain platform driver? If somethin=
g=0A=
>>> is needed early for a clocksource or clockevent then the driver can be=
=0A=
>>> split to register those few clks early from this hook and then register=
=0A=
>>> the rest later when the platform device probes. That's what=0A=
>>> CLK_OF_DECLARE_DRIVER is for. A DECLARE_DRIVER without a platform drive=
r=0A=
>>> is incorrect.=0A=
>>=0A=
>> I think I can clean this up: aclk and clint clocks are needed early but =
others=0A=
>> can likely be deferred. Will fix this up.=0A=
>>=0A=
> =0A=
> Ok. Thanks!=0A=
=0A=
I tried hard with this one, but as mentioned in a previous email, there is =
a=0A=
circular dependency with the sysctl driver which prevents anything from bei=
ng=0A=
initialized if I use a platform driver. So I switched to declaring the cloc=
k=0A=
driver using CLK_OF_DECLARE().=0A=
=0A=
Note: I posted v5 but the clk driver patch 11/21 is "held until the list=0A=
moderator can review it for approval". The reason is the patch size:=0A=
    Message body is too big: 41706 bytes with a limit of 40 KB=0A=
=0A=
Palmer: Who is the list moderator ? Is it you ?=0A=
=0A=
Thanks for all your comments !=0A=
=0A=
=0A=
-- =0A=
Damien Le Moal=0A=
Western Digital Research=0A=
