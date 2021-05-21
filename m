Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02DD738C4FD
	for <lists+linux-gpio@lfdr.de>; Fri, 21 May 2021 12:32:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231231AbhEUKdw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 May 2021 06:33:52 -0400
Received: from mail-eopbgr00045.outbound.protection.outlook.com ([40.107.0.45]:21057
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232716AbhEUKc0 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 21 May 2021 06:32:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UECniSTCjc/dWkTLq8bkOB2T8miEa0diiC/GdWpY+wn9XhZ/jQx0qJpSc3iC6Y/hKOmOhal7H8TWRku6YEg6uaOePe1G64+X+AQCdC87b8V6KKW+AVFCgmi/QMituW4iFCz7uorbDWtxa3eZuDp7tYTDhjwixt0jroaf8gYrcbpA8w9C+nbUub5tv/O/Eb+T4fg72gC2kKdC3/VRimtsS2FkbmN3oyS/GLbkoxU3s44sCBtUpFHtytjTkL2zsy3qdl3/Zia49Dk+Wi9tIFwvZE/3Q49OS4A3OInItblyzpTO6pE3NaeMWcN4DwfLD/vUSO3PD9v6eNFKC6PkqMDRLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=94leZMSy88vM5IBipbelpwWprmuJ/yahqDi2aO7OOeg=;
 b=KryVmJB9pRT4mQxac17db/KHYTt1qwqePDC1yXv3PO48XhJFT4PtVhtsM7ih08wV1bLciKrhkDu6tjwT+Ybglc4rd3bumyrhRdUPr1MqUGqNJusrKhj2df10MfTq4SHDfcPHToMlC7YvXoq28turbeFNEWnFP/x7FN85CP+/GLh3Ca7F/ITylqaYRpAPtYb4ix+gyR6jLBpaGAI4XsRQGLvWPXzqyp/DvhlTQhXX2LskY5vc7oqFpd2RQ98cSIkx3dV9qiitfi03+9RBrTDDXisr/JETsxT88MFheAPe5mQ6m/oRDYnAmV6+AoBM0DZ1XyujeYgbkC9mDOAC+/ndvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=94leZMSy88vM5IBipbelpwWprmuJ/yahqDi2aO7OOeg=;
 b=gic0wV1ORv2hkWgmejUgXLrVpLu1bwGc3fX6aVM3hjxQuatAtvHXBIplvZZMUGK71rI1HOEADNhlb1EzSyjAPLxeDLLnJIHl5V2NiXBkrwMXn62MsqHUe1MSkVQsIPvSJcLpHV743cfHFALOxvGlo8MK86ITAfjARiXjn9PqAC0=
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com (2603:10a6:7:55::20) by
 HE1PR03MB3065.eurprd03.prod.outlook.com (2603:10a6:7:60::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.29; Fri, 21 May 2021 10:30:18 +0000
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::89f0:ff95:a73a:cf4b]) by HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::89f0:ff95:a73a:cf4b%7]) with mapi id 15.20.4129.033; Fri, 21 May 2021
 10:30:18 +0000
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "michael@walle.cc" <michael@walle.cc>,
        "bjorn@mork.no" <bjorn@mork.no>
CC:     linux-power <linux-power@fi.rohmeurope.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 2/3] gpio: gpio-regmap: Use devm_add_action()
Thread-Topic: [PATCH v2 2/3] gpio: gpio-regmap: Use devm_add_action()
Thread-Index: AQHXTgqFqSIUt187g0WoCKnHHDOZNartlX2AgAAH2AmAAB8rgA==
Date:   Fri, 21 May 2021 10:30:18 +0000
Message-ID: <d6bb1e458d5aa6a32f31f7731e1a6097a225d634.camel@fi.rohmeurope.com>
References: <cover.1621577204.git.matti.vaittinen@fi.rohmeurope.com>
         <e3d3e704804668d1403f3630c181010b34409c8f.1621577204.git.matti.vaittinen@fi.rohmeurope.com>
         <12bb40f022be0378ed493e7ad33122b0@walle.cc>
         <87a6ooh46s.fsf@miraculix.mork.no>
In-Reply-To: <87a6ooh46s.fsf@miraculix.mork.no>
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
x-ms-office365-filtering-correlation-id: 3643e071-e4db-41f0-5d5d-08d91c436e19
x-ms-traffictypediagnostic: HE1PR03MB3065:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HE1PR03MB30655D49B24F8029E18BF023AD299@HE1PR03MB3065.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HQiS6ZE46/+sVgt04T/Dw+0t7Xlc1jSHcxPhlTk/cC5gauhABUmRphtM5riJWPOwBlcSfa6TyrIE4hy8ToIuDJLsILLCQZJzXZ3KWswgGkq8LrkNV5DFc1JJrKoOXRMyz98edqLRyQm5tIPNAFoCUmFLhizgo2W7OsIY/ysxi+Cfu6Qoz47kebxLsTIPMbRfK8QMbO+3x8jgzVcQvrLzlRrxRPjzt/f70M3JzSQsrFyzbKAvLY+luPibYlI/5KgnVhZmAHCU3cUB4MKDyrOxtlddRVFD3zln66LJ7DuYr2h/d5gVh12MiJA5ss4NCxm7WRFaxsCa2RqJAjfseGTJpV9xLlK/HOP/DDNFTshTH3DwKvkbSMssmgiMBGYI7J7SiyzCbCDXmX6jMdaZJxENgKvLBewq4FV6cjHXAfcOw8N+U907Ix/qXonYr0WDXBdvlXZweXjAkhY7AQVNY5IBkXid4Rv1+/S03seZphfjwv1Xga+wpFjEyFAKvFVg9fKbCCstIZSPJ9rMNZxKz8xrJedLb/t3EfskHzeNPMYsv6p+jM+dhAiC/Y5clQUtjJe1DanL8fmIMfjN0QJf5ERo+qDCFwPoOZDgL/L1+T4Rs8c=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR03MB3162.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(346002)(366004)(396003)(136003)(376002)(8936002)(8676002)(110136005)(316002)(38100700002)(6512007)(5660300002)(186003)(2906002)(4326008)(54906003)(2616005)(478600001)(6486002)(122000001)(6506007)(76116006)(66556008)(64756008)(71200400001)(66946007)(66476007)(3450700001)(26005)(83380400001)(66446008)(66574015)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?T1J0akVSUUQzR1JlNzRkU2pDOGZuSEhPbHNmaTRmUy80SlBCZC9XL3pEVkRo?=
 =?utf-8?B?NllDMFAzNGFxVUlWTU5OaEtXSXNzNFI3OGFXZUt1RjBQM2JtUGFMeS91T2ow?=
 =?utf-8?B?anZZcENmaFVQWXFvdWNUNmNNNnJJcGVPTDl1Y1EvWk0wUkg1aUJEQ3JUZHJG?=
 =?utf-8?B?VGh1cUFvTnBTdy9PaENLOWJ3bEtITUQxRkNwVlhORlZYWHNrS2I2dmNTUUFR?=
 =?utf-8?B?a2NlaExCalc3U3RUN0hRMklsRnJSWTNyTWlFQU9VZ2lPdjBXdmh0a1NsTDFn?=
 =?utf-8?B?dUZYOGd0ck5Oa3VISDN5akdSNWdHeEVOOWIyek15MzZ2QkQvTS9PUGszdEh4?=
 =?utf-8?B?Y3Z3L1ZoRHVQb1B2SlpPdU91SnFTVWx3d2FrNDE3bnF4QXM1blhtV0d1NHk4?=
 =?utf-8?B?UlBsRjN5L2dhMER5aDhBWCtGSzJGL0N2Zmg5VnlRN081cmFoWUZUL0dXT3A0?=
 =?utf-8?B?bVRnR1ErN0NDa2tBWEMxd0lTVk8zeWxQL3I1d2NBdkVnMjNVU29HQWYvaE0w?=
 =?utf-8?B?RGpWWFg2cVo1UnorTDRLQlA1cW1MQk5VaWdhcDJOYUFYTXRLeWZjL2xIYVBG?=
 =?utf-8?B?R3BHN2ZYSDRFOHJzZmEvNCs0d0ZWWm9mcUl4S09Mekk5Nk5GVHdYTXhxYlRS?=
 =?utf-8?B?VlhIbU5LdVpUKzJsakxqOWE3d013MnpWTHVXU1Y3bFdiTVFzb3dHVnFReFpm?=
 =?utf-8?B?dEdobWRmT08yL1JWYXBaUDdnTkQwbUdUWFIvd01zZldhV2o1VTZOZ0hNU2tm?=
 =?utf-8?B?Rmg1MnlrU2JqNHZsdHZhWmhWMWN5KzFDZ1YvSnRRVTNTVWFQaUFCZGR5K0x5?=
 =?utf-8?B?MGVBYy9vTGhDL1hwMTVUb2JLOUN3NmRVZitWUzFSbEk4VXlkMkpjVkQxemc2?=
 =?utf-8?B?Z1VRMnV4cEtnODBPUlhwSWNpemJiMkkzTWxmMEJxVGVVS3FOWExsSllVUUs5?=
 =?utf-8?B?aFRWdXloRFpuOVZacmpkVVB4WUdXTjlaR0pTM2dPUDV2REtGZ3FJd2lNSUU1?=
 =?utf-8?B?L1ZtV0dJOGFrekRZbDMwRzBsMzVpanlXVlRBMWRLMDlieXVaQkRiREd2TFlw?=
 =?utf-8?B?TWFKYll6OWcrNldVbElsR2xXWkd3ZEhsUGVxdWpuV3hzZDY3NnhJUVBRYnZZ?=
 =?utf-8?B?NW1HTG95b3FXZkpuV28rMEVyR1R1UnI2NHN3ZkFrRGhSaVZxaVdSOXYvdzd0?=
 =?utf-8?B?NGZrb2pEbDN6bnlNSTgvcThWa0JrdEh0NmJLaGRUbm5MdzNueHJNS09XdTk1?=
 =?utf-8?B?bzd1OHhoS1JMRncwQnN4U0t5RS9TNmNhczZyZjdFT0NDL25TSUd4YkE4dUJM?=
 =?utf-8?B?K0NKdVdqbFBRV2V6T1I1RXlnbXR5cU5HbHU5TWpIK0ZxYm9TNy95Mk9WRGsz?=
 =?utf-8?B?bDdEODBTcHdCcmJWZXFHeCtBQ09abFpsYXVKZkxDMVVTSi96YXhJdG5XT1hY?=
 =?utf-8?B?NDhJUFp6RnJESFg4aXpJeC9HY3hxMmM0d1dTY25mK3BTdGdQbWJJQjlzUEE1?=
 =?utf-8?B?VlgyK1ZTbXRwdXNGR1pDY1JXVStKWUFYK0E4TlVKY3hJQ3phL0M0eGxBQm9x?=
 =?utf-8?B?bDd5eCtzTzVRWUtjU3VrdXRPUlZ4T1ZxZUFJdU9wZEpBZGFTUFgvQjZrbFZB?=
 =?utf-8?B?Z3p1UGNsbWJCaEwzcWxINzBqQ21IZ3A3Z2dQOVdrbjJNNmREaWpVN0NGRG5o?=
 =?utf-8?B?VmdBRGlvRmg3Z2FwM3l4enYvY1NYQXFtTzI2YUFNOVdqRElPc3UvSS9JMXk1?=
 =?utf-8?B?dEFLcmRncklUckNoYzNRL2YvSGhtVDhzQmZyZjFJTW1IaThkZEl4MGZXRmcw?=
 =?utf-8?B?dWFWbUVyNWtyazVJZi9sdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <741AE06BBCD7AF4792153FAF6B10FBC3@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR03MB3162.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3643e071-e4db-41f0-5d5d-08d91c436e19
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2021 10:30:18.3646
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7YbagZCBCsvlzZOrxV4pGM2pfTH8UNTKpJdJOWb74vQ/5kCp3kkWnWTqrZTMNYQhoCzdo3ZytDfdlFBVz0NW8hLltDtZVCRjkdNrdu06zNMjsj8f71/lTORUYB/RF4TF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR03MB3065
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DQpPbiBGcmksIDIwMjEtMDUtMjEgYXQgMTA6MzggKzAyMDAsIEJqw7hybiBNb3JrIHdyb3RlOg0K
PiBNaWNoYWVsIFdhbGxlIDxtaWNoYWVsQHdhbGxlLmNjPiB3cml0ZXM6DQo+IA0KPiA+IEFtIDIw
MjEtMDUtMjEgMDg6MjgsIHNjaHJpZWIgTWF0dGkgVmFpdHRpbmVuOg0KPiA+ID4gU2xpZ2h0bHkg
c2ltcGxpZnkgdGhlIGRldm1fZ3Bpb19yZWdtYXBfcmVnaXN0ZXIoKSBieSB1c2luZyB0aGUNCj4g
PiA+IGRldm1fYWRkX2FjdGlvbigpLg0KPiA+IA0KPiA+IEhtLCBuaWNlLCBidXQgd2hhdCBib3Ro
ZXJzIG1lIGEgYml0IGlzIHRoYXQgbm8gb3RoZXIgc3Vic3lzdGVtDQo+ID4gZG9lcyBpdCB0aGF0
IHdheSwgZWcuIGh3bW9uL2h3bW9uLmMgb3Igd2F0Y2hkb2cvd2F0Y2hkb2dfY29yZS5jLg0KPiA+
IFRoZXkgYWxzbyBzdG9yZSBqdXN0IG9uZSBwb2ludGVyLCB0aHVzIGNvdWxkIGJlIHNpbXBsaWZp
ZWQgaW4gdGhlDQo+ID4gc2FtZSB3YXkuIFdoYXQgSSBkb24ndCBrbm93IGlzIGlmIGRldm1fYWRk
X2FjdGlvbigpIHdhcyBpbnRlbmRlZA0KPiA+IHRvIGJlIHVzZWQgdGhpcyB3YXkuIFNvIEkgY2Fu
J3Qgc2F5IG11Y2ggZm9yIHRoaXMgcGF0Y2ggOykNCj4gDQo+IFRoZXJlIGFyZSBzb21lIGV4YW1w
bGVzLiAgTGlrZToNCj4gDQo+IGludCBkZXZtX2kyY19hZGRfYWRhcHRlcihzdHJ1Y3QgZGV2aWNl
ICpkZXYsIHN0cnVjdCBpMmNfYWRhcHRlcg0KPiAqYWRhcHRlcikNCj4gew0KPiAgICAgICAgIGlu
dCByZXQ7DQo+IA0KPiAgICAgICAgIHJldCA9IGkyY19hZGRfYWRhcHRlcihhZGFwdGVyKTsNCj4g
ICAgICAgICBpZiAocmV0KQ0KPiAgICAgICAgICAgICAgICAgcmV0dXJuIHJldDsNCj4gDQo+ICAg
ICAgICAgcmV0dXJuIGRldm1fYWRkX2FjdGlvbl9vcl9yZXNldChkZXYsIGRldm1faTJjX2RlbF9h
ZGFwdGVyLA0KPiBhZGFwdGVyKTsNCj4gfQ0KPiANCj4gDQo+IFlvdSBzaG91bGQgcHJvYmFibHkg
dXNlIHRoZSBkZXZtX2FkZF9hY3Rpb25fb3JfcmVzZXQoKSB3cmFwcGVyIGhlcmUNCj4gdG9vLA0K
PiBjYXRjaGluZyB0aGUgdW5saWtlbHkgZGV2bV9hZGRfYWN0aW9uKCkgYWxsb2MgZmFpbHVyZS4N
Cj4gDQoNCkkgd2FzIHRoaW5raW5nIG9mIGl0IGJ1dCBhcyB0aGUgZ3BpbyByZWdpc3RyYXRpb24g
c3VjY2VlZGVkIEkgd2FzDQp0aGlua2luZyB0aGF0IHdlIGNvdWxkIGdvIG9uIHdpdGggaXQgLSAo
d2hpY2ggbWVhbnMgd2UgY2FuIHByb2NlZWQgYnV0DQp0aGUgZ3BpbyBpcyBuZXZlciByZWxlYXNl
ZC4pDQoNCkkgYW0gbm90IHN1cmUgaG93IG11Y2ggZGlmZmVyZW5jZSBpdCBtYWtlcyBpbiB0aGUg
Y2FzZSBvZiBzbWFsbCBhbGxvYw0KZmFpbHVyZSA7KQ0KDQpCdXQgYXMgaXQgc2VlbXMgSSBhbSBp
biBhbnkgY2FzZSByZS1zcGlubmluZyB0aGlzIEkgY2FuIGNoYW5nZSB0aGlzIHRvDQp0aGUgZGV2
bV9hZGRfYWN0aW9uX29yX3Jlc2V0KCkgYW5kIGZhaWwgdGhlIGdwaW9fcmVnbWFwIHJlZ2lzdHJh
dGlvbiBpZg0KYWxsb2MgZmFpbHMuDQoNCkJlc3QgUmVnYXJkcw0KCU1hdHRpIFZhaXR0aW5lbg0K
