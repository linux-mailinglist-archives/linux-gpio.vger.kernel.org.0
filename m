Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D22A11D109
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2019 16:29:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729003AbfLLP3g (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Dec 2019 10:29:36 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:31504 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729262AbfLLP3f (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 12 Dec 2019 10:29:35 -0500
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id xBCFRTlq015347;
        Thu, 12 Dec 2019 16:29:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=Lm62U5rN4JrxozhyAcgJOlFWUo2lLSEWuqAJA52tKTo=;
 b=DEttu0Yk1KZLviFkRGnx4TK0WfQow36HaxRuz0/CJo3N8cWr3UDEKBgYQVQms+yYdtVt
 k6E0hQM2Er+H640hK2t91wuc4/CpSEIdAGBjpaH3LMcpw1/EVJ/Oph3qYxcIdUBVBOQH
 q+8ponpcg4FyBwV2z+ZnhhGHj9yhdO0u5dMtA4pwTykw60I+5ckjXpMkA3iEvlHXzePk
 hjken6speI5wMvXx8QS4iAkBk8gctsuqtQhdgyAG+XFc8xInsmuxzBVbVtKLVkyIOqch
 DhF4JB8PI7otHxFBxKLGq9qikUY/xypNJjRe9bw9i+nrVul6T2xDv9gK1DNYSN6IODFs Uw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx08-00178001.pphosted.com with ESMTP id 2wrbrfr4kn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 12 Dec 2019 16:29:28 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4806D10002A;
        Thu, 12 Dec 2019 16:29:27 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 04E862AFEB0;
        Thu, 12 Dec 2019 16:29:27 +0100 (CET)
Received: from SFHDAG3NODE3.st.com (10.75.127.9) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 12 Dec
 2019 16:29:26 +0100
Received: from SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476]) by
 SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476%20]) with mapi id
 15.00.1347.000; Thu, 12 Dec 2019 16:29:26 +0100
From:   Benjamin GAIGNARD <benjamin.gaignard@st.com>
To:     Ulf Hansson <ulf.hansson@linaro.org>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
Subject: Re: [PATCH] pinctrl: Enforce device links
Thread-Topic: [PATCH] pinctrl: Enforce device links
Thread-Index: AQHVsNrX6t+hwmnu80OZRREtsWvnUKe2axWAgAAH2oCAABx3AA==
Date:   Thu, 12 Dec 2019 15:29:26 +0000
Message-ID: <2357335b-90eb-c302-2988-59b03bdd075f@st.com>
References: <20191212101134.42420-1-linus.walleij@linaro.org>
 <CAPDyKFrGECTVnP+qWgA2n-TKxW2AcyLCr1hqyEOp83XcK=1OpA@mail.gmail.com>
 <5483ee2d-9c31-66c2-1008-fcd6551523fb@st.com>
 <CAPDyKFoVQCnxXufBdTp3atAJdkHR=EY7Rze1RSUZyUxiwcgGgQ@mail.gmail.com>
In-Reply-To: <CAPDyKFoVQCnxXufBdTp3atAJdkHR=EY7Rze1RSUZyUxiwcgGgQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
Content-Type: text/plain; charset="utf-8"
Content-ID: <09663CE4A84AC241A22F3987A45A4B3B@st.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-12_03:2019-12-12,2019-12-12 signatures=0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DQpPbiAxMi8xMi8xOSAyOjQ3IFBNLCBVbGYgSGFuc3NvbiB3cm90ZToNCj4gT24gVGh1LCAxMiBE
ZWMgMjAxOSBhdCAxNDoxOSwgQmVuamFtaW4gR0FJR05BUkQNCj4gPGJlbmphbWluLmdhaWduYXJk
QHN0LmNvbT4gd3JvdGU6DQo+Pg0KPj4gT24gMTIvMTIvMTkgMTE6NTYgQU0sIFVsZiBIYW5zc29u
IHdyb3RlOg0KPj4+ICsgQmVuamFtaW4NCj4+Pg0KPj4+IE9uIFRodSwgMTIgRGVjIDIwMTkgYXQg
MTE6MTEsIExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4gd3JvdGU6DQo+
Pj4+IEluc3RlYWQgb2Ygb3B0LWluIGRldmljZSBsaW5rcywgZW5mb3JjZSBpdCBhY3Jvc3MgdGhl
IGJvYXJkLg0KPj4+PiBFdmVyeW9uZSBwcm9iYWJseSBuZWVkcyB0aGlzIGFueXdheSwgbGVzdCBy
dW50aW1lW19wbV0gc3VzcGVuZA0KPj4+PiBvcmRlciB3aWxsIGJlIGhhcGhhemFyZC4NCj4+Pj4N
Cj4+Pj4gQ2M6IFJhZmFlbCBKLiBXeXNvY2tpIDxyYWZhZWwuai53eXNvY2tpQGludGVsLmNvbT4N
Cj4+Pj4gQ2M6IFVsZiBIYW5zc29uIDx1bGYuaGFuc3NvbkBsaW5hcm8ub3JnPg0KPj4+PiBTaWdu
ZWQtb2ZmLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+DQo+Pj4+
IC0tLQ0KPj4+PiBBcyB0aGVyZSBpcyBubyBwcm9ncmVzcyBvbiBvcHRpbmcgaW4gZHJpdmVycyBm
b3IgdGhpcyB3ZSBjYW4ganVzdA0KPj4+PiBlbmZvcmNlIGl0Lg0KPj4+Pg0KPj4+PiBJIGFtIGEg
Yml0IGNvbmNlcm5lZCB0aGF0IHdpdGggZXZlcnkgcGluIGNvbnRyb2wgc3RhdGUgY2hhbmdlIHRo
ZQ0KPj4+PiBsaW5rIHJlZmVyZW5jZSBjb3VudCB3aWxsIGp1c3QgZ28gdXAsIGJ1dCBkb2VzIGl0
IHJlYWxseSBtYXR0ZXI/DQo+Pj4+IC0tLQ0KPj4+PiAgICBkcml2ZXJzL3BpbmN0cmwvY29yZS5j
ICAgICAgICAgICAgICAgIHwgMjUgKysrKysrKysrKysrKystLS0tLS0tLS0tLQ0KPj4+PiAgICBk
cml2ZXJzL3BpbmN0cmwvcGluY3RybC1zdG1meC5jICAgICAgIHwgIDEgLQ0KPj4+PiAgICBkcml2
ZXJzL3BpbmN0cmwvc3RtMzIvcGluY3RybC1zdG0zMi5jIHwgIDEgLQ0KPj4+PiAgICBpbmNsdWRl
L2xpbnV4L3BpbmN0cmwvcGluY3RybC5oICAgICAgIHwgIDUgLS0tLS0NCj4+Pj4gICAgNCBmaWxl
cyBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCAxOCBkZWxldGlvbnMoLSkNCj4+Pj4NCj4+Pj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGluY3RybC9jb3JlLmMgYi9kcml2ZXJzL3BpbmN0cmwvY29y
ZS5jDQo+Pj4+IGluZGV4IDJiYmQ4ZWU5MzUwNy4uMWQyY2RlZWJiMzE2IDEwMDY0NA0KPj4+PiAt
LS0gYS9kcml2ZXJzL3BpbmN0cmwvY29yZS5jDQo+Pj4+ICsrKyBiL2RyaXZlcnMvcGluY3RybC9j
b3JlLmMNCj4+Pj4gQEAgLTEyMjAsMTUgKzEyMjAsNiBAQCBzdHJ1Y3QgcGluY3RybF9zdGF0ZSAq
cGluY3RybF9sb29rdXBfc3RhdGUoc3RydWN0IHBpbmN0cmwgKnAsDQo+Pj4+ICAgIH0NCj4+Pj4g
ICAgRVhQT1JUX1NZTUJPTF9HUEwocGluY3RybF9sb29rdXBfc3RhdGUpOw0KPj4+Pg0KPj4+PiAt
c3RhdGljIHZvaWQgcGluY3RybF9saW5rX2FkZChzdHJ1Y3QgcGluY3RybF9kZXYgKnBjdGxkZXYs
DQo+Pj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGRldmljZSAqY29uc3Vt
ZXIpDQo+Pj4+IC17DQo+Pj4+IC0gICAgICAgaWYgKHBjdGxkZXYtPmRlc2MtPmxpbmtfY29uc3Vt
ZXJzKQ0KPj4+PiAtICAgICAgICAgICAgICAgZGV2aWNlX2xpbmtfYWRkKGNvbnN1bWVyLCBwY3Rs
ZGV2LT5kZXYsDQo+Pj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgRExfRkxBR19Q
TV9SVU5USU1FIHwNCj4+Pj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBETF9GTEFH
X0FVVE9SRU1PVkVfQ09OU1VNRVIpOw0KPj4+PiAtfQ0KPj4+PiAtDQo+Pj4+ICAgIC8qKg0KPj4+
PiAgICAgKiBwaW5jdHJsX2NvbW1pdF9zdGF0ZSgpIC0gc2VsZWN0L2FjdGl2YXRlL3Byb2dyYW0g
YSBwaW5jdHJsIHN0YXRlIHRvIEhXDQo+Pj4+ICAgICAqIEBwOiB0aGUgcGluY3RybCBoYW5kbGUg
Zm9yIHRoZSBkZXZpY2UgdGhhdCByZXF1ZXN0cyBjb25maWd1cmF0aW9uDQo+Pj4+IEBAIC0xMjc2
LDggKzEyNjcsMjAgQEAgc3RhdGljIGludCBwaW5jdHJsX2NvbW1pdF9zdGF0ZShzdHJ1Y3QgcGlu
Y3RybCAqcCwgc3RydWN0IHBpbmN0cmxfc3RhdGUgKnN0YXRlKQ0KPj4+PiAgICAgICAgICAgICAg
ICAgICB9DQo+Pj4+DQo+Pj4+ICAgICAgICAgICAgICAgICAgIC8qIERvIG5vdCBsaW5rIGhvZ3Mg
KGNpcmN1bGFyIGRlcGVuZGVuY3kpICovDQo+Pj4+IC0gICAgICAgICAgICAgICBpZiAocCAhPSBz
ZXR0aW5nLT5wY3RsZGV2LT5wKQ0KPj4+PiAtICAgICAgICAgICAgICAgICAgICAgICBwaW5jdHJs
X2xpbmtfYWRkKHNldHRpbmctPnBjdGxkZXYsIHAtPmRldik7DQo+Pj4+ICsgICAgICAgICAgICAg
ICBpZiAocCAhPSBzZXR0aW5nLT5wY3RsZGV2LT5wKSB7DQo+Pj4+ICsgICAgICAgICAgICAgICAg
ICAgICAgIC8qDQo+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAqIENyZWF0ZSBhIGRldmlj
ZSBsaW5rIHRvIHRoZSBjb25zdW1lciBzdWNoIHRoYXQNCj4+Pj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICogaXQgd2lsbCBlbmZvcmNlIHRoYXQgcnVudGltZSBQTSBzdXNwZW5kL3Jlc3VtZQ0K
Pj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgKiBpcyBkb25lIGZpcnN0IG9uIGNvbnN1bWVy
cyBiZWZvcmUgd2UgZ2V0IHRvDQo+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAqIHRoZSBw
aW4gY29udHJvbGxlciBpdHNlbGYuIEFzIHNvbWUgZGV2aWNlcyBnZXQNCj4+Pj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICogdGhlaXIgcGluIGNvbnRyb2wgc3RhdGUgZXZlbiBiZWZvcmUgcHJv
YmUoKSBpdCBpcw0KPj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgKiBpbXBvcnRhbnQgdG8g
dXNlIERMX0ZMQUdfQVVUT1JFTU9WRV9DT05TVU1FUi4NCj4+Pj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICovDQo+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgIGRldmljZV9saW5rX2FkZChw
LT5kZXYsDQo+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzZXR0
aW5nLT5wY3RsZGV2LT5kZXYsDQo+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBETF9GTEFHX1BNX1JVTlRJTUUgfA0KPj4+PiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgRExfRkxBR19BVVRPUkVNT1ZFX0NPTlNVTUVSKTsNCj4+PiBJIHVu
ZGVyc3RhbmQgRExfRkxBR19QTV9SVU5USU1FIGlzIHVzZWQgZXZlbiBwcmlvciAkc3ViamVjdCBw
YXRjaCwgYnV0DQo+Pj4gY291bGQgeW91IHBsZWFzZSBleHBsYWluIHNvbWUgb2YgdGhlIHJlYXNv
bnMgYmVoaW5kIHRoYXQ/DQo+IENhbiB5b3UgcGxlYXNlIGNsYXJpZnkgb24gdGhpcyBwYXJ0IGFz
IHdlbGw/DQpJdCBpcyB0byBpbmRpY2F0ZSB0byBQTSBydW50aW1lIGZyYW1ld29yayB0aGF0IGl0
IGhhdmUgdG8gdXNlIHRoZSBsaW5rDQpzbyBzdXNwZW5kL3Jlc3VtZSBiZXR3ZWVuIGNvbnN1bWVy
IGFuZCBwcm9kdWNlciBpcyB3ZWxsIG9yZGVyZWQuDQpUaGF0IHdhcyB0aGUgcHJpbWFyeSBnb2Fs
IG9mIHRoaXMgcGF0Y2guDQo+DQo+Pj4gSW4gcmVnYXJkcyB0byBhZGRpbmcgYSBuZXcgbGluayBl
dmVyeSB0aW1lIHlvdSBjb21taXQvc2VsZWN0IGEgbmV3DQo+Pj4gc3RhdGUsIHRoYXQgc291bmRz
IHdyb25nIHRvIG1lLiBXaHkgYXJlIHdlIGRvaW5nIHRoaXM/DQo+PiBJZiBhIGxpbmsgYWxyZWFk
eSBleGlzdHMgaXQgd2lsbCBub3QgYWRkIG5ldyBvbmUgc28gaXQgc2FmZSBmb3IgbWUuDQo+IFJp
Z2h0LCBidXQgaXQgc2VlbXMgc2lsbHkgdG8gd2FsayB0aGUgbGlzdCBvZiBsaW5rcyB0byBmaW5k
IG91dCB0aGF0DQo+IGl0IGFscmVhZHkgZXhpc3QgYW5kIHRoZW4gYmFpbCBvdXQuDQo+DQo+IFRo
ZSBwb2ludCBpcywgaXQgYWRkcyB1bm5lY2Vzc2FyeSBvdmVyaGVhZCwgZXZlcnkgdGltZSB0aGVy
ZSBpcyBhIG5ldw0KPiBzdGF0ZSBiZWluZyBzZWxlY3RlZC4gRG9uJ3QgeW91IHRoaW5rPw0KPg0K
Pj4+IEluc3RlYWQsIGRvbid0IHlvdSB3YW50IHRvIGFkZCBhIGxpbmsgd2hlbiB0aGUgY29uc3Vt
ZXIgbG9va3MgdXAgdGhlDQo+Pj4gcGluY3RybCBjb29raWUvaGFuZGxlIChkZXZtX3BpbmN0cmxf
Z2V0KCkpLCB0aHVzIHdoZW4gY3JlYXRlX3BpbmN0cmwoKQ0KPj4+IGlzIGNhbGxlZD8NCj4+IEJl
Y2F1c2UgaXQgd2FzIHRoZSBvbmx5IHBsYWNlIEkgYWRkIGZvdW5kIHdoZXJlIEkgZ2V0IGEgdGhl
IHNhbWUNCj4+IHRpbWUgcG9pbnRlcnMgb24gdGhlIGNvbnN1bWVyIGFuZCB0aGUgcHJvZHVjZXIg
ZGV2aWNlcy4NCj4gQXQgbGVhc3QgY3JlYXRlX3BpbmN0cmwoKSBoYXZlIHRoZSBjb25zdW1lciBk
ZXZpY2UsIGJ1dCBJIGFtIHByZXR0eQ0KPiBzdXJlIHdlIGNhbiBsb29rdXAgdGhlIHByb2R1Y2Vy
IGRldmljZSBmcm9tIHRoZXJlLCBpbiBzb21lIHdheS4gTGludXM/DQo+DQo+Pj4gQWRkaXRpb25h
bGx5LCBJIGRpZG4ndCBmaW5kIGFueSBwbGFjZSB3aGVyZSB0aGUgbGluayBpcyByZW1vdmVkLiBJ
DQo+Pj4gbG9va3MgbGlrZSB0aGF0IHNob3VsZCBoYXBwZW4gd2hlbiB0aGUgY29uc3VtZXIgZHJv
cHMgdGhlIHJlZmVyZW5jZQ0KPj4+IGZvciB0aGUgcGluY3RybCBjb29raWUsIG5vPw0KPj4gVGhl
IGxpbmsgaXMgYXV0b21hdGljYWxseSByZW1vdmVkIHdoZW4gdGhlIGNvbnN1bWVyIGRldmljZSBp
cyBkZWxldGVkDQo+Pg0KPj4gdGhhbmtzIHRvIERMX0ZMQUdfQVVUT1JFTU9WRV9DT05TVU1FUiBm
bGFnLg0KPiBBaGgsIEkgc2VlLiBUaGF0IHNob3VsZCBiZSBmaW5lLCBJIGd1ZXNzLg0KPg0KPiBb
Li4uXQ0KPg0KPiBLaW5kIHJlZ2FyZHMNCj4gVWZmZQ==
