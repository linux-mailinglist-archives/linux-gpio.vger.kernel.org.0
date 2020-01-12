Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8211413881D
	for <lists+linux-gpio@lfdr.de>; Sun, 12 Jan 2020 21:00:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733212AbgALUA6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 12 Jan 2020 15:00:58 -0500
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:46912 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728659AbgALUA6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 12 Jan 2020 15:00:58 -0500
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 2B141886BF;
        Mon, 13 Jan 2020 09:00:55 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1578859255;
        bh=IL1PdJcKPjwwEdc8J7wiAsXAM3GoztCVHbvafOTX1zQ=;
        h=From:To:Subject:Date:References:In-Reply-To;
        b=CSIf8zzef7dEYp1DL6QhYthfJZu/dlT6Ctgg0s6NR4HbVeIvHatiwZ7die+7XNVjr
         CC4+GikPKHqO+1pvUroGu/Qon2OI/M3TVNyl91GckDt2Qc3Jmfzx4j9cGizptbPJmd
         9avqT1OeHSxnUw1ll+it/3j9/K0MQ7eGBsC4SDHND/YPUQKAmftd4T4mg4TE1BW/9h
         5F910XTXZ9/Ax+tO+Y+jaj9GMkZo0JaW81jUje+JrntmyqWXOBPRfjdOUVURJ3oSDe
         SljtZkXPv7N2ZWVSTBlyPdzbrAMK51cpYCEOR7lW2hNLLQOczvRuBt6q+iXE5478dy
         QHhZ6xQRLO0LA==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[10.32.16.77]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5e1b7af70001>; Mon, 13 Jan 2020 09:00:55 +1300
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8)
 by svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with
 Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 13 Jan 2020 09:00:54 +1300
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1473.005; Mon, 13 Jan 2020 09:00:54 +1300
From:   Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "bcm-kernel-feedback-list@broadcom.com" 
        <bcm-kernel-feedback-list@broadcom.com>,
        "yuehaibing@huawei.com" <yuehaibing@huawei.com>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "rjui@broadcom.com" <rjui@broadcom.com>,
        "rayagonda.kokatanur@broadcom.com" <rayagonda.kokatanur@broadcom.com>,
        "sbranden@broadcom.com" <sbranden@broadcom.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "li.jin@broadcom.com" <li.jin@broadcom.com>
Subject: Re: [PATCH v1 1/1] pinctrl: iproc: Use platform_get_irq_optional() to
 avoid error message
Thread-Topic: [PATCH v1 1/1] pinctrl: iproc: Use platform_get_irq_optional()
 to avoid error message
Thread-Index: AQHVx2nXfGk87Uyk9UmbQT0PK/pn36fmnTwA
Date:   Sun, 12 Jan 2020 20:00:54 +0000
Message-ID: <f9ea8a877194fb0a928ab4f41171a5a7ef3233f0.camel@alliedtelesis.co.nz>
References: <20200110035524.23511-1-rayagonda.kokatanur@broadcom.com>
In-Reply-To: <20200110035524.23511-1-rayagonda.kokatanur@broadcom.com>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [2001:df5:b000:22:d1a1:ea74:6baa:5aa3]
Content-Type: text/plain; charset="utf-8"
Content-ID: <B700B6FD4109D04A82F8CC6910E30027@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

T24gRnJpLCAyMDIwLTAxLTEwIGF0IDA5OjI1ICswNTMwLCBSYXlhZ29uZGEgS29rYXRhbnVyIHdy
b3RlOg0KPiBVc2UgcGxhdGZvcm1fZ2V0X2lycV9vcHRpb25hbCgpIGluc3RlYWQgb2YgcGxhdGZv
cm1fZ2V0X2lycSgpIHRvIGF2b2lkDQo+IGJlbG93IGVycm9yIG1lc3NhZ2UgZHVyaW5nIHByb2Jl
Og0KPiANCj4gWyAwLjU4OTEyMV0gaXByb2MtZ3BpbyA2NjQyNDgwMC5ncGlvOiBJUlEgaW5kZXgg
MCBub3QgZm91bmQNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFJheWFnb25kYSBLb2thdGFudXIgPHJh
eWFnb25kYS5rb2thdGFudXJAYnJvYWRjb20uY29tPg0KDQpSZXZpZXdlZC1ieTogQ2hyaXMgUGFj
a2hhbSA8Y2hyaXMucGFja2hhbUBhbGxpZWR0ZWxlc2lzLmNvLm56Pg0KDQo+IC0tLQ0KPiAgZHJp
dmVycy9waW5jdHJsL2JjbS9waW5jdHJsLWlwcm9jLWdwaW8uYyB8IDIgKy0NCj4gIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvcGluY3RybC9iY20vcGluY3RybC1pcHJvYy1ncGlvLmMgYi9kcml2ZXJzL3BpbmN0
cmwvYmNtL3BpbmN0cmwtaXByb2MtZ3Bpby5jDQo+IGluZGV4IDgzMWE5MzE4YzM4NC4uMGQyYmRi
ODE4ZDQxIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3BpbmN0cmwvYmNtL3BpbmN0cmwtaXByb2Mt
Z3Bpby5jDQo+ICsrKyBiL2RyaXZlcnMvcGluY3RybC9iY20vcGluY3RybC1pcHJvYy1ncGlvLmMN
Cj4gQEAgLTg0Myw3ICs4NDMsNyBAQCBzdGF0aWMgaW50IGlwcm9jX2dwaW9fcHJvYmUoc3RydWN0
IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gIAkJCQkJCQkiZ3Bpby1yYW5nZXMiKTsNCj4gIA0K
PiAgCS8qIG9wdGlvbmFsIEdQSU8gaW50ZXJydXB0IHN1cHBvcnQgKi8NCj4gLQlpcnEgPSBwbGF0
Zm9ybV9nZXRfaXJxKHBkZXYsIDApOw0KPiArCWlycSA9IHBsYXRmb3JtX2dldF9pcnFfb3B0aW9u
YWwocGRldiwgMCk7DQo+ICAJaWYgKGlycSA+IDApIHsNCj4gIAkJc3RydWN0IGlycV9jaGlwICpp
cnFjOw0KPiAgCQlzdHJ1Y3QgZ3Bpb19pcnFfY2hpcCAqZ2lycTsNCg==
