Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30F702DCFC8
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Dec 2020 11:52:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726291AbgLQKw3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Dec 2020 05:52:29 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:59931 "EHLO
        esa5.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726012AbgLQKw2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Dec 2020 05:52:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1608202347; x=1639738347;
  h=from:to:cc:subject:date:message-id:references:
   content-transfer-encoding:mime-version;
  bh=Mea6mi2Qjl1ntkTbEoSzSsFIfsvwQiOUBfIAECLKn6U=;
  b=bPlzzxU4qZEkts7xU4ew9qAmZOy2lQvDXoILr+lnFQOvORh2Gdt9Ihx/
   JiV936I5FuOM2LXk3GdD8857Z5XL7f5oSL+QCRZaranoth5BT98Byoyp+
   TLg3rf6gt+xZIBPNuOnv3uSG2Fbga88BNulA8u0uQSXxPIdpcFfHAcu7m
   1dSMRglU2eoj34SIf9CjbikKbETRU6Ej9E5l3RnJ7Xh1iKnkRv166EkRz
   ZuWF5ae3nh3aCUj1d0ha5dq1iSab6CvayoluZcra3m7Fd/eBeSXmvploX
   KAD/nOW0CtJmHTubMP5AlGWCigVPd/xJnGT0taeSNiQfs3JTVGaPspu/f
   A==;
IronPort-SDR: PEkhZ1XdACEp4QxVbKXH5mE76NG6BEXRwyGeDNvWixkJELn6OUJG7mYlTNBloBBdhzBnqaOkCd
 9mhz+cENKkj4Q/Xembg4c0MlUdPvWSjvHB3lAPw0DGzxBFcF1Ci30E8GHNKPKuvlAZsYjGLNOB
 LT1d5fQMp0CNxIRoDT4cvXHttrs89cssl25eQn0C9JKU8WwpZRrbpYVJ+OIS92NMa9Zs4maYts
 4sM6ZCpERNEgTJZeRST5ucSig1gRVlzCeFYwTe0ip0KBDjIkr28QVo0JxHBNTlCyrZROCw0W+i
 cdA=
X-IronPort-AV: E=Sophos;i="5.78,426,1599494400"; 
   d="scan'208";a="155390685"
Received: from mail-dm6nam11lp2169.outbound.protection.outlook.com (HELO NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.169])
  by ob1.hgst.iphmx.com with ESMTP; 17 Dec 2020 18:51:21 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Acps/0yA2UKW1fkXcqxdQhwJC5UlCBcfy9yb4KQX3gyFau9I6Gyg14OCD/MfJhE4PhknGF53Kr89Sxh7nL2eJZMlpdctkCfNYsI0go9+bHvnr1QhYOto6ovUdq+ohdoMaipCsK6NNvMAQL99iW+Q/P8WbXf3a6K7i7crmGkrQQGLhqt1s9bceB+gDAr95ymFxgrUi4CKM1WI8BlOudVsT83VBXvlx5N2Caxat3jiin1sUiDBoNvM2dqt8XcYySmE1FCXkDo5oXYAlcmfVEIVD+WVAQ9IFHOuZ/GzQSIbv0fK0EOm6+xXxt/Wi1KYgchrd2+f/JF5qZHs4oiLmwgdKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mea6mi2Qjl1ntkTbEoSzSsFIfsvwQiOUBfIAECLKn6U=;
 b=H+XPF0DrPDdnZjMOocYsS0wELNYva2biZ8DNjGfschRTgX5ZV6L71okGBSKddLStrp3LiMQYFSJPMcXjhZORUs971LdbYE0dOgCXlNBNWeygsDUZgAqHENDmM91UxIF/x9AmWMegn7od9ll2IuEAOW5Zd0Is3ph21glsjdtTM0v7eqLHOzETMJlsDEBybJRO084U7iONEiQe2xqAR06CJ7AoWarV3GdChY0IVlGjtssVEfzRNPfOGwqLVLt94kKu8b1/lM4ERN88W9Dvq09OaxD32IwZCt93xndgBMX6DdhSktwshcKjlb7JswszlTYaGYr2dgyjzF8/me3Cm6Sl+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mea6mi2Qjl1ntkTbEoSzSsFIfsvwQiOUBfIAECLKn6U=;
 b=eCmGj/SXsEx2uarpX5WFEsO4loJEUXT1bGpKhSROR/mg+om2c3Grd1R9vsivQoF9Pw6asGzpOWNTPvnrWu9f2mhB9VcTmvoD82NVjuIm9KheP/cRyoPlYm3mDwq+pxexYEhpdtSp9M5LaGGq2kFicnNwkeiarfIl+IdDVtYHFfo=
Received: from CH2PR04MB6522.namprd04.prod.outlook.com (2603:10b6:610:34::19)
 by CH2PR04MB6492.namprd04.prod.outlook.com (2603:10b6:610:6e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.13; Thu, 17 Dec
 2020 10:51:20 +0000
Received: from CH2PR04MB6522.namprd04.prod.outlook.com
 ([fe80::897c:a04b:4eb0:640a]) by CH2PR04MB6522.namprd04.prod.outlook.com
 ([fe80::897c:a04b:4eb0:640a%6]) with mapi id 15.20.3654.026; Thu, 17 Dec 2020
 10:51:20 +0000
From:   Damien Le Moal <Damien.LeMoal@wdc.com>
To:     Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
CC:     Sean Anderson <seanga2@gmail.com>
Subject: Re: [PATCH v10 09/23] dt-binding: clock: Document canaan,k210-clk
 bindings
Thread-Topic: [PATCH v10 09/23] dt-binding: clock: Document canaan,k210-clk
 bindings
Thread-Index: AQHW0VcKSUc5JWucbkupBqEzxYwjig==
Date:   Thu, 17 Dec 2020 10:51:20 +0000
Message-ID: <CH2PR04MB652284F1607FD2A29275693CE7C40@CH2PR04MB6522.namprd04.prod.outlook.com>
References: <20201213135056.24446-1-damien.lemoal@wdc.com>
 <20201213135056.24446-10-damien.lemoal@wdc.com>
 <160819259979.1580929.9332027241734052085@swboyd.mtv.corp.google.com>
 <CH2PR04MB65227B0B94F919406CB84C28E7C40@CH2PR04MB6522.namprd04.prod.outlook.com>
 <160820021596.1580929.1686334340234415270@swboyd.mtv.corp.google.com>
 <CH2PR04MB6522E9EC44FF8FFA5981107CE7C40@CH2PR04MB6522.namprd04.prod.outlook.com>
 <160820216451.1580929.9401304620489565784@swboyd.mtv.corp.google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:a1c8:1127:b41f:9459]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 26f73fb1-957a-4e50-ffd8-08d8a279b07d
x-ms-traffictypediagnostic: CH2PR04MB6492:
x-microsoft-antispam-prvs: <CH2PR04MB6492A812DE52DD4DDC7F091FE7C40@CH2PR04MB6492.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9M8wJiHt2eL1HzeTDwZ3oRpBBDRug9G+EqyMI/r8fls8f4AM+ViBfEZtvqIX5GeDbjVc/V7Ik8MmUYilgXm90L+y66+aidxu/GMlEC7BfqZJwlHLZfQhqkcv/X6AghD1Rcr0/Z/AAGMqBIBjtbpbpLlmMWcXKhLX+U68vbcxE9WpiNAls1GSRvJ/OXeO/g9Q/o9sjFH2Njp14Gk4Y114/eGQRo6KiRgBgOiR8NswFunjhs9zy8pDqy2vyNl65H/PHlgFnGDBbB0jLwc0IILK41Us5vOPGQZ2/OvGM87V5CFePwgsYt/x6ymo1zsObxYGaAaOCOeiDwKy49mAkggRwg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR04MB6522.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(366004)(39860400002)(376002)(396003)(66556008)(52536014)(86362001)(66946007)(76116006)(110136005)(478600001)(8936002)(71200400001)(64756008)(4001150100001)(7696005)(53546011)(8676002)(7416002)(9686003)(6506007)(186003)(66446008)(2906002)(83380400001)(316002)(5660300002)(66476007)(91956017)(55016002)(33656002)(4326008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?g4VJt7iaiIUZXukOo76kKD8Vo/QpEKVJybsgm2pNE6dYRUZVhyZKAsmqucoO?=
 =?us-ascii?Q?nRuzVA8s12Xp+DeAju4niAVftRZJNDXnfQdh8B0cTZqyjr/Pk7gKWs6/BMRa?=
 =?us-ascii?Q?7DMENZzTJkbGDsMCSyzMHmP7dNpBwbgkArFOAK1c4+gI5zX7j7LDGnzq9qhK?=
 =?us-ascii?Q?DduRLNLsjM8ooOR5XBH8On9iUFpWVqTQ04XGgusqK9aR9iQJigMYzx20RIEP?=
 =?us-ascii?Q?Rxlap9NgahW6LU9/3LosxLKoeXsSpD6qroW5maHPf7yC/OK5fyUqrZbpxoq/?=
 =?us-ascii?Q?XaNmF8i6A6bCk7ZHxurVkuiLCDivvXJIkKnqEf9zOnvxZ6iE2TkAOg6yHMm7?=
 =?us-ascii?Q?LsBMKIfHPS1v0SDWXGRp6HmHR985Ica6WXO6A0zqKfnNe83ReKWYTjn9tOl4?=
 =?us-ascii?Q?vvsg2N3yPY126yz9rT2JVQnMoflt/6J0NYcQqjs3mfypC/Ge9TTfCge0qUpX?=
 =?us-ascii?Q?Mj1U4ZGV/rnp7qLbh8zzfx6q8/G4hewLhPSSDd4p+oCivcRHdHnAu4+8wdix?=
 =?us-ascii?Q?cchE2xHbMC4zxpEV+Wds8KnkZqVg00P2YpeZySdSwFkoh1wlL7tXkRn5QomI?=
 =?us-ascii?Q?RICHTrfFW2sEIO84JuY6kO/Fj00YD7ht1h4sSClsyaK5Af0VCraokIgjI3AC?=
 =?us-ascii?Q?IxWtRunAOnybc9gWZCOWx3/T7bdqBXfN2wwkCyv3QdCBEnhQSUsCNhVx+DZU?=
 =?us-ascii?Q?hPE3nZm3ipNR5WYZa6cbAz/fsy8C5/USLKPIjMwhyzGgTkWIIh0xDZPK7eo0?=
 =?us-ascii?Q?d2gw35zH+S1xT3zeT8/P0wY1bjfTuah30Acp1o4ZvZb8HeBaekXIKdVmrksP?=
 =?us-ascii?Q?P6VILGyAmlLntHYaNwhL0PY75LgS046HMdNOHM63agjAseGo6U+AUx9mH1Qc?=
 =?us-ascii?Q?Ps8HjDq/RmazygMW5BZHvl0mBlGryR7iHmURIHYJgpw3b5JXuEYaWTCyxezI?=
 =?us-ascii?Q?djIiqhcBnqu+mFFHaDrQsq1hEFzJNOQmvVN7ZZkfT5aRuyDqYsNDE9Og3BZp?=
 =?us-ascii?Q?c0BLEkfqhOONjWdZ1N+KGqlCoYe3yJZIumH6KHMS7Ydp2EGXtRd/+sIaPwUc?=
 =?us-ascii?Q?z1JGyf7E?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR04MB6522.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26f73fb1-957a-4e50-ffd8-08d8a279b07d
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2020 10:51:20.7948
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eoUc0bzXdJhX4GKHG33bGrctguS0l2MRgtB3objsspWdF0fJoujoHT6kGabE9A4c2l9zbWUpEEXzJdsdvslR9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR04MB6492
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 2020/12/17 19:49, Stephen Boyd wrote:=0A=
> Quoting Damien Le Moal (2020-12-17 02:43:50)=0A=
>>=0A=
>> I just did that. It works.=0A=
>>=0A=
>> Ideally, patches 7, 8 and 9 need to go in together with the clk driver p=
atch.=0A=
>> Since the builtin DTB patch precedes the clock driver patch that touches=
 the=0A=
>> sysctl driver, I need to rework it a little, keeping the=0A=
>> SOC_DECLARE_BUILTIN_DTB() for now. And finally, a small DTS update patch=
 needs=0A=
>> to be added too for the sysctl & sysclk nodes update. That would make it=
 a 5=0A=
>> patch series for the clock driver addition. Would this work ?=0A=
>>=0A=
>> Or, you just take patch 9 (clk doc) and patch 13 (clk driver), slightly =
modified=0A=
>> to move the sysctl register definitions into a common header (currently =
part of=0A=
>> patch 7). 2 patches only, without any other change, resulting in the clo=
ck=0A=
>> driver not being used until the rest of the series goes into 5.12. Do yo=
u prefer=0A=
>> that solution ?=0A=
>>=0A=
> =0A=
> I was thinking of just applying this DT binding patch now so it gets=0A=
> merged into the next -rc1. Then anyone can use the defines because=0A=
> they're in Linus' tree and wherever the dts file ends up can just base=0A=
> on -rc1. I probably won't merge the clk driver until v5.12 given that=0A=
> the merge window is open.=0A=
=0A=
OK. Makes sense. Sending just the clk binding patch then, with the K210_CLK=
_ACLK=0A=
clock definition left in.=0A=
=0A=
Thanks !=0A=
=0A=
> =0A=
=0A=
=0A=
-- =0A=
Damien Le Moal=0A=
Western Digital Research=0A=
