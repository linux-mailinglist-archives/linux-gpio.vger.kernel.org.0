Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D26C2DBAEB
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Dec 2020 07:01:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725837AbgLPGBB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Dec 2020 01:01:01 -0500
Received: from mail-vi1eur05on2077.outbound.protection.outlook.com ([40.107.21.77]:29380
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725274AbgLPGBA (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 16 Dec 2020 01:01:00 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YdWwjzZicrcXMI7JxXjSDnWGWq4l2oHedYj64jHQr5OnYrNHwV4Fw6VT9oq1vdGajNHj4D9CVVf8PbRT9oGlgxBDbj4zlsTBBZwG1tkCDsB5hOi2a42CnwGduK/1d79aNma2PW9Om3JSat6np/uELNTmv7pQ5Yj9jV11Qjim56rAY4lr8fBQTb0B2t/TxIrBheV8wRdhlL+lyY+TEZPITDoW/tLd2Qnx7L8TwwPFF+dENbzjQkA3qxLX+ThEs3f6e9MEkJa+/CKzR/tmRVktBA6wmOyV7FsMoACDWOy85KE81RKnbcpte26sclnPsf+apwo3DmEcu4yK4rWRcK6rHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M0uvm6GPxo9AkEfZNL2tjWimkHpu+kGZtTt9EQd9ovE=;
 b=XZCVhLrts5fi+3jCgUg61U1Kbg1tBJzsNmdZRXIYdFeiGGWw2nrIrWbRiYIG7rdADR1Y30jTUmbKplB2hhahN2rpJni4+xNaVp3+6KbGBOtXbWA8SoycoQXFSJ4RJOZTBoz2qs29AerV1KcYZlBZ2N+b1CFWn0zcyxGjEo/tM5CBNARUIWxvyWRtZqPlFXUhn0OIKjRHYSoyXUel54R6JMBZkHh52tZvEXlkBxYXSr27WdWjRsO9SfbA+J0m+833joaEJ87ZWXtpIaDVtUwCsaOq3knICNpFVG8eu57p/1IiNbddtWz3OXOJ4db/8pZgifWhfefTU44yfYEURcsxow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M0uvm6GPxo9AkEfZNL2tjWimkHpu+kGZtTt9EQd9ovE=;
 b=jly6m3/ba2wxKDpOTmq0Eb/yi4UiyoQtOrxQzljHEpvBbmAcqPyWBvuQWXKnWzfpI6F3PXznpZtme6YLm213lcZI50OAiowbsigqVeuDPBIxUqAF42unfPx++C1GoJDENudbpou1CTh/z3x7KtyjdP5kD1QcPF8WUcGZa2sOKhk=
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com (2603:10a6:7:55::20) by
 HE1PR0301MB2314.eurprd03.prod.outlook.com (2603:10a6:3:25::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.17; Wed, 16 Dec 2020 06:00:10 +0000
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::f1f1:eb1d:2bf5:eb87]) by HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::f1f1:eb1d:2bf5:eb87%7]) with mapi id 15.20.3654.025; Wed, 16 Dec 2020
 06:00:10 +0000
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "yoshihiro.shimoda.uh@renesas.com" <yoshihiro.shimoda.uh@renesas.com>,
        "geert@linux-m68k.org" <geert@linux-m68k.org>
CC:     "khiem.nguyen.xt@renesas.com" <khiem.nguyen.xt@renesas.com>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        linux-power <linux-power@fi.rohmeurope.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "marek.vasut+renesas@gmail.com" <marek.vasut+renesas@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 03/10] regulator: bd9571mwv: rid of using struct
 bd9571mwv
Thread-Topic: [PATCH v2 03/10] regulator: bd9571mwv: rid of using struct
 bd9571mwv
Thread-Index: AQHWz7CxfZ5oTbAwpEyuKA+JrO+HVKnxyvwAgAaNCwCAAALugIAAp9sAgAA/NgA=
Date:   Wed, 16 Dec 2020 06:00:10 +0000
Message-ID: <0c6d88d25ae3d8cbed169c0efe5918844d8f47d9.camel@fi.rohmeurope.com>
References: <1607686060-17448-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
         <1607686060-17448-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
         <cbb8c9b1884ea5e535bcafda1218b941bd665c21.camel@fi.rohmeurope.com>
         <CAMuHMdVgo1fuY9jPpxUJiCOmN4Ahs7YXddzUfKH+4106i1xiuA@mail.gmail.com>
         <CAMuHMdWuoRMsNMPKgni3HENRT7RnCTyEjs5Zy2r4gw9f2B0Cng@mail.gmail.com>
         <TY2PR01MB3692684E65CD04B38BD0B69BD8C50@TY2PR01MB3692.jpnprd01.prod.outlook.com>
In-Reply-To: <TY2PR01MB3692684E65CD04B38BD0B69BD8C50@TY2PR01MB3692.jpnprd01.prod.outlook.com>
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
x-ms-office365-filtering-correlation-id: 3a8d07ae-f128-4bae-14dc-08d8a187d908
x-ms-traffictypediagnostic: HE1PR0301MB2314:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HE1PR0301MB231498476CB499528056144EADC50@HE1PR0301MB2314.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rtgLHU0pNMCyqTtFLoOHIr/1Y7ox3wOIXfqpH4h3L6tId1s4oZox85xXY4qHK84dEYFXGWtytcsXMesPel8MJRyPuVvpodJhJrMaaOMAVsG6wCBArzDhLSVB5RXPj70mYn8JTUI2ZdbexIah/jG7efPh8oaMxeZqoIxVZLxiGcc+JFdwrAN2edTGuIm8ftmHMomVstxoRCumsh1Fggu/9EZWhxOqPh9OUcRREcoLCWE/iZaiJcL7VpOPejE7qt4o/lCQNRBCV/MaXRbUwyvHLP5K9QKPLzN/11T+lsAOYgzStjpplfIbWj9TTiIdmqaYRWDJ5aSvo3vZmSu1pO+tzQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR03MB3162.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(39850400004)(136003)(366004)(376002)(86362001)(2906002)(316002)(53546011)(83380400001)(7416002)(66446008)(76116006)(110136005)(2616005)(54906003)(66476007)(26005)(66946007)(4326008)(5660300002)(6506007)(8936002)(6486002)(66556008)(186003)(64756008)(3450700001)(478600001)(71200400001)(8676002)(6512007)(4001150100001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?M1BNd2lRT1lPS2FrQlkxM1A0MlljZDRkZ2F1bWpSUWp1czNBY0MzQUFIWlpy?=
 =?utf-8?B?YkpQSHA3MWFlMXpaTkVkNmphY2pRYmNURk96bVlXRzhNNU9KOTlXbjg1VUpx?=
 =?utf-8?B?OFBjdkEvWHFsd3lyVUJoK2t5OC9TQi9ZVkRSNGlxUFBqdkhYdEl3L1E2UE9E?=
 =?utf-8?B?R3pzcUNyZWxiY1dNSER4Zkd2ZlJGNVRBZFRLWUV2MHp2d09SMVI2TXY2RFBS?=
 =?utf-8?B?VWsvK0xTYkdIYkFYRWNQbzEzQnExd0xsU0Z1bm9zaWRTZHZTV1VzQ3NaSzNN?=
 =?utf-8?B?U0xVbUtpdlVEZy9QcHpPTWRPdVZ6SDAwV29EbWJIMnM2ajJ4QzlNZ282enJT?=
 =?utf-8?B?YzlIWjF6ZDF0ay9IVmYvcXV3WFl4L1VnOVZzRkplK3pJWjFDbmhlUjZEVi9p?=
 =?utf-8?B?ZnFCMUVFTFBqVFVadjB0RWU2VGthc2NUbGluOGlPVGI2YmlIeURDVEF3SUtw?=
 =?utf-8?B?aGxrMmtkQVdaOG1FbnlYd2w4c1pUU1hDS05kUGIrRVZ4SlhXRi9CTXYxN1Vj?=
 =?utf-8?B?R0NmUW90dXFINVZBblBwQ0tnaXUrU3FGRXFlQWFXeFRENzdhQnBZaTQ0NWtz?=
 =?utf-8?B?ZE5DQkd4bmc3Y2x3K3VOQWJqWkxmdGN6VDd2bGd0NEM1d2plVTBHazFQa2pj?=
 =?utf-8?B?d3g3VEtIZ2hBcmlKZUpsY1huRGFhNXNqdmZEME9mcm1zZ1hTaFFycG43eTYy?=
 =?utf-8?B?R2daSjNaVXNqNTZDR2NQTmxmZzdFUWl5Q0VVL1JUQ3pKNHowdGsxNDRkVVAx?=
 =?utf-8?B?RFE5Mkdtbmt2dVd5YXpNeUhRQU1MWm1PQjlZTjlma0RDUjA2VEFCT01KV0ww?=
 =?utf-8?B?bXZWTzVJZzBLbXBKSkllKzdEckFrai82cmY3ZUNiRHZFN1RrWHBtTkliRFBW?=
 =?utf-8?B?Y0dKeDFVTDluQnNYS3Y1ZkorVU85LytGNHEzaFVOeUJuK21RODhvb25pRzJZ?=
 =?utf-8?B?cG1WM3BmZUo0TVpwWXNHRlNKZXNmNkt6NDlGOS9EUmVQVU1mdHVHOWVtRXFh?=
 =?utf-8?B?L3AvU2lqem5xUno3c1oyV3NDaG5JZ3NiejdtanB6V0JXcTNKeXY0VkVLTHdC?=
 =?utf-8?B?UFlIc2JSZE1YTXNsUHdBV3ZlWURUUWQ5NTlkVE9FQTk5M0JqSjRGUFA1emtX?=
 =?utf-8?B?aEtYbWhtV0Vub2k5dzdscVRVcU9HdWp3VkY1dE1XTm9INlkrNTVMVmhHVjVp?=
 =?utf-8?B?THdGTzRNcFp1VzZqMHNSdlN1ZjVPRnpKVlVkQVdlaUlMVE5UU2U4a0oyeXpZ?=
 =?utf-8?B?ZGFCNm0wMlNqSzhQS05xdkZNRENBcEwyLzU5ZGVPUmJydlNlN1FvbTVvSnJj?=
 =?utf-8?Q?7g1ejHxs8WvCuB/moH3b1eltAVDkgXLhfO?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0BE480C05AF5A24D9FB5E38FA9EFAA5E@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR03MB3162.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a8d07ae-f128-4bae-14dc-08d8a187d908
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2020 06:00:10.5568
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PKRgAuamlnZuXQoba2pW1Ht4TYorNHts7KzgbN7L7mFkKBcJ/675c9mFr96ZPjk0M+uECMLhGHXWINvndlT556jO56UwpP7pgrAcsUEjLp6MHDrjItEUYBs+RBAgcTIA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0301MB2314
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DQpPbiBXZWQsIDIwMjAtMTItMTYgYXQgMDI6MTMgKzAwMDAsIFlvc2hpaGlybyBTaGltb2RhIHdy
b3RlOg0KPiBIaSBHZWVydC1zYW4sIE1hdHRpLXNhbiwNCj4gDQo+ID4gRnJvbTogR2VlcnQgVXl0
dGVyaG9ldmVuLCBTZW50OiBXZWRuZXNkYXksIERlY2VtYmVyIDE2LCAyMDIwIDE6MTMNCj4gPiBB
TQ0KPiA+IE9uIFR1ZSwgRGVjIDE1LCAyMDIwIGF0IDU6MDIgUE0gR2VlcnQgVXl0dGVyaG9ldmVu
IDwNCj4gPiBnZWVydEBsaW51eC1tNjhrLm9yZz4gd3JvdGU6DQo+ID4gPiBPbiBGcmksIERlYyAx
MSwgMjAyMCBhdCAzOjAzIFBNIFZhaXR0aW5lbiwgTWF0dGkNCj4gPiA+IDxNYXR0aS5WYWl0dGlu
ZW5AZmkucm9obWV1cm9wZS5jb20+IHdyb3RlOg0KPiA+ID4gPiBPbiBGcmksIDIwMjAtMTItMTEg
YXQgMjA6MjcgKzA5MDAsIFlvc2hpaGlybyBTaGltb2RhIHdyb3RlOg0KPiA8c25pcD4NCj4gPiA+
ID4gPiAtLS0gYS9kcml2ZXJzL3JlZ3VsYXRvci9iZDk1NzFtd3YtcmVndWxhdG9yLmMNCj4gPiA+
ID4gPiArKysgYi9kcml2ZXJzL3JlZ3VsYXRvci9iZDk1NzFtd3YtcmVndWxhdG9yLmMNCj4gPiA+
ID4gPiBAQCAtMTcsNyArMTcsNyBAQA0KPiA+ID4gPiA+ICAjaW5jbHVkZSA8bGludXgvbWZkL2Jk
OTU3MW13di5oPg0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+ICBzdHJ1Y3QgYmQ5NTcxbXd2X3JlZyB7
DQo+ID4gPiA+ID4gLSAgICAgc3RydWN0IGJkOTU3MW13diAqYmQ7DQo+ID4gPiA+ID4gKyAgICAg
c3RydWN0IHJlZ21hcCAqcmVnbWFwOw0KPiA+ID4gPiANCj4gPiA+ID4gQXMgYSAnbml0JzoNCj4g
PiA+ID4gSSBtaWdodCBjb25zaWRlciBhZGRpbmcgdGhlIGRldiBwb2ludGVyIGhlcmUgdG8gYXZv
aWQgZXh0cmENCj4gPiA+ID4gYXJndW1lbnQNCj4gPiA+ID4gd2l0aCBhbGwgdGhlIGJrdXBfbW9k
ZSBmdW5jdGlvbnMgYmVsb3cuIChqdXN0IHBhc3MgdGhpcyBzdHJ1Y3QNCj4gPiA+ID4gYW5kDQo+
ID4gPiA+IG1vZGUpLiBCdXQgdGhhdCdzIG9ubHkgbXkgcHJlZmVyZW5jZSAtIGZlZWwgZnJlZSB0
byBpZ25vcmUgdGhpcw0KPiA+ID4gPiBjb21tZW50DQo+ID4gPiA+IGlmIHBhdGNoIGlzIE9rIHRv
IE1hcmssIE1hcmVrICYgT3RoZXJzIDopDQo+ID4gPiANCj4gPiA+IFN0cnVjdCByZWdtYXAgYWxy
ZWFkeSBjb250YWlucyBhIHN0cnVjdCBkZXZpY2UgcG9pbnRlciwgYnV0DQo+ID4gPiB0aGF0J3Mg
aW50ZXJuYWwNCj4gPiA+IHRvIHJlZ21hcC4NCj4gPiA+IA0KPiA+ID4gUGVyaGFwcyBhZGRpbmcg
YSByZWdtYXBfZGV2aWNlKCkgaGVscGVyIHRvIHJldHJpZXZlIHRoZSBkZXZpY2UNCj4gPiA+IHBv
aW50ZXINCj4gPiA+IG1pZ2h0IGJlIHdvcnRod2hpbGU/DQo+ID4gDQo+ID4gLUVFWElTVFMgOy0p
DQo+ID4gDQo+ID4gc3RydWN0IGRldmljZSAqcmVnbWFwX2dldF9kZXZpY2Uoc3RydWN0IHJlZ21h
cCAqbWFwKQ0KPiANCj4gVGhhbmsgeW91IGZvciBmaW5kaW5nIHRoaXMuIEknbGwgZml4IHRoaXMg
cGF0Y2guDQoNCkp1c3QgYSBzbWFsbCByZW1pbmRlciB0aGF0IHRoaXMgZGV2aWNlIGlzIHByb2Jh
Ymx5IHRoZSBNRkQgZGV2aWNlLCBub3QNCnRoZSBkZXZpY2UgY3JlYXRlZCBmb3IgcmVndWxhdG9y
IGRyaXZlci4gKFJlZ21hcCBpcyBjcmVhdGVkIGZvciBNRkQpLg0KRm9yIHByaW50cyB0aGlzIG9u
bHkgbWVhbnMgd2UncmUgaXNzdWluZyBwcmludHMgYXMgaWYgTUZEIGRldmljZQ0KZ2VuZXJhdGVk
IHRoZW0sIHJpZ2h0PyBJJ20gbm90IHN1cmUgaXQgaXMgdGhlIGJlc3QgYXBwcm9hY2ggLSBidXQg
SSdsbA0KbGVhdmUgdGhpcyB0byBNYXJrICYgb3RoZXJzIHRvIGp1ZGdlIDopDQoNCj4gDQo+IEJl
c3QgcmVnYXJkcywNCj4gWW9zaGloaXJvIFNoaW1vZGENCj4gDQoNCg==
