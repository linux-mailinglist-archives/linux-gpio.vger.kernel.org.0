Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D2812D0DD5
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Dec 2020 11:15:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726023AbgLGKPN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Dec 2020 05:15:13 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:39620 "EHLO
        esa2.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725802AbgLGKPN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Dec 2020 05:15:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1607336953; x=1638872953;
  h=from:to:cc:subject:date:message-id:references:
   content-transfer-encoding:mime-version;
  bh=TKlF9Ve3UQm9yNQf3GgdBc6SiV4MkIjaM3csDi8Ev/M=;
  b=iTGiy6gcftyAJMvo+yHRAdtgWST8ctiSXWJZZ3SS2nyFUNb9qVTsCkIt
   j17TjSJec+i9faCcxcQ0KzoJHdp4XrV0CpQMqHLa+Bi1QG7P1aiVxHcYT
   +Tf0Duwwiv1vIckIKp7h4izYdI4JE9r8MYIaZaeVQYKyqup2hdlfHrxXV
   F61vk5JdCfNHPw0BrRzHyL1lbWKNCQ3WYIsx+w9Crm62/bMvW+GddHkrw
   LXZGvM6sGqgRCwPLEs/di6ynckjooMBE5ImbBRYIzEM4OaiOyY/jXLQTQ
   MPY3xhNIaSyDF6/1sV2QdLgdEM+P5igsxK330pFpsmFOkJUmaMduEMv5M
   Q==;
IronPort-SDR: 8xfvtNMTIU031/x0ZSEYdirqiS+heSgwGWXnZ/jIg3iGPZubLWY6ijccAKs1TPzFfU67xZNS5A
 F8mCQsyZZPqtRwxnpIbT5D+XVeRS7x6PLtaxb9Utj5K0DLxN9MaGY+Z6F921qpdwVzlnSc29dv
 2Dt9ujDdYowAFUiOLz+Ygiq9XPjR/dKp3pU1KJOKzOvaoofNYBRp7HNe/tAt8ZN/rNnu6R8KfX
 daPNC6xKQqCvncgezUh/EwEvNtu7N8x9PXFN3lwkYG7GmQsZGQuWACx8yT0B0NCCKJYJ/RAHi3
 YaY=
X-IronPort-AV: E=Sophos;i="5.78,399,1599494400"; 
   d="scan'208";a="258303014"
Received: from mail-cys01nam02lp2051.outbound.protection.outlook.com (HELO NAM02-CY1-obe.outbound.protection.outlook.com) ([104.47.37.51])
  by ob1.hgst.iphmx.com with ESMTP; 07 Dec 2020 18:27:33 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J39peqEOXQuxJrvXI1yQh5WL2xfXw2yfOd3oAd/JvAFF7Qp1xP3HfIp7veg5+k9fUTGBURDdCSrG1E9f/b82vGrwCp8MN+fePwMGvvWIk7nqMmn5JqfC1wn/89FCYNzzNyRovW2SxoQnDa1xI/pv5TgxROGHgrncxFyi7lifVEydzGIMF5T/5BuwtegnyUIJNSkljqPKxBhAcVN8nrsi0Sw9ecH4Yx1Ifdc/eU0/dNg6r11B8FIQqGAgg0158s0melQjJX+P+xHLycXsaRfwcTwqJxx6cfG9a7aJ1YmFc3Gac1IPZN57Tg+Lm+34A2awY2rYbTL3cmF1BFzuMsTpxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AvHXz3OFm4hH6tAM4tc/39aNgsGRPaXM952mzLqgjBY=;
 b=Bwr5UT7290UfEQ54L2HvP1KBC0mD1dDeLl1Kq6ItblIDsmIpqQwj2T7nKbvVYBuHUJNtnzj0cb1rW10JcykDgUXV74FkEtXJifmCGugVOY3c5JvDZ9fgc7qYj5dcu340VeEm0mSow0hAHtyRoBztXxO9FCkOjAHehlaCfcfZyWSBF3378dpLbqGPB/aEordiZluUz+Ax41kwVWBk62n9EEpSHk7CL4MQyJswGQDsGQLMIoufguhe36Geb28SctDlx1Jai+UwSSGSdF8T47f+2crUWq6chHPg08+XM8qrqSw+pfPcnYCZphiKNPoRPTxnJiXfMCFYWMW14gaq7cvl2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AvHXz3OFm4hH6tAM4tc/39aNgsGRPaXM952mzLqgjBY=;
 b=jRnDsI0Sx25h45MnfUFOPvqvssMZcot/gLdhk55AUmLNmoSDALpQajnSP5Q7eBSAoFTLGvq7XkrRlyAkD1zznEqFpbujnJ3h0cOjg1GvcreJ9Em2wKD2nfWKjX/12FcqTJXWDmVu0FDB3DrB9bRT3GTugHGttcAegjlNuy0Kvoc=
Received: from CH2PR04MB6522.namprd04.prod.outlook.com (2603:10b6:610:34::19)
 by CH2PR04MB6965.namprd04.prod.outlook.com (2603:10b6:610:92::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.21; Mon, 7 Dec
 2020 10:14:05 +0000
Received: from CH2PR04MB6522.namprd04.prod.outlook.com
 ([fe80::897c:a04b:4eb0:640a]) by CH2PR04MB6522.namprd04.prod.outlook.com
 ([fe80::897c:a04b:4eb0:640a%7]) with mapi id 15.20.3632.023; Mon, 7 Dec 2020
 10:14:05 +0000
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
Date:   Mon, 7 Dec 2020 10:14:05 +0000
Message-ID: <CH2PR04MB65224960F89E4EB1CE253743E7CE0@CH2PR04MB6522.namprd04.prod.outlook.com>
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
x-ms-office365-filtering-correlation-id: b9691ce1-5306-43f2-8d29-08d89a98d3fc
x-ms-traffictypediagnostic: CH2PR04MB6965:
x-microsoft-antispam-prvs: <CH2PR04MB696560DAC51E4D5C1431A074E7CE0@CH2PR04MB6965.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6p/cLN2ASHgt/34UjduUOF+m/cgGiezFA7FuBun217c6zXuBNNr0j7xbud3qEBFU55gpktiZXTdZ93kzeWpzIicr42oH5sAC7Tvgtb1wFrcWZ24LjIcgs5MW5qOSeyDTL+vMf1QHBfrFgTGOIcgWE/JB5Bm80uR7M5ReapnYhMPSoB46vxGQ4ZYR43ZbvXalYoQp3MHQYBBqefB2yLhpcgkT0y4xe5d78pYbpdnEdAjMMuIIzwEHZKTuRB8LIg85z26icTvuQDU731yJ+VsHROoim804ZRQce1TrpzogQt2r6/ua1wXWYtmXlQcy901i3RnHNkq6+BgoGZqZ4mA/6g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR04MB6522.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(366004)(39860400002)(396003)(53546011)(4326008)(26005)(6916009)(66446008)(66476007)(66556008)(186003)(66946007)(8936002)(316002)(76116006)(71200400001)(5660300002)(64756008)(2906002)(54906003)(52536014)(91956017)(7416002)(8676002)(86362001)(478600001)(9686003)(7696005)(6506007)(55016002)(83380400001)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?vywSGwEVrGFArFS3eWtJDUBp1U+rol7KNXAAAWDj1eU+Kz3ZNdZ9tyx52i7T?=
 =?us-ascii?Q?yx0DgG2AGPjTG5eMQANTYuvz98PhG43L7oWSS/Vg6qqO7MDT3G2V+DbUQBQ6?=
 =?us-ascii?Q?vnjA7fmHvKcCxej8dAb6pfKm2UCLylHjNb/BPbHnjmLYNNCJ4Y0J4EduNWDv?=
 =?us-ascii?Q?VgGSbmJUOOMMrGYNgkcBSB4AX6833rhzBg257pY2qeLzAhRhqgvJx+76vr5D?=
 =?us-ascii?Q?l68RxaIjuN5YBS12lSDxPPfWKq84aWdQXh0xo123bhvorlS2hW77YBKA0hiJ?=
 =?us-ascii?Q?7SAt7jjSsaweGWukYSyxEzwiqPVU6XQcBTfgLIs3WAwxTR/j13LquSh6+uCX?=
 =?us-ascii?Q?jSvSBNjBapCYCHMmUO3E6K8E4zJjASsL0JLYBR7X5diOJJQ1sd9X46it+vNb?=
 =?us-ascii?Q?1l2vUm1V9rsJi5cn5VuSnVPVPjXklwBC5E4qxAymfUbruyBUF88Y1w0cJ3GH?=
 =?us-ascii?Q?2G5663HveZ6D0Obzfxl+ro9ldPFPCTlL9Xin9FhfE37GrWB3+q/3AS2gW/kL?=
 =?us-ascii?Q?XgH0LHLFI9ikTg498k3CMMmlYNrCFlujym1BYFjdcHWA0PMGrQRyFDwALols?=
 =?us-ascii?Q?i7HrSOjbAl8IJs6hf/9N0IQhmeEUNMzPcrvANndnkaYSjzlaFNpE1zIoPKkB?=
 =?us-ascii?Q?ptVcSMA4531cW52WcpXdx41oNTisr9Mi8IEMguLXPC/yD3VCEuSK3maqM5RN?=
 =?us-ascii?Q?ndaZu2vW/eE08VPGk4pwer5TTUwx5Hr0wmA+stkDNK7fPziaTEP2PYAkgeKA?=
 =?us-ascii?Q?Zje1BC281lRCOC9nAzn6RAeyjUhegSeC94tXEpOPnUEElTX3rmpeM8jV1QGz?=
 =?us-ascii?Q?12k1HDR1JjH2WReUfoIdw2M6lFyf8p0jXYtrMERpaw1GBICm/MmLOXAnRNWb?=
 =?us-ascii?Q?Y1v8ViemYeA+/bCnAb9fe4cO4xlFLitUqQBEja4Km/akzcadY33nvLzqWb2G?=
 =?us-ascii?Q?ynVIXr6VRkSXhb28opnNfi2hsNXu4xXQL+9lw6cZrxdwEbhh6Tgs/IinLWQD?=
 =?us-ascii?Q?l7R1?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR04MB6522.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9691ce1-5306-43f2-8d29-08d89a98d3fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Dec 2020 10:14:05.4617
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: el0bCg6tJeJa6D50DSTVpi2BBf9z7lApO0goDyWKrKKTbOw2TmLbFDvEGgR7Bw5ZRkwyTukpDjJB7sjFgvluVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR04MB6965
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
=0A=
I am not 100% sure if this oscillator is part of the SoC or if it is an ext=
ernal=0A=
input to it. Probably not. Hard to tell by just looking at the boards. I ha=
ve=0A=
the boards drawings though, so  I will check. The frequency seems to be fix=
ed by=0A=
hardware: frequencies of the PLLs can be changed to change the CPU frequenc=
y,=0A=
but the Kendryte SDK does not point to any way allowing changing the base=
=0A=
frequency of the oscillator.=0A=
=0A=
> Anyway, I'm very interested in what the (new) proper way of handling this=
=0A=
> is...=0A=
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
