Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7B2B162D62
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Feb 2020 18:48:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726556AbgBRRs4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Feb 2020 12:48:56 -0500
Received: from mail-eopbgr20053.outbound.protection.outlook.com ([40.107.2.53]:6917
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726411AbgBRRs4 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 18 Feb 2020 12:48:56 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D9QaAI+omociSr3ChtBl26TVZnCoi/Tvv0QatzpFrk8gIdH1VY2Hw1377OxnxMIOvehFoiL4LURradRPUWsZ5dBccXpBkKFhCWjNJh4voDGA1PxmerTIseKcCY8GKhaEac7XmpkM4qt1K+PQDDWRNJhaSdcCh+GMx3sySqK9o6+9ohcEen2JfLt+I7ypznB0HOdOQRRn4raBVY75oaZhNUJoxEdJwJ4wD/JKSLGHvtainjdhwjcbtKEmHAu3dNrwIX/eTyKJVP4/eFSQgnEEdkfN6siCYqpZerImQlEytmyr+WsUQmXMVBpPSDvm+tAyZjvUKVa5jdTef8t0SmmEmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yz0kYFuv82HKWo/vr8c/lofCgWDiBaeUg061wNbgyAc=;
 b=MfTawPV1ZLbXWHv4u5yz2cwJ5Wl4VucRatdaJ/42RgsqbhWOF/QNWycvfX0nxO1P3KJwc3w3u6bRauchdFsWKLUX2bm1SDWM1qQfYfrs/bgoCmb5lLqDyFozYjSPWBBsPbaK7wjsu1LIQvihz2bLf2p86RPCOsYrqUZjjsJfsAxZTBa6uk14jxi7S8SmsjE2m3P5z9Jery4nvrOvm/dORDGLZprMqh97v+I1biY1LdwYh8C5aDk4TFt/8/1iDBM4xNjlUTDRWKhcv4z9qTCdZ5dU17nxl//Uwq+KxmwY/fzrBKcRjSyJI11Jt5L0aJkLTjTO/Qm2optHHWSS1sSoKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yz0kYFuv82HKWo/vr8c/lofCgWDiBaeUg061wNbgyAc=;
 b=aiZ0YFN1jwJUhXvmCl+s4CkGvua9fJAbO1Ht1mQqKS1/Pi7V9+e1QlhaEKYnyt/QJ9Qi84aCVagnxhbX8dT756gW0BQc5Wx/eEKVh/kdL8i4Iz6CCXCyJBhw75q5BoiVZGDumPDdugih4WVRtRNrOSkCuDjXKKdQHC2wr8yrhsU=
Received: from VI1PR04MB7023.eurprd04.prod.outlook.com (10.186.159.144) by
 VI1PR04MB2990.eurprd04.prod.outlook.com (10.170.227.29) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.29; Tue, 18 Feb 2020 17:48:50 +0000
Received: from VI1PR04MB7023.eurprd04.prod.outlook.com
 ([fe80::58c5:f02f:2211:4953]) by VI1PR04MB7023.eurprd04.prod.outlook.com
 ([fe80::58c5:f02f:2211:4953%7]) with mapi id 15.20.2729.032; Tue, 18 Feb 2020
 17:48:50 +0000
From:   Leonard Crestez <leonard.crestez@nxp.com>
To:     Shawn Guo <shawnguo@kernel.org>, Sasha Levin <sashal@kernel.org>
CC:     Aisheng Dong <aisheng.dong@nxp.com>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Anson Huang <anson.huang@nxp.com>,
        Abel Vesa <abel.vesa@nxp.com>,
        Franck Lenormand <franck.lenormand@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
        "open list:PIN CONTROLLER - FREESCALE" <linux-gpio@vger.kernel.org>,
        "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" 
        <linux-rtc@vger.kernel.org>
Subject: Re: [PATCH] firmware: imx: Align imx SC msg structs to 4
Thread-Topic: [PATCH] firmware: imx: Align imx SC msg structs to 4
Thread-Index: AQHV4SGqSL+k7/w06UOL1nyEN5GYug==
Date:   Tue, 18 Feb 2020 17:48:50 +0000
Message-ID: <VI1PR04MB7023C1C536805130D9429E11EE110@VI1PR04MB7023.eurprd04.prod.outlook.com>
References: <3a8b6772a1edffdd7cdb54d6d50030b03ba0bebb.1581455751.git.leonard.crestez@nxp.com>
 <20200217062129.GB6790@dragon>
 <VI1PR04MB7023CDE9E4AD086F2E926495EE160@VI1PR04MB7023.eurprd04.prod.outlook.com>
 <20200218091831.GB6075@dragon>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=leonard.crestez@nxp.com; 
x-originating-ip: [89.37.124.34]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 7ba8ee1f-efb6-4296-5133-08d7b49ad049
x-ms-traffictypediagnostic: VI1PR04MB2990:|VI1PR04MB2990:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB299084688AF8A783DDD2E122EE110@VI1PR04MB2990.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 031763BCAF
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(346002)(396003)(39860400002)(366004)(136003)(376002)(189003)(199004)(64756008)(66556008)(66446008)(71200400001)(66946007)(91956017)(66476007)(76116006)(5660300002)(8676002)(186003)(4326008)(8936002)(53546011)(6506007)(81156014)(81166006)(52536014)(54906003)(2906002)(9686003)(55016002)(478600001)(44832011)(316002)(7416002)(110136005)(86362001)(33656002)(7696005)(26005);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB2990;H:VI1PR04MB7023.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WVc9fxQq0pl+JrAmh5hTaBssm/tHBO7aS2m4iQMF0g5Xh3r2+Q+pCPVICTBsxtRDd0W9rmq7cJQ8q3vaxMJl2+rOHfZzXvTKwZWI00KPdWsjcPq9A6rLMfOCb1SO8dKELIBK1JXZk6SGUbDjtu45QMBL/l8gDS1922cmu/RdJ+rEomsM70OW+b6paR/GxwVyi1Q/WXXJS4EqCK4g66TclZvb5qO1eCkLQJV+WjMb59Q2JkG6p65OxPFs+XDayr3Yz2r1WX6a7+0YaBPUnIvKFxCX74TNiEzonaQ1S8po3rE2fz1vuiF2MH2zFNQzq8Ee5v6G64h2EckRtzc/u/3QMwZme5JRcniGioUne7EYw908MV64zmqlVPndTQnSb6XOBoNR6c6jSu3KBgFmtOUvxOQQyLlxYDFhhcjWh5d+sa1KBbYWkwa4GklA2K4+gDa2
x-ms-exchange-antispam-messagedata: VLY1Yd3N5w8Rzyg+E8T6q6K4CNq7YSgNND+PGw2iEF389IqRTEYqVGrgdWluDH2bre9WtF8ss5j0232nquxZhD8A5VaX7GKR83MnahZAtJVO2zJ3a5JJwTIrux87UIT7rszswB3zdnUDq/tzWi3FCg==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ba8ee1f-efb6-4296-5133-08d7b49ad049
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2020 17:48:50.7787
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h/i72ZIVcUjXCbdcvDeuOsH3O+B2b5CMNXBRG+d24zhTN2uC9Svc9WJnm35A45CtDMxJNQ9mdOC8iiLhNMFwKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB2990
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 18.02.2020 11:18, Shawn Guo wrote:=0A=
> On Mon, Feb 17, 2020 at 08:37:45PM +0000, Leonard Crestez wrote:=0A=
>> On 17.02.2020 08:21, Shawn Guo wrote:=0A=
>>> On Tue, Feb 11, 2020 at 11:24:33PM +0200, Leonard Crestez wrote:=0A=
>>>> The imx SC api strongly assumes that messages are composed out of=0A=
>>>> 4-bytes words but some of our message structs have sizeof "6" and "7".=
=0A=
>>>>=0A=
>>>> This produces many oopses with CONFIG_KASAN=3Dy:=0A=
>>>>=0A=
>>>> 	BUG: KASAN: stack-out-of-bounds in imx_mu_send_data+0x108/0x1f0=0A=
>>>>=0A=
>>>> It shouldn't cause an issues in normal use because these structs are=
=0A=
>>>> always allocated on the stack.=0A=
>>>>=0A=
>>>> Cc: stable@vger.kernel.org=0A=
>>>=0A=
>>> Should we have a fixes tag and send it for -rc?=0A=
>>=0A=
>> I haven't check but this would probably have to be split into multiple=
=0A=
>> patches because the structs were not added all at once.=0A=
> =0A=
> Or maybe we can just drop the stable tag, as it addresses a corner=0A=
> case issue which could concern very few people?=0A=
=0A=
I think that "kernel does not boot with KASAN=3Dy" is an issue worth fixing=
.=0A=
=0A=
I will split and resend with appropriate Fixes: tags.=0A=
=0A=
It seems likely that this will be picked up for -stable anyway via =0A=
Sasha's automation scripts and those scripts benefit from Fixes: tags.=0A=
=0A=
--=0A=
Regards,=0A=
Leonard=0A=
=0A=
