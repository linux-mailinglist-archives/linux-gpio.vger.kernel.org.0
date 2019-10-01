Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 260E6C2BEA
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Oct 2019 04:35:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727645AbfJACdq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 30 Sep 2019 22:33:46 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:52066 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726789AbfJACdp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Sep 2019 22:33:45 -0400
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 7B077891AA;
        Tue,  1 Oct 2019 15:33:42 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1569897222;
        bh=cr1LwIx1Qr1YHR8oFWzfuE98JzYPV5p2sKvZnEkZVrs=;
        h=From:To:CC:Subject:Date;
        b=J7P5S8YNJtqVMnJLXPFsFRBTxOffZ2ndk+Jgn25M3KzIb7dhZHQGOmwbtbfo6/YG9
         tXim6FVI9DBiUSCvwzkwaJa2y3SlZYB9oXEda0pJe6ihF3gltHKmga+2wHEeq+C89y
         8evUS0C4h6FuE6dmfulx/d4r72q4L3qV58IhBrLjSYXV9r5zoW1gu3kOb5V35W8VU5
         Z3mWPym6V8UP/sCF80tKYvOgXN33jjHIfd6E5JLg6IE6AKcBAC3hyTAsAbL9IMzRv8
         K0E2ci9lPvQRdhWefp6JecDBFspzQXmV8ILH+35iBpvkRgL9DzfMaq9sj8UtCf21q7
         W4hjPnCCqA4/A==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[10.32.16.77]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5d92bb060000>; Tue, 01 Oct 2019 15:33:42 +1300
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) with Microsoft SMTP Server
 (TLS) id 15.0.1156.6; Tue, 1 Oct 2019 15:33:38 +1300
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1156.000; Tue, 1 Oct 2019 15:33:38 +1300
From:   Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To:     "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "rayagonda.kokatanur@broadcom.com" <rayagonda.kokatanur@broadcom.com>,
        "bcm-kernel-feedback-list@broadcom.com" 
        <bcm-kernel-feedback-list@broadcom.com>,
        "li.jin@broadcom.com" <li.jin@broadcom.com>,
        "sbranden@broadcom.com" <sbranden@broadcom.com>,
        "rjui@broadcom.com" <rjui@broadcom.com>
CC:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: Problem sharing interrupts between gpioa and uart0 on Broadcom
 Hurricane 2 (iProc)
Thread-Topic: Problem sharing interrupts between gpioa and uart0 on Broadcom
 Hurricane 2 (iProc)
Thread-Index: AQHVeAChr1G1lS1DPESIPAb5KujH5A==
Date:   Tue, 1 Oct 2019 02:33:38 +0000
Message-ID: <32c3d1dfe61a656e3250438d887e5ba91bd880d0.camel@alliedtelesis.co.nz>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [2001:df5:b000:22:dd9e:6998:e07c:4b65]
Content-Type: text/plain; charset="utf-8"
Content-ID: <98FB4C18FE312B41935AE4888DB878BF@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGksDQoNCldlIGhhdmUgYSBwbGF0Zm9ybSB1c2luZyB0aGUgQkNNNTMzNDQgaW50ZWdyYXRlZCBz
d2l0Y2gvQ1BVLiBUaGlzIGlzDQpwYXJ0IG9mIHRoZSBIdXJyaWNhbmUgMiAodGVjaG5pY2FsbHkg
V29sZmhvdW5kKSBmYW1pbHkgb2YgZGV2aWNlcy4NCg0KQ3VycmVudGx5IHdlJ3JlIHVzaW5nIHBp
ZWNlcyBvZiBCcm9hZGNvbSdzICJpUHJvYyIgU0RLIGJhc2VkIG9uIGFuIG91dA0Kb2YgZGF0ZSBr
ZXJuZWwgYW5kIHdlJ2QgdmVyeSBtdWNoIGxpa2UgdG8gYmUgcnVubmluZyBhcyBjbG9zZSB0bw0K
dXBzdHJlYW0gYXMgcG9zc2libGUuIFRoZSBmYWN0IHRoYXQgdGhlIFViaXF1aXRpIFVuaUZpIFN3
aXRjaCA4IGlzDQp1cHN0cmVhbSBnaXZlcyBtZSBzb21lIGhvcGUuDQoNCk15IGN1cnJlbnQgcHJv
YmxlbSBpcyB0aGUgZmFjdCB0aGF0IHRoZSB1YXJ0MCBpbnRlcnJ1cHQgaXMgc2hhcmVkIHdpdGgN
CnRoZSBDaGlwIENvbW1vbiBBIGdwaW8gYmxvY2suIFdoZW4gSSBoYXZlIGFuZCBpbnRlcnJ1cHQg
bm9kZSBvbiB0aGUNCmdwaW8gaW4gdGhlIGRldmljZSB0cmVlIEkgZ2V0IGFuIGluaXQgZXhpdCBh
dCBzdGFydHVwLiBJZiBJIHJlbW92ZSB0aGUNCmludGVycnVwdCBub2RlIHRoZSBzeXN0ZW0gd2ls
bCBib290IChleGNlcHQgSSBkb24ndCBnZXQgY2FzY2FkZWQNCmludGVycnVwdHMgZnJvbSB0aGUg
R1BJT3MpLg0KDQpMb29raW5nIGF0IHRoZSBwaW5jdHJsLW5zcC1ncGlvLmMgaXQgbG9va3MgYXMg
dGhvdWdoIEkgbWlnaHQgYmUgYWJsZSB0bw0KbWFrZSB0aGlzIHdvcmsgaWYgSSBjYW4gY29udmlu
Y2UgdGhlIGdwaW8gY29kZSB0byByZXR1cm4gSVJRX0hBTkRMRUQgb3INCklSUV9OT05FIGJ1dCBJ
J20gc3RydWdnbGluZyBhZ2FpbnN0IHRoZSBmYWN0IHRoYXQgdGhlIHBpbmN0cmwtaXByb2MtDQpn
cGlvLmMgZGVmZXJzIGl0J3MgaW50ZXJydXB0IGhhbmRpbmcgdG8gdGhlIGdwaW8gY29yZS4NCg0K
SXMgdGhlcmUgYW55IHdheSBJIGNhbiBnZXQgdGhlIGdwaW8gY29yZSB0byBkZWFsIHdpdGggdGhl
IHNoYXJlZA0KaW50ZXJydXB0Pw0KDQpUaGFua3MsDQpDaHJpcw0K
