Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7696F2D5C71
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Dec 2020 14:55:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389680AbgLJNyI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Dec 2020 08:54:08 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:38693 "EHLO
        esa3.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389671AbgLJNyH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Dec 2020 08:54:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1607608447; x=1639144447;
  h=from:to:cc:subject:date:message-id:references:
   content-transfer-encoding:mime-version;
  bh=eS6SvZkNgQ7BcK9b6Ghm/mI8Wqp57UeYr6iq6V/Ts+A=;
  b=Qt9xqwzYf48aW8RZEm18SwWTCYH92oBnSRuWiAcBu66n9B0Hnic6+qRV
   vTYsAOc9n/zQ/+BjuQkSabPJ5T0HvWBPn6SPu7Fj3vIixa9aa9Jl1WDLf
   mkc/+U8eldDqR2yp4nv3ujITxdZr9s8obCLxryx8eC+zLlUvYJ0PF3v23
   ONyPMWGVxu+ht14huVtuWYVQXTP1Ym0ibd084oVvRl4XPx131+3gZpyRK
   zRjny0J1NmLq2PQgXRyhs8XIBOp6GxGjLazJCIlu/5DTGkfMBIUpAwcWm
   EHv+738wH2uHSLYYy5d+yCzmCHLz+uq8Lb5y2Ix7/DWyNgW4gzobXo0h3
   A==;
IronPort-SDR: qAYLc5Ffv5vZBfug700xoPTQ3Mi30GJ+wznC+1vSKU7LqrO6eWMvl7PDmpV2hxVVLS9chlDvMZ
 2LKRJTJs8pMs3VtvEO4sSwdvUhOXhU/sOYyEPJuWIgloFPGybOX5WnIcnqyHF8emoJ9HkLHWZp
 UEfxhn09XpJLTEg41HXPvrq+7W3XDWGqrglDhDgRjs8nwW4HVVO+Y5WZe9XMZfRGkEcbcCndn9
 V1USPSKwFKllUkqVAOgUSKdiiucm1RZ0PxmClQ+fwfLumaO7JtqNdlgNY1WBiG/cZJvLkh/9LO
 hso=
X-IronPort-AV: E=Sophos;i="5.78,408,1599494400"; 
   d="scan'208";a="159316023"
Received: from mail-mw2nam12lp2043.outbound.protection.outlook.com (HELO NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.43])
  by ob1.hgst.iphmx.com with ESMTP; 10 Dec 2020 21:53:00 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ettZddPeERq/uPaFauGYst/wLvo262+5hMV27t2qScum6xtQ2M8PzWdBsx7adEwSjKA/JcuEuQutPgnlldyeuJSVc2LyhHY6a5+7rXoQgpJVM506wLRaapuZ5HjP+araymOc56i5L0dOSd/rRLwABIuYIlHNHTPgPSdxt581AgyLg9FPp1DdgXoXLyIPUg1nsatk9ep20IcqmIzqudoP6vdOaID25aiUVyJBxLlLNxQGuy7Y1bxcPY3YETQOhiE6Q0Xh6ma6xR/v+eLEXGIqf8uhre1cCcZh57M1zN/49w0ssFMruz8zCJOSp+86P2BLZ8ulMpjPYfDNCNMIseTiyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p4ti17RCLoPz4K5CHhqDSWbcTr1eQiXCBQqxfUvWro8=;
 b=GU4oYpt6KHRNQ98HgwLm3wZBYTV37zf3br7yRft6YLOtV7hbgDEkzLNTbrPZuMXBbySJI3El0c169ytV3wPid4/wVc4VkrMMuXdq1Of01XqsUDnV4L0Dp6vWgBeK5/bf4k6JlQonKeN0RzZo+YdTMxkB1gE0M/R74MU4lGHpQiZlNvUV79o7bMvHH1HWJtJKFGY8WVNbhqsbNz9o5d6lBeaB7qysroh4/7rHK0J3VIunnzOpgLQvm+XSKl+bJvbNRPMRwCmfTlKNf2DI6dx2QE2w2l9pf8lgOimUiARmwFPSz86XP1ROPIBp9yOyscOoHq/75UuoeX8uRIyKEbXs6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p4ti17RCLoPz4K5CHhqDSWbcTr1eQiXCBQqxfUvWro8=;
 b=dRmssp4fRh5nQ+RhmLUIbH9K3i5YuZmLizWH6gJ7eIuZelZckV/YRhOzNKqkIsTxOJTa0IY7Vr47Zve/j42iyVqkPjkfe2xWn8QViiVn7l1VeOX+ouYzjvpA2tm3kXeLJzCOa+I8JDMKnMkw2dbjXYcb2QAjYm6X/wdedNta41s=
Received: from CH2PR04MB6522.namprd04.prod.outlook.com (2603:10b6:610:34::19)
 by CH2PR04MB7125.namprd04.prod.outlook.com (2603:10b6:610:a3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.18; Thu, 10 Dec
 2020 13:52:57 +0000
Received: from CH2PR04MB6522.namprd04.prod.outlook.com
 ([fe80::897c:a04b:4eb0:640a]) by CH2PR04MB6522.namprd04.prod.outlook.com
 ([fe80::897c:a04b:4eb0:640a%7]) with mapi id 15.20.3632.023; Thu, 10 Dec 2020
 13:52:57 +0000
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
Subject: Re: [PATCH v7 00/22] RISC-V Kendryte K210 support improvements
Thread-Topic: [PATCH v7 00/22] RISC-V Kendryte K210 support improvements
Thread-Index: AQHWzqYvKtn7lzf0bUaGE16+bO2s4w==
Date:   Thu, 10 Dec 2020 13:52:57 +0000
Message-ID: <CH2PR04MB6522B5386D73AAE564D8D98AE7CB0@CH2PR04MB6522.namprd04.prod.outlook.com>
References: <20201210034003.222297-1-damien.lemoal@wdc.com>
 <CAMuHMdVbU2kjKU3EVN5kszPc=VQcgzYLemV6AOyg+YyZBfc31Q@mail.gmail.com>
 <5389e421f884c43ff6a806ac4ec95b43a93d02f7.camel@wdc.com>
 <CAMuHMdVnR2E6+ANYuZLvsTW8Od4Sa=wDtjnio4h3z=W2ePPGGw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:5911:8225:c337:ee37]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 6ca7151b-7b37-4fc0-324a-08d89d12e66c
x-ms-traffictypediagnostic: CH2PR04MB7125:
x-microsoft-antispam-prvs: <CH2PR04MB712589654094F118DE76AC37E7CB0@CH2PR04MB7125.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8y9pVJVnX1Se3yiJMz3lZMjm6eDV5fGV8k0D+gqadTDkOePwNIemi8TuAgPsHby7LB/8z/0DIE8BHIKih7hfAhf4T4PL3JnKho8e/3RFsvHyQsVgx52+lbdU4r48xwAH11gTj2+mDNAKP1oDbOM6ieCnZyl9y4jFnt5/1eBA41vLwVxduWWZxPOrYe++w16d9+z0sATc8MKHunlkhJIXoxTHZ6bYAt02n5vYDDBLu92Jue984JKYszyiiiEh123BUxJw50FXcA56p2U7Wh1s2viDt1/8FGPQRgf0mfrl4W9pWeTKCoRyb5Rw/VFMELsAxg8PmNcWqbRYEJK3OeUugg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR04MB6522.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(136003)(346002)(8936002)(6916009)(71200400001)(5660300002)(54906003)(7696005)(76116006)(64756008)(66446008)(66476007)(52536014)(91956017)(66556008)(66946007)(86362001)(508600001)(4326008)(186003)(53546011)(55016002)(83380400001)(9686003)(2906002)(7416002)(33656002)(6506007)(8676002)(4001150100001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?vFWH+8OnHJW3yQA2yXkK8TiNPlAxEZNklnfvCNarQDJD1qKAsHQrNDdCjL1G?=
 =?us-ascii?Q?ZAcE4xgM5ai0gHMD7tFGcovPmIvV035uudcYiXzCKVQFL4XxfOdvB6uSR3n+?=
 =?us-ascii?Q?yL8lLVK/TUyDmqRvUy5FuNeuLPahQDcDxINMJmZCgDmizGiWhX0D0k6FFZbd?=
 =?us-ascii?Q?4iARM2zTpQtmpglytA1OQmwJE+CysOnKXshlGdy69G5TEmdxNT/ZV/Yjt4zq?=
 =?us-ascii?Q?+OtWuRk1OQIE4ZzAkP1gsMwqgFpPmzLfnDniAcEfokjmuvC/X0pT21PwMRwM?=
 =?us-ascii?Q?TCCg322ICm0YYuHg90w6PW85Pmz8EXYOr0uJ5XSmNby9fTAD75t5m+da4Jbc?=
 =?us-ascii?Q?Dfejf8L9kAfW9wPgSQArwx5BcfR3Xq1m3fEfFTjEAY3tD6PxMHM9shrGUACh?=
 =?us-ascii?Q?apqJIS9xak7j/sSexIY+5/9aFxg8E7ElK3wI/UCJzr9G1ozvKgR//ZeC7oR+?=
 =?us-ascii?Q?EFWl24EYwmzudigZbXSP+co3WsA/lVEWm+Ng2U0aHojQ/EQz++knasUNB22y?=
 =?us-ascii?Q?NWTFsRls884xQTEjtR5HZGd50z3QYNYSDncwdBPHHXDkGDO3MGxN/Uw30+ZD?=
 =?us-ascii?Q?JshCBv7Qb+/VpvLnS6vIrmkxNOb7lseI3jW3DRFaqSJn8BZmpIMG4+oPwiIt?=
 =?us-ascii?Q?DBH+f2yiWUj+bdU0GvBoPEtlDYqntSapoQxidYABb98ZOj2Z3TArKszLp3G4?=
 =?us-ascii?Q?c6vJfZFzUw4iTdkuzrnuunIcNkRTfqnxIq4v5HDy21m1eIkIhO2iJl9nfwAh?=
 =?us-ascii?Q?QgL/FPB4OK+LSCTZ484hJE6BPkaUjrHrHcWc6th2e8S5X5e+G3XjK/lRcNKL?=
 =?us-ascii?Q?nqRkRjHNWLOMUDiYBWRgPzX2jx6227+7bSDAHGQMctZyAnLDrp11NZ+gfcxQ?=
 =?us-ascii?Q?IS8XNyVKvhvdjL9pOMhUvQhiDKsa3QVdWOkOdY0Y7nWMOcNkvqkYsPH+pZg/?=
 =?us-ascii?Q?IlvKb1q1Wlossk/UG1Gl+z+xaQezE6k7F8yNSi4F/J2BEQLQ1CFgbw31qkvi?=
 =?us-ascii?Q?u5EhJVxPoBkLmEFkPpR2l3fz5kWaCc7LA4rfPpppQCNFdzftkdiLki5Ih4yk?=
 =?us-ascii?Q?s6lzHhCw?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR04MB6522.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ca7151b-7b37-4fc0-324a-08d89d12e66c
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2020 13:52:57.2652
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sq0y1/HXEsGjsFhitPnrqWH9Nhvf73Z2fIgh1XisVDqcgc9+vwVnC1ebW6tOmrxQaVU/1IMiiLlYMJU+yjTFCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR04MB7125
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 2020/12/10 22:23, Geert Uytterhoeven wrote:=0A=
> Hi Damien,=0A=
> =0A=
> On Thu, Dec 10, 2020 at 1:36 PM Damien Le Moal <Damien.LeMoal@wdc.com> wr=
ote:=0A=
>> On Thu, 2020-12-10 at 11:04 +0100, Geert Uytterhoeven wrote:=0A=
>>> On Thu, Dec 10, 2020 at 4:41 AM Damien Le Moal <damien.lemoal@wdc.com> =
wrote:=0A=
>>>> Changes from v6:=0A=
>>>> * Annotate struct platform_driver variables with __refdata to avoid=0A=
>>>>   section mismatch compilation errors=0A=
>>>=0A=
>>> Blindly following the advice from kernel test robot <lkp@intel.com> is=
=0A=
>>> not always a good idea:=0A=
>>>=0A=
>>>     The variable k210_rst_driver references=0A=
>>>     the function __init set_reset_devices()=0A=
>>>     If the reference is valid then annotate the=0A=
>>>     variable with or __refdata (see linux/init.h) or name the variable:=
=0A=
>>>=0A=
>>> If your driver's probe function is annotated with __init, you cannot=0A=
>>> have a pointer to it in the driver structure, as any binding done after=
=0A=
>>> the freeing of initmem will cause a crash.  Adding the __refdata merely=
=0A=
>>> suppresses the warning, and won't avoid the crash.=0A=
>>=0A=
>> Hmm... I must be misunderstanding something here. free_initmem() is call=
ed from=0A=
>> kernel_init() right before starting the user init process. That is late =
enough=0A=
>> that all drivers are already probed and initialized. At least that is wh=
at I=0A=
>> thought, especially considering that none of the k210 drivers can be mod=
ules=0A=
>> and are all builtin. What am I missing here ?=0A=
> =0A=
> For these specific cases, binding is indeed unlikely to happen after=0A=
> free_initmem(). In the generic case that is not true.=0A=
> However, you can still trigger it manually by unbinding and rebinding=0A=
> the device manually through sysfs.=0A=
=0A=
Got it. Sending a v8 with the correction.=0A=
=0A=
Thanks !=0A=
=0A=
> =0A=
>> So I think I will go with option 2. It is simpler and safer. We can alwa=
ys=0A=
>> revisit and optimize later. I would prefer this series to land first :)=
=0A=
> =0A=
> Right. Correctness first, performance later.=0A=
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
