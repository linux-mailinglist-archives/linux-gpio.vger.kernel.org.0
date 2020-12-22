Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40C952E0838
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Dec 2020 10:40:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725882AbgLVJkn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 22 Dec 2020 04:40:43 -0500
Received: from mail-eopbgr80055.outbound.protection.outlook.com ([40.107.8.55]:9258
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725852AbgLVJkn (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 22 Dec 2020 04:40:43 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G7Sbr85BvL9OxUCTknjPlnnknAiAr7ur496ICST8yXDaslrKtnrZPQjWRlvRiU0vNGbukkXyUq82aziY4OJQ4n2XZU0QTemP8d8Qb21pMM3PfQWbZ81ULGVl2hMyOpjJhXMEAPsMOxyLKtL/U22M/jCqQZ97rxFufiCxwXbFT8RkKY8T67gaULn4WpXwRo7Bl8krpgV6J4Y2X7VCGrMZHRt1+e75f0XQsaybXDpYgdj4TTZ6k9HsEVeEy9ZVXCgtuyQtlQqwd82o/A8J9K/mQXYvEOR6kpTs7uMLEXElpyoj/DAZWHOuD4guBTdVBfMGBoRfN4wHUCbtgjuZGJv5qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YXyDj1JYvxxC4GN1mKuXTNqHgxH6KzQKIVjnzkT/Cs4=;
 b=cYNWmPuK1Nn3cgK84pBLx19P2QoaM7hNUgy7wSU8Jo98FhL+QTA00Kl1UeXaUmsInVI51N3bEha8649hABNUqiBcRBhzqXq2+XRLEkrzLLtkEzDq3OdlMg+XjsIM4exZecOjbIRBCoE6qwd8JAy5GYVaDIfAzw5d2YkNd0uOPNcUEiZ3iSnBZYMZDoH2VkkWXTFWOYUsDTvZsPoiyTurYX7BGzP0+bIVNJLMmSXGBtYm0Jyr3MUYaXJOxRMzGCPOT/5hblJJ1WcDJE1YgeyK/oTZIrNHMl0ys701PGwEX5UtC7HspnRwVYSUGcbxk2zk3LLuzBDia4D3+rtNtc1mow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YXyDj1JYvxxC4GN1mKuXTNqHgxH6KzQKIVjnzkT/Cs4=;
 b=I+2cPrAyxRBlfa1NX+a0ft+08CJgWpJV/H/JIm0o+cLdnIHgcbY0XOsBlT+onyQhFsOhWSm3LuPjP4FDGo/s+93heY4K2dgpI11i1DVDvzLuNtuFaARzb20YrVZKIbXuxtw0Hew415y1dlu6KJiAkVya40Qu1VaQuZtqP9MpVM0=
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com (2603:10a6:7:55::20) by
 HE1PR0301MB2473.eurprd03.prod.outlook.com (2603:10a6:3:68::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3676.33; Tue, 22 Dec 2020 09:39:21 +0000
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::f1f1:eb1d:2bf5:eb87]) by HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::f1f1:eb1d:2bf5:eb87%7]) with mapi id 15.20.3676.033; Tue, 22 Dec 2020
 09:39:21 +0000
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "yoshihiro.shimoda.uh@renesas.com" <yoshihiro.shimoda.uh@renesas.com>,
        "geert@linux-m68k.org" <geert@linux-m68k.org>
CC:     "khiem.nguyen.xt@renesas.com" <khiem.nguyen.xt@renesas.com>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        linux-power <linux-power@fi.rohmeurope.com>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "marek.vasut+renesas@gmail.com" <marek.vasut+renesas@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 12/12] mfd: bd9571mwv: Add support for BD9574MWF
Thread-Topic: [PATCH v4 12/12] mfd: bd9571mwv: Add support for BD9574MWF
Thread-Index: AQHW10Snfza2L3WIikGFJwbtMs/yxaoC0R+AgAAIiQCAAARwgA==
Date:   Tue, 22 Dec 2020 09:39:21 +0000
Message-ID: <1f13ab9c0902ed23511b0d393e633e0d7a7abc71.camel@fi.rohmeurope.com>
References: <1608519279-13341-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
         <1608519279-13341-13-git-send-email-yoshihiro.shimoda.uh@renesas.com>
         <CAMuHMdXkRUbjQk=1mqn0b7PeGX0ir=s4UwbCHfw_2mWaVEVPTg@mail.gmail.com>
         <TY2PR01MB36920B85DFCE969BF8AF229CD8DF0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
In-Reply-To: <TY2PR01MB36920B85DFCE969BF8AF229CD8DF0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
Reply-To: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Accept-Language: fi-FI, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.34.4 (3.34.4-1.fc31) 
authentication-results: renesas.com; dkim=none (message not signed)
 header.d=none;renesas.com; dmarc=none action=none
 header.from=fi.rohmeurope.com;
x-originating-ip: [62.78.225.252]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a4ee5e3a-717a-459c-cae7-08d8a65d75ca
x-ms-traffictypediagnostic: HE1PR0301MB2473:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HE1PR0301MB247396FC48F59D06494A6D33ADDF0@HE1PR0301MB2473.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1850;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: p61e6yuipH65KyReUEmNNElpf1NEjbI05jfvcJ495z9ZLyL7T0RrGTReSmvdavkj6X/vlVdSvjYGI76GYlWiluGouLrgKzIVI8HWAo72gBGIOKF9j104zr+O/c3b+dyd/e8RWfAlizZ15kzo0PFeUyl3cJ8XTRdjWAFM3oWnGrXTC6uIP4x2RklVBtRiT47v96Qn7MekAOb3VPk2/gzS9CnTFK526FUhMongm0hfx2rc2pkWXfk8FbkFc3lBrUdr1ziijsxzfBB8vem+AxJAIO54gqWxRXUpzgv72oWA3WsELoXXQ/81SWE2brXsjvvxZ+8NU69VzEYALdF4cel3kgBAiNoMk1Wn3sCV2E9UtUrd2pl5uIKh3TADaWYoaNdSTJvA7k6Q4CEIeQ84RdxgpA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR03MB3162.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8676002)(26005)(53546011)(6506007)(186003)(3450700001)(71200400001)(4326008)(54906003)(86362001)(6512007)(110136005)(66556008)(76116006)(66476007)(66446008)(5660300002)(2906002)(4001150100001)(64756008)(8936002)(7416002)(498600001)(83380400001)(66946007)(2616005)(6486002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?WWkydzFob2UxclJwNGZOWXZ2WWFDR013MFRkQWFaaS91SE82L29MNWRoWUM4?=
 =?utf-8?B?ZTFFZ1RsSXBuT0Q5Y1VlenNDdkRxWG1aTUszZnFaWnRZdnU0YUZGdFdJM1VY?=
 =?utf-8?B?Tld4RkZPQklNVVZqOEt5SXhRNlRKNUJDdFdka0d6UXVhSHJIdnhYeERBeC9J?=
 =?utf-8?B?TE9JSnhaUFJncjZtV1o0Nm4zWGhVOE9Ra2hSNHVmRlBRUlVBdWZRRElyUlBG?=
 =?utf-8?B?RStpa01GbisrWjB2SllpeUR2NXNCOWNiTW1aYnBxMThZckh0N2hZb3hrZnAv?=
 =?utf-8?B?L2Q2eWUxTW9hc0xkUERJR3R4eElVWWpNblcyNGZpbU1GcXdMejZtK0pvUzR6?=
 =?utf-8?B?VlU5eWJQblhkUFh2MmhYWFFtOGFWcUFkcmRhaEV4aHZCTVFza1JsTDdnZVQr?=
 =?utf-8?B?ME9NZTF1MjFnb1Jham4zS2U3Y1Y3MWFhbE8xeEQ1NCtDenI4T0dmWlZpRXRH?=
 =?utf-8?B?aDZweUF2VDJFdXZwRkl1d1prVzdWZmNlSGl6dzc1ZlA3eUEvYkIvMm5GaUls?=
 =?utf-8?B?STZ6WTJOMWI5dTRYa0ZkSXdVUnkrWU82Rk9VWkloakt0Yi9mby82VThQV3pp?=
 =?utf-8?B?UDEzY2ZXRE9yWitJaDhmNHFzS1JwREdOd3hlb2RiaVNZVG5EQ292TGI2SEJr?=
 =?utf-8?B?b3l1cXB0QTZQbzFWYm5jbmJVL3hQNzNlTTMrU2NXWmsyeFR5bDF1TitLTHZB?=
 =?utf-8?B?dXNkc1dBTXBZTmNhQXlJcnNLSk83aEJyWkJPZi9oVkhyT0JFKytBRzVwRGtx?=
 =?utf-8?B?UzlYd1JNL3kzenhVM0c4TWFUUFJBNW01NjgydUJ4U1l2V2lrTmFhV3FJK1Ar?=
 =?utf-8?B?RklSNHhMK3l0cHVUZ1hrbzkxb29vcXdYT2p3VUtUOHFwYTE5bjh0YnAzWkVq?=
 =?utf-8?B?eDlGT0MwTVE5SVBJWFF5NDI0Rmd2VGl4bDI2ZTlZV3B0cm1rOFZ3eDkrclp1?=
 =?utf-8?B?a1FIcmNVVXlQblVGK2drbFUxdjNkV05KVVNUTlVnL2hmZk80M24rd3F4Z3Zo?=
 =?utf-8?B?NVUyZG5nRko5NjZiUGt6VVFYNVArYk1hSGUxdkl0Tk9tWFNsajVpMXRrOWoz?=
 =?utf-8?B?Uk81VUZOdXNsV3EvMEx0REtoelBReVlZTmxaK2RMSFBPYXVCWmRPQWpQZm9x?=
 =?utf-8?B?MnZ1R3JIOWFISjVEZU4xWXBEcExWZzhBWUZMUTFWR3VoRnVCbmFKOUp2K2JZ?=
 =?utf-8?B?cjF5V09FL3RjZWJEa1E4Sllna2VrazZ3dG9FZ2Q0RldtSUNvMU10ZTV2NnU0?=
 =?utf-8?B?NzNreXQ0Q091cTlleDF5VnBkdlJoRUJyWUFUTjBObmg2M1RlbEd5V0tSa1Ay?=
 =?utf-8?Q?mDNuBcL6fM1tYTQO8ovlfDC89bt1nDm7Vc?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BF4759A77DA2E849B34E02C32511106C@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR03MB3162.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4ee5e3a-717a-459c-cae7-08d8a65d75ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Dec 2020 09:39:21.0219
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xPhu4Icw1ojEE0v7ie3QGYB1bKlMvoWvN7/wXS8VhcONb5toU0qcnNsk44k7p/QruiX6DghD95Kvu1Wx6dU2iI+wxbwIpVvGI3hCS43oBH6J2wjtXzuo5vghO1GeyMY7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0301MB2473
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DQpPbiBUdWUsIDIwMjAtMTItMjIgYXQgMDk6MjMgKzAwMDAsIFlvc2hpaGlybyBTaGltb2RhIHdy
b3RlOg0KPiBIaSBHZWVydC1zYW4sDQo+IA0KPiBUaGFuayB5b3UgZm9yIHlvdXIgcmV2aWV3IQ0K
PiANCj4gPiBGcm9tOiBHZWVydCBVeXR0ZXJob2V2ZW4sIFNlbnQ6IFR1ZXNkYXksIERlY2VtYmVy
IDIyLCAyMDIwIDU6NTMgUE0NCj4gPiBPbiBNb24sIERlYyAyMSwgMjAyMCBhdCAzOjU2IEFNIFlv
c2hpaGlybyBTaGltb2RhDQo+ID4gPHlvc2hpaGlyby5zaGltb2RhLnVoQHJlbmVzYXMuY29tPiB3
cm90ZToNCj4gPHNuaXA+DQo+ID4gPiAtLS0gYS9kcml2ZXJzL21mZC9iZDk1NzFtd3YuYw0KPiA+
ID4gKysrIGIvZHJpdmVycy9tZmQvYmQ5NTcxbXd2LmMNCj4gPiA+IEBAIC0yMDAsMTIgKzI3Nywx
NCBAQCBzdGF0aWMgaW50IGJkOTU3MW13dl9wcm9iZShzdHJ1Y3QNCj4gPiA+IGkyY19jbGllbnQg
KmNsaWVudCwNCj4gPiA+IA0KPiA+ID4gIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lk
IGJkOTU3MW13dl9vZl9tYXRjaF90YWJsZVtdID0gew0KPiA+ID4gICAgICAgICB7IC5jb21wYXRp
YmxlID0gInJvaG0sYmQ5NTcxbXd2IiwgfSwNCj4gPiA+ICsgICAgICAgeyAuY29tcGF0aWJsZSA9
ICJyb2htLGJkOTU3NG13ZiIsIH0sDQo+ID4gPiAgICAgICAgIHsgLyogc2VudGluZWwgKi8gfQ0K
PiA+ID4gIH07DQo+ID4gPiAgTU9EVUxFX0RFVklDRV9UQUJMRShvZiwgYmQ5NTcxbXd2X29mX21h
dGNoX3RhYmxlKTsNCj4gPiA+IA0KPiA+ID4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgaTJjX2Rldmlj
ZV9pZCBiZDk1NzFtd3ZfaWRfdGFibGVbXSA9IHsNCj4gPiA+IC0gICAgICAgeyAiYmQ5NTcxbXd2
IiwgMCB9LA0KPiA+ID4gKyAgICAgICB7ICJiZDk1NzFtd3YiLCBST0hNX0NISVBfVFlQRV9CRDk1
NzEgfSwNCj4gPiA+ICsgICAgICAgeyAiYmQ5NTc0bXdmIiwgUk9ITV9DSElQX1RZUEVfQkQ5NTc0
IH0sDQo+ID4gDQo+ID4gV2h5IGFkZCB0aGUgY2hpcCB0eXBlcz8gIFRoZXNlIGFyZSB1bnVzZWQs
IGFuZCB0aGUgZHJpdmVyIHVzZXMNCj4gPiBhdXRvZGV0ZWN0aW9uIG9mIHRoZSBjaGlwIHZhcmlh
bnQgYW55d2F5Lg0KPiANCj4gSSBqdXN0IGFkZGVkIHRoZSBjaGlwIHR5cGVzIGluIHRoZSBmdXR1
cmUgdXNlLiBBcyB5b3Ugc2FpZCwNCj4gdGhlc2UgYXJlIHVudXNlZCBhbmQgd2Ugc2hvdWxkIG5v
dCBhZGQgYSBmdXR1cmUgdXNlIGluIGdlbmVyYWwuDQo+IFNvLCBJJ2xsIHJlbW92ZSB0aGlzIGNo
YW5nZS4NCj4gDQo+IEFsc28sIEkgdGhpbmsgSSBzaG91bGQgcmVtb3ZlIHRoZSBmb2xsb3dpbmcg
cGF0Y2guDQo+IA0KPiBbUEFUQ0ggdjQgMDgvMTJdIGdwaW86IGJkOTU3MW13djogQWRkIEJEOTU3
NE1XRiBzdXBwb3J0DQoNCkkgdGhpbmsgdGhpcyBkZXBlbmRzIG9uIHdoZXRoZXIgeW91IHdpc2gg
dG8gYWRkIHN1cHBvcnQgZm9yIHRoZQ0KDQo+ICJSRUNPVl9HUE9VVCIsICJGUkVRU0VMIiBhbmQg
IlJUQ19JTiIsDQoNCndoaWNoIHlvdSBtZW50aW9uIGluIEdQSU8gY29tbWl0IG1lc3NhZ2UuIElm
IHlvdSBwbGFuIG9uIGFkZGluZyB0aGUNCnN1cHBvcnQsIHRoZW4geW91IG5lZWQgdG8gZGlmZmVy
ZW50aWF0ZSB0aGUgSUNzIG9uIEdQSU8gZHJpdmVyLCByaWdodD8NCg0KQmVzdCBSZWdhcmRzDQog
ICAgTWF0dGkgVmFpdHRpbmVuDQo=
