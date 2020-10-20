Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CA28293A45
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Oct 2020 13:50:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393827AbgJTLuP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 20 Oct 2020 07:50:15 -0400
Received: from mail-am6eur05on2047.outbound.protection.outlook.com ([40.107.22.47]:23905
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2393641AbgJTLuP (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 20 Oct 2020 07:50:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RskzCfNlDJjn5Aov6/eZ+10goRnXO8y+MPqquHxKkMF97EbY3rFWveCmazN2u8Kxtr/xWBrqvJFQ+ls33rYr/2l8RgQ8PmMtoCl/s4BeE1iViBu+V/aFG6exhk51tQWHw4p1W1XLoZMOdtoJyM92LOfvQLhntivgRMYWfEwxiPJDDJGGmw3r6yP6Fd/sojYZVG56c83FxUIOGkZWImyDxcLGPfI/jGjUij+uXHt1GVgIwkuBhfrPuruj+gAwFCYB6nYAF0xyvNQx6HDHjZQUgKl2OzH7W4llk//BtbwOqOJXMopHXaDmORSPB4zq07zizOWhSsV+FfRhiBGITI4JJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Nravl+rFd3KS/IziKbM8ppHBC7Bidz1hRHZtNObWUM=;
 b=Q9CqlZry2bV2Qy/sHwqxfoTfhdhJB552lufxYapQegHXUBno9NF1s/OBr6TFHw7kFRf/KNGEvCspC6wOZH2UrbfBNvnJCw634L+eu75ujviYrwJAbooI9lFEDchvCwMgE0zGbBkDJNZHg1/CyfXSm8hFego7SzrulMlBgl5msvV6+AQXEY8SbSSIoZFmOUF2ZDrvZ54794bYEp2YKKOVMAO0Hc8N0wLXEAs+6aN7wD1ANYRzTb2VaiJxJlNXVlKp7YN9gqZ05vTF4NTQlPSEsUIfi/9IQJUEE+tZhbMTO1N+9X8k7pgM40r55XHUdHN/V01sqU59ZNr+WmwYz+RePw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Nravl+rFd3KS/IziKbM8ppHBC7Bidz1hRHZtNObWUM=;
 b=kDNdD+IXlRFOVxQc5Hz3JrMwkadLm1ZBD8XoB77CV2BxJ9BxlHhfwSxf44/a8ZRiMT2rac3UkMzFVFPCEiIL51SzDConHkZERQCGkUAvjhZyP9kBceB3HIN3SRvczBdECzDfTKJ96Cu2CaLo/Kk9Y6bMnMg4MSP5f5NP5/kmNzY=
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com (2603:10a6:7:55::20) by
 HE1PR0301MB2281.eurprd03.prod.outlook.com (2603:10a6:3:22::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3477.20; Tue, 20 Oct 2020 11:50:11 +0000
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::b813:5aaa:3d25:f976]) by HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::b813:5aaa:3d25:f976%3]) with mapi id 15.20.3477.028; Tue, 20 Oct 2020
 11:50:11 +0000
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>
CC:     linux-power <linux-power@fi.rohmeurope.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "trix@redhat.com" <trix@redhat.com>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: bd70528: remove unneeded break
Thread-Topic: [PATCH] gpio: bd70528: remove unneeded break
Thread-Index: AQHWpk7PU2Dv45hS80+h/uWqZCrO16mgRR4AgAAbmgCAAAD+gA==
Date:   Tue, 20 Oct 2020 11:50:11 +0000
Message-ID: <09712ee94610998c26658dad5c12720299ff957d.camel@fi.rohmeurope.com>
References: <20201019193353.13066-1-trix@redhat.com>
         <5b13773306265f89366b86afba71d2b4a4130e2b.camel@fi.rohmeurope.com>
         <CAHp75VdxXw0_W+MytA72sBfYT6nr=xHc+tTsTp7GPLnR9EgOVg@mail.gmail.com>
In-Reply-To: <CAHp75VdxXw0_W+MytA72sBfYT6nr=xHc+tTsTp7GPLnR9EgOVg@mail.gmail.com>
Reply-To: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Accept-Language: fi-FI, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none
 header.from=fi.rohmeurope.com;
x-originating-ip: [62.78.225.252]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 99f257af-96e0-4ec2-da5a-08d874ee4d0b
x-ms-traffictypediagnostic: HE1PR0301MB2281:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HE1PR0301MB228195E1A3C9BB3DE77CF58FAD1F0@HE1PR0301MB2281.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dq/m2LHV9CKPf1r9IRUtMZcpcq/nEvDZImFi7F10xp3dbbBhpKkrlH96SfoZu8LwXIBTwdsjDB+5jT4ktnpYZE4lRebcXSuFGj/g9B68G77pcLnXan28BZ3rpyG1fO0M3za0lr4ifDlJokcCo+7iQSMZPSoXzpOkeTMRwJ3K8YY9xAsrmHEdKL+6SC3Otdsg4E6YRqU1+xjtwENAkLTHSb5Bt5N6a7kUqtOTvck9UI4NIyH4+HyKkTe603UwJQ1OUEM+c5NPxjnD55SBPRNaJsUyoPjomdQZjWY2+TiOjSzGBmxQTEYdFznmdWlDOHdyzHuOqIJ1KrI4u2JbJewisw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR03MB3162.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(376002)(346002)(39850400004)(396003)(6486002)(4001150100001)(6512007)(64756008)(66476007)(66446008)(6506007)(26005)(76116006)(66946007)(8936002)(8676002)(316002)(5660300002)(66556008)(2616005)(4744005)(6916009)(71200400001)(53546011)(186003)(4326008)(86362001)(478600001)(2906002)(54906003)(3450700001)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: bJqoo/24KbW7+MulCMFhxUN6NWrwoxEPEAuD24EgVwG9+jlXtWrC5BNPh+r+W/yspOxTk6qWhlljbpUhPcvvQ5QwAvAhL+C21j/PQdHDrkv07Lmdg2XhRvfky3PnJAB5MRVTdQqGgEyWpWbDZanPUMnanEWRYCZkdNhShEh/VGWBqk75mqkJRhi7LaVkyJV4TU6lNUxryyI2myePlwbfYq49R4WamVYwTku7FdoIZOOE2hcvrUAvt2IXAn4u5pbXVE+eCvJbDZmTN4P0b4NSJqUR3/pLIqof7h0QzBcUTGgIZEJDLfiO8gQ0pNh5KwdGLC2iEnUo5q9zhHJCvC4p2A1lboWuGWSgXQ7z/PVb1mpLZZd0c5FL903HAqNZAeUWkJWSnbl3fTc0iaMrjBviorw0Ghd0yP0am49lpR7s+hiy6E7RDQhoFr+jjUdwpC0jTTIxj3LtE++0B6cjyG7PgbYFTYzCcQ8HNtz9BeYX9VSG1FkT4YS3tTdIS0jV7ZpkfWNt6ytmDLOKHnlh92/38ceCYeWxZG/g0p0qxf8GpfMnqPkCjMWdBtyudtw8WMir1rRoz1SOquYSnaEO0xqNSBPHL/3GETsxWqW6Qj51YOBNHq/uJKfWvFoaQ0qZRKXprItmVGprTihglogaREq2Sw==
Content-Type: text/plain; charset="utf-8"
Content-ID: <9BE7C5E87BF715448D8C025A7DB9F366@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR03MB3162.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99f257af-96e0-4ec2-da5a-08d874ee4d0b
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2020 11:50:11.5286
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6Nt4WeiX2SSar5ZBBIqQZC5TAl8BiPGyPFt6yuBfbgHEzTcDLF0/VHjh2Iez/vMlUF4WitkiiRA8zSjUo3eK3ZRV9Yisq6Gf6gUGYGZy9fcHoNGiDeeAkqQEPggJYkdw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0301MB2281
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DQpPbiBUdWUsIDIwMjAtMTAtMjAgYXQgMTQ6NDYgKzAzMDAsIEFuZHkgU2hldmNoZW5rbyB3cm90
ZToNCj4gT24gVHVlLCBPY3QgMjAsIDIwMjAgYXQgMjoyNiBQTSBWYWl0dGluZW4sIE1hdHRpDQo+
IDxNYXR0aS5WYWl0dGluZW5AZmkucm9obWV1cm9wZS5jb20+IHdyb3RlOg0KPiA+IE9uIE1vbiwg
MjAyMC0xMC0xOSBhdCAxMjozMyAtMDcwMCwgdHJpeEByZWRoYXQuY29tIHdyb3RlOg0KPiA+ID4g
LSAgICAgICAgICAgICBicmVhazsNCj4gPiBNeSBwZXJzb25hbCB0YXN0ZSBpcyBhbHNvIHRvIG9t
aXQgdGhlc2UgYnJlYWtzIGJ1dCBJIGFtIHByZXR0eSBzdXJlDQo+ID4gSQ0KPiA+IHNhdyBzb21l
IHRvb2xpbmcgaXNzdWluZyBhIHdhcm5pbmcgYWJvdXQgZmFsbGluZyB0aHJvdWdoIHRoZQ0KPiA+
IHN3aXRjaC0NCj4gPiBjYXNlIGJhY2sgd2hlbiBJIHdyb3RlIHRoaXMuIE1vc3QgcHJvYmFibHkg
Y2hlY2twYXRjaCBkaWRuJ3QgbGlrZQ0KPiA+IHRoYXQNCj4gPiBiYWNrIHRoZW4uIEFueXdheXMg
LSBpZiB5b3UgaGF2ZSBubyB3YXJuaW5ncyBmcm9tIGFueSBvZiB0aGUgdG9vbHMNCj4gPiAtDQo+
ID4gdGhpcyBpbmRlZWQgbG9va3MgYmV0dGVyICh0byBtZSkgd2l0aG91dCB0aGUgYnJlYWsgOikN
Cj4gDQo+IEpGWUk6IGl0J3MgYSBjbGFuZyB3aGljaCBhY3R1YWxseSAqaXMqIGNvbXBsYWluaW5n
IGZvciBhbiBleHRyYQ0KPiBicmVhay4NCj4gDQpPaC4gSSBqdXN0IHJlcGxpZWQgYmVmb3JlIHNl
ZWluZyB0aGlzLiBTbyBhY3R1YWxseSwgY2hlY2twYXRjaA0KY29tcGxhaW5zIGFib3V0IG1pc3Np
bmcgYnJlYWsgYW5kIGNsYW5nIGFib3V0IGV4aXN0aW5nIGJyZWFrLiBJJ20NCmdldHRpbmcgbXVj
aCBtb3JlIG5hZ2dpbmcgYXQgd29yayB0aGFuIGF0IGhvbWUhDQoNCkJlc3QgUmVnYXJkcw0KCU1h
dHRpDQoNCg==
