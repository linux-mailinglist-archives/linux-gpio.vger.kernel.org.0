Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79E3B38C497
	for <lists+linux-gpio@lfdr.de>; Fri, 21 May 2021 12:25:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229652AbhEUK0q (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 May 2021 06:26:46 -0400
Received: from mail-eopbgr30081.outbound.protection.outlook.com ([40.107.3.81]:54833
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229503AbhEUK0p (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 21 May 2021 06:26:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e74PUxfx75UB2jdE05ctZja5DZ8KW2ptnBSRGz14QGYa7dVZGkanhapkAowxaDLYlabjLmLjAUv+XadFkC8SyiYjsC9B/Wj2tTmZQtMsRctX36GsY6Oge9kd6ihGYSGoeqqxmpoHLxEP2rjkUNf4Lj5UvxK49mAyrCbpLzAs9rlyqY002bgunbiGiwknrzWwfl6uJfE/HYBzgRnIvYvZ5WH85ZvL10b1/D6Kqm1DgP2goPAcgHdChqfKGGcWeW+k0p+B+PKro/WElFnHzvYldNh/Ni0e4mUCSig0yvV/FBiw2ssQNQJQp3KVmCT8Mhddrr2jl+AG/cY6NgS9kYub0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YBwm0jfmKDjhRYJs42eZM2t99oYPfigi+8Eh+JBLmek=;
 b=O/5fFO0080gHFfSvV+Pbt0urMbp7cr0wn2uFhVw9UpbkO4rHzZzGabXpM54C9ZRUzzqyf9gMKStQk0ekdjzwKenoR0oLaM5yV0J02JehfuCxAAOLytI/+afcMn8ck3l/XCuM/EJhmDJgQ2dEDbBlOkCG+LKTGucAyf4TpCdIjUFhuSZ5ctk3dRXKl10i22jR/gaLPG5mCsjJN7pM2GEsWvANHMpIgiI2cpgMx0oM4t5AMKaA+2mGaJnyu1G3LQHzsNgaBEqP3HMWIoXrfm6KW9RtdpB8cIdmnYkgy4h0qlnQ50p89kDoQzJVMM60NPXEOdQdGF8cVO7PTNII5J6qYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YBwm0jfmKDjhRYJs42eZM2t99oYPfigi+8Eh+JBLmek=;
 b=R8usPzTt5qx2yNt0bP3pYU6Y53Jwjq5XRpKoYgvNHeQGQFFY27y0JUyh1B5BQzQ4C0Wh+S+87OjZYvvZjr+LH3A68kd3SBt/0wzcC4thcILGrXv/VAJb58cXWiNHVRMZl8BogPbgGy6BCy/OwdPkMFF9vPS1H2deY+VYS53f6ls=
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com (2603:10a6:7:55::20) by
 HE1PR0302MB2809.eurprd03.prod.outlook.com (2603:10a6:3:f1::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.25; Fri, 21 May 2021 10:25:19 +0000
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::89f0:ff95:a73a:cf4b]) by HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::89f0:ff95:a73a:cf4b%7]) with mapi id 15.20.4129.033; Fri, 21 May 2021
 10:25:19 +0000
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>,
        "michael@walle.cc" <michael@walle.cc>
CC:     linux-power <linux-power@fi.rohmeurope.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/3] gpio: regmap: Support few IC specific operations
Thread-Topic: [PATCH v2 1/3] gpio: regmap: Support few IC specific operations
Thread-Index: AQHXTgpu4aWqZZ8ASUmBHpkD9gskvKrttrqAgAACwoCAAAGhgA==
Date:   Fri, 21 May 2021 10:25:19 +0000
Message-ID: <ff905a32b736a0b03fb4c74b7e876c764a561106.camel@fi.rohmeurope.com>
References: <cover.1621577204.git.matti.vaittinen@fi.rohmeurope.com>
         <6e319c22b41747e3911c7a5cad877134cabc9231.1621577204.git.matti.vaittinen@fi.rohmeurope.com>
         <CAHp75VcZwYdA5R=peC+8jHVT6UDsAT9msSs=W6C7rgfyjGPtXA@mail.gmail.com>
         <8c048bda0ace591d7e91c07ed9155338@walle.cc>
In-Reply-To: <8c048bda0ace591d7e91c07ed9155338@walle.cc>
Reply-To: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Accept-Language: fi-FI, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.34.4 (3.34.4-1.fc31) 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none
 header.from=fi.rohmeurope.com;
x-originating-ip: [213.255.186.46]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fc304fc2-4906-4598-1f04-08d91c42bbf3
x-ms-traffictypediagnostic: HE1PR0302MB2809:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HE1PR0302MB2809E3572C9184B52A093082AD299@HE1PR0302MB2809.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NrAQ/158KFz3JKy7spNOzCa/Ak+UcAprKUv4nZ7c0x/Ed8iuHzLm3pzxt0ptWCOsgc73bNghCPkbzDGsDsDHLA4GpKMrWwoJpctFzBxOyl2Q6PtQdEcEfg5cs3raORKUe6b6lr2oj78CxabyJxpN71dHjPoDU/QPL3p3YKkVZ5Mmxgyq0ocnVrsKaxau4f8Bj/M7e5VyP4PLmqxMzipcCgCpRViqQET4kZJaGdI2rUk8oCIsn31JjeXxWuUpAHkpSiP7+Pqxw7qtvvMDmdQ00DBug8glKjtQsSXZRTxaYxxcZszcey5KLN7H2yjfdyqVbfGj+duDQDF14LADPIuh+PspbxF1s/5t5CFokZwYIwgsBO57fKgiemaRcIrC2sd3ZgNVcxnO9UPyD6EehEF/jGe1orKnH44IjlTyi6Ct4DxXxzJ2cx80KbER+i60JpxEVXDy5LSBOXBx8szsrdVAd1GGvU9ylukGvsuUbIGPNtfIekTqCdKDXJeZUjOWFxB1F7L1Yojersp+PpJjUddJH4PCcMKSQGBFsswFgc1Xt8gpO8iZ1LTtxHcJelp2nUz9ShIQr6n9HFAz49mV6jBj23vYGLtpkuwbVXRY/ZRh6LE=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR03MB3162.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39850400004)(376002)(136003)(366004)(346002)(66476007)(66556008)(64756008)(66446008)(2616005)(66946007)(26005)(86362001)(2906002)(6506007)(3450700001)(4744005)(53546011)(76116006)(8936002)(71200400001)(122000001)(5660300002)(38100700002)(6486002)(6512007)(316002)(110136005)(83380400001)(478600001)(4326008)(54906003)(186003)(8676002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?MG9nVCtaM3F4ZUJCdWtpNmxMVEVPQWxmR0NDOG5CUFNERWpvMXhCQS84OTB3?=
 =?utf-8?B?R3I1SUVabTkwaUhRYm82WFJGY01GcVhMa1JrN2ZQQWpndGZ2aG9MTTFXMGJW?=
 =?utf-8?B?N29vNlVGb0ZsdmVMYzNFM1dnd21jTjlpekdncDE2TVUzU2p2bzU4Mi9HT3FZ?=
 =?utf-8?B?MDZCUFdyVlpLRVdLZWxlZWFmRkcvemFTSkk1MUNzdWd4TlJpTi9iem1SV0p0?=
 =?utf-8?B?ZTVFc3lDNmkvaUhwenNpVmpKQm84cWdlNngzUmdseTIxekdzN0d3ME50aFBO?=
 =?utf-8?B?ejJ6QUNMcTBETkVBaDhmZDJDTHhLaWxOazdRZW9tQW90M2pTRjQ3cXZPSHp5?=
 =?utf-8?B?UjNMK1pmL01KU3k2d0RjK3ZnelQ3NElaRXZsRXV1WEJzYTBCTzd3QWd0bnRN?=
 =?utf-8?B?bjExdThvN3BJeUVsWTBtbWZuUjdGMlk5ZHVSTVZqZFJjaWVhMFViZXp4MmNo?=
 =?utf-8?B?RFN6M0JwQVhqOEFEQ3NTNFZmekpOMjZUUlRCY1NlakRrc3BqWmFHRmczVVYz?=
 =?utf-8?B?V2dYZHMxaHFodTd3S3lvb2pWOFZyay90UHhHMTFnWWZieFpkSHZ1NVBsaWRN?=
 =?utf-8?B?TytVZ2tJOUZ4M3d2ZG9VZllvWXFodEQ5dkdaU1Exa2hBUlpFMStDRmhvTEFD?=
 =?utf-8?B?c2J4UFBnd1pIKytNaTJXOEkxakRjRlk4MHNXZUZVN1ltMHRyQ0FsTHJQQ3Bs?=
 =?utf-8?B?bmx6T1dzSmFrbDlCSXRYT2dLd2tzWXZNSzRqSXVmZHdPaGRxODdTbGNnakJN?=
 =?utf-8?B?VnJ6OVFlMHNRYW1NNEtod3VuMXJTVEtOQ2ZhNDdURDg2TG9qWG1GWXRnU0hu?=
 =?utf-8?B?Y25ISWhPanZzbXJmOVVMSWVsS0FnYXRmdDhBb2xEQUk5T3hJbjZqRzUranlT?=
 =?utf-8?B?TjZLWnYvQ1pIaENnL3lxQmlQRGVlanJoS2lEYm04Ky9UZkVLWGhOSDd4Slp3?=
 =?utf-8?B?clJYQ3F3YnpTb0RPQ28wQUZxNWlMcWhHRU9TNEhZTEdkdUJRRytZazM2UXhV?=
 =?utf-8?B?VmpTb2l6dWk3dnVMWlV5bHpwcVBCTHRpVyszQUdZNkRqeVJEOFhqMWwxMWRs?=
 =?utf-8?B?ajFPd0FySzIrRWlHakxkZ21QVGxnNjk1UjkzazRSRGRDYURJWXRudDYybzhZ?=
 =?utf-8?B?Rm8ySVREVk42ZktBYmdDZUJsUEpYNEQvZDJRVEtLcmtPeEJ1eGd6c3B1WUFT?=
 =?utf-8?B?Um0vV3RxZFNlNEoyalVUSnZMaWNXaGJlaFdkaWV6ZzRzZ0MrQ002V0dkVXZM?=
 =?utf-8?B?bHlmeko0VWFDWW1tR1UyNjMwZ2F3Sk9hUkUzb0tVdzJWdXBVTnJJRUo1QjMx?=
 =?utf-8?B?c1FmWWQwOVd3K3NMOEN0WXBXUng4ZFg0aXNJMjdLbGQrUG56UjJnQTdOQUxS?=
 =?utf-8?B?NnMwL01vckRsNW9nOWIwQTZCdWVUK1RhVzYxMTdSVzZzUzhkN3hwc21CdTFo?=
 =?utf-8?B?Uzl0U21MMHJDSjhYSUVsdkdyYnhGR2J0NFE2Qm9UcDBlK1U2QWtacEVwWWhC?=
 =?utf-8?B?L09GVmQyN1VUM0tLbVpaTEVpZlFSUDBuV203ZmU0VjFzTXlTMWFnTVROVE5C?=
 =?utf-8?B?b2s4QzhMaGF1S2NaZGtLaSs5MDhwYVJIL3lCUUJXYzZhbG1jdWNMcmFsTno5?=
 =?utf-8?B?U2JnWGNSVVhwak5WZnpwVnJJQUQxNlU2UU9IQjd2TWdVVHdBRkQ5QUlnY1Fo?=
 =?utf-8?B?Tmlxa0dJcDI4d3VPTTdaTDkzZ0M2cTNXYk54NGZuYWQyd2hiQ1F5U2lHVW1y?=
 =?utf-8?B?Y3Z4R2J6dU5xN1A5dTRWZUdaamlWR2F3Z1J1MzZNVmNCa3RBMUdoZTlBbEwr?=
 =?utf-8?B?elhhcVVuS2c5b0xIWjlKUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5135B39B81082C44BBE3BB02795C87AB@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR03MB3162.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc304fc2-4906-4598-1f04-08d91c42bbf3
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2021 10:25:19.4645
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mVk/pFnOcTb2S87SPM8Zeb2KPwaAIYBbaNi2U3gZ1pDBGlWdC7OnbfdltAXTTM4tL7htsIWEmDhHn6UYe49DT7IzEP4Ab8jIwscdBpHzczL0/fbU4JthNgla0sIkFh8u
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0302MB2809
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DQpPbiBGcmksIDIwMjEtMDUtMjEgYXQgMTI6MTkgKzAyMDAsIE1pY2hhZWwgV2FsbGUgd3JvdGU6
DQo+IEFtIDIwMjEtMDUtMjEgMTI6MDksIHNjaHJpZWIgQW5keSBTaGV2Y2hlbmtvOg0KPiA+IE9u
IEZyaSwgTWF5IDIxLCAyMDIxIGF0IDEyOjUzIFBNIE1hdHRpIFZhaXR0aW5lbg0KPiA+IDxtYXR0
aS52YWl0dGluZW5AZmkucm9obWV1cm9wZS5jb20+IHdyb3RlOg0KPiA+ID4gQ2hhbmdlbG9nIHYy
OiAoYmFzZWQgb24gc3VnZ2VzdGlvbnMgYnkgTWljaGFlbCBXYWxsZSkNCj4gPiA+ICAgLSBkcm9w
IGdwaW9fcmVnbWFwX3NldF9kcnZkYXRhKCkNCj4gPiANCj4gPiBCdXQgd2h5IGRvIHdlIGhhdmUg
Z3Bpb19yZWdtYXBfZ2V0X2RydmRhdGEoKSBhbmQgd2h5IGlzIGl0DQo+ID4gZGlmZmVyZW50DQo+
ID4gbm93IHRvIHRoZSBuZXcgbWVtYmVyIGhhbmRsaW5nPw0KPiANCj4gRWcuIHRoZSByZWdfbWFz
a194bGF0ZSgpIGNhbGxiYWNrIGlzIGp1c3QgcGFzc2VkIGEgInN0cnVjdCANCj4gZ3Bpb19yZWdt
YXAqIi4NCj4gSWYgc29tZW9uZSBuZWVkcyB0byBhY2Nlc3MgcHJpdmF0ZSBkYXRhIHRoZXJlLA0K
PiBncGlvX3JlZ21hcF9nZXRfZHJ2ZGF0YSgpDQo+IGlzIHVzZWQuIEF0IGxlYXN0IHRoYXQgd2Fz
IGl0cyBpbnRlbnRpb24uDQoNCkkgd291bGQgaGVscCB0aGUgSUMgZHJpdmVyIGhlcmUgdG9vIGFu
ZCBqdXN0IGRpcmVjdGx5IHByb3ZpZGUgdGhlDQpkcnZkYXRhIHBvaW50ZXIgYXMgYXJndW1lbnQu
IEkgZG9uJ3Qgc2VlIG11Y2ggdmFsdWUgaW4gcHJvdmlkaW5nIHRoZQ0KcmVnbWFwX2dwaW8gcG9p
bnRlciBhcyBJQyBkcml2ZXIgY2FuIG5vdCBkZXJlZmVyZW5jZSBpdC4NCg0KPiANCj4gVGh1cyBJ
IHdhcyBhbHNvIHN1Z2dlc3RpbmcgdG8gdXNlICJzdHJ1Y3QgZ3Bpb19yZWdtYXAqIiBpbiB0aGUg
bmV3ZXINCj4gY2FsbGJhY2tzLg0KPiANCj4gSSBkb24ndCBnZXQgd2hhdCB5b3UgbWVhbiBieSAi
ZGlmZmVyZW50IHRvIHRoZSBuZXcgbWVtYmVyIGhhbmRsaW5nIj8NCj4gDQo+IC1taWNoYWVsDQoN
Cg==
