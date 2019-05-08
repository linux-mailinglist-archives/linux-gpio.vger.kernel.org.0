Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DECB217BC7
	for <lists+linux-gpio@lfdr.de>; Wed,  8 May 2019 16:44:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726634AbfEHOo2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 May 2019 10:44:28 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:42634 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726544AbfEHOo2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 May 2019 10:44:28 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x48EfRWK016745;
        Wed, 8 May 2019 16:44:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=ujx99i/SdmhJJY/rTfyjZ25oaMJTjnJ2T2B83DEfQao=;
 b=NDBJhGUrF+5cuInlJHlGw+Wa11TeVKy9sCKxakUcQg4M/gC07uoIxkT24K1/ylLXCY5k
 Wqkzt57AQ4QQIWbdeDTm64k50D83HpQnavgmO3DPW3lFsa43MPtwtayz9mF9D0q6vOea
 Cv2pYd5EDB78dz4AIOFkcw3UEc1gqZcvm1DrQJfcuWPdA+G59vhtndIXoHLbKyIC9h2d
 0gjVQ+9DE8jS5lMkO35E8SA8A8VboazvOKB1Nl+eAUmASF8V5MofiqFSZz50jFA9fMOP
 Zfo6w4OdapO7LKAhrAa18JXran0E0YZ3FWsA3nNZK/0kg5Jqs6zDVyLeVp+csBDU6TcD Vw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx08-00178001.pphosted.com with ESMTP id 2s94c3qnkd-1
        (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
        Wed, 08 May 2019 16:44:12 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0476338;
        Wed,  8 May 2019 14:44:10 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
        by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C010028CA;
        Wed,  8 May 2019 14:44:10 +0000 (GMT)
Received: from SFHDAG3NODE2.st.com (10.75.127.8) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 8 May
 2019 16:44:10 +0200
Received: from SFHDAG3NODE2.st.com ([fe80::b82f:1ce:8854:5b96]) by
 SFHDAG3NODE2.st.com ([fe80::b82f:1ce:8854:5b96%20]) with mapi id
 15.00.1347.000; Wed, 8 May 2019 16:44:10 +0200
From:   Amelie DELAUNAY <amelie.delaunay@st.com>
To:     Lee Jones <lee.jones@linaro.org>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexandre TORGUE <alexandre.torgue@st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-stm32@st-md-mailman.stormreply.com" 
        <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [PATCH v5 2/9] mfd: Add ST Multi-Function eXpander (STMFX) core
 driver
Thread-Topic: [PATCH v5 2/9] mfd: Add ST Multi-Function eXpander (STMFX) core
 driver
Thread-Index: AQHU7qVAy3Bds8UGv0OmxPFvTsiQh6Zg82kAgABmwoA=
Date:   Wed, 8 May 2019 14:44:10 +0000
Message-ID: <697597b2-088d-9ffb-54bd-e50b3ca8c012@st.com>
References: <1554794651-6874-1-git-send-email-amelie.delaunay@st.com>
 <1554794651-6874-3-git-send-email-amelie.delaunay@st.com>
 <20190508083622.GE3995@dell>
In-Reply-To: <20190508083622.GE3995@dell>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.44]
Content-Type: text/plain; charset="utf-8"
Content-ID: <AA71AC5806FEE94686A2708FB6B887B8@st.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-05-08_08:,,
 signatures=0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

T24gNS84LzE5IDEwOjM2IEFNLCBMZWUgSm9uZXMgd3JvdGU6DQo+IE9uIFR1ZSwgMDkgQXByIDIw
MTksIEFtZWxpZSBEZWxhdW5heSB3cm90ZToNCj4gDQo+PiBTVE1pY3JvZWxlY3Ryb25pY3MgTXVs
dGktRnVuY3Rpb24gZVhwYW5kZXIgKFNUTUZYKSBpcyBhIHNsYXZlIGNvbnRyb2xsZXINCj4+IHVz
aW5nIEkyQyBmb3IgY29tbXVuaWNhdGlvbiB3aXRoIHRoZSBtYWluIE1DVS4gTWFpbiBmZWF0dXJl
cyBhcmU6DQo+PiAtIDE2IGZhc3QgR1BJT3MgaW5kaXZpZHVhbGx5IGNvbmZpZ3VyYWJsZSBpbiBp
bnB1dC9vdXRwdXQNCj4+IC0gOCBhbHRlcm5hdGUgR1BJT3MgaW5kaXZpZHVhbGx5IGNvbmZpZ3Vy
YWJsZSBpbiBpbnB1dC9vdXRwdXQgd2hlbiBvdGhlcg0KPj4gU1RNRlggZnVuY3Rpb25zIGFyZSBu
b3QgdXNlZA0KPj4gLSBNYWluIE1DVSBJREQgbWVhc3VyZW1lbnQNCj4+IC0gUmVzaXN0aXZlIHRv
dWNoc2NyZWVuIGNvbnRyb2xsZXINCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBBbWVsaWUgRGVsYXVu
YXkgPGFtZWxpZS5kZWxhdW5heUBzdC5jb20+DQo+PiAtLS0NCj4+ICAgZHJpdmVycy9tZmQvS2Nv
bmZpZyAgICAgICB8ICAxMyArKw0KPj4gICBkcml2ZXJzL21mZC9NYWtlZmlsZSAgICAgIHwgICAy
ICstDQo+PiAgIGRyaXZlcnMvbWZkL3N0bWZ4LmMgICAgICAgfCA1NjYgKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPj4gICBpbmNsdWRlL2xpbnV4L21mZC9z
dG1meC5oIHwgMTIzICsrKysrKysrKysNCj4+ICAgNCBmaWxlcyBjaGFuZ2VkLCA3MDMgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9t
ZmQvc3RtZnguYw0KPj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9saW51eC9tZmQvc3Rt
ZnguaA0KPj4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21mZC9LY29uZmlnIGIvZHJpdmVycy9t
ZmQvS2NvbmZpZw0KPj4gaW5kZXggMzQ0M2YxYS4uOTc4M2UxOCAxMDA2NDQNCj4+IC0tLSBhL2Ry
aXZlcnMvbWZkL0tjb25maWcNCj4+ICsrKyBiL2RyaXZlcnMvbWZkL0tjb25maWcNCj4+IEBAIC0x
OTA3LDYgKzE5MDcsMTkgQEAgY29uZmlnIE1GRF9TVFBNSUMxDQo+PiAgIAkgIFRvIGNvbXBpbGUg
dGhpcyBkcml2ZXIgYXMgYSBtb2R1bGUsIGNob29zZSBNIGhlcmU6IHRoZQ0KPj4gICAJICBtb2R1
bGUgd2lsbCBiZSBjYWxsZWQgc3RwbWljMS4NCj4+ICAgDQo+PiArY29uZmlnIE1GRF9TVE1GWA0K
Pj4gKwl0cmlzdGF0ZSAiU3VwcG9ydCBmb3IgU1RNaWNyb2VsZWN0cm9uaWNzIE11bHRpLUZ1bmN0
aW9uIGVYcGFuZGVyIChTVE1GWCkiDQo+PiArCWRlcGVuZHMgb24gSTJDDQo+PiArCWRlcGVuZHMg
b24gT0YgfHwgQ09NUElMRV9URVNUDQo+PiArCXNlbGVjdCBNRkRfQ09SRQ0KPj4gKwlzZWxlY3Qg
UkVHTUFQX0kyQw0KPj4gKwloZWxwDQo+PiArCSAgU3VwcG9ydCBmb3IgdGhlIFNUTWljcm9lbGVj
dHJvbmljcyBNdWx0aS1GdW5jdGlvbiBlWHBhbmRlci4NCj4+ICsNCj4+ICsJICBUaGlzIGRyaXZl
ciBwcm92aWRlcyBjb21tb24gc3VwcG9ydCBmb3IgYWNjZXNzaW5nIHRoZSBkZXZpY2UsDQo+PiAr
CSAgYWRkaXRpb25hbCBkcml2ZXJzIG11c3QgYmUgZW5hYmxlZCBpbiBvcmRlciB0byB1c2UgdGhl
IGZ1bmN0aW9uYWxpdHkNCj4+ICsJICBvZiB0aGUgZGV2aWNlLg0KPj4gKw0KPj4gICBtZW51ICJN
dWx0aW1lZGlhIENhcGFiaWxpdGllcyBQb3J0IGRyaXZlcnMiDQo+PiAgIAlkZXBlbmRzIG9uIEFS
Q0hfU0ExMTAwDQo+PiAgIA0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWZkL01ha2VmaWxlIGIv
ZHJpdmVycy9tZmQvTWFrZWZpbGUNCj4+IGluZGV4IGI0NTY5ZWQ3Li42MTRlZWE4IDEwMDY0NA0K
Pj4gLS0tIGEvZHJpdmVycy9tZmQvTWFrZWZpbGUNCj4+ICsrKyBiL2RyaXZlcnMvbWZkL01ha2Vm
aWxlDQo+PiBAQCAtMjQ2LDQgKzI0Niw0IEBAIG9iai0kKENPTkZJR19NRkRfTVhTX0xSQURDKSAg
ICAgKz0gbXhzLWxyYWRjLm8NCj4+ICAgb2JqLSQoQ09ORklHX01GRF9TQzI3WFhfUE1JQykJKz0g
c3ByZC1zYzI3eHgtc3BpLm8NCj4+ICAgb2JqLSQoQ09ORklHX1JBVkVfU1BfQ09SRSkJKz0gcmF2
ZS1zcC5vDQo+PiAgIG9iai0kKENPTkZJR19NRkRfUk9ITV9CRDcxOFhYKQkrPSByb2htLWJkNzE4
eDcubw0KPj4gLQ0KPj4gK29iai0kKENPTkZJR19NRkRfU1RNRlgpIAkrPSBzdG1meC5vDQo+PiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9tZmQvc3RtZnguYyBiL2RyaXZlcnMvbWZkL3N0bWZ4LmMNCj4+
IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+PiBpbmRleCAwMDAwMDAwLi41OWYwYTAzDQo+PiAtLS0g
L2Rldi9udWxsDQo+PiArKysgYi9kcml2ZXJzL21mZC9zdG1meC5jDQo+PiBAQCAtMCwwICsxLDU2
NiBAQA0KPj4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wDQo+PiArLyoNCj4+
ICsgKiBEcml2ZXIgZm9yIFNUTWljcm9lbGVjdHJvbmljcyBNdWx0aS1GdW5jdGlvbiBlWHBhbmRl
ciAoU1RNRlgpIGNvcmUNCj4+ICsgKg0KPj4gKyAqIENvcHlyaWdodCAoQykgMjAxOSBTVE1pY3Jv
ZWxlY3Ryb25pY3MNCj4+ICsgKiBBdXRob3Iocyk6IEFtZWxpZSBEZWxhdW5heSA8YW1lbGllLmRl
bGF1bmF5QHN0LmNvbT4uDQo+PiArICovDQo+PiArI2luY2x1ZGUgPGxpbnV4L2JpdGZpZWxkLmg+
DQo+PiArI2luY2x1ZGUgPGxpbnV4L2kyYy5oPg0KPj4gKyNpbmNsdWRlIDxsaW51eC9pbnRlcnJ1
cHQuaD4NCj4+ICsjaW5jbHVkZSA8bGludXgvaXJxLmg+DQo+PiArI2luY2x1ZGUgPGxpbnV4L21m
ZC9jb3JlLmg+DQo+PiArI2luY2x1ZGUgPGxpbnV4L21mZC9zdG1meC5oPg0KPj4gKyNpbmNsdWRl
IDxsaW51eC9tb2R1bGUuaD4NCj4+ICsjaW5jbHVkZSA8bGludXgvcmVndWxhdG9yL2NvbnN1bWVy
Lmg+DQo+IA0KPiBbLi4uXQ0KPiANCj4+ICtzdGF0aWMgaW50IHN0bWZ4X2NoaXBfaW5pdChzdHJ1
Y3QgaTJjX2NsaWVudCAqY2xpZW50KQ0KPj4gK3sNCj4+ICsJc3RydWN0IHN0bWZ4ICpzdG1meCA9
IGkyY19nZXRfY2xpZW50ZGF0YShjbGllbnQpOw0KPj4gKwl1MzIgaWQ7DQo+PiArCXU4IHZlcnNp
b25bMl07DQo+PiArCWludCByZXQ7DQo+PiArDQo+PiArCXN0bWZ4LT52ZGQgPSBkZXZtX3JlZ3Vs
YXRvcl9nZXRfb3B0aW9uYWwoJmNsaWVudC0+ZGV2LCAidmRkIik7DQo+PiArCWlmIChJU19FUlIo
c3RtZngtPnZkZCkpIHsNCj4+ICsJCXJldCA9IFBUUl9FUlIoc3RtZngtPnZkZCk7DQo+PiArCQlp
ZiAocmV0ICE9IC1FTk9ERVYpIHsNCj4+ICsJCQlpZiAocmV0ICE9IC1FUFJPQkVfREVGRVIpDQo+
PiArCQkJCWRldl9lcnIoJmNsaWVudC0+ZGV2LA0KPj4gKwkJCQkJIkNhbid0IGdldCBWREQgcmVn
dWxhdG9yOiVkXG4iLCByZXQpOw0KPj4gKwkJCXJldHVybiByZXQ7DQo+PiArCQl9DQo+IA0KPiBB
bnkgcmVhc29uIHlvdSd2ZSBkZWNpZGVkIHRvIHN0aWNrIHdpdGggdGhpcyAzLWxheWVyIG5lc3Rl
ZCBpZiBpbnN0ZWFkDQo+IG9mIGdvaW5nIHdpdGggbXkgc3VnZ2VzdGlvbj8NCj4gDQoNClNvcnJ5
LCBJIGRpZG4ndCBzZWUgeW91ciBzdWdnZXN0aW9uLiBJJ2xsIGdvIHdpdGggaXQgaW4gdjYuDQoN
Cj4+ICsJfSBlbHNlIHsNCj4+ICsJCXJldCA9IHJlZ3VsYXRvcl9lbmFibGUoc3RtZngtPnZkZCk7
DQo+PiArCQlpZiAocmV0KSB7DQo+PiArCQkJZGV2X2VycigmY2xpZW50LT5kZXYsICJWREQgZW5h
YmxlIGZhaWxlZDogJWRcbiIsIHJldCk7DQo+PiArCQkJcmV0dXJuIHJldDsNCj4+ICsJCX0NCj4+
ICsJfQ0KPiANCj4gWy4uLl0NCj4gDQo+PiArI2lmZGVmIENPTkZJR19QTV9TTEVFUA0KPj4gK3N0
YXRpYyBpbnQgc3RtZnhfYmFja3VwX3JlZ3Moc3RydWN0IHN0bWZ4ICpzdG1meCkNCj4+ICt7DQo+
PiArCWludCByZXQ7DQo+PiArDQo+PiArCXJldCA9IHJlZ21hcF9yYXdfcmVhZChzdG1meC0+bWFw
LCBTVE1GWF9SRUdfU1lTX0NUUkwsDQo+PiArCQkJICAgICAgJnN0bWZ4LT5ia3Bfc3lzY3RybCwg
c2l6ZW9mKHN0bWZ4LT5ia3Bfc3lzY3RybCkpOw0KPj4gKwlpZiAocmV0KQ0KPj4gKwkJcmV0dXJu
IHJldDsNCj4+ICsNCj4+ICsJcmV0ID0gcmVnbWFwX3Jhd19yZWFkKHN0bWZ4LT5tYXAsIFNUTUZY
X1JFR19JUlFfT1VUX1BJTiwNCj4+ICsJCQkgICAgICAmc3RtZngtPmJrcF9pcnFvdXRwaW4sDQo+
PiArCQkJICAgICAgc2l6ZW9mKHN0bWZ4LT5ia3BfaXJxb3V0cGluKSk7DQo+PiArCWlmIChyZXQp
DQo+PiArCQlyZXR1cm4gcmV0Ow0KPj4gKw0KPj4gKwlyZXR1cm4gMDsNCj4+ICt9DQo+PiArDQo+
PiArc3RhdGljIGludCBzdG1meF9yZXN0b3JlX3JlZ3Moc3RydWN0IHN0bWZ4ICpzdG1meCkNCj4+
ICt7DQo+PiArCWludCByZXQ7DQo+PiArDQo+PiArCXJldCA9IHJlZ21hcF9yYXdfd3JpdGUoc3Rt
ZngtPm1hcCwgU1RNRlhfUkVHX1NZU19DVFJMLA0KPj4gKwkJCSAgICAgICAmc3RtZngtPmJrcF9z
eXNjdHJsLCBzaXplb2Yoc3RtZngtPmJrcF9zeXNjdHJsKSk7DQo+PiArCWlmIChyZXQpDQo+PiAr
CQlyZXR1cm4gcmV0Ow0KPj4gKw0KPj4gKwlyZXQgPSByZWdtYXBfcmF3X3dyaXRlKHN0bWZ4LT5t
YXAsIFNUTUZYX1JFR19JUlFfT1VUX1BJTiwNCj4+ICsJCQkgICAgICAgJnN0bWZ4LT5ia3BfaXJx
b3V0cGluLA0KPj4gKwkJCSAgICAgICBzaXplb2Yoc3RtZngtPmJrcF9pcnFvdXRwaW4pKTsNCj4+
ICsJaWYgKHJldCkNCj4+ICsJCXJldHVybiByZXQ7DQo+PiArDQo+PiArCXJldCA9IHJlZ21hcF9y
YXdfd3JpdGUoc3RtZngtPm1hcCwgU1RNRlhfUkVHX0lSUV9TUkNfRU4sDQo+PiArCQkJICAgICAg
ICZzdG1meC0+aXJxX3NyYywgc2l6ZW9mKHN0bWZ4LT5pcnFfc3JjKSk7DQo+PiArCWlmIChyZXQp
DQo+PiArCQlyZXR1cm4gcmV0Ow0KPj4gKw0KPj4gKwlyZXR1cm4gMDsNCj4+ICt9DQo+PiArDQo+
PiArc3RhdGljIGludCBzdG1meF9zdXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRldikNCj4+ICt7DQo+
PiArCXN0cnVjdCBzdG1meCAqc3RtZnggPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsNCj4+ICsJaW50
IHJldDsNCj4+ICsNCj4+ICsJcmV0ID0gc3RtZnhfYmFja3VwX3JlZ3Moc3RtZngpOw0KPj4gKwlp
ZiAocmV0KSB7DQo+PiArCQlkZXZfZXJyKHN0bWZ4LT5kZXYsICJSZWdpc3RlcnMgYmFja3VwIGZh
aWx1cmVcbiIpOw0KPj4gKwkJcmV0dXJuIHJldDsNCj4+ICsJfQ0KPiANCj4gVGhpcyBkb2Vzbid0
IG5lZWQgdG8gYmUgYW4gZXh0cmEgZnVuY3Rpb24uICBZb3UncmUganVzdCBhZGRpbmcgbW9yZQ0K
PiBsaW5lcyBvZiBjb2RlIGZvciBubyByZWFsIGdhaW4gaW4gcmV1c2FiaWxpdHkvcmVhZGFiaWxp
dHkuDQo+IA0KDQpJIHVzZWQgYSBzZXBhcmF0ZSBmdW5jdGlvbiB0byBoYXZlIG9ubHkgb25lIGRl
dl9lcnIgaW4gY2FzZSBvZiANCmJhY2t1cC9yZXN0b3JlIGZhaWx1cmUuDQpCdXQgYW55d2F5LCBJ
J2xsIGRyb3AgYmFja3VwL3Jlc3RvcmUgZnVuY3Rpb25zIGFuZCBwdXQgdGhlIGNvZGUgaW4gDQpz
dXNwZW5kL3Jlc3VtZS4NCg0KPj4gKwlpZiAoIUlTX0VSUihzdG1meC0+dmRkKSkgew0KPj4gKwkJ
cmV0ID0gcmVndWxhdG9yX2Rpc2FibGUoc3RtZngtPnZkZCk7DQo+PiArCQlpZiAocmV0KQ0KPj4g
KwkJCXJldHVybiByZXQ7DQo+PiArCX0NCj4+ICsNCj4+ICsJcmV0dXJuIDA7DQo+PiArfQ0KPj4g
Kw0KPj4gK3N0YXRpYyBpbnQgc3RtZnhfcmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRldikNCj4+ICt7
DQo+PiArCXN0cnVjdCBzdG1meCAqc3RtZnggPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsNCj4+ICsJ
aW50IHJldDsNCj4+ICsNCj4+ICsJaWYgKCFJU19FUlIoc3RtZngtPnZkZCkpIHsNCj4+ICsJCXJl
dCA9IHJlZ3VsYXRvcl9lbmFibGUoc3RtZngtPnZkZCk7DQo+PiArCQlpZiAocmV0KSB7DQo+PiAr
CQkJZGV2X2VycihzdG1meC0+ZGV2LA0KPj4gKwkJCQkiVkREIGVuYWJsZSBmYWlsZWQ6ICVkXG4i
LCByZXQpOw0KPj4gKwkJCXJldHVybiByZXQ7DQo+PiArCQl9DQo+PiArCX0NCj4+ICsNCj4+ICsJ
cmV0ID0gc3RtZnhfcmVzdG9yZV9yZWdzKHN0bWZ4KTsNCj4+ICsJaWYgKHJldCkgew0KPj4gKwkJ
ZGV2X2VycihzdG1meC0+ZGV2LCAiUmVnaXN0ZXJzIHJlc3RvcmF0aW9uIGZhaWx1cmVcbiIpOw0K
Pj4gKwkJcmV0dXJuIHJldDsNCj4+ICsJfQ0KPiANCj4gVGhpcyBkb2Vzbid0IG5lZWQgdG8gYmUg
YW4gZXh0cmEgZnVuY3Rpb24uICBZb3UncmUganVzdCBhZGRpbmcgbW9yZQ0KPiBsaW5lcyBvZiBj
b2RlIGZvciBubyByZWFsIGdhaW4gaW4gcmV1c2FiaWxpdHkvcmVhZGFiaWxpdHkuDQo+IA0KPj4g
KwlyZXR1cm4gMDsNCj4+ICt9DQo+PiArI2VuZGlmDQo+IA0KPiBbLi4uXQ0KPiA=
