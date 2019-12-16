Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC410120F89
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Dec 2019 17:33:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726695AbfLPQc5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Dec 2019 11:32:57 -0500
Received: from mail1.bemta25.messagelabs.com ([195.245.230.2]:60603 "EHLO
        mail1.bemta25.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726227AbfLPQcz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 16 Dec 2019 11:32:55 -0500
Received: from [46.226.52.98] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-2.bemta.az-a.eu-west-1.aws.symcld.net id 76/5B-12145-2B1B7FD5; Mon, 16 Dec 2019 16:32:50 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA1WTfUwTZxzHeXrX9ng5PQqMRyzbUnUuYgsFsh3
  L2Fxm5IyMObbMbJPosd7aainYawOYLAOEgJANCC+blfdUHBAVYVNAUGwYUMggExVcMMhsIrCJ
  4Cwvo7D1uOK2/z7P7/t5nuf7x/NgiKRMHIQxaUbGoKd1MpEXqgnFXpdfvryYELZsiSQ7RjDyW
  eUASpZN2kVkdc+QkFwZXkXIxrJ2lJxw/ATIhdt5ArLUeV5Atjy8KyRPNQ0hZGu1E5AjHRUicq
  7jDkLmdPWI92ym7uR2iKknYzliqt18X0z9Mt+LUC2Np0XU+N1OEdVq+Yoa/q4WUIWrYdSfLS8
  e9PpUqNUnJqcdFWruW46mFGxOuzA0gWaAWe984IUB4hwCL97sQ/OBp2vRi8Lz5gg+aAVw5etl
  EbdAiX4Elk59C7iFhCgXwFOZNQi3RULYAbxSYeJYRJCwpP+BiGN/4gAsrBtFuQ0I0SSC1qtL6
  4EfoYJt1ixxPsBcEgMda6/w/nFY/MfguoISO2Bf628Ip+AEDXPPvcPfm4nCdluvkHM8iWhoee
  QQ87WD4bPMpvU+CBEIf7VXCziGBAEtncMIzwFw+uGakPcZaMsaA/x8N/x51O5mGayq7HFzMLx
  VXeDm9+CoLQ/d8Ltv/O2ek9BSkINyPSGxHa5Z0/lxCuxfXHTrO2H2fJWQZym8WmZ2z5tROJ5n
  KgKh5v+05nk3rLn2VMRzCKyv/R3hGCd8oe2MHa0BaCMgEw1atcaYRGt1cmVYmFypDJcro8Ll4
  eGkgj4ppxWMSZ7KsEa5UkGnsgo2PelznUqhZ4wtwPU2VSnd9jawMP9YYQVbMIEsAP/o3kKCZF
  NisipdQ7OaIwaTjmGtQIphMojLmhcTJL4GRs2kfaHVuV74RgwxH5k/fuiSK8bZFDqJ1ar5aAB
  EYEXTlXUIZmu01CESVJ+sZ4IC8UlOJThVY9I/P2jjt9wCwUF+OPDw8JD4pDCGJK3x//kMCMSA
  zA/P5U7x0eqNz++bcVURuKqExy1wVYz0v1FQhiAWb4jz2qstsjzor3jk/31pFhpr/zCs0U81F
  bO0782JAiZ6Liubah+ZO/2Xp0FqFUfhaHTcvoaVum5ZSPyN4e75bScqqq+/0C6fiX9cLw+KJz
  OvUTFqKf1xofT6tG0y48hte7H/u7r9zpDcly4sN7zfsfh0Z6h5yzfLN1dLviwKPPkJ9aoscmr
  bWzES0x7P2M+8ggN+GCu3HurTXDp20b+utUZMVp04ezgkoOvlvNH8w/U/Equ17I4ns+UqKPX1
  fkMbMa0oGVRvP55tsw2ktpVFvb36WobvUr+z+YPB2a6F8a2bzrTNH9vV1Xmw19uwP/IKO1Z8z
  zQ8lOrodCpMW2edDrUMZTW0chdiYOl/AOldPSSoBAAA
X-Env-Sender: Adam.Thomson.Opensource@diasemi.com
X-Msg-Ref: server-13.tower-262.messagelabs.com!1576513969!503692!1
X-Originating-IP: [104.47.8.55]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.44.22; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19345 invoked from network); 16 Dec 2019 16:32:49 -0000
Received: from mail-am5eur03lp2055.outbound.protection.outlook.com (HELO EUR03-AM5-obe.outbound.protection.outlook.com) (104.47.8.55)
  by server-13.tower-262.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 16 Dec 2019 16:32:49 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bRFHlM+l0KhGO+P1GQVm3EvlWQOFLVIXdPiFWGBRFxgv9eq8tEIwT3s1LXa1ZV6G+zVG/YR2Bw1mCKGJ8u/ARbE94DIQxK12fpqtfbELMEyIJmx9Ywg7XQ9oO4kUHiJFk/KfIoayIzrotqD8gTJ0enZtuJF25pmPkF8ehHVv/6W70O8+a/VdKCXQ1jg/WpBx0MMuZftw1wwWSRa/xO9TvS93fStWj/XjglZvpClEADeAi5As1MxP7mx32sjUYkXKDqEZRbczxHZj2C4yeDHk6dr4MoYlj5eRwi2cGZG6Cyqy1UzWSKkGNv3oTLvJaFqeFnzJdK3ldi5OlNXGzh05Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WQGJicNBNaGiGtBVenqeDje4pdkwACp/gI94G98JKW4=;
 b=Y5NL8Ef6ypRRp30hF2ouPKIdD7jOCJQJtSHv1pqclni4fRmD5o4I0FY8RUZr5i+9fzdq5F8L2weAFYfQX35flgWR8Chk4sQ2bE5JoIPJ9SHDN/6U2FLI+wr2iPjp04aEU/Qnq+ySHI4q9lDNosyqCTGVKri+KPJd4nqDvDFtbVfq6+1iaxkzvfSLdlPZtB7EUi64eTfaVsIEndRS53K9/Jw0FfXnx737GfuaV6NaVESTrkZ6NSdit7n7PaIiFSM4JduXDZG1JG8UbX2OYOhsMg5rFy/9CFe8aqAUyxCpeSkdLBfOxS15rnkMOKsMSiBhfLKygE9KQP00UHiVeCuiSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WQGJicNBNaGiGtBVenqeDje4pdkwACp/gI94G98JKW4=;
 b=CGmTL+oGNAltINTFH5cjNnxBIiv68B6U5xOoKdLdZePJPD+KO5v2Z6q7WZLc/yshocelG5pwFjtDdpUnsiuNrOzGAIB9DXMtBKD+Jm5DEQ/7ouCNNkO0mewpw4cQYiVPjjNtelFCYqMJOY8E/qPkcn3e9lJvVqeEmGfJvK+IApI=
Received: from AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM (10.169.154.136) by
 AM5PR1001MB1060.EURPRD10.PROD.OUTLOOK.COM (10.169.150.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.18; Mon, 16 Dec 2019 16:32:48 +0000
Received: from AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ed23:3ca0:97ef:c868]) by AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ed23:3ca0:97ef:c868%10]) with mapi id 15.20.2538.019; Mon, 16 Dec
 2019 16:32:48 +0000
From:   Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
To:     Marco Felsch <m.felsch@pengutronix.de>,
        Mark Brown <broonie@kernel.org>
CC:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Support Opensource <Support.Opensource@diasemi.com>,
        "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "andrew@aj.id.au" <andrew@aj.id.au>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "joel@jms.id.au" <joel@jms.id.au>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH v3 3/6] dt-bindings: mfd: da9062: add regulator voltage
 selection documentation
Thread-Topic: [PATCH v3 3/6] dt-bindings: mfd: da9062: add regulator voltage
 selection documentation
Thread-Index: AQHVptoKIWnW5XGNx0qiesHaa7KQWaeqBMOAgAkpmQCAAfp+EIAAFOMAgAGB2oCAAAM8gIAACD8AgAXEVoCAAH+D4A==
Date:   Mon, 16 Dec 2019 16:32:48 +0000
Message-ID: <AM5PR1001MB09941005A47B603805D3C53280510@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
References: <20191129172537.31410-1-m.felsch@pengutronix.de>
 <20191129172537.31410-4-m.felsch@pengutronix.de>
 <20191204134631.GT1998@sirena.org.uk>
 <20191210094144.mxximpuouchy3fqu@pengutronix.de>
 <AM5PR1001MB099497419E4DCA69D424EC35805A0@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
 <20191211170918.q7kqkd4lrwwp7jl3@pengutronix.de>
 <20191212161019.GF4310@sirena.org.uk>
 <20191212162152.5uu3feacduetysq7@pengutronix.de>
 <20191212165124.GJ4310@sirena.org.uk>
 <20191216085525.csr2aglm5md4vtsw@pengutronix.de>
In-Reply-To: <20191216085525.csr2aglm5md4vtsw@pengutronix.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.225.80.228]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1597e56f-d0ad-45bc-e4b6-08d782459682
x-ms-traffictypediagnostic: AM5PR1001MB1060:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM5PR1001MB10600652CB4BB2438B624129A7510@AM5PR1001MB1060.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 02530BD3AA
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(396003)(366004)(376002)(136003)(346002)(39850400004)(199004)(189003)(478600001)(64756008)(33656002)(52536014)(55236004)(53546011)(6506007)(66476007)(2906002)(54906003)(966005)(66556008)(55016002)(26005)(9686003)(81166006)(81156014)(186003)(8936002)(5660300002)(71200400001)(8676002)(4326008)(7416002)(66946007)(110136005)(7696005)(76116006)(316002)(86362001)(66446008);DIR:OUT;SFP:1101;SCL:1;SRVR:AM5PR1001MB1060;H:AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: diasemi.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UFJXbg5/E+LPCtFeLiJsn10fIYud3iXSnOE2GOdMlSEWSwpMBHgs3YOKNVR70cAs8Hw5c9LUzzwg9KNKsyVgs1a/gI2giztoYWDEfxHmUZB7Yvkp97ADvT0sL8XJGHRj3dHYZDCMXnbZgLued+j2CsoKwb2TNDW/Nkqp7fSpHEG3hTj6hM1oA5nH/PsblBVB2PV4Qh3N99bSKr+j61iaw5EROwBqFdpIXTdOPBZ0CDaBXzeNXxEfIOnS5O2kaMaD3RvR6PYFB8Cy97kCzGC9Pe+YSQ44LNsbf8PLsss4jpjsTsjftl7iyBWa+Pb1hXxZXXHTEq1W/F6PFnYPktE2WryO+J8237z1TkXBW3QFlJQB58wFF9JOUUlngRZrOPAJSK6Nx7voBhMHp7GXk03Ny0Xltrun3UG+e75sYnyPnW5/pt0DF87ZI7D8fEDAoZ7JeZjvyakN/ZW0CaPaogRuloK1pLfote5mFDCkM5U14fs=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1597e56f-d0ad-45bc-e4b6-08d782459682
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2019 16:32:48.4040
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4W8RKIQNpcEFQsncvJl95trsedSlj52pZYq+ftJUzmhTX3btw25MJzuqoANk3nzgq9jWJhEKfIs7u6QAwf3aZICnIhJqemNEMG0y3WWfvaU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR1001MB1060
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 16 December 2019 08:55, Marco Felsch wrote:

> On 19-12-12 16:51, Mark Brown wrote:
> > On Thu, Dec 12, 2019 at 05:21:53PM +0100, Marco Felsch wrote:
> >
> > > "... what's driving the input ..":
> > > Sorry I didn't get you here. What did you mean? The input is driven b=
y
> > > the host. This can be any gpio line and in my case it is a gpio line
> > > driven by the soc-hw during a suspend operation.
> >
> > Something needs to say what that thing is, especially if it's runtime
> > controllable.  In your case from the point of view of software there is
> > actually no enable control so we shouldn't be providing an enable
> > operation to the framework.
>=20
> The enabel control signal is always available, please check [1] table
> 63. There is a mux in front of the enable pin so:
>=20
>              +-------------
>  Seq. |\     |   Regulator
>  GPI1 | \    |
>  GPI2 | | -- > Enable
>  GPI3 | /    |
>       |/     .
>              .
>              .
>=20
> Adam please correct me if this is wrong.

Yes the register can always be configured regardless of the associated pin
configuration, but if say GPIO1 was configured as a GPO but a regulator was
configured to use GPIO1 as its GPI control mechanism, the output signal fro=
m
GPIO1 would be ignored, the sequencer control would not have any effect and
you're simply left with manual I2C control. Really we shouldn't be getting =
into
that situation though. If a GPIO is to be used as a regulator control signa=
l
then it should be marked as such and I don't think we should be able to use=
 that
pin for anything other than regulator control.

>=20
> [1] https://www.dialog-
> semiconductor.com/sites/default/files/da9062_datasheet_3v6.pdf
>=20
> Regards,
>   Marco
>=20
> > _______________________________________________
> > linux-arm-kernel mailing list
> > linux-arm-kernel@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
