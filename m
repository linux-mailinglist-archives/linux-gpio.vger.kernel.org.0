Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 115B4430CE0
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Oct 2021 01:21:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344763AbhJQXXT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 17 Oct 2021 19:23:19 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:41582 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233442AbhJQXXT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 17 Oct 2021 19:23:19 -0400
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id AA0AC891AF
        for <linux-gpio@vger.kernel.org>; Mon, 18 Oct 2021 12:21:06 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1634512866;
        bh=swLWMfjAqk4AeKdq9PVr8MW8I2szbwF0Vm/Tqj9NNvc=;
        h=From:To:CC:Subject:Date:References:In-Reply-To;
        b=aEHx3KrV0mDVvVEISwqi26LMvXD57RXX4M+5QM1fm92se3704PSEZ/SbPZ3xbHDrP
         hbMjvN1opP9q/SFhF/HGh3zjTDkNGRUznEWMnpvvd9SJw/uzq8FYYTjunh6NvTwVRk
         rB/sS5bTr0hRySHyFo6INToG0pYZdcu/K5IVON80Ke0A3FQu4bMf17i/KdtMG9htQi
         Akq4C1eh0r+NtkB4ZIiNJy7Nr9z7j5W7AgJn+CBkyPNNTGOIUp27lxkdk5OwsnlndX
         bscg4qab0Wux1Ok1/ErOQsW82oKv7Tc7UL6vEq/dhULKI06XA/ya1HOhFbEPNUaawA
         5XZq2K4voPd9Q==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[2001:df5:b000:bc8::77]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B616cafe20001>; Mon, 18 Oct 2021 12:21:06 +1300
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8)
 by svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with
 Microsoft SMTP Server (TLS) id 15.0.1497.24; Mon, 18 Oct 2021 12:21:06 +1300
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.024; Mon, 18 Oct 2021 12:21:06 +1300
From:   Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To:     Jonas Gorski <jonas.gorski@gmail.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        "bcm-kernel-feedback-list@broadcom.com" 
        <bcm-kernel-feedback-list@broadcom.com>
Subject: Re: [PATCH] gpio: xgs-iproc: fix parsing of ngpios property
Thread-Topic: [PATCH] gpio: xgs-iproc: fix parsing of ngpios property
Thread-Index: AQHXwPfDBdkON+fSQ0OcliH/KkB28qvW/3KA
Date:   Sun, 17 Oct 2021 23:21:05 +0000
Message-ID: <220505fc-0524-4843-afc4-7ab8dcb1dd89@alliedtelesis.co.nz>
References: <20211014123342.174711-1-jonas.gorski@gmail.com>
In-Reply-To: <20211014123342.174711-1-jonas.gorski@gmail.com>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.32.1.11]
Content-Type: text/plain; charset="utf-8"
Content-ID: <5FC4C9A5B57BED4788EBDD5F8EB1B16B@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=eIJtc0h1 c=1 sm=1 tr=0 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=oKJsc7D3gJEA:10 a=IkcTkHD0fZMA:10 a=8gfv0ekSlNoA:10 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8 a=bq4DvABKnR6DICsDOK8A:9 a=QEXdDO2ut3YA:10 a=AjGcO6oz07-iQ99wixmX:22
X-SEG-SpamProfiler-Score: 0
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DQpPbiAxNS8xMC8yMSAxOjMzIGFtLCBKb25hcyBHb3Jza2kgd3JvdGU6DQo+IG9mX3Byb3BlcnR5
X3JlYWRfdTMyIHJldHVybnMgMCBvbiBzdWNjZXNzLCBub3QgdHJ1ZSwgc28gd2UgbmVlZCB0bw0K
PiBpbnZlcnQgdGhlIGNoZWNrIHRvIGFjdHVhbGx5IHRha2Ugb3ZlciB0aGUgcHJvdmlkZWQgbmdw
aW8gdmFsdWUuDQo+DQo+IEZpeGVzOiA2YTQxYjZjNWZjMjAgKCJncGlvOiBBZGQgeGdzLWlwcm9j
IGRyaXZlciIpDQo+IFNpZ25lZC1vZmYtYnk6IEpvbmFzIEdvcnNraSA8am9uYXMuZ29yc2tpQGdt
YWlsLmNvbT4NCg0KSG1tIEkgbXVzdCBoYXZlIGNvcGllZCBzb21lIGVycm9yIGhhbmRsaW5nIGNv
ZGUgYW5kIGZhaWxlZCB0byBpbnZlcnQgdGhlIA0KY29uZGl0aW9uIHdoZW4gSSBtYWRlIHRoZSBw
cm9wZXJ0eSBvcHRpb25hbC4NCg0KUmV2aWV3ZWQtYnk6IENocmlzIFBhY2toYW0gPGNocmlzLnBh
Y2toYW1AYWxsaWVkdGVsZXNpcy5jby5uej4NCg0KPiAtLS0NCj4gVGhpcyBpcyBiYXNlZCBvbg0K
PiBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbGludXN3L2xp
bnV4LWdwaW8uZ2l0LA0KPiB3aGljaCBpcyB0aGUgdHJlZSBmb3IgR1BJTyBhY2NvcmRpbmcgdG8g
TUFJTlRBSU5FUlMsIGJ1dCBoYXNuJ3QgYmVlbg0KPiB1cGRhdGVkIHNpbmNlIH41LjExIC0gaXMg
dGhpcyBzdGlsbCB0aGUgY29ycmVjdCB0cmVlPw0KPg0KPiBJdCBkb2Vzbid0IG1hdHRlciBtdWNo
IGZvciB0aGlzIHBhdGNoIHRob3VnaCwgdGhlIGRyaXZlciBpcyB2aXJ0dWFsbHkNCj4gdW50b3Vj
aGVkIHNpbmNlIHRoZW4uDQo+DQo+ICAgZHJpdmVycy9ncGlvL2dwaW8teGdzLWlwcm9jLmMgfCAy
ICstDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+
DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwaW8vZ3Bpby14Z3MtaXByb2MuYyBiL2RyaXZlcnMv
Z3Bpby9ncGlvLXhncy1pcHJvYy5jDQo+IGluZGV4IGFkNTQ4OWE2NWQ1NC4uZGQ0MDI3N2I5ZDA2
IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwaW8vZ3Bpby14Z3MtaXByb2MuYw0KPiArKysgYi9k
cml2ZXJzL2dwaW8vZ3Bpby14Z3MtaXByb2MuYw0KPiBAQCAtMjI0LDcgKzIyNCw3IEBAIHN0YXRp
YyBpbnQgaXByb2NfZ3Bpb19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiAg
IAl9DQo+ICAgDQo+ICAgCWNoaXAtPmdjLmxhYmVsID0gZGV2X25hbWUoZGV2KTsNCj4gLQlpZiAo
b2ZfcHJvcGVydHlfcmVhZF91MzIoZG4sICJuZ3Bpb3MiLCAmbnVtX2dwaW9zKSkNCj4gKwlpZiAo
IW9mX3Byb3BlcnR5X3JlYWRfdTMyKGRuLCAibmdwaW9zIiwgJm51bV9ncGlvcykpDQo+ICAgCQlj
aGlwLT5nYy5uZ3BpbyA9IG51bV9ncGlvczsNCj4gICANCj4gICAJaXJxID0gcGxhdGZvcm1fZ2V0
X2lycShwZGV2LCAwKTs=
