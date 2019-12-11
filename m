Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0798211B84B
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2019 17:14:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730587AbfLKQOP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Dec 2019 11:14:15 -0500
Received: from mail1.bemta26.messagelabs.com ([85.158.142.5]:41876 "EHLO
        mail1.bemta26.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729522AbfLKQOP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 11 Dec 2019 11:14:15 -0500
Received: from [85.158.142.98] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-5.bemta.az-a.eu-central-1.aws.symcld.net id 24/AF-19908-3D511FD5; Wed, 11 Dec 2019 16:14:11 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA1WTfUxTVxjGOffethekeiltOBKRWaaLG610xHH
  BbZk4kquOhW1ZtumQXeRKG6FgWxi4LMMPpJY4O6AgDQhKgQDqJihCxbER+bB8Rb6sONnQzgFu
  k4rgJh9ZLxfc9t/vfZ8n7/uck3NwVJQj8MWZNB2jUdMJUr4Hpty0crOsX+KMDiq9s4K09uPkk
  2IbRppGHXyy5HoPj5ztnUfJalMjRv483QrImQE9QubNVSJk7f0hHnmkpgcl60rmANlvLeKTk9
  ZBlMy8dl3w1ipqMMsqoB7ZMwVUo/mugLrpbEOp2urjfOqnoSY+VWf5iuo9dQZQJ+eDqKnatVE
  eu3gqdWxS2mc8peGSHUs2rk3rLhrDMsAlsQG444AoR+Hc9McG4OHiNgx2zzQjXFEH4OyJv/ls
  gREdKHxW82CxEBEmBLaXOxGuGAXQ0nGZzw7jEyTM7fhlkcXETnjy7C2MZZR4yoPmhTCWvYk42
  NByWGAAuMvDwOmFDZw9HBpv3kFYxoj10GwaWRwjJGhoqvwRcLvaASx5OiVgBXfiDVgzaES4Q/
  jBJ4dqUG6XDxx2lCz2IUFAS1MvyrEEjt9f4HF+Bt44bAdcPxB233IssRRW2M08jv1gX0k2YHN
  CIhLm5/gt28t68zGOSWjJzsQ4y4twoSWdayfDzuH6pa0vwaPO00sT18DWi+cw9iiQqMDgwuw4
  YgSbzP9JzXEgLL36mM/xK7DizEPUvHgVXvBGoQMrBVg1CI3VqOKVukRalSBTBAXJFIpgWbDs1
  aDX5PRBGS1nUmR7GbVOQ7tUOf25Vq5NT9ybECdXM7pa4HqecQfQngaQNfOHvAWsxhGpREjNTE
  aLVsYmxaUraa0yRpOSwGhbwBocl0Lh22JntMhLw8QzaftUCa5HvixD3FMqFo55u2ShNplO1Kr
  iOckGZLhxvPgsKsLUSWrG10e4hTURrEmZon4+Yvmr9AE/X28hcHNzE3kmM5pEle7/+gTwwYHU
  W3iPneKpUuueb5pwhUBcIY7H/cmG0NH/Sr4ZSLH+nQeFF5o3bB/23PNu2evvRW4Lm5if66vdv
  XmkUp+VnbEjqezLqt7689V7bA0RoasMMRfXn+q2jga+ebBr8MQVoqlo+u6h8LLkmBeOHf11l3
  Fra165xuZ/Lyrk8bkVNmlEiOJ8eG7k0HhDVN6WjZ3HTGPfkLyR3xW3xR0P0+JHnznEX3t9mot
  Gphb5N3i7b9Vvs6Ts3vd+StToTio1PDwjuCrgI2Sq0Z+xpAZ3Fjr1B+yJBWrN9pwrqx/99W3A
  hy0D+Rtbu1I9wtbVBBz55APJ/p5c36bQ+B329v1JngVTjmpT27Wrl63ppt8k+Lp6Q0FTVsgPA
  xeKIr67TUpOf19l+2KyObBLimmVtOJlVKOl/wFy6hilpQQAAA==
X-Env-Sender: Adam.Thomson.Opensource@diasemi.com
X-Msg-Ref: server-28.tower-223.messagelabs.com!1576080850!204737!1
X-Originating-IP: [104.47.14.53]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.44.22; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19680 invoked from network); 11 Dec 2019 16:14:11 -0000
Received: from mail-vi1eur04lp2053.outbound.protection.outlook.com (HELO EUR04-VI1-obe.outbound.protection.outlook.com) (104.47.14.53)
  by server-28.tower-223.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 11 Dec 2019 16:14:11 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PKxKuCIRIHurc9OxCuwuvLAEEJc1THNaRPIKAV4LeH1/j35rN9rF4bbf5vJ0iBL1oGTX8xkQHs0+4vs+6/v+UMpqG+pUvVOfJdLX53gS7jF1l8VQg3xrtjQiRGZnoNYaJfHlXaDCpwWVnub91NFP7RPH3FheV+EC5AQWXaKEx4KZwG8m8rIv1JFpIVXoXSWBcvC3dT0o+koNRvBB7FTrItpcsw9/YdW4+dcWPkUYfPJc9wP6KRyxv147Vne8ArT1BoU1QkXrmPNkTQcWiyXRZfKMyOZTux1qm3DCUEEuHlupN2l6A7Ve6zcP5w10SRULSonTy5lLNrFlbog75xYImg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AV4w6flc1LNMDmaF8PBCJQQ4yDNZ/5O4DTfYvofgX4A=;
 b=OOsnjoI8dGAYpzbpO+mz7020aKzZmZ4vXLkUF1t29ajWNw2/6Q21iu5txB3iOhewVqao6vKAv2mi8LOMsIIKeX5curlDXDhn/s3sR70C20TcHPuX9KTlJzGQfjnPHGTk8c/5AT/UFODGjlrKBjyvQ8ihQDIxms06nQ88M/bF4Ax5ViN3r8zzeLGtjNyUlM59GPnVwA2J1UHhadwM85zbs/hPbh83HTlc651Xd4RI+hru627YiwaM7gf41zN91aEcKMIL0gmmIVl9zjZ5AIUh0AaMT+14zMl9XFc3cw88KbS+K9bOKGRW1QkCeAoH25IpeR+ccsC8vxMdTEJtvGiZMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AV4w6flc1LNMDmaF8PBCJQQ4yDNZ/5O4DTfYvofgX4A=;
 b=wML3HsBDuPy42q0zIZDcBzzkvZGTlPEVRIZ1iYFs7gFMGK+xAW6uoNyjnY/1IUpHJZIzHVKTm93FLG4c6kEJundX0jHeTWkinDBG+t6URYcOA6NS9Z2thAwF2hmT8uP61trZldhq5hwLbB0qCDE9L/kJWvrucQuZI1MXsSp05B8=
Received: from AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM (10.169.154.136) by
 AM5PR1001MB0993.EURPRD10.PROD.OUTLOOK.COM (10.169.154.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.14; Wed, 11 Dec 2019 16:14:09 +0000
Received: from AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5525:87da:ca4:e8df]) by AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5525:87da:ca4:e8df%7]) with mapi id 15.20.2516.019; Wed, 11 Dec 2019
 16:14:09 +0000
From:   Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
To:     Marco Felsch <m.felsch@pengutronix.de>,
        Mark Brown <broonie@kernel.org>
CC:     Support Opensource <Support.Opensource@diasemi.com>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "joel@jms.id.au" <joel@jms.id.au>,
        "andrew@aj.id.au" <andrew@aj.id.au>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: RE: [PATCH v3 3/6] dt-bindings: mfd: da9062: add regulator voltage
 selection documentation
Thread-Topic: [PATCH v3 3/6] dt-bindings: mfd: da9062: add regulator voltage
 selection documentation
Thread-Index: AQHVptoKIWnW5XGNx0qiesHaa7KQWaeqBMOAgAkpmQCAAfp+EA==
Date:   Wed, 11 Dec 2019 16:14:09 +0000
Message-ID: <AM5PR1001MB099497419E4DCA69D424EC35805A0@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
References: <20191129172537.31410-1-m.felsch@pengutronix.de>
 <20191129172537.31410-4-m.felsch@pengutronix.de>
 <20191204134631.GT1998@sirena.org.uk>
 <20191210094144.mxximpuouchy3fqu@pengutronix.de>
In-Reply-To: <20191210094144.mxximpuouchy3fqu@pengutronix.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [193.240.73.196]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0ba1fc48-a343-4396-6502-08d77e552796
x-ms-traffictypediagnostic: AM5PR1001MB0993:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM5PR1001MB09933A83114E60F8B00C477BA75A0@AM5PR1001MB0993.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 024847EE92
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(366004)(136003)(39860400002)(396003)(346002)(376002)(199004)(189003)(53546011)(66476007)(66446008)(186003)(2906002)(52536014)(76116006)(64756008)(9686003)(55016002)(66946007)(26005)(86362001)(66556008)(8936002)(5660300002)(6506007)(54906003)(110136005)(478600001)(7696005)(33656002)(71200400001)(966005)(81156014)(8676002)(7416002)(4326008)(81166006)(316002);DIR:OUT;SFP:1101;SCL:1;SRVR:AM5PR1001MB0993;H:AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: diasemi.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: J3sMxB7NYJyFdUcdBWzTaLsyf/I6yD+Kyi+oAz5uXiPKXwDylbhQvR30AVnXAtIJypLkOmYLuXOPaPLHslDod9K/S1yTlNS5gLbeUtmBd5h0QQBe2tkyM7jxq9BEL+X015J8bPKXho42/dbPB9Vxi2Je0XkaEJAvBSd6tsBIwXaus7TufnlOFxDZMtKVk0wsHEGkhJWL057SH/Rght1bj1Y0ArhqKcdzKpUvZ338NBTztpjRhm96XQMhnfzYnKoCJLsuHioTCnUHdevedhV9xu5ObBsCp5vt2GpEr96yBjrc7RCBRgnOenv2MpIgRLA6fd+R+STjbYtnJclyb0LKd0LSMkyXWavsXgUSLADeOeHlliTMuBZqkLS2AQo1IzkLKl1NhF6zdHDpzGwPa00NwUUK1SqvNDrCNE4xBKsEfZUg3YTuW3O9CaVDFWppheWl97VoaJSDUjl+WboYhDDus2fbItdLc2TcBeVW+nxCPEE=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ba1fc48-a343-4396-6502-08d77e552796
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2019 16:14:09.5882
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4VWJQ23V7FoYM5Gh3qCXrR4JtPCu6Lf4obwBSx08HRV1S51HSXNikG+uprB8oXz9nP+AIoCTCtzvHERu0U4Hwjk8jvTyVpav2ntto3goBGw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR1001MB0993
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 10 December 2019 09:42, Marco Felsch wrote:

> Hi Mark,
>=20
> On 19-12-04 13:46, Mark Brown wrote:
> > On Fri, Nov 29, 2019 at 06:25:34PM +0100, Marco Felsch wrote:
> >
> > > +  Optional regulator device-specific properties:
> > > +  - dlg,vsel-sense-gpios : A GPIO reference to a local general purpo=
se input,
> > > +    the datasheet calls it GPI. The regulator sense the input signal=
 and select
> > > +    the active or suspend voltage settings. If the signal is active =
the
> > > +    active-settings are applied else the suspend-settings are applie=
d.
> > > +    Attention: Sharing the same GPI for other purposes or across mul=
tiple
> > > +    regulators is possible but the polarity setting must equal.
> >
> > I'm really confused by this.  As far as I understand it it seems
> > to be doing pinmuxing on the chip using the GPIO bindings which
> > is itself a bit odd and I don't see anything here that configures
> > whatever sets the state of the pins.  Don't we need another GPIO
> > to set the vsel-sense inputs on the PMIC?
>=20
> Yes the PMIC is very configurable and it took a while till I understand
> it.. @Adam please correct me if I'm wrong.
>=20
> The PMIC regulators regardless of the type: ldo or buck can be
> simplified drawn as:
>=20
>=20
>=20
> da9062-gpio               da9062-regulator
>=20
>   +-------------------------------------------------------
>   |                  PMIC
>   |
>   > GPIO0            +--------------------------+
>   |                  |         REGULATOR-0      |
>   > GPIO1 -------+   |                          |
>   |              +-- > vsel-in    voltage-a-out <
>   > GPIO2        |   |                          |
>   |              |   > enable-in  voltage-b-out <
>   |              |   |                          |
>   |              |   +--------------------------+
>   |              |
>   |              |   +--------------------------+
>   |              |   |         REGULATOR-1      |
>   |              |   |                          |
>   |              +-- > vsel-in    voltage-a-out <
>   |                  |                          |
>   |                  > enable-in  voltage-b-out <
>   |                  |                          |
>   |                  +--------------------------+
>   |
>=20
> The 'vsel-in' and 'enable-in' regulator inputs must be routed to the
> PMIC GPIOs which must be configured as input. If this is a pinmux in
> your opinion, then yes we need to do that. IMHO it isn't a pinmux
> because from the regulator point of view it is just a GPIO which comes
> from our own gpio-dev (da9062-gpio). So the abstraction is vald. Anyway
> I'm with you that this isn't the typical use-case.

We've had this discussion before and to me it felt more like pinmux than GP=
IO
although I understand we're configuring the GPIO pin as input before then
configuring a regulator to take that specific internal GPIO as the control
signal. We're defining a specific role to this pin in HW rather than it bei=
ng a
general software handled GPI so it feels like this would be neater under pi=
nmux.
There does still need to be a mapping between that pin and the regulator wh=
ich I
guess would be served by passing the pin to the regulator through generic p=
inmux
bindings and then in the regulator code you're simply just enabling the
regulator to be controlled from that pin. The HW lets you control multiple
regulators from the same input pin so there's a flexibility there to be
captured, as you mention.

>=20
> Regards,
>   Marco
>=20
> --
> Pengutronix e.K.                           |                             =
|
> Steuerwalder Str. 21                       | http://www.pengutronix.de/  =
|
> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    =
|
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 =
|
