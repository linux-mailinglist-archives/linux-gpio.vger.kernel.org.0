Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0022B60B53E
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Oct 2022 20:17:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232517AbiJXSRe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 Oct 2022 14:17:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230425AbiJXSRR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Oct 2022 14:17:17 -0400
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on20628.outbound.protection.outlook.com [IPv6:2a01:111:f400:7d00::628])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B32342751B9
        for <linux-gpio@vger.kernel.org>; Mon, 24 Oct 2022 09:58:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G2vRIrJj4Fcc26jDznqWl9gIKojF+UBsYIkhPeOwHtWY/z1E+fb6yES1rUeT0u8RnFGISrZrt3+0ctuy2/Uj5Y2Dr7svu6LtsrR7itKMFFSWvJ2VGzDZwlBujRr1XHQH6edJ18t0W7RlIp4cmJScHSu67EvfsmUkoHjaE/D+cnG0Yk1Pj3okzYVL4RsRJIn9Tvyy9kkPfKdmlKMvcDP/VdIYaoYpxkXgQuED1YzG0SEqYFQ/Df8GbC75A9kzKP1Ou3+2TqPLUdz1AkpFk1z3xq532SZ9+psHgYOmDSh6gDx8sSV5C1v42YKRtcSLKJ66bY2xkMGKEZc+KVcJ3CFHSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fCBr+wAgaLKIwVMpM+dvORkeYw0v7zC28/WJO060Qjw=;
 b=R8FjPnfHhE3Sw9hL8kVE5YhWCpfnVuh6yW+om8AERLtU6Na2Fg0oEw/DkmSR87igBl5tcytBwGbAKfkISA8eUwoBqPyjyaR3a2dUy9cvr0t3mjLLRE5eubW+La38ysmd7hmfGy1N5Z+YkGZJZ2YcqcT6BeJZmeHAPkeUyGR6OMATko+/yZbXOf6HDflyGUHDTcgf50oWtIH8FAzpqBBHkNPg/lwBiY+V+SmnKFrHG8RxRG7hi6tRUvtm09A7dBW6DTwUKs/sw1aGBczOQdaxy2kOF+Ts9AY10u87BWSv6QvlZ8LXJIrKMR3XeS9R0E8by2KvQ6c9WRI40iY1MBOOWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fCBr+wAgaLKIwVMpM+dvORkeYw0v7zC28/WJO060Qjw=;
 b=oG7NQ/9wBaHHQEqM4xaBZh/w42EjtdQvy1GRx3mSmo9EKdRsrdB1cImEiksqlitjNgVgHbMaBasCK6XXbDHWECUtsby2PCisNYOq4efBKuIgv2I/+729zbU/xpxRrlvSp5jjHUvjnFfvY7WW3UNjVZOPFKVDXqTwlRQRor2VxxU=
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by DBAPR04MB7413.eurprd04.prod.outlook.com (2603:10a6:10:1a6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Mon, 24 Oct
 2022 15:05:00 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::4150:173b:56ec:dc6c]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::4150:173b:56ec:dc6c%9]) with mapi id 15.20.5746.023; Mon, 24 Oct 2022
 15:04:59 +0000
From:   Shenwei Wang <shenwei.wang@nxp.com>
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     Aisheng Dong <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "imx@lists.linux.dev" <imx@lists.linux.dev>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Marek Vasut <marex@denx.de>
Subject: RE: [EXT] Re: [PATCH v2 1/1] gpio: mxc: add suspend/resume support
 for i.mx8x SoCs
Thread-Topic: [EXT] Re: [PATCH v2 1/1] gpio: mxc: add suspend/resume support
 for i.mx8x SoCs
Thread-Index: AQHY2mGOiCWmYydHdU6c31ilQ3tOMa4SY+WAgABCMgCAATo7gIAAQ8PggAR08ICABRLaUA==
Date:   Mon, 24 Oct 2022 15:04:59 +0000
Message-ID: <PAXPR04MB9185F5AF97CDB15AC8435487892E9@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <20221007152853.838136-1-shenwei.wang@nxp.com>
 <CACRpkdaKncznz5qej6owA2OGMeqbrif9e_QO3CWN6+sGhEApDw@mail.gmail.com>
 <PAXPR04MB9185AE67BF20108CFBF0546289299@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <CACRpkdZ1hCZ1WoTQ0e584bQxEyBWq9gkZKPPFnm85QnMnNyvHQ@mail.gmail.com>
 <PAXPR04MB9185639BA2F9D61FB935741589289@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <CACRpkdaa0=m9FNiV+3XJ7MUGF4eJxc5mNVKUEUn_d8SMBiOTSw@mail.gmail.com>
In-Reply-To: <CACRpkdaa0=m9FNiV+3XJ7MUGF4eJxc5mNVKUEUn_d8SMBiOTSw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9185:EE_|DBAPR04MB7413:EE_
x-ms-office365-filtering-correlation-id: 3c561c9f-0eb4-49eb-936c-08dab5d11ef2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nVApnJgZZCFsMkwip5sykR7aqPtfJiG57S4jyZr2qryOZKObwr7N1RUKBLHD2JfQvJV8Z3dOsIchb1NjEiiDr6tUQfjxFOvnPj2J8zPz94YVfUW2kYERH5Aa98kiCRBZUx+1pktfH/cVJ+SSVbGNhFXhE8/NlJwcUx4esB5CkUBo2Drc/tFuKe2TtDgOOi0IfbqDANJy8l1tXPUJMl+bNqdOXC5r+QFFdjEERY3iom01pQCVIOCKinqvyMzdzATRnEuVQwOs8DzfTChDGfiuaPgmjtGh5aBbhVrQtFktaMIDMS3LL6xTFzpvMD8lPapEnI9XVZl7jInmodzB14I2bE7UdL9nsKTOnkGmZ1IkLNBzi7p5ONpI+ngthn82269A8068HzFGLw+L3N/D6zr/we+xeiie4ORtChMkqBkWt3ixAJl/J9V7wzQspluqfu2nvoZ+jorX3DEGt+RbCneCKt3ut1cnRqCzMRBm/7/9/QKlaITCIlSRfvIy/HOLJBgyzp8jkY4cG8qVF/A6n4xBKVOGpxupxKUt/BCwz7+wL4b1t/y5IUZp0JWOUmflNHi67WKiP0DV2Pb2bGEXcJq4bDEZeZvyjjZXVJ0gaPVsiNNBAR/XeqGm+wu9ufU6RHV3/+siuep2rs1mOcD/8JUZ0rIZQniNXZXm6fVwqo5oFR4s0ojQoAFZs3Z5xueLE4sIpM0PFTggzS38zvR8AfSU5A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(6029001)(4636009)(136003)(396003)(376002)(366004)(346002)(39860400002)(451199015)(5660300002)(8936002)(44832011)(2906002)(15650500001)(122000001)(38070700005)(83380400001)(186003)(86362001)(33656002)(38100700002)(26005)(9686003)(55236004)(53546011)(316002)(55016003)(45080400002)(478600001)(6916009)(966005)(71200400001)(54906003)(41300700001)(76116006)(4326008)(66556008)(66476007)(66446008)(64756008)(8676002)(52536014)(66946007)(6506007)(7696005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?g7uIOyy71na/m18qHUTU3Aw+KBv0ME7tEo33qjZxP2TRVdr+7DBQ4IJDE5+f?=
 =?us-ascii?Q?oDzjgF4KCdNG7aLkH/1Au+ex8apU2mn3RThUX3xvO+z81jPZr20viG3+Sjqw?=
 =?us-ascii?Q?AWhMCTC2vaqPUI62NksShBcPVxDDysNOkYGAXF5lLQy+Go9OoGt+5ATMFcXE?=
 =?us-ascii?Q?nu+zUNW6dB/gNercHDZvJCL5eF/cYrNqvqL3ORv1aHIpSzLkGcxX8Heo6/85?=
 =?us-ascii?Q?fXAepROERDcVe5GR57ezxoSp/8BDFNJD0puSx+Ycla79MXvdmvI5xDfHqv4u?=
 =?us-ascii?Q?YndWpDopRVtya2X/EgjtBYiW4CwHJqS3iVTCUYpy6hw0vBGz34Rt6v0UUCSo?=
 =?us-ascii?Q?dIYfqyyAoZfYgrNZzwB76ReqfPaugC4G7+DgKZGfEAnR6tNHrr0LznGFjVVa?=
 =?us-ascii?Q?IAsq0/OFl6n8/S+mbwwZW5B3g9n3iNCYHqm0YR3SI0hTy7Gp/xDgZkS19JEs?=
 =?us-ascii?Q?8/HmTYYONfYTKrGNB3C6aNKVcKBwAAvvur/xZQNrO87Dq36HUeO/3HBFsA2S?=
 =?us-ascii?Q?qT/80EtlHMkvo4gPUY5oFVLvKFsc0kmWdvZJQeskitqo1Njh1PQB6nY8uTMa?=
 =?us-ascii?Q?MaPJVNnkzUz9CmK6vPMHbUPnQ2HVrjwI9ev3uKVLX5ngTpOCdBdjCin7x61U?=
 =?us-ascii?Q?v/8otpyXH1s3OFYjHuq9NaXYKBfu9pj3WvvTdYETryXJGzZbqgzfSwECTo44?=
 =?us-ascii?Q?klKHdwsPTeV/5FUHndPcxyuSjFl+hMkvTpyfVXoCtbulazfiJS8v+FB6dKvo?=
 =?us-ascii?Q?I4olR+jwtNOnsu0tCaRTvJVuHSjBanZDTC4a1mWqg2OmpNKfAY/Dorts2xBU?=
 =?us-ascii?Q?vzuTb8ZYPSpRPnKgi4XuoIN/EmS/FwHPgW1e9Xih+nWwIMnuNAsFDGvtv+1L?=
 =?us-ascii?Q?OdvupfXPamc+xUAJezlWoIHVheVW9He6quQVTjWV/VzlmKyRu5oSJ08dJJnm?=
 =?us-ascii?Q?k7FqtuSN6TTMiNG3ruI0ceeypQiEfUZfur+TtqNvlcwVB7UmNdnnaSw3PTGW?=
 =?us-ascii?Q?BtQJ/RX47UU4Q2fLriJc+UH/sUKoYjA6p0J2UMPgDEbLhn/Kq+GaF4xnydOS?=
 =?us-ascii?Q?D1YzMzWleDZoMTrd3MjhHnd2K+0MlhDzsoFoefGWHypR1zpYELfrZVmBhKsY?=
 =?us-ascii?Q?AAcNCkHCXHW4jW+ingqAACAfqZmx9NZjQkctXwlW7XuxhO83wOmdrRqc2vUu?=
 =?us-ascii?Q?gQ+kHl+aGaqLNIY/e9rzK11KR2GSWlDDe5WISMHnwG1/8VzVhEfU0CZHio9K?=
 =?us-ascii?Q?a85rCRD+P6Mmagkj6jUqXtCej3ANZEItSVWZlBTrQ/sQj44ZTd+YsBjaG5cH?=
 =?us-ascii?Q?Gd+vu3rKINFLJoDkBtXBBpocg2I4cXCoQNVXTpsnYHbPPtZFdjw7/bbdxw3h?=
 =?us-ascii?Q?nWFwQmQBEbkolU5IsiDlxbmFTLnYllj/yAjqWPLrMN6Mu9RdvIAXB4D2yMJ4?=
 =?us-ascii?Q?hFvFs828X5m0f0J42SFSTX5WAH6w2DgtwhrN/DQubTziidYnqsr9L0vKDRUj?=
 =?us-ascii?Q?w87OoXvP6BlAL8sLm4YUqtldAQJvaB8IlvGtMF/f5+xw2E4BjX3Pc3vEG9tq?=
 =?us-ascii?Q?crunkZp0QFNpAsxr1kkLTG0A3kX9X21abLhFffOd?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c561c9f-0eb4-49eb-936c-08dab5d11ef2
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Oct 2022 15:04:59.7884
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lzoBVaexeHaeDWW1MKPvrv4sLPqDQ3G4rcFgLxOa0st/vyfX3hio8jd/QaqkiEFOSpjj6JKmmHpEFz+DdQsEyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7413
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,T_SPF_PERMERROR autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



> -----Original Message-----
> From: Linus Walleij <linus.walleij@linaro.org>
> Sent: Friday, October 21, 2022 3:27 AM
> To: Shenwei Wang <shenwei.wang@nxp.com>
> > function PIN or not, but you can't know which GPIO port and which GPIO =
line
> the PIN belongs to.
>=20
> Cross-referencing GPIO line numbers to pins/pads is literally the job of =
gpio-
> ranges (the DT property) and we have excellent support in the GPIO librar=
y to do
> exactly this.
>=20
> It can even be made using static data in the driver if gpio-ranges for so=
me
> reason cannot be encoded in the device tree.
>=20

The current implementation is using the static data inside the gpio driver,=
 although it
is not used the gpio-range data structure.=20

> (...)
> > In order to build up the cross-reference between GPIO lines and the
> > PINs, you need have a pre-prepared gpio-ranges mapping in advance.
> > Because the relationship between the PIN and the GPIO line is not a
> > linear, you end up to build up the gpio-ranges in the same way like the=
 array in
> this patch. This turns to a chicken-egg problem.
>=20
> I don't get it. gpio-ranges can contain any number of "holes" and whateve=
r, the
> name "rangeS" (plural) implies it can be an array of ranges. If you want =
you can
> have a list of single-pin ranges, no problem.
>=20

 No matter you prepare the mapping by using the gpio-ranges or the static a=
rray in the=20
driver,  they serve the same purpose. The only user to use the mapping is t=
he gpio driver,
and the mapping is constant for a SoC family. That's why I chose to define =
the array inside
the driver.

> > As I explained above, this is not the duplicated information. It adds
> > another dimension of a information regarding a PIN. As these
> > information is standalone and self-contained,  no matter how you
> > change the pin tables, it won't impact the function here.
>=20
> Since the information/setting pertains to an electronic or similar proper=
ty of a
> pin it falls under the pin config umbrella.
>=20
> > This is a kind of GPIO wakeup function, and it happened to be given a
> > name called pad wakeup. From the user point of view, it works the same
> > way as the native GPIO wakeup. Except the name itself, it has nothing t=
o do
> with the PINCTRL.
>=20
> Hardly.
>=20
> The MMC/SD card bus has ways of waking up devices by pulling a line low, =
as
> does things such as UARTs. And then the pin isn't even used as GPIO.
>=20

That's another kind of wakup method. Currently we are talking about the pad
wakeup. The examples you gave like SD/UART, they are not pad wakeup feature=
,
we can call them as IP native wakeup. For example, both GPIO and SD ( or UA=
RT) have their
own IP native wakeup function. The difference here on i.MX8 platform is tha=
t
if you use UART's native wakeup, you have to keep power/clock to the UART I=
P block during the=20
sleep state. The same requirement for the GPIO and SD's native wakeup too.=
=20

> I bet a million to one that the exact same setting is used inside the SCU=
 for
> waking up on such events on the pins.
>=20

For those IP blocks' native wakeup, they are not managed by SCU. It is mana=
ged by
the block's driver directly. For example, the UART's native wakeup function=
 is
enabled or disabled via the driver itself, and no communication required fo=
r SCU.

> I don't believe that just because a pin is muxed to something else than G=
PIO it
> cannot be programmed to wake the system up.
>=20
> If you look into my presentation "building GPIO and pins from the ground =
up":
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fwww.df=
.lt
> h.se%2F~triad%2Fpapers%2Fpincontrol.pdf&amp;data=3D05%7C01%7Cshenwei.w
> ang%40nxp.com%7C5f49f959229e452da06408dab33e0e38%7C686ea1d3bc2b4
> c6fa92cd99c5c301635%7C0%7C1%7C638019376349152251%7CUnknown%7CT
> WFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXV
> CI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DCqud0jkMikeKz1Ok%2Bgm55mx
> kCeK3HQlqRU5n5RxU8VU%3D&amp;reserved=3D0
> see the picture on page 13 and page 18. The asynchronous edge detector is
> what takes the system online in sleep. That is a property of the pin cell=
, it has
> nothing to do with the GPIO block, which is further in.
>=20
> It belongs in pin control because it is a property of the pin hardware.

That's a very good presentation, but it is away from the topic. The GPIO bl=
ock has
its own edge detector logic for its native wakeup function. Here the pad wa=
keup
feature is implemented via an extra hardware logic, and it is an independen=
t IP block.

>=20
> > As I explained in the above, this is not the problem of two clients
> > accessing the same resource, so there is no conflict between the two
> > drivers. It works in the same way like SCU power domain driver and SCU
> > clock driver. The communication integrity is guaranteed by the call of
> imx_scu_call_rpc itself.
>=20
> I understand that it makes your life simpler to just implement this as a =
hack in
> the MXC GPIO driver like this, but it is not a proper solution, and I ask=
 you to do
> the more complicated and work consuming task instead.
>=20

This is not a hack because the imx_scu_call_rpc function is designed to ser=
ve multiple threads
use case. As the pad wakeup function is an independent feature accompany=20
with the gpio function, I prefer to put the implementation inside the gpio =
driver.

Regards,
Shenwei

> This is because it will have partitioned the problem in a clear way that =
is
> recognizable by the maintainers and will scale to other SoCs in the futur=
e.
>=20
> I also wonder where all the other i.MX maintainers are. I need their inpu=
t in this
> discussion.
>=20
> Yours,
> Linus Walleij
