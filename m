Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4821360496
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Jul 2019 12:36:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728069AbfGEKgD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 Jul 2019 06:36:03 -0400
Received: from mail.vivotek.com ([60.248.39.150]:38268 "EHLO mail.vivotek.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727595AbfGEKgD (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 5 Jul 2019 06:36:03 -0400
Received: from pps.filterd (vivotekpps.vivotek.com [127.0.0.1])
        by vivotekpps.vivotek.com (8.16.0.22/8.16.0.22) with SMTP id x65AZspl008944;
        Fri, 5 Jul 2019 18:35:54 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivotek.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=dkim;
 bh=szkQ+8wAhdF2atU4GXas+uCFEomDFJslqNNhXjmvN1o=;
 b=BQyJxYrLgq/3q6jrLywtqdKmanzL6QSvnn4A1KgvKa3Bj99CXfLVZ1wJdXUnN2nBMTP0
 SNDwuzfmz9yXrJNSUdVJ4pca5XxpAIfDCbNY9oCG1RH8d78UYS9kxQi60icq6ORpjoAE
 TSuznnVxFp4II/xqgy+sAt2fq1FqIdybpOI= 
Received: from cas01.vivotek.tw ([192.168.0.58])
        by vivotekpps.vivotek.com with ESMTP id 2tj3w0g4su-1
        (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
        Fri, 05 Jul 2019 18:35:54 +0800
Received: from MBS-6F-DAG.vivotek.tw ([fe80::9001:3cd7:4ddb:c4ca]) by
 CAS01.vivotek.tw ([::1]) with mapi id 14.03.0319.002; Fri, 5 Jul 2019
 18:35:53 +0800
From:   <Michael.Wu@vatics.com>
To:     <bgolaszewski@baylibre.com>
CC:     <linus.walleij@linaro.org>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <mvp.kutali@gmail.com>
Subject: RE: [PATCH] gpiolib: fix incorrect IRQ requesting of an active-low
 lineevent
Thread-Topic: [PATCH] gpiolib: fix incorrect IRQ requesting of an active-low
 lineevent
Thread-Index: AQHVMxS2opuBZKJbbUCrIFX8Aoy3qKa7xiDw
Date:   Fri, 5 Jul 2019 10:35:52 +0000
Message-ID: <5DB475451BAA174CB158B5E897FC1525920E9FD0@MBS-6F-DAG.vivotek.tw>
References: <20190705093031.18182-1-michael.wu@vatics.com>
 <CAMpxmJUzaEREeUxCu2BCV12Huv7K=yeUSKntA5RGMfOQbnxaFg@mail.gmail.com>
In-Reply-To: <CAMpxmJUzaEREeUxCu2BCV12Huv7K=yeUSKntA5RGMfOQbnxaFg@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.17.134]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-07-05_04:,,
 signatures=0
X-Proofpoint-Spam-Reason: safe
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGkgQmFydG9zeiwNCg0KRm9yIGV4YW1wbGUsIHRoZXJlIGlzIGEgYnV0dG9uIHdoaWNoIGRyaXZl
cyBsZXZlbCB0byBiZSBsb3cgd2hlbiBpdCBpcyBwdXNoZWQsIGFuZCBkcml2ZXJzIGxldmVsIHRv
IGJlIGhpZ2ggd2hlbiBpdCBpcyByZWxlYXNlZC4NCldlIHdhbnQgdG8gY2F0Y2ggdGhlIGV2ZW50
IHdoZW4gdGhlIGJ1dHRvbiBpcyBwdXNoZWQuDQoNCkluIHVzZXIgc3BhY2Ugd2UgY29uZmlndXJl
IGEgbGluZSBldmVudCB3aXRoIHRoZSBmb2xsb3dpbmcgY29kZToNCg0KcmVxLmhhbmRsZWZsYWdz
ID0gR1BJT0hBTkRMRV9SRVFVRVNUX0lOUFVUOw0KcmVxLmV2ZW50ZmxhZ3MgPSBHUElPRVZFTlRf
UkVRVUVTVF9GQUxMSU5HX0VER0U7DQoNCmFuZCB3ZSBob3BlIHRvIGdldCAiZmFsbGluZyIgZXZl
bnRzIGJ5IHJlYWRpbmcgdGhlIGRldmljZSBub2RlOg0KDQp3aGlsZSAoMSkgew0KCXJlYWQoZmQs
ICZkYXQsc2l6ZW9mKGRhdCkpOw0KCWlmIChkYXQuaWQgPT0gMCkgew0KCQlwcmludGYoImJ1dHRv
biBwdXNoZWRcbiIpOw0KCX0NCn0NCg0KUnVuIHRoZSBzYW1lIGxvZ2ljIG9uIGFub3RoZXIgYm9h
cmQgd2hpY2ggdGhlIHBvbGFyaXR5IG9mIHRoZSBidXR0b24gaXMgaW52ZXJ0ZWQuIFRoZSBidXR0
b24gZHJpdmVzIGxldmVsIHRvIGJlIGhpZ2ggd2hlbiBpdCBpcyBwdXNoZWQuDQpGb3IgdGhlIGlu
dmVydGVkIGxldmVsIGNhc2UsIHdlIGhhdmUgdG8gYWRkIGZsYWcgR1BJT0hBTkRMRV9SRVFVRVNU
X0FDVElWRV9MT1c6DQoNCnJlcS5oYW5kbGVmbGFncyA9IEdQSU9IQU5ETEVfUkVRVUVTVF9JTlBV
VCB8IEdQSU9IQU5ETEVfUkVRVUVTVF9BQ1RJVkVfTE9XOw0KcmVxLmV2ZW50ZmxhZ3MgPSBHUElP
RVZFTlRfUkVRVUVTVF9GQUxMSU5HX0VER0U7DQoNCkF0IHRoZSByZXN1bHQsIHRoZXJlIGFyZSBu
byBhbnkgZXZlbnRzIGJlZW4gY2F1Z2h0IHdoZW4gdGhlIGJ1dHRvbiBpcyBwdXNoZWQuDQpCeSB0
aGUgd2F5LCBidXR0b24gcmVsZWFzaW5nIHdpbGwgZW1pdCBhICJmYWxsaW5nIiBldmVudC4NCg0K
DQpTaW5jZXJlbHksDQoNCk1pY2hhZWwgV3UgDQoNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0t
LS0NCkZyb206IEJhcnRvc3ogR29sYXN6ZXdza2kgW21haWx0bzpiZ29sYXN6ZXdza2lAYmF5bGli
cmUuY29tXSANClNlbnQ6IEZyaWRheSwgSnVseSAwNSwgMjAxOSA1OjMzIFBNDQpUbzogTWljaGFl
bC5XdSjlkLPlv6Dnm4opDQpDYzogTGludXMgV2FsbGVpajsgbGludXgtZ3BpbzsgTEtNTDsgbXZw
Lmt1dGFsaUBnbWFpbC5jb20NClN1YmplY3Q6IFJlOiBbUEFUQ0hdIGdwaW9saWI6IGZpeCBpbmNv
cnJlY3QgSVJRIHJlcXVlc3Rpbmcgb2YgYW4gYWN0aXZlLWxvdyBsaW5lZXZlbnQNCg0KcHQuLCA1
IGxpcCAyMDE5IG8gMTE6MzAgTWljaGFlbCBXdSA8bWljaGFlbC53dUB2YXRpY3MuY29tPiBuYXBp
c2HFgihhKToNCj4NCj4gV2hlbiBhIHBpbiBpcyBhY3RpdmUtbG93LCBsb2dpY2FsIHRyaWdnZXIg
ZWRnZSBzaG91bGQgYmUgaW52ZXJ0ZWQNCj4gdG8gbWF0Y2ggdGhlIHNhbWUgaW50ZXJydXB0IG9w
cG9ydHVuaXR5Lg0KPg0KPiBGb3IgZXhhbXBsZSwgYSBidXR0b24gcHVzaGVkIHRyaWdnZXIgZmFs
bGluZyBlZGdlIGluIEFDVElWRV9ISUdIDQo+IGNhc2U7IGluIEFDVElWRV9MT1cgY2FzZSwgdGhl
IGJ1dHRvbiBwdXNoZWQgdHJpZ2dlciByaXNpbmcgZWRnZS4NCj4gRm9yIHVzZXIgc3BhY2UgdGhl
IElSUSByZXF1ZXN0aW5nIGRvZXNuJ3QgbmVlZCB0byBkbyBhbnkNCj4gbW9kaWZpY2F0aW9uIGV4
Y2VwdCB0byBjb25maWd1cmluZyBHUElPSEFORExFX1JFUVVFU1RfQUNUSVZFX0xPVy4NCj4NCj4g
U2lnbmVkLW9mZi1ieTogTWljaGFlbCBXdSA8bWljaGFlbC53dUB2YXRpY3MuY29tPg0KPiAtLS0N
Cj4gIGRyaXZlcnMvZ3Bpby9ncGlvbGliLmMgfCA2ICsrKystLQ0KPiAgMSBmaWxlIGNoYW5nZWQs
IDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4NCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3Bpby9ncGlvbGliLmMgYi9kcml2ZXJzL2dwaW8vZ3Bpb2xpYi5jDQo+IGluZGV4IGUwMTNk
NDE3YTkzNi4uYjk4NDY2YTA1MDkxIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwaW8vZ3Bpb2xp
Yi5jDQo+ICsrKyBiL2RyaXZlcnMvZ3Bpby9ncGlvbGliLmMNCj4gQEAgLTk1Niw5ICs5NTYsMTEg
QEAgc3RhdGljIGludCBsaW5lZXZlbnRfY3JlYXRlKHN0cnVjdCBncGlvX2RldmljZSAqZ2Rldiwg
dm9pZCBfX3VzZXIgKmlwKQ0KPiAgICAgICAgIH0NCj4NCj4gICAgICAgICBpZiAoZWZsYWdzICYg
R1BJT0VWRU5UX1JFUVVFU1RfUklTSU5HX0VER0UpDQo+IC0gICAgICAgICAgICAgICBpcnFmbGFn
cyB8PSBJUlFGX1RSSUdHRVJfUklTSU5HOw0KPiArICAgICAgICAgICAgICAgaXJxZmxhZ3MgfD0g
dGVzdF9iaXQoRkxBR19BQ1RJVkVfTE9XLCAmZGVzYy0+ZmxhZ3MpID8NCj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgSVJRRl9UUklHR0VSX0ZBTExJTkcgOiBJUlFGX1RSSUdHRVJfUklTSU5HOw0K
PiAgICAgICAgIGlmIChlZmxhZ3MgJiBHUElPRVZFTlRfUkVRVUVTVF9GQUxMSU5HX0VER0UpDQo+
IC0gICAgICAgICAgICAgICBpcnFmbGFncyB8PSBJUlFGX1RSSUdHRVJfRkFMTElORzsNCj4gKyAg
ICAgICAgICAgICAgIGlycWZsYWdzIHw9IHRlc3RfYml0KEZMQUdfQUNUSVZFX0xPVywgJmRlc2Mt
PmZsYWdzKSA/DQo+ICsgICAgICAgICAgICAgICAgICAgICAgIElSUV9UUklHR0VSX1JJU0lORyA6
IElSUUZfVFJJR0dFUl9GQUxMSU5HOw0KPiAgICAgICAgIGlycWZsYWdzIHw9IElSUUZfT05FU0hP
VDsNCj4NCj4gICAgICAgICBJTklUX0tGSUZPKGxlLT5ldmVudHMpOw0KPiAtLQ0KPiAyLjE3LjEN
Cj4NCg0KSXMgdGhpcyBzb21ldGhpbmcgdGhhdCBjYXVzZXMgYSBidWcgaW4gdXNlci1zcGFjZT8g
QW55IHNjZW5hcmlvIHRvIHJlcHJvZHVjZSBpdD8NCg0KQmFydA0K
