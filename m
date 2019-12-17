Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 82C99122CA0
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Dec 2019 14:13:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727522AbfLQNNS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Dec 2019 08:13:18 -0500
Received: from mail1.bemta26.messagelabs.com ([85.158.142.3]:63196 "EHLO
        mail1.bemta26.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726858AbfLQNNS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 17 Dec 2019 08:13:18 -0500
Received: from [85.158.142.98] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-3.bemta.az-a.eu-central-1.aws.symcld.net id 89/50-12307-864D8FD5; Tue, 17 Dec 2019 13:13:12 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA1WTe0xbZRjG+XpOT886Ws+AyQcZxDQwk0FLQbM
  ds2DMRHeMGypeoiZsO9AjrZYCbWEwE9koMK7SZUIQVi4bN6lBQpnc1VRggFwCDCQKcqtzMHZh
  sArC0B4OTP3n5Pd+z5P3fd4v38ERl3yBJ84k6hmthlZLMCGqDACHpcqba+HyXuvTZOsoTq6a+
  lAyf9aGkaWdg3xyY+gxQtbmt6Dk9KMuQNpvZvDILzareWTD/DifNJgHEdJSugnI0dYrGPmgdQ
  wh0zo6BS89RY1dbBVQ9yfSBFRL0ZSAGl7uRqiG2kyMmhxvxyhLRTI1VFgOqLzHcmqlwftN4Yd
  8lSYiJvEMX3nxYRMW+4M48a+SeeQ8GBNmgT04ICoR2DDrnwWEDu5G4ezsPYwrLABu5K5vFyjR
  g0Dz4jLKFi5EAQ/+tJmHcYUNwHVbMco2wwgSXu6ZwVh2I07DG6YBhDUhRCEGv+ka57GCK6GAz
  dYUQRbAHSYGPto6yHrcCAOAX60ZBKwHJXxh43cdfJZFBA0HOnJ43LRVFBbM5QBW2EM8D1eW01
  FuDS+4esGMsIwQ7vAXW+n2MEgQsKJ9COF4P1yY3+Jzfgb2pkwA7twfDvxs22EJLDF17rAXHCn
  N3uGTsHjSju76+2/VYByTsCI7DWWXgYQP3LImccexcGB4gM/xQTixlLET4QD8tTCDz+4CiRoU
  9ndm8o0goOg/sTn2h2VtDzGO/WBV+R2kaPsu9sHeL21oGUBrwQsRWlWUUh9Nq9TSQLlcGhj4n
  NTxPSKX0eektIyJl0YyGr2Wdqgy+qxOpkuKjlQrZBpG3wAcL1QR51TbDC7Z78qswAPnSfaL7r
  ashbuII2IUSUpapzytjVczOis4gOMSKBKOOLR9WiaKSfxIpXa8810Z4s4SN5Fg1CGLdLF0tE4
  VxUl9QIobF0xXERdUE6NhPN1FjayJYE3KeM2TFrt/ywjw8nQVAScnJxfnWEYbrdL/X18E7jiQ
  uIrOsF2cVRr9k0mLjhA8R4igUDsbQk//K3me56UYN/ze2qsYuf1MSLQ8MDkEXDqS+21dQPNnj
  DLstfLcKros75X1Y3VLQpGf+taE0bXaUFgdYCkG4R+Ygl6O+/vY6sSVoDX34/2q381R/uL71o
  89rqcFzz+oCkGaxovzwvpOhM01FR36ujIu4d702zPXxtMrL7+z4Ftp3nv71U+3sOm27k+Guws
  jo4wJp0rWQnoT68nJzMY/ko7f8Ui1n/P7vK7HrK9/0e3oG212w1nq9anrAvcTp8qqcrx9p2p8
  N5PpudiR7GDYtV7gVISN/dariLdUGYOv1m6meh99b6YlwfDuhZPf+14Ti5/NWwkXpL4/2CSuT
  /dZ+jO8vb0utMLnxuEfQyWoTkkHHkK0OvofoY80N6gEAAA=
X-Env-Sender: Adam.Thomson.Opensource@diasemi.com
X-Msg-Ref: server-28.tower-223.messagelabs.com!1576588391!588152!1
X-Originating-IP: [104.47.1.54]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.44.22; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20508 invoked from network); 17 Dec 2019 13:13:12 -0000
Received: from mail-ve1eur01lp2054.outbound.protection.outlook.com (HELO EUR01-VE1-obe.outbound.protection.outlook.com) (104.47.1.54)
  by server-28.tower-223.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Dec 2019 13:13:12 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Blo1DsmLFKCXhJ29VU/Pv5Tzic2oMA4S1O12hBKXLz5J6vdkbU7bqCw1/UPtdBhMmnTEcU4kVjVFieq0L4GAqa4XBIcMww7o87xRvivfTyMCiOXM+YbfWCr8vhLgAD0aA4ITjXSz4CSJdIZR+uqep09XBmqoWXNWBP1O7uRyg15/FDSGFiKbFWZJKc/jk9aTOjUsk3buQdIfrtJ6ZQmcEAbRxPRs1oAOEsZW5TqVIAn43oi4CGiAGmaBjUK0GD3QC4yHEwQerQLoWBFsZhKgHDfWnH6pFiR9PPV2hP1OKy6l92rfOvVaF2cro/xu8mVDu8amezF3xTWjDZYjOhEYow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=US9NR5Y0nccgZGJYGPBfApIzIZ42oWx8TvhDqq3OsaQ=;
 b=QdNyXAjrdrtAdT9WCd6dXeLbv8I0MJIRJY8rixVqgr4M52jltHCUB1bLZn3L8m4AZDMlbOpx8pgQ7enAfb2iisSVyXFtsWVavqn6jWxXUrRyFQlP1K4QHg4c7ygtp7xXIC912iYpQ3SF+/zKeWJAwXCc6+VlGXNNklUWiJ5G91GJ+ncJOuZ9iI9vsrIudU/q6YGFSXIJh5CiBxXT2a8254Fso6l5OVBBfqfPuRDleMmu5+VAUl9VjhHafCncHhIZQ+JQ2EuomhjhrwzR8B1+WEIJpxaGR6AyyRUlazedNqxNyjX4V/OFM/6HlHt+kVkRkYGG9ZK/YwZg94SN3pQmJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=US9NR5Y0nccgZGJYGPBfApIzIZ42oWx8TvhDqq3OsaQ=;
 b=LOj0sjcwUn8gzP6mrTrUYqNp25UzCURf8Lk9ObzkZdKqLo/1bK9STK3mehmElsOW1ZwodgIulkCa0xIoBqooKJV4YyactPhb5+e8nvmiXYB6wDErQY4F9Bh++iDDo+FuETvor1I5etmZmy5EQrezdo3Eaqpn0nXmNp4OcAG1aUQ=
Received: from AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM (10.169.154.136) by
 AM5PR1001MB1186.EURPRD10.PROD.OUTLOOK.COM (10.169.155.142) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.18; Tue, 17 Dec 2019 13:13:10 +0000
Received: from AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ed23:3ca0:97ef:c868]) by AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ed23:3ca0:97ef:c868%10]) with mapi id 15.20.2538.019; Tue, 17 Dec
 2019 13:13:10 +0000
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
Thread-Index: AQHVptoKIWnW5XGNx0qiesHaa7KQWaeqBMOAgAkpmQCAAfp+EIAAFOMAgAGB2oCAAAM8gIAACD8AgAXEVoCAAH+D4IABFEIAgAANuACAAC0nAIAACzSQ
Date:   Tue, 17 Dec 2019 13:13:10 +0000
Message-ID: <AM5PR1001MB0994377F69ED2EFF2BEB580380500@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
References: <20191210094144.mxximpuouchy3fqu@pengutronix.de>
 <AM5PR1001MB099497419E4DCA69D424EC35805A0@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
 <20191211170918.q7kqkd4lrwwp7jl3@pengutronix.de>
 <20191212161019.GF4310@sirena.org.uk>
 <20191212162152.5uu3feacduetysq7@pengutronix.de>
 <20191212165124.GJ4310@sirena.org.uk>
 <20191216085525.csr2aglm5md4vtsw@pengutronix.de>
 <AM5PR1001MB09941005A47B603805D3C53280510@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
 <20191217090034.GD31182@pengutronix.de>
 <AM5PR1001MB099460B2D291644F088707BA80500@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
 <20191217123116.GB29666@pengutronix.de>
In-Reply-To: <20191217123116.GB29666@pengutronix.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.225.80.228]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d43dab66-c529-4db0-d833-08d782f2ddb2
x-ms-traffictypediagnostic: AM5PR1001MB1186:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM5PR1001MB118620715EFF02B359331C8FA7500@AM5PR1001MB1186.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 02543CD7CD
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(396003)(366004)(376002)(39860400002)(136003)(346002)(199004)(189003)(478600001)(86362001)(33656002)(55236004)(53546011)(6506007)(64756008)(2906002)(66556008)(66476007)(52536014)(54906003)(81166006)(81156014)(55016002)(26005)(9686003)(186003)(8936002)(5660300002)(71200400001)(8676002)(316002)(7696005)(66946007)(110136005)(7416002)(4326008)(76116006)(66446008);DIR:OUT;SFP:1101;SCL:1;SRVR:AM5PR1001MB1186;H:AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: diasemi.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RMgI0cMMAKrB5CqMQ6Ymrbuke1ysRsTEqKVZTrUg7GWOOCQYBeD72m+EEP3TN7nfvMmuYCOcXLaNi6WZUxtJXesASsk20javLsVokjghHBvIcKHGH2TTAGPgh8DdoHZbEeNTPfzselIP7Twb47PxAhpUxyGJG8Wp3hJStx58XOKqAlPEN2/KMH5CXJolG0loH09OojF4TrjWiFSse547uqq2VX5WknK7OB/9joUSuGqlNQZ6xW3t0NTGZw9lmoo3WT3IJOmBOVlatwrE60PQXDlBbncQUHscO0zBRYPFVnQBUQ3mH44284DW0mASQdOYM4GA0HqUZTTnAvV4aRAXM4siOFBpyNnoGsBfD1Dn4a2FhwtXs+Tlzv2H0+cRp2jQ128dTZrPCexbwNxZjXQe4/vd7v3erpFyIj4jL7Y5WRuHAkl8gqvXHk37c3ob13d7
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d43dab66-c529-4db0-d833-08d782f2ddb2
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2019 13:13:10.7967
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DWexB0wfG8g6nyBWjsshAbVVeSk8oK9GHXnbcvoYvBkmbiLnKVdWEpSJc6zix7/7DQGhxahjFUZ3bSRovIam4b8oTqc9wDau0WEU9ydu46g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR1001MB1186
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 17 December 2019 12:31, Marco Felsch wrote:

> On 19-12-17 09:53, Adam Thomson wrote:
> > On 17 December 2019 09:01, Marco Felsch wrote:
> >
> > > > > The enabel control signal is always available, please check [1] t=
able
> > > > > 63. There is a mux in front of the enable pin so:
> > > > >
> > > > >              +-------------
> > > > >  Seq. |\     |   Regulator
> > > > >  GPI1 | \    |
> > > > >  GPI2 | | -- > Enable
> > > > >  GPI3 | /    |
> > > > >       |/     .
> > > > >              .
> > > > >              .
> > > > >
> > > > > Adam please correct me if this is wrong.
> > > >
> > > > Yes the register can always be configured regardless of the associa=
ted pin
> > > > configuration, but if say GPIO1 was configured as a GPO but a regul=
ator was
> > > > configured to use GPIO1 as its GPI control mechanism, the output si=
gnal
> from
> > > > GPIO1 would be ignored, the sequencer control would not have any ef=
fect
> and
> > > > you're simply left with manual I2C control. Really we shouldn't be =
getting
> into
> > > > that situation though. If a GPIO is to be used as a regulator contr=
ol signal
> > > > then it should be marked as such and I don't think we should be abl=
e to use
> that
> > > > pin for anything other than regulator control.
> > >
> > > I see, so we have to guarantee that the requested gpio is configured =
as
> > > input. This can be done by:
> >
> > This is one of the reasons I thought this was better suited to being do=
ne in the
> > pinctrl/pinmux side. If you configure the GPIO as for regulator control=
 then
> > the code can automatically configure the GPIO for input. That doesn't t=
hen
> need
> > to be in the regulator driver.
>=20
> I still don't prefer that way.. pls check my arguments I already made
> and I don't wanna repeat it again.

Yes, I read your arguments but still can't agree :)
