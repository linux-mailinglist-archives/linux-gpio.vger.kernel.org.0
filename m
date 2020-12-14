Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3344D2D9252
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Dec 2020 05:58:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731109AbgLNE6R (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 13 Dec 2020 23:58:17 -0500
Received: from mail-eopbgr1400137.outbound.protection.outlook.com ([40.107.140.137]:61664
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725944AbgLNE6R (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 13 Dec 2020 23:58:17 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QQPCH9a22D81PEqoaZCEbs26k+fUzr5Mq8VW7c1xnKcn+2o/5E3rj3VKQZ2elJetll0taWa13ts6RxSTbwVLEur8UGsd6Bt/If6CISEHHwD/KpdwPDHLpxaXGRBpzgKzx0CPivAIo2XNcThi14vi+zAt4XTrXjGkKWQfC/abuOXfDM5JL1rdx1U8yIYGO4P2Dixmer3jK9mPa6j5pZootK/T7xDOR4DkLijO+R8MHZ9so3bx6cD+AcYRKWw3BqDhasGC5Urme/8RUnlEZx0F/w0wCyeQybU5S5nFtlNFkdPvYwUaO6WRFt6Uto1EkwVUG1v7xIjKhMAST7KQil5WaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mcm9LzCjHz/fPhPKmv5ZARs/huC13r4zUWxODOVGXLw=;
 b=e+6BQ6Eey6R1wmAwLg8REMz1P5Ua2DZ03d4DCtfWN8zu2jerHQVtF9/Hn4vE/cGSvG8XIsrQoYRYv0MOYY134SEsjHZX7hdnw5Plfshay8WA60HnN4HCcpucACyEWG0kEsTGN96Z0lK19OOEfnEGJXYv0efHAZqdW/6iIu27q9bjFYq3M2f6dNSS9yxfC/po5ihXAvL3ZFpT4QglfmcmabMJL4CuQnEsfBbRXG4ugexQyaNQqj0T7e+hEDJJa1bx4oVVb8tM6NjANYYvb07lKIq7vFCUvTvJB7KZsAiYhL/v/ukkZ+l7rHr9JqbIqeyG2EPB97rErVYE8blMM6F0nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mcm9LzCjHz/fPhPKmv5ZARs/huC13r4zUWxODOVGXLw=;
 b=R4uw9tTO0iyhj7DHJID9Bs51KmaPsNp9og0yqIrnkeoH3fv7Vug/+IsYjKHNK+OL0kD8rmMREIXxMPbuZMRNTJsZlxZUlwJ1g9CbNsef8UoxH7Kcq5iafgN1tFxe+nYnh7233ZbHBZQmxQV6W4CxyrJpHB93wlv7RwRJIBNsMn0=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYAPR01MB5691.jpnprd01.prod.outlook.com (2603:1096:404:805a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Mon, 14 Dec
 2020 04:57:28 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::2023:7ed1:37c3:8037]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::2023:7ed1:37c3:8037%5]) with mapi id 15.20.3654.025; Mon, 14 Dec 2020
 04:57:28 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "marek.vasut+renesas@gmail.com" <marek.vasut+renesas@gmail.com>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>
CC:     linux-power <linux-power@fi.rohmeurope.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Khiem Nguyen <khiem.nguyen.xt@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 04/10] regulator: bd9571mwv: Add BD9574MWF support
Thread-Topic: [PATCH v2 04/10] regulator: bd9571mwv: Add BD9574MWF support
Thread-Index: AQHWz7CtMmFbq93S7UCFSGJMUv+GJanx1IyAgAQtVwA=
Date:   Mon, 14 Dec 2020 04:57:28 +0000
Message-ID: <TY2PR01MB3692F97109A6E409DEA9EAA6D8C70@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <1607686060-17448-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
         <1607686060-17448-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <ab27db32a8da1486e14722831da947d37bbdcf7d.camel@fi.rohmeurope.com>
In-Reply-To: <ab27db32a8da1486e14722831da947d37bbdcf7d.camel@fi.rohmeurope.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: fi.rohmeurope.com; dkim=none (message not signed)
 header.d=none;fi.rohmeurope.com; dmarc=none action=none
 header.from=renesas.com;
x-originating-ip: [240f:60:5f3e:1:1453:ff:c191:5a7a]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 4011ae4e-d94e-41cf-a0ae-08d89fecc1d4
x-ms-traffictypediagnostic: TYAPR01MB5691:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TYAPR01MB5691D11E1E68E2E4F3364861D8C70@TYAPR01MB5691.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2399;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DITrB9qpjMmZA1PQVbG9fO7mFKHILLwYOWY2bYbN4Ofz2WaGDMw5Oni3caKr8SCsKjEg9RBILCEh/4HFN/wPOASsEa+bbtGnwEMDmtrtepT7Hn18GcgiqagOkiyQex8TLiUcrFqxxMfjulilyK1NzjFGNIlTSbZ8KEkf6AOY+KNRjndNwm3NSsonYMvvXW5bCT90pLr8OtM7Cf6CWSrB7sE9+293bE0znh+gWD47HU+b1Dv6JQUgOFSC+RdNTO35lJsdnx2cyJLpeXW/lEz94BiaS2pseP9jBoP60O1xrP7GSNlz8U2IVz9ZYm7FMwyGwQmvDOJgnHSOmXbqnRvx2g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(396003)(366004)(39860400002)(136003)(86362001)(110136005)(71200400001)(64756008)(66556008)(52536014)(54906003)(66946007)(4326008)(2906002)(4001150100001)(33656002)(76116006)(186003)(9686003)(55016002)(7416002)(83380400001)(478600001)(66476007)(7696005)(6506007)(5660300002)(66446008)(8936002)(316002)(8676002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?ZFA2QytlUmV3c3hWNnNyR29Ud0g4bHQ5QXpQU3FlaEtOOHhkUzltTklrUzJV?=
 =?utf-8?B?d2FHTDZLbzNXOFpCVWZva3prUGhyc2xydzZoQmRGTVBIaG9wSmxpcTIzMWlT?=
 =?utf-8?B?UWNnUXRQRklkK3FkNnEwSGZyU0JBelpBSGZDWjVKU0ZvTXlTbXI3b2dkaUN5?=
 =?utf-8?B?ZFpNbW95U3ZReWRIY2UwOVpWTUFpZDBlVU5vTHV0ZXFVeVBCWmV5S2tpOHlX?=
 =?utf-8?B?aDM4Y1pIUk04TG1XUjA3eE1sdXVhMklCazU3UGUzZVNtWVZ5UzRCSTlRV1Zt?=
 =?utf-8?B?Mmw1MHhoMWF4UTlDcGpIOTB0ejBOVFoxajl4UUlLQVBFN3RnN1c5alpianNy?=
 =?utf-8?B?cDRJWXh4b1NWKzI5Z1Z5UTZuczZjVTVCZFJJbGtwaGtuYTRESldjN1Y0YTlo?=
 =?utf-8?B?bGRyaDdrMnpTNTcyY3hCYVdheXpiWXNwc2JXMDQ2MWxMYTJrSjdOMUxTRld3?=
 =?utf-8?B?RjJIeGxNMEtKamNEUHZhODIwRFcrblZHa0R4L0pPczFkK0VOSnRoc1g4bXcv?=
 =?utf-8?B?R1NxV2JwWCtnQ3VBTXc5Mm9wVkxYcVRRYmJ3bnBDeVVwbnRNcFFLa0NBZmc3?=
 =?utf-8?B?MlVoVFptdTIxbjVIYXR3M2srdTQ3elB5NU5XWG5uaWlTeDU1a0JMNXk4NEoy?=
 =?utf-8?B?NTVPOFJXK0hWRElxVFhIRmVFYVJXQlJzR3A4L3A0Lzk0SXNKTk1sU0lEci9Y?=
 =?utf-8?B?UjlRNjBNN3Vxb3FXRkZOSEg3VFdrS05lekFZQ3ZUQkxGcUZrM0xVZlVva25k?=
 =?utf-8?B?WkdsclgzbEdkVDF3RkhSSkRyZFNlRFNUQ2YxaEtpM25yZEJ3UU1WbEVRV1hw?=
 =?utf-8?B?Skdid245eHcxck1DOWNaRXp0L2pQb3htdlNwb3ZTZGlyWUEvVEhUeWxtQUVw?=
 =?utf-8?B?K29QSXN2TmtHQll3cGtwZWZrTDN3MjZEbXlUYjA3SGl3MnlxdWxza3JaN3Zv?=
 =?utf-8?B?S2pZOUlpb3QwYjlpTXRLa3Q4djhUUGowMko0Vk1pUHhJdXRPOGVVdytqVEpo?=
 =?utf-8?B?RHo1bCs2R1FqUVhJRUpkejRzZFVFRG9kd0RkZjNmTE5hN2RTMXVOajh6dkFE?=
 =?utf-8?B?Y3phT0VQK0p5QStFNUlzMStmQStGOW02b29BRWFIcnB0cHN3Q0tHWkZoQm1L?=
 =?utf-8?B?SkFPaSs1Z1RYdXJERWdLeG9QcWRVOHBBMTJtYTdkQVc5K0ZvSG1wV3IybDNV?=
 =?utf-8?B?cmpIVnBoM3d4WHNrdS9FSXQ2ZzNQaG9FZ2tQZDF2L3FRa2xCZW9SbkZ2U3lS?=
 =?utf-8?B?R0MwN0ZXL3QvdlUxMHB5MDh3YVlVd21DYW1KMkZRekxIc1hsb3ZSL05mSFM1?=
 =?utf-8?B?cUwvbUNTT3ROOXVWREZ6cU9rSFlGOExmU1ZrTzM3SkpSdmJ1S09sVkhYYWNr?=
 =?utf-8?Q?JvjS9529Gv0V1YCLBfPvAtqj+cqMP110=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4011ae4e-d94e-41cf-a0ae-08d89fecc1d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Dec 2020 04:57:28.4891
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bNYG3hJAO9f1W0cPn3mPmf02khGWsXpcUgmZdeksIItDYKMGrMijjQE6Nqew6p98sjtlu5oZd9rrxJ+8wbz4NI4MIbw2EiOJVl8+vcNFgE3wdDz6ac4UHVwGKJ6BsEL2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5691
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGVsbG8gTWF0dGktc2FuLA0KDQo+IEZyb206IFZhaXR0aW5lbiwgTWF0dGksIFNlbnQ6IEZyaWRh
eSwgRGVjZW1iZXIgMTEsIDIwMjAgOTozNCBQTQ0KPiANCj4gSGVsbG8gYWdhaW4gU2hpbWFkYS1z
YW4sDQo+IA0KPiBPbiBGcmksIDIwMjAtMTItMTEgYXQgMjA6MjcgKzA5MDAsIFlvc2hpaGlybyBT
aGltb2RhIHdyb3RlOg0KPiA+IEFkZCBzdXBwb3J0IGZvciBCRDk1NzRNV0Ygd2hpY2ggaXMgc2ls
aW1hciBjaGlwIHdpdGggQkQ5NTcxTVdWLg0KPiA+IE5vdGUgdGhhdCBCRDk1NzRNV0YgZG9lc24n
dCBzdXBwb3J0IEFWUyBhbmQgVklELg0KPiANCj4gSSdkIGxpa2UgdG8gdW5kZXJzdGFuZCB3aGF0
IGlzIFZJRD8NCg0KSXQgc2VlbXMgcmVhZGluZyBzb21lIHZvbHRhZ2VzIGZyb20gcmVnaXN0ZXJz
Lg0KRm9yIGV4YW1wbGUsIEJEOTU3MSBoYXMgIlZEMThfVklEIiByZWdpc3RlciB3aGljaA0KaXMg
cHJvaGliaXQgdG8gd3JpdGUuIEJ1dCwgQkQ5NTc0IGRvZXNuJ3QgaGF2ZSB0aGlzDQpyZWdpc3Rl
ci4gQWxzbywgdGhlIGRyaXZlciBuYW1lcyAidmlkX29wcyIsDQpzbyBJIGRlc2NyaWJlZCAiVklE
IiBoZXJlLiBQZXJoYXBzLCB3ZSBzaG91bGQgcmV2aXNlDQp0aGUgZGVzY3JpcHRpb24gdG8gY2xl
YXIuIChQbGVhc2UgbG9vayAiVXBkYXRlZCBkZXNjcmlwdGlvbiIgaW4gdGhpcyBlbWFpbC4pDQoN
Cj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFlvc2hpaGlybyBTaGltb2RhIDx5b3NoaWhpcm8uc2hp
bW9kYS51aEByZW5lc2FzLmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9yZWd1bGF0b3IvYmQ5
NTcxbXd2LXJlZ3VsYXRvci5jIHwgMTAgKysrKysrKystLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwg
OCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvcmVndWxhdG9yL2JkOTU3MW13di1yZWd1bGF0b3IuYw0KPiA+IGIvZHJpdmVycy9yZWd1
bGF0b3IvYmQ5NTcxbXd2LXJlZ3VsYXRvci5jDQo+ID4gaW5kZXggMDIxMjBiMC4uMDQxMzM5YiAx
MDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL3JlZ3VsYXRvci9iZDk1NzFtd3YtcmVndWxhdG9yLmMN
Cj4gPiArKysgYi9kcml2ZXJzL3JlZ3VsYXRvci9iZDk1NzFtd3YtcmVndWxhdG9yLmMNCj4gPiBA
QCAtMSw2ICsxLDYgQEANCj4gPiAgLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAN
Cj4gPiAgLyoNCj4gPiAtICogUk9ITSBCRDk1NzFNV1YtTSByZWd1bGF0b3IgZHJpdmVyDQo+ID4g
KyAqIFJPSE0gQkQ5NTcxTVdWLU0gYW5kIEJEOTU3NE1XRi1NIHJlZ3VsYXRvciBkcml2ZXINCj4g
PiAgICoNCj4gPiAgICogQ29weXJpZ2h0IChDKSAyMDE3IE1hcmVrIFZhc3V0IDxtYXJlay52YXN1
dCtyZW5lc2FzQGdtYWlsLmNvbT4NCj4gPiAgICoNCj4gPiBAQCAtOSw2ICs5LDcgQEANCj4gPiAg
ICogTk9URTogVkQwOSBpcyBtaXNzaW5nDQo+ID4gICAqLw0KPiA+DQo+ID4gKyNpbmNsdWRlIDxs
aW51eC9tZmQvcm9obS1nZW5lcmljLmg+DQo+ID4gICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4N
Cj4gPiAgI2luY2x1ZGUgPGxpbnV4L29mLmg+DQo+ID4gICNpbmNsdWRlIDxsaW51eC9wbGF0Zm9y
bV9kZXZpY2UuaD4NCj4gPiBAQCAtMjc3LDYgKzI3OCw3IEBAIHN0YXRpYyBpbnQgYmQ5NTcxbXd2
X3JlZ3VsYXRvcl9wcm9iZShzdHJ1Y3QNCj4gPiBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ID4g
IAlzdHJ1Y3QgcmVndWxhdG9yX2RldiAqcmRldjsNCj4gPiAgCXVuc2lnbmVkIGludCB2YWw7DQo+
ID4gIAlpbnQgaTsNCj4gPiArCWVudW0gcm9obV9jaGlwX3R5cGUgY2hpcCA9IHBsYXRmb3JtX2dl
dF9kZXZpY2VfaWQocGRldiktDQo+ID4gPmRyaXZlcl9kYXRhOw0KPiA+DQo+ID4gIAliZHJlZyA9
IGRldm1fa3phbGxvYygmcGRldi0+ZGV2LCBzaXplb2YoKmJkcmVnKSwgR0ZQX0tFUk5FTCk7DQo+
ID4gIAlpZiAoIWJkcmVnKQ0KPiA+IEBAIC0yOTIsNiArMjk0LDkgQEAgc3RhdGljIGludCBiZDk1
NzFtd3ZfcmVndWxhdG9yX3Byb2JlKHN0cnVjdA0KPiA+IHBsYXRmb3JtX2RldmljZSAqcGRldikN
Cj4gPiAgCWNvbmZpZy5yZWdtYXAgPSBiZHJlZy0+cmVnbWFwOw0KPiA+DQo+ID4gIAlmb3IgKGkg
PSAwOyBpIDwgQVJSQVlfU0laRShyZWd1bGF0b3JzKTsgaSsrKSB7DQo+ID4gKwkJLyogQkQ5NTc0
TVdGIHN1cHBvcnRzIERWRlMgb25seSAqLw0KPiA+ICsJCWlmIChjaGlwID09IFJPSE1fQ0hJUF9U
WVBFX0JEOTU3NCAmJiByZWd1bGF0b3JzW2ldLmlkDQo+ID4gIT0gRFZGUykNCj4gPiArCQkJY29u
dGludWU7DQo+IA0KPiBEb2VzIHRoaXMgbWVhbiB0aGF0IHJlYWRpbmcgVkQwOSB2b2x0YWdlIGlz
IG5vdCBzdXBwb3J0ZWQgYnkgZHJpdmVyPw0KDQpZZXMuIEFsc28sIHJlYWRpbmcgVkR7MTgsMjUs
MzN9IHZvbHRhZ2UgYXJlIG5vdCBzdXBwb3J0ZWQuDQoNCj4gKEkNCj4gYXNzdW1lZCBWRDA5IGlu
aXRpYWwgdm9sdGFnZSBjYW4gYmUgc2V0IGZyb20gZWVwcm9tKD8pIGFuZCByZWFkIGJ5DQo+IGRy
aXZlciAtIEkgbWF5IGJlIHdyb25nIHRob3VnaCkuIFBlcmhhcHMgaXQgaXMgd29ydGggbWVudGlv
bmluZyBpbiB0aGUNCj4gY29tbWl0IG1lc3NhZ2UgYXMgYSBkcml2ZXIgcmVzdHJpY3Rpb24/DQoN
ClllcywgdGhlc2Ugdm9sdGFnZSBjYW4gYmUgc2V0IGZyb20gZWVwcm9tIGFuZCByZWFkIGJ5IGRy
aXZlci4NClNvLCBJIHVwZGF0ZWQgdGhlIGRlc2NyaXB0aW9uIGxpa2UgYmVsb3cuDQoNCi0tIFVw
ZGF0ZWQgZGVzY3JpcHRpb24gLS0NCkFkZCBzdXBwb3J0IGZvciBCRDk1NzRNV0Ygd2hpY2ggaXMg
c2ltaWxhciBjaGlwIHdpdGggQkQ5NTcxTVdWLg0KTm90ZSB0aGF0IHNpbmNlIEJEOTU3NE1XRiBk
b2Vzbid0IGhhdmUgYXZzX29wcyBhbmQgdmlkX29wcw0KcmVsYXRlZCByZWdpc3RlcnMsIHRoaXMg
ZHJpdmVyIGF2b2lkcyB0byB1c2UgdGhlc2UgcmVnaXN0ZXJzDQppZiBCRDk1NzRNV0YgaXMgdXNl
ZC4NCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KDQo+IEFuZCBqdXN0IGFza2luZyBvdXQgb2Yg
dGhlIGN1cmlvc2l0eSAtIGFyZSB0aGUgb3RoZXIgdm9sdGFnZSByYWlscw0KPiBsaXN0ZWQgaW4g
ZGF0YS1zaGVldCAoVkQxOCwgRERSMCwgVkQzMywgVkQwOSBhbmQgTERPMSwuLi4sTERPNCkgc2V0
LXVwDQo+IGZyb20gRFQgYXMgZml4ZWQtcmVndWxhdG9ycz8gQW55IHJlYXNvbiB3aHkgdGhleSBh
cmUgbm90IHNldC11cCBoZXJlPw0KDQpUQkgsIEkgZG9uJ3Qga25vdyB3aHkuIFBlcmhhcHMsIHRo
ZSBkcml2ZXIgY2Fubm90IHJlYWQgRERSMCwgTERPWzEtNF0gdmFsdWVzPw0KDQpCZXN0IHJlZ2Fy
ZHMsDQpZb3NoaWhpcm8gU2hpbW9kYQ0KDQo=
