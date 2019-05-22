Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F203C25F16
	for <lists+linux-gpio@lfdr.de>; Wed, 22 May 2019 10:08:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728620AbfEVIIa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 May 2019 04:08:30 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:22024 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726358AbfEVII3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 22 May 2019 04:08:29 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x4M86k0n002750;
        Wed, 22 May 2019 10:08:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=31LcOJHiVU7kM7i+jYHMtvLW3Ng5hRb7rd4vsjEaOEI=;
 b=MPxkK+advOYvKxUWlQp8XawP3OkLWmtDv1F6BBmG3Z4jkIliGmkzdxjdMNZZUVuqFH0M
 jjVWDfeqpBQjs4VZogXcJvxwPYL27cicFu+/qXsvJtHKAImcqdNPzksV9G2AyPIIrno1
 gUVD8B2kuIus3hHJyagg/2jeQTfYcI0iCv1oCECKNiSz7e3NlAXvYjBArZmQyhww/kEG
 /GjJZfvne05cITC7K2VqFxKbIA2PPl55lYg1kFxyeZe7Gf7373tNCFL/gIwjySJKaJMv
 R4ZKz13t5TBlmsQyCEeFlPqoELdO4pODBRB/eF/+T8gDgABW/sQvHWWN9MAKnuqW9632 xA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx08-00178001.pphosted.com with ESMTP id 2sj77477wh-1
        (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
        Wed, 22 May 2019 10:08:18 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 65C4A34;
        Wed, 22 May 2019 08:08:17 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
        by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 23F6118FC;
        Wed, 22 May 2019 08:08:13 +0000 (GMT)
Received: from SFHDAG3NODE2.st.com (10.75.127.8) by SFHDAG3NODE3.st.com
 (10.75.127.9) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 22 May
 2019 10:08:12 +0200
Received: from SFHDAG3NODE2.st.com ([fe80::b82f:1ce:8854:5b96]) by
 SFHDAG3NODE2.st.com ([fe80::b82f:1ce:8854:5b96%20]) with mapi id
 15.00.1347.000; Wed, 22 May 2019 10:08:12 +0200
From:   Amelie DELAUNAY <amelie.delaunay@st.com>
To:     Lee Jones <lee.jones@linaro.org>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Alexandre TORGUE <alexandre.torgue@st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-stm32@st-md-mailman.stormreply.com" 
        <linux-stm32@st-md-mailman.stormreply.com>,
        "kbuild-all@01.org" <kbuild-all@01.org>
Subject: Re: [PATCH] pinctrl: stmfx: Fix compile issue when CONFIG_OF_GPIO is
 not defined
Thread-Topic: [PATCH] pinctrl: stmfx: Fix compile issue when CONFIG_OF_GPIO is
 not defined
Thread-Index: AQHVDuDxK6HzwnJUFE6SYGi4rooWzqZ2hLKAgAAnAgA=
Date:   Wed, 22 May 2019 08:08:12 +0000
Message-ID: <eb8425ec-989a-9701-7fee-61bd1d2b93c1@st.com>
References: <1558338735-8444-1-git-send-email-amelie.delaunay@st.com>
 <20190522054833.GB4574@dell>
In-Reply-To: <20190522054833.GB4574@dell>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
Content-Type: text/plain; charset="utf-8"
Content-ID: <E9CA614ECF5A6949ACD7AA72A5C4B2BA@st.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-05-22_03:,,
 signatures=0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DQoNCk9uIDUvMjIvMTkgNzo0OCBBTSwgTGVlIEpvbmVzIHdyb3RlOg0KPiBPbiBNb24sIDIwIE1h
eSAyMDE5LCBBbWVsaWUgRGVsYXVuYXkgd3JvdGU6DQo+IA0KPj4gV2hlbiBDT05GSUdfR1BJT19P
RiBpcyBub3QgZGVmaW5lZCwgc3RydWN0IGdwaW9fY2hpcCAnb2Zfbm9kZScgbWVtYmVyIGRvZXMN
Cj4+IG5vdCBleGlzdDoNCj4+IGRyaXZlcnMvcGluY3RybC9waW5jdHJsLXN0bWZ4LmM6IEluIGZ1
bmN0aW9uICdzdG1meF9waW5jdHJsX3Byb2JlJzoNCj4+IGRyaXZlcnMvcGluY3RybC9waW5jdHJs
LXN0bWZ4LmM6NjUyOjE3OiBlcnJvcjogJ3N0cnVjdCBncGlvX2NoaXAnIGhhcyBubyBtZW1iZXIg
bmFtZWQgJ29mX25vZGUnDQo+PiAgICAgICBwY3RsLT5ncGlvX2NoaXAub2Zfbm9kZSA9IG5wOw0K
Pj4NCj4+IEZpeGVzOiAxNDkwZDlmODQxYjEgKCJwaW5jdHJsOiBBZGQgU1RNRlggR1BJTyBleHBh
bmRlciBQaW5jdHJsL0dQSU8gZHJpdmVyIikNCj4+IFJlcG9ydGVkLWJ5OiBrYnVpbGQgdGVzdCBy
b2JvdCA8bGtwQGludGVsLmNvbT4NCj4+IFNpZ25lZC1vZmYtYnk6IEFtZWxpZSBEZWxhdW5heSA8
YW1lbGllLmRlbGF1bmF5QHN0LmNvbT4NCj4+IC0tLQ0KPj4gICBkcml2ZXJzL3BpbmN0cmwvcGlu
Y3RybC1zdG1meC5jIHwgMiArKw0KPj4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
DQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGluY3RybC9waW5jdHJsLXN0bWZ4LmMgYi9k
cml2ZXJzL3BpbmN0cmwvcGluY3RybC1zdG1meC5jDQo+PiBpbmRleCBlYmE4NzJjLi5iYjY0YWEw
IDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9waW5jdHJsL3BpbmN0cmwtc3RtZnguYw0KPj4gKysr
IGIvZHJpdmVycy9waW5jdHJsL3BpbmN0cmwtc3RtZnguYw0KPj4gQEAgLTY0OCw3ICs2NDgsOSBA
QCBzdGF0aWMgaW50IHN0bWZ4X3BpbmN0cmxfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
cGRldikNCj4+ICAgCXBjdGwtPmdwaW9fY2hpcC5iYXNlID0gLTE7DQo+PiAgIAlwY3RsLT5ncGlv
X2NoaXAubmdwaW8gPSBwY3RsLT5wY3RsX2Rlc2MubnBpbnM7DQo+PiAgIAlwY3RsLT5ncGlvX2No
aXAuY2FuX3NsZWVwID0gdHJ1ZTsNCj4+ICsjaWZkZWYgQ09ORklHX09GX0dQSU8NCj4+ICAgCXBj
dGwtPmdwaW9fY2hpcC5vZl9ub2RlID0gbnA7DQo+PiArI2VuZGlmDQo+IA0KPiBUaGlzIGlzIHBy
ZXR0eSB1Z2x5LiAgV2lsbCBTVE1GWCBldmVyIGJlIHVzZWQgd2l0aG91dCBPRiBzdXBwb3J0PyAg
SWYNCj4gbm90LCBpdCBtaWdodCBiZSBiZXR0ZXIgdG8gcGxhY2UgdGhpcyByZXN0cmljdGlvbiBv
biB0aGUgZHJpdmVyIGFzIGENCj4gd2hvbGUuDQo+IA0KPiBJbmNpZGVudGFsbHksIHdoeSBpcyB0
aGlzIGJsYW5rZWQgb3V0IGluIHRoZSBzdHJ1Y3R1cmUgZGVmaW5pdGlvbj8NCj4gRXZlbiAnc3Ry
dWN0IGRldmljZScgZG9lc24ndCBkbyB0aGlzLg0KPiANCmNvbmZpZyBQSU5DVFJMX1NUTUZYDQoJ
dHJpc3RhdGUgIlNUTWljcm9lbGVjdHJvbmljcyBTVE1GWCBHUElPIGV4cGFuZGVyIHBpbmN0cmwg
ZHJpdmVyIg0KCWRlcGVuZHMgb24gSTJDDQoJZGVwZW5kcyBvbiBPRiB8fCBDT01QSUxFX1RFU1QN
CglzZWxlY3QgR0VORVJJQ19QSU5DT05GDQoJc2VsZWN0IEdQSU9MSUJfSVJRQ0hJUA0KCXNlbGVj
dCBNRkRfU1RNRlgNCg0KVGhlIGlzc3VlIGlzIGR1ZSB0byBDT01QSUxFX1RFU1Q6IHdvdWxkICJk
ZXBlbmRzIG9uIE9GIHx8IChPRiAmJiANCkNPTVBJTEVfVEVTVCkiIGJlIGJldHRlciA/DQoNCj4+
ICAgCXBjdGwtPmdwaW9fY2hpcC5uZWVkX3ZhbGlkX21hc2sgPSB0cnVlOw0KPj4gICANCj4+ICAg
CXJldCA9IGRldm1fZ3Bpb2NoaXBfYWRkX2RhdGEocGN0bC0+ZGV2LCAmcGN0bC0+Z3Bpb19jaGlw
LCBwY3RsKTsNCj4g
