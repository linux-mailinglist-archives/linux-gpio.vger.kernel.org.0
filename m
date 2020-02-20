Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 33A5E165B39
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2020 11:12:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726829AbgBTKMU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Feb 2020 05:12:20 -0500
Received: from mail-eopbgr80105.outbound.protection.outlook.com ([40.107.8.105]:24325
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726813AbgBTKMU (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 20 Feb 2020 05:12:20 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bo/+Sm4jUbgoEG+kPMY/YiEDp3TWhVF0SGCkuQp7p5fX+tsTg3WJnV+N4LYEf4dK3UEupWGYZVOGwtAq1oTXql0qGv842tPIFzWd3OY8j/NlHOvj+qGpEYlEeCYcGeu+TPuENyvuvdD2y1B+DCqHE5jii81BZOeI659w9HMGqmtUb3f6kJWLYfTNPHlcS0ylzjs+mEBP4KZfnPzGILnnsYUaKPA6vXCCa3tVJDWEA6Wp+jvZG3EDruiHsm18rTxW0i4vfIyBoFQLf2urX318421Pi8Bsy5ojhbIr9VY0oFQw7U6zqgBhp/4wtdaYJEsWMwIAo4NN7x2d8uUagvvGrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8vxjFLJASDwYhSGWzwUXudyqZAFeVU+3lzM9IwZZDX0=;
 b=BTPSmsx0QUHZE6EeuAE8zHfxM+5FTFe1XDv12iE2C07NzNVFMRDNEAituimTq4i63qzaLv/AxelmytquC5GrkFRZHI9zLHGPLTnzaxnrQLgGWDZaCDdf8HBMVYOhjW1ymIqVF+0i4tWOfkcwQZ7GeFzmtLNm+nj+eUrD1YaMOuDn2+adClsjLwxxnf2izWw9VR2y/bJg0fINw6pVOAFp4+OUFSE5hJvdB38GvsgS5hw5FJZstxC6J+yoaxDYJXPG74JsxZBtUN6ra9LlTCnOnUzoQi7KUPfYBDJB/DdPkAGZsQ6sIHOvBYZUImqTun/lXeDvZHCUl16r+xANbpuXuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8vxjFLJASDwYhSGWzwUXudyqZAFeVU+3lzM9IwZZDX0=;
 b=FdoaBd561REboJhU1JJHgzyVD0XblM5p62WQgLJKwVZl38kDuzOJ+23D8UAahB9MYLP6Zq9Ml0mwRbMRoJr1Hxhdei7eDlCgYDspYOUjEVCm/akcA480BjcVrqnF9ZYocRvMNt7I2DVlMzcZebPYlQ+YdyH5uiYJ8rG3TrMXOHo=
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com (52.134.66.158) by
 DB3PR0202MB3370.eurprd02.prod.outlook.com (52.134.67.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.24; Thu, 20 Feb 2020 10:12:15 +0000
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::d7c:583:b9cb:7592]) by DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::d7c:583:b9cb:7592%7]) with mapi id 15.20.2729.033; Thu, 20 Feb 2020
 10:12:15 +0000
Received: from [192.168.13.3] (213.112.137.122) by HE1PR1001CA0001.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:3:f7::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.18 via Frontend Transport; Thu, 20 Feb 2020 10:12:14 +0000
From:   Peter Rosin <peda@axentia.se>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Russell King - ARM Linux admin <linux@armlinux.org.uk>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
CC:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: Re: [REGRESSION] gpio hogging fails with pinctrl gpio drivers
Thread-Topic: [REGRESSION] gpio hogging fails with pinctrl gpio drivers
Thread-Index: AQHV58ZIszFMtrU3okKVIJwFGeXS2agj3OGA
Date:   Thu, 20 Feb 2020 10:12:15 +0000
Message-ID: <fb74672f-a12c-5f94-450b-11e44238ab30@axentia.se>
References: <20200206173247.GX25745@shell.armlinux.org.uk>
 <CACRpkdbzjBnaeXJg3XvZ6G2FdtQQa0u7MPy9bgN-uo-F1vSpbQ@mail.gmail.com>
In-Reply-To: <CACRpkdbzjBnaeXJg3XvZ6G2FdtQQa0u7MPy9bgN-uo-F1vSpbQ@mail.gmail.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
x-originating-ip: [213.112.137.122]
x-clientproxiedby: HE1PR1001CA0001.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:3:f7::11) To DB3PR0202MB3434.eurprd02.prod.outlook.com
 (2603:10a6:8:5::30)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peda@axentia.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 62d0cccd-56b2-4767-a6fe-08d7b5ed5c1c
x-ms-traffictypediagnostic: DB3PR0202MB3370:
x-microsoft-antispam-prvs: <DB3PR0202MB337014FDAC9E503D5C245576BC130@DB3PR0202MB3370.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 031996B7EF
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(39830400003)(396003)(376002)(346002)(366004)(189003)(199004)(66476007)(66446008)(66556008)(52116002)(26005)(64756008)(8676002)(4326008)(31686004)(66946007)(53546011)(8936002)(86362001)(31696002)(16526019)(186003)(508600001)(81156014)(81166006)(5660300002)(2616005)(316002)(956004)(6486002)(71200400001)(2906002)(110136005)(54906003)(36756003)(16576012);DIR:OUT;SFP:1102;SCL:1;SRVR:DB3PR0202MB3370;H:DB3PR0202MB3434.eurprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: axentia.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: F7nYMZQbbzelGhs52RkJrw81JgHzkdwGQDSWuyTlnVB2871kDatUhN3KODXZg1ZDyT+2+TjIeNGT25gura1ony7XIlSDK7EsTjsiN5JB3qcyXzawXDD0mXTFNBCxyN8w3fspxaG0JfC9XkvMXW6bIICqU4U5S2YASmYRY5diKdwv30tEfEOOJlA+0cHHDoVka6f4D/WlhUvNbKUOYTZygqf5ZNb/XAHTsSfc7W6qvc8qYw7ixK4088XoH0dxryNZLubqYmwdHAR/u1uZJMopbw2WXRo7ZM8mx7qd2MaDAz1trnTyVWdwBUhBpYjeO+cG+fkR92QimzSXO4+aR+vDfo3XSbtnfcLBvQGfFRlBV2YGIFNUNG5qGOBkCXj6enQoaiCAPJpRoBShHJfC61vhWA384zeFu4ekwZJvC4IGMgrV3fXTha97c5+foKPNK4Ec
x-ms-exchange-antispam-messagedata: voW6+lmWhGv9NruUChds7hWiK+AvE32n7mU+NY0vSBNlQTKsnLPmPqxE8WGcrDON8IZevWn1MjDg0bKmIoJr+Zziw0qt/BxA5eIoq+pfosx2XJUJ+mWLieWkgcZmkLHbJ0ndR+tDCT9eDPlX9M4EyQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <84FB77228977DA4994BA0FC127F25319@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 62d0cccd-56b2-4767-a6fe-08d7b5ed5c1c
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2020 10:12:15.5351
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aGUvgXH6TzlCWHEkca2R5gBRfktOoRAUqiVbVzVkFN95bb2QnSofJ6CaJMvH6hhS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0202MB3370
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

T24gMjAyMC0wMi0yMCAwOToxNywgTGludXMgV2FsbGVpaiB3cm90ZToNCj4gT24gVGh1LCBGZWIg
NiwgMjAyMCBhdCA2OjMzIFBNIFJ1c3NlbGwgS2luZyAtIEFSTSBMaW51eCBhZG1pbg0KPiA8bGlu
dXhAYXJtbGludXgub3JnLnVrPiB3cm90ZToNCj4gDQo+PiBJdCBzZWVtcyB0aGF0IHNvbWV0aW1l
IGJldHdlZW4gNC4yMCBhbmQgNS41LCBzb21ldGhpbmcgaGFzIGJyb2tlbiB0aGUNCj4+IGFiaWxp
dHkgdG8gc3BlY2lmeSBncGlvLWhvZ3MgaW4gRFQgZm9yIEdQSU9zIHRoYXQgYXJlIHdyaXR0ZW4g
YXJvdW5kDQo+PiBwaW5jdHJsIGRyaXZlcnMuDQo+IChleHBsYW5hdGlvbiB0aGF0IG1ha2VzIHBl
cmZlY3Qgc2Vuc2UpDQo+PiBDb25zZXF1ZW50bHksIGFkZGluZyBhIGdwaW8taG9nIHRvIERUIGZv
ciB0aGlzIGRyaXZlciByZXN1bHRzIGluIHRoZQ0KPj4gZHJpdmVyIGVuZGxlc3NseSByZXR1cm5p
bmcgLUVQUk9CRV9ERUZFUi4NCj4gDQo+IEkgc3VzcGVjdCB0aGlzIGlzIHN4MTUweC1zcGVjaWZp
YyBhbmQgc3VzcGVjdCB0aGVzZSB0d28gY29tbWl0czoNCj4gDQo+IDFhMWQzOWUxYjhkZCBwaW5j
dHJsOiBzeDE1MHg6IFJlZ2lzdGVyIHBpbmN0cmwgYmVmb3JlIGFkZGluZyB0aGUgZ3Bpb2NoaXAN
Cj4gYjkzMDE1MWU1YjU1IHBpbmN0cmw6IHN4MTUweDogQWRkIGEgc3RhdGljIGdwaW8vcGluY3Ry
bCBwaW4gcmFuZ2UgbWFwcGluZw0KPiANCj4gSSBzdXBwb3NlIHBlb3BsZSB3ZXJlbid0IHVzaW5n
IGhvZ3MgdmVyeSBtdWNoIHdpdGggdGhlIHN4MTUweCBhbmQNCj4gaXQgZGlkbid0IHR1cm4gdXAg
aW4gdGVzdGluZyBzbyBmYXIuDQo+IA0KPiBJIGRvbid0IHRoaW5rIGZvciBleGFtcGxlIHBpbmN0
cmwtc3RtZnguYyBoYXMgdGhpcyBwcm9ibGVtLCBhcyBpdCByZWdpc3RlcnMNCj4gdGhlIHBpbiBy
YW5nZXMgZnJvbSB0aGUgZGV2aWNlIHRyZWUgYXMgcGFydCBvZiB0aGUgY29yZSBjb2RlLg0KPiBC
dXQgb3RoZXIgZHJpdmVycyBjYWxsaW5nIGdwaW9jaGlwX2FkZF9waW5fcmFuZ2UoKSBtYXkgYmUg
ZXhwZXJpZW5jaW5nDQo+IHRoaXMuDQo+IA0KPiBQZXRlci9BbmRyZXksIGRvIHlvdSBoYXZlIHNv
bWUgaWRlYT8gSGF2ZSB5b3UgdGVzdGVkIHRoaXMgdXNlY2FzZSAoaG9ncykNCj4gd2l0aCB0aGUg
c3gxNTB4Pw0KDQpJIGhhdmUgbmV2ZXIgY3JlYXRlZCBncGlvIGhvZ3MgbXlzZWxmLCBzbyBubywg
SSBoYXZlbid0IGRvbmUgYW55IHRlc3RpbmcNCndpdGggdGhhdC4gU29ycnkuIEkgY291bGQgb2Yg
Y291cnNlIHNwZW5kIHNvbWUgdGltZSBsb29raW5nIGF0IHRoaXMsIGJ1dCBJDQpkb24ndCBrbm93
IGFsbCB0aGF0IG11Y2ggYWJvdXQgdGhlIHdyaW5rbGVzIG9mIHRoZSBpbnRlcmFjdGlvbnMgYmV0
d2Vlbg0KcGluY3RybCBvY2ggZ3Bpby4gT3IgcGxhaW4gZ3Bpby9waW5jdHJsIGZvciB0aGF0IG1h
dHRlci4gU3VyZSwgSSBleHRlbmRlZA0KdGhpcyBkcml2ZXIsIGJ1dCBJIGhhdmVuJ3QgcmVhbGx5
IGxvb2tlZCBhdCB0aG9zZSBzdWItc3lzdGVtcyBzaW5jZS4gSQ0KdGhpbmsgb3RoZXJzIHdpbGwg
Y29tZSB1cCB3aXRoIGEgc29sdXRpb24gZm9yIHRoaXMgd2l0aCBtdWNoIGxlc3MgZWZmb3J0DQph
bmQgd2l0aCBsZXNzIHJpc2sgb2YgaW50cm9kdWNpbmcgbmV3IHByb2JsZW1zLi4uDQoNCkNoZWVy
cywNClBldGVyDQo=
