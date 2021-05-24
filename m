Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D51D838E094
	for <lists+linux-gpio@lfdr.de>; Mon, 24 May 2021 07:02:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229584AbhEXFD3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 May 2021 01:03:29 -0400
Received: from mail-db8eur05on2043.outbound.protection.outlook.com ([40.107.20.43]:32261
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229633AbhEXFD3 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 24 May 2021 01:03:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j3AU0jRlPWDBFn+DKvU29IRj6foQJAuYMP7egKu9Lp+zhybPGvVzJVGjyiuw6GjkkPM2OyBnXx9aKJBQE00zjC9XhOfU4TKw+YBGmqp4wUoB91HrO36nzCHzeyVuQNJn57PBwTqOLHzMrQc/eRj5tywr25ZpXTW/XUCze5nBU9BcUJojfesT4e6TSEEBS7rym932Un7SpZSaGqyLV9QdCPd3bvbSGBnhtX4fIDqeWosluv80TcBM+S8ul8Z3ndhQoaTs1ux1ThQnYmx+ohLYR+e/hocJSYfkio+aeu+4ddttLQewJDc6JMBT28MQcaqZhSSLjhDhm2QQNPdzV5f5dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W7rN63gQr1DMHj8E4KjUtzsrMNHeVxGSz15ZgaAH2yE=;
 b=JMNIi+4Sx0lGWEaRLNGDOf719GdINVbOhq+naaOmpoRjbjEZQZfmhbS8QGlXjlTuGCV2fnuIUrDCxYK4i8Df4NVITvqejS0BI8d5pMLSNxc7nNpzNZLMyIrvb/OZDjNpwS5wKsZasAC17BYf14cNkvrHM2d4gMht/UG5Gkgvtgn51UYrYWKMBT7uZ4gTj1EQB1LQuEnkPf9zrignJD5aEBlP+rtBLeZqNYIHls7yLvPZGk5z3WJ/3jJPWYGzkqQO7vYHaY1ph6t+Lqtto3poM/s3GJxxd3HVK49ggsSe8LVZwyfBv7TB/rrPdlQY1Ux8/uoDEmtE+yZIVZdAqwOEpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W7rN63gQr1DMHj8E4KjUtzsrMNHeVxGSz15ZgaAH2yE=;
 b=NWVkDfyOX2nIDFdINFyE5ZaacYg/2Ejn0ZvSxGj9jD0lytCfLTGmihdU5XkhklTSx34PATP7XYCfwPlgLDkogAkqjL3NnKIvV1USldnZ5z4Qv+DM69SJZi+/IPsobtGabT8x+rSvJfCItFBANaA/bJlYJBg2j8n4DRo6IBJNSIo=
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com (2603:10a6:7:55::20) by
 HE1PR0301MB2313.eurprd03.prod.outlook.com (2603:10a6:3:27::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.23; Mon, 24 May 2021 05:01:59 +0000
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::89f0:ff95:a73a:cf4b]) by HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::89f0:ff95:a73a:cf4b%7]) with mapi id 15.20.4150.027; Mon, 24 May 2021
 05:01:59 +0000
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>
CC:     linux-power <linux-power@fi.rohmeurope.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "michael@walle.cc" <michael@walle.cc>,
        "bjorn@mork.no" <bjorn@mork.no>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 2/3] gpio: gpio-regmap: Use devm_add_action()
Thread-Topic: [PATCH v2 2/3] gpio: gpio-regmap: Use devm_add_action()
Thread-Index: AQHXTgqFqSIUt187g0WoCKnHHDOZNartlX2AgAAH2AmAAB8rgIAAZiIAgAP1IQA=
Date:   Mon, 24 May 2021 05:01:59 +0000
Message-ID: <cf42e001f0c0cdec382419acd8edfc0088f08c96.camel@fi.rohmeurope.com>
References: <cover.1621577204.git.matti.vaittinen@fi.rohmeurope.com>
         <e3d3e704804668d1403f3630c181010b34409c8f.1621577204.git.matti.vaittinen@fi.rohmeurope.com>
         <12bb40f022be0378ed493e7ad33122b0@walle.cc>
         <87a6ooh46s.fsf@miraculix.mork.no>
         <d6bb1e458d5aa6a32f31f7731e1a6097a225d634.camel@fi.rohmeurope.com>
         <CAMpxmJXkYZ7mZA426Jgm_zL+L1ZFB1ToRf2L8oGmyBuOHQo=UQ@mail.gmail.com>
In-Reply-To: <CAMpxmJXkYZ7mZA426Jgm_zL+L1ZFB1ToRf2L8oGmyBuOHQo=UQ@mail.gmail.com>
Reply-To: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Accept-Language: fi-FI, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.34.4 (3.34.4-1.fc31) 
authentication-results: baylibre.com; dkim=none (message not signed)
 header.d=none;baylibre.com; dmarc=none action=none
 header.from=fi.rohmeurope.com;
x-originating-ip: [2001:14ba:16e2:8300::4]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fcd75ee0-427e-4e51-bc7e-08d91e710fe4
x-ms-traffictypediagnostic: HE1PR0301MB2313:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HE1PR0301MB2313C4D77FBC40174CB1B334AD269@HE1PR0301MB2313.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PRYLuSVsRaGUKBPhfFKy6EUjnOXYjigwSEZqYUfDgMzd4apGvWerqByGiuI6FBBYn9lGeVwRxGfHaJT+NaIyWfga450wN5K5yj1y9SAXHSUnH7c4fV5no7WfyoNEeVG8V0k9crMhLcvxWGNrks0BsocNnloQBUFuBOFrWl1/+IXUY+eOt0Cw+XC+MJq/SIud/2s3bqlFso7Ov7LlSsOhBWC9UjEj9xVVgZLkv0THK7Z1s9Ps1SPiVJjB3jnFGBTMKj/UH12kIvnxZhEC62Hu4HTAdMRU1stm+uuIsySviFpeO3SFgTM5TEM4C+N6EVys5Sz4CAtdA4ilpyqwObO23a9zd8hq1gKaUqmGWBvFQ7/9hPWX36Bjq+sUtuDwZevtZgPbjDOlw4evE1nO5UGKwoM8JZpSHEvR+Ct/5oqCrclV49ewgz33YNagFMXomwB9+qZkYR29WABJbsdsoZ2fUGWdV7yJxbfZ9EGO09y9wfJOU0dnXIDU3svvHD7OPyFcnc/uxVMw34kDFeisMr/9wa7D8SCCDky8MlHAmFO2Tcsazh4VnKdiK9zL1vB8EqsETSMbmTJ33rinEr70u/EN5GkRkgIUgl0CP1tjlVjPv8Q=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR03MB3162.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(396003)(136003)(39830400003)(366004)(66946007)(66556008)(316002)(64756008)(66476007)(66446008)(54906003)(5660300002)(478600001)(2906002)(6486002)(4326008)(186003)(6916009)(3450700001)(76116006)(66574015)(2616005)(8676002)(6506007)(86362001)(38100700002)(6512007)(83380400001)(71200400001)(8936002)(122000001)(53546011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?MHRGT3krVUMxditaZUJsMnNNRDZqb0xab2g5Wk96WVU3c0tXekNBVlpwaW44?=
 =?utf-8?B?SDFqRjNuc0Z4Y1UxbGJlbGxzczBCOXlXUHJzQXhRM3hLK29WQjJhcjB5dDAr?=
 =?utf-8?B?dStoL0llUnN2MlY1K3p5RkgyaEI3bWhGV1Zaa3hlcUJLTW1LNHpoTzMvQldp?=
 =?utf-8?B?czVxZ0ZFNnlRbmFtMTF0aVhOVzFZT1RNU1l1dUpjb3Nvb3lmS1N1S1lTdlh4?=
 =?utf-8?B?emEzaGtYbmNhTkNBaXcrWWkzOHE3Y2YzMzdLRHdjYlpyY1FWMGdSaFYybVEz?=
 =?utf-8?B?MVlaNlNJRmZIdjNSRnh1c1MwNGluYTdNN0xUY0N6aWVaSW53ck5qZ3lPTVRH?=
 =?utf-8?B?Tm0yZlp1aGQwWm1IN0lSTEdpL08ySzNNQXZtYWNnY1FaVEsrbHFiR2NzaE1u?=
 =?utf-8?B?eUZGQlZmdkNjaWtKV0xIcEVnYTNTWFJNL2I3NnFLL1M5YUhLUlRJc05Mc1VX?=
 =?utf-8?B?N0lXT3pVYTZydHhQY2pVVTNNQUoxNGtScGJrTi9FYWtrQUk2eVdXZmxVNEtq?=
 =?utf-8?B?VzA2aTV1TjNZWGhhbm9MZmFVTXdBSE5JcTJWZHovNlEzRVVTWlBWT1RrbEx2?=
 =?utf-8?B?L0pKSTY0R2EzTVRqWFhyWDlwK25GOFI1RWQxcWNpd3VFWngwQUJIUVhScENH?=
 =?utf-8?B?blZ4bzR2VGFvN0dhUjFocUVzdlAwSlVYSFJTay9kTUhiSXNKUmZPN0d0cUpP?=
 =?utf-8?B?aEwzTkxNK2hmS1JZY0dLcFFEVUV6Wlh2ZktXWnpmSDNwN0J4YXB4UDkyLzJN?=
 =?utf-8?B?ZkZlc2gxbnozNkU3N2tBWXJibHN2YzZwb0lOaGlZZmh6ZjRkZmJQR2xmY05a?=
 =?utf-8?B?d0JPMnFweldtczdIaHR6N0Qram5HQVE2Q0dFMEU2UDZBd3N4WnlzcEZRTERV?=
 =?utf-8?B?d0FlRlRra0gwVlhqUEgyaWlzK0dleHJMeVNQTjdPUGhjNlJkYW90akhFVmF5?=
 =?utf-8?B?RDlZLzlqZ2x2SkdSR3VrUk9MK0U5dXQwZE1oSllJMU1laTZvckp1eHh5WVhJ?=
 =?utf-8?B?RmdHWm5XV1NGQ1VOR0dwTXBTK1lSc0l4MldWcFRnWTJac3dxcDVDWnVtODM4?=
 =?utf-8?B?U2NnWHBMNHFGYU1qc2lOTGV0d1BMUFQ0ejBlVDFOY0pEb3FZV3Jia2hZNUJi?=
 =?utf-8?B?a3J1QlBpNDUxSThsdmgxOWtsY1QrQ295K2hJeHZNUHJ6NDVHZC9aLzZmcHZW?=
 =?utf-8?B?RFdGYzNmeHI4Smx0L0IxZ3lkTGJtUmYyYVIvbyt3czZRTG02US9VTzNaNlhm?=
 =?utf-8?B?RnBYRnR3SHZqajkzc1U4dG5CTDlOREJYU01yTXVSOGJKdGk5YzBsR1NvM2NM?=
 =?utf-8?B?anhvNkQ5QmxXbHc1VitGTTRnbVUzYjVYTHBWUUFkTlQvUmtNcS85TExzR1V6?=
 =?utf-8?B?a0JMbllzdVk4RzduRnQzLzJ4azVYNEJ0NXZicGtlbWZxaHc3aEd3YTBqWnli?=
 =?utf-8?B?UXp0YlduRzZjcG10dk04WWJOdjl6RjFRWkVoL1RzdmtSRHZ3bGU2dGdsRHg5?=
 =?utf-8?B?T0pwdXJOeDZ0aUpDbjQ1b0xoU1ZqSml6OUtqWUpXejIyWEhyQWFRbndiS0pu?=
 =?utf-8?B?Y1lWS0tOcjR2OFQ4cG4yenlYbm9OcUpDK3d3Q05KSUZVVUxCbmRWcklRSVFh?=
 =?utf-8?B?eHhuNU5ZajFtakNqTlRUdUQ3Uy92a0xISzhiTHcrNXJURFlPeGpBWEhXSHEr?=
 =?utf-8?B?aTNsZ2NSVCtQcjY3T212SDE2QTBJb01ITklDN2FUb2drUmZOMHVxOSszYnBK?=
 =?utf-8?B?bm5lK21MV05hWVdKT0Nuem5abUF2ZVUzVXFYWmdGVkkzZ0JVS1hLQU8yWVZI?=
 =?utf-8?Q?LY69JHP3AeUIiBAxaEfnWb3X6ZWZ1Mv4xFZo0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5976AE6B3C5DCB448DBD1B2A1478E7A0@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR03MB3162.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcd75ee0-427e-4e51-bc7e-08d91e710fe4
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 May 2021 05:01:59.4176
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BbdzzIHfMA5mhq2jREHy1XJck5quLKGOqO1Qt8/cNRHGc7JtvLR3RKD153755sI1qbFTF+Kt0N1uhzI+15q3LP93m1SGN3S0wFohbzT2WM3OubPcgPD98rhE6zwDE2oH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0301MB2313
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

TW9ybmluZyBmb2xrcyENCg0KT24gRnJpLCAyMDIxLTA1LTIxIGF0IDE4OjM1ICswMjAwLCBCYXJ0
b3N6IEdvbGFzemV3c2tpIHdyb3RlOg0KPiBPbiBGcmksIE1heSAyMSwgMjAyMSBhdCAxMjozMSBQ
TSBWYWl0dGluZW4sIE1hdHRpDQo+IDxNYXR0aS5WYWl0dGluZW5AZmkucm9obWV1cm9wZS5jb20+
IHdyb3RlOg0KPiA+IA0KPiA+IE9uIEZyaSwgMjAyMS0wNS0yMSBhdCAxMDozOCArMDIwMCwgQmrD
uHJuIE1vcmsgd3JvdGU6DQo+ID4gPiBNaWNoYWVsIFdhbGxlIDxtaWNoYWVsQHdhbGxlLmNjPiB3
cml0ZXM6DQo+ID4gPiANCj4gPiA+ID4gQW0gMjAyMS0wNS0yMSAwODoyOCwgc2NocmllYiBNYXR0
aSBWYWl0dGluZW46DQo+ID4gPiA+ID4gU2xpZ2h0bHkgc2ltcGxpZnkgdGhlIGRldm1fZ3Bpb19y
ZWdtYXBfcmVnaXN0ZXIoKSBieSB1c2luZw0KPiA+ID4gPiA+IHRoZQ0KPiA+ID4gPiA+IGRldm1f
YWRkX2FjdGlvbigpLg0KPiA+ID4gPiANCj4gPiA+ID4gDQo+ID4gPiBZb3Ugc2hvdWxkIHByb2Jh
Ymx5IHVzZSB0aGUgZGV2bV9hZGRfYWN0aW9uX29yX3Jlc2V0KCkgd3JhcHBlcg0KPiA+ID4gaGVy
ZQ0KPiA+ID4gdG9vLA0KPiA+ID4gY2F0Y2hpbmcgdGhlIHVubGlrZWx5IGRldm1fYWRkX2FjdGlv
bigpIGFsbG9jIGZhaWx1cmUuDQo+ID4gPiANCj4gPiANCj4gPiBJIHdhcyB0aGlua2luZyBvZiBp
dCBidXQgYXMgdGhlIGdwaW8gcmVnaXN0cmF0aW9uIHN1Y2NlZWRlZCBJIHdhcw0KPiA+IHRoaW5r
aW5nIHRoYXQgd2UgY291bGQgZ28gb24gd2l0aCBpdCAtICh3aGljaCBtZWFucyB3ZSBjYW4gcHJv
Y2VlZA0KPiA+IGJ1dA0KPiA+IHRoZSBncGlvIGlzIG5ldmVyIHJlbGVhc2VkLikNCj4gPiANCj4g
PiBJIGFtIG5vdCBzdXJlIGhvdyBtdWNoIGRpZmZlcmVuY2UgaXQgbWFrZXMgaW4gdGhlIGNhc2Ug
b2Ygc21hbGwNCj4gPiBhbGxvYw0KPiA+IGZhaWx1cmUgOykNCj4gPiANCj4gPiBCdXQgYXMgaXQg
c2VlbXMgSSBhbSBpbiBhbnkgY2FzZSByZS1zcGlubmluZyB0aGlzIEkgY2FuIGNoYW5nZSB0aGlz
DQo+ID4gdG8NCj4gPiB0aGUgZGV2bV9hZGRfYWN0aW9uX29yX3Jlc2V0KCkgYW5kIGZhaWwgdGhl
IGdwaW9fcmVnbWFwDQo+ID4gcmVnaXN0cmF0aW9uIGlmDQo+ID4gYWxsb2MgZmFpbHMuDQo+ID4g
DQo+ID4gQmVzdCBSZWdhcmRzDQo+ID4gICAgICAgICBNYXR0aSBWYWl0dGluZW4NCj4gDQo+IEhp
IE1hdHRpLA0KPiANCj4gUGxlYXNlIHVzZSB0aGUgcmVzZXQgdmFyaWFudC4gV2UgYWx3YXlzIHdh
bnQgdG8gcm9sbC1iYWNrIHRoZSBjaGFuZ2VzDQo+IGRvbmUgaW4gYSBmdW5jdGlvbiBiZWZvcmUg
dGhlIGZhaWx1cmUgYW5kIHByb3BhZ2F0ZSB0aGUgZXJyb3IgY29kZS4NCg0KUmlnaHQuIEknbGwg
ZG8gdGhhdC4gSSBob3BlIHRvIGJlIGFibGUgdG8gcmUtc3BpbiB0aGlzIHRvZGF5Lg0KDQpCZXN0
IFJlZ2FyZHMNCgktLSBNYXR0aQ0K
