Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 535DFEE90F
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2019 20:58:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728648AbfKDT65 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Nov 2019 14:58:57 -0500
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:44443 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728409AbfKDT64 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Nov 2019 14:58:56 -0500
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 6F3A5891A9;
        Tue,  5 Nov 2019 08:58:53 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1572897533;
        bh=HdBTywQc8qrpgd8ZsBDiYT4SQgvtb8dj3sZGk/RXvG0=;
        h=From:To:CC:Subject:Date:References:In-Reply-To;
        b=fFaosFEgfCj2/CfG9pTFKZ9c7jlN98OkxyMbJ0ZU0iXJBR/CJC2aQj+CUHtyhSH3Z
         kw/cyrljwO9a06dRMvlcworxsJ9w1NgI2kC97RqqKK4Zh0CsYPITQmu3Ekfr+zO2yH
         OSNAjgoUn+NYb2CsaV0V4nfdDzmL4yw/yeHYkpyDoSgA8qddnse/qUEdORrBQ2iCAD
         PC3RhpP9sJWdlA7WJfdxIn1mME1vmX4ZmZYrBwQeL9IRmbaPoOrib6+2IB6tiiyEjP
         KKeCghhgeA7vPS8SXJMfuIoI5GObywi2TJ1EBBi/p977IenryFC2+MCa5EElu9tcoz
         J2Ep4yCIwAbkw==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[10.32.16.77]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5dc082fd0001>; Tue, 05 Nov 2019 08:58:53 +1300
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8)
 by svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with
 Microsoft SMTP Server (TLS) id 15.0.1156.6; Tue, 5 Nov 2019 08:58:53 +1300
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1156.000; Tue, 5 Nov 2019 08:58:53 +1300
From:   Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To:     "linus.walleij@linaro.org" <linus.walleij@linaro.org>
CC:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "bcm-kernel-feedback-list@broadcom.com" 
        <bcm-kernel-feedback-list@broadcom.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "sbranden@broadcom.com" <sbranden@broadcom.com>,
        "rjui@broadcom.com" <rjui@broadcom.com>
Subject: Re: [PATCH v3 2/2] pinctrl: bcm: nsp: implement get_direction
Thread-Topic: [PATCH v3 2/2] pinctrl: bcm: nsp: implement get_direction
Thread-Index: AQHVkqVeZmr/Y3m5nU6eLv+86DO9ead6SMkAgABMjgA=
Date:   Mon, 4 Nov 2019 19:58:52 +0000
Message-ID: <ee32b9a0d6f8ecef9c70fb684e5e29b873993cf5.camel@alliedtelesis.co.nz>
References: <20191104001819.2300-1-chris.packham@alliedtelesis.co.nz>
         <20191104001819.2300-3-chris.packham@alliedtelesis.co.nz>
         <CACRpkdb530Do3BnVBA6Q7TWOQ0_QfytqaPHPXCPoZP_742Rvzw@mail.gmail.com>
In-Reply-To: <CACRpkdb530Do3BnVBA6Q7TWOQ0_QfytqaPHPXCPoZP_742Rvzw@mail.gmail.com>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [2001:df5:b000:22:d0c9:dea8:da1e:f79e]
Content-Type: text/plain; charset="utf-8"
Content-ID: <635A444F9D55034FA62731C85A549751@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

T24gTW9uLCAyMDE5LTExLTA0IGF0IDE2OjI0ICswMTAwLCBMaW51cyBXYWxsZWlqIHdyb3RlOg0K
PiBPbiBNb24sIE5vdiA0LCAyMDE5IGF0IDE6MTggQU0gQ2hyaXMgUGFja2hhbQ0KPiA8Y2hyaXMu
cGFja2hhbUBhbGxpZWR0ZWxlc2lzLmNvLm56PiB3cm90ZToNCj4gDQo+ID4gVGhlIGdldF9kaXJl
Y3Rpb24gYXBpIGlzIHN0cm9uZ2x5IHJlY29tbWVuZGVkIHRvIGJlIGltcGxlbWVudGVkLiBJbiBm
YWN0DQo+ID4gaWYgaXQgaXMgbm90IGltcGxlbWVudGVkIGdwaW8taG9ncyB3aWxsIG5vdCBnZXQg
dGhlIGNvcnJlY3QgZGlyZWN0aW9uLg0KPiA+IEFkZCBhbiBpbXBsZW1lbnRhdGlvbiBvZiBnZXRf
ZGlyZWN0aW9uIGZvciB0aGUgbnNwLWdwaW8gZHJpdmVyLg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYt
Ynk6IENocmlzIFBhY2toYW0gPGNocmlzLnBhY2toYW1AYWxsaWVkdGVsZXNpcy5jby5uej4NCj4g
PiBSZXZpZXdlZC1ieTogRmxvcmlhbiBGYWluZWxsaSA8Zi5mYWluZWxsaUBnbWFpbC5jb20+DQo+
IA0KPiBCVFcgSSB0aGluayBpdCBsb29rcyBsaWtlIHRoaXMgdGhlIEdQSU8gcGFydCBvZiB0aGlz
IGRyaXZlciBjYW4gYmUNCj4gY29udmVydGVkIHRvIHVzZSBHUElPX0dFTkVSSUMuIENvbXBhcmUg
dG8gb3RoZXINCj4gZHJpdmVycyBzdWNoIGFzIGRyaXZlcnMvZ3Bpby9ncGlvLWZ0Z3BpbzAxMC5j
Lg0KPiANCj4gSXQncyBhIGZ1biB3YXkgdG8gY3V0IGRvd24gbGluZXMgaWYgeW91IGhhdmUgdGlt
ZSB0byBjaGVjaw0KPiBhbmQgdGVzdCENCj4gDQoNCkknbGwgc2VlIGlmIEkgY2FuIGZpdCBpdCBp
bi4gR290IGFub3RoZXIgcHJvYmxlbSBJJ20gY2hhc2luZyBvbiB0aGUNCnNhbWUgcGxhdGZvcm0u
DQo=
