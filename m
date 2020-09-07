Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0D2B260608
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Sep 2020 23:05:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727119AbgIGVFJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Sep 2020 17:05:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726446AbgIGVFI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Sep 2020 17:05:08 -0400
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [IPv6:2001:df5:b000:5::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC0A3C061573
        for <linux-gpio@vger.kernel.org>; Mon,  7 Sep 2020 14:05:07 -0700 (PDT)
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 23DA980719;
        Tue,  8 Sep 2020 09:04:54 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1599512694;
        bh=2o4BAsLs2duPVFnx5tJT1CeBpaPWP7Bjhar4MZ290gA=;
        h=From:To:CC:Subject:Date:References:In-Reply-To;
        b=NuWMxZEvMeKbI7JByXFxGpsz3+IKUnvAhdrcLBzikbaYvCcP+pe+goClIbjqDbTQ+
         BcvVZN+j3yhASqjlFJrITRMpsrTTpts6bT3WYfL5LRsPmAdVNvoyq0i620L6KRT593
         17k7Q/VlciTV669N89eA4LUXOPUZhEVFxCMTQjez+gFodz8SOaEoVqYGdMyq9wPtcE
         4DKT2WAQyOeh0oVyJ7Hm52X2wE2QQwEbhuN5ZDpTf8Hh1BVyP7cCI/rXfg1nXOErNz
         puC1W2lExiDNd/lJOmOKrD7DBuwfqWQSqjMy2nyh4qI/UpAOl6akjFZHDF9d1StCC1
         mA3d9mrQWwEJQ==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[10.32.16.77]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5f56a0760000>; Tue, 08 Sep 2020 09:04:54 +1200
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 8 Sep 2020 09:04:48 +1200
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.006; Tue, 8 Sep 2020 09:04:48 +1200
From:   Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To:     Andrew Lunn <andrew@lunn.ch>
CC:     "jason@lakedaemon.net" <jason@lakedaemon.net>,
        "gregory.clement@bootlin.com" <gregory.clement@bootlin.com>,
        "sebastian.hesselbarth@gmail.com" <sebastian.hesselbarth@gmail.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/3] ARM: dts: Remove non-existent i2c1 from 98dx3236
Thread-Topic: [PATCH 2/3] ARM: dts: Remove non-existent i2c1 from 98dx3236
Thread-Index: AQHWhMBx9UPh5FBBykunMtOiHpEnW6lciSsAgABZMwA=
Date:   Mon, 7 Sep 2020 21:04:48 +0000
Message-ID: <36712d90-6bfe-8965-22b1-6b6dd460116d@alliedtelesis.co.nz>
References: <20200907024149.20001-1-chris.packham@alliedtelesis.co.nz>
 <20200907024149.20001-3-chris.packham@alliedtelesis.co.nz>
 <20200907154532.GY3112546@lunn.ch>
In-Reply-To: <20200907154532.GY3112546@lunn.ch>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.32.1.11]
Content-Type: text/plain; charset="utf-8"
Content-ID: <7792CDCDA1D5F04087248E37E719BDB9@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DQpPbiA4LzA5LzIwIDM6NDUgYW0sIEFuZHJldyBMdW5uIHdyb3RlOg0KPiBPbiBNb24sIFNlcCAw
NywgMjAyMCBhdCAwMjo0MTo0OFBNICsxMjAwLCBDaHJpcyBQYWNraGFtIHdyb3RlOg0KPj4gVGhl
IHN3aXRjaGVzIHdpdGggaW50ZWdyYXRlZCBDUFVzIGhhdmUgb25seSBnb3QgYSBzaW5nbGUgaTJj
IGNvbnRyb2xsZXIuDQo+PiBUaGUgaW5jb3JyZWN0bHkgZ2FpbmVkIG9uZSB3aGVuIHRoZXkgd2Vy
ZSBzcGxpdCBmcm9tIHRoZSBBcm1hZGEtWFAuDQpTb21lb25lIHBvaW50ZWQgb3V0IGEgc21hbGwg
Z3JhbW1vIGluc3RlYWQgb2YgIlRoZSBpbmNvcnJlY3RseSIgaXQgDQpzaG91bGQgYmUgIlRoZXkg
aW5jb3JyZWN0bHkiLiBJcyBpdCB3b3J0aCBtZSBzZW5kaW5nIGEgdjIganVzdCB0byBmaXggdGhh
dD8NCj4+DQo+PiBGaXhlczogNDNlMjhiYTg3NzA4ICgiQVJNOiBkdHM6IFVzZSBhcm1hZGEtMzcw
LXhwIGFzIGEgYmFzZSBmb3IgYXJtYWRhLXhwLTk4ZHgzMjM2IikNCj4+IFNpZ25lZC1vZmYtYnk6
IENocmlzIFBhY2toYW0gPGNocmlzLnBhY2toYW1AYWxsaWVkdGVsZXNpcy5jby5uej4NCj4gUmV2
aWV3ZWQtYnk6IEFuZHJldyBMdW5uIDxhbmRyZXdAbHVubi5jaD4NCj4NCj4gICAgICBBbmRyZXc=
