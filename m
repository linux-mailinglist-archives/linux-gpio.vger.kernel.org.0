Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0ECC81866EF
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2020 09:52:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730159AbgCPIwG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Mar 2020 04:52:06 -0400
Received: from mail-eopbgr150083.outbound.protection.outlook.com ([40.107.15.83]:36782
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730075AbgCPIwG (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 16 Mar 2020 04:52:06 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EBi9wcMEV+apFn79Cknz49AEve4Mawbcgi6U4kllTA4h8FrXY34pEPlZ4S1cf3oA+FHxm43xJp2xMrOAOdn+6tziU2Ow/Bbcnqnfm+M9HVMI3Du+LITisyC1Ebeq5k2uEP41S2o+Fe+xuI7USnY1Zr74iwSGjHcP18iw2tFQRr4ryeYfdF+w2Q+Z0WWrjMgLjZiBVECSGz2wEB3ZQ9rY8YHGg0c6UGlSNJ7EkvtJraTP4HTxaD7ZqzBg7yDjlpE2d8OsGENmHduJcMBkzmliGtFy5m0Zj4E30oBZ2N7vqQjku7fslT2iuzi7xCyUhOmg6kYwJMegxFVDOpKLz3vd5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fyqpx1hArPMlgTojJG+OAiwvwbY9dFbVXdyvn1x5VmQ=;
 b=mAazhZjSfD9nw7I1+wNJ7y4vRG1+VI+9nyKTFK+BVb0002EJVPbL+U2P7arSktm04Yebq/o98xi3OsdsaoCA6tbnDL6fXNL/2naPh5UxXj1HgOWBnC+FYbI/sDmXuno4m427e5JxFmZLBvH+Dw9jKTa0FaC90+Pp0T+GSlF9WJUqNT9PULK0aO6a79CcLzShQuPrs4eDGDRJY5dWT1LEHUPIXc4Lfer0aANVVI2uZabVOnW7BdbgoHfXaWxcAXP3iOmrPIwFhxip51Ozl/na10zUK4WuFzr98WalAyGNwqICz54izxVafchyBHRcW77awfTjlGlkRcE0cVzDKc/FLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fyqpx1hArPMlgTojJG+OAiwvwbY9dFbVXdyvn1x5VmQ=;
 b=XKaQ1tmdUlK64lPGG0JsKZTFWiAvZQRLoymO3KTkWOAIh3JXCIlCTt1DLiloNO30IIQHKRIeIWXfeZ7er9Yy4K2RyxJ1iOrcJUbbWcSB+eEWgtCqU4hVwjyrNi6A/afQpgRlVHNmpLARfJe1MOi5kifsGkM6FAYqzyRlz4dbv4Y=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.92.158) by
 AM0PR04MB4529.eurprd04.prod.outlook.com (52.135.152.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2814.18; Mon, 16 Mar 2020 08:52:01 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::8cb2:6bfa:b5bc:2ae3]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::8cb2:6bfa:b5bc:2ae3%7]) with mapi id 15.20.2814.021; Mon, 16 Mar 2020
 08:52:01 +0000
From:   Aisheng Dong <aisheng.dong@nxp.com>
To:     Stephen Boyd <sboyd@kernel.org>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>
CC:     Fabio Estevam <fabio.estevam@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
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
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>
Subject: RE: [PATCH v2 1/8] clk: imx: Align imx sc clock msg structs to 4
Thread-Topic: [PATCH v2 1/8] clk: imx: Align imx sc clock msg structs to 4
Thread-Index: AQHV6Ar2+ns546NUFU6ZA9rx2mhDYqgsJ6+AgB7nvLA=
Date:   Mon, 16 Mar 2020 08:52:01 +0000
Message-ID: <AM0PR04MB42111CF54405CD3492248AF580F90@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <cover.1582216144.git.leonard.crestez@nxp.com>
 <10e97a04980d933b2cfecb6b124bf9046b6e4f16.1582216144.git.leonard.crestez@nxp.com>
 <158264951569.54955.16797064769391310232@swboyd.mtv.corp.google.com>
In-Reply-To: <158264951569.54955.16797064769391310232@swboyd.mtv.corp.google.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-originating-ip: [92.121.36.197]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 4e7cd80c-9c43-4b07-9893-08d7c9874b47
x-ms-traffictypediagnostic: AM0PR04MB4529:|AM0PR04MB4529:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR04MB45293DE16436EFBD668AB22680F90@AM0PR04MB4529.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 03449D5DD1
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(396003)(39860400002)(366004)(346002)(136003)(376002)(199004)(55016002)(9686003)(26005)(478600001)(86362001)(2906002)(71200400001)(6506007)(4326008)(7696005)(66446008)(76116006)(44832011)(186003)(81156014)(8676002)(81166006)(5660300002)(54906003)(316002)(110136005)(64756008)(66476007)(66556008)(66946007)(8936002)(33656002)(52536014)(7416002);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4529;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: O6Ni06P7OtXj/NWsEI8iO6W3n/fbW37AUiE48LlFlrHws04Ygeorb0FCQZqpiaX+bTW5F3mC0vPoI6vTgqlWfkju1bS7JQUJTNRGiTMzQgEkzndCfvcnU6pGXYexI9vAdyMYC9Eg8en1jX7jx9EtraKwkGFfWq/QnsDxjUI7cxCDBjZ4cMpsCPb0grKN+3o9w+n4SFIVrOTtO9fGKJNWIjzIvVRVLm3Q3RXXNYGxUA62ZIZ5iMvSCSBYZnXEZrKf+x78cZHG812VsQpmAymV1D02o5o1qaYCoo5wX3h/CAcvY5UJsm1Hy8u3QPGjP9XkC2NPaHUF8Zjzbx1T7GJ0+ffcCsUynEsz14wiq/5/HY4grC27EpzKYVTwWqmosIY6QpwAtx22uZrVCk9tITvBCzZEOJO3HuAFaFw0vi5Y4uyO84NmXNGRB3POfai/2mOY
x-ms-exchange-antispam-messagedata: cNqN8oyw9Xez5vG8vMvB+Qc/7U0dZEut2IksI7/87gUCVBpNhm6KaKo3m+8eft/LSbXqQ4zDCU0bPJvCUmBoFMZBev37ISjXdvD4ZHEW+GiMFES3I048XfVwymYGBmNaLLnW58GYm8djjpvr+hBLRA==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e7cd80c-9c43-4b07-9893-08d7c9874b47
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2020 08:52:01.6016
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qHMW7OkFyEiq82vHOfaIu6+pHaDzpHFLYfOyUoW/WtlONxCD2ZKXpF7x6GW4vmfv4HDSaWKidYytLlydHBo34g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4529
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

PiBGcm9tOiBTdGVwaGVuIEJveWQgPHNib3lkQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IFdlZG5lc2Rh
eSwgRmVicnVhcnkgMjYsIDIwMjAgMTI6NTIgQU0gDQo+IFF1b3RpbmcgTGVvbmFyZCBDcmVzdGV6
ICgyMDIwLTAyLTIwIDA4OjI5OjMyKQ0KPiA+IFRoZSBpbXggU0MgYXBpIHN0cm9uZ2x5IGFzc3Vt
ZXMgdGhhdCBtZXNzYWdlcyBhcmUgY29tcG9zZWQgb3V0IG9mDQo+ID4gNC1ieXRlcyB3b3JkcyBi
dXQgc29tZSBvZiBvdXIgbWVzc2FnZSBzdHJ1Y3RzIGhhdmUgb2RkIHNpemVvZnMuDQo+ID4NCj4g
PiBUaGlzIHByb2R1Y2VzIG1hbnkgb29wc2VzIHdpdGggQ09ORklHX0tBU0FOPXkuDQo+ID4NCj4g
PiBGaXggYnkgbWFya2luZyB3aXRoIF9fYWxpZ25lZCg0KS4NCj4gPg0KPiA+IEZpeGVzOiBmZTM3
YjQ4MjA0MTcgKCJjbGs6IGlteDogYWRkIHNjdSBjbG9jayBjb21tb24gcGFydCIpDQo+ID4gU2ln
bmVkLW9mZi1ieTogTGVvbmFyZCBDcmVzdGV6IDxsZW9uYXJkLmNyZXN0ZXpAbnhwLmNvbT4NCj4g
PiAtLS0NCj4gPiAgZHJpdmVycy9jbGsvaW14L2Nsay1zY3UuYyB8IDYgKysrLS0tDQo+ID4gIDEg
ZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9jbGsvaW14L2Nsay1zY3UuYyBiL2RyaXZlcnMvY2xrL2lteC9j
bGstc2N1LmMNCj4gPiBpbmRleCBmYmVmNzQwNzA0ZDAuLjNjNWM0MmQ4ODMzZSAxMDA2NDQNCj4g
PiAtLS0gYS9kcml2ZXJzL2Nsay9pbXgvY2xrLXNjdS5jDQo+ID4gKysrIGIvZHJpdmVycy9jbGsv
aW14L2Nsay1zY3UuYw0KPiA+IEBAIC00MSwxNiArNDEsMTYgQEAgc3RydWN0IGNsa19zY3Ugew0K
PiA+ICBzdHJ1Y3QgaW14X3NjX21zZ19yZXFfc2V0X2Nsb2NrX3JhdGUgew0KPiA+ICAgICAgICAg
c3RydWN0IGlteF9zY19ycGNfbXNnIGhkcjsNCj4gPiAgICAgICAgIF9fbGUzMiByYXRlOw0KPiA+
ICAgICAgICAgX19sZTE2IHJlc291cmNlOw0KPiA+ICAgICAgICAgdTggY2xrOw0KPiA+IC19IF9f
cGFja2VkOw0KPiA+ICt9IF9fcGFja2VkIF9fYWxpZ25lZCg0KTsNCj4gDQo+IFNvcnJ5LCB0aGlz
IHN0aWxsIGRvZXNuJ3QgbWFrZSBzZW5zZSB0byBtZS4gSGF2aW5nIF9fYWxpZ25lZCg0KSBtZWFu
cyB0aGF0IHRoZQ0KPiBzdHJ1Y3QgaXMgcGxhY2VkIG9uIHRoZSBzdGFjayBhdCBzb21lIGFsaWdu
bWVudCwgZ3JlYXQsIGJ1dCBpdCBzdGlsbCBoYXMgX19wYWNrZWQgc28NCj4gdGhlIHNpemVvZiB0
aGlzIHN0cnVjdCBpcyBzb21lIG9kZCBudW1iZXIgbGlrZSAxMQ0KDQo+IElmIHRoaXMgc3RydWN0
IGlzIHRoZSBsYXN0IGVsZW1lbnQgb24gdGhlIHN0YWNrIGl0IHdpbGwgZW5kIGF0IHNvbWUgdW5h
bGlnbmVkIGFkZHJlc3MNCj4gYW5kIHRoZSBtYWlsYm94IGNvZGUgd2lsbCByZWFkIGEgZmV3IGJ5
dGVzIGJleW9uZCB0aGUgZW5kIG9mIHRoZSBzdGFjay4NCg0KSGkgTGVvbmFyZCwNCg0KQ2FuIHlv
dSBjb25zdHJ1Y3QgdGhpcyBjYXNlIHRvIHNlZSBpZiB3ZSBjYW4gcmVwcm9kdWNlIHRoZSBpc3N1
ZSBhcyBwb2ludGVkIGJ5IFN0ZXBoZW4/DQoNClJlZ2FyZHMNCkFpc2hlbmcNCg0KPiANCj4gSSBz
ZWUgdGhhdCB0aGUgY2FsbGluZyBjb2RlIHB1dHMgMyBhcyB0aGUgJ3NpemUnIGZvciB0aGlzIHN0
cnVjdCBpbiBjbGtfc2N1X3NldF9yYXRlKCkuDQo+IA0KPiAJaGRyLT5zaXplID0gMzsNCj4gDQo+
IFRoYXQgc2VlbXMgdG8gc2F5IHRoYXQgdGhlIHN0cnVjdCBpcyAzIHdvcmRzIGxvbmcsIG9yIDEy
IGJ5dGVzLiBUaGVuIHdlIGNhbGwNCj4gaW14X3NjdV9jYWxsX3JwYygpLCBwYXNzaW5nIHRoZSBw
b2ludGVyIHRvIHRoaXMgc3RydWN0IG9uIHRoZSBzdGFjayBhbmQgdGhhdA0KPiBldmVudHVhbGx5
IGdldHMgaW50byBpbXhfc2N1X2lwY193cml0ZSgpIGNhbGxpbmcNCj4gbWJveF9zZW5kX21lc3Nh
Z2UoKSB3aXRoIHUzMiBwb2ludGVycy4NCj4gDQo+IAlmb3IgKGkgPSAwOyBpIDwgaGRyLT5zaXpl
OyBpKyspIHsNCj4gCQlzY19jaGFuID0gJnNjX2lwYy0+Y2hhbnNbaSAlIDRdOw0KPiAJCXJldCA9
IG1ib3hfc2VuZF9tZXNzYWdlKHNjX2NoYW4tPmNoLCAmZGF0YVtpXSk7DQo+IA0KPiBTbyB3ZSd2
ZSB0YWtlbiB0aGUgMTEgYnl0ZSBzdHJ1Y3QgKGRhdGEgaW4gdGhpcyBjYXNlKSBhbmQgY2FzdGVk
IGl0IHRvIGENCj4gdTMyIGFycmF5IHdpdGggMyBlbGVtZW50cywgd2hpY2ggaXMgYmFkLiBUaGlz
IGlzIHdoYXQga2FzYW4gaXMgd2FybmluZyBhYm91dC4NCj4gQWRkaW5nIGFsaWduZWQgc29tZXRp
bWVzIGZpeGVzIGl0IGJlY2F1c2UgdGhlIGNvbXBpbGVyIHdpbGwgcGxhY2UgdGhlIG5leHQgc3Rh
Y2sNCj4gdmFyaWFibGUgYXQgdGhlIG5hdHVyYWxseSBhbGlnbmVkIGxvY2F0aW9uIGFuZCB0aHVz
IHdlIGdldCB0aGUgb25lIGJ5dGUgcGFkZGluZw0KPiBidXQgSSBkb24ndCBzZWUgaG93IHRoYXQg
d29ya3Mgd2hlbiBpdCdzIHRoZSBsYXN0IHN0YWNrIGVsZW1lbnQuIFRoZSBzdGFjayB3aWxsDQo+
IGVuZCBhdCBzb21lIHVuYWxpZ25lZCBhZGRyZXNzLg0KPiANCj4gVGhlIGJldHRlciBzb2x1dGlv
biB3b3VsZCBiZSB0byBkcm9wIF9fYWxpZ25lZCg0KSBhbmQgbWFrZSBhIHVuaW9uIG9mIHRoZQ0K
PiBzdHJ1Y3Qgd2l0aCB3aGF0ZXZlciBzaXplIG51bWJlciBvZiB3b3JkcyB0aGUgbWVzc2FnZSBp
cyBvciBkbyBhIGNvcHkgb2YgdGhlDQo+IHN0cnVjdCBpbnRvIGEgdTMyIGFycmF5IHRoYXQgaXMg
cGFzc2VkIHRvIGlteF9zY3VfY2FsbF9ycGMoKS4NCj4gDQo+IEZvciBleGFtcGxlOg0KPiANCj4g
CXN0cnVjdCBpbXhfc2NfbXNnX3JlcV9zZXRfY2xvY2tfcmF0ZSB7DQo+IAkJdW5pb24gew0KPiAJ
CQlzdHJ1Y3QgcGFja2VkX21lc3NhZ2Ugew0KPiAJCQkJc3RydWN0IGlteF9zY19ycGNfbXNnIGhk
cjsNCj4gCQkJCV9fbGUzMiByYXRlOw0KPiAJCQkJX19sZTE2IHJlc291cmNlOw0KPiAJCQkJdTgg
Y2xrOw0KPiAJCQl9IF9fcGFja2VkOw0KPiAJCQl1MzIgZGF0YVszXTsNCj4gCQl9Ow0KPiAJfTsN
Cj4gDQo+IElmIHRoZSB1bmlvbiBhcHByb2FjaCB3YXMgdXNlZCB0aGVuIGVhY2ggdGltZSBpbXhf
c2N1X2NhbGxfcnBjKCkgaXMgY2FsbGVkIHdlDQo+IGNhbiBzaW1wbHkgcGFzcyB0aGUgJ2RhdGEn
IG1lbWJlciBhbmQgbWFrZSB0aGUgc2Vjb25kIGFyZ3VtZW50ICdtc2cnDQo+IHN0cm9uZ2x5IHR5
cGVkIHRvIGJlIGEgdTMyIHBvaW50ZXIuIGthc2FuIHNob3VsZCBiZSBoYXBweSB0b28uDQo=
