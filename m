Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65A94144C06
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Jan 2020 07:53:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726078AbgAVGxX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Jan 2020 01:53:23 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:39247 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725883AbgAVGxX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Jan 2020 01:53:23 -0500
X-UUID: 8a87f1142f2e495896324db63689c8bb-20200122
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=KtD9QHwq7bfuSqhnaWSsi019jf5rw62Q2z/L7dueR8I=;
        b=r6RbM40ujb96wcP67sql4TGcZct5x9HKprvXhad/AK/wxStlp6O0b5+kEdBn6Be+u5Ga0PW1AWr5jfFd5cQOcHc8o1yHS9kVOY30/hXfRrcH3T4dNkiEtthdfMg+8tb0VlS7IrDUg1Go05sdl0EtzPTb3gxYfjMwzKzH8PnJzOw=;
X-UUID: 8a87f1142f2e495896324db63689c8bb-20200122
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
        (envelope-from <light.hsieh@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 899557401; Wed, 22 Jan 2020 14:53:17 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 22 Jan 2020 14:52:04 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 22 Jan 2020 14:51:58 +0800
From:   <light.hsieh@mediatek.com>
To:     <linus.walleij@linaro.org>
CC:     <linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <sean.wang@kernel.org>,
        <kuohong.wang@mediatek.com>, Light Hsieh <light.hsieh@mediatek.com>
Subject: [PATCH v8 2/6] pinctrl: mediatek: Supporting driving setting without mapping current to register value
Date:   Wed, 22 Jan 2020 14:53:10 +0800
Message-ID: <1579675994-7001-2-git-send-email-light.hsieh@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1579675994-7001-1-git-send-email-light.hsieh@mediatek.com>
References: <1579675994-7001-1-git-send-email-light.hsieh@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

RnJvbTogTGlnaHQgSHNpZWggPGxpZ2h0LmhzaWVoQG1lZGlhdGVrLmNvbT4NCg0KTWVkaWFUZWsn
cyBzbWFydHBob25lIHByb2plY3QgYWN0dWFsIHVzYWdlIGRvZXMgbmVlZCB0byBrbm93IGN1cnJl
bnQgdmFsdWUNCihpbiBtQSkgaW4gcHJvY2VkdXJlIG9mIGZpbmRpbmcgdGhlIGJlc3QgZHJpdmlu
ZyBzZXR0aW5nLg0KVGhlIHN0ZXBzIGluIHRoZSBwcm9jZWR1cmUgaXMgbGlrZSBhcyBmb2xsb3c6
DQoNCjEuIHNldCBkcml2aW5nIHNldHRpbmcgZmllbGQgaW4gc2V0dGluZyByZWdpc3RlciBhcyAw
LCBtZWFzdXJlIHdhdmVmb3JtLA0KICAgcGVyZm9ybSB0ZXN0LCBhbmQgZXRjLg0KMi4gc2V0IGRy
aXZpbmcgc2V0dGluZyBmaWVsZCBpbiBzZXR0aW5nIHJlZ2lzdGVyIGFzIDEsIG1lYXN1cmUgd2F2
ZWZvcm0sDQogICBwZXJmb3JtIHRlc3QsIGFuZCBldGMuDQouLi4NCm4uIHNldCBkcml2aW5nIHNl
dHRpbmcgZmllbGQgaW4gc2V0dGluZyByZWdpc3RlciBhcyBuLTEsIG1lYXN1cmUNCiAgIHdhdmVm
b3JtLCBwZXJmb3JtIHRlc3QsIGFuZCBldGMuDQpDaGVjayB0aGUgcmVzdWx0cyBvZiBzdGVwcyAx
fm4gYW5kIGFkb3B0IHRoZSBzZXR0aW5nIHRoYXQgZ2V0IGJlc3QgcmVzdWx0Lg0KDQpUaGlzIHBy
b2NlZHVyZSBkb2VzIG5lZWQgdG8ga25vdyB0aGUgbWFwcGluZyBiZXR3ZWVuIGN1cnJlbnQgdG8g
cmVnaXN0ZXINCnZhbHVlLg0KVGhlcmVmb3JlLCBzZXR0aW5nIGRyaXZpbmcgd2l0aG91dCBtYXBw
aW5nIGN1cnJlbnQgaXMgbW9yZSBwcmFjdGljYWwgZm9yDQpNZWRpYVRlaydzIHNtYXJ0cGhvbmUg
dXNhZ2UuDQoNClNpZ25lZC1vZmYtYnk6IExpZ2h0IEhzaWVoIDxsaWdodC5oc2llaEBtZWRpYXRl
ay5jb20+DQotLS0NCiBkcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvcGluY3RybC1tdDY3NjUuYyAg
ICAgICAgfCAgNCArKy0tDQogZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL3BpbmN0cmwtbXRrLWNv
bW1vbi12Mi5jIHwgMTIgKysrKysrKysrKysrDQogZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL3Bp
bmN0cmwtbXRrLWNvbW1vbi12Mi5oIHwgIDUgKysrKysNCiAzIGZpbGVzIGNoYW5nZWQsIDE5IGlu
c2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL3BpbmN0
cmwvbWVkaWF0ZWsvcGluY3RybC1tdDY3NjUuYyBiL2RyaXZlcnMvcGluY3RybC9tZWRpYXRlay9w
aW5jdHJsLW10Njc2NS5jDQppbmRleCAzMjQ1MWU4Li4xMjEyMjY0IDEwMDY0NA0KLS0tIGEvZHJp
dmVycy9waW5jdHJsL21lZGlhdGVrL3BpbmN0cmwtbXQ2NzY1LmMNCisrKyBiL2RyaXZlcnMvcGlu
Y3RybC9tZWRpYXRlay9waW5jdHJsLW10Njc2NS5jDQpAQCAtMTA3Nyw4ICsxMDc3LDggQEANCiAJ
LmJpYXNfZGlzYWJsZV9nZXQgPSBtdGtfcGluY29uZl9iaWFzX2Rpc2FibGVfZ2V0LA0KIAkuYmlh
c19zZXQgPSBtdGtfcGluY29uZl9iaWFzX3NldCwNCiAJLmJpYXNfZ2V0ID0gbXRrX3BpbmNvbmZf
Ymlhc19nZXQsDQotCS5kcml2ZV9zZXQgPSBtdGtfcGluY29uZl9kcml2ZV9zZXRfcmV2MSwNCi0J
LmRyaXZlX2dldCA9IG10a19waW5jb25mX2RyaXZlX2dldF9yZXYxLA0KKwkuZHJpdmVfc2V0ID0g
bXRrX3BpbmNvbmZfZHJpdmVfc2V0X3JhdywNCisJLmRyaXZlX2dldCA9IG10a19waW5jb25mX2Ry
aXZlX2dldF9yYXcsDQogCS5hZHZfcHVsbF9nZXQgPSBtdGtfcGluY29uZl9hZHZfcHVsbF9nZXQs
DQogCS5hZHZfcHVsbF9zZXQgPSBtdGtfcGluY29uZl9hZHZfcHVsbF9zZXQsDQogfTsNCmRpZmYg
LS1naXQgYS9kcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvcGluY3RybC1tdGstY29tbW9uLXYyLmMg
Yi9kcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvcGluY3RybC1tdGstY29tbW9uLXYyLmMNCmluZGV4
IGQ2M2UwNWUuLjIyNDdlYWUgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsv
cGluY3RybC1tdGstY29tbW9uLXYyLmMNCisrKyBiL2RyaXZlcnMvcGluY3RybC9tZWRpYXRlay9w
aW5jdHJsLW10ay1jb21tb24tdjIuYw0KQEAgLTYwOCw2ICs2MDgsMTggQEAgaW50IG10a19waW5j
b25mX2RyaXZlX2dldF9yZXYxKHN0cnVjdCBtdGtfcGluY3RybCAqaHcsDQogCXJldHVybiAwOw0K
IH0NCiANCitpbnQgbXRrX3BpbmNvbmZfZHJpdmVfc2V0X3JhdyhzdHJ1Y3QgbXRrX3BpbmN0cmwg
Kmh3LA0KKwkJCSAgICAgICBjb25zdCBzdHJ1Y3QgbXRrX3Bpbl9kZXNjICpkZXNjLCB1MzIgYXJn
KQ0KK3sNCisJcmV0dXJuIG10a19od19zZXRfdmFsdWUoaHcsIGRlc2MsIFBJTkNUUkxfUElOX1JF
R19EUlYsIGFyZyk7DQorfQ0KKw0KK2ludCBtdGtfcGluY29uZl9kcml2ZV9nZXRfcmF3KHN0cnVj
dCBtdGtfcGluY3RybCAqaHcsDQorCQkJICAgICAgIGNvbnN0IHN0cnVjdCBtdGtfcGluX2Rlc2Mg
KmRlc2MsIGludCAqdmFsKQ0KK3sNCisJcmV0dXJuIG10a19od19nZXRfdmFsdWUoaHcsIGRlc2Ms
IFBJTkNUUkxfUElOX1JFR19EUlYsIHZhbCk7DQorfQ0KKw0KIGludCBtdGtfcGluY29uZl9hZHZf
cHVsbF9zZXQoc3RydWN0IG10a19waW5jdHJsICpodywNCiAJCQkgICAgIGNvbnN0IHN0cnVjdCBt
dGtfcGluX2Rlc2MgKmRlc2MsIGJvb2wgcHVsbHVwLA0KIAkJCSAgICAgdTMyIGFyZykNCmRpZmYg
LS1naXQgYS9kcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvcGluY3RybC1tdGstY29tbW9uLXYyLmgg
Yi9kcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvcGluY3RybC1tdGstY29tbW9uLXYyLmgNCmluZGV4
IDFiN2RhNDIuLjc1ZDBlMDcgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsv
cGluY3RybC1tdGstY29tbW9uLXYyLmgNCisrKyBiL2RyaXZlcnMvcGluY3RybC9tZWRpYXRlay9w
aW5jdHJsLW10ay1jb21tb24tdjIuaA0KQEAgLTI4OCw2ICsyODgsMTEgQEAgaW50IG10a19waW5j
b25mX2RyaXZlX3NldF9yZXYxKHN0cnVjdCBtdGtfcGluY3RybCAqaHcsDQogaW50IG10a19waW5j
b25mX2RyaXZlX2dldF9yZXYxKHN0cnVjdCBtdGtfcGluY3RybCAqaHcsDQogCQkJICAgICAgIGNv
bnN0IHN0cnVjdCBtdGtfcGluX2Rlc2MgKmRlc2MsIGludCAqdmFsKTsNCiANCitpbnQgbXRrX3Bp
bmNvbmZfZHJpdmVfc2V0X3JhdyhzdHJ1Y3QgbXRrX3BpbmN0cmwgKmh3LA0KKwkJCSAgICAgICBj
b25zdCBzdHJ1Y3QgbXRrX3Bpbl9kZXNjICpkZXNjLCB1MzIgYXJnKTsNCitpbnQgbXRrX3BpbmNv
bmZfZHJpdmVfZ2V0X3JhdyhzdHJ1Y3QgbXRrX3BpbmN0cmwgKmh3LA0KKwkJCSAgICAgICBjb25z
dCBzdHJ1Y3QgbXRrX3Bpbl9kZXNjICpkZXNjLCBpbnQgKnZhbCk7DQorDQogaW50IG10a19waW5j
b25mX2Fkdl9wdWxsX3NldChzdHJ1Y3QgbXRrX3BpbmN0cmwgKmh3LA0KIAkJCSAgICAgY29uc3Qg
c3RydWN0IG10a19waW5fZGVzYyAqZGVzYywgYm9vbCBwdWxsdXAsDQogCQkJICAgICB1MzIgYXJn
KTsNCi0tIA0KMS44LjEuMS5kaXJ0eQ0K

