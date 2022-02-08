Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8DBF24AD657
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Feb 2022 12:24:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237225AbiBHLXy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Feb 2022 06:23:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356136AbiBHKOu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Feb 2022 05:14:50 -0500
X-Greylist: delayed 62 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 08 Feb 2022 02:14:50 PST
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48A75C03FEC0
        for <linux-gpio@vger.kernel.org>; Tue,  8 Feb 2022 02:14:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1644315288; x=1675851288;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=wRqC1SHVs24+dum//Tw1ffOEBg0B6/8BUw8+okcY3yY=;
  b=G4l8PMMTfPVPi7qLNLzaFh3LtvhaCsKGiLRvTv6eXfmY0KNlhfzErQv0
   DClx9RGXko58m1cjb+gkWMZq/8LzgcrI2SVbZr3DmZ09W8cpXKwreN+Rh
   r4AuCct39dI+5dKRoE11xhAmNuI9tNXuLS/qugCNRIrE5yPrs2mwptsLD
   LOAgceeppSPlwyKo5n243JMgissmvQwqRggyrvuf9qwL4af5gkgJQwEVU
   7bGX9VF8iB9SOLk2jMeKottPX+zvgxp8qLiIjmNKLO67rDpxAcmzhnsY/
   YI37GK33TId4MI4Dp4et0qGcmQaKVkZs133uWsoOK4cx35RD2ygwaVn2d
   A==;
X-IronPort-AV: E=Sophos;i="5.88,352,1635177600"; 
   d="scan'208";a="197224658"
Received: from mail-co1nam11lp2172.outbound.protection.outlook.com (HELO NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.172])
  by ob1.hgst.iphmx.com with ESMTP; 08 Feb 2022 18:13:46 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MI+lmqYsKSQ3NGkVto++YXJ6J77qRUzgSa35JVueQDFEoECzG3B5ETJV3cli3AivoGptlIJgLSk3F9eNigtqMYkAEuDkKRH+RtNBqDP1oaGN69v2vL2Nw8qBPJ6jhPaHtC+lFnaZ3vM8tvr9ue1Z+uDdPfFgA9q9nvTlQYPEsxWPYHjXWET2cGYpdWPftLVQSgAObxeZdUfvwkXajSEKNj/X5x+qf+l1Ieqf1/wF2WhwjToCn+YJAReC2O9affvUD7MW8Av5JUiCI3vXAWo42mr60gkKbTMG1AxB0yFqN3zUqdQ+PFyK2jBAZSz8YX8KKXKieZo0KyDBccX8t40hJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wRqC1SHVs24+dum//Tw1ffOEBg0B6/8BUw8+okcY3yY=;
 b=f6bup1oLBqfhCECkoZ+0XcWRuwsRp6vizPHEFomyv74mThoL1wDnQvaS78Fcu6Ir2qdNAgmYVrwy2hB6EZKWPPJPOc0wQXOYt20Z7Ooi12P4UYbQ7keWkpFfEcPpbQkreWdM1sMjSaI8KlPMFfqI8X5h9IXq4hrHZ755tspzIMqVN7gsKD9L9nnqbQFRtnY/Z9p6B6XPz5XvJFb0JSMNRtDmOBWMaJ3QnwzxO7VDnnyot2C6qsOBdhikYvcqDcf9lfqc4m1rlMsueJK339Z/2cEdvddHjRcWoZ1dpkujhjxVp2vd25JlDFoQ9CetHtTCE3cUd69xLxTuIBqlYHvslQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wRqC1SHVs24+dum//Tw1ffOEBg0B6/8BUw8+okcY3yY=;
 b=BZ52QbtJSMVw+KcqmxBd4/04ZN4lnLwsfx3dpblOp6RSZDV7vKwtNxQnBd9cMbdIGqkT5x1rM9tsQtCh/rREX6n1WXM7gPIWcLtS/jG+YW0hakF6q7zQqfbt2ybNfTVQ2tyyxJfisy801CQlxTWJGrNc6kIsM3api3tOP2U7PBY=
Received: from PH0PR04MB7158.namprd04.prod.outlook.com (2603:10b6:510:8::18)
 by SA2PR04MB7482.namprd04.prod.outlook.com (2603:10b6:806:14e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Tue, 8 Feb
 2022 10:13:45 +0000
Received: from PH0PR04MB7158.namprd04.prod.outlook.com
 ([fe80::ad7c:72b0:de53:f5d2]) by PH0PR04MB7158.namprd04.prod.outlook.com
 ([fe80::ad7c:72b0:de53:f5d2%8]) with mapi id 15.20.4951.019; Tue, 8 Feb 2022
 10:13:45 +0000
From:   Niklas Cassel <Niklas.Cassel@wdc.com>
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        "damien.lemoal@opensource.wdc.com" <damien.lemoal@opensource.wdc.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH] gpio: sifive: use the correct register to read output
 values
Thread-Topic: [PATCH] gpio: sifive: use the correct register to read output
 values
Thread-Index: AQHYGcd1jDKOa8jQ/0eC1rqOXQQztayFKluAgARLMQA=
Date:   Tue, 8 Feb 2022 10:13:44 +0000
Message-ID: <YgJCWMln/QK6pE+Q@x1-carbon>
References: <20220204130142.21727-1-Niklas.Cassel@wdc.com>
 <CACRpkdZX5Sd-bp1n5zmYv7biPuBoNMGW2+OQ9qUi3PKNeG-R=A@mail.gmail.com>
In-Reply-To: <CACRpkdZX5Sd-bp1n5zmYv7biPuBoNMGW2+OQ9qUi3PKNeG-R=A@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9b18fdec-eac7-4229-5ecb-08d9eaebb092
x-ms-traffictypediagnostic: SA2PR04MB7482:EE_
x-microsoft-antispam-prvs: <SA2PR04MB748252ADA20E71F0AC941B38F22D9@SA2PR04MB7482.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JQfsN2PtZj4pQKJdf8Q2jBIGzd5FHzUYxBKw4HXjLlrqtjXyThqIh1DPPjmoSKeiy2AdeHAdzGNrkbuzdJnwrLvLpkFRmgXI2VXBGd1Y4GUyIhnOW+rCywRBA7N+FWiV6L1NVY435dpEnY9dSsXlnW0O0n9uBxtgs3befqAmWhpL+2SnhnbHe7JiVYE9Uv45bvMqcCl+7B9BJFn+/uhsLcF7Ctm5cWw7jrLA73tcbzaf+Lh5fvs3t3hBkxQFmOeKfSqRfsLl0aIa5tkPbd22eQXuSqgWu8wtmTnpxH6vyzp3iS/i4Y16EfxvtM5NNQ86KWA2AHq0zdP5lKiLjrUAJOmhbntVEZ5KEkerTfR8kgT5O6ZqUIs9DfOcz0VkxUVro8Q2l3xqJY9fao6tE14HO+HHNv2V60lPLY5VShrMxBs8bWkf/aY1bM7vKV0fmn30K8ysiD/IBUNHPNUthBDoXGpce20t1kBTS36FXf4BJa49NFPSaF6n+Ub8IAjRs8UNDHDbQL6/I4fFAr4Rz9TldsnmYP2+rkXEH4ZUPd0LEl258/Z/Mz+oSQ1IkVP468VrD7eMGSrwfmcnYQYqaT/e36ZrvdtGOdjHwTI98E81sf6Cg5xKb/bZOxCRpHojujoR819YBhu6E5Pef5yRMyQwdc2ruSAEAiEJmMSGVS0t2NAu8CLBdTeeijxKK/2RrlCMIMidU13m5YGsjhkHlRbJ1w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR04MB7158.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(38070700005)(82960400001)(71200400001)(6486002)(508600001)(66476007)(33716001)(86362001)(316002)(122000001)(6916009)(6506007)(38100700002)(5660300002)(6512007)(9686003)(53546011)(4326008)(54906003)(2906002)(26005)(186003)(8676002)(76116006)(8936002)(66446008)(66556008)(91956017)(66946007)(64756008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?VP5umJcst6xBxS8LikCioS683/h61xCkfe3ZXgpV/qUQj9U2xgXlP0CbLjV1?=
 =?us-ascii?Q?4RD1j/i4p4e2Q4uYo5n9HM8g7PxNem1ENIWMNigKwuIyReiocaFoahuB2bvC?=
 =?us-ascii?Q?DkUcmg4blUChKYk/EwZrxObr2VAa3Lo2gpCgSj3t86WVbxPygFTq5rNJw6EH?=
 =?us-ascii?Q?BhE/U/Z5auqpqo5pC7yYd6ACA5CSBD+DMmmHoAfCq66ezLrhT+/aztgGOnni?=
 =?us-ascii?Q?sHT1qP97TConouVcnjedh487oKLMBCRs7e3R1jfPD3gCck2ta3ViQj1uNOnu?=
 =?us-ascii?Q?N9rpik/LP6iTri9ixx7CgLIbd7taDUNVqPyoUTmRtouvR3qitBvBlsgj3KT6?=
 =?us-ascii?Q?nJRyc7MvuKFGkVaU7dBDYY1QMSxd8q8M1fVQbJGMNDNhb58Hhh4YsH5qo0YX?=
 =?us-ascii?Q?Wv02QyJPSA/Kk3lovhtFjQOF5Gwz/bKRR5tTIL20hlmLK1MWvtlI8dAnuh0b?=
 =?us-ascii?Q?vM0b4bimKsAa89mr2K3szBzkwquh/jMrhf9iRHu0cFAgYrAzLSLNMKpJgXYn?=
 =?us-ascii?Q?7WOXmLyhPooFsoDbmu0EmRgvrS8834z18X63GMyY1mTxNVqRtbjf/kXtF7U8?=
 =?us-ascii?Q?W65MfNooX1D4GgQhwKcBICnSgbx3NGZQsYksJOqbJu5gQNZkT2nCdcKdWas1?=
 =?us-ascii?Q?SwAzJ/YDid2xieItfr0f1kaUHdvn3l20wCJHCfOe9mxEWZvr6fiPf30jMqtm?=
 =?us-ascii?Q?TQA5s/a3VZKEvMLQ5HrFmJ4RzgO+7ka8SB0OazNBhMrxmvQN7c5jEVR6G8L9?=
 =?us-ascii?Q?rQC5WaKGQQ6218nyLasqL41Ie9Q4jxKFdXIQo89+KFRM2ru3fnLHztFEPi6n?=
 =?us-ascii?Q?Jh090fZeQnsAPP0YXN1A03UTAp59dMckYaqgJmkhmFqfHLjdGRWleWLhaPyp?=
 =?us-ascii?Q?ImtsrsUgYwzJeqjOJKBsTPlOPcT40WVmsYQebaZHqnSwhoVUWW37FgT/vPk8?=
 =?us-ascii?Q?yLBOA9JxU3lUamIlu8nzT7Nh0mkYCtZTh8YwkZaFCaZCNpkkEGvDU3rl702b?=
 =?us-ascii?Q?Tme1kR4RcTO3M0hEKcW90YgcRU9RFRZgZTaM0Hn41H4EdSfXwEwguZtMln9w?=
 =?us-ascii?Q?+6PYCNpqmBk4V5fg7779xCNcWaHBQNU9PevCIuFZLyKvsQRzkaDgLpokspvv?=
 =?us-ascii?Q?iOuIaTbK49rqfHNAfloOTzShVaBiCAdWESkRc4fi8ffeJM5Sa3SyWnHAtLvI?=
 =?us-ascii?Q?aEZ4v4R/9c6tR1ZWc8+2G3l1TMLQuFPxvXy4ropv9dsHd2ahKzNVRcX4y2cG?=
 =?us-ascii?Q?aBVvmW08T6TrAC9LN86UG6zRZrKMVibOb75KnM1YFT79qTDw56ceD0yfw9KG?=
 =?us-ascii?Q?qYo7nIUMRzqLDw2/q3ezyeszH1U4vcPWtK1x2R1d1eQ/AOdDGJ5s2JHe4EtY?=
 =?us-ascii?Q?C382skiw4vNfX19LDP059/mjU5UzJtrUSJkSd6HCC8nKz7x1ncvVvmTzX+BN?=
 =?us-ascii?Q?eNf2ERwmGdLJgpadZLWKHGm1dfNQU8GPGtxsA3NRKkgm71ghLizXIYmRjAAl?=
 =?us-ascii?Q?UM5/bd5ToKQf4nnXMhj09Nd6KhUiTJWyZY3T6guTtHvQnhfnFWreMjdLJqDc?=
 =?us-ascii?Q?7zDtNjcxdSfZ19s7/Ss24Gy/aIBgbvC0lHu2iTvuMQ8hhEMDimP0727mhso8?=
 =?us-ascii?Q?LqPDgLGP0Hg3Qdal1GVEv2M=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3C9C96C4B2179244B1F6C6DC21170E61@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR04MB7158.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b18fdec-eac7-4229-5ecb-08d9eaebb092
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2022 10:13:44.8825
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ICcjqVhPJ+UlJrJZ7QsoK7UlU31SdrEbBubsh3ZG4eRNz287PDhfjCX8fuIqF3zv2Mv3DFxn6F/SmBHdTfLTRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR04MB7482
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Feb 05, 2022 at 05:39:35PM +0100, Linus Walleij wrote:
> On Fri, Feb 4, 2022 at 2:02 PM Niklas Cassel <Niklas.Cassel@wdc.com> wrot=
e:
>=20
> > From: Niklas Cassel <niklas.cassel@wdc.com>
>=20
> Hi Niklas, long time no C!

I C what you did there ;)

I've been working mostly on spdk and fio, unfortunately,
both projects are written in C :)

Learning Rust is still on the todo list...


>=20
> > Setting the output of a GPIO to 1 using gpiod_set_value(), followed by
> > reading the same GPIO using gpiod_get_value(), will currently yield an
> > incorrect result.
> >
> > This is because the SiFive GPIO device stores the output values in reg_=
set,
> > not reg_dat.
> >
> > Supply the flag BGPIOF_READ_OUTPUT_REG_SET to bgpio_init() so that the
> > generic driver reads the correct register.
> >
> > Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
>=20
> Looks like a straight-forward fix so:
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Thanks for the review!

Indeed, I can't understand how no one has caught this bug before.

I guess most drivers simply use gpiod_set_value() to control a pin,
e.g. chip select, but rarely care about the existing value of the pin,
so gpiod_get_value() being broken does not really matter to most drivers.


Kind regards,
Niklas=
