Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE4C5274F69
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Sep 2020 05:08:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726686AbgIWDI2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 22 Sep 2020 23:08:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726589AbgIWDI2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Sep 2020 23:08:28 -0400
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [IPv6:2001:df5:b000:5::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 048DBC0613D1
        for <linux-gpio@vger.kernel.org>; Tue, 22 Sep 2020 20:08:27 -0700 (PDT)
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 88C8A80719;
        Wed, 23 Sep 2020 15:08:23 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1600830503;
        bh=4UUUhCCPLuOo9EStTf3vEeWwEhU+NiF7M4oRHTxF2Uk=;
        h=From:To:CC:Subject:Date:References:In-Reply-To;
        b=ZgjM9O75MDDrw1EUGFStQN6BkZTg17z8PqREyRJkIANjhaXh+OZ55ogdXd46MFSjz
         4WkGFKN8rXKWSU7EKI/g1GEt3ttIa5/wQ/7HCWB3uHxvD8KB8i7Povy1W/fekz1F2D
         g8fQvdbXbcIFSHcuHcSFhpH8clF/YY9XYFLvPu+whJude/QHpyQ7f1NJNhW62yl5Um
         mYPErV1s/nr0qPaJ1zagvIuWjsc2gXzdNIbtBQayTm5m+nYJT337/jigttO9JOXOab
         Ow85abuMeIBLp6JOdXLXRUps9SzJ0KblMpslBHG4zAck2MFVKSbRyzK2IawR3MsP0O
         x6+wEfqG4uVBg==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[10.32.16.77]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5f6abc270002>; Wed, 23 Sep 2020 15:08:23 +1200
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 23 Sep 2020 15:08:22 +1200
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.006; Wed, 23 Sep 2020 15:08:22 +1200
From:   Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Jason Cooper <jason@lakedaemon.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>
CC:     Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 3/3] ARM: dts: Add i2c0 pinctrl information for
 98dx3236
Thread-Topic: [PATCH v2 3/3] ARM: dts: Add i2c0 pinctrl information for
 98dx3236
Thread-Index: AQHWhVxD6lFX2c6hV0ONw/U375PQvalkbE2AgBBtZgA=
Date:   Wed, 23 Sep 2020 03:08:22 +0000
Message-ID: <bb9b129a-7cbf-d303-95e6-da2b53a62df3@alliedtelesis.co.nz>
References: <20200907211712.9697-1-chris.packham@alliedtelesis.co.nz>
 <20200907211712.9697-4-chris.packham@alliedtelesis.co.nz>
 <CACRpkdZ13B==RROumpfB1sjO_uPG0Jx-LRwjm-w_6wr_wb1v8A@mail.gmail.com>
In-Reply-To: <CACRpkdZ13B==RROumpfB1sjO_uPG0Jx-LRwjm-w_6wr_wb1v8A@mail.gmail.com>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.32.1.11]
Content-Type: text/plain; charset="utf-8"
Content-ID: <58C2E4D0B549BC4A8DAC6BDCC57162CD@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGkgSmFzb24sIEFuZHJldywgR3JlZ29yeSwNCg0KT24gMTMvMDkvMjAgNDoxNiBhbSwgTGludXMg
V2FsbGVpaiB3cm90ZToNCj4gT24gTW9uLCBTZXAgNywgMjAyMCBhdCAxMToxNyBQTSBDaHJpcyBQ
YWNraGFtDQo+IDxjaHJpcy5wYWNraGFtQGFsbGllZHRlbGVzaXMuY28ubno+IHdyb3RlOg0KPg0K
Pj4gQWRkIHBpbmN0cmwgaW5mb3JtYXRpb24gZm9yIHRoZSA5OGR4MzIzNiAoYW5kIHZhcmlhbnRz
KS4gVGhlcmUgaXMgb25seQ0KPj4gb25lIGNob2ljZSBmb3IgaTJjMCBNUFAxNCBhbmQgTVBQMTUu
DQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogQ2hyaXMgUGFja2hhbSA8Y2hyaXMucGFja2hhbUBhbGxp
ZWR0ZWxlc2lzLmNvLm56Pg0KPj4gUmV2aWV3ZWQtYnk6IEFuZHJldyBMdW5uIDxhbmRyZXdAbHVu
bi5jaD4NCj4gUmV2aWV3ZWQtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJv
Lm9yZz4NCj4NCj4gUGxlYXNlIG1lcmdlIHRoaXMgdGhyb3VnaCB0aGUgQVJNIFNvQyBtYWludGVu
YW5jZSBwYXRoLg0KDQpBcmUgeW91IGFibGUgdG8gcGljayB0aGlzIHVwIHZpYSB0aGUgbXZlYnUg
dHJlZSBvciBzaG91bGQgSSBzZW5kIGl0IHZpYSANCnRoZSBSTUtzIHBhdGNoIHRyYWNraW5nIHN5
c3RlbT8NCg0KSW5jaWRlbnRhbGx5IEkgbm90aWNlIHRoZXJlIGlzIG5vIGxvbmdlciBhIGxpbnV4
LW12ZWJ1LmdpdCBvbiANCmdpdC5pbmZyYWRlYWQub3JnIGlzIHRoZXJlIGEgcGVuZGluZyB1cGRh
dGUgdG8gTUFJTlRBSU5FUlMuDQo=
