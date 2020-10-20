Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7839329355A
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Oct 2020 08:59:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404713AbgJTG7y (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 20 Oct 2020 02:59:54 -0400
Received: from mail-bn7nam10on2075.outbound.protection.outlook.com ([40.107.92.75]:19617
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2404710AbgJTG7x (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 20 Oct 2020 02:59:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fqQC1TGsqFAIxa7GbMtXo3jBjpwsdk859B2zinvpBpacvS4aCQ7oJmjtk7NuY+mUGcF7g4iiavtcD3+211S1ioYwRKVVPXPu8+XLc9Qjt2uvnfA8BV+BbPqpah3tywE8CdJLQV3RkXaYL4a/jA1WgpKC4V9hj62eBq5UmtEL4IumAwhLgBfVs4utJtu5QrAKeKCbTeZLM+4gP4wWEQ15lKS0LfW+Nj0HC/Xq3ZjGIfPnC+MGYm4SVuvF+yqrxf4Fvd2NENuAfqceAl9HVFiYL8bKjGgV7ln8ZE2+gL/u1+CcHwMu0ZxYITyE71t28EYs+Y8u67lN8A1Do9NVCPdcnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=98zPt5oDpfc1VAPZy0cBv6YLZSuwHcORtO2zFKZVo1k=;
 b=LDya+9DYI7z3lRwwP2k//AIYXlsi3cbfcI79p52nH9JeLAjEhNUeKeMXvEtCLB9pTW39IDk5YmuwxTHS7mQzbpxdG4tb/HudzOilkzu4+PBxwbRHCymq1AJAdzDXdzMfitSvyScFb9fK43V58eTegPaFPcZw1YIFcs2dCjFEkKPbbsNMXugGO7osvxbd95NV5llHgqUKJ/DPkQnK6ASPMpvmq/qIQWbj44hMHlakGCfHF6QNHPHclSdyPYYxLg+OvtJjWkcW+u+g/rJMTZ+sAvR6UZw2fxTMC/QvD9aWKxAYfLdLm+Dc3YKcPIwqGwXhFbP1+378izUXewirSN0JHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=98zPt5oDpfc1VAPZy0cBv6YLZSuwHcORtO2zFKZVo1k=;
 b=OUzPOt+SNFo3aYjnYVcbmiwFKGyFzg1uAopcHtVlfyg9dZ8/y91C+rqFOUSpDMGSdB6SmJhETqTj4wuihiexBm6T+eFfYlG/QXdqhETEp8aXX6Q7oBx6iuZAmmlJK82g8Wutw0wlAmOIXHlDqfsI8h7bzKA29vPxlMguW+QT81w=
Received: from DM6PR02MB5386.namprd02.prod.outlook.com (2603:10b6:5:75::25) by
 DM6PR02MB4362.namprd02.prod.outlook.com (2603:10b6:5:2d::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.18; Tue, 20 Oct 2020 06:59:48 +0000
Received: from DM6PR02MB5386.namprd02.prod.outlook.com
 ([fe80::84ca:4b6c:d1e1:20e2]) by DM6PR02MB5386.namprd02.prod.outlook.com
 ([fe80::84ca:4b6c:d1e1:20e2%5]) with mapi id 15.20.3477.028; Tue, 20 Oct 2020
 06:59:48 +0000
From:   Srinivas Neeli <sneeli@xilinx.com>
To:     Robert Hancock <robert.hancock@calian.com>,
        Michal Simek <michals@xilinx.com>,
        Srinivas Goud <sgoud@xilinx.com>,
        Shubhrajyoti Datta <shubhraj@xilinx.com>
CC:     git <git@xilinx.com>, linux-gpio <linux-gpio@vger.kernel.org>
Subject: RE: [PATCH V2 0/3] gpio-xilinx: Update on xilinx gpio driver
Thread-Topic: [PATCH V2 0/3] gpio-xilinx: Update on xilinx gpio driver
Thread-Index: AQHWYPp3HgetPDFFh0uAYJli9r7Ng6mfvfoAgADcH4A=
Date:   Tue, 20 Oct 2020 06:59:48 +0000
Message-ID: <DM6PR02MB53868B37CD6C93BB4F9FCF98AF1F0@DM6PR02MB5386.namprd02.prod.outlook.com>
References: <1595513168-11965-1-git-send-email-srinivas.neeli@xilinx.com>
 <YT1PR01MB3546541973024526CDB6BBECEC1E0@YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <YT1PR01MB3546541973024526CDB6BBECEC1E0@YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: calian.com; dkim=none (message not signed)
 header.d=none;calian.com; dmarc=none action=none header.from=xilinx.com;
x-originating-ip: [157.44.50.223]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b7c3a22b-f348-46f8-67bf-08d874c5bc07
x-ms-traffictypediagnostic: DM6PR02MB4362:
x-ld-processed: 657af505-d5df-48d0-8300-c31994686c5c,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR02MB43629CC53C8BEA6CEC5FDD36AF1F0@DM6PR02MB4362.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xUyYVYxhn81aRnvz7eWSipknwnrYmRSVaIlbnk/q/3zcGo0xwA+2EJUlXlnBI96O35mo8iCantudHF3bRP1c9AmymOgyvNweIhXnYDGN9l/wpq3xvMpQbsHEdaLWAxp0K4c6uqerIhNux1392rISSaY0e4W6JpPQ0SBOpU+uDp8K0ONVds1wbWCsUx4LPj3Qz4yIVIiHaOuQbnG0oAm9DlU0Rd6n3MC3XYtjdBY+htf2cdG8p+Dtl9GkPqGgrm7P1ZCqPRmHDmyqmzAfk7SQfh+ZykGUFiYQ3TXjb6+2EiO2nV/3QFcZT/wOgkJZYRE6SRaxYo0dMBtG4EW83duk7xZJFvpYld9XFWSpLwi35TDIvtnfmTAeDIzumaOlcVPxeWeLOZzoRVeZmFTdHS/9qQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR02MB5386.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(346002)(366004)(396003)(136003)(39860400002)(15650500001)(8676002)(6506007)(55016002)(26005)(186003)(110136005)(316002)(508600001)(54906003)(7696005)(15974865002)(53546011)(33656002)(86362001)(4326008)(8936002)(2906002)(9686003)(6636002)(76116006)(52536014)(71200400001)(66446008)(66476007)(66946007)(64756008)(66556008)(5660300002)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: sxeaRhgAVTscg8VvK64Qx8lrJA9pcbTgUPOZFr9uhDXPIM1Xh7Wiq4BUQSfDVjsKcMGhsQ3XHp85WdSrfoCvTwAEhN0spse3vJk2K9SFAXEta2rnePGhFKkydu/+O/nUGTOAx5quY/hpR/TG8VPb5FwFlwF/PmcH2j14j8SXh/i0EECeM9Bg4g25uQG6Or4GaKwPzuh/ZWavby4T9ULJcbOeaj3pyDF6oaSJE2qdX+MB6NGFgfDsI+GaH2DP6IE8madaFbicteNjZ9laC0xAYkp+LdcNefJdM6jHQnurC6CtOYwx5/EejoRh1AM6sAMluogaP52WHdA39Dor9lU9CnJKEQbzYn4lyrzGldn2WEv1V/8KeIlhWkrYg0Qa04nRjSMxSqQiQsNZb1oNwXg02YW6xbekYzn8as4HKDjV9eH6NfP83mc4LyCHL9IN63Xf+29eXTMu+KtXske2w6OcJneC6jiQMEuHxjy1hpUv2twGXHhbJcJk38hh3Gm0TV8EL4Dx/bsYYQNuKeECU83WouFctxyYI+7wIsOafqq0OjPxwIA3P/dtMXwhFOP3aF9XrQRJ2DlTCtXplk5jmX01Eu20g1ZFyLOSdkw2js8OvFVuDsZgJBfKK3G2jg99MFN1SrkPkK/dGnQdWB6NEHDBJA==
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR02MB5386.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7c3a22b-f348-46f8-67bf-08d874c5bc07
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2020 06:59:48.2627
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SSLhjtrbaWHENmxu1bKHmY4IZ7SKNHYuM9UAWCZCDEYIFM36MXEwXw01R0s5t+E9TafO546idomyJKVICgcu5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB4362
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Robert,

Will send the next version(v3) after Mainline Window close.

Thanks
Srinivas Neeli.

> -----Original Message-----
> From: Robert Hancock <robert.hancock@calian.com>
> Sent: Monday, October 19, 2020 11:18 PM
> To: Srinivas Neeli <sneeli@xilinx.com>; Michal Simek <michals@xilinx.com>=
;
> Srinivas Goud <sgoud@xilinx.com>; Shubhrajyoti Datta
> <shubhraj@xilinx.com>
> Cc: git <git@xilinx.com>; linux-gpio <linux-gpio@vger.kernel.org>
> Subject: Re: [PATCH V2 0/3] gpio-xilinx: Update on xilinx gpio driver
>=20
> Hi Srinivas,
>=20
> Just checking if there is any update on this patchset? It looks like ther=
e was
> some feedback but I didn't see another version submitted.
>=20
> Robert Hancock
> Senior Hardware Designer, Advanced Technologies www.calian.com
> www.sedsystems.ca
>=20
> From: Srinivas Neeli <srinivas.neeli@xilinx.com>
> Sent: July 23, 2020 8:36 AM
> To: bgolaszewski <bgolaszewski@baylibre.com>; linus.walleij
> <linus.walleij@linaro.org>; michal.simek <michal.simek@xilinx.com>; sgoud
> <sgoud@xilinx.com>; shubhrajyoti.datta <shubhrajyoti.datta@xilinx.com>
> Cc: git <git@xilinx.com>; linux-arm-kernel <linux-arm-
> kernel@lists.infradead.org>; linux-gpio <linux-gpio@vger.kernel.org>; lin=
ux-
> kernel <linux-kernel@vger.kernel.org>
> Subject: [PATCH V2 0/3] gpio-xilinx: Update on xilinx gpio driver
>=20
> This patch series does the following:
> -Add clock adaption support
> -Add interupt support
> -Add MAINTAINERS fragment
>=20
> Changes in V2:
> -Added check for return value of platform_get_irq() API.
> -Updated code to support rising edge and falling edge.
> -Added xgpio_xlate() API to support switch.
> -Added MAINTAINERS fragment.
> ---
> Tested Below scenarios:
> -Tested Loop Back.(channel 1.0 connected to channel 2.0) -Tested External
> switch(Used DIP switch) -Tested Cascade scenario(Here gpio controller act=
ing
> as
> =A0an interrupt controller).
> ---
>=20
>=20
> Srinivas Neeli (3):
> =A0 gpio: xilinx: Add clock adaptation support
> =A0 gpio: xilinx: Add interrupt support
> =A0 MAINTAINERS: add fragment for xilinx GPIO drivers
>=20
> =A0MAINTAINERS=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0 10 ++
> =A0drivers/gpio/Kconfig=A0=A0=A0=A0=A0=A0 |=A0=A0 1 +
> =A0drivers/gpio/gpio-xilinx.c | 404
> ++++++++++++++++++++++++++++++++++++++++++---
> =A03 files changed, 395 insertions(+), 20 deletions(-)
>=20
> --
> 2.7.4
