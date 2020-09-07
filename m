Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07522260611
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Sep 2020 23:11:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727784AbgIGVL4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Sep 2020 17:11:56 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:45204 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726994AbgIGVLz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Sep 2020 17:11:55 -0400
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 4E3B580719;
        Tue,  8 Sep 2020 09:11:50 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1599513110;
        bh=qY43FpSIb2O4d73LN2PEOs4Kyx82EZudCVnoDOcDXx0=;
        h=From:To:CC:Subject:Date:References:In-Reply-To;
        b=StXi5U9ioUkfBU/A4HAFCeebv3QOQIa6dID0Dw6dkS8TiFaZ9QwBsNiFV8ta//IBM
         grGeM7+MLGHMb2DwVVwcxMDOZa1QIG2qpuNVpuMXxmPqtBZxEleTEAkVm4cXerO3/f
         L83aGtoDcUH6R1S8ZT90ZAEj0XRCMXwfLcD9ImspiRNlwzCG1Qe/ysTWgRkxMlwsoh
         tZBYcoZoQXQZpq5OuLi1inVrthqyB99L0vMDntPHCWeUYTDvjVJDeUrmda+zYmY8/U
         dT7hx9O7dLNaQXC900GJHOkUmD8xEx2aw/WToSpXUrenrNWu1IDPEKNjmHu6V0Vqlt
         1g2URbfAvPASw==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[10.32.16.77]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5f56a2160001>; Tue, 08 Sep 2020 09:11:50 +1200
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8)
 by svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with
 Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 8 Sep 2020 09:11:50 +1200
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.006; Tue, 8 Sep 2020 09:11:50 +1200
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
Thread-Index: AQHWhMBx9UPh5FBBykunMtOiHpEnW6lciSsAgABZMwCAAADXAIAAAR+A
Date:   Mon, 7 Sep 2020 21:11:49 +0000
Message-ID: <95868563-7637-83b4-38fc-eea71bacaf0b@alliedtelesis.co.nz>
References: <20200907024149.20001-1-chris.packham@alliedtelesis.co.nz>
 <20200907024149.20001-3-chris.packham@alliedtelesis.co.nz>
 <20200907154532.GY3112546@lunn.ch>
 <36712d90-6bfe-8965-22b1-6b6dd460116d@alliedtelesis.co.nz>
 <20200907210748.GF3254313@lunn.ch>
In-Reply-To: <20200907210748.GF3254313@lunn.ch>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.32.1.11]
Content-Type: text/plain; charset="utf-8"
Content-ID: <D942245C49CCD04A94B81883E0243340@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DQpPbiA4LzA5LzIwIDk6MDcgYW0sIEFuZHJldyBMdW5uIHdyb3RlOg0KPiBPbiBNb24sIFNlcCAw
NywgMjAyMCBhdCAwOTowNDo0OFBNICswMDAwLCBDaHJpcyBQYWNraGFtIHdyb3RlOg0KPj4gT24g
OC8wOS8yMCAzOjQ1IGFtLCBBbmRyZXcgTHVubiB3cm90ZToNCj4+PiBPbiBNb24sIFNlcCAwNywg
MjAyMCBhdCAwMjo0MTo0OFBNICsxMjAwLCBDaHJpcyBQYWNraGFtIHdyb3RlOg0KPj4+PiBUaGUg
c3dpdGNoZXMgd2l0aCBpbnRlZ3JhdGVkIENQVXMgaGF2ZSBvbmx5IGdvdCBhIHNpbmdsZSBpMmMg
Y29udHJvbGxlci4NCj4+Pj4gVGhlIGluY29ycmVjdGx5IGdhaW5lZCBvbmUgd2hlbiB0aGV5IHdl
cmUgc3BsaXQgZnJvbSB0aGUgQXJtYWRhLVhQLg0KPj4gU29tZW9uZSBwb2ludGVkIG91dCBhIHNt
YWxsIGdyYW1tbyBpbnN0ZWFkIG9mICJUaGUgaW5jb3JyZWN0bHkiIGl0DQo+PiBzaG91bGQgYmUg
IlRoZXkgaW5jb3JyZWN0bHkiLiBJcyBpdCB3b3J0aCBtZSBzZW5kaW5nIGEgdjIganVzdCB0byBm
aXggdGhhdD8NCj4gWW91IGFyZSBhc2tpbmcgc29tZWJvZHkgd2hvIGlzIGR5c2xleGljLCBhbmQg
b2Z0ZW4gZmFpbHMgdG8gbm90aWNlDQo+IHRoaW5ncyBsaWtlIHRoaXMsIHBhcnRpY3VsYXJseSB3
aGVuIHdyaXR0ZW4gYnkgbWUgOi0pDQo+DQo+IFVwIHRvIHlvdS4NCkknbGwgc2VuZCBhIHYyIGZp
eGluZyB0aGUgZ3JhbW1vIGFuZCBpbmNsdWRpbmcgeW91ciByLWJ5LiBJZiB0aGUgc2VyaWVzIA0K
aGFzIGFscmVhZHkgYmVlbiBwaWNrZWQgdXAgdGhlbiBubyBncmVhdCBsb3NzLg0K
