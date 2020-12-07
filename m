Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0C742D0F5A
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Dec 2020 12:37:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727566AbgLGLgJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Dec 2020 06:36:09 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:53093 "EHLO
        esa1.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727533AbgLGLgI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Dec 2020 06:36:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1607340967; x=1638876967;
  h=from:to:cc:subject:date:message-id:references:
   content-transfer-encoding:mime-version;
  bh=MA1dcWvI2+ETnPdNgJw+YRyww7lTOo9+XJHwMy4CK4Y=;
  b=c+CA6ESizdjPcMzTkhlkzK0ikAQOaUzUGe54XugmI+zewUP22uj0f+no
   gwveP8KbJ3Yyj4jaa3yjY9+irx7GV4eZj735zWVD0nHEifUEMSRs/2KXX
   40qqpr1f1ez/MfqQwVe0+SLLljWlConijJLXEdT55Gl3c+TiJA6TCa5ng
   RMKzwTfVhy8wgTbOjlOKNWWj/htP1WdMVN1R9XKQUcpLkEL3gsXNi2Dzg
   F49nHsy8qAp0tTqMs+SGDIDo4XUCun/CqLK207KHY9J+ejoCJKxMRrmjY
   2X5mqU6Q9xw7w0Zv4zNFE38w6ih+wcV2wkk0/PUFClbqemXaMZfGx3gqX
   A==;
IronPort-SDR: O+JyG9Mr/P21q/jBIlUgP5yRXb3OmeAXqLIsq3h9i2f1zrLJDUeE+brrRl8N5hlMIlIL/ZqOkr
 8a3bw/bm/ZxDa4je0S/YLHE71uvd3CM1BxSYvAZEfuJeACMH2Z4XvP9PmdKYSyKpJqDjJCbWQs
 H36HahRs+cBCxikDoU0vWcq9YFQHYDZPO1aphru1jAHa2CDPzwNGKpeFOu3zXyxRCZ6qF0KdXc
 9CLpOOvTjLvIJvk6H2nth9tDdS5D2yMX2DeJ1jNUF1tOPvw/ttf0Y+QEdmujrrHUKXcEu1EASQ
 tts=
X-IronPort-AV: E=Sophos;i="5.78,399,1599494400"; 
   d="scan'208";a="264747910"
Received: from mail-bn7nam10lp2105.outbound.protection.outlook.com (HELO NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.105])
  by ob1.hgst.iphmx.com with ESMTP; 07 Dec 2020 19:35:00 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WgvR651Pg570oxuDhNocRPrvcu1mVr9FCeVdzNa/l8ImL+EcvNBgJWT3crCo75OG4Fj87dY0pWIt8uWZ766JYJSjnPB0riRgFGO+Fx+JDWP69JsLcZZJ2rBoxc+QSoRWr3i6moplDNFbKEJ0XycBJ48fqKGCtD17w/fYEZViNSbSIFLdymQC0zOx4l/449dZGPfeLPNxV3xPoCdxanvS04Pi8WdiXjy68mlOeWLtY2+MhmITN82CmLRctvMs37Tg8hDysfWwTwDRLCIvjrjyeg1z5rOj5JfCj1lx0/Ug/rnybG05gVx9hyJsJMwy4LG+wK0c4K7xn7kaRtgcrsRtMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mbl/uptyxYh/VOmjAht7KBUn0qJFONs+d+GnrjMQJZ4=;
 b=lf7fEXFR5V4r21bsnFrzuNC8FRZ74v47f3m6eBIy0ax+VhPXnBXoymosJ6+/Ccd1BPADih7Hc+wrR/KPfzy8wg2GJZOZFwXyPZAudoH0VmOhuLJXtajlKvf6axPt0AaKuwswtAaxa5LKfl8LXoUCBehj4Z73yWxm9XGMkw70ebR3vLpaVO5fBNyoYqUFux3g3FYggvXuLIrvpLP1uknWQdbSIJKbFmBntD7KH2ZTo7vpftxYGXwbiNmIYqjph0B6jAlqLijx16UT27Kw/0dvrekn/M/88jS24KBSYdcRji018+wTB2N0yq8KNjns66TFiuR8TXPuxrC7GtEBpAVqPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mbl/uptyxYh/VOmjAht7KBUn0qJFONs+d+GnrjMQJZ4=;
 b=x9rRooGkHbxRIEbr0deeSDVAoL6ux97onNBjfsyDWqVN9+RlYmZ8npT+iOSU/zfV7zrWqOmndqJGV+/kdMTIYKy1XGGnLQdbRAHHRkLPFKMv0hm4kxD60aAiPBoSKvfeXMtg15rk5Dr7dNRueFRTzdITdujxd3OkWUdldSyWyFo=
Received: from CH2PR04MB6522.namprd04.prod.outlook.com (2603:10b6:610:34::19)
 by CH2PR04MB6981.namprd04.prod.outlook.com (2603:10b6:610:a0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.19; Mon, 7 Dec
 2020 11:34:59 +0000
Received: from CH2PR04MB6522.namprd04.prod.outlook.com
 ([fe80::897c:a04b:4eb0:640a]) by CH2PR04MB6522.namprd04.prod.outlook.com
 ([fe80::897c:a04b:4eb0:640a%7]) with mapi id 15.20.3632.023; Mon, 7 Dec 2020
 11:34:59 +0000
From:   Damien Le Moal <Damien.LeMoal@wdc.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "palmer@dabbelt.com" <palmer@dabbelt.com>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "seanga2@gmail.com" <seanga2@gmail.com>
Subject: Re: [PATCH v4 11/21] riscv: Add Canaan Kendryte K210 clock driver
Thread-Topic: [PATCH v4 11/21] riscv: Add Canaan Kendryte K210 clock driver
Thread-Index: AQHWyFrJ31Bqsdz07kaNo2YIn/vMLQ==
Date:   Mon, 7 Dec 2020 11:34:59 +0000
Message-ID: <CH2PR04MB6522DC4100CE6E3C6A6C00D1E7CE0@CH2PR04MB6522.namprd04.prod.outlook.com>
References: <20201202032500.206346-1-damien.lemoal@wdc.com>
 <20201202032500.206346-12-damien.lemoal@wdc.com>
 <160714919628.1580929.1456162330322523777@swboyd.mtv.corp.google.com>
 <b5eb9c289fe58119185550bff7228501d95b730e.camel@wdc.com>
 <CAMuHMdX+grQf=naU76Edvhbjap3BEayjDs_Rhkoy4FFfOZcTZw@mail.gmail.com>
 <CH2PR04MB652207D253E79755D87F55DAE7CE0@CH2PR04MB6522.namprd04.prod.outlook.com>
 <CAMuHMdUVfaWSY1Ohn-_VtOzG1VeQrDCfhHTtkahXy8HsGOTS1Q@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [129.253.182.59]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 436ea11b-acff-47e4-b575-08d89aa420f5
x-ms-traffictypediagnostic: CH2PR04MB6981:
x-microsoft-antispam-prvs: <CH2PR04MB6981F16E304E6B23692942A6E7CE0@CH2PR04MB6981.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jmgps0UrRcKwdm6UV15DVDjAN9r7EzWfmaZVXwfi8t/nnc5SYZLzqs2mzzZ8cTEyze5NhHOiBhBIMoG7/DGaXZRM67zuYy8pTmaFsEcQIu9KNp0UfRSROmyM47cQvcy/1GzRyM3wTsmhxJdiz14Zgxbi8/3q2iyrSJDs5TeOlrigVzlpRZEkhct48CNPSz4mrKrOCtaEB9K7KGPqULUGk1bMOkFR25pp1m8Qe5gnqwcrRKlpPRmOI19VgBTqC70is1JDT6o6pfeZL5rClWSH9J399zVr9mhsKUqosYCPylPFNH7Cu4dWghwcg9gb870l0xduz0Y2Du7CyU8QREdFAw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR04MB6522.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(366004)(39860400002)(346002)(396003)(55016002)(7696005)(186003)(53546011)(4326008)(316002)(54906003)(26005)(478600001)(6506007)(9686003)(6916009)(66556008)(64756008)(7416002)(52536014)(8676002)(91956017)(33656002)(83380400001)(8936002)(66476007)(86362001)(76116006)(66446008)(71200400001)(2906002)(66946007)(5660300002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?Fk6YNCGrX51N4jsmaQiUWWKVcIWLZ7Tr7wmdspKeSSNgiiaRcC2bVUDwAY05?=
 =?us-ascii?Q?cTP0EdjMK5xKlRjyek5zcPcMqjnLXh8kbXGHJFpa7XNSPo8u1Vak8upowA9g?=
 =?us-ascii?Q?E4k/iG3i3/qW6PcXwzBGJkoOvtUrKJV/DeMxXoUNMxs32xdptjfCIVmPDrDR?=
 =?us-ascii?Q?zc8XfxDN/WbLOqHM9S/2L+sIdrQZytpROBQ6OjM6QofC97wDwkAcLIadAjov?=
 =?us-ascii?Q?TzG3elzRDsZ7np4qt5B2gfrKEfsEh+i/oAUadBM4C+LiuTfQ2GxwNhaO26K3?=
 =?us-ascii?Q?UjN01F5PFeBrG+iGvwNgKGUGaL35m8tBt+SJkD7GkRRJ1akYVnpPk/92ftkZ?=
 =?us-ascii?Q?m54OXflbMwAgwJNZKQqVHyZNGYM7ffojXLUlaTNwN/VrQcOfuLpUc6zoA83r?=
 =?us-ascii?Q?JhKKGXafznzbSFH7H2fsWT0Xwyz/mCBjz285ZBzSax2GZkkLXWkICrf5+jQQ?=
 =?us-ascii?Q?LVKFGt3oQT1kMYqy+U6uWhWH1U6l+CYx1gGjppYGZQlPQfFqSZja0L5gQOsJ?=
 =?us-ascii?Q?oQpujDl6OqwCGnqsECBURUYg+cl877CptpLjGoa672ic5MBTbfwDtSnTHPuM?=
 =?us-ascii?Q?Bx8xPDpF5KOMevMYnV9UrPEL6DIsBHSeM/GieSLuu9z1DJqJTBasYKrGy9b4?=
 =?us-ascii?Q?yA1hsGkgPrjCvCy48xiDEkh60ozsN5Sa0UzW1j8IBJALToFvxFkKNIo/NpDJ?=
 =?us-ascii?Q?OEQ7DS0qW2wqjuP+Ba2MzF0BkG9qefSVyCkQinY30NRTUy5lyrrECfbK3tiV?=
 =?us-ascii?Q?DTcnVlE7vwyFwThnZz1nYlMcMIfV7lJgGK+H491iQewZT3UpqsCgXot5e755?=
 =?us-ascii?Q?Lc4MDdFQaNQEPdNpBPz+F/SRr7Kbw6ghLkqA3QAD5dKukO0qvTjvnFVByHpb?=
 =?us-ascii?Q?vJQ8zPy9qpHM1Es9JEwNIt/dTexOuj7UY+/Coc0Ec598VJf1BNmhV7FgNHnp?=
 =?us-ascii?Q?aZQIR9mdiY5SwM4fNMSW48Dzmk7YwTwr2Sxq4T++7LDgzHW4a/DMhuci2++v?=
 =?us-ascii?Q?shLD?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR04MB6522.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 436ea11b-acff-47e4-b575-08d89aa420f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Dec 2020 11:34:59.0366
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /eKDGsJp/pp5ky0eEe6GDcIabFHQrQZ/T9sMVGbn9K8gbBzaT4dWCINx1tU5BEcI9VPkEMhOmxbGbWoKtoT4xA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR04MB6981
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 2020/12/07 19:06, Geert Uytterhoeven wrote:=0A=
> Hi Damien,=0A=
> =0A=
> On Mon, Dec 7, 2020 at 10:55 AM Damien Le Moal <Damien.LeMoal@wdc.com> wr=
ote:=0A=
>> On 2020/12/07 17:44, Geert Uytterhoeven wrote:=0A=
>>> On Mon, Dec 7, 2020 at 4:52 AM Damien Le Moal <Damien.LeMoal@wdc.com> w=
rote:=0A=
>>>> I prepared a v5 series addressing your comments (and other comments).=
=0A=
>>>> I will post that later today after some more tests.=0A=
>>>=0A=
>>> Thanks, already looking at k210-sysctl-v18...=0A=
>>>=0A=
>>>> On Fri, 2020-12-04 at 22:19 -0800, Stephen Boyd wrote:=0A=
>>>>>> --- /dev/null=0A=
>>>>>> +++ b/drivers/clk/clk-k210.c=0A=
>>>=0A=
>>>>>> +       in0_clk =3D of_clk_get(np, 0);=0A=
>>>>>> +       if (IS_ERR(in0_clk)) {=0A=
>>>>>> +               pr_warn("%pOFP: in0 oscillator not found\n", np);=0A=
>>>>>> +               hws[K210_CLK_IN0] =3D=0A=
>>>>>> +                       clk_hw_register_fixed_rate(NULL, "in0", NULL=
,=0A=
>>>>>> +                                                  0, K210_IN0_RATE)=
;=0A=
>>>>>> +       } else {=0A=
>>>>>> +               hws[K210_CLK_IN0] =3D __clk_get_hw(in0_clk);=0A=
>>>>>> +       }=0A=
>>>>>> +       if (IS_ERR(hws[K210_CLK_IN0])) {=0A=
>>>>>> +               pr_err("%pOFP: failed to get base oscillator\n", np)=
;=0A=
>>>>>> +               goto err;=0A=
>>>>>> +       }=0A=
>>>>>> +=0A=
>>>>>> +       in0 =3D clk_hw_get_name(hws[K210_CLK_IN0]);=0A=
>>>>>> +       aclk_parents[0] =3D in0;=0A=
>>>>>> +       pll_parents[0] =3D in0;=0A=
>>>>>> +       mux_parents[0] =3D in0;=0A=
>>>>>=0A=
>>>>> Can we use the new way of specifying clk parents so that we don't hav=
e=0A=
>>>>> to use __clk_get_hw(), of_clk_get(), and clk_hw_get_name()? Hopefully=
=0A=
>>>>> the core can handl that all instead of this driver.=0A=
>>>>=0A=
>>>> I removed all this by adding:=0A=
>>>>=0A=
>>>> clock-output-names =3D "in0";=0A=
>>>>=0A=
>>>> to the DT fixed-rate oscillator clock node (and documented that too). =
Doing so,=0A=
>>>> clk_hw_get_name(), __clk_get_hw() and of_clk_get() are not needed anym=
ore and=0A=
>>>> the parents clock names arrays do not need run-time update.=0A=
>>>=0A=
>>> "clock-output-names" is deprecated for clocks with a single output:=0A=
>>> the clock name will be taken from the node name.=0A=
>>=0A=
>> Arg. I missed that.=0A=
>>=0A=
>>> However, relying on a clock name like this is fragile.=0A=
>>> Instead, your driver should use the phandle from the clocks property,=
=0A=
>>> using of_clk_get_by_name() or of_clk_get().=0A=
>>=0A=
>> That is what all versions before V5 used. But Stephen mentioned that the=
 driver=0A=
>> should not, if possible, use of_clk_get()/__clk_get_name(). Hence the ch=
ange.=0A=
>> Easy to revert back.=0A=
>>=0A=
>>> Stephen: I'm a bit puzzled, as you suggest _not_ using of_clk_get()?=0A=
>>=0A=
>> Another solution to this would be to simply remove the fixed-rate clock =
node=0A=
>> from the DT and have the k210 clock driver unconditionally create that c=
lock=0A=
>> (that is one line !). That actually may be even more simple than the pre=
vious=0A=
>> version, albeit at the cost of having the DT not being a perfect descrip=
tion of=0A=
>> the hardware. I am fine with that though.=0A=
>>=0A=
>> Thoughts ?=0A=
> =0A=
> If there's an external crystal, DT should describe it.=0A=
> Does the K210 support different crystal frequencies?=0A=
> =0A=
> Anyway, I'm very interested in what the (new) proper way of handling this=
=0A=
> is...=0A=
=0A=
FYI, I pushed k210-sysctl-v19 to github, restoring the use of of_clk_get() =
and=0A=
__clk_get_name(). No other changes from v18. I have the patches and cover l=
etter=0A=
ready to go as V5, but I would like to hear from Stephen first.=0A=
=0A=
Best.=0A=
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
