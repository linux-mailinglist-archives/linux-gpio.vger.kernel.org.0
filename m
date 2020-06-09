Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D9681F3289
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jun 2020 05:22:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726903AbgFIDWi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Jun 2020 23:22:38 -0400
Received: from mail-eopbgr30085.outbound.protection.outlook.com ([40.107.3.85]:16839
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726884AbgFIDWg (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 8 Jun 2020 23:22:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mU3YNnEIMdQCUfVa4QR01RUl1U92ZY51BAfhv5PUDxqOG4K64Fw/xoOjNLgmbHQRn8JkmVsN5Ls94vQPuEtVisFRYH7xqp5O9vHZfWV3kSxJ9eR9FHhbR1ENd2xBDROelJpgCoFLeCxu0F/xovNYaXRrM67rcuQlfodzmCTldBkx7EtURSDprzAJk/ys4fXxM3P+eWUSgcYloZVNdEAx71DpuxE3FMyERrang6uPOEKiUoyvZEA/2ed/j65wGyhKIaYO2lV/a+AZRmGoUfzKAhEC02bjXWR4ipishN8CV/mAE7ck96KR01Mt8WZnprKSGiLxe0CDc/IJHqsssBo8YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NRG49FaxW4g/+5zDQleQ0b+rL2v7KJjQdWkX5Itk3Kg=;
 b=Jhy9p1hYgPAnn/kzn7B8pnYJW7mkr/oG3/NUC/YcufnWZjwC7svJdB4kHPvMT7cP3CFjQG5hvKNU7tOf0sH3KENOMIuRHdySfHxH5UHufAJO/9WMPCa8MY9XCYCAhnXl9T01cd5h1Xhjr/FkLNobvpRWibJr+ZNF/aNPF4YAWHdBVrH1qMyP0sfOLboNMn1vL2j3wd2nIRLOkbxyGJUoXNETujL4JUmr30m4vFK8q86qAKBqObToNTQW+eV1UnaZcf0PyeQjJmq/+vJdLdnkVHHoJ2zQPE2xbONgwfKhN763QVe9Unan30XTN6iHsU8eO11qkoJKJdex8HIlK4mzcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NRG49FaxW4g/+5zDQleQ0b+rL2v7KJjQdWkX5Itk3Kg=;
 b=RnRTuurrf9k+cB8P49leYtwChJ5ez3vd8vVBI5hL3q4TQavorfBk8YXnRJCtcWChXJbPlZ+zGIRa9zlt54rqcWClmYoZcAUlGN9E9qmy5zfxUV5PjsCzqpntX6wxko+lvHpaFXC/YUTqEgq4C5aGKLqKhbJGeffKCcYEvoTiiMk=
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com (2603:10a6:20b:2::14)
 by AM6PR04MB5592.eurprd04.prod.outlook.com (2603:10a6:20b:a0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Tue, 9 Jun
 2020 03:22:31 +0000
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::3c6c:a0e9:9a4e:c51d]) by AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::3c6c:a0e9:9a4e:c51d%7]) with mapi id 15.20.3066.023; Tue, 9 Jun 2020
 03:22:31 +0000
From:   Aisheng Dong <aisheng.dong@nxp.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
CC:     BOUGH CHEN <haibo.chen@nxp.com>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "stefan@agner.ch" <stefan@agner.ch>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        dl-linux-imx <linux-imx@nxp.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: RE: [PATCH] Revert "pinctrl: freescale: imx: Use 'devm_of_iomap()' to
 avoid a resource leak in case of error in 'imx_pinctrl_probe()'"
Thread-Topic: [PATCH] Revert "pinctrl: freescale: imx: Use 'devm_of_iomap()'
 to avoid a resource leak in case of error in 'imx_pinctrl_probe()'"
Thread-Index: AQHWPX0cYhLWYDNPYkKbg7yA3TlBhajOv29AgAANVgCAANE3wA==
Date:   Tue, 9 Jun 2020 03:22:31 +0000
Message-ID: <AM6PR04MB496677335CAD190F8F888D9880820@AM6PR04MB4966.eurprd04.prod.outlook.com>
References: <1591610401-12590-1-git-send-email-haibo.chen@nxp.com>
 <AM6PR04MB496691DDA4447CD5624EE6E680850@AM6PR04MB4966.eurprd04.prod.outlook.com>
 <20200608144830.GT22511@kadam>
In-Reply-To: <20200608144830.GT22511@kadam>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 98966d81-d723-4b68-7b2b-08d80c2458a9
x-ms-traffictypediagnostic: AM6PR04MB5592:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR04MB55924CB825531EDB924A083B80820@AM6PR04MB5592.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 042957ACD7
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kCvJVBfEX+dIqbJaHQUL2H8cP2Bf7BzoxakXd/Oc9wf/ymfx9M0Rtad44upOHInu2pE6Dk0N64vWiVDKhLCE6aqtlnYKqd6EWPd10JV75NVvfsweMTvn71SjI1+U6zm0KhRUDBUHpfWN7sBqIZXhJ6GDEgrAhd++1omeaaS6wmoYxYKgJ1GYsVpgx4NfPblY3RqldSyNAgzAPW9sEa+rO8Vh6lem0mifnAYFyQSoZZoz/utZ5tz2uTUz/wJjjhBGVaSQtYP/v1eyzFtZbGtASK7SVGF8Q22MvF3284BetAQM1v2NaDwpIMMI0UWG6NQZ2jPtvskMhqssh1LJUxDpju6TVqWYKLVirFq3GwWlvI4AkEP804nwKtFja9opu9jXqwVpqxPc2Pjm0FE2mUck4g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4966.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(39860400002)(396003)(366004)(346002)(376002)(186003)(316002)(5660300002)(66446008)(33656002)(86362001)(66946007)(966005)(6506007)(66476007)(71200400001)(66556008)(478600001)(64756008)(52536014)(76116006)(26005)(54906003)(8676002)(7696005)(44832011)(8936002)(9686003)(83380400001)(6916009)(55016002)(2906002)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: csvxIZFZQfxhkai3BetYo61zXmRZms5/tmHYZgtajahzVmDli3bREqW5Go+YW38s0yycAwfi7aSf6cYc+TRGx2oYdLtFjJvLV8/lJe8jECtILvvzr25mWUNDgxmaJAw31t5DMpKua49+2uhXdpxEqpP0QhzYoxFn/j5LcQI9TkbCuSHfe9Igimf2WczVxg9bgk/+RLzi29MXb5ICjbowx51345ErClZNueHLSp3k6TrtQl0YboyfoL/q8A0c5brVMx7Ah6pylKo4KQIbSXGeVWbXbvECvzimjvynZ0/Ss6uN3G1hVgHuFrKw7mnB0kqLSnaBDGNMykG4xoLrLQ3YjRbjGU1siDGgNqC7OnkwZ+esCcLZ+rkelXB1/rrUcn/lFtBWLFE3L2AyWzWp+sn/taYsPjKWRuNLi41pWuw/sXByUDs+GuVHIkx0Fk2QXU43L0KCMpnhhnfDZx0snIhfg6FLLMP3FBaD/wr++6JAH+fE3hT/S2/Jn549y56o7QZt
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98966d81-d723-4b68-7b2b-08d80c2458a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2020 03:22:31.7284
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CObx0DoImzeE/K9px+DHGQ0A2xKhydQm1Kx3ZUYipZa40wmMZe9pKUQyxBbjAzUWchkcnNmwC7eAhMAZGZnTxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5592
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

PiBGcm9tOiBEYW4gQ2FycGVudGVyIDxkYW4uY2FycGVudGVyQG9yYWNsZS5jb20+DQo+IFNlbnQ6
IE1vbmRheSwgSnVuZSA4LCAyMDIwIDEwOjQ5IFBNDQo+IA0KPiBPbiBNb24sIEp1biAwOCwgMjAy
MCBhdCAwMjowNjozNVBNICswMDAwLCBBaXNoZW5nIERvbmcgd3JvdGU6DQo+ID4gPiBGcm9tOiBo
YWliby5jaGVuQG54cC5jb20gPGhhaWJvLmNoZW5AbnhwLmNvbT4NCj4gPiA+IFNlbnQ6IE1vbmRh
eSwgSnVuZSA4LCAyMDIwIDY6MDAgUE0NCj4gPiA+DQo+ID4gPiBUaGlzIHBhdGNoIGJsb2NrIHN5
c3RlbSBib290aW5nLCBmaW5kIG9uIGlteDdkLXNkYiBib2FyZC4NCj4gPiA+IEZyb20gdGhlIGR0
cyB3ZSBjYW4gc2VlLCBpb211eCBhbmQgaW9tdXhfbHBzciBzaGFyZSB0aGUgbWVtb3J5DQo+ID4g
PiByZWdpb24gWzB4MzAzMzAwMDAtMHgzMDMzZmZmZl0sIHNvIHdpbGwgdHJpZ2dlciB0aGUgZm9s
bG93aW5nIGlzc3VlOg0KPiA+ID4NCj4gPiA+IFsgICAgMC4xNzk1NjFdIGlteDdkLXBpbmN0cmwg
MzAyYzAwMDAuaW9tdXhjLWxwc3I6IGluaXRpYWxpemVkIElNWCBwaW5jdHJsDQo+ID4gPiBkcml2
ZXINCj4gPiA+IFsgICAgMC4xOTE3NDJdIGlteDdkLXBpbmN0cmwgMzAzMzAwMDAucGluY3RybDog
Y2FuJ3QgcmVxdWVzdCByZWdpb24gZm9yDQo+ID4gPiByZXNvdXJjZSBbbWVtIDB4MzAzMzAwMDAt
MHgzMDMzZmZmZl0NCj4gPiA+IFsgICAgMC4xOTE4NDJdIGlteDdkLXBpbmN0cmw6IHByb2JlIG9m
IDMwMzMwMDAwLnBpbmN0cmwgZmFpbGVkIHdpdGggZXJyb3INCj4gLTE2DQo+ID4gPg0KPiA+ID4g
VGhpcyByZXZlcnRzIGNvbW1pdCBiYTQwMzI0MjYxNWMyYzk5ZTI3YWY3OTg0YjE2NTA3NzFhMmNj
MmM5Lg0KPiANCj4gQnR3LCB0aGUgYGdpdCByZXZlcnRgIGNvbW1hbmQgcmVhbGx5IHNldHMgeW91
IHVwIGZvciBmYWlsdXJlIGJ5IGdlbmVyYXRpbmcgYSBwYXRjaA0KPiBpbiB0aGUgd3JvbmcgZm9y
bWF0LiAgWW91IGRpZCB3ZWxsIHRvIHdyaXRlIGEgZ29vZCBjb21taXQgbWVzc2FnZS4gIEkgd291
bGQNCj4gcHJvYmFibHkgYWxzbyBjaGFuZ2UgdGhlIHN1YmplY3QsIHRoZSBGcm9tOg0KPiBoZWFk
ZXIgYW5kIGFkZCBhIEZpeGVzIHRhZyBhbmQgYSBTaWduZWQtb2ZmIGJ5LiAgVGhlIEZpeGVzIHRh
ZyBzaG91bGQNCj4gYmU6DQo+IA0KPiBGaXhlczogYmE0MDMyNDI2MTVjICgicGluY3RybDogZnJl
ZXNjYWxlOiBpbXg6IFVzZSAnZGV2bV9vZl9pb21hcCgpJyB0byBhdm9pZCBhDQo+IHJlc291cmNl
IGxlYWsgaW4gY2FzZSBvZiBlcnJvciBpbiAnaW14X3BpbmN0cmxfcHJvYmUoKSciKQ0KPiANCg0K
Qnkgc2VhcmNoaW5nIHRoZSBrZXJuZWwgbG9nLCBpdCBzZWVtcyBtb3N0IHBlb3BsZSBkaWRuJ3Qg
YWRkIEZpeGVzIHRhZyBmb3IgYSBSZXZlcnQgcGF0Y2guDQpCdXQgYW55d2F5LCBJJ20gZmluZSB0
byBhZGQgaXQuDQplLmcuDQpjb21taXQgY2Y5Yzk0NDU2ZWJhZmM2ZDc1YTgzNGU1OGRmZGM4YWU3
MWEzYWNiYw0KQXV0aG9yOiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRp
b24ub3JnPg0KRGF0ZTogICBUdWUgTWF5IDEyIDEwOjIyOjQ0IDIwMjAgKzAyMDANCg0KICAgIFJl
dmVydCAidHR5OiBodmM6IEZpeCBkYXRhIGFib3J0IGR1ZSB0byByYWNlIGluIGh2Y19vcGVuIg0K
ICAgIA0KICAgIFRoaXMgcmV2ZXJ0cyBjb21taXQgZTJiZDFkY2JlMWFhMzRmZjU1NzBiMzQyN2M1
MzBlNDMzMmVjZjBmZS4NCiAgICANCiAgICBJbiBkaXNjdXNzaW9uIG9uIHRoZSBtYWlsaW5nIGxp
c3QsIGl0IGhhcyBiZWVuIGRldGVybWluZWQgdGhhdCB0aGlzIGlzDQogICAgbm90IHRoZSBjb3Jy
ZWN0IHR5cGUgb2YgZml4IGZvciB0aGlzIGlzc3VlLiAgUmV2ZXJ0IGl0IHNvIHRoYXQgd2UgY2Fu
IGRvDQogICAgdGhpcyBjb3JyZWN0bHkuDQogICAgDQogICAgUmVwb3J0ZWQtYnk6IEppcmkgU2xh
YnkgPGpzbGFieUBzdXNlLmN6Pg0KICAgIFJlcG9ydGVkLWJ5OiBHcmVnIEtyb2FoLUhhcnRtYW4g
PGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPg0KICAgIExpbms6IGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL3IvMjAyMDA0MjgwMzI2MDEuMjIxMjctMS1yYW5hbnRhQGNvZGVhdXJvcmEub3JnDQog
ICAgQ2M6IFJhZ2hhdmVuZHJhIFJhbyBBbmFudGEgPHJhbmFudGFAY29kZWF1cm9yYS5vcmc+DQog
ICAgU2lnbmVkLW9mZi1ieTogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0
aW9uLm9yZz4NCg0KUmVnYXJkcw0KQWlzaGVuZw0KDQo+IHJlZ2FyZHMsDQo+IGRhbiBjYXJwZW50
ZXINCg0K
