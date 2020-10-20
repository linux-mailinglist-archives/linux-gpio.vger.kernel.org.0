Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77B74293A40
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Oct 2020 13:48:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393554AbgJTLsg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 20 Oct 2020 07:48:36 -0400
Received: from mail-vi1eur05on2064.outbound.protection.outlook.com ([40.107.21.64]:26378
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2393521AbgJTLsg (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 20 Oct 2020 07:48:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q5W1rdcED3/MuTcYh4m0OHrKinNmj5IIy3C1LneB5yvQNmRtfKdKV5UfgqINPzjDeR5KRq6S4cWCPQn2PolAB+EyJZ9WrTRnAUAgK97dbbs74aRFox7T7BXXZbMO3BXLto87N2OVSkRQrvDh9UmieNxJK/t7oAd2VeSSrHDKfcLRqclJYAc4U1gakkT8yebaCE0zdEQUg8FGTnfObLmPG3MdCocuV3SikzSdDcC0WGFEnsqgbxiBYhMOwxlGiMbvUUilxy+pv1NPmmTPNu3gQ0Rk39qdos+ked2LdaNr2L7WTieXt8lEC8D2GiWZgtJ+sQthuK+Onw8xJHsj+uBMBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tAS+LRGzzP5sijw+GM8+qV6hEk/ovsOqDvWgp3ZOxug=;
 b=lpGL6WH9AQmERFFaBTvzzTBlnsmR/09ECCPqsFUP2Rpm8/SS/te5y7tdQ62utcTjayg1ini2Uv1eZYiOnEc6pZwm/29jyFvVYiCQVKt7IkfG0+QQ2188pZ0TH7L2LkFFy5AYwDuuxymW1rEPJuuVI98PBf/IvPQ+n5K3yDYDAcSQIJ4dPQhub/10Gm/YY5txeQj1PHMsYiCFXBS/I4V7h03B8E8gMeZTXZr3/Ruxt9SReyQV/gLmn40DKBemzPtHCo5FgFjI1yoR8X+pE1HnYrigXozR/7SUuOTKDp05oqoQN7wRRuj2U3EZ3RbvDQ14AyWyfFbrxeDfz2S+9h3vgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tAS+LRGzzP5sijw+GM8+qV6hEk/ovsOqDvWgp3ZOxug=;
 b=UH6u6P3IZnUCwdJxXxd8eNHw2koklJDqXgLszTYgAjBJyRVON2N153Qyt9l++ACsmBkbV3Yf2Ru9Z2pmeWnlrJdzXUxbfJ2X9FU1+xawfvvLNQG08HuYvdI0Upxh8h3gQbGlU6KVwsUOM6AMMvgIfMjIOhJ5gyoGUVnMOdALo3w=
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com (2603:10a6:7:55::20) by
 HE1PR0301MB2281.eurprd03.prod.outlook.com (2603:10a6:3:22::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3477.20; Tue, 20 Oct 2020 11:48:29 +0000
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::b813:5aaa:3d25:f976]) by HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::b813:5aaa:3d25:f976%3]) with mapi id 15.20.3477.028; Tue, 20 Oct 2020
 11:48:29 +0000
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "trix@redhat.com" <trix@redhat.com>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>
CC:     "joe@perches.com" <joe@perches.com>,
        linux-power <linux-power@fi.rohmeurope.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "apw@canonical.com" <apw@canonical.com>
Subject: Re: [PATCH] gpio: bd70528: remove unneeded break
Thread-Topic: [PATCH] gpio: bd70528: remove unneeded break
Thread-Index: AQHWpk7PU2Dv45hS80+h/uWqZCrO16mgRR4AgAAcGwA=
Date:   Tue, 20 Oct 2020 11:48:29 +0000
Message-ID: <0738b0cc482cfd07400cf8b0b0b2092e671cfb34.camel@fi.rohmeurope.com>
References: <20201019193353.13066-1-trix@redhat.com>
         <5b13773306265f89366b86afba71d2b4a4130e2b.camel@fi.rohmeurope.com>
In-Reply-To: <5b13773306265f89366b86afba71d2b4a4130e2b.camel@fi.rohmeurope.com>
Reply-To: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Accept-Language: fi-FI, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: baylibre.com; dkim=none (message not signed)
 header.d=none;baylibre.com; dmarc=none action=none
 header.from=fi.rohmeurope.com;
x-originating-ip: [62.78.225.252]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e2d0bd87-07d1-4307-647d-08d874ee1039
x-ms-traffictypediagnostic: HE1PR0301MB2281:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HE1PR0301MB22812E988C7E4CF1296E3324AD1F0@HE1PR0301MB2281.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7l/zyqvfk1VkOsACngRFdMvKCJOl1i3p/9swUXeSrM7rNpq2Z62exDgPreFEkZMqEWjYF81u/Nnwu43jwF2EM3NEO0oCcPpHgRRCqkwY3KBpKVKdkU8D7UeK/p61edK/i+1iePdNd9M8vIH9PHwVuVR8KdA6hmHer9U6hqDDvxgFVyFattH0h6r/NDHVMxNEB5gam/OYcA/10EXbJQIeLzo1UweBt+uYlakAiPuAeQVlfam5d55W2AQn0nRDvWXHGhC103z1LPmgC21DDwSqIJXOxlbNp2VE6JDwu4yN3DACJneeVGTxvdL+/g+ag1M008ut+4WdIj1ow/dYXZg60w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR03MB3162.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(376002)(346002)(39850400004)(396003)(6486002)(4001150100001)(6512007)(64756008)(66476007)(66446008)(6506007)(26005)(76116006)(66946007)(8936002)(8676002)(316002)(5660300002)(66556008)(2616005)(110136005)(71200400001)(186003)(4326008)(86362001)(478600001)(2906002)(54906003)(3450700001)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: qtZRdKj73HvudcyTb0cFz0/6PbFDmfGEEHVY2bdL4bF/gJ7v/OPs09LnBl35qXi8TggU9FowR5DVCAYqxXs18IgDsPqdZSimDN4VJdHMqgIuriR5lE2OhOyqZu18cARlVTWqvgZbCEUsll28+Uaa+Jqx2ene5gIYVgtqgZ8SFX58gseJCQML7Z+Lgd13UIbkKHzoyHZHAXoYhYZSfYpfd8GpjYUcjmTrequi0dFJaV/h4mj60FxferKGMDdYMAkmMmeOXnUVeDd978K6cti3YgR3Kxwy0fgZ+6FU/DvFSAVnqPVYLnWgsiqf5hdS7cXWfNi2X7VFurn+zjXh7vEWruENb8ZxA99GykUtgZHZDgW1fA4vbQFFUrrdq0/lMClwtgedmG7nQ617U5+RRv6szB2zw7ai4BrOBgsDWMTIlYUMfsM++luDSp05e4h/ALacxua7jqdr6Uux2Ib2pvrLkHG1LEaU9J7UAzW50B8P44vUD/mrfWmF3jc44x0xUEgw3RFZ+dALm5nML1HPl0bTlQt07hSS4IT+87qm94DNqo45qWysvIMJR6S+TNurHQIIoG0TPJ0fLArojcTyLf982Hbd9ozNk1eOf1qYHtCFQSOsqrn5TXcIxYlOpwYejV03D+Z2VfAeJepCMI9IdWqf/Q==
Content-Type: text/plain; charset="utf-8"
Content-ID: <262EB53938E33C449AF33EBD709C3C3B@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR03MB3162.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2d0bd87-07d1-4307-647d-08d874ee1039
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2020 11:48:29.4931
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5p9AxjoBgNl48Lw6KiJIi5omFnbzj3Sn1ml16yTXSWBzg3bPnEC+if0HFDZ1MJP38pueWbxsTnYc0qnGpVQ1ZC3kXP0uZnDVIcDW5zJFZBMAaJFXugA7WhJw2hz+XLPZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0301MB2281
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

T24gVHVlLCAyMDIwLTEwLTIwIGF0IDEzOjA3ICswMzAwLCBNYXR0aSBWYWl0dGluZW4gd3JvdGU6
DQo+IFRoYW5rcyBUb20sDQo+IA0KPiBPbiBNb24sIDIwMjAtMTAtMTkgYXQgMTI6MzMgLTA3MDAs
IHRyaXhAcmVkaGF0LmNvbSB3cm90ZToNCj4gPiBGcm9tOiBUb20gUml4IDx0cml4QHJlZGhhdC5j
b20+DQo+ID4gDQo+ID4gQSBicmVhayBpcyBub3QgbmVlZGVkIGlmIGl0IGlzIHByZWNlZGVkIGJ5
IGEgcmV0dXJuDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogVG9tIFJpeCA8dHJpeEByZWRoYXQu
Y29tPg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL2dwaW8vZ3Bpby1iZDcwNTI4LmMgfCAzIC0tLQ0K
PiA+ICAxIGZpbGUgY2hhbmdlZCwgMyBkZWxldGlvbnMoLSkNCj4gPiANCj4gPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncGlvL2dwaW8tYmQ3MDUyOC5jIGIvZHJpdmVycy9ncGlvL2dwaW8tDQo+ID4g
YmQ3MDUyOC5jDQo+ID4gaW5kZXggNDViM2RhOGRhMzM2Li45MzFlNTc2NWZlOTIgMTAwNjQ0DQo+
ID4gLS0tIGEvZHJpdmVycy9ncGlvL2dwaW8tYmQ3MDUyOC5jDQo+ID4gKysrIGIvZHJpdmVycy9n
cGlvL2dwaW8tYmQ3MDUyOC5jDQo+ID4gQEAgLTcxLDE3ICs3MSwxNCBAQCBzdGF0aWMgaW50IGJk
NzA1MjhfZ3Bpb19zZXRfY29uZmlnKHN0cnVjdA0KPiA+IGdwaW9fY2hpcCAqY2hpcCwgdW5zaWdu
ZWQgaW50IG9mZnNldCwNCj4gPiAgCQkJCQkgIEdQSU9fT1VUX1JFRyhvZmZzZXQpLA0KPiA+ICAJ
CQkJCSAgQkQ3MDUyOF9HUElPX0RSSVZFX01BU0ssDQo+ID4gIAkJCQkJICBCRDcwNTI4X0dQSU9f
T1BFTl9EUkFJTik7DQo+ID4gLQkJYnJlYWs7DQo+IE15IHBlcnNvbmFsIHRhc3RlIGlzIGFsc28g
dG8gb21pdCB0aGVzZSBicmVha3MgYnV0IEkgYW0gcHJldHR5IHN1cmUgSQ0KPiBzYXcgc29tZSB0
b29saW5nIGlzc3VpbmcgYSB3YXJuaW5nIGFib3V0IGZhbGxpbmcgdGhyb3VnaCB0aGUgc3dpdGNo
LQ0KPiBjYXNlIGJhY2sgd2hlbiBJIHdyb3RlIHRoaXMuIE1vc3QgcHJvYmFibHkgY2hlY2twYXRj
aCBkaWRuJ3QgbGlrZQ0KPiB0aGF0DQo+IGJhY2sgdGhlbi4NCg0KSSBkaWQgYSB0ZXN0IGFuZCBy
ZW1vdmVkIHRoZSBicmVha3MuIFRoZW4gSSBjb3BpZWQgdGhlIG1vZGlmaWVkIGZpbGUgdG8NCmRy
aXZlcnMvZ3Bpby9kdW1teS5jDQpOZXh0IEkgY29tbWl0dGVkIHRoaXMgZHVtbXkuYyBpbiBnaXQs
IHJhbiBnaXQtZm9ybWF0LXBhdGNoIC1zIGFuZA0KZmluYWxseSByYW4gdGhlIGNoZWNrcGF0Y2gg
b24gdGhpcy4uLiBGb2xsb3dpbmcgd2FzIHByb2R1Y2VkOg0KDQoNClttdmFpdHRpbkBsb2NhbGhv
c3QgbGludXhdJCBzY3JpcHRzL2NoZWNrcGF0Y2gucGwgMDAwMS1ncGlvLWFkZC0NCmR1bW15LnBh
dGNoIA0KVHJhY2ViYWNrIChtb3N0IHJlY2VudCBjYWxsIGxhc3QpOg0KICBGaWxlICJzY3JpcHRz
L3NwZHhjaGVjay5weSIsIGxpbmUgNiwgaW4gPG1vZHVsZT4NCiAgICBmcm9tIHBseSBpbXBvcnQg
bGV4LCB5YWNjDQpJbXBvcnRFcnJvcjogTm8gbW9kdWxlIG5hbWVkIHBseQ0KV0FSTklORzogYWRk
ZWQsIG1vdmVkIG9yIGRlbGV0ZWQgZmlsZShzKSwgZG9lcyBNQUlOVEFJTkVSUyBuZWVkDQp1cGRh
dGluZz8NCiMxNTogDQpuZXcgZmlsZSBtb2RlIDEwMDY0NA0KDQpXQVJOSU5HOiBQb3NzaWJsZSBz
d2l0Y2ggY2FzZS9kZWZhdWx0IG5vdCBwcmVjZWRlZCBieSBicmVhayBvcg0KZmFsbHRocm91Z2gg
Y29tbWVudA0KIzkxOiBGSUxFOiBkcml2ZXJzL2dwaW8vZHVtbXkuYzo3MjoNCisJY2FzZSBQSU5f
Q09ORklHX0RSSVZFX1BVU0hfUFVMTDoNCg0KV0FSTklORzogUG9zc2libGUgc3dpdGNoIGNhc2Uv
ZGVmYXVsdCBub3QgcHJlY2VkZWQgYnkgYnJlYWsgb3INCmZhbGx0aHJvdWdoIGNvbW1lbnQNCiM5
NjogRklMRTogZHJpdmVycy9ncGlvL2R1bW15LmM6Nzc6DQorCWNhc2UgUElOX0NPTkZJR19JTlBV
VF9ERUJPVU5DRToNCg0KdG90YWw6IDAgZXJyb3JzLCAzIHdhcm5pbmdzLCAyMjkgbGluZXMgY2hl
Y2tlZA0KDQpOT1RFOiBGb3Igc29tZSBvZiB0aGUgcmVwb3J0ZWQgZGVmZWN0cywgY2hlY2twYXRj
aCBtYXkgYmUgYWJsZSB0bw0KICAgICAgbWVjaGFuaWNhbGx5IGNvbnZlcnQgdG8gdGhlIHR5cGlj
YWwgc3R5bGUgdXNpbmcgLS1maXggb3IgLS1maXgtDQppbnBsYWNlLg0KDQowMDAxLWdwaW8tYWRk
LWR1bW15LnBhdGNoIGhhcyBzdHlsZSBwcm9ibGVtcywgcGxlYXNlIHJldmlldy4NCg0KTk9URTog
SWYgYW55IG9mIHRoZSBlcnJvcnMgYXJlIGZhbHNlIHBvc2l0aXZlcywgcGxlYXNlIHJlcG9ydA0K
ICAgICAgdGhlbSB0byB0aGUgbWFpbnRhaW5lciwgc2VlIENIRUNLUEFUQ0ggaW4gTUFJTlRBSU5F
UlMuDQoNCkkgZ3Vlc3MgdGhhdCBleHBsYWlucyB0aGUgb2RkICJmYWxsdGhyb3VnaCIgY29tbWVu
dHMgeW91IG1lbnRpb25lZCBpbg0KYW5vdGhlciBlbWFpbC4gSSBndWVzcyB0aGUgY2hlY2twYXRj
aCBzaG91bGQgYmUgZml4ZWQgYmVmb3JlIHlvdSBwdXQNCnRvbyBtdWNoIGVmZm9ydCBpbiBjbGVh
bi11cC4uLg0KDQoNCkFuZCBmb3IgcGVlcHMgd2hvIGhhdmUgbm90IGJlZW4gZm9sbG93aW5nIC0g
Zm9sbG93aW5nIGZ1bmN0aW9uIHRyaWdnZXJzDQp0aGUgY2hlY2twYXRjaCBlcnJvciBhYm92ZToN
Cg0Kc3RhdGljIGludCBiZDcwNTI4X2dwaW9fc2V0X2NvbmZpZyhzdHJ1Y3QgZ3Bpb19jaGlwICpj
aGlwLCB1bnNpZ25lZCBpbnQNCm9mZnNldCwNCgkJCQkgICB1bnNpZ25lZCBsb25nIGNvbmZpZykN
CnsNCglzdHJ1Y3QgYmQ3MDUyOF9ncGlvICpiZGdwaW8gPSBncGlvY2hpcF9nZXRfZGF0YShjaGlw
KTsNCg0KCXN3aXRjaCAocGluY29uZl90b19jb25maWdfcGFyYW0oY29uZmlnKSkgew0KCWNhc2Ug
UElOX0NPTkZJR19EUklWRV9PUEVOX0RSQUlOOg0KCQlyZXR1cm4gcmVnbWFwX3VwZGF0ZV9iaXRz
KGJkZ3Bpby0+Y2hpcC5yZWdtYXAsDQoJCQkJCSAgR1BJT19PVVRfUkVHKG9mZnNldCksDQoJCQkJ
CSAgQkQ3MDUyOF9HUElPX0RSSVZFX01BU0ssDQoJCQkJCSAgQkQ3MDUyOF9HUElPX09QRU5fRFJB
SU4pOw0KCWNhc2UgUElOX0NPTkZJR19EUklWRV9QVVNIX1BVTEw6DQoJCXJldHVybiByZWdtYXBf
dXBkYXRlX2JpdHMoYmRncGlvLT5jaGlwLnJlZ21hcCwNCgkJCQkJICBHUElPX09VVF9SRUcob2Zm
c2V0KSwNCgkJCQkJICBCRDcwNTI4X0dQSU9fRFJJVkVfTUFTSywNCgkJCQkJICBCRDcwNTI4X0dQ
SU9fUFVTSF9QVUxMKTsNCgljYXNlIFBJTl9DT05GSUdfSU5QVVRfREVCT1VOQ0U6DQoJCXJldHVy
biBiZDcwNTI4X3NldF9kZWJvdW5jZShiZGdwaW8sIG9mZnNldCwNCgkJCQkJICAgIHBpbmNvbmZf
dG9fY29uZmlnX2FyZ3VtZW50KA0KY29uZmlnKSk7DQoJZGVmYXVsdDoNCgkJYnJlYWs7DQoJfQ0K
CXJldHVybiAtRU5PVFNVUFA7DQp9DQoNCg0KQmVzdCBSZWdhcmRzDQoJTWF0dGkgVmFpdHRpbmVu
DQoNCg==
