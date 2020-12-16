Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66BEC2DB8D1
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Dec 2020 03:13:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725710AbgLPCNd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Dec 2020 21:13:33 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:56725 "EHLO
        esa6.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725208AbgLPCNb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Dec 2020 21:13:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1608084811; x=1639620811;
  h=from:to:cc:subject:date:message-id:references:
   content-transfer-encoding:mime-version;
  bh=nIqFSKX5K0rHm0QqOgZV0+YiD7mul09KALIoGZkN06M=;
  b=SustOhSWoZ06uvl2Wc7Wzu1mEI0DDEfpMj4gIiHpFlzUG/bVdAXxcO/z
   PSrk0bbFL4pmq4SlpOhrwzNwscM89SPNMEdOqLEi5JJ89KLpxpQIM36Ro
   0p0vmVyXItnCEhAPzuBLsdrsEWhQzz6UO/Oa6IN6luN3usRmgkm88105D
   rBmDhpI3OTM2LWiM9j8zz6TbhGqQ5tGLasVHvMNA/3NAE9npBg4RYeKiy
   xNahazwyM0FTYL0sn4MYBp3tLaGiNYI2IE9nUJO4A631rIr+af9QYaBa3
   OnHeYxfMGAqFTuOYprOEBabrRuyKbFAh6zlOhx6Zr/YHo8vkZ6e2netzt
   A==;
IronPort-SDR: kQnBMiQzNZlLSE6REwX2VaVmLs1MTMU4X2Q0DIrZEP4YCUGDJXQeJNVA3MuMBe2OocupaafTya
 3VobqpEtZ2Yt4skG7nyTeyI1N6MKExLbarwvrKPBIaR26ZCOZ7vmxeTYmUlhKeyZT+1Jm1MluZ
 1MnjOhAMUI0/TgFL9mi6hAX6NZtznFUrWqXkiwhn7A2AwgPtXpvwoD+N6jpdUNh1rpm/qp8Qxn
 YVmIgkOU/uqJqOYhCYr0uPLEf5ihX8GqCEXka1ehluosz1NQD8XTHhOYJScdetUdZrn7nZZNLi
 8z0=
X-IronPort-AV: E=Sophos;i="5.78,423,1599494400"; 
   d="scan'208";a="156449137"
Received: from mail-bn7nam10lp2106.outbound.protection.outlook.com (HELO NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.106])
  by ob1.hgst.iphmx.com with ESMTP; 16 Dec 2020 10:12:25 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QzjWuRnzzMM7JbbBLfrJzjEq2YGBUww5Ohv305s8mKvNQJ4nX+S1HdpiHrWTOALEuIgJ5JFVoOKbDcrU8J/NkwOFY2dVR+y6thgWaIwdtnmyU+c1k29HOrXrQ/Z4bnjjwbF/Z2iWOD2U5gUHFi/UqHNp43NP5V6izwpKHBvoQHK46blvnKfUqPyRqYjVCXRRcI7suhTNNZJZiYqq2rsLdz3OMUWFzJyMexNMKj8HXdUYbSsxrAE9IL7n5hoqBjISPfszk86xJhqqEmRD2ut7UXei0fQ9o0V6lGKBimxQ6UIP5gSfEQbJJi7q8ppdxq94DYMJ7kimfAcG4HINlhCRlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H9aqbn6g38ePO/67TtHb+gDiq5b0LzLvgbtuFbO33EA=;
 b=G006razoNY6tiXqqr6SmvM+h57d0Jp8/eNxa13OQBNl/RptkfTA+ZpCj+4qjsjBG9hFlLpswm7rnTNI3fIc/WsGSSUSWsG7uqjUeJ4J2D52XCaX1VR88gY/zUCTBWcL0uNUK8L33AwoxMev0FDi3EGdSRYV2KvICI1fxZGKkGiUI1MKNN8buQGxKH0ANCsWXEcUxlD1x+DbVPpeyd6a4IUkPJX/Lel6rcducesiwHRNJGzU+USw7ecMoDV4H4Nowb/vDPEdUEhjxGh69C/Gyey+aeEt46AH+d4SRtx8k+oP3AIOa0rHcaOerbfxOzwIBlS1ZngPCMpkqGmhg/aa+Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H9aqbn6g38ePO/67TtHb+gDiq5b0LzLvgbtuFbO33EA=;
 b=haD/qXbAXClsn2pE77pxBjJFPi5TGb5Xk/RJxPG1seMTFAWnzfP/g1JE04zoO0xqKXaINqc8H4af1uEwrSwAdv3uG5kzz7OFBuk7NT5WFuMqQppfcUAcCtLihKMYoV8SUkzobCfNxhnb/ECsPIpsMBozos3fcYdF7cs4xF5u4eE=
Received: from CH2PR04MB6522.namprd04.prod.outlook.com (2603:10b6:610:34::19)
 by CH2PR04MB6824.namprd04.prod.outlook.com (2603:10b6:610:9c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.14; Wed, 16 Dec
 2020 02:12:24 +0000
Received: from CH2PR04MB6522.namprd04.prod.outlook.com
 ([fe80::897c:a04b:4eb0:640a]) by CH2PR04MB6522.namprd04.prod.outlook.com
 ([fe80::897c:a04b:4eb0:640a%6]) with mapi id 15.20.3654.026; Wed, 16 Dec 2020
 02:12:24 +0000
From:   Damien Le Moal <Damien.LeMoal@wdc.com>
To:     Palmer Dabbelt <palmer@dabbelt.com>
CC:     "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "seanga2@gmail.com" <seanga2@gmail.com>
Subject: Re: [PATCH v8 00/22] RISC-V Kendryte K210 support improvements
Thread-Topic: [PATCH v8 00/22] RISC-V Kendryte K210 support improvements
Thread-Index: AQHWzv0+AkP/QAM3bkK0BMKIxWgl6Q==
Date:   Wed, 16 Dec 2020 02:12:23 +0000
Message-ID: <CH2PR04MB6522C3DA1FB852D1946AF916E7C50@CH2PR04MB6522.namprd04.prod.outlook.com>
References: <mhng-bdf9260d-0bbf-42e5-b32e-c75b870227b9@palmerdabbelt-glaptop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dabbelt.com; dkim=none (message not signed)
 header.d=none;dabbelt.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:a485:d5fe:a448:e314]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 9e41f83b-2aaf-4f30-ada8-08d8a168071c
x-ms-traffictypediagnostic: CH2PR04MB6824:
x-microsoft-antispam-prvs: <CH2PR04MB68243955BBD1CE68E198D85EE7C50@CH2PR04MB6824.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:1186;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rUkOpQo1srSrLCYW2FwA+MoQ9kw/9joObc3NVi1+C81t91QdeCACIQFJ3UQK3zCHDBGU+QF+xZZ37cZyTIYnlLTEIjsvm6B2fpTGrI8HzdHB2Cd67DfjRlW0AR+aeRO1m7II43ErHc/4f4Wt4uZH52riReBGY2sZJz0NnZrJkNfep2CfN42yakG46Yjn/qime8vVS22vFw/xm+R+r3tYAC6z3zW1mf2vz4WTB/3/tbP+jug2GfOXUybcZ9G+Ofa57Iv9Am4ZeA5CxwqN2Hfi5dRS1XkqviENrHYx3y6Txq+tX/GnT3B/YuHral9t11lDpBnY/vySna6Z53jQ3tbBEBU66HVaWsX9NnQswOOeUsA7E3z+p+dr0nfd6XJvYA4Y2tN7Wil5MF80fLzy/v+bhg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR04MB6522.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(136003)(39860400002)(366004)(346002)(8936002)(91956017)(52536014)(54906003)(4001150100001)(55016002)(316002)(33656002)(7696005)(5660300002)(76116006)(186003)(9686003)(2906002)(4326008)(66446008)(66476007)(53546011)(66946007)(86362001)(83380400001)(8676002)(966005)(6916009)(7416002)(64756008)(66556008)(6506007)(478600001)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?/KH4JvWJ/mFbgst8GG9LqOtHGx14z/sV52SwCkLutDUgDofDR4JC9DKM5EY6?=
 =?us-ascii?Q?2Bo3cfVS9Ht/oCeOVNIkrXGNJS6+ram0DTduHbWspOGZ4Exg3wgsJFj6bruU?=
 =?us-ascii?Q?yGsCIitMXKIS5qcw6a1Y6a/toAxZvCl9gK/WKLOEtK1pjmZ44sAn3VfxCaV8?=
 =?us-ascii?Q?spUvSFWMy4Wp2vU1veTDU9Ty/PdI1cXTXEJ1jZ2uKf4ICSmbJjtzP2Pvw84y?=
 =?us-ascii?Q?yfRGQ3/ntWWXmOqSbCIDQn2Fm+gzrSJINqSskXo4bBDqVzxOBlvsQfAjLIYy?=
 =?us-ascii?Q?So1eRMKd/Jnw+kQ9ROJk7QBxvMUjMtI3Kd4jYAvviyoRNgGIbk3o40T8Ir8U?=
 =?us-ascii?Q?XXwn/7UmWW8o+LC6G+s5Y1pgWfm3CbpHMEsRI7Vz5FNaT0hQwSaaK7m/g59A?=
 =?us-ascii?Q?dbQmLEp2EMI523m77t3CU366ybTF+UaMcsyqYHnlWJuU7t+hAcUVvBfl5IYp?=
 =?us-ascii?Q?/Hmh1Nm29vD/RoUAT3HF/b0lBYBn1EXviKo3gKcrZ4hYvWm9gWruMKjVWGX+?=
 =?us-ascii?Q?HETrbCnwAarSLovOOGtvrui+qN5b93MBQTtc3E9eVg9KHN7G1ySPk4SROw+5?=
 =?us-ascii?Q?HabGrtT6k7KCpNJa0JwMmVexkyq/K3W8/3zsUxXRKyvHsXcA6bGsE2HekMbt?=
 =?us-ascii?Q?B+r/Pyrgfdb4Rw1V74iWPlK6I/6tgw6uBY5UxTAaJVz+xtcbMufb+8odKYBH?=
 =?us-ascii?Q?Rj2q1Fvctj9kRMRB5qynkQwXYMQcIVpnG+8evfiFSokmHtiRCUNCexvNnCMr?=
 =?us-ascii?Q?QoiN4VMF6wCHiSKjnOau5YWsIbB0JITOu4SsyxK5Ci6uu9VRq728uoF234Z5?=
 =?us-ascii?Q?DMAsSGAhJyxFTJYFP6P4/Nz4BQRqy6UTTyXouMpYCxVc1hlL1LmkEaYrjcuE?=
 =?us-ascii?Q?aL/98rj4ETw5MmlDCUZYVEaIf30Ydhfk6qctbN/adlqFDRP2P9advK8pGAYc?=
 =?us-ascii?Q?z20wtujPrRf/hZLEelDTxxcm9YUcpiEgBwPktzkS9Z4iNcZBsZhwurjgUF9E?=
 =?us-ascii?Q?js8nEizQJjDvY/zXK3fmLa6Tbh8wpz+Aqf283KpIT5fe6tzadfNA7ejoNwAA?=
 =?us-ascii?Q?Ks+FXy55?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR04MB6522.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e41f83b-2aaf-4f30-ada8-08d8a168071c
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2020 02:12:24.0119
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FUInlzIj/CYyqanMO6+Majve/lWCdugmgHMd+SSfcoiMzi1MQGT/cJX0F5m7qpESSm5SlmYIFyLyTOdHsQDFfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR04MB6824
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 2020/12/16 10:43, Palmer Dabbelt wrote:=0A=
> On Sun, 13 Dec 2020 00:06:22 PST (-0800), Damien Le Moal wrote:=0A=
>> On Sat, 2020-12-12 at 22:04 -0800, Stephen Boyd wrote:=0A=
>>> Quoting Damien Le Moal (2020-12-10 06:02:51)=0A=
>>>>=0A=
>>>> Finally the last two patches updates the k210 nommu defconfig to inclu=
de=0A=
>>>> the newly implemented drivers and provide a new default configuration=
=0A=
>>>> file enabling SD card support.=0A=
>>>>=0A=
>>>> A lot of the work on the device tree and on the K210 drivers come from=
=0A=
>>>> the work by Sean Anderson for the U-Boot project support of the K210=
=0A=
>>>> SoC. Sean also helped with debugging many aspects of this series.=0A=
>>>>=0A=
>>>> A tree with all patches applied is available here:=0A=
>>>> https://github.com/damien-lemoal/linux, k210-sysctl-v20 branch.=0A=
>>>> A demonstration of this series used on a SiPeed MAIX Dock=0A=
>>>> board together with an I2C servo controller can be seen here:=0A=
>>>> https://damien-lemoal.github.io/linux-robot-arm/#example=0A=
>>>>=0A=
>>>> This tree was used to build userspace busybox environment image that i=
s=0A=
>>>> then copied onto an SD card formatted with ext2:=0A=
>>>> https://github.com/damien-lemoal/buildroot=0A=
>>>> Of note is that running this userspace environment requires a revert o=
f=0A=
>>>> commit 2217b982624680d19a80ebb4600d05c8586c4f96 introduced during the=
=0A=
>>>> 5.9 development cycle. Without this revert, execution of the init=0A=
>>>> process fails. A problem with the riscv port of elf2flt is suspected b=
ut=0A=
>>>> not confirmed. I am now starting to investigate this problem.=0A=
>>>>=0A=
>>>> Reviews and comments are as always much welcome.=0A=
>>>=0A=
>>> What's the merge plan for this series? I'd like to apply the clk patche=
s=0A=
>>> but they're combined with the sysctl driver so I guess I can't?=0A=
>>=0A=
>> Not sure. Palmer ? What is your plan for this series ? Can you queue the=
=0A=
>> riscv/DT pieces for 5.11 ?=0A=
>>=0A=
>> I will post a v9 to address Rob's comment on the sysctl and fpioa driver=
s=0A=
>> binding doc, not other with v8 changes beside that.=0A=
> =0A=
> I guess I got hung up on that bultin DT thing, but I've sort of decided I=
 don't=0A=
> really care that much (though I guess I didn't decide enough to reply to =
the=0A=
> email...).  I don't think it's 5.11 material: we were told to be stricter=
 this=0A=
> time around because of the timing, and I'm trying to sort out a boot issu=
e=0A=
> that's manifesting post 5.10+for-next merge so I probably won't have time=
 to=0A=
> take more stuff.=0A=
> =0A=
> Also: I'm kind of trying to avoid the whole thing where I take patches th=
at=0A=
> have a bunch of versions sent either right before or during the merge win=
dow,=0A=
> as it just makes things too hard to keep track of.=0A=
=0A=
OK. 5.12 it is then. Please queue these in a branch as soon as possible onc=
e the=0A=
merge window is done. Or do you prefer that I resend everything rebased on=
=0A=
5.11-rc first ?=0A=
=0A=
That said, I think patches 1-3 should go in 5.11. 1 & 2 are trivial and pat=
ch 3=0A=
fixes a nasty bug that exists with the current k210 support.=0A=
=0A=
=0A=
-- =0A=
Damien Le Moal=0A=
Western Digital Research=0A=
