Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E378125B850
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Sep 2020 03:32:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726942AbgICBb5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Sep 2020 21:31:57 -0400
Received: from mail-vi1eur05on2055.outbound.protection.outlook.com ([40.107.21.55]:33377
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726526AbgICBby (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 2 Sep 2020 21:31:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L7duj63JcUbhp+/Ou7PPKywniE+/+kIJXFWkZA4qclMDswbEcWKXx+N7AjHyP8CT9OEV6cQiV3xkUvFLu1jrdLaHAaxShVUnD/l48BMdnG0E/eWYKBRHk97UqI4thHZuAn35jmDcJyKwIjGZpqCWHGFpLf+RAtD7lDjH9gpmXzx1X3ICNbk6UsQt+AC6mVOLuRBPYqqH6xT0Ut5KZUDEVHnnznPllZ2s0Ozs9qU+EHyZs5cQJmiY9+GiWvUypRW7FFUzX6NX0XD1ILGa6APP/Ol+qfLDh+5JfX8izWpi7Bt++uEj+R0qToSEKkkU4Ekcl3Wdq6ouDnWPiwC+Vd6VKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bqWLS3e28OK57n3KwXiZzDPbmklQes2y5MADx05X3pE=;
 b=BUZr3Jgn6QE+wCx1pMuZoH58EAGvdAN3au3bQu0wZQFxLNWgj3RGNMIJvcg0AZvInyOYIVbUAUYV859yyXzIk9acI4EUMcDCvW9IdJfA0EXy5uvqHQ/ZCsOFXq1BLdShCDRhISzpU5W2hWhO79Fpx7/w9mg1O3YyBn2Rj+MXegvyta+GwbiJQ50wGRD6Qt8QaNTtNnoA4KTfRa+XlmUMu9GGNHzHOgPPKIKwThs0ZkOOdhScun4q6O/qKLYqOJzmRdZ4Q8HpeIiEuJsghwUTJcoBU71O9V5PgoQ1lFi6rvE+6kZ1I9WWZGvt2DsfbK4fSkDAZSN6OMiZWtdlDIZLEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bqWLS3e28OK57n3KwXiZzDPbmklQes2y5MADx05X3pE=;
 b=qn9aLWitQ4Qo7wtyAM1sdpJvZiaBL4kfKdjVZQnymw7a4bjeA7YVI3G17Ygwxlt0fQQzYBntxqbM8dlJfFW+3W1HqlY4wSD+NZV4+f70dyHO1r3yRFJZ2TzuTsp4YNHqfAk3OYYbZosNwYFOCx1iHW1wUxkomj9+ADPxlXNZ2bY=
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com (2603:10a6:8:10::18)
 by DB3PR0402MB3915.eurprd04.prod.outlook.com (2603:10a6:8:e::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.16; Thu, 3 Sep
 2020 01:31:48 +0000
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::9c75:8bb2:aff6:450d]) by DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::9c75:8bb2:aff6:450d%3]) with mapi id 15.20.3326.025; Thu, 3 Sep 2020
 01:31:48 +0000
From:   Anson Huang <anson.huang@nxp.com>
To:     Arnd Bergmann <arnd@arndb.de>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>
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
Thread-Index: AQHWX8pucFw5LDc3OEu6t4xCVjI40KkTQNIAgAfaWJCAACrxgIAACAjggAAMTQCAAATTIIAAGHmAgDrsWRA=
Date:   Thu, 3 Sep 2020 01:31:47 +0000
Message-ID: <DB3PR0402MB391685755C70D85A1E797C0BF52C0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <1595382353-17486-1-git-send-email-Anson.Huang@nxp.com>
 <CAK8P3a13gcF_+dkfxZW0u_YuJ92hY1JukWfzM+e30iM=YUhraQ@mail.gmail.com>
 <DB3PR0402MB3916F080E4912B27B18BEADEF5720@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <CAK8P3a2CBYV2xEkedQYmzL4XgHPeu02=vmLffq+RWwvEvuUGKQ@mail.gmail.com>
 <DB3PR0402MB391674F67A1B9F2732883C0BF5720@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <CAK8P3a0XpKnbz79dH4i7HofGgpAodtmgdBmVBVQOKfCiJMkpPw@mail.gmail.com>
 <DB3PR0402MB3916634EA84687D6C7535BC1F5720@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <CAK8P3a06tu4UgTxT4q9eS4=z5AHiEWQMhk5PfZEz=4t+f26s5Q@mail.gmail.com>
In-Reply-To: <CAK8P3a06tu4UgTxT4q9eS4=z5AHiEWQMhk5PfZEz=4t+f26s5Q@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: arndb.de; dkim=none (message not signed)
 header.d=none;arndb.de; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: ff4fa16b-3c56-496a-561d-08d84fa92026
x-ms-traffictypediagnostic: DB3PR0402MB3915:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB3PR0402MB391572F2F79392BC11197AEEF52C0@DB3PR0402MB3915.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VWkn50P+Vo53vY7CtLVndw4+KN5uzj+/mVKLRxKhjzBe0Fz2pB17tu667aPkkYk/y/Df9Mu3JjKEPkgqIeVWcg5LMWFsZlV1IGJSOyPKS0k4zPsmRY+LmLVJBNosJXhvxlEcNEEMdw3dduGR3SNqCVsLCiUZTUznvyXaIc2yCPZ7V4EtTUbaggILz3AY8tASQwX0vnIi/TJivkcByya0l0lQoV7pEfYR99f/5c/xies8G0PvTWSpUeHf+SpUa1Dn8AbvzExy3pOLyUsJS5EWJ/xLpyjMUiIcYI1kJDgIhETgznkEgcMI6/HOJw8rV+2Jo7ZAvC6vZf710Agy5r54dQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0402MB3916.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(346002)(136003)(39860400002)(396003)(66476007)(66556008)(76116006)(66446008)(66946007)(5660300002)(7696005)(54906003)(26005)(4326008)(186003)(110136005)(53546011)(6506007)(2906002)(8676002)(8936002)(478600001)(64756008)(71200400001)(33656002)(7416002)(52536014)(9686003)(86362001)(55016002)(316002)(83380400001)(44832011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 3Recy/H9tLuyPZwBjddAqw8Q8xczfnKkSi6lBJUBe2SLaL7/31mOQYvkkukdViUfd3LBfQc4Vn/hwxZ0usrAFR6Ck11twFzixi+8ocm06lb/hhaL9VF0D6rrLJ8fbckUlFKSyG6A+/5Zu52dXnm262zKpfZ1sNKfG4bgDGbSkbelrgI9PVD/TuaUj80Rv+s18ZOA8K5gOpdhsKpTlyofQfl0+M6Jc64jRDswCCmPkcpOdb4RAQjyb9mhOgyfT1r+EPAZEDcxV0lGz/aLm06eJgMGWQHjtgEo0GWA8MtEGQexHvLM3HJkIKrMAkaBHhk+8DO+45aEieORH99Ud/w21Ug/bo0Pzm34rR7tfJASZHBiuSOEd3WtYG7AO/zAfC0zSI4A42ytS0J17GC64YADyYO0SptjJNERprkwG0N6fhKGBRFr3AcSVk66KvXBEIbp1ewcL74oMsE1BC/4fF5p/wgODCKJ4366+L7azLLb+U1xMVNnDpJQKeOOFxmx3sbVeTvXutOTc/SWdE3gQHw51HaEoDUE9U2hJ/ujw6RClJZILZGxOlXpKlxRX/m4s4U3EaEZriX42vl3xqnGQDA3xUlIhSX+/n56C5Ln04kCKjQ6vjLyBfmrvUSRNxEcWSxnHxcJrIfmk7CKOCX3WKMTMQ==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0402MB3916.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff4fa16b-3c56-496a-561d-08d84fa92026
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2020 01:31:47.7707
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CeeZjNWuHYYYtaclfLJcxZYeuug+gs4vE7+CdjbzKYuAO92y82WdEs2Mqxtc5HjtadOdEIvTZYqe+uVDL+nWuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3915
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGksIExpbnVzDQoJRG8geW91IGhhdmUgY2hhbmNlIHRvIHRha2UgYSBsb29rIGF0IHRoaXMgcGF0
Y2ggc2VyaWVzPw0KDQpUaGFua3MsDQpBbnNvbg0KDQoNCj4gU3ViamVjdDogUmU6IFtQQVRDSCBW
MiAxLzRdIGdwaW86IG14YzogU3VwcG9ydCBtb2R1bGUgYnVpbGQNCj4gDQo+IE9uIE1vbiwgSnVs
IDI3LCAyMDIwIGF0IDI6MjMgUE0gQW5zb24gSHVhbmcgPGFuc29uLmh1YW5nQG54cC5jb20+DQo+
IHdyb3RlOg0KPiA+ID4gU3ViamVjdDogUmU6IFtQQVRDSCBWMiAxLzRdIGdwaW86IG14YzogU3Vw
cG9ydCBtb2R1bGUgYnVpbGQNCj4gPiA+DQo+ID4gPiA+IFNvLCBjb3VsZCB5b3UgcGxlYXNlIGhl
bHAgYWR2aXNlIGhvdyB0byBwcm9jZWVkIGl0IGZvciB0aGlzIEdQSU8NCj4gPiA+ID4gZHJpdmVy
IHRvICBzdXBwb3J0IGxvYWRhYmxlIG1vZHVsZT8NCj4gPiA+DQo+ID4gPiBJIHdvdWxkIHN0YXJ0
IGJ5IGdldHRpbmcgYSByZWZlcmVuY2UgYm9hcmQgdG8gd29yayB3aXRoIGEga2VybmVsIGluDQo+
ID4gPiB3aGljaCBhbGwgZHJpdmVycyBhcmUgYnVpbHQtaW4gZXhjZXB0IGZvciB0aGUgcGluY3Ry
bCBkcml2ZXIsIHRvIHNlZQ0KPiA+ID4gd2hhdCBleGFjdGx5IGJyZWFrcyB3aGVuIHlvdSBkbyB0
aGF0LCBhbmQgd2hhdCBvdGhlciBkcml2ZXJzIG1heSBoYXZlDQo+IHRoZSBzYW1lIHByb2JsZW1z
Lg0KPiA+ID4gTWF5YmUgaXQncyBub3QgdGhhdCBiYWQgYWZ0ZXIgYWxsIGFuZCB5b3Ugb25seSBu
ZWVkIGEgZmV3IG1vZGlmaWNhdGlvbnMuDQo+ID4gPg0KPiA+DQo+ID4gSSBhZ3JlZWQsIGJ1dCB0
aGUgc2l0dWF0aW9uIGlzIGkuTVggU29DIGNvbnRhaW5zIG1vcmUgdGhhbiAyMCBtb2R1bGVzLA0K
PiA+IGFuZCBtb3N0IG9mIHRoZW0gYXJlIE5PVCBvd25lZCBieSBtZSwgc28gSSBhbSBOT1Qgc3Vy
ZSB3aGVuIHRoZSBtb2R1bGUNCj4gPiBvd25lciB3aWxsIHN0YXJ0IHdvcmtpbmcgb24gdGhlIHN1
cHBvcnQuIEFuZCBpZiB3aXRoIG1pbmltdW0gZGV2aWNlcw0KPiA+IGVuYWJsZWQsIHN1Y2ggYXMg
dGlueSBrZXJuZWwgd2l0aCByYW1mcywgaXQgaXMgd29ya2luZyBldmVuIHdpdGggcGluY3RybC9j
bG9jaw0KPiBldGMuIGJ1aWx0IGFzIGxvYWRhYmxlIG1vZHVsZS4NCj4gDQo+IERvIHlvdSBoYXZl
IGFuIGV4YW1wbGUgdGhhdCBpcyBhY3R1YWxseSBicm9rZW4/IEkgY2hlY2tlZCBob3cgdGhlIGdw
aW8gY2hpcA0KPiBpcyBhY3R1YWxseSB1c2VkIGFuZCBmb3VuZCB0aGF0ICJyZWd1bGF0b3ItZml4
ZWQiLCAidmlydHVhbCxtZGlvLWdwaW8iLA0KPiAicmVndWxhdG9yLWdwaW8iLCAiZ3Bpby1sZWRz
IiwgIm1hcnZlbGwsbXY4OGU2MDg1IiwgIm1pY3JvY2hpcCx1c2IyNTEzYiIsDQo+ICJmc2wsaW14
N2QtdXNkaGMiLCAiZnNsLGlteDZzeC1mZWMiLCAibW1jLXB3cnNlcS1zaW1wbGUiLA0KPiAiYnJj
bSxiY200MzQzOC1idCIsICAicm9obSxiZDcxODM3IiwgIm54cCxwY2E5NTQ2IiwgICJydGMtbTQx
dDgwIiwNCj4gc2hvdWxkIGFsbCB3b3JrIGZpbmUgaGVyZS4NCj4gDQo+IEknbSBub3Qgc3VyZSBh
Ym91dCAiZnNsLG1tYTg0NTEiLCBtYXliZSB0ZXN0IHRoYXQgb25lIG1hbnVhbGx5IG9yIGxvb2sg
YXQNCj4gdGhlIGRyaXZlciBpbiBtb3JlIGRldGFpbC4NCj4gDQo+ICJmc2wsaW14OG1xLXBjaWUi
IGxvb2tzIGJyb2tlbiBidXQgZWFzaWx5IGZpeGVkLCBhbmQgdGhpcyBpcyBzb21ldGhpbmcgd2Ug
aGF2ZQ0KPiBhbHJlYWR5IGRpc2N1c3NlZC4NCj4gDQo+IGlteDhtcS1uaXRyb2dlbi5jIGhhcyBh
ICJ2c2VsLWdwaW9zIiBwcm9wZXJ0eSBpbiBpdHMgImZjcyxmYW41MzU1NSINCj4gZGV2aWNlIG5v
ZGUgdGhhdCBpcyBuZWl0aGVyIHBhcnQgb2YgdGhlIGJpbmRpbmcgbm9yIGhhbmRsZWQgYnkgdGhl
IGRyaXZlciwgc28NCj4gdGhpcyBpcyBicm9rZW4gcmVnYXJkbGVzcyBvZiB0aGUgZ3BpbyBkcml2
ZXIuDQo+IA0KPiA+IE1lYW53aGlsZSwgYXMgeW91IHNhaWQsIG1vc3Qgb2YgdGhlIHVzZXJzIGFy
ZSBzdGlsbCB1c2luZyBidWlsdC1pbg0KPiA+IG1vZGVsLCBzbyBhZGRpbmcgdGhlIHN1cHBvcnQg
Zm9yIEdQSU8gY2FuIGJlIGluIHBhcmFsbGVsIHdpdGggb3RoZXINCj4gPiBtb2R1bGVzJyB3b3Jr
LCBpbiBvdGhlciB3b3Jkcywgd2l0aCB0aGlzIEdQSU8gbG9hZGFibGUgbW9kdWxlIHN1cHBvcnQN
Cj4gPiBwYXRjaCwgaWYgb3RoZXIgbW9kdWxlcyBjYW4gTk9UIHdvcmsgZHVlIHRvIGxhY2sgb2Yg
ZGVmZXIgcHJvYmUNCj4gPiBpbXBsZW1lbnRhdGlvbiwgdGhlbiB0aGUgcGF0Y2ggc2hvdWxkIGJl
IGRvbmUgaW4gb3RoZXIgbW9kdWxlLCBhZGRpbmcNCj4gPiB0aGF0IHRoZSBkZWZhdWx0IGNvbmZp
Z3VyYXRpb24gb2YgR1BJTyBpcyBzdGlsbCBidWlsdC1pbiwgZG8geW91IHRoaW5rIGl0IGNhbiBi
ZQ0KPiBhbiBpbmRlcGVuZGVudCBwYXRjaCBhbmQgZ2V0IGludG8gbGludXgtbmV4dCBmaXJzdD8N
Cj4gDQo+IEkgdGhpbmsgeW91IHNob3VsZCBiZSByZWFzb25hYmx5IHN1cmUgdGhhdCBtYWtpbmcg
dGhlIGRyaXZlciBhIGxvYWRhYmxlDQo+IG1vZHVsZSBkb2VzIG5vdCBicmVhayBvdGhlciBkcml2
ZXJzIHRoYXQgbWlnaHQgcmVseSBvbiB0aGUgcHJvYmUgb3JkZXIgYW5kDQo+IHRoYXQgYXJlIGtu
b3duIHRvIGJlIHVzZWQgd2l0aCBhbiBpLk1YIGNoaXAuIFdpdGggdGhlIGxpc3QgYWJvdmUsIHRo
YXQgc2VlbXMNCj4gdG8gYWN0dWFsbHkgYmUgdGhlIGNhc2UgZm9yIHRoZSBtb3N0IHBhcnQsIGJ1
dCB0ZXN0aW5nIGlzIGFsd2F5cyBiZXR0ZXIuDQo+IA0KPiBJZiB0aGVyZSBhcmUgYm9hcmRzIHRo
YXQgdXNlIG90aGVyIGRyaXZlcnMgd2hpY2ggZG8gbm90IHN1cHBvcnQgZGVmZXJyZWQNCj4gcHJv
YmluZyBidXQgZG9uJ3QgaGF2ZSB0aG9zZSBsaXN0ZWQgaW4gdGhlIGR0cyBmaWxlcyBpbiB0aGUg
a2VybmVsLCB0aGVuIHRoYXQgaXMNCj4gbm90IHNvbWV0aGluZyB5b3UgaGF2ZSB0byB3b3JyeSBh
Ym91dCBJIHRoaW5rLg0KPiANCj4gSSdsbCBsZXQgTGludXMgV2FsbGVpaiBjb21tZW50IG9uIHdo
ZXRoZXIgaGUgdGhpbmtzIHRoZSBpbml0Y2FsbCBzaG91bGQgc3RheSBhdA0KPiBzdWJzeXNfaW5p
dGNhbGwoKSB0byBhdm9pZCBicmVha2luZyB1c2VycyB3aXRoIGJ1Z2d5IGRyaXZlcnMsIG9yIHdo
ZXRoZXIgdGhpcw0KPiBzaG91bGQgYmUgY2hhbmdlZCB0byBtb2R1bGVfaW5pdCgpIG9yIGJ1aWx0
aW5fcGxhdGZvcm1fZHJpdmVyKCkgdG8gaGF2ZSBhDQo+IGJldHRlciBjaGFuY2Ugb2YgZmluZGlu
ZyBhbmQgZml4aW5nIHRob3NlIGJyb2tlbiBkcml2ZXJzLg0KPiANCj4gICAgICBBcm5kDQo=
