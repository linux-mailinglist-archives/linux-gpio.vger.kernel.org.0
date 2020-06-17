Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5E931FC43F
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2020 04:53:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726275AbgFQCxS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Jun 2020 22:53:18 -0400
Received: from mail-eopbgr00080.outbound.protection.outlook.com ([40.107.0.80]:38849
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726505AbgFQCxR (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 16 Jun 2020 22:53:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V4wVQL3L03QHo2FAXY0v95d8bhkd9k+G38Ssy4ann6EGkTPCuyZSYfpssXfZfc8vSlhCuirsDKHZhaqV2d/+wAsieyZySmQpZQOYbFFCUIidczgDCgg7CeuJXwiUS810JShvlO2kE7IH9KQFwxNgnjnLTCbrv4hxgQxjScyp/5B08zJRQRHWYBwhzwxGQPmdsiI/dIi46WlvRcB3qSnCj1bA7TIfaHIo/NHWoKtKxvM33r4Qxdal/mKWFfX/lv8veKsXRCU9HX9AkagNNXNcDnRjF69ovGa0np2FjsAf5k/waD28ccKBrCgs/pz0XZjJkPljbSE7tMMEQVrueJn1gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/f5Zy01zWA8QumbQ1EvzzMQ4mFONw+6/LRFPVHqsw5E=;
 b=blwq9wofTSYXdLzg5i9cxq56DIdc07mTYUr2ogVw+xK/QFM80SrubSg1g4696aU007dUD9olHJoQmx4IUfZzDjH0+AA5ahPQVtbtIXpUHXT3sx2Lp8q44191/E1WFMtuawVtOajnvBsjKoF5FJBDjZ3SN1Sc95HSnriacFONAb3obw96REqjnKzYS6MjvF44cvbvzLqRoXPkR8dHFHSjEWX41vmaEBWs27OzxFvxXJe20Hp2on5nbVxxHxpFPbGfvnH+9GPhDb9JYFov4ZbPleWyzqaFKfBl8SZpS1AnSo0p/FvGv3AK5CunLRTRJNucwOM5ld6/lYzsInvZZTXQDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/f5Zy01zWA8QumbQ1EvzzMQ4mFONw+6/LRFPVHqsw5E=;
 b=UH3Zti7CSiIUkW/nyY1VPeqAK9Gw5PS+THj81+H0bOQu5CI8/7cqKI3qhmyfJkQc/pFnhtipw0KLYQgWPKSltRdMtvR0veeMkeDlmWSRSpF86OfEN5FatpyYgeA3F8Z+pzpG116AZ27o6zW2H23lR9leJmRgPtB5tz2jYk7tie8=
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com (2603:10a6:20b:2::14)
 by AM6PR04MB6085.eurprd04.prod.outlook.com (2603:10a6:20b:b9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Wed, 17 Jun
 2020 02:53:13 +0000
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::3c6c:a0e9:9a4e:c51d]) by AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::3c6c:a0e9:9a4e:c51d%7]) with mapi id 15.20.3088.028; Wed, 17 Jun 2020
 02:53:13 +0000
From:   Aisheng Dong <aisheng.dong@nxp.com>
To:     Peng Fan <peng.fan@nxp.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     BOUGH CHEN <haibo.chen@nxp.com>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "stefan@agner.ch" <stefan@agner.ch>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        dl-linux-imx <linux-imx@nxp.com>,
        "christophe.jaillet@wanadoo.fr" <christophe.jaillet@wanadoo.fr>,
        "dan.carpenter@oracle.com" <dan.carpenter@oracle.com>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: RE: [PATCH v2] Revert "pinctrl: freescale: imx: Use 'devm_of_iomap()'
 to avoid a resource leak in case of error in 'imx_pinctrl_probe()'"
Thread-Topic: [PATCH v2] Revert "pinctrl: freescale: imx: Use
 'devm_of_iomap()' to avoid a resource leak in case of error in
 'imx_pinctrl_probe()'"
Thread-Index: AQHWPg9qyrpD8Vbzpk+sM4v78r2CgajalTWAgAEC94CAAHUbgIAAGPAA
Date:   Wed, 17 Jun 2020 02:53:13 +0000
Message-ID: <AM6PR04MB49666437F0A488FE67D66F7B809A0@AM6PR04MB4966.eurprd04.prod.outlook.com>
References: <1591673223-1680-1-git-send-email-haibo.chen@nxp.com>
 <AM6PR04MB4966D0FCE44CC173F95C139A809D0@AM6PR04MB4966.eurprd04.prod.outlook.com>
 <CAHp75VdvV-tBtZKU6WKHJy+yuesaq6c=PbxCFaJuvujeWhmm-Q@mail.gmail.com>
 <DB6PR0402MB2760B7D339C1DECFB7DACAC8889A0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
In-Reply-To: <DB6PR0402MB2760B7D339C1DECFB7DACAC8889A0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 4f49fd94-06a1-4f98-10fd-08d8126993e8
x-ms-traffictypediagnostic: AM6PR04MB6085:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR04MB6085D5DDDED298F6C386FF88809A0@AM6PR04MB6085.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:751;
x-forefront-prvs: 04371797A5
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vp3wQa8ARw5fzzD/SSzlY7k5Ga7d/2XEG5HLi3BYYHE+WyljnvupI2q01e2Xv8w4u9v7mYDLXH3Gvwu4xgle6wTSjBCUywOAiOVCJWN1Is+VIoWDBNbvKHsomyMSKLsd5+qWDE8+C0Xqeqgrvd7RXMw3Bymzs4S52EkkUM2Tbr94BFFjPXtWrANeOZ+QYyD5HSWg749k3yu8zGKIiUFO8zOoKaQnu8e+r/fRAClIt3/MBjYwutr4eiuZt6JBbhnjPduyiG2Qiq/u1oFuhbjfRr38mm649B31IvupPepQcT/JFnKGtSCVm90876MsU+1XkcHSyG9rOjI/GJDUUedMHQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4966.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(39850400004)(366004)(136003)(376002)(346002)(7696005)(44832011)(54906003)(316002)(110136005)(7416002)(2906002)(478600001)(86362001)(4326008)(76116006)(52536014)(66476007)(66556008)(64756008)(66446008)(66946007)(55016002)(53546011)(6506007)(71200400001)(186003)(26005)(33656002)(8936002)(9686003)(8676002)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: JTgL02425/1cN97DmLlEOx9qfJJQDT4LmbFpr1NvLvyKwrq0iKA1biPPJs+iHmYxYFXFPw9D7PKpv/KfC4m6wzq3fJWMkfp2gMU9m1pn/94+g0rAZ35/c04X1wt8HrCSLdcxOCP+Kwl8gT4oiq+4S8XOPLdLxv5ywG4qmoJ5whdUT0jo8qNNYI4h1tI8bLNW7pTmvGHJsSd8kW1eoerUDYRVqERZnvauCv1kzncdntG0c0NZY+1zPmZ+ahL9FVnQR5TZPBAB+vywx6FedU6b3U+yZ1ZvMlUsNb95o4vt2OLpVpKi2g9En3CEmUbIkySrqcqH4mq9wLew7COpkd35t+wjs3SPylpbtMc2/LVCiFyDzbMNBHhWICcvurnHQv2Sgn92xd9RFrspubGu25ndmyBVwINIQrgWastdDuv582Z+YQnk2RBoiVdNs0GU0C4tEjcVZpQeUKMXi2ocNDJp2ZpaikwUZYH09TCr5U4xtdo=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f49fd94-06a1-4f98-10fd-08d8126993e8
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2020 02:53:13.4211
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yPXOdFM4vrf6cQafmLih5hGvFJVw/5IwoxPHIWH3n76+zXWJ3XcGkmk6Tu6Un+EjMPZK0VI2jbLeI2+mzYaTAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6085
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

PiBGcm9tOiBQZW5nIEZhbiA8cGVuZy5mYW5AbnhwLmNvbT4NCj4gU2VudDogV2VkbmVzZGF5LCBK
dW5lIDE3LCAyMDIwIDk6MTUgQU0NCj4gDQo+ID4gU3ViamVjdDogUmU6IFtQQVRDSCB2Ml0gUmV2
ZXJ0ICJwaW5jdHJsOiBmcmVlc2NhbGU6IGlteDogVXNlICdkZXZtX29mX2lvbWFwKCknDQo+ID4g
dG8gYXZvaWQgYSByZXNvdXJjZSBsZWFrIGluIGNhc2Ugb2YgZXJyb3IgaW4gJ2lteF9waW5jdHJs
X3Byb2JlKCknIg0KPiA+DQo+ID4gT24gVHVlLCBKdW4gMTYsIDIwMjAgYXQgNTo1NCBBTSBBaXNo
ZW5nIERvbmcgPGFpc2hlbmcuZG9uZ0BueHAuY29tPg0KPiA+IHdyb3RlOg0KPiA+DQo+ID4gPiBD
b3VsZCB5b3UgaGVscCBhcHBseSB0aGlzIHBhdGNoIGFzIGl0IGJsb2NrZWQgTVg3RCBib290aW5n
IGZvciBhIHdoaWxlPw0KPiA+DQo+ID4gPiA+IFRoaXMgcmV2ZXJ0cyBjb21taXQgYmE0MDMyNDI2
MTVjMmM5OWUyN2FmNzk4NGIxNjUwNzcxYTJjYzJjOS4NCj4gPiA+ID4NCj4gPiA+ID4gQWZ0ZXIg
Y29tbWl0IDI2ZDhjZGU1MjYwYiAoInBpbmN0cmw6IGZyZWVzY2FsZTogaW14OiBhZGQgc2hhcmVk
DQo+ID4gPiA+IGlucHV0IHNlbGVjdCByZWcgc3VwcG9ydCIpLiBpLk1YN0QgaGFzIHR3byBpb211
eCBjb250cm9sbGVycw0KPiA+ID4gPiBpb211eGMgYW5kIGlvbXV4Yy1scHNyIHdoaWNoIHNoYXJl
IHNlbGVjdF9pbnB1dCByZWdpc3RlciBmb3IgZGFpc3kgY2hhaW4NCj4gc2V0dGluZ3MuDQo+ID4g
PiA+IElmIHVzZSAnZGV2bV9vZl9pb21hcCgpJywgd2hlbiBwcm9iZSB0aGUgaW9tdXhjLWxwc3Is
IHdpbGwgY2FsbA0KPiA+ID4gPiBkZXZtX3JlcXVlc3RfbWVtX3JlZ2lvbigpIGZvciB0aGUgcmVn
aW9uIDwweDMwMzMwMDAwLTB4MzAzM2ZmZmY+DQo+ID4gPiA+IGZvciB0aGUgZmlyc3QgdGltZS4g
VGhlbiwgbmV4dCB0aW1lIHdoZW4gcHJvYmUgdGhlIGlvbXV4YywgQVBJDQo+ID4gPiA+IGRldm1f
cGxhdGZvcm1faW9yZW1hcF9yZXNvdXJjZSgpIHdpbGwgYWxzbyB1c2UgdGhlIEFQSQ0KPiA+ID4g
PiBkZXZtX3JlcXVlc3RfbWVtX3JlZ2lvbigpIGZvciB0aGUgc2hhcmUgcmVnaW9uDQo+ID4gPiA+
IDwweDMwMzMwMDAwLTB4MzAzM2ZmZmY+IGFnYWluLCB0aGVuIGNhdXNlIGlzc3VlLCBsb2cgbGlr
ZSBiZWxvdzoNCj4gPiA+ID4NCj4gPiA+ID4gWyAgICAwLjE3OTU2MV0gaW14N2QtcGluY3RybCAz
MDJjMDAwMC5pb211eGMtbHBzcjogaW5pdGlhbGl6ZWQgSU1YDQo+ID4gcGluY3RybA0KPiA+ID4g
PiBkcml2ZXINCj4gPiA+ID4gWyAgICAwLjE5MTc0Ml0gaW14N2QtcGluY3RybCAzMDMzMDAwMC5w
aW5jdHJsOiBjYW4ndCByZXF1ZXN0IHJlZ2lvbiBmb3INCj4gPiA+ID4gcmVzb3VyY2UgW21lbSAw
eDMwMzMwMDAwLTB4MzAzM2ZmZmZdDQo+ID4gPiA+IFsgICAgMC4xOTE4NDJdIGlteDdkLXBpbmN0
cmw6IHByb2JlIG9mIDMwMzMwMDAwLnBpbmN0cmwgZmFpbGVkIHdpdGggZXJyb3INCj4gPiAtMTYN
Cj4gPg0KPiA+IEl0IG1lYW5zIHRoYXQgc2hhcmVkIHN1cHBvcnQgdG9vayBhIHdyb25nIGFwcHJv
YWNoLiBJZiBzb21ldGhpbmcgaGFzDQo+ID4gc2hhcmVkIHJlc291cmNlcywgYW5vdGhlciBzY2hl
bWEgc2hvdWxkIGJlIHVzZWQsIHNvbWV0aGluZyBsaWtlIE1GRA0KPiA+IChwYXJlbnQgZGV2aWNl
IHdoaWNoIGtlZXBzIG9ubHkgc2hhcmVkIHJlc291cmNlcykuIEVhc2llc3Qgd2F5IGlzIHRvDQo+
ID4gc3dpdGNoIHRvIHRoZSByZWdtYXAgQVBJLg0KPiANCj4gQWN0dWFsbHkgbm90IE1GRCwgaXQg
aXMgdGhlIGR0cyB1c2Ugd3JvbmcgYWRkcmVzcyByZWdpb24uDQo+IA0KPiAgICAgICAgICAgICAg
ICAgICAgICAgICBpb211eGNfbHBzcjogaW9tdXhjLWxwc3JAMzAyYzAwMDAgew0KPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAiZnNsLGlteDdkLWlvbXV4Yy1s
cHNyIjsNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZWcgPSA8MHgzMDJjMDAw
MCAweDEwMDAwPjsNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBmc2wsaW5wdXQt
c2VsID0gPCZpb211eGM+Ow0KPiAgICAgICAgICAgICAgICAgICAgICAgICB9Ow0KPiAgICAgICAg
ICAgICAgICAgICAgICAgICBpb211eGM6IHBpbmN0cmxAMzAzMzAwMDAgew0KPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAiZnNsLGlteDdkLWlvbXV4YyI7DQo+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDB4MzAzMzAwMDAgMHgxMDAw
MD47DQo+ICAgICAgICAgICAgICAgICAgICAgICAgIH07DQo+IA0KPiBUaGVyZSBpcyBvdmVybGFw
IGJldHdlZW4gdGhlIHR3by4NCj4gDQo+IFRoZSBpb211eGNfbHBzciB1c2luZyAweDEwMDAwIGFz
IHNpemUgaXMgd3JvbmcuIEl0IG5vdCBoYXZlIHN1Y2ggbGFyZ2UgYXJlYS4NCj4gDQo+IFdpdGgg
dGhlIHNpemUgZml4LCBkZXZtX29mX2lvcmVtYXAgY291bGQgYmUgdXNlZCBJIHRoaW5rLg0KPiAN
Cg0KUmVhbGx5IG92ZXJsYXBwZWQ/DQoNCkkgdGhpbmsgdGhlIHJlYWwgaXNzdWUgaXMgTFBTUiBT
ZWwgSW5wdXQgcGFydCB1c2luZyB0aGUgc2FtZSBtZW1vcnkgcmVnaW9uIGFzIGlvbXV4Lg0KDQpS
ZWdhcmRzDQpBaXNoZW5nDQoNCj4gUmVnYXJkcywNCj4gUGVuZy4NCj4gDQo+ID4NCj4gPiBQLlMu
IFRoZSByZXZlcnQgaXMgb2theSBhcyBhIHF1aWNrIGZpeCBidXQuLi4gc2VlIGFib3ZlLg0KPiA+
DQo+ID4gLS0NCj4gPiBXaXRoIEJlc3QgUmVnYXJkcywNCj4gPiBBbmR5IFNoZXZjaGVua28NCg==
