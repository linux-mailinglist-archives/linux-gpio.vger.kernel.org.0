Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 461D1E7984
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2019 21:02:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728243AbfJ1UCT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 28 Oct 2019 16:02:19 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:34720 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725776AbfJ1UCT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 28 Oct 2019 16:02:19 -0400
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id DA55D886BF;
        Tue, 29 Oct 2019 09:02:14 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1572292934;
        bh=JALECq4p6zZ0EyUxViPpEvVgl0VCHYaqT+KhKKtII4I=;
        h=From:To:CC:Subject:Date:References:In-Reply-To;
        b=fa/b0MaivXMk27B/JUfMz8PWM1rdu6m5aS/pZrZQPujEwjdPmKkKWz3YxMYoWtLXa
         C/fy/7eyEHl1+Aqmhz7MJEseVcya0uQZX+XmSzVM4KMlXa0vE9pMHDm52m9jr+kDK9
         q466o02L8jZrmEqdmYSjQ1v9rVkBjjYuoSzzIzelpKAx8JGjWeosgd67C20T3Z44wX
         5WBsPXVxNafXSHUbIIeMcY/u0gGWz53qO2E0hZbceeugI+68ufhIxmyHwWwcLukDly
         U73FtfcfIpD6MmtvLk3Kn1q7OPogRL/JmOy6Ll/K1HXUm53HgK2d7HdkrJbYCL/xIm
         +Ki0wDQVoDA9A==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[10.32.16.77]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5db749470000>; Tue, 29 Oct 2019 09:02:15 +1300
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) with Microsoft SMTP Server
 (TLS) id 15.0.1156.6; Tue, 29 Oct 2019 09:02:12 +1300
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1156.000; Tue, 29 Oct 2019 09:02:12 +1300
From:   Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To:     "robh+dt@kernel.org" <robh+dt@kernel.org>
CC:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "bcm-kernel-feedback-list@broadcom.com" 
        <bcm-kernel-feedback-list@broadcom.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "rjui@broadcom.com" <rjui@broadcom.com>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "sbranden@broadcom.com" <sbranden@broadcom.com>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: gpio: brcm: Add bindings for
 xgs-iproc
Thread-Topic: [PATCH v4 1/2] dt-bindings: gpio: brcm: Add bindings for
 xgs-iproc
Thread-Index: AQHViqlp/R7j23SnDEuk/qZzj++qxadqv4MAgATmZ4A=
Date:   Mon, 28 Oct 2019 20:02:11 +0000
Message-ID: <54ca79b4275e06b9ebf33450b068c914ed0217a7.camel@alliedtelesis.co.nz>
References: <20191024202703.8017-1-chris.packham@alliedtelesis.co.nz>
         <20191024202703.8017-2-chris.packham@alliedtelesis.co.nz>
         <CAL_JsqJ6a6cSrZsTg6piXmuB6-zuP+EO9vwkRoeH2aS9AVOT1g@mail.gmail.com>
In-Reply-To: <CAL_JsqJ6a6cSrZsTg6piXmuB6-zuP+EO9vwkRoeH2aS9AVOT1g@mail.gmail.com>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [2001:df5:b000:22:54a5:7b66:76cf:b046]
Content-Type: text/plain; charset="utf-8"
Content-ID: <B609EAC4373C1E41898BFB8B76804CDF@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGkgUm9iLA0KDQpPbiBGcmksIDIwMTktMTAtMjUgYXQgMTI6MTIgLTA1MDAsIFJvYiBIZXJyaW5n
IHdyb3RlOg0KPiBPbiBUaHUsIE9jdCAyNCwgMjAxOSBhdCAzOjI3IFBNIENocmlzIFBhY2toYW0N
Cj4gPGNocmlzLnBhY2toYW1AYWxsaWVkdGVsZXNpcy5jby5uej4gd3JvdGU6DQo+ID4gDQo+ID4g
VGhpcyBHUElPIGNvbnRyb2xsZXIgaXMgcHJlc2VudCBvbiBhIG51bWJlciBvZiBCcm9hZGNvbSBz
d2l0Y2ggQVNJQ3MNCj4gPiB3aXRoIGludGVncmF0ZWQgU29Dcy4gSXQgaXMgc2ltaWxhciB0byB0
aGUgbnNwLWdwaW8gYW5kIGlwcm9jLWdwaW8NCj4gPiBibG9ja3MgYnV0IGRpZmZlcmVudCBlbm91
Z2ggdG8gcmVxdWlyZSBhIHNlcGFyYXRlIGRyaXZlci4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5
OiBDaHJpcyBQYWNraGFtIDxjaHJpcy5wYWNraGFtQGFsbGllZHRlbGVzaXMuY28ubno+DQo+ID4g
LS0tDQo+ID4gDQo+ID4gTm90ZXM6DQo+ID4gICAgIENoYW5nZXMgaW4gdjQ6DQo+ID4gICAgIC0g
cmVuYW1lIGJyY20seGdzLWlwcm9jLnlhbWwgLT4gYnJjbSx4Z3MtaXByb2MtZ3Bpby55YW1sIGFz
IHN1Z2dlc3RlZA0KPiA+IA0KPiA+ICAgICBDaGFuZ2VzIGluIHYzOg0KPiA+ICAgICAtIGluY29y
cG9yYXRlIHJldmlldyBjb21tZW50cyBmcm9tIFJvYiBhbmQgQmFydA0KPiA+IA0KPiA+ICAgICBD
aGFuZ2VzIGluIHYyOg0KPiA+ICAgICAtIERvY3VtZW50IGFzIERUIHNjaGVtYQ0KPiA+ICAgICAt
IEluY2x1ZGUgbmdwaW9zLCAjZ3Bpby1jZWxscyBhbmQgZ3Bpby1jb250cm9sbGVyIHByb3BlcnRp
ZXMNCj4gPiANCj4gPiAgLi4uL2JpbmRpbmdzL2dwaW8vYnJjbSx4Z3MtaXByb2MtZ3Bpby55YW1s
ICAgIHwgNzAgKysrKysrKysrKysrKysrKysrKw0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgNzAgaW5z
ZXJ0aW9ucygrKQ0KPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2dwaW8vYnJjbSx4Z3MtaXByb2MtZ3Bpby55YW1sDQo+ID4gDQo+ID4gZGlm
ZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ncGlvL2JyY20seGdz
LWlwcm9jLWdwaW8ueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ncGlv
L2JyY20seGdzLWlwcm9jLWdwaW8ueWFtbA0KPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4g
aW5kZXggMDAwMDAwMDAwMDAwLi5lYzFmZDNhNjRhYTINCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4g
KysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2dwaW8vYnJjbSx4Z3MtaXBy
b2MtZ3Bpby55YW1sDQo+ID4gQEAgLTAsMCArMSw3MCBAQA0KPiA+ICsjIFNQRFgtTGljZW5zZS1J
ZGVudGlmaWVyOiAoR1BMLTIuMCBPUiBCU0QtMi1DbGF1c2UpDQo+ID4gKyVZQU1MIDEuMg0KPiA+
ICstLS0NCj4gPiArJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9ncGlvL2JyY20s
eGdzLWlwcm9jLnlhbWwjDQo+IA0KPiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
Z3Bpby9icmNtLHhncy1pcHJvYy1ncGlvLnlhbWw6ICRpZDoNCj4gcGF0aC9maWxlbmFtZSAnZ3Bp
by9icmNtLHhncy1pcHJvYy55YW1sJyBkb2Vzbid0IG1hdGNoIGFjdHVhbCBmaWxlbmFtZQ0KPiAN
Cj4gT3RoZXJ3aXNlLA0KPiANCj4gUmV2aWV3ZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5l
bC5vcmc+DQoNCkknbGwgc2VuZCBhIHF1aWNrIHY1IG9mIGp1c3QgdGhpcyBwYXRjaCB3aXRoIHRo
ZSBtaW5vciBjb3JyZWN0aW9uIGFuZA0KeW91ciByZXZpZXdlZC1ieS4NCg==
