Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA8E11FC33F
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2020 03:14:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726253AbgFQBO4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Jun 2020 21:14:56 -0400
Received: from mail-am6eur05on2058.outbound.protection.outlook.com ([40.107.22.58]:6266
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725894AbgFQBOz (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 16 Jun 2020 21:14:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FHU/vMilFvn1ZTEvDrz2AiN1vug0hhF52iAmtbrxHTjCsa5utPzSUpwJyXT8sLVUE6p0mL6IUsl2lXrDD2NlKDt0Sqk7jirGILDCemsvVTxtFoa/UgqmaI3Y1ra23V+fJuT0cXAhLpGlvxWrO4C9f8/CHmrfFDy8403RAY7B6SXxa+ajlomVJ3XJ5t+oJQG1TSLACB1eM9lpAE6cSZdZxrwIyShobiTlsxlA4alP8YPMFFCka+k8Y1pkt0tcBY07KQ+MkNWpcVTwlTRYBUOV7NCJrnSrbVYyu8uNU11hiLEE5aAUMuBfpFJpuKZUltkcBdmFTJ/u8EIZ2/FsNwTiDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zvuQDy1xF03KKWLZmIWo4r+ueK2N89Th/2mNipZVEcw=;
 b=SqvJY3NygZpE2Vnkv3GDLWA7ExCEW7ea2dZD7sIzSTXT1MT/Sdvll/gPM2JQVn2IhXwz+ci/qtOrR7Xyu6fuJcP9vWsSKaAbySCV/ffoT0A+c4WTTRuVydOzQkb0Kdj2vD7cr67TQlDajh376eSpaZ5OkeXfEPM1TCELLlRFOx/eAP7mJ2lfKGlNHBNlhTFflMGOd6dhwbl6auiW/yc+AxMiYVyt5LWH2tjVncreZfnUWATTPDAsYK5Sgj2MQiEQrVwbeb/KROpmc9S1eU1S3v16+YyKwR7BFFg7JfX7/l3K/4C8nBTs65PlAc+I8FhQj5rnUok9kZsvhLjf9ub8cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zvuQDy1xF03KKWLZmIWo4r+ueK2N89Th/2mNipZVEcw=;
 b=XV50izltiqDBSLjF3t7YRPW7g4yLCnDFTKvT24AGZlWHwLLRsQ6EG38QQt6u2UpgnpzqKPRcV5HX2WvakFauSEwwQFuIwDBTvzgLUN9e8yXh1mryNVsGRwKBrhHBiJ7NXd0UnBhw3pzpAlpAdg50X1GgESHtglfXPu/G3Ph4MYc=
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (10.172.251.142) by
 DB6PR0402MB2725.eurprd04.prod.outlook.com (10.172.245.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3088.19; Wed, 17 Jun 2020 01:14:52 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::2d36:b569:17c:7701]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::2d36:b569:17c:7701%4]) with mapi id 15.20.3088.028; Wed, 17 Jun 2020
 01:14:51 +0000
From:   Peng Fan <peng.fan@nxp.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Aisheng Dong <aisheng.dong@nxp.com>
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
Thread-Index: AQHWPg9qVVftOqq4kEyN1vjJd0XZBajaloIAgAEBqoCAAHRXAA==
Date:   Wed, 17 Jun 2020 01:14:51 +0000
Message-ID: <DB6PR0402MB2760B7D339C1DECFB7DACAC8889A0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <1591673223-1680-1-git-send-email-haibo.chen@nxp.com>
 <AM6PR04MB4966D0FCE44CC173F95C139A809D0@AM6PR04MB4966.eurprd04.prod.outlook.com>
 <CAHp75VdvV-tBtZKU6WKHJy+yuesaq6c=PbxCFaJuvujeWhmm-Q@mail.gmail.com>
In-Reply-To: <CAHp75VdvV-tBtZKU6WKHJy+yuesaq6c=PbxCFaJuvujeWhmm-Q@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: d7bad89d-ae5c-48c2-208c-08d8125bd649
x-ms-traffictypediagnostic: DB6PR0402MB2725:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB6PR0402MB2725E9DF28053694B63700B0889A0@DB6PR0402MB2725.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:751;
x-forefront-prvs: 04371797A5
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bq0omkGV0ylhY2v+chEeBkj2vmHyceNGaBVyz7RFsnHNVW+tLcTZxXppKJwRZ5+ure/9CUukx4ovH1rWJCzdzP51f4tUdQquw4k2R6nLWi1FEXPz3qug8wsrUb2UH09XvJkWD8EDWVlNSmkSlC+SHFSWCrqSA2FESxEHd3rorMzXFu5yv+7zowZRSbobLkNYfd5xGw+Pf2GpeUHpR2bXkP3Piksba8BinGeKf3/TAGRuBqvX9znOBJ5qepExG9sY4/58L4U9c+D281KcRRa1qkTpsydED9XpZiKXnnX667yCDaIoq7NlSYUTU/CJCvyTShlKGUEmogrXwR60aMlR/Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(376002)(346002)(39860400002)(396003)(136003)(366004)(86362001)(478600001)(186003)(6636002)(53546011)(5660300002)(7416002)(6506007)(52536014)(2906002)(26005)(7696005)(4326008)(55016002)(9686003)(71200400001)(110136005)(316002)(66556008)(33656002)(66946007)(54906003)(66476007)(64756008)(83380400001)(76116006)(66446008)(8936002)(8676002)(44832011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: AiQ38JFuuayBey4lSOkxSmHz9W93OuN7Ns1YMwRYkGUIaSbPLmtt+KSKtAmEOmaJjP/LskUqpEmjbUoKsl8c3bY+NVGqdGFaE30XZZKbwjziVeXjicjGagzbjkXTIfTcoRgrw66iFelJO9JkvcSKM7EKgQrpwhQr3oUTdoMBKr7eGl/Jf52Xl7CEBS1QAmly+q8nxFHiXDTyTmvPkH8393yH8DLjJZueVUgs+K32dkwdhlqC7PklipOz6pmphWApBmSwBiDH6MOJONvtYhl1zQxA0P8YgGLsQMJeHt3IDL9PNc6ZeUPpe1E1RkPbLDmiU6JI8TNpPMF5UPUKEhm7nJDldGzHgbNADsjXWdfFhyicF5Msr8fcadQRDtz431b2tmKJFpgSxNNmYJfB9fb8j1lsM5WJ/BuO4Gmi2ZEBv8eC+ENjTbiw/y0PsE7S7uLBNDJiKuoDrOojY3o1LMcBMFemkyVrRT6BNeSLiwxgeuw=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7bad89d-ae5c-48c2-208c-08d8125bd649
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2020 01:14:51.8156
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UnrnESCcSCLV/fBTYb1BcZhQ4BeXba4RRJqcK+sAg8Sq3qUW89SScrv65SUSSF91EtaH4bwxth217eJGb38lHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0402MB2725
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

PiBTdWJqZWN0OiBSZTogW1BBVENIIHYyXSBSZXZlcnQgInBpbmN0cmw6IGZyZWVzY2FsZTogaW14
OiBVc2UgJ2Rldm1fb2ZfaW9tYXAoKScNCj4gdG8gYXZvaWQgYSByZXNvdXJjZSBsZWFrIGluIGNh
c2Ugb2YgZXJyb3IgaW4gJ2lteF9waW5jdHJsX3Byb2JlKCknIg0KPiANCj4gT24gVHVlLCBKdW4g
MTYsIDIwMjAgYXQgNTo1NCBBTSBBaXNoZW5nIERvbmcgPGFpc2hlbmcuZG9uZ0BueHAuY29tPg0K
PiB3cm90ZToNCj4gDQo+ID4gQ291bGQgeW91IGhlbHAgYXBwbHkgdGhpcyBwYXRjaCBhcyBpdCBi
bG9ja2VkIE1YN0QgYm9vdGluZyBmb3IgYSB3aGlsZT8NCj4gDQo+ID4gPiBUaGlzIHJldmVydHMg
Y29tbWl0IGJhNDAzMjQyNjE1YzJjOTllMjdhZjc5ODRiMTY1MDc3MWEyY2MyYzkuDQo+ID4gPg0K
PiA+ID4gQWZ0ZXIgY29tbWl0IDI2ZDhjZGU1MjYwYiAoInBpbmN0cmw6IGZyZWVzY2FsZTogaW14
OiBhZGQgc2hhcmVkDQo+ID4gPiBpbnB1dCBzZWxlY3QgcmVnIHN1cHBvcnQiKS4gaS5NWDdEIGhh
cyB0d28gaW9tdXggY29udHJvbGxlcnMgaW9tdXhjDQo+ID4gPiBhbmQgaW9tdXhjLWxwc3Igd2hp
Y2ggc2hhcmUgc2VsZWN0X2lucHV0IHJlZ2lzdGVyIGZvciBkYWlzeSBjaGFpbiBzZXR0aW5ncy4N
Cj4gPiA+IElmIHVzZSAnZGV2bV9vZl9pb21hcCgpJywgd2hlbiBwcm9iZSB0aGUgaW9tdXhjLWxw
c3IsIHdpbGwgY2FsbA0KPiA+ID4gZGV2bV9yZXF1ZXN0X21lbV9yZWdpb24oKSBmb3IgdGhlIHJl
Z2lvbiA8MHgzMDMzMDAwMC0weDMwMzNmZmZmPiBmb3INCj4gPiA+IHRoZSBmaXJzdCB0aW1lLiBU
aGVuLCBuZXh0IHRpbWUgd2hlbiBwcm9iZSB0aGUgaW9tdXhjLCBBUEkNCj4gPiA+IGRldm1fcGxh
dGZvcm1faW9yZW1hcF9yZXNvdXJjZSgpIHdpbGwgYWxzbyB1c2UgdGhlIEFQSQ0KPiA+ID4gZGV2
bV9yZXF1ZXN0X21lbV9yZWdpb24oKSBmb3IgdGhlIHNoYXJlIHJlZ2lvbg0KPiA+ID4gPDB4MzAz
MzAwMDAtMHgzMDMzZmZmZj4gYWdhaW4sIHRoZW4gY2F1c2UgaXNzdWUsIGxvZyBsaWtlIGJlbG93
Og0KPiA+ID4NCj4gPiA+IFsgICAgMC4xNzk1NjFdIGlteDdkLXBpbmN0cmwgMzAyYzAwMDAuaW9t
dXhjLWxwc3I6IGluaXRpYWxpemVkIElNWA0KPiBwaW5jdHJsDQo+ID4gPiBkcml2ZXINCj4gPiA+
IFsgICAgMC4xOTE3NDJdIGlteDdkLXBpbmN0cmwgMzAzMzAwMDAucGluY3RybDogY2FuJ3QgcmVx
dWVzdCByZWdpb24gZm9yDQo+ID4gPiByZXNvdXJjZSBbbWVtIDB4MzAzMzAwMDAtMHgzMDMzZmZm
Zl0NCj4gPiA+IFsgICAgMC4xOTE4NDJdIGlteDdkLXBpbmN0cmw6IHByb2JlIG9mIDMwMzMwMDAw
LnBpbmN0cmwgZmFpbGVkIHdpdGggZXJyb3INCj4gLTE2DQo+IA0KPiBJdCBtZWFucyB0aGF0IHNo
YXJlZCBzdXBwb3J0IHRvb2sgYSB3cm9uZyBhcHByb2FjaC4gSWYgc29tZXRoaW5nIGhhcyBzaGFy
ZWQNCj4gcmVzb3VyY2VzLCBhbm90aGVyIHNjaGVtYSBzaG91bGQgYmUgdXNlZCwgc29tZXRoaW5n
IGxpa2UgTUZEIChwYXJlbnQNCj4gZGV2aWNlIHdoaWNoIGtlZXBzIG9ubHkgc2hhcmVkIHJlc291
cmNlcykuIEVhc2llc3Qgd2F5IGlzIHRvIHN3aXRjaCB0byB0aGUNCj4gcmVnbWFwIEFQSS4NCg0K
QWN0dWFsbHkgbm90IE1GRCwgaXQgaXMgdGhlIGR0cyB1c2Ugd3JvbmcgYWRkcmVzcyByZWdpb24u
DQoNCiAgICAgICAgICAgICAgICAgICAgICAgIGlvbXV4Y19scHNyOiBpb211eGMtbHBzckAzMDJj
MDAwMCB7DQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAiZnNs
LGlteDdkLWlvbXV4Yy1scHNyIjsNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVn
ID0gPDB4MzAyYzAwMDAgMHgxMDAwMD47DQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGZzbCxpbnB1dC1zZWwgPSA8JmlvbXV4Yz47DQogICAgICAgICAgICAgICAgICAgICAgICB9Ow0K
ICAgICAgICAgICAgICAgICAgICAgICAgaW9tdXhjOiBwaW5jdHJsQDMwMzMwMDAwIHsNCiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJmc2wsaW14N2QtaW9tdXhj
IjsNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDB4MzAzMzAwMDAgMHgx
MDAwMD47DQogICAgICAgICAgICAgICAgICAgICAgICB9Ow0KDQpUaGVyZSBpcyBvdmVybGFwIGJl
dHdlZW4gdGhlIHR3by4NCg0KVGhlIGlvbXV4Y19scHNyIHVzaW5nIDB4MTAwMDAgYXMgc2l6ZSBp
cyB3cm9uZy4gSXQgbm90IGhhdmUgc3VjaCBsYXJnZSBhcmVhLg0KDQpXaXRoIHRoZSBzaXplIGZp
eCwgZGV2bV9vZl9pb3JlbWFwIGNvdWxkIGJlIHVzZWQgSSB0aGluay4NCg0KUmVnYXJkcywNClBl
bmcuDQoNCj4gDQo+IFAuUy4gVGhlIHJldmVydCBpcyBva2F5IGFzIGEgcXVpY2sgZml4IGJ1dC4u
LiBzZWUgYWJvdmUuDQo+IA0KPiAtLQ0KPiBXaXRoIEJlc3QgUmVnYXJkcywNCj4gQW5keSBTaGV2
Y2hlbmtvDQo=
