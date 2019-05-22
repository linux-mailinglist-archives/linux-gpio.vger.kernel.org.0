Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7AB5A26061
	for <lists+linux-gpio@lfdr.de>; Wed, 22 May 2019 11:21:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728609AbfEVJV4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 May 2019 05:21:56 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:1077 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726552AbfEVJV4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 22 May 2019 05:21:56 -0400
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x4M9J7Yc008406;
        Wed, 22 May 2019 11:20:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=cbRUlYKyYqlMPBP2eufD0fAfJgyCiNdhHTZsYhUdgTo=;
 b=m3OWHlGtGtdUxP8GNy0cxzXkBGLwafL/BIb4z+hbLCGLUeTTE56LB4Sw+K97jY2CedHT
 pniqmUTZ+6NTYxHujQ5qZCL+Gp1AVpMT7SkP27ar/Fo85YBRchNayYKa5Q43NfUDvlQe
 jUKLH+0QIqlHFa07gNbSJRkHbq2+9I0KDRrwM7bkDkm/Qvn4uaZbBLSXi9BGlXwsTvC/
 VyxxEFVrQveZkiqMH78cJebV+Yg1V6g8rMl+dFLYm+jIhjwaRJKAq0zyuRqbjMzGW/gp
 2TX2pgXJDtXSSfFzk3C3nZMpX5jkazOvHXX8FKnJlywq7ms1N2ch53NTapI+9AuIDStT RA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2sj7tu79ad-1
        (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
        Wed, 22 May 2019 11:20:19 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id ED1069C;
        Wed, 22 May 2019 09:20:17 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
        by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C4BD81587;
        Wed, 22 May 2019 09:20:17 +0000 (GMT)
Received: from SFHDAG3NODE2.st.com (10.75.127.8) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 22 May
 2019 11:20:17 +0200
Received: from SFHDAG3NODE2.st.com ([fe80::b82f:1ce:8854:5b96]) by
 SFHDAG3NODE2.st.com ([fe80::b82f:1ce:8854:5b96%20]) with mapi id
 15.00.1347.000; Wed, 22 May 2019 11:20:17 +0200
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
        "kbuild-all@01.org" <kbuild-all@01.org>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] pinctrl: stmfx: Fix compile issue when CONFIG_OF_GPIO is
 not defined
Thread-Topic: [PATCH] pinctrl: stmfx: Fix compile issue when CONFIG_OF_GPIO is
 not defined
Thread-Index: AQHVDuDxK6HzwnJUFE6SYGi4rooWzqZ2hLKAgAAnAgCAAAlUgIAACtCA
Date:   Wed, 22 May 2019 09:20:17 +0000
Message-ID: <bc1b5f1d-23b0-141d-f58f-b54ac303fe20@st.com>
References: <1558338735-8444-1-git-send-email-amelie.delaunay@st.com>
 <20190522054833.GB4574@dell> <eb8425ec-989a-9701-7fee-61bd1d2b93c1@st.com>
 <20190522084133.GF4574@dell>
In-Reply-To: <20190522084133.GF4574@dell>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.46]
Content-Type: text/plain; charset="utf-8"
Content-ID: <7B8402086AAA3E40B40F9BE22CCF8FB7@st.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-05-22_04:,,
 signatures=0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

T24gNS8yMi8xOSAxMDo0MSBBTSwgTGVlIEpvbmVzIHdyb3RlOg0KPiBPbiBXZWQsIDIyIE1heSAy
MDE5LCBBbWVsaWUgREVMQVVOQVkgd3JvdGU6DQo+PiBPbiA1LzIyLzE5IDc6NDggQU0sIExlZSBK
b25lcyB3cm90ZToNCj4+PiBPbiBNb24sIDIwIE1heSAyMDE5LCBBbWVsaWUgRGVsYXVuYXkgd3Jv
dGU6DQo+Pj4NCj4+Pj4gV2hlbiBDT05GSUdfR1BJT19PRiBpcyBub3QgZGVmaW5lZCwgc3RydWN0
IGdwaW9fY2hpcCAnb2Zfbm9kZScgbWVtYmVyIGRvZXMNCj4+Pj4gbm90IGV4aXN0Og0KPj4+PiBk
cml2ZXJzL3BpbmN0cmwvcGluY3RybC1zdG1meC5jOiBJbiBmdW5jdGlvbiAnc3RtZnhfcGluY3Ry
bF9wcm9iZSc6DQo+Pj4+IGRyaXZlcnMvcGluY3RybC9waW5jdHJsLXN0bWZ4LmM6NjUyOjE3OiBl
cnJvcjogJ3N0cnVjdCBncGlvX2NoaXAnIGhhcyBubyBtZW1iZXIgbmFtZWQgJ29mX25vZGUnDQo+
Pj4+ICAgICAgICBwY3RsLT5ncGlvX2NoaXAub2Zfbm9kZSA9IG5wOw0KPj4+Pg0KPj4+PiBGaXhl
czogMTQ5MGQ5Zjg0MWIxICgicGluY3RybDogQWRkIFNUTUZYIEdQSU8gZXhwYW5kZXIgUGluY3Ry
bC9HUElPIGRyaXZlciIpDQo+Pj4+IFJlcG9ydGVkLWJ5OiBrYnVpbGQgdGVzdCByb2JvdCA8bGtw
QGludGVsLmNvbT4NCj4+Pj4gU2lnbmVkLW9mZi1ieTogQW1lbGllIERlbGF1bmF5IDxhbWVsaWUu
ZGVsYXVuYXlAc3QuY29tPg0KPj4+PiAtLS0NCj4+Pj4gICAgZHJpdmVycy9waW5jdHJsL3BpbmN0
cmwtc3RtZnguYyB8IDIgKysNCj4+Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KQ0KPj4+Pg0KPj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9waW5jdHJsL3BpbmN0cmwtc3RtZngu
YyBiL2RyaXZlcnMvcGluY3RybC9waW5jdHJsLXN0bWZ4LmMNCj4+Pj4gaW5kZXggZWJhODcyYy4u
YmI2NGFhMCAxMDA2NDQNCj4+Pj4gLS0tIGEvZHJpdmVycy9waW5jdHJsL3BpbmN0cmwtc3RtZngu
Yw0KPj4+PiArKysgYi9kcml2ZXJzL3BpbmN0cmwvcGluY3RybC1zdG1meC5jDQo+Pj4+IEBAIC02
NDgsNyArNjQ4LDkgQEAgc3RhdGljIGludCBzdG1meF9waW5jdHJsX3Byb2JlKHN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UgKnBkZXYpDQo+Pj4+ICAgIAlwY3RsLT5ncGlvX2NoaXAuYmFzZSA9IC0xOw0K
Pj4+PiAgICAJcGN0bC0+Z3Bpb19jaGlwLm5ncGlvID0gcGN0bC0+cGN0bF9kZXNjLm5waW5zOw0K
Pj4+PiAgICAJcGN0bC0+Z3Bpb19jaGlwLmNhbl9zbGVlcCA9IHRydWU7DQo+Pj4+ICsjaWZkZWYg
Q09ORklHX09GX0dQSU8NCj4+Pj4gICAgCXBjdGwtPmdwaW9fY2hpcC5vZl9ub2RlID0gbnA7DQo+
Pj4+ICsjZW5kaWYNCj4+Pg0KPj4+IFRoaXMgaXMgcHJldHR5IHVnbHkuICBXaWxsIFNUTUZYIGV2
ZXIgYmUgdXNlZCB3aXRob3V0IE9GIHN1cHBvcnQ/ICBJZg0KPj4+IG5vdCwgaXQgbWlnaHQgYmUg
YmV0dGVyIHRvIHBsYWNlIHRoaXMgcmVzdHJpY3Rpb24gb24gdGhlIGRyaXZlciBhcyBhDQo+Pj4g
d2hvbGUuDQo+Pj4NCj4+PiBJbmNpZGVudGFsbHksIHdoeSBpcyB0aGlzIGJsYW5rZWQgb3V0IGlu
IHRoZSBzdHJ1Y3R1cmUgZGVmaW5pdGlvbj8NCj4+PiBFdmVuICdzdHJ1Y3QgZGV2aWNlJyBkb2Vz
bid0IGRvIHRoaXMuDQo+Pj4NCj4+IGNvbmZpZyBQSU5DVFJMX1NUTUZYDQo+PiAJdHJpc3RhdGUg
IlNUTWljcm9lbGVjdHJvbmljcyBTVE1GWCBHUElPIGV4cGFuZGVyIHBpbmN0cmwgZHJpdmVyIg0K
Pj4gCWRlcGVuZHMgb24gSTJDDQo+PiAJZGVwZW5kcyBvbiBPRiB8fCBDT01QSUxFX1RFU1QNCj4+
IAlzZWxlY3QgR0VORVJJQ19QSU5DT05GDQo+PiAJc2VsZWN0IEdQSU9MSUJfSVJRQ0hJUA0KPj4g
CXNlbGVjdCBNRkRfU1RNRlgNCj4+DQo+PiBUaGUgaXNzdWUgaXMgZHVlIHRvIENPTVBJTEVfVEVT
VDogd291bGQgImRlcGVuZHMgb24gT0YgfHwgKE9GICYmDQo+PiBDT01QSUxFX1RFU1QpIiBiZSBi
ZXR0ZXIgPw0KPiANCj4gTGludXMgd291bGQgYmUgaW4gYSBiZXR0ZXIgcG9zaXRpb24gdG8gcmVz
cG9uZCwgYnV0IGZyb20gd2hhdCBJIGNhbg0KPiBzZWUsIG1heWJlOg0KPiANCj4gICAgZGVwZW5k
cyBvbiBPRiB8fCAoT0ZfR1BJTyAmJiBDT01QSUxFX1RFU1QpDQo+IA0KPiBBbHRob3VnaCwgSSdt
IHVuc3VyZSB3aHkgb3RoZXIgQ09NUElMRV9URVNUcyBoYXZlbid0IGhpZ2hsaWdodGVkIHRoaXMN
Cj4gaXNzdWUuICBQZXJoYXBzIGJlY2F1c2UgdGhleSBoYXZlIGFsbCBiZWVuIGxvY2tlZCBkb3du
IHRvIGEgcGFydGljdWxhcg0KPiBhcmNoOg0KPiANCj4gJCBncmVwIENPTVBJTEVfVEVTVCAtLSBk
cml2ZXJzL3BpbmN0cmwvS2NvbmZpZw0KPiAJYm9vbCAiU3VwcG9ydCBwaW4gbXVsdGlwbGV4aW5n
IGNvbnRyb2xsZXJzIiBpZiBDT01QSUxFX1RFU1QNCj4gCWJvb2wgIlN1cHBvcnQgcGluIGNvbmZp
Z3VyYXRpb24gY29udHJvbGxlcnMiIGlmIENPTVBJTEVfVEVTVA0KPiAJZGVwZW5kcyBvbiBPRiAm
JiAoQVJDSF9EQVZJTkNJX0RBODUwIHx8IENPTVBJTEVfVEVTVCkNCj4gCWRlcGVuZHMgb24gT0Yg
JiYgKEFSQ0hfRElHSUNPTE9SIHx8IENPTVBJTEVfVEVTVCkNCj4gCWRlcGVuZHMgb24gT0YgJiYg
KEFSQ0hfTFBDMThYWCB8fCBDT01QSUxFX1RFU1QpDQo+IAlkZXBlbmRzIG9uIEFSQ0hfUjdTNzIx
MDAgfHwgQ09NUElMRV9URVNUDQo+IAlkZXBlbmRzIG9uIEFSQ0hfUjdTOTIxMCB8fCBDT01QSUxF
X1RFU1QNCj4gCWRlcGVuZHMgb24gQVJDSF9SWk4xIHx8IENPTVBJTEVfVEVTVA0KPiAJZGVwZW5k
cyBvbiBNSVBTIHx8IENPTVBJTEVfVEVTVA0KPiANCj4gV2hhdCBhYm91dCBhZGRpbmcgdGhpcyB0
byB5b3VyIEtjb25maWcgZW50cnk6DQo+IA0KPiAgICBzZWxlY3QgT0ZfR1BJTw0KPiANCg0KWWVz
IENPTVBJTEVfVEVTVCBpcyBjb21iaW5lZCB3aXRoIGFyY2ggd2hlbiBkZXBlbmRpbmcgb24gT0Yu
IEJ1dCBTVE1GWCANCmlzbid0IGFyY2ggZGVwZW5kZW50LCBpdCBpcyBqdXN0IE9GIGFuZCBJMkMg
ZGVwZW5kZW50Lg0KDQpSYW5keSBhbHNvIHNlZSBhIGJ1aWxkIGVycm9yIGluIHBpbmN0cmwtc3Rt
ZnguYyB3aGVuIENPTkZJR19PRiBpcyBub3QgDQpzZXQvZW5hYmxlZCAocmFuZGNvbmZpZyk6DQoN
Ci4uL2RyaXZlcnMvcGluY3RybC9waW5jdHJsLXN0bWZ4LmM6NDA5OjIwOiBlcnJvcjogDQrigJhw
aW5jb25mX2dlbmVyaWNfZHRfbm9kZV90b19tYXBfcGlu4oCZIHVuZGVjbGFyZWQgaGVyZSAobm90
IGluIGEgZnVuY3Rpb24pDQogICAuZHRfbm9kZV90b19tYXAgPSBwaW5jb25mX2dlbmVyaWNfZHRf
bm9kZV90b19tYXBfcGluLA0KDQpPRl9HUElPIGRlcGVuZHMgb24gT0YuDQoNClNvIGVpdGhlcg0K
ICAgICBkZXBlbmRzIG9uIE9GIHx8IChPRiAmJiBDT01QSUxFX1RFU1QpDQpvcg0KICAgICBkZXBl
bmRzIG9uIE9GIHx8IChPRl9HUElPICYmIENPTVBJTEVfVEVTVCkNCg0KYW5kDQoNCiAgICAgc2Vs
ZWN0IE9GX0dQSU8NCg0KDQpXaGF0IGlzIHRoZSBwcmV0dGllc3Qgd2F5ID8NCg0KPj4+PiAgICAJ
cGN0bC0+Z3Bpb19jaGlwLm5lZWRfdmFsaWRfbWFzayA9IHRydWU7DQo+Pj4+ICAgIA0KPj4+PiAg
ICAJcmV0ID0gZGV2bV9ncGlvY2hpcF9hZGRfZGF0YShwY3RsLT5kZXYsICZwY3RsLT5ncGlvX2No
aXAsIHBjdGwpOw0KPj4+DQo+IA==
