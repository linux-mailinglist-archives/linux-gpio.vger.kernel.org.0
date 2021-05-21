Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EF0F38C5C8
	for <lists+linux-gpio@lfdr.de>; Fri, 21 May 2021 13:36:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231550AbhEULiI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 May 2021 07:38:08 -0400
Received: from mail-eopbgr80082.outbound.protection.outlook.com ([40.107.8.82]:20354
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229991AbhEULiI (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 21 May 2021 07:38:08 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xw8zKOuIBQLqTT1OLoSHH8hwLPevobf0IZqbpVA1BTbXpK6p3C+gVPf/vWz7QfEfPn8X+A3xEmBI730l68mOoZj/2tz4dFgpIsAxhBXoBmmyu9isqwzS0ug3L3f7tB3j43sOPue1csMdhUj1DIn1s0egoXFsOpAF/QTzxi6PCwjM7X02Ts1NXkLmc0z6PQmqgnXz6kItZOMUan50alO1pRPhox4/L2rKLI477XGvIgSkh3+MQhS7VbSFXV6Bl0o2txTUF51uWZVZwVRKQF6SO2HHjWSwkrxeKEpFpLbo6oZM4y/lPhLoJ2m1dyM1G3f6Tr20Z0QQZvTE/s0CedFpkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ghSjFqCxFAJJHvdwUrBZT1Go2tVfcpEE3lx3OjyOHfU=;
 b=Oiz/UysHZvbH8T/AJP6X5p1dIehdaZ+J/KCKOzaokECdrvP8do0/FKYLXwCY9VMKsAAiOCpRLJnDvAwpXziXdFzDf78dAKl2YxhcT8VcCBAnhczRFcX47xaEf3GSAa6sJNrrPq+V4oRINp9jrjRin+t4JN/MVnUJW58rqOm/3LR39CXx6Ed8ehF7w2i4uAWQPALmJW4/LoEFnsXwZU8aUz7yZcefyMjQvaF0t3UZdoxGeDO9TkEhLjqyb8xOPKO2AGDv/g7X1ZPDXqDw2SCMMp+ae/BDvi2dcCcIt5Ko9lGDZQXvVzJgbvWcu7Qe55DdhxnHcTzXc+ntkxlJ17qIrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ghSjFqCxFAJJHvdwUrBZT1Go2tVfcpEE3lx3OjyOHfU=;
 b=fPmiP+SYAKWROScflyvk9doQOzsMKD5q1gf2zHEDCIKn6ROoohpGgcZJgkfsfXd61zACgZYBWiupT43m8TnMWIVAEREfpyWpZ8qauFj9PWVn4+LamtxtoMCNGgoxaXJsnCmohDIOBUBWC4riIBTUF+/AQ6sVfUt8FJ5l11+5irI=
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com (2603:10a6:7:55::20) by
 HE1PR0302MB2812.eurprd03.prod.outlook.com (2603:10a6:3:f6::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.28; Fri, 21 May 2021 11:36:41 +0000
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::89f0:ff95:a73a:cf4b]) by HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::89f0:ff95:a73a:cf4b%7]) with mapi id 15.20.4129.033; Fri, 21 May 2021
 11:36:34 +0000
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "michael@walle.cc" <michael@walle.cc>
CC:     "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>,
        linux-power <linux-power@fi.rohmeurope.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/3] gpio: regmap: Support few IC specific operations
Thread-Topic: [PATCH v2 1/3] gpio: regmap: Support few IC specific operations
Thread-Index: AQHXTgpu4aWqZZ8ASUmBHpkD9gskvKrttrqAgAACwoCAAAGhgIAABeqAgAAN/gA=
Date:   Fri, 21 May 2021 11:36:34 +0000
Message-ID: <1108a03d71db6d28fa78300b58416308ecacfa5e.camel@fi.rohmeurope.com>
References: <cover.1621577204.git.matti.vaittinen@fi.rohmeurope.com>
         <6e319c22b41747e3911c7a5cad877134cabc9231.1621577204.git.matti.vaittinen@fi.rohmeurope.com>
         <CAHp75VcZwYdA5R=peC+8jHVT6UDsAT9msSs=W6C7rgfyjGPtXA@mail.gmail.com>
         <8c048bda0ace591d7e91c07ed9155338@walle.cc>
         <ff905a32b736a0b03fb4c74b7e876c764a561106.camel@fi.rohmeurope.com>
         <26eb6b95805840dca05e0135e0555b42@walle.cc>
In-Reply-To: <26eb6b95805840dca05e0135e0555b42@walle.cc>
Reply-To: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Accept-Language: fi-FI, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.34.4 (3.34.4-1.fc31) 
authentication-results: walle.cc; dkim=none (message not signed)
 header.d=none;walle.cc; dmarc=none action=none header.from=fi.rohmeurope.com;
x-originating-ip: [213.255.186.46]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ca064741-e260-4af3-e7fe-08d91c4cb042
x-ms-traffictypediagnostic: HE1PR0302MB2812:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HE1PR0302MB28122133FA2FAF02C8BCFD2DAD299@HE1PR0302MB2812.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zQIUUhgK898J4PGMbvDzmj8VPhMRXo/64+nXqT4VBwHITh9ApxSdIEjXsl6j20V4+2yHll4VnBYqKmto38bvAsoTdzYLAG91o16D2nMVlYMgLkyIXucStOe+ekva9n7ksXS/JThg+5GzzA5UUo+lxe+h3ouvVEk1k/WPBxi5vpe/Rfy6tag0R2WIdMuS7HIYD5Cj/7zVZ+QTUvMLSCc15V8MLygNizKZyHAPKPU4az8mKsK23J4byrPbGzh/JCXeG5g9NeMTnCZRxpFlbTbuoqF95x8mvs6AwbEnTEjQjIZGnKnByikEPCNKD2LvOLD4EnxJJNazNKNwPKZhbAjc0zpCA+j7tXsU0BNsqRXwLFEewPn179stu/S7ZsALsBvebgADVxol+QI1arcJWyX4z7p5rSFEr/AaccSPdKRmB4yL/74zG2Q6zA4EoHpHLIKAorjM42mpxhVF4K/DOxIvN2AHbmfHu+9cntFuQE/eVGIICp3FCHUDfBa2fSKo2QnqvKcAoKyheLfEbBIVjwT5xatSZCQO7YHvjGBOmv+C3QYqI5vDtWK1c48gob0G8xqQIQsJth4Q8bxG/3J/Q4YpY9/LA+VsFr65BcTs7SJL3hk=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR03MB3162.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(39830400003)(396003)(376002)(136003)(6916009)(71200400001)(66556008)(38100700002)(54906003)(53546011)(26005)(6506007)(66946007)(5660300002)(83380400001)(66476007)(478600001)(66446008)(86362001)(8676002)(8936002)(64756008)(316002)(122000001)(3450700001)(76116006)(6512007)(186003)(4326008)(2616005)(6486002)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?TXd0L3lyZGtPZjFlaEsvVlZpMnVVYWl1UHBwM2VmYzBqRU5xeTl1bnZrMndP?=
 =?utf-8?B?N3RWYWp3SGdxZC9rWTFpYjZTbVZQMVc1QlpMd3ZDRkdUUlhmQjZpMis2Ympk?=
 =?utf-8?B?NlZtNnphRXM5ZWhvNUI0enc5R3pEd09uSDJ6NVcvOXVIRllyYUNhYnFMeklZ?=
 =?utf-8?B?Y3BBQVpSMTJzWEhyVER1bFBmOEtWbHdVN0pwZm80WG1YWEpTK2ltaThHWDNZ?=
 =?utf-8?B?UnRNMk5ZNFUrZDI5T29ET2JUL2YwSTd3WEJYQ0Vna0JZcWp1dUNoS3I0MUdO?=
 =?utf-8?B?T25XRUswRVF6LzI1cmdIUks0S3FGZW1YNWNWOTlRM1JnSVp2R1RMYUx3b0NF?=
 =?utf-8?B?azk1Wi9NV0F6Z2ExamtYcVBGb0t2d3NuODZFZXRFcE11OUxCTlVxSlNQaEFx?=
 =?utf-8?B?YTdaYUsrUTlCK3hiUkxNWGRiOVRiM2hSNjQzWFdnOWZBYVVLRXZIYU5TekVK?=
 =?utf-8?B?ay8zekZveWQzNFNhMnZOUmtoazJaWjJQZTdlMWRNMW5meXRTb2JKZmM4U0VC?=
 =?utf-8?B?TmRYUkI4YmpBNks5UzBmYkJ2Um1OenBxTlVrcnUwc0EySHl4S0Zlbk9SbXNH?=
 =?utf-8?B?UnFDK2dzbnFla3VSVTZTTkIxRTZIOGhCVTVqcDdJREZGaWptc1lXVEF0UldN?=
 =?utf-8?B?RnB1enlzWFJJSXhFTTJaeXFhQmwwRTlJYUxRUHVXb2RDSnJrZWQvWUN6emx6?=
 =?utf-8?B?eFpGbjVaMnMxZXVPOVJKRE9neS9IdzJadXkyeEJQeUhyOXo3SGdTcnl4am50?=
 =?utf-8?B?d3h6QStoaXZKWmRkRDdXNXBnNEZhbHY0REgvZndpUHZnd2orcE4vaTh6WUFL?=
 =?utf-8?B?UXJqalkrMVRla1BEQS9CTzNVblg5eFNJOUI0OXhlM1lUWUlWU1VDTHZtdUh6?=
 =?utf-8?B?RGh5bkRBNitJUUUvRXNSTGJ0cld2eGkwRmIrdUVsRzdxSklZWHBDa0ZSMnBt?=
 =?utf-8?B?QWlqQjV6Q1FxTml1OWlZd1NNWHEvZC9sUXBpakxWWnViWGIrTExydUFlK0FO?=
 =?utf-8?B?Q3dQTHNBaWF3Wi80VjMrYlRJSFkrazJvQVRNaC84K24xM0oyVmpSbE5NSWIy?=
 =?utf-8?B?NmxvcFFPL29rTVdYUTQ1REU5dCtJbXlzbmYzU21lQXFJODB2WHZQNTk3OG1t?=
 =?utf-8?B?TmdmbDkvUmVIN1VTTm15eVFPVHdQQU5MaFAvdXl3YWNISTFjNEwzRjdZNGdn?=
 =?utf-8?B?NWNiK0E4RVRMRHZyZVdQelRlWTVvU2tqZU1MZHBlQWxMcXFGdFdPdXJaK3Vv?=
 =?utf-8?B?QnJ3OVRIS1VQb0tpNlQxZzV2WE9RY1NVL2RDOFNpeU9XSXNhaXhQZW5ZZmVu?=
 =?utf-8?B?MVNacDZCRUNOSGErdHN6a3IrRTJ0Wk9BVGVGQnhiWHRXMjdwTkpjZ3VuMGJ6?=
 =?utf-8?B?WjM0dnEvOGhlVmd5YmR1ZlM1ampQcnVMU1JQSmsxUnIvbWdxUW1CUDFVeVVi?=
 =?utf-8?B?WVRkU2d5NUZPVytBMk5OU1c3M0ZWZ2hjc09xSWNSeWtGWXFDclhraGl2UGM5?=
 =?utf-8?B?YlhsaXlOeXY1emdWVlJGdElUWGFqWjVjVTlKSkZqbkM0MXcxUUZTb01zbFRX?=
 =?utf-8?B?cVNhMFZ6d2wxMG9zMHpNdlNZNThET1cyd1EvUUZXblRGUkNxVVhYZU5OQVI0?=
 =?utf-8?B?OWpnM25Nc0hYWlN2Rmh6MS9mcWJ3aThYWkY1ckgxaDNGNEliOTYxWXFiWG1C?=
 =?utf-8?B?WGZ6TzA1ejVBS1k5Qk10YUdrUGxOV2VER2t5S3BRQTg1cTZqQVJRcitmMFhS?=
 =?utf-8?B?Nk5IckZiSmlhR2lSMVdxUktJRHAyOC9pQXdDOUVlbW8wRWhVQnhFbG4rVmlv?=
 =?utf-8?B?SWlFVmR2L002blJsYVkxUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1326B7380AE3AF4FAA731135A5826CFD@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR03MB3162.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca064741-e260-4af3-e7fe-08d91c4cb042
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2021 11:36:34.8390
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mTu92iZud9UuHK9i7Sl8I2IXMG/ywUK7dB8tA2GzUlblcUPGKZ7ebKn1JIkNtKzPt1FwoZTYKAKYNdejOxqhWuq0IYAEN57dP8r/+wRbVFM/O4QRhcx8JTczNF2SiTMn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0302MB2812
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DQpPbiBGcmksIDIwMjEtMDUtMjEgYXQgMTI6NDYgKzAyMDAsIE1pY2hhZWwgV2FsbGUgd3JvdGU6
DQo+IEFtIDIwMjEtMDUtMjEgMTI6MjUsIHNjaHJpZWIgVmFpdHRpbmVuLCBNYXR0aToNCj4gPiBP
biBGcmksIDIwMjEtMDUtMjEgYXQgMTI6MTkgKzAyMDAsIE1pY2hhZWwgV2FsbGUgd3JvdGU6DQo+
ID4gPiBBbSAyMDIxLTA1LTIxIDEyOjA5LCBzY2hyaWViIEFuZHkgU2hldmNoZW5rbzoNCj4gPiA+
ID4gT24gRnJpLCBNYXkgMjEsIDIwMjEgYXQgMTI6NTMgUE0gTWF0dGkgVmFpdHRpbmVuDQo+ID4g
PiA+IDxtYXR0aS52YWl0dGluZW5AZmkucm9obWV1cm9wZS5jb20+IHdyb3RlOg0KPiA+ID4gPiA+
IENoYW5nZWxvZyB2MjogKGJhc2VkIG9uIHN1Z2dlc3Rpb25zIGJ5IE1pY2hhZWwgV2FsbGUpDQo+
ID4gPiA+ID4gICAtIGRyb3AgZ3Bpb19yZWdtYXBfc2V0X2RydmRhdGEoKQ0KPiA+ID4gPiANCj4g
PiA+ID4gQnV0IHdoeSBkbyB3ZSBoYXZlIGdwaW9fcmVnbWFwX2dldF9kcnZkYXRhKCkgYW5kIHdo
eSBpcyBpdA0KPiA+ID4gPiBkaWZmZXJlbnQNCj4gPiA+ID4gbm93IHRvIHRoZSBuZXcgbWVtYmVy
IGhhbmRsaW5nPw0KPiA+ID4gDQo+ID4gPiBFZy4gdGhlIHJlZ19tYXNrX3hsYXRlKCkgY2FsbGJh
Y2sgaXMganVzdCBwYXNzZWQgYSAic3RydWN0DQo+ID4gPiBncGlvX3JlZ21hcCoiLg0KPiA+ID4g
SWYgc29tZW9uZSBuZWVkcyB0byBhY2Nlc3MgcHJpdmF0ZSBkYXRhIHRoZXJlLA0KPiA+ID4gZ3Bp
b19yZWdtYXBfZ2V0X2RydmRhdGEoKQ0KPiA+ID4gaXMgdXNlZC4gQXQgbGVhc3QgdGhhdCB3YXMg
aXRzIGludGVudGlvbi4NCj4gPiANCj4gPiBJIHdvdWxkIGhlbHAgdGhlIElDIGRyaXZlciBoZXJl
IHRvbyBhbmQganVzdCBkaXJlY3RseSBwcm92aWRlIHRoZQ0KPiA+IGRydmRhdGEgcG9pbnRlciBh
cyBhcmd1bWVudC4gSSBkb24ndCBzZWUgbXVjaCB2YWx1ZSBpbiBwcm92aWRpbmcNCj4gPiB0aGUN
Cj4gPiByZWdtYXBfZ3BpbyBwb2ludGVyIGFzIElDIGRyaXZlciBjYW4gbm90IGRlcmVmZXJlbmNl
IGl0Lg0KPiANCj4gV2hhdCBpcyBpdCB3aXRoIHRoZSAiaXQncyB1c2VsZXNzIGlmIG9uZSBjYW5u
b3QgZGVyZWZlcmVuY2UgaXQiPw0KPiBZb3UncmUNCj4gYWxzbyBwYXNzaW5nICJzdHJ1Y3QgcmVn
bWFwICoiIHdoaWNoIHlvdSBjYW5ub3QgZGVyZWZlcmVuY2UuIEl0J3MgYW4NCj4gb3BhcXVlIHBv
aW50ZXIgeW91IG5lZWQgdG8gcGFzcyB0byBncGlvX3JlZ21hcCB0byBjYWxsIGEgZnVuY3Rpb24N
Cj4gdGhlcmUuDQo+IA0KPiBXaGF0IGlzIHRoZSBwcm9ibGVtIHdpdGggbGV0dGluZyBncGlvX3Jl
Z21hcCBkZXJlZmVuY2UgaXRzIGludGVybmFsDQo+IGRhdGENCj4gc3RydWN0dXJlIGFuZCByZXR1
cm4gdGhlIHZhbHVlIGZvciB5b3U/DQo+IA0KPiBBZGRpbmcgdGhlIGRydmRhdGEgdG8gcmVnX21h
c2tfeGxhdGUoKSBoaWdobGlnaHRzIG15IGZvcm1lciBjb25jZXJuOw0KPiB5b3UNCj4gbmVlZCB0
byBrZWVwIGNoYW5pbmcgdGhlIHVzZXJzIHRvIGFkZCBhbm90aGVyIHBhcmFtZXRlci4gV2hhdCBp
Zg0KPiB4bGF0ZSgpDQo+IG5lZWRzIHRoZSByZWdtYXAsIHRvbz8gVGhlbiB5b3UgbmVlZCB0byBj
aGFuZ2UgaXQgYWdhaW4uIEdyYW50ZWQgdGhpcw0KPiBpcw0KPiBhIHNpbGx5IGV4YW1wbGUsIGJ1
dCB5b3Ugc2hvdWxkIGdldCBteSBwb2ludC4gSXQgaXMgYnkgZmFyIG1vcmUgZWFzeQ0KPiB0bw0K
DQpJIGRvbid0IHRoaW5rIGl0J3MgYSBzaWxseSBleGFtcGxlLiANCg0KV2hhdCBJIGFtIG5vdCBs
aWtpbmcgaGVyZSBpcyBhbHdheXMgYWRkaW5nIGEgZHVtbXkgZnVuY3Rpb24gZm9yIGdldHRpbmcN
CmEgcmVnbWFwX2dwaW8gbWVtYmVycyB3aGljaCBhcmUgbGlrZWx5IHRvIGJlIG5lZWRlZCBieSBh
bGwgdXNlcnMuDQooZHJ2ZGF0YSwgcmVnbWFwKS4gSXQgbWFrZXMgSUMgZHJpdmVycyBtb3JlIGNv
bXBsaWNhdGVkIHdoZW4gdGhleSBuZWVkDQp0byBjYWxsIGEgZnVuY3Rpb24ganVzdCB0byBnZXQg
YSBtZW1iZXIgdmFsdWUuIFN1cmUgdGhpcyBhZGRzIHNvbWUNCmZsZXhpYmlsaXR5IHdoYXQgY29t
ZXMgdG8gcG90ZW50aWFsIGNoYW5nZXMgLSBidXQgaXQgb25seSBpcyBiZW5lZmljaWFsDQppZiB0
aGUgY2hhbmdlcyBldmVyIGhhcHBlbi4gRWxzZSB0aGVzZSBnZXR0ZXJzIGFuZCBzZXR0ZXJzIGFy
ZSBqdXN0DQpib2lsZXJwbGF0ZS4NCg0KPiBqdXN0IGFkZCBhbm90aGVyIG5ldyBncGlvX3JlZ21h
cF8qKHN0cnVjdCBncGlvX3JlZ21hcCAqKSBmdW5jdGlvbiBhbmQNCj4geW91IGRvbid0IGhhdmUg
dG8gY2hhbmdlIGV4aXN0aW5nIHVzZXJzLg0KDQpUaGUgcmVnbWFwIGlzIG5vdCBhIHByb2JsZW0g
YXMgaXQgaXMgaW4gYW55IGNhc2UgY29taW5nIHRvIHRoZSBncGlvLQ0KcmVnYW1wIGZyb20gdGhl
IElDIGRyaXZlci4gVGhlIElDIGRyaXZlciBjYW4gc3RvcmUgcmVnbWFwIGluIGRydmRhdGEuDQoo
U3VyZSBpdCB3b3VsZCBiZSB0aGVuIHN0b3JlZCBpbiB0d28gcGxhY2VzIC0gZ3Bpb19yZWdtYXAg
YW5kIGRydmRhdGEpLg0KDQo+IEFsc28gd2hhdCBpZiBncGlvX3JlZ21hcCBwcm92aWRlcyBzb21l
IHVzZWZ1bCBoZWxwZXIgZnVuY3Rpb24gaW4gdGhlDQo+IGZ1dHVyZSwgaXQgd2lsbCBsaWtlbHkg
bmVlZCBpdHMgaW50ZXJuYWwgZGF0YSBzdHJ1Y3QuDQoNClRoYXQgaXMgaXMgYSB2YWxpZCBwb2lu
dC4gQXMgSSBzYWlkLCBJIGp1c3QgZG9uJ3QgbGlrZSB0aGUgaWRlYSB0aGF0DQp0aGluZ3Mgd2hp
Y2ggYXJlIGxpa2VseSB0byBiZSB1c2VkIG11c3QgYmUgZmV0Y2hlZCB2aWEgYW4gQVBJIGNhbGwu
DQpUaG9zZSBzaG91bGQgYmUgcHJvdmlkZWQgYXMgc3VjaC4gQnV0IHllcywgaXQgZG9lcyBub3Qg
bWVhbiB0aGF0IHRoZXJlDQp3b3VsZCBuZXZlciBiZSBjYXNlKHMpIHdoZXJlIHRoZSBncGlvX3Jl
Z21hcCBzaG91bGQgbm90IGJlIHVzZWQgYXMgYQ0KaGFuZGxlLg0KDQpUaGFua3MgZm9yIHRoZSBw
YXRpZW5jZSB3aGlsZSBleHBsYWluaW5nIG1lIHlvdXIgcG9pbnQgTWljaGFlbCA6KSBJJ2xsDQpw
b25kZXIgdGhpcyBmb3IgYSBsaWwgd2hpbGUgYmVmb3JlIGNyZWF0aW5nIGEgbmV3IHZlcnNpb24g
KHByb2JhYmx5IGF0DQpuZXh0IHdlZWspLg0KDQpCZXN0IFJlZ2FyZHMNCglNYXR0aSBWYWl0dGlu
ZW4gDQo=
