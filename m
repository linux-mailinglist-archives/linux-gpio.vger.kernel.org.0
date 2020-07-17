Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFDF82238BE
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jul 2020 11:53:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726557AbgGQJxO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Jul 2020 05:53:14 -0400
Received: from mail-eopbgr80047.outbound.protection.outlook.com ([40.107.8.47]:63456
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725864AbgGQJxN (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 17 Jul 2020 05:53:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OnE1zSnA7m1sEX3F3pJj5IzFrrHlxrQU8cVbXP1uL+FByCzBo6+Pn3elfDV9IBXY7GSHla2NglnUIIRvQk/A1QmOsfupS4vRVuQzP5B0EanqVdFqRnc6958CKEUTwwnTp6ij8MpLZ/Dnrf4dL0SJ+l5ZfCKqKk3gXA0RqKsH9PvoMKu1BuUmh6FSY5uZwwxs/LWwqKt0eGyKefJJD3j0TmYXBdyLAQHlt1bBxu5Kml3Nnr3avY+xgssbZyE+8tsBEvvQ+nKi4smfS9sEdxNYt3CIo91lOpEAtHclalgRRQjOw0orJLnykbT12n4ua0kRxnRJQBqsJx5GQ0oXhjjXEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pH7DX6ofMbEBi7nz6qxsJL+zMHh7ND5O18jq77q6Xkc=;
 b=Qwc1tgUpmyx4Zc3U0HvX/v9j6fHEuq60t54lARuWQ/Un6oIUuwrUiKuzY2kdusSr9NO94FGVie7Pk59lrcF6CW70klka0QyQlnXhd5bxNgp8EF+bzvTyjRRk8u3V47BDBRV5gFmIl0xHwO4TmMyaCoeM9W2ahVHonXzmmL45SqMSrI8o3zUAYTJZWFfmRr66a93ubBSnkgUPpa1Z/ea0/6CpPsZbuDYcE7i8oHwinnt6qwQa07gSm9U242wADcRqnjZUTQIRcVdaxqQSyMnfC9EU6Vz4YY3EcZ3rWGNq05RojlGWrzo9duZrsziVX+lkTwmzvMhUm2tyR1D+wWGwrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pH7DX6ofMbEBi7nz6qxsJL+zMHh7ND5O18jq77q6Xkc=;
 b=qr0B4s+yXWwwLN28O4bbHQ8uyD29NGdGOEMtS73abG+IdvOWhqxJunDoaEEygr2PBJ/6r3j6PJv4VVU9X+M+KPKHMGIfcWuveidHqo0+5HSdAAkuvaPiM+I42x67E9eNN24VDh/9lbGLlsZETG+7F80fd77OaTnh88mxKgSwd3Y=
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com (52.134.72.18) by
 DB6PR0401MB2376.eurprd04.prod.outlook.com (10.168.58.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3174.20; Fri, 17 Jul 2020 09:53:09 +0000
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::1dab:b68c:e028:acb3]) by DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::1dab:b68c:e028:acb3%6]) with mapi id 15.20.3174.026; Fri, 17 Jul 2020
 09:53:09 +0000
From:   Anson Huang <anson.huang@nxp.com>
To:     Arnd Bergmann <arnd@arndb.de>
CC:     Daniel Baluta <daniel.baluta@nxp.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "stefan@agner.ch" <stefan@agner.ch>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH 1/2] pinctrl: imx: Support building SCU pinctrl driver as
 module
Thread-Topic: [PATCH 1/2] pinctrl: imx: Support building SCU pinctrl driver as
 module
Thread-Index: AQHWW4NHWrU0ATUAm0ydC8gIz0Rl9akKUIoAgAABVNCAAArtgIAAgWswgACWcoCAAAinQIAACZ8AgAABiOA=
Date:   Fri, 17 Jul 2020 09:53:08 +0000
Message-ID: <DB3PR0402MB391681666012C43C471FA0E2F57C0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <1594912013-20859-1-git-send-email-Anson.Huang@nxp.com>
 <c00f8fe3-d12a-0f91-c301-c028e5aa3f25@nxp.com>
 <DB3PR0402MB3916C9FE00C0F4FC62ACB711F57F0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <5e2af0c3-c832-3978-017e-0b1649aac61c@nxp.com>
 <DB3PR0402MB3916AAEE01257A7F9A25A657F57F0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <c27109aa-280f-db0d-980b-fbd735bab0a6@nxp.com>
 <DB3PR0402MB3916A84BEF5EEC327EE35180F57C0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <CAK8P3a256uR0zZn9ew9UoDqP51MdA4emCfMoZuPW6n9MqD5vPQ@mail.gmail.com>
In-Reply-To: <CAK8P3a256uR0zZn9ew9UoDqP51MdA4emCfMoZuPW6n9MqD5vPQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: arndb.de; dkim=none (message not signed)
 header.d=none;arndb.de; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [183.192.22.28]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 7bb140a2-d96e-4f23-685f-08d82a373602
x-ms-traffictypediagnostic: DB6PR0401MB2376:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB6PR0401MB23765C8E2BA4721B246127A1F57C0@DB6PR0401MB2376.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TFLwY/48bjDCpSS5r78NkdDKMqNJIj7xhPWvEq94NGClaYr19ZnLKNGGvTGQoTCpB82HAuPz5rupq03CC+xRb7FveoNGXPfUtdvH3Ild34ODIgJJNpV10uSsLBbUq1HWQDAGH3OX4xncVcvbm6+F5WupgOdNA90vcMt2bRhKPOv6RbKwxWfE+/SJZJ0dNPhfyDsZ+R5YyifLc0g/HReITaZVzGV0u+mGi4rfh/28eih2VxDLFjSFgIkTlPz3Rs/RjM3NzsJIhBoQVvZ2f7x2tJSxEE8Q5pT6wtMHjvz3K9tsNS5cbuOViQwVGt6soLfNihjcVHpXtLmZyPrNsvqyRQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0402MB3916.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(376002)(346002)(366004)(136003)(396003)(39860400002)(83380400001)(54906003)(186003)(8676002)(33656002)(7696005)(6916009)(478600001)(86362001)(44832011)(7416002)(316002)(4326008)(26005)(8936002)(55016002)(53546011)(6506007)(66476007)(9686003)(52536014)(71200400001)(76116006)(66556008)(5660300002)(2906002)(66946007)(64756008)(66446008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: uFjghHqLufA+xdT+lIvjKOh3rJODtWxypbRQtvMdqcvNiXt1mlciWmM4GAXYck5T+wfuP8VXb6gxauDAsK6UUTOf/n717y3NwUQN0sU4D5mxBRCOHGpqrCS4JnKopmTLDl5tdvuiCgONQKJY7y9V/2JBqif9y+vtKPyX8o0vat6FivJTjQbm34ViduCsNhW0RR1xmNs/arrPuEo8vXi9koMYiM34lUm3pMNqVpUWPPCuPlvpLFlDlpi0l3qtUX5YHoQtafR0HaYjeaNMJvQkx/N2q/y0fFyzxlpRHIE82/dXPzOXCv6gBwF5O/x1zfcHzFfU3h1LWOeYuwkRKduSMguC6xFOeeB8b2/XPfEZ8+GTR2Cu17Tgy2iQqq50Hfmq3YYGg9skWHHf1LNhgsWpBBZKW0wnWjLpuxGYwC5X7D0941367dsQEicKT6k8/K/GChsqzkRfvvFmU7EuPfjf5E0+mh6SKzkyNYgGBC7Qr4w=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0402MB3916.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bb140a2-d96e-4f23-685f-08d82a373602
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2020 09:53:08.9141
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wb8gYTh3YACY0oJ115oT2UsnDjyIwrx2NDJvRkVtXI+caWe3736GoUpzRGDlL+GV/tzboSgzNFiXipYLSeRk7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2376
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGksIEFybmQNCg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDEvMl0gcGluY3RybDogaW14OiBTdXBw
b3J0IGJ1aWxkaW5nIFNDVSBwaW5jdHJsIGRyaXZlciBhcw0KPiBtb2R1bGUNCj4gDQo+IE9uIEZy
aSwgSnVsIDE3LCAyMDIwIGF0IDExOjI0IEFNIEFuc29uIEh1YW5nIDxhbnNvbi5odWFuZ0BueHAu
Y29tPg0KPiB3cm90ZToNCj4gPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMS8yXSBwaW5jdHJsOiBp
bXg6IFN1cHBvcnQgYnVpbGRpbmcgU0NVIHBpbmN0cmwNCj4gPiA+IGRyaXZlciBhcyBtb2R1bGUN
Cj4gPiA+ICtNT0RVTEVfQVVUSE9SKCJEb25nIEFpc2hlbmc8YWlzaGVuZy5kb25nQG54cC5jb20+
Iik7DQo+ID4gPiArTU9EVUxFX0RFU0NSSVBUSU9OKCJOWFAgaS5NWCBTQ1UgY29tbW9uIHBpbmN0
cmwgZHJpdmVyIik7DQo+ID4gPiArTU9EVUxFX0xJQ0VOU0UoIkdQTCB2MiIpOw0KPiA+ID4NCj4g
PiA+DQo+ID4gPiBUaGlzIGNhbiBiZSBpbiBhIHNlcGFyYXRlIHBhdGNoLg0KPiA+DQo+ID4gSSBk
b24ndCB1bmRlcnN0YW5kLCB3aXRob3V0IGFkZGluZyBtb2R1bGUgbGljZW5zZSwgY2hhbmdpbmcg
dGhlIFNDVQ0KPiA+IHBpbmN0cmwgZHJpdmVyIHRvICJ0cmlzdGF0ZSIsIHdoZW4gYnVpbGRpbmcg
d2l0aCA9TSwgdGhlIGJ1aWxkIHdpbGwNCj4gPiBoYXZlIHdhcm5pbmcgYXMgYmVsb3csIHNvIEkg
dGhpbmsgaXQgZG9lcyBOT1QgbWFrZSBzZW5zZSB0byBzcGxpdCBpdCB0byAyDQo+IHBhdGNoZXMu
DQo+ID4NCj4gPiAgIENDIFtNXSAgZHJpdmVycy9waW5jdHJsL2ZyZWVzY2FsZS9waW5jdHJsLXNj
dS5vDQo+ID4gICBNT0RQT1NUIE1vZHVsZS5zeW12ZXJzDQo+ID4gV0FSTklORzogbW9kcG9zdDog
bWlzc2luZyBNT0RVTEVfTElDRU5TRSgpIGluDQo+IGRyaXZlcnMvcGluY3RybC9mcmVlc2NhbGUv
cGluY3RybC1zY3Uubw0KPiA+ICAgTEQgW01dICBkcml2ZXJzL3BpbmN0cmwvZnJlZXNjYWxlL3Bp
bmN0cmwtc2N1LmtvDQo+IA0KPiBJIGFncmVlIGl0IHdvdWxkIGJlIGNsZWFyZXIgdG8gZG8gaXQg
YXMgc2VwYXJhdGUgcGF0Y2hlcywgYnV0IHlvdSB0aGVuIGhhdmUgdG8NCj4gYmUgY2FyZWZ1bCBh
Ym91dCB0aGUgb3JkZXIgdG8gYXZvaWQgdGhlIHByb2JsZW0geW91IG1lbnRpb24uDQo+IA0KPiBB
IGNsZWFyIGluZGljYXRpb24gdGhhdCBpdCBtYXkgYmUgc2Vuc2libGUgdG8gc3BsaXQgdXAgdGhl
IHBhdGNoIGlzIHRoYXQgeW91cg0KPiBjaGFuZ2Vsb2cgaGFzIGEgbGlzdCBvZiBmaXZlIGl0ZW1z
IGluIGl0LCB3aGljaCBhcmUgbW9zdGx5IGRvaW5nIGRpZmZlcmVudCB0aGluZ3MuDQo+IFRoZSBp
ZGVhbCB3YXkgdG8gc3BsaXQgdXAgYSBwYXRjaCBzZXJpZXMgaXMgdG8gaGF2ZSBlYWNoIHBhdGNo
IHdpdGggYSBjaGFuZ2Vsb2cNCj4gdGhhdCBoYXMgdG8gZXhwbGFpbiBleGFjdGx5IG9uZSB0aGlu
ZywgYW5kIG1ha2VzIGl0IG9idmlvdXMgaG93IGVhY2ggY2hhbmdlZA0KPiBsaW5lIGNvcnJlc3Bv
bmRzIHRvIHRoZSBkZXNjcmlwdGlvbiwgYnV0IG5ldmVyIGV4cGxhaW4gdGhlIHNhbWUgdGhpbmcg
aW4gbW9yZQ0KPiB0aGFuIG9uZSBwYXRjaCAoaS5lLiB5b3UgY29tYmluZSBwYXRjaGVzIHRoYXQg
ZG8gdGhlIHNhbWUgdGhpbmcgaW4gbXVsdGlwbGUNCj4gZmlsZXMpLg0KPiANCj4gSW4gdGhpcyBj
YXNlLCBhIGdvb2Qgc3BsaXQgbWF5IGJlOg0KPiANCj4gcGF0Y2ggMToNCj4gICAgLSBVc2UgZnVu
Y3Rpb24gY2FsbGJhY2tzIGZvciBTQ1UgcmVsYXRlZCBmdW5jdGlvbnMgaW4gcGluY3RybC1pbXgu
Yw0KPiAgICAgICBpbiBvcmRlciB0byBzdXBwb3J0IHRoZSBzY2VuYXJpbyBvZiBQSU5DVFJMX0lN
WCBpcyBidWlsdCBpbg0KPiAgICAgICB3aGlsZSBQSU5DVFJMX0lNWF9TQ1UgaXMgYnVpbHQgYXMg
bW9kdWxlOw0KPiAgICAgLSBBbGwgZHJpdmVycyB1c2luZyBTQ1UgcGluY3RybCBkcml2ZXIgbmVl
ZCB0byBpbml0aWFsaXplIHRoZQ0KPiAgICAgICBTQ1UgcmVsYXRlZCBmdW5jdGlvbiBjYWxsYmFj
azsNCj4gDQo+IHBhdGNoIDI6DQo+ICAgICAtIEV4cG9ydCBTQ1UgcmVsYXRlZCBmdW5jdGlvbnMg
YW5kIHVzZSAiSVNfRU5BQkxFRCIgaW5zdGVhZCBvZg0KPiAgICAgICAiaWZkZWYiIHRvIHN1cHBv
cnQgU0NVIHBpbmN0cmwgZHJpdmVyIHVzZXIgYW5kIGl0c2VsZiB0byBiZQ0KPiAgICAgICBidWls
dCBhcyBtb2R1bGU7DQo+ICAgICAtIENoYW5nZSBQSU5DVFJfSU1YX1NDVSB0byB0cmlzdGF0ZTsN
Cj4gICAgIC0gQWRkIG1vZHVsZSBhdXRob3IsIGRlc2NyaXB0aW9uIGFuZCBsaWNlbnNlLg0KPiAN
Cj4gYW5kIHRoZW4gcmV3cml0ZSB0aGUgZGVzY3JpcHRpb24gdG8gbm90IGhhdmUgYSBidWxsZXRl
ZCBsaXN0Lg0KPiANCj4gVGhhdCBzYWlkLCBJIGRvbid0IHRoaW5rIGl0IGlzIGNyaXRpY2FsIGhl
cmUsIGFuZCBJIHdvdWxkIG5vdCBoYXZlIGNvbXBsYWluZWQNCj4gYWJvdXQgdGhlIHZlcnNpb24g
eW91IHNlbnQuDQo+IA0KPiBJZiB5b3UgZW5kIHVwIGNoYW5naW5nIHRoZSBwYXRjaCwgSSB0aGlu
ayB5b3UgY2FuIGFjdHVhbGx5IGRyb3AgdGhlICIjaWYNCj4gSVNfRU5BQkxFRCgpIiBjaGVjayBl
bnRpcmVseSwgYXMgdGhlIGZ1bmN0aW9ucyBhcmUgbm93IGFsd2F5cyBhc3N1bWVkIHRvIGJlDQo+
IGF2YWlsYWJsZSwgYW5kIHdlIGRvbid0ICNpZmRlZiBkZWNsYXJhdGlvbnMgd2hlbiB0aGVyZSBp
cyBubyAjZWxzZSBwYXRoDQo+IG90aGVyd2lzZS4NCj4gDQoNClRoYW5rcyBmb3IgdGhlIGdvb2Qg
c3VnZ2VzdGlvbiwgaWYgdGhlcmUgaXMgb3RoZXIgY29tbWVudCBuZWVkIGEgVjIsIG9yIG1haW50
YWluZXINCnRoaW5rcyBpdCBpcyBiZXR0ZXIgdG8gc3BsaXQgaXQgZm9sbG93aW5nIHlvdXIgZ3Vp
ZGUsIEkgd2lsbCBzZW5kIFYyIGZvbGxvd2luZyB5b3VyIGd1aWRlLg0KDQpUaGFua3MsDQpBbnNv
bg0K
