Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA082301390
	for <lists+linux-gpio@lfdr.de>; Sat, 23 Jan 2021 07:21:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725932AbhAWGVC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 23 Jan 2021 01:21:02 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:30865 "EHLO
        esa2.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725769AbhAWGVB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 23 Jan 2021 01:21:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1611383383; x=1642919383;
  h=from:to:cc:subject:date:message-id:references:
   content-transfer-encoding:mime-version;
  bh=etmtp2gPYHYm1HaGfL/cfkw8Z6BCpEO/XO/Lbe7DF40=;
  b=mCQbW+7BOAKylMQtZpuWCE4n+fQox+ThKEDw0NDrD2gKevOT7L3VmRkq
   rQQOmv/zdjlHsxUqz/U7Jd+4E6YhWaBNHgnC79DYP5VkX5N/7+KTUX02I
   rU0K8MUYkxyjUakpHrSa3Jcu+0m2JC2F9LgXgAprya9esGG/idBxm515J
   ZnBjGoPOBgibVB+XFu9Aja8ARyepjYnS6L8lLwUSN30xMGKCyewx4t0fI
   wYrZBollvLSRcLLzLWcSccYBBNbzlGma/7Kt+YnCE3Sn8DRet06wepnuQ
   ucecceN1j/ilLQzPUaZxNaefm+qLgj5Ln5+r+TZfnXLZxPvdc4HmYy+zO
   w==;
IronPort-SDR: GAyz6DGM3BCVmm8QOJkLRfe6l6ae89PkCgKGI9Tya8Wi4ZAKMeVJmvAm8z1p1ah37RZdxzA8wZ
 V62A23o2SIIJEFDrDnhs9e8cGQh299uo5s11WUgKedl5moLJrN7/zHWy+bDAGs1dTkoz0W/Btn
 MDUsGydCfIzWqjYPSRYm36hpTHNVlKm/44xNlKjJoUWWJ/aTNR1R4vkP4YCpuoguXmsNT5FbQ0
 q2VHTSVrOkc2lUpNHv/K/bHAOZlEDs2M2Cg9+8Kf0tZJZh1smsrPoj1wwei6plm+I2W2SgULrp
 cCo=
X-IronPort-AV: E=Sophos;i="5.79,368,1602518400"; 
   d="scan'208";a="262133935"
Received: from mail-dm6nam10lp2108.outbound.protection.outlook.com (HELO NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.108])
  by ob1.hgst.iphmx.com with ESMTP; 23 Jan 2021 14:28:04 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OmitY4GlbaXleMurolW40jrAFTT2z/7Yzz22AWoPlQNjvh3d8681yQvz9Hai//Gq/oEItROkz+pJIpC1k4IJcvEANTGr7AcfVswOK0aD1IvqDg2ZqSeh2kRaSoi8FBMY/5Lc0O9AmsPiFGpdpVyU6s9/w9Bi8o9AxZ7nktvBKnzChOY3FdLDflIqCvopo6J6FZZ0g2qSpGgm1dtP0QamMe2LcutasuBojJc4BJbZsJ9MeT2NAk/6gRKoWKWL9B1IkvV/9McY7JvuK2yf3Siff7h9Bfb8fGYXc1bvNyGRvuyukghCRiNFIzBe3q5emCFVUS4YHs/SeY6sdQYuLvIuoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1tO1rO1zFVkmbw1ggBFxIBmKEz5k6ydrwfDKaRZwC4g=;
 b=K+qTFBLq/NWmBYmNAoNIeD+FcYaaDCxpVH+I63w5bblsXQPxZ5hw06J62NHkppwSeCnWF1FypOJivx37IAL2TICQPgf23KiajZv3dk2yVgwgQWG4bO0lBJXm1CCsSFBl0mkZjt3v9ql3dF6XWKg85g7q6LnCyppg+VC92JCQts7rZItdVRLWuAaujXAcq1JWU97r11FgKwpes9cXY/QVWjDRXchPBVPJlxY9YqDYMVe4BOkzsNpRGj2RZcpYK/hDYKjg6+oOejq1UsUQ8RLU5aInDhbndUTrKlUHXyWxSfjMPvibcBLoHpG+lllMp1wCER1nmUBh+8tN2LMwuYQdnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1tO1rO1zFVkmbw1ggBFxIBmKEz5k6ydrwfDKaRZwC4g=;
 b=VH6df3OXhGdOj5uZ43IoLzfNHi1WQ02inuwAzPEzOmMZ95tUgZO/qI0AFBD3tV/olFVzOl84tthBpfVhjom8RlwOpNqz1PoZ88SmKp7g3z35iRDM/g5bbArQqrwBHq3aqUJyRmVaV6RK2xtK5ZskQFwCgxSULViXxxhCywUI3bI=
Received: from BL0PR04MB6514.namprd04.prod.outlook.com (2603:10b6:208:1ca::23)
 by BL0PR04MB6596.namprd04.prod.outlook.com (2603:10b6:208:1cf::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12; Sat, 23 Jan
 2021 06:19:51 +0000
Received: from BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::b880:19d5:c7fe:329d]) by BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::b880:19d5:c7fe:329d%8]) with mapi id 15.20.3763.014; Sat, 23 Jan 2021
 06:19:51 +0000
From:   Damien Le Moal <Damien.LeMoal@wdc.com>
To:     Palmer Dabbelt <palmer@dabbelt.com>
CC:     "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "seanga2@gmail.com" <seanga2@gmail.com>
Subject: Re: [PATCH v11 02/10] pinctrl: Add RISC-V Canaan Kendryte K210 FPIOA
 driver
Thread-Topic: [PATCH v11 02/10] pinctrl: Add RISC-V Canaan Kendryte K210 FPIOA
 driver
Thread-Index: AQHW6H603OQs4bGY/kKjaT3KXrLhfA==
Date:   Sat, 23 Jan 2021 06:19:51 +0000
Message-ID: <BL0PR04MB6514540BF8CC35309C376394E7BF0@BL0PR04MB6514.namprd04.prod.outlook.com>
References: <mhng-4406eaf7-474a-41a6-8a23-8d75e79c8521@palmerdabbelt-glaptop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dabbelt.com; dkim=none (message not signed)
 header.d=none;dabbelt.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:2db5:5c10:5640:816d]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: d6a7420e-c970-47b8-167c-08d8bf66e495
x-ms-traffictypediagnostic: BL0PR04MB6596:
x-microsoft-antispam-prvs: <BL0PR04MB6596596432B3D7A5BC878C11E7BF9@BL0PR04MB6596.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:2582;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IXu9yAZ6v+TvSiM2u7s60B3oKFjR+mFXFgOoDuDr42mj0MI8iH3/vd1MfR8GVeZglZtmnyxuAHUPiChAHIOMQyw285N4J/YDSbJLBX+OXAeh1cwhG3IAqKwvngyysV2eebcdu6tXi7Wo0BjbcFadHVvOjlfJ4QUZkFV8ljmdLbPPQbpxtLHkDR8CRjQcLYo+wh8GZ/d7bPI+wHfaiW/WcxVF/5mUU4FFzmBZLiZuQILwbg+EMFBeI44dz9GyrinT+hIk71c29y26JQOs7yyoLAMZAGIm0sWBZXgeno2yrYsd1dtWQkSNJ2swPygJXV0S0XNCSEPcDl/np54BWWbZ01PCdxxejSC0NC+RZ5k5o5Kglhs6a3csFEH3hd8/hDvTYBYlmRbwMGyaFY3VgImE7PHcJMMOhn/xK67cQVMc/EsJ8j3zDMCZfqqRkQJwIetuM/38ZYzemPyc8mvhDFQiqA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR04MB6514.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(136003)(346002)(376002)(366004)(6916009)(316002)(2906002)(7696005)(83380400001)(186003)(53546011)(6506007)(8936002)(54906003)(55016002)(52536014)(91956017)(76116006)(8676002)(86362001)(66946007)(66476007)(66556008)(64756008)(66446008)(4326008)(478600001)(9686003)(5660300002)(966005)(33656002)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?m+iDKg8hOnHP1QO2wwBmvKSgV1imA5MGq4HrjN7EL62LtrBOzAarItBSkJjv?=
 =?us-ascii?Q?8UyIfOShWBLcr1WijLisstRYhfBF+Q4lzuZDGORfiDdwd8nrHvQsxS473Hlz?=
 =?us-ascii?Q?2lcg4ZQaYuKUe0qXea0YgeJ4Wx97tvTgX5bsNrNmatolzvE9Me45EktCHIkU?=
 =?us-ascii?Q?1YZrKlxtTwU4lg+/XrXLVX9x16hjT9PxGmv4TrapI4LZFYiTNfQ3Pg6jnP86?=
 =?us-ascii?Q?QYDvng8lf3pv2bzSBCDhMelOHzEQ5iDIPaqOv4xsI2at/MuXkEA5ft68Dx7s?=
 =?us-ascii?Q?p4pkQkBJjH9oMQnzizcFEWCiidfbpqBm8cMNtohsaQmrnHbAw1fML3z92pBd?=
 =?us-ascii?Q?sSTFLI2hgXlQ5YaQNFt9KS+jL8CIwbx9BvUEbtW6cnI74wn6zL/Bqa22EoQX?=
 =?us-ascii?Q?Rj5xJpBqZld0KxALndSAusxcO+1Z4HnrDvpBegIlULMVJNnzEalH1DsB/Gby?=
 =?us-ascii?Q?s0hU4u87kp/PS8BfGgD/TgC97n9PUZvb7zudX8xHsRhO1TWZEdsuxcOkGgsV?=
 =?us-ascii?Q?f4s68JFsJf8LDHVc3pf9P57GPnVYVuTvasm3x0hhA+E6Lly/74SHhU7ng7Si?=
 =?us-ascii?Q?Mvpr7axaeUnuh0wF19t8BQlrn0fAhlSakW1hY1jpsX+lR8BPS30rKF/l+Gco?=
 =?us-ascii?Q?7py9pzDhItURqCM1UV4RsXSMYULIycU2HFZ+PhKh5/MnRW6r23VEs/Lmw9Dv?=
 =?us-ascii?Q?BZOCxhan6LlHJ0xaU9m4fvDSO2RzIjzsculsXiZCVbAwV3UGCijFpYHTKIqS?=
 =?us-ascii?Q?LFC+MsnjWqH4dikJe6LGvLEx3p+3gV1fqZReAdZ8HR4MMwlXzmaLhG87kDuo?=
 =?us-ascii?Q?jd7EU+Pj/pIZlCN/Fq806aZG4Z0yPD7YPjUWSxAkcRTiE5Y3xIhM4B3aJ645?=
 =?us-ascii?Q?WRO832MFLuoMPxi9BCAngYyRU48laOeDmT6MFEHVojJeTAswHhpXynVhNzZ4?=
 =?us-ascii?Q?0ayC63dGq5sdc3oEKPiGZfpEq/OtX57/HKQkKI5ZPk5MOFvYa/0FWWqC7r3F?=
 =?us-ascii?Q?YDfJVL04p/GXBJB0tIh4b1VCb1b1/bYEd9unZukP+tGc9uSJUbtovDPXmPpV?=
 =?us-ascii?Q?ZKOChQozwConmQIyt4T4xQTWBJuySsM6eUQOOBglpIwvzyGEk+O/pKDH5aFi?=
 =?us-ascii?Q?UutQ9EfqAU/eQah5DtqYMnyLpJ/T+/5IgQ=3D=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR04MB6514.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6a7420e-c970-47b8-167c-08d8bf66e495
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2021 06:19:51.4982
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aW2LXTSUZsfLQlf5IGCm0Vaa2bqRl/xCoXZjtzI/NMEEvC9EZ0aPJRCyrA5fwOF2qQnvtYgLGpMBI6zPOGRaOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR04MB6596
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 2021/01/23 13:15, Palmer Dabbelt wrote:=0A=
> On Thu, 21 Jan 2021 00:32:38 PST (-0800), Damien Le Moal wrote:=0A=
>>> On 2021/01/21 17:25, Linus Walleij wrote:=0A=
>>> On Thu, Jan 21, 2021 at 1:15 AM Damien Le Moal <Damien.LeMoal@wdc.com> =
wrote:=0A=
>>>> On 2021/01/21 3:21, Palmer Dabbelt wrote:=0A=
>>>>> On Mon, 18 Jan 2021 05:33:05 PST (-0800), linus.walleij@linaro.org wr=
ote:=0A=
>>>>>> Hi Damien,=0A=
>>>>>>=0A=
>>>>>> this looks all right to me.=0A=
>>>>>> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>=0A=
>>>>>>=0A=
>>>>>> Shall I apply just this one patch to the pinctrl tree?=0A=
>>>>>=0A=
>>>>> That's fine with me.  The DT bindings are in riscv/for-next, maybe it=
's best to=0A=
>>>>> take those as well and I'll drop them?  I don't generally like to dro=
p stuff=0A=
>>>>> from for-next, but that's probably better than having everything all =
mixed up.=0A=
>>>>>=0A=
>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git/commi=
t/?h=3Dfor-next&id=3Ded3137edb31b86702511e7ad12b4abe8686b6805=0A=
>>>>>=0A=
>>>>>> I think the line that touches arch/*/Kconfig should be dropped=0A=
>>>>>> then, that better go to the SoC tree.=0A=
>>>>>=0A=
>>>>> I'm OK with you taking them along with my Ack, but if you don't want =
to that's=0A=
>>>>> fine.  Just LMK=0A=
>>>>>=0A=
>>>>> Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>=0A=
>>>>=0A=
>>>> Linus,=0A=
>>>>=0A=
>>>> Please let me know which way you want to proceed. If you want to take =
the patch,=0A=
>>>> I will resend without the Kconfig change and move that change to anoth=
er patch.=0A=
>>>=0A=
>>> It's fine to proceed as is, since Palmer already applied the bindings t=
o=0A=
>>> his tree, just apply the pinctrl driver there as well. I don't see any=
=0A=
>>> risk of collisions in the tree.=0A=
>>=0A=
>> Sounds good. Thanks !=0A=
> =0A=
> I don't see an actual Ack here, but I'm OK taking it.  IIRC there were so=
me=0A=
> issues with the DT stuff as well, I don't remember if they got resolved o=
r if I=0A=
> should be expecting a v14.=0A=
=0A=
Palmer,=0A=
=0A=
Linus sent a reviewed-by tag (see above).=0A=
=0A=
For the dt-bindings problems, the v13 that I sent already addresses all mak=
e=0A=
dtbs_check warning and also addresses Rob's comments. The v13 dt-bindings=
=0A=
patches need review, as well as the clk driver patch. Will ping Stephen abo=
ut=0A=
that one.=0A=
I will send a v14 only if there are more comments that need to be addressed=
.=0A=
=0A=
=0A=
=0A=
-- =0A=
Damien Le Moal=0A=
Western Digital Research=0A=
