Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 148AA1227FE
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Dec 2019 10:54:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727161AbfLQJyF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Dec 2019 04:54:05 -0500
Received: from mail1.bemta26.messagelabs.com ([85.158.142.114]:48314 "EHLO
        mail1.bemta26.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726700AbfLQJyF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 17 Dec 2019 04:54:05 -0500
Received: from [85.158.142.204] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-3.bemta.az-b.eu-central-1.aws.symcld.net id 29/F0-12313-2B5A8FD5; Tue, 17 Dec 2019 09:53:54 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA1WTfUwTZxzHeXrXu4NQdhQMDwx0doNMZwtsGI8
  /lJlscmSZMWYvxIhwhRttBqVcSwozCw7GhiCWTVTE8VIpbsImrnREKmQJK4ySQBXGSxgTgTLD
  23SIDsPL1uOK2/77/J7vN7/n+/zyewhE+iUeQrC5epbTMBkyzAdVRYpj5ZaGlaSo39cJyjZIU
  MvVvSh1ftKFUbX2fjG16lxHqMbzbSg18bgLUE9+KRZRFWtfiyjL9LCYKmzqR6iW2jVADdq+wq
  iHtiGEKuqw468/Rw99bsPpB6NFON1W9RtO3/mzG6Etjacxeny4HaNbzPm0s9IEaON6FP3Isv2
  IzzGxWqPMyk0Rq9oKfxRpL0lyV0dKsVNgybsEeBOAbEBg69XgEuDj5m4U1k/ZRELRAuBq2VOM
  L1CyB4Hf3p4V84WUvCCCiyODnsIFYMnMNcA3w0gKnuu5h/EcSCbDn6v7EN6EkJUYbO4aFvFCA
  JkGb3YW4CWAcJtY+HgjQvAb4A/tDpxnlAyHI0NPN+0SkoFlUz8B4bJ+FJ6+N74peJMx0DowIx
  ZeEQaXP2lCeEbIIDjmqt30QJKE5nYnIvA2ODu94fGz0FEwCoTzPbBvxOVhGayptns4DA7UlgI
  +JyTfhi3T+Vt264pTLDAFzaVFqGB5CW505gnHWliztOhJEAFHF4o9CULhr5XFm3OD5Dco7DGP
  4eUgsuo/qQXeA+tuLWECvwKvmuaRqs1R+EPHJRdaB9BGQCk5dbpKn8moM+TRUVHy6OjX5Pvks
  TEK5iO5UsHmyFNZjZ5j3KKCMegUurzM1Iw0hYbVW4B7PdOy8RM3QdnSoqITBBMi2TaJb/xKkt
  RPmZWWp2J0qmQuJ4PVdYJQgpBBSaHJrflzbDqb+4E6w73kWzIkfGWBkuPuNZdKdFomU6dOF6R
  eICfKZ6uvIFJUk6VhQ4IkBrPbRPImVY7mWYutrzIAwkICJMDLy0vqq2W5TLX+//ocCCKALECy
  j+/iq9bon9005w4hcod49fATPoSe+VcKOSUy+ZZMdVBBl+3X42dq7jceTI7u/yPYsm4NnGgOH
  sC3f4bhqeH1yvZ1Y4ct/C/z2dMG44NPpzL3LyyE3o+0ftd98s1H755d1k4OXrDWV6QkVA4lER
  tv3NCccB3dsd8Pnz+494xdf+To7dn03cvamEPinX+XS8ZbjvfdqT92zb/iulPXQH7/cp1f3mB
  EhdeB+DBHL2dcPNRFvxVwo2M4Ob4vkQto7eSaxjnmi3NGQ/OtK3JjyoumvXcvP3QUTLeewR2J
  HzryP3a+Y0iolBmyI7oPd8RNN8TNx45tKN+72EsdSIszDex6v/vkWkPcaq797pR1csdYzQuJF
  +UJu6Tzz2dPiOZiZahOxUTvRjgd8w9PtudTpQQAAA==
X-Env-Sender: Adam.Thomson.Opensource@diasemi.com
X-Msg-Ref: server-20.tower-249.messagelabs.com!1576576433!573952!1
X-Originating-IP: [104.47.5.57]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.44.22; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22593 invoked from network); 17 Dec 2019 09:53:54 -0000
Received: from mail-he1eur02lp2057.outbound.protection.outlook.com (HELO EUR02-HE1-obe.outbound.protection.outlook.com) (104.47.5.57)
  by server-20.tower-249.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Dec 2019 09:53:54 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I91VfgZEwvXXhx/1l2czFYCCmXfouonfxoPt6TW7iQBSJe83/gytchzVyVJVfmVWgFOXGp0kg5hn9bKbAN8rG5dGeV/As9MbSZYxy9ucbhrcycXw+a/f1byT6keGr/r5WcRwNcAOaSp35d1G71d3uSOizg831edG6v7AMaAdwqGP4Rw8hnNH5rCQPWiUqFWMmVrvxbeUjyk8WACBFRLwzrwxrdU2blsTmkYghybyPT/Q+YH4QOQaTVzoznLIJTbbNSHcUHMnbvc8fGpTJqZ4C54jlPIf786dUCQLTMspcBLAwXN4VXkNrbUCaMqZ3RdD3u6lMSIFjodSwSGmnlBl0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KfNb7A+2/4ZJNHnIn/aMJcXPVEwbv0Q2QZIPIo1TIOI=;
 b=SH1AyuoRzw1HmjuBbMMAO9MTTleXLK4fXpz8xvX3IeTMkKwRGTpEgTY5yxauxdBMN5XVIa2IAwpcA3jt8itxdHPU+gxu3r6vek1kJOU21adb2xDckTTz/BcbhHoVpxsDKcnQaMOuDWs9DV9ZVSGn7SytQoo24zQ5EgRc7x7vGsaNTtCxkDXpTe/hb58XGimn7BJNMBmADF1Y0hxb+BAxJPj/t5tc0yOq1TM+xp2YWLn90eV996/372mYlsExylCOyv1xYJdsHZqU12mhKyjSETq5C1N+yIbVs0L605mnH0CtMsiSL4XoodeLofyyb1mgB8GcZzq1WfYLmtkHKNus2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KfNb7A+2/4ZJNHnIn/aMJcXPVEwbv0Q2QZIPIo1TIOI=;
 b=kMYECdzJL4oV2TDdF6BejVst/9wP7DSNEtgwB4u81hXD0mWVORkQZ2vSdCVMolT7OclLKvk7A83GDXaSKqAkQSb6goSGMWxxT0uhchRkH/JgLvuTu8D7xRS7vi8rxJlkV1cM5uEuv9Xt8KMcS7ourKv89r5MZjA6+VcLplqSrZM=
Received: from AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM (10.169.154.136) by
 AM5PR1001MB1122.EURPRD10.PROD.OUTLOOK.COM (10.169.148.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.13; Tue, 17 Dec 2019 09:53:52 +0000
Received: from AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ed23:3ca0:97ef:c868]) by AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ed23:3ca0:97ef:c868%10]) with mapi id 15.20.2538.019; Tue, 17 Dec
 2019 09:53:52 +0000
From:   Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
To:     Marco Felsch <m.felsch@pengutronix.de>,
        Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
CC:     Mark Brown <broonie@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Support Opensource <Support.Opensource@diasemi.com>,
        "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "andrew@aj.id.au" <andrew@aj.id.au>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "joel@jms.id.au" <joel@jms.id.au>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH v3 3/6] dt-bindings: mfd: da9062: add regulator voltage
 selection documentation
Thread-Topic: [PATCH v3 3/6] dt-bindings: mfd: da9062: add regulator voltage
 selection documentation
Thread-Index: AQHVptoKIWnW5XGNx0qiesHaa7KQWaeqBMOAgAkpmQCAAfp+EIAAFOMAgAGB2oCAAAM8gIAACD8AgAXEVoCAAH+D4IABFEIAgAANuAA=
Date:   Tue, 17 Dec 2019 09:53:52 +0000
Message-ID: <AM5PR1001MB099460B2D291644F088707BA80500@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
References: <20191129172537.31410-4-m.felsch@pengutronix.de>
 <20191204134631.GT1998@sirena.org.uk>
 <20191210094144.mxximpuouchy3fqu@pengutronix.de>
 <AM5PR1001MB099497419E4DCA69D424EC35805A0@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
 <20191211170918.q7kqkd4lrwwp7jl3@pengutronix.de>
 <20191212161019.GF4310@sirena.org.uk>
 <20191212162152.5uu3feacduetysq7@pengutronix.de>
 <20191212165124.GJ4310@sirena.org.uk>
 <20191216085525.csr2aglm5md4vtsw@pengutronix.de>
 <AM5PR1001MB09941005A47B603805D3C53280510@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
 <20191217090034.GD31182@pengutronix.de>
In-Reply-To: <20191217090034.GD31182@pengutronix.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.225.80.228]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b66e2d2a-503a-4aaa-45a7-08d782d70618
x-ms-traffictypediagnostic: AM5PR1001MB1122:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM5PR1001MB1122FB156EF775A126EE7247A7500@AM5PR1001MB1122.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 02543CD7CD
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(366004)(136003)(376002)(39860400002)(396003)(346002)(189003)(199004)(76116006)(52536014)(8676002)(26005)(66476007)(66946007)(66446008)(9686003)(478600001)(5660300002)(2906002)(64756008)(66556008)(71200400001)(55016002)(81166006)(81156014)(53546011)(86362001)(8936002)(55236004)(33656002)(186003)(316002)(7416002)(54906003)(110136005)(6506007)(4326008)(7696005);DIR:OUT;SFP:1101;SCL:1;SRVR:AM5PR1001MB1122;H:AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: diasemi.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +5mpsqdmyUmUGkZmsr2STz7eBRoHDbZAYOoUeh7lJSWGgGm/kV0sA9RSbHiMEKx0nVjH+BKwXR90R3Ck/TVOoB4xvGVcNvrnXd6ndLCaMt52qgvZlSUqniQnYOdCio72wWw7OYlTVl8jUxWu4M0sKJYnz903WVLQObpJHSJlSqOS+0EMF7UEGhG+e8DY4KBZW/cuuDJqIsW5KRHHpphjBkQhVIs0rYwVMDOyZHOGE7wLRrEPaw19z/wCZJn6XI4IQVeRB8DKPVZuGGbTKuVpe+PHXYhnHOLfoF30yt94II+8x5P7/XOLduy8UahizV9pGxU0lIPoPN/OQ10q3FEWhKrJTq7/zffNODXxm3+5d/LnVzpnNY1kgdPUmv80j9MZ0JPafBskEMnZxiaCHFu+8ffcitxUBUIB7J1yPohp1i9d8221XeNqB3kZQKqs8WD9
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b66e2d2a-503a-4aaa-45a7-08d782d70618
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2019 09:53:52.6478
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WEPmqqguBtm5njHjaZ7awPVHovhDxv8O0tXmZ1fbexWSKwj2IGimNBWhMsUtK/+avwK0Xb+knAVGvtRHbpGWYXzsED7hg9Nwvwccjv/ofMU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR1001MB1122
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 17 December 2019 09:01, Marco Felsch wrote:

> > > The enabel control signal is always available, please check [1] table
> > > 63. There is a mux in front of the enable pin so:
> > >
> > >              +-------------
> > >  Seq. |\     |   Regulator
> > >  GPI1 | \    |
> > >  GPI2 | | -- > Enable
> > >  GPI3 | /    |
> > >       |/     .
> > >              .
> > >              .
> > >
> > > Adam please correct me if this is wrong.
> >
> > Yes the register can always be configured regardless of the associated =
pin
> > configuration, but if say GPIO1 was configured as a GPO but a regulator=
 was
> > configured to use GPIO1 as its GPI control mechanism, the output signal=
 from
> > GPIO1 would be ignored, the sequencer control would not have any effect=
 and
> > you're simply left with manual I2C control. Really we shouldn't be gett=
ing into
> > that situation though. If a GPIO is to be used as a regulator control s=
ignal
> > then it should be marked as such and I don't think we should be able to=
 use that
> > pin for anything other than regulator control.
>=20
> I see, so we have to guarantee that the requested gpio is configured as
> input. This can be done by:

This is one of the reasons I thought this was better suited to being done i=
n the
pinctrl/pinmux side. If you configure the GPIO as for regulator control the=
n
the code can automatically configure the GPIO for input. That doesn't then =
need
to be in the regulator driver.

But yes we wouldn't really want to configure a regulator to be controlled v=
ia a
GPI when it's configured as a GPO as it makes no sense.

>=20
>   if (gpi->flags & FLAG_IS_OUT)
>   	return -EINVAL;
>=20
> Regards,
>   Marco
