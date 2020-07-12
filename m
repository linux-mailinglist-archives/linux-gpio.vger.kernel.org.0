Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CCC121C6F3
	for <lists+linux-gpio@lfdr.de>; Sun, 12 Jul 2020 03:34:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727092AbgGLBeh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 11 Jul 2020 21:34:37 -0400
Received: from mail-am6eur05on2045.outbound.protection.outlook.com ([40.107.22.45]:44544
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726948AbgGLBeg (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 11 Jul 2020 21:34:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MfhrIdVK5fNqLFU6DcCOIByABf+vjWnrjYSPf7RF7L3FzFNoz5+1fZOMh4wCLt5Z61epHQ8oXxZqwdxcMS0vyXRu75RsnDpiyxFMngHWfa8DuQmFkpVVMRMZfrHwG/CUpQqQ8na3SXKEIM4bmlsnVCW64mxAy0q6QIk1bf1xiuX4uzI154A1rmW7FsUMlA54or0dSJ7WQg9ly1UNAtsm40VEB387Vn79fU/qX9GQ3oCLi6tn4Rn3JXXxlqVNsSiL/gYgpgEQjuQwlOyCXvVOCXd1AarvVbG/0XOO666ICNk16o/e/p2Gp6snU9TDrsMnoL+dS2ZUbyAxDRwfn8bvVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FWA5LldR/ITYyYt9suIYI7xvldpdc+5oQ5UqiDSk3qs=;
 b=SqjeTcvot3azpL+oIQDJXBMpd6OKrDFBFzFVng9Spjqc3F9kr0i7TXC+qbJ6XgVxBpngdUMJdjH0ZIQDV6WJrglqnYbU4E+U6VJfjMZThNUXiNX/Ze9rb38Fju2sdrXgSC7DkM52Wi29fbQyxpOigjRJvKGOt8rRh5X2j4lsDPs3K1lGh001z7NAfMmDOwmsDi7P6VVnLSPhmmERqeDnHMR8YdRY+WzPA/gwNiKlJY8FzdfAxvlXfx+xwk43vbz7Vs85+ZI3ykO31FP0zgmVAttcAp2Yg6Er5KOVRruhpioZ6Evm1qB50ZV73HsZl7lOqMlKbPj0N4zldBjQSjUQ1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FWA5LldR/ITYyYt9suIYI7xvldpdc+5oQ5UqiDSk3qs=;
 b=I2Xf1K8SmaT1g+83OhY+VTBJ0bwokgbN21OkWvG32dZkqsLVrW5qEI3eGBcUZeTsZ7PU6m8L4gR9U6qV4z5Q/L3H3bnPVct4ALcxoTKHt1p0JT4PdA6tBr95JXoyKTjrPeyOxR5BiQMO4triCafUmc0/Kgqs10fbChMJmi/kgRY=
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com (2603:10a6:8:10::18)
 by DBBPR04MB6027.eurprd04.prod.outlook.com (2603:10a6:10:c7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.20; Sun, 12 Jul
 2020 01:34:32 +0000
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::1dab:b68c:e028:acb3]) by DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::1dab:b68c:e028:acb3%6]) with mapi id 15.20.3174.025; Sun, 12 Jul 2020
 01:34:32 +0000
From:   Anson Huang <anson.huang@nxp.com>
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     Russell King <linux@armlinux.org.uk>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Sascha Hauer <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "oleksandr.suvorov@toradex.com" <oleksandr.suvorov@toradex.com>,
        Adam Ford <aford173@gmail.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Leo Li <leoyang.li@nxp.com>, Vinod Koul <vkoul@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Olof Johansson <olof@lixom.net>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH 1/3] gpio: mxc: Support module build
Thread-Topic: [PATCH 1/3] gpio: mxc: Support module build
Thread-Index: AQHWVLZdNtvAex5vSUmx57p8ya+LG6kC6AIAgABGglA=
Date:   Sun, 12 Jul 2020 01:34:31 +0000
Message-ID: <DB3PR0402MB39168FEA9306CBF90A596E31F5630@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <1594164323-14920-1-git-send-email-Anson.Huang@nxp.com>
 <CACRpkdYP4J+MZjxWUnkM-XGaMmFFZfMCfY13r7G6r2=v3F6zQw@mail.gmail.com>
In-Reply-To: <CACRpkdYP4J+MZjxWUnkM-XGaMmFFZfMCfY13r7G6r2=v3F6zQw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [183.192.22.69]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: eade3857-2a77-4ac9-7ce0-08d82603ba06
x-ms-traffictypediagnostic: DBBPR04MB6027:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DBBPR04MB6027D69BAEDFB4F16963E6B4F5630@DBBPR04MB6027.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JPzb10yjogyZg+9Z/UPWBI2rsl7G1PTUpMtArog7VuJXNeHz5Pqqx1AJhImnNxOZLKbmR07vK+uUtf9A3QaQq8vZlF8kBUjuTEWATj9WxdrJaf2zUKlQl5ndcLWIQgzB1/WBjC6YwVq1Pivlw1u8uMRoKI9/sj51dktLvTBcGDVE1omm6JXGkNSsz0mBYvdA8UeGtpnLpeB0dlEFWTpG0TZrw4vXqIfzCm4dxDMBomV/Rnxee9AM25iKv8Sz1zbzq5yIn3B6F97Jr8/JZ/Fj1TAonFMWZcyEtW5iohgD7lPVsDyC+5et8F57Lml14lU/yFKr9Q8MwViy2XholE4jew==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0402MB3916.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(366004)(376002)(136003)(39850400004)(346002)(8936002)(478600001)(9686003)(4326008)(55016002)(7416002)(8676002)(86362001)(54906003)(6506007)(66446008)(26005)(66476007)(66556008)(66946007)(33656002)(2906002)(44832011)(52536014)(53546011)(64756008)(5660300002)(6916009)(186003)(316002)(7696005)(71200400001)(76116006)(4744005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: MoemGWNAiGZI5wGyLxslNLU8z/wbY76oLk/b29ayCgUG5w5XIMiV6+BV0Sz/WHiUGXTV/ICwud1SLjM5LqZKTfzOJaGcdsSgAR2jJq+3F2KCckJizbQtJnzZiIUWA6bzcQEjGQTfy+3st7tKvIFn5/OE2GU3AC/qnmWqv31IHrIMBfA4nMYLRnElQb/X1Ec0aT147vN6gwHAK+UXdJk6p53LZbQo40XgpyPpcKD8faSx3CRTUI8C1y9WVQofoRFNmjQBbqo4cAj/fldLdEk4AC9INbaEg5i+IzPGi9gGmyveQm83WEzr2BmQe1DWQcUxt9dl+6B1I3vAZJY4NfLbQr9/HnG3Thud16uBYbAEAnTRXgcj7Vf5B0PCf5WcXJuGFE6erILjLGWlRRqK/C8qv5k4gi2760l5U4CI7HZzyph2arRTCksI4H9PZo1ZUGSTz1qRv/UTbN/TdIHlfP+DqjmRi3u/DvnhAJlUbIgPwsA=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0402MB3916.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eade3857-2a77-4ac9-7ce0-08d82603ba06
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2020 01:34:31.9590
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Gqcltgx23ISL2EmSGGi2BhqEMm6G77AwaqGrZi46tEWG1MC580HnyzERMLsDsNHp/FxObRMWvKpZAbOE76OB4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB6027
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGksIExpbnVzDQoNCj4gU3ViamVjdDogUmU6IFtQQVRDSCAxLzNdIGdwaW86IG14YzogU3VwcG9y
dCBtb2R1bGUgYnVpbGQNCj4gDQo+IE9uIFdlZCwgSnVsIDgsIDIwMjAgYXQgMToyOCBBTSBBbnNv
biBIdWFuZyA8QW5zb24uSHVhbmdAbnhwLmNvbT4NCj4gd3JvdGU6DQo+IA0KPiA+ICBzdWJzeXNf
aW5pdGNhbGwoZ3Bpb19teGNfaW5pdCk7DQo+ID4gKw0KPiA+ICtNT0RVTEVfQVVUSE9SKCJTaGF3
biBHdW8gPHNoYXduLmd1b0BsaW5hcm8ub3JnPiIpOw0KPiA+ICtNT0RVTEVfREVTQ1JJUFRJT04o
ImkuTVggR1BJTyBEcml2ZXIiKTsgTU9EVUxFX0xJQ0VOU0UoIkdQTCIpOw0KPiANCj4gWW91IGFy
ZSBtYWtpbmcgdGhpcyBtb2R1YWxyaXphYmxlIGJ1dCBrZWVwaW5nIHRoZSBzdWJzeXNfaW5pdGNh
bGwoKSwgd2hpY2gNCj4gZG9lc24ndCBtYWtlIHZlcnkgbXVjaCBzZW5zZS4gSXQgaXMgb2J2aW91
c2x5IG5vdCBuZWNlc3NhcnkgdG8gZG8gdGhpcyBwcm9iZQ0KPiBhdCBzdWJzeXNfaW5pdGNhbGwo
KSB0aW1lLCByaWdodD8NCj4NCg0KSWYgYnVpbGRpbmcgaXQgYXMgbW9kdWxlLCB0aGUgc3Vic3lz
X2luaXRjYWxsKCkgd2lsbCBiZSBlcXVhbCB0byBtb2R1bGVfaW5pdCgpLCBJIGtlZXANCml0IHVu
Y2hhbmdlZCBpcyBiZWNhdXNlIEkgdHJ5IHRvIG1ha2UgaXQgaWRlbnRpY2FsIHdoZW4gYnVpbHQt
aW4sIHNpbmNlIG1vc3Qgb2YgdGhlDQpjb25maWcgd2lsbCBzdGlsbCBoYXZlIGl0IGJ1aWx0LWlu
LCBleGNlcHQgdGhlIEFuZHJvaWQgR0tJIHN1cHBvcnQuIERvZXMgaXQgbWFrZSBzZW5zZT8NCiAN
Cj4gVGFrZSB0aGlzIG9wcG9ydHVuaXR5IHRvIGNvbnZlcnQgdGhlIGRyaXZlciB0byB1c2UNCj4g
bW9kdWxlX3BsYXRmb3JtX2RyaXZlcigpIGFzIHdlbGwuDQoNCklmIHlvdSB0aGluayBpdCBoYXMg
dG8gYmUgb3IgaXQgaXMgYmV0dGVyIHRvIHVzZSBtb2R1bGVfcGxhdGZvcm1fZHJpdmVyKCksIEkg
d2lsbCBkbw0KaXQgaW4gVjIuDQoNCnRoYW5rcywNCkFuc29uDQoNCg==
