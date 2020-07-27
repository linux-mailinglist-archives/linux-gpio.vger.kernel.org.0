Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 963F422EBFD
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Jul 2020 14:23:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728256AbgG0MXV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 Jul 2020 08:23:21 -0400
Received: from mail-eopbgr150080.outbound.protection.outlook.com ([40.107.15.80]:31054
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728039AbgG0MXT (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 27 Jul 2020 08:23:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jb6u2BElQX9QWc1hzIaHZtl5it7j0RVcdW7rMrDnLvqr6Vw6DqFCeXaRGwZioB0VRNMh7uAq3qVHZ3Sqsb7tbQtHzgMh2mXbcZiFgN+jek5o2mo8MddvJz753+6dul4Pj3sj38CsVvAnn3PVBRG5KoWRQQBZfhDkP27cn9PSItzid0xXRJB/dinGvJ50NUzMhsLCjGRbZReKilbsah9UY8tX3JoP9PkpY0GzjpJ0cP/S2b/s9alL1Po/LXsjMml1pwLNUu+R/7AcvHd5rSD+DabAZCDpziwMwNRpw/2bxY6uqrvUlgaBmdOIjqjX9XNywTgZLsxC4ZkVGnmh5B0suQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DmvLN5hTAQd5HpLAZtY3yQe18gYNIFEeM482L5y5c4I=;
 b=mAO/fPYQ4xZYdw9UUoGLB3nZVBeoWQ1ORjTh570lPcneIzWuw/1vNe8p6Lm147dO/VillqZWYTMsXi1ytjKM8lBiBlpHtwoQwChFF2P1563mSuxpKfZVP7StJlS2he57PnOFTN+fQv+7t4W+bA9BJ4Knt53ym1OKp4gEXhuF9TveUa30Ee5neYTNIkkEFaCh4/jfYKkAvWcJPQKRdn4T4AHfz6qypGazq5XuK0I3jgMhubKZ/ibi6CuoFitTe7YEXRcKpjHVP0EKR4LobxrvnP47SixCQABDWVYhvH08zV/BYnBfaQ3DlZa9HMFUS6aoUfPeDad6PaMd6NnS3q41wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DmvLN5hTAQd5HpLAZtY3yQe18gYNIFEeM482L5y5c4I=;
 b=Z9qojxvrSBaL+FCyyXsO0IDT05usXfeEP9WMkevW9paWve1W3G0XosxpegmsdOxCWR8qUhc8UhKK2sFzviPGLelWrQz9VFZ4PIsJvMcedP88D4k8/xyZVXdgTWkwcy/wfO4rOhuasoOdmQ5LJOqezRUOoWRU+Tdwrcr0APSBfDk=
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com (2603:10a6:8:10::18)
 by DB8PR04MB7050.eurprd04.prod.outlook.com (2603:10a6:10:129::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.26; Mon, 27 Jul
 2020 12:23:10 +0000
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::49f8:20ce:cf20:80b3]) by DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::49f8:20ce:cf20:80b3%6]) with mapi id 15.20.3216.033; Mon, 27 Jul 2020
 12:23:10 +0000
From:   Anson Huang <anson.huang@nxp.com>
To:     Arnd Bergmann <arnd@arndb.de>
CC:     Russell King - ARM Linux <linux@armlinux.org.uk>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Sascha Hauer <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Peter Chen <peter.chen@nxp.com>,
        "oleksandr.suvorov@toradex.com" <oleksandr.suvorov@toradex.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        Peng Fan <peng.fan@nxp.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Olof Johansson <olof@lixom.net>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Patrice Chotard <patrice.chotard@st.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Joel Stanley <joel@jms.id.au>, Lubomir Rintel <lkundrak@v3.sk>,
        Christian Gmeiner <christian.gmeiner@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Leo Li <leoyang.li@nxp.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "michael@walle.cc" <michael@walle.cc>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH V2 1/4] gpio: mxc: Support module build
Thread-Topic: [PATCH V2 1/4] gpio: mxc: Support module build
Thread-Index: AQHWX8pucFw5LDc3OEu6t4xCVjI40KkTQNIAgAfaWJCAACrxgIAACAjggAAMTQCAAATTIA==
Date:   Mon, 27 Jul 2020 12:23:10 +0000
Message-ID: <DB3PR0402MB3916634EA84687D6C7535BC1F5720@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <1595382353-17486-1-git-send-email-Anson.Huang@nxp.com>
 <CAK8P3a13gcF_+dkfxZW0u_YuJ92hY1JukWfzM+e30iM=YUhraQ@mail.gmail.com>
 <DB3PR0402MB3916F080E4912B27B18BEADEF5720@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <CAK8P3a2CBYV2xEkedQYmzL4XgHPeu02=vmLffq+RWwvEvuUGKQ@mail.gmail.com>
 <DB3PR0402MB391674F67A1B9F2732883C0BF5720@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <CAK8P3a0XpKnbz79dH4i7HofGgpAodtmgdBmVBVQOKfCiJMkpPw@mail.gmail.com>
In-Reply-To: <CAK8P3a0XpKnbz79dH4i7HofGgpAodtmgdBmVBVQOKfCiJMkpPw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: arndb.de; dkim=none (message not signed)
 header.d=none;arndb.de; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [183.192.23.221]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 8cd36dd8-189b-489f-3f5a-08d83227d339
x-ms-traffictypediagnostic: DB8PR04MB7050:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB8PR04MB705081E2EB4AFDA22EB4DF1CF5720@DB8PR04MB7050.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: u+Y9jnS2Sk4FWjDZeD1/waRSP85FDHoGVbrfpW9JibDOwaX+6OIkaZV9iBEjRoVOIwcZJAUewe3qRmUofRPSDixkKomg1fuFYVo0rdRHnM4lO0rdokMgFhd9L7dDRWAfcjfSl242861nr1YjMRqi1gFqcdDx/K3i1g7+wzMMMI5hquZ/0aNWYCyjpOa6JywbbnuTTTNpGa5cZBXNBrTSncryrKuvJTI8e8mn4wKVNFOrL3/WMk01YhBxYO9opWotOVU0BmHJnhx5y/Xzwi1KARPEh4n64/Sj5Cav1gqAeC36zBWYMlU5tGQzduhVFucJlxt02arNKt9l3N5QaIHEMQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0402MB3916.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(39860400002)(376002)(346002)(136003)(396003)(53546011)(52536014)(6506007)(33656002)(7696005)(54906003)(86362001)(316002)(186003)(26005)(6916009)(5660300002)(478600001)(71200400001)(2906002)(76116006)(66556008)(66476007)(8936002)(64756008)(66446008)(66946007)(9686003)(44832011)(4326008)(8676002)(83380400001)(7416002)(55016002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: fF5+Mv97OJLhcjZTEvfRQYwcUYg2PThzMNtxxTVYq0bNAT1HDd2kkQY5El8kLcWKeTFeVTFoWFS6ssZcAn5prSBtl91N4UuO7adhk+gC9xD27fMGom/1O/VfRQuLkAXsQLBSSq5MADZs8o9ryqPYdt0CuqBg1CvwIp2Srie5VXHcVzoNgkyTwOlnFiFNp1mzMhinQZyMWF8+zfuQMezNxQNzTt3O8X35HfqXdmWaznXZIpfzdmr/giKxb60Q6ivlyD7N5LPNxOiMObcEYdWCcKWowMZGnKywvY4l8m5Nh24HC7EvrM85jNGZ1grRdmYL1liqunpUKAir4yjXv4JX7uXeNaTHOWoZVfuxdOOVyLGgXY+1Vfyk1BbmRsyubgwnsg/Yn78nR82nq7Wps9bevSchlllRS7l7ed2Msp/VbzUL0Y3nh9wVEu9uyczgNJiqhGheN8lK+s0bP6/qWtUNHDYjY3azYkpBDMsK/gTvgPXmwJMFnViOK0vaiWJN7qU0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0402MB3916.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cd36dd8-189b-489f-3f5a-08d83227d339
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2020 12:23:10.0353
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bWct++oTlghn3t+bUIK+1ciQ4YdgN2YVrfevGRuFRk1O4CV4VeyPjVQmqhShTj5gVLJQ/ZfVgmImhrv0n3RVtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7050
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGksIEFybmQNCg0KDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggVjIgMS80XSBncGlvOiBteGM6IFN1
cHBvcnQgbW9kdWxlIGJ1aWxkDQo+IA0KPiBPbiBNb24sIEp1bCAyNywgMjAyMCBhdCAxOjIxIFBN
IEFuc29uIEh1YW5nIDxhbnNvbi5odWFuZ0BueHAuY29tPg0KPiB3cm90ZToNCj4gPiA+IFN1Ympl
Y3Q6IFJlOiBbUEFUQ0ggVjIgMS80XSBncGlvOiBteGM6IFN1cHBvcnQgbW9kdWxlIGJ1aWxkIE9u
IE1vbiwNCj4gPiA+IEp1bCAyNywgMjAyMCBhdCAxMDoxOCBBTSBBbnNvbiBIdWFuZyA8YW5zb24u
aHVhbmdAbnhwLmNvbT4gd3JvdGU6DQo+ID4gPiA+ID4gU3ViamVjdDogUmU6IFtQQVRDSCBWMiAx
LzRdIGdwaW86IG14YzogU3VwcG9ydCBtb2R1bGUgYnVpbGQNCj4gPiA+ID4NCj4gPiA+ID4gY29t
bWl0IGUxODhjYmY3NTY0ZmJhODBlODMzOWI5NDA2ZTg3NDBmM2U0OTVjNjMNCj4gPiA+ID4gQXV0
aG9yOiBWbGFkaW1pciBaYXBvbHNraXkgPHZsYWRpbWlyX3phcG9sc2tpeUBtZW50b3IuY29tPg0K
PiA+ID4gPiBEYXRlOiAgIFRodSBTZXAgOCAwNDo0ODoxNSAyMDE2ICswMzAwDQo+ID4gPiA+DQo+
ID4gPiA+ICAgICBncGlvOiBteGM6IHNoaWZ0IGdwaW9fbXhjX2luaXQoKSB0byBzdWJzeXNfaW5p
dGNhbGwgbGV2ZWwNCj4gPiA+DQo+ID4gPiBUaGF0IGNvbW1pdCBtYWRlIHRoZSBpbml0aWFsaXph
dGlvbiBsYXRlciBub3QgZWFybGllciwgYXMgaXQNCj4gPiA+IG9yaWdpbmFsbHkgd2FzIGEgcG9z
dGNvcmVfaW5pdGNhbGwoKS4gSW4gdGhlIGxvYWRhYmxlIG1vZHVsZSBjYXNlLA0KPiA+ID4geW91
IG1ha2UgaXQgZXZlbiBsYXRlciB0aGFuIHRoYXQsIHBvc3NpYmx5IGFzIHRoZSBsYXN0IG1vZHVs
ZSBsb2FkZWQNCj4gPiA+IHdoZW4gYm9vdGluZyB1cCB0aGUgc3lzdGVtIChmb2xsb3dlZCBieSBh
IHN0b3JtIG9mIGRlZmVycmVkIHByb2JlcykuDQo+ID4gPg0KPiA+DQo+ID4gWWVzLCBsb2FkYWJs
ZSBtb2R1bGUgd2lsbCBtYWtlIGl0IGV2ZW4gbGF0ZXIsIHRoZSBhc3N1bXB0aW9uIGlzDQo+ID4g
dXNlcnNwYWNlIGNhbiBsb2FkIGl0IGJlZm9yZSBhbnkgdXNlcnMgZGVwZW5kIG9uIEdQSU8gZHJp
dmVyLiBHaXZlbg0KPiA+IHRoYXQgd2UgaGF2ZSB0byBzdXBwb3J0IGxvYWRhYmxlIG1vZHVsZSBm
b3IgYWxsIFNvQyBzcGVjaWZpYyBtb2R1bGUsDQo+ID4gZG8geW91IGhhdmUgYW55IG90aGVyIHN1
Z2dlc3Rpb24gb2YgaG93IHRvIHByb2NlZWQgdGhpcyByZXF1aXJlbWVudCBmb3INCj4gU29DIEdQ
SU8gZHJpdmVyPw0KPiANCj4gSSB0aGluayBpbiBnZW5lcmFsLCBkcml2ZXJzIHNob3VsZCBiZSBw
cmVwYXJlZCBmb3IgLUVQUk9CRV9ERUZFUiBlcnJvciBjb2Rlcw0KPiByZXR1cm5lZCBmcm9tIGlu
dGVyZmFjZXMgc3VjaCBhcyBkZXZtX2dwaW9kX2dldCgpLg0KPiANCj4gPiA+IEkgZG9uJ3QgdGhp
bmsgd2UgY2FuIHJlbHkgb24gdXNlciBzcGFjZSB0byBjb29yZGluYXRlIG1vZHVsZSBsb2FkIG9y
ZGVyLg0KPiA+ID4gVGhlIG1vZHVsZXMgYXJlIGdlbmVyYWxseSBsb2FkZWQgaW4gYW4gYXJiaXRy
YXJ5IG9yZGVyIGR1cmluZyB0aGUNCj4gPiA+IGNvbGRwbHVnIHBoYXNlIG9mIHRoZSBib290IHdo
ZW4gdXNlciBzcGFjZSBsb29rcyBhdCB0aGUgYXZhaWxhYmxlDQo+ID4gPiBkZXZpY2VzIGFuZCBs
b2FkcyBhIG1vZHVsZSBmb3IgZWFjaCBvbmUgb2YgdGhlbSBpbiB0aGUgb3JkZXIgaXQgZmluZHMg
dGhlbQ0KPiBpbiBzeXNmcy4NCj4gPiA+DQo+ID4gPiBUaGlzIG1lYW5zIGFsbCBkcml2ZXJzIHRo
YXQgcmVseSBvbiBncGlvLCBwaW5jdHJsIG9yIGlycWNoaXANCj4gPiA+IGludGVyZmFjZXMgZXhw
b3J0ZWQgZnJvbSB0aGlzIGRyaXZlciBoYXZlIHRvIGJlIGFibGUgdG8gZGVhbCB3aXRoDQo+ID4g
PiB0aGVtIG5vdCBiZWluZyB0aGVyZS4gVGhpcyBjYW4gYWxzbyBoYXBwZW4gd2hlbiB0aGUgcGlu
Y3RybCBkcml2ZXINCj4gPiA+IGlzIHRoZSBvbmx5IG9uZSB0aGF0IGlzIGEgbG9hZGFibGUgbW9k
dWxlLCB3aGlsZSBldmVyeXRoaW5nIGVsc2UgaXMNCj4gPiA+IGJ1aWx0LWluLiBXaGlsZSB0aGF0
IGlzIG5vdCBhIGNvbmZpZ3VyYXRpb24gdGhhdCB1c2VycyB3b3VsZCBsaWtlbHkgY2hvb3NlDQo+
IGludGVudGlvbmFsbHksIEkgZG9uJ3Qgc2VlIGEgcmVhc29uIHdoeSBpdCBzaG91bGRuJ3Qgd29y
ay4NCj4gPiA+DQo+ID4gPiBVc2luZyBtb2R1bGVfaW5pdCgpIG9yIGJ1aWx0aW5fcGxhdGZvcm1f
ZHJpdmVyKCkgaGVyZSB3b3VsZCBtYWtlDQo+ID4gPiBnaXZlIHNpbWlsYXIgYmVoYXZpb3IgZm9y
IHRoZSBidWlsdC1pbiBhbmQgbW9kdWxhciBjYXNlcyBhbmQgYmUNCj4gPiA+IHNvbWV3aGF0IG1v
cmUgY29uc2lzdGVudCwgc28geW91IGRvbid0IHJ1biBpbnRvIGJ1Z3Mgb25seSB3aGVuIHRoZQ0K
PiA+ID4gZHJpdmVyIGlzIGEgbG9hZGFibGUgbW9kdWxlIGJ1dCBtYWtlIHRoZW0gb2J2aW91cyBl
dmVuIHRvIGV4aXN0aW5nIHVzZXJzDQo+IHdpdGggYSBidWlsdGluIGRyaXZlci4NCj4gPiA+DQo+
ID4NCj4gPiBNeSBvcmlnaW5hbCBpZGVhIG9mIGFkZGluZyBsb2FkYWJsZSBtb2R1bGUgc3VwcG9y
dCBmb3IgU29DIHNwZWNpZmljDQo+ID4gbW9kdWxlIGlzLCB0cnkgdG8ga2VlcCBpdCBleGFjdGx5
IHNhbWUgd2hlbiB0aGUgZHJpdmVyIGlzIGJ1aWx0LWluLA0KPiA+IGJ1dCBmb3IgR0tJIHN1cHBv
cnQsIGZpcnN0LCB3ZSBuZWVkIHRvIHN1cHBvcnQgR1BJTyBkcml2ZXIgYnVpbHQgYXMNCj4gPiBt
b2R1bGUsIGFuZCB3ZSBkZWZpbml0ZWx5IG5lZWQgdG8gdGhpbmsgYWJvdXQgdGhlIG1vZHVsZSBs
b2FkIHNlcXVlbmNlDQo+ID4gdG8gaGFuZGxlIHRoZXNlIGRlcGVuZGVuY3ksIGJ1dCB0aGlua2lu
ZyBhYm91dCB0aGUgY29tbW9uIG1vZHVsZQ0KPiA+IHdpZGVseSB1c2VkIGJ5IGRldmljZXMsIHN1
Y2ggYXMgcGluY3RybCwgY2xvY2sgYW5kIEdQSU8sIG1heWJlIG90aGVyDQo+IG1vZHVsZXMgbmVl
ZCBzb21lIHBhdGNoZXMgdG8gaGFuZGxlIHRoZSBkZXBlbmRlbmN5LCBidXQgdGhhdCB3aWxsIGJl
IGRvbmUNCj4gbGF0ZXIgd2hlbiB3ZSBhcmUgd29ya2luZyBmb3IgdGhvc2UgbW9kdWxlcy4NCj4g
DQo+IE92ZXJhbGwsIG15IGZlZWxpbmcgaXMgdGhhdCBtYWtpbmcgc3VyZSBhbGwgZHJpdmVycyB0
aGF0IGRlcGVuZCBvbiB0aGUgcGluY3RybA0KPiBkcml2ZXIgY2FuIGRlYWwgd2l0aCBkZWZlcnJl
ZCBwcm9iaW5nIGlzIGEgcHJlcmVxdWlzaXRlIGJlZm9yZSB0aGlzIGNhbiBiZSBtYWRlDQo+IGEg
bG9hZGFibGUgbW9kdWxlIGl0c2VsZiAoc2FtZSBmb3IgY2xrLCBpcnFjaGlwLCBldGMgZHJpdmVy
cyB0aGF0IG90aGVycyBtYXkgcmVseQ0KPiBvbikuDQo+IA0KPiBJIHVuZGVyc3RhbmQgdGhhdCB5
b3VyIHByaW1hcnkgbW90aXZhdGlvbiBpcyB0byBmaXQgaW50byBHb29nbGUncyBHS0kNCj4gZnJh
bWV3b3JrLCBidXQgSSB0aGluayB0aGF0IGRvaW5nIHRoZSBjb252ZXJzaW9uIG9ubHkgcGFydGlh
bGx5IHdvdWxkIG5laXRoZXINCj4gc2VydmUgdG8gaW1wcm92ZSB0aGUga2VybmVsIG5vciBhY3R1
YWxseSBtZWV0IHRoZSBHS0kgcmVxdWlyZW1lbnRzLg0KPiANCj4gTW9zdCBwaW5jdHJsIGRyaXZl
cnMgYXJlIGN1cnJlbnRseSBhbHdheXMgYnVpbHQtaW4gdG8gd29yayBhcm91bmQgdGhlIGxvYWQg
b3JkZXINCj4gZGVwZW5kZW5jaWVzLiBUaGlzIG9mIGNvdXJzZSBpcyBhIGJpdCBvZiBhIGhhY2sg
YW5kIHdlJ2QgYmUgYmV0dGVyIG9mZiBpZiBhbGwNCj4gZHJpdmVycyBtYW5hZ2VkIHRvIGF2b2lk
IHRoZSBkZXBlbmRlbmNpZXMsIGJ1dCB0aGlzIGNhbiBhbHNvIHJlcXVpcmUgYSBsb3Qgb2YNCj4g
d29yay4NCj4gDQo+ID4gU28sIGNvdWxkIHlvdSBwbGVhc2UgaGVscCBhZHZpc2UgaG93IHRvIHBy
b2NlZWQgaXQgZm9yIHRoaXMgR1BJTw0KPiA+IGRyaXZlciB0byAgc3VwcG9ydCBsb2FkYWJsZSBt
b2R1bGU/DQo+IA0KPiBJIHdvdWxkIHN0YXJ0IGJ5IGdldHRpbmcgYSByZWZlcmVuY2UgYm9hcmQg
dG8gd29yayB3aXRoIGEga2VybmVsIGluIHdoaWNoIGFsbA0KPiBkcml2ZXJzIGFyZSBidWlsdC1p
biBleGNlcHQgZm9yIHRoZSBwaW5jdHJsIGRyaXZlciwgdG8gc2VlIHdoYXQgZXhhY3RseSBicmVh
a3MNCj4gd2hlbiB5b3UgZG8gdGhhdCwgYW5kIHdoYXQgb3RoZXIgZHJpdmVycyBtYXkgaGF2ZSB0
aGUgc2FtZSBwcm9ibGVtcy4NCj4gTWF5YmUgaXQncyBub3QgdGhhdCBiYWQgYWZ0ZXIgYWxsIGFu
ZCB5b3Ugb25seSBuZWVkIGEgZmV3IG1vZGlmaWNhdGlvbnMuDQo+IA0KDQpJIGFncmVlZCwgYnV0
IHRoZSBzaXR1YXRpb24gaXMgaS5NWCBTb0MgY29udGFpbnMgbW9yZSB0aGFuIDIwIG1vZHVsZXMs
IGFuZCBtb3N0IG9mDQp0aGVtIGFyZSBOT1Qgb3duZWQgYnkgbWUsIHNvIEkgYW0gTk9UIHN1cmUg
d2hlbiB0aGUgbW9kdWxlIG93bmVyIHdpbGwgc3RhcnQNCndvcmtpbmcgb24gdGhlIHN1cHBvcnQu
IEFuZCBpZiB3aXRoIG1pbmltdW0gZGV2aWNlcyBlbmFibGVkLCBzdWNoIGFzIHRpbnkga2VybmVs
DQp3aXRoIHJhbWZzLCBpdCBpcyB3b3JraW5nIGV2ZW4gd2l0aCBwaW5jdHJsL2Nsb2NrIGV0Yy4g
YnVpbHQgYXMgbG9hZGFibGUgbW9kdWxlLg0KDQpNZWFud2hpbGUsIGFzIHlvdSBzYWlkLCBtb3N0
IG9mIHRoZSB1c2VycyBhcmUgc3RpbGwgdXNpbmcgYnVpbHQtaW4gbW9kZWwsIHNvIGFkZGluZyB0
aGUNCnN1cHBvcnQgZm9yIEdQSU8gY2FuIGJlIGluIHBhcmFsbGVsIHdpdGggb3RoZXIgbW9kdWxl
cycgd29yaywgaW4gb3RoZXIgd29yZHMsIHdpdGggdGhpcw0KR1BJTyBsb2FkYWJsZSBtb2R1bGUg
c3VwcG9ydCBwYXRjaCwgaWYgb3RoZXIgbW9kdWxlcyBjYW4gTk9UIHdvcmsgZHVlIHRvIGxhY2sg
b2YNCmRlZmVyIHByb2JlIGltcGxlbWVudGF0aW9uLCB0aGVuIHRoZSBwYXRjaCBzaG91bGQgYmUg
ZG9uZSBpbiBvdGhlciBtb2R1bGUsIGFkZGluZw0KdGhhdCB0aGUgZGVmYXVsdCBjb25maWd1cmF0
aW9uIG9mIEdQSU8gaXMgc3RpbGwgYnVpbHQtaW4sIGRvIHlvdSB0aGluayBpdCBjYW4gYmUgYW4g
aW5kZXBlbmRlbnQNCnBhdGNoIGFuZCBnZXQgaW50byBsaW51eC1uZXh0IGZpcnN0Pw0KDQpUaGFu
a3MsDQpBbnNvbg0KDQo=
