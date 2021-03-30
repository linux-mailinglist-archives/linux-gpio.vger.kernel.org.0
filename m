Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D23234E613
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Mar 2021 13:07:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231877AbhC3LHW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Mar 2021 07:07:22 -0400
Received: from mail-eopbgr70050.outbound.protection.outlook.com ([40.107.7.50]:9602
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231370AbhC3LG6 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 30 Mar 2021 07:06:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ccJ3vTlyuE9eLbZCJJPQpzkttklIRxF6f+vzhQ2/cW0KghvZPmNhAx/VI9GwTSpWcZvwsAE48tC8CB3OZpSZo8e9Bt34KOmXWZp+WA8iQOiuot5WmRlN9XtXSK0PPa1xRNxSV1xHsLhoxa+VOt3H+wvFHxeL3heabf6b6gPzj4/dVU6+mTNzfB/+z/AxT6HSSv60gNr81btYMYuehzJrYYlU2JTVMW4FuuMGZQGcZPdMAkjlRjPCceUgo6XcBgzPdEct41CKUAXKe0fFK7e9H7AzQZw2CRj+Kk7H3f3XoCenv4d5JAHG0hjOUKtqGZdYLiMn/l5jA6vacmBSJ39+iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/frgKHMEKJ6Ms2j+Qj/KQYjZiiyerx7jkKBw+/LXTR8=;
 b=h+C9SKxg6Ys8dSzNdrwwO5kB+EDDutNrbG0mzl+WkZW1isVj8Np/vWYFf9AGj3ruI7C8wae0THCfVHuHqjy92NwL+G6DwcNaK5we6xkTAsVS0rs6KGHKtbev1JQCmNEYXfzHgo6Fyv3xTFudIxvslI718AbMJuvYS3Iz/urVsW9SLrpns5GzUjxOjYx+hXfy9PQOIg5Cma016cEZR83AliTeFQwpSZWTpknmJ4NOP3wn+sWIijkt/6eBrqY/9/xhDTlZxU1Kp3nEJeOOEMRJZIg9hQPv/NAJ9X3RV6DOb++1k04ifQJIFPEpMtiOX3kOMfS+4YnnoZaJE9vO6c7/eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/frgKHMEKJ6Ms2j+Qj/KQYjZiiyerx7jkKBw+/LXTR8=;
 b=Qhz5aHx3R2HuCMPRaeVPsFGkpN4vavRKp5xrCZZZRsHsg9BQOc6J4trlfnZSr/R39rJOgcOa4xbhCzDtbvUCjGnKyk7QZ75rBLxsMj/ZZl0eHD3TObSL5Z/YkP2S07xE5snq7ulomc6nu/3GgAPskHNCqt42pWe5OUI2Jk9C2fA=
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com (2603:10a6:7:55::20) by
 HE1PR0301MB2169.eurprd03.prod.outlook.com (2603:10a6:3:21::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.25; Tue, 30 Mar 2021 11:06:53 +0000
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::f4d0:ee66:d5fb:9cdd]) by HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::f4d0:ee66:d5fb:9cdd%3]) with mapi id 15.20.3977.033; Tue, 30 Mar 2021
 11:06:53 +0000
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
CC:     "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        linux-power <linux-power@fi.rohmeurope.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "broonie@kernel.org" <broonie@kernel.org>
Subject: Re: [PATCH v5 00/19] Support ROHM BD71815 PMIC
Thread-Topic: [PATCH v5 00/19] Support ROHM BD71815 PMIC
Thread-Index: AQHXJJps4G37QdCWoUakTStXWzuSFqqcYF4A
Date:   Tue, 30 Mar 2021 11:06:53 +0000
Message-ID: <303b164aaa3d36cf8c9d03ee9b3863635be4073d.camel@fi.rohmeurope.com>
References: <cover.1617020713.git.matti.vaittinen@fi.rohmeurope.com>
In-Reply-To: <cover.1617020713.git.matti.vaittinen@fi.rohmeurope.com>
Reply-To: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Accept-Language: fi-FI, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.34.4 (3.34.4-1.fc31) 
authentication-results: fi.rohmeurope.com; dkim=none (message not signed)
 header.d=none;fi.rohmeurope.com; dmarc=none action=none
 header.from=fi.rohmeurope.com;
x-originating-ip: [2001:14ba:16e2:8300::2]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7844294e-03f4-424a-7e9c-08d8f36becf8
x-ms-traffictypediagnostic: HE1PR0301MB2169:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HE1PR0301MB216915B0BC318EFC4592CBBCAD7D9@HE1PR0301MB2169.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CFxLqxT93evPqyO6rhTmIUPBpVQWwZtb/l9HOidKoCJ71UdwNWf8USdlUUJnwBJ+Lx2scCNmKbdgKm5Cm15j2OSQwCi+EAe8TvyFk2l6uIYHnjM0K1shDjRe0Rf29WQtcPW3K6fJp7iAz4WEMgwPr4o64+nvdgSmLuuYCk4j/geiB19N6UnuckckIYdQGqErFnLJhd67XnehiASJ7dTqbLog/kjE5PACIiziVKP7Z0NLmXca9S+IJH+B7fGUa/zVNs3AJAFUrGUDAsB+Ca0YTXic+6bdTiCKCgeeaKHi72hPkeobt7NOeT0DWyThH1fvxxvDAEXS2XaumrbJ3j65iKlPWGpO/czZkz2FkJSEssbmQcuOvhR8GrgMvj6byC1P8ZkZrJ3PyZ8q6TUesW/0/r/ENOYOovOxJtS6j+XimPZ+QCnUdUn0KcSkL8FHHk6ysLUcz1CSaVfwMG492SuNPmSFS2VH+IX6UVQExSTPyfn1BsB2VQWQ/clqKaLRn3PY3tSm6Y9Hp7WtFG13Tarkb2vToQCsOnSNT1nxh9GVDE/GNw0Iik+CU1Ik/Hyz2/C3qE9PXagAQhGfO3AjfC98Ju626hbceE1KrsSW7vQFe3+0op3Q89JD9wQskzJgdQLtjijUEr02gd3Hr42MaJWtLsrEw4YpjLAhqW1fvh1Km1s=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR03MB3162.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39850400004)(346002)(396003)(366004)(136003)(5660300002)(8676002)(6862004)(8936002)(7416002)(86362001)(6512007)(2616005)(3450700001)(83380400001)(2906002)(6506007)(66946007)(54906003)(6486002)(4326008)(37006003)(316002)(76116006)(71200400001)(66446008)(66556008)(64756008)(66476007)(186003)(478600001)(38100700001)(6200100001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?eG0rN0ljWmEyTnRlbWd5cWNhcGdqc0FBZS9HbncrVjZ3bkdWZ1NXTGFRakpQ?=
 =?utf-8?B?MXZ2TWV6SnFCaHh4TEpEWnMrM3pWeW4yTDdBaUR0Z3diY3VPSnYxZ1NMZVRX?=
 =?utf-8?B?ajlwNUo0OUV0Sk01eXE5QUtMUEVxbmhxQWtGOW9JN0tteGY4Mjh6NHlaVW5S?=
 =?utf-8?B?N1NMOEZ0K2xXN3UzaUZTVy95MjJ2WmsrNkp0QkRXT1FUbXVCQjRjMVRneS80?=
 =?utf-8?B?dS9yTTMvUWtncVlwOTJJbEFDTjF3b3FKQ3JEeFhwQnFRN2ZtRk85NHdMZS9J?=
 =?utf-8?B?VGY3aUQyMEViYVhkbkdKUlpCK01PTEw1SEJpTnI2c3JyRHZ1Z0pUTnpqK1Fq?=
 =?utf-8?B?U29BTXdKY0pYYkRZZW1XR1pLOFBlSmFvSWN3Zm54UDNSY1djdEF0WUNEREM1?=
 =?utf-8?B?ZC9hSlZNbk0xQ1I4R2RGd2hjNXdnS2lFT3hmZWNESThENmhlbEVjSFNlSG11?=
 =?utf-8?B?WTZLTkIvUzFBOS9wVCs3VHJHZnlCdmQxb3ZpemUxQUpMY2owZVNQMGRKaUhJ?=
 =?utf-8?B?ZHdURDdJRTlWNkhpZWhDUWdnV3ArbW9kYjF1N1dZY1FmTXpXTjhhVzk1RFlk?=
 =?utf-8?B?SXVKaWQyQVpSSFlJcjV6TlpKYW9ONEZodGxlZ3B1c0JsQ1dNcUFkQ0tjTkJV?=
 =?utf-8?B?clhGc3BLZ050QklCQkxoSVh0NFhUNncraWJqRVdMU3p6cVNYTlQ4ZjBNbEhz?=
 =?utf-8?B?Rlp0R2w3L0dOdjR3QnFpTnhaWjZoanNqbjZlRnZLMDRwSUdRUFFjNmE5R1Nh?=
 =?utf-8?B?bW9UUk9mWVJsUUhTVEFjUzRyMjQrM1Y2dHBPeFdOd1c0Mlk5TzBaYVRjZVpL?=
 =?utf-8?B?NEk2cm1DNVJvZXlpK0ZWeFdUWmVUcE1SSFk4NUVrQkJZK0dqUUdWaFhpYzBC?=
 =?utf-8?B?NjVLNGV6MkxKUnZwR2pmNkFBY2tkbHdmRVZvOWdBMDJ1eTNiMy93dHQxZUdD?=
 =?utf-8?B?b0tmeDJWQkNxbkg2a3RSOHJZUkZGNGd0T1ZvN0VpV0ZtUXU1OFJXSGtjMlc3?=
 =?utf-8?B?SlBDd2k5OTJuZ05qRk9iVzVpdmxnTERXaFdzV0tXYWF5K0l3TEh6eVNpRGlG?=
 =?utf-8?B?ZXcvN3kvRFlNRHliWjFBTXhRVUJsNHA4a2pjSk1yUnRoYnZVQzFZVUJuUFNP?=
 =?utf-8?B?UG5ta0VHRnNLM29uYzdabDJxNkNSbVhPU3lkeG5GQmZCRG9IRHpkRVIwZHZB?=
 =?utf-8?B?V05mWDRRc2dWY0ZsVWVNbCtubDdkSmozTlp3QnYzSFhlMWNFR0Z2L2VJNEJP?=
 =?utf-8?B?bXBOeDQ2MjRoSHVUZzVDcllzbnIram0veFN1TGNTZkpJNmpZOWNFRDl2dlpl?=
 =?utf-8?B?aXY5ZTlxRU0xcVI2VXVuRnIwcnhoclJFNTlvSlNlbVBYOElGMFBMNTVxWXhD?=
 =?utf-8?B?VzNjcFhZZjdndEJta0dDV3hobjdORHdMZm5vQVlUV0puSWNJUUJOQjVBdEx4?=
 =?utf-8?B?OWRKZTRXR2VCNTZDNFJvcDV2emkwVktWZGxNMVVBZWlZa1hFRElvc2pNSXgv?=
 =?utf-8?B?N3JOZE9ockhtNkY5aksrdHdGckQ3eDdpVGxzMW5YTnRTa3RxNkJrV2d3bGhT?=
 =?utf-8?B?QlNzMTRHRFc2TmY1ZndVZlR4WUwyZElna1kyTmkreVRCbmVOS29qMzBLSXd4?=
 =?utf-8?B?SU5VcStNbko0WG5VUVdndFU5RXJGUzNqNVN0NlVVdDdwcUpMVzkzbWIxWU93?=
 =?utf-8?B?L3plTjQ1SHFpMlhIT3ZZRGdoK3o0QjN5eUdoaFlYRDNTV2IyL1dLWks5dTNI?=
 =?utf-8?B?MGppQzhpOE9SVDN1a2o5aHpDeVFXV2ZoT3NnV3pOQUY5dU16clhkWTYyVHV3?=
 =?utf-8?Q?2maLLjPysXXSpj9N6OqXSH2s5SCCXISZ5+aPk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4061A4B565258C44A2B87FFE6C8DE1A9@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR03MB3162.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7844294e-03f4-424a-7e9c-08d8f36becf8
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Mar 2021 11:06:53.4424
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rC9u2DlFkikc+KknmqgECpQEWYUkgLhk9C3ciJjtz0fnCViJ4pqZgg95oEfJI6HQf/BRtghUdNZ6TFgxsByA0YOxF3UlzUAAb7IBT4b9dE4n7hApPdHF1r+n5LWhgF50
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0301MB2169
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DQpPbiBNb24sIDIwMjEtMDMtMjkgYXQgMTU6NTIgKzAzMDAsIE1hdHRpIFZhaXR0aW5lbiB3cm90
ZToNCj4gUGF0Y2ggc2VyaWVzIGludHJvZHVjaW5nIHN1cHBvcnQgZm9yIFJPSE0gQkQ3MTgxNSBQ
TUlDDQo+IA0KPiBST0hNIEJENzE4MTUgaXMgYSBwb3dlciBtYW5hZ2VtZW50IElDIHVzZWQgaW4g
c29tZSBiYXR0ZXJ5IHBvd2VyZWQNCj4gc3lzdGVtcy4gSXQgY29udGFpbnMgcmVndWxhdG9ycywg
R1BPKHMpLCBjaGFyZ2VyICsgY291bG9tYiBjb3VudGVyLA0KPiBSVEMNCj4gYW5kIGEgY2xvY2sg
Z2F0ZS4NCg0KTGVlLCBNYXJrLCAoTGludXMsIEJhcnRvc3osIGFsbCkNCg0KSSB0aGluayBhbGwg
b3RoZXIgcGFydHMgZXhjZXB0IHRoZSByZWd1bGF0b3IgaGF2ZSByZWxldmFudCBhY2tzLiAoV2Vs
bCwNCkkgY2hhbmdlZCBHUElPIGluIGxhc3QgdmVyc2lvbiBzbyBCYXJ0L0xpbnVzIG1heSB3YW50
IGNoYW5nZXMgYnV0IHRob3NlDQp3aWxsIGZvbGxvdyB0byBHUElPIGluIG5lYXIgZnV0dXJlIGFu
eXdheXMpLg0KDQpEbyB5b3UgdGhpbmsgTGVlIGNvdWxkIG1lcmdlIG90aGVyIGJ1dCB0aGUgcmVn
dWxhdG9yIHBhcnRzIHRvIE1GRCBpZg0KTWFyayBpcyBidXN5PyBJJ2QgbGlrZSB0byBiZSBhYmxl
IHRvIHNxdWVlemUgdGhlIGFtb3VudCBvZiBwYXRjaGVzIGFuZA0KcmVjaXBpZW50cyBmb3IgZnV0
dXJlIGl0ZXJhdGlvbnMuIEl0IG1pZ2h0IGJlIGVhc2llciB0byB3b3JrIGRpcmVjdGx5DQpvbiBy
ZWd1bGF0b3IgdHJlZSBpZiByZWd1bGF0b3IgcGFydCBnZXRzIGRlbGF5ZWQgdG8gbmV4dCBjeWNs
ZS4gKEkgZG8NCmFsc28gcGxhbiBmdXJ0aGVyIHdvcmtpbmcgd2l0aCB0aGUgR1BJTyBwYXJ0IGR1
cmluZyA1LjEzLXJjIGN5Y2xlIHRvDQp1dGlsaXplIHRoZSByZWdtYXBfZ3Bpby4gVGhhdCBjb3Vs
ZCBiZSBkb25lIGluIHRoZSBHUElPIHRyZWUgdGhlbikuIEkNCnRoaW5rIHRoZSBvdGhlciBwb3J0
aW9ucyBhcmUgaW4gYSBwcmV0dHkgc3RhYmxlIHNoYXBlIG5vdy4NCg0KQmVzdCBSZWdhcmRzDQoJ
TWF0dGkgVmFpdHRpbmVuDQo=
