Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2694312D91F
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Dec 2019 14:42:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727074AbfLaNmA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 31 Dec 2019 08:42:00 -0500
Received: from mailgw01.mediatek.com ([210.61.82.183]:21678 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726060AbfLaNmA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 31 Dec 2019 08:42:00 -0500
X-UUID: ed105c6aa3544f9ca40df3902204e9a5-20191231
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=NLtkQQyY/v3TFNS8jAK/8vskPM99kmaO4X9cQGAedV0=;
        b=pFSxLtfCyOvLV7n30H6OXdiOAxAAIp35FkVaKASUBKKoAJX1hBrF/mu65eZtDgSn32G03EEkAHE8vviscGOU95FW9FCDdUgOgdbhZ0VlJfG0iCiNbwIEPrG91szXIsNNanNqLtpfm5URGiMjp5OZkb6hOQN85pi9hrypVKI5n3I=;
X-UUID: ed105c6aa3544f9ca40df3902204e9a5-20191231
Received: from mtkcas09.mediatek.inc [(172.21.101.178)] by mailgw01.mediatek.com
        (envelope-from <light.hsieh@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 839560741; Tue, 31 Dec 2019 21:41:50 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 31 Dec 2019 21:41:01 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 31 Dec 2019 21:41:16 +0800
From:   Light Hsieh <light.hsieh@mediatek.com>
To:     <linus.walleij@linaro.org>
CC:     <linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <sean.wang@kernel.org>,
        <kuohong.wang@mediatek.com>, Light Hsieh <light.hsieh@mediatek.com>
Subject: [PATCH v7 2/6] Supporting driving setting without mapping current to register value
Date:   Tue, 31 Dec 2019 21:41:43 +0800
Message-ID: <1577799707-11855-2-git-send-email-light.hsieh@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1577799707-11855-1-git-send-email-light.hsieh@mediatek.com>
References: <1577799707-11855-1-git-send-email-light.hsieh@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

TWVkaWFUZWsncyBzbWFycGhvbmUgcHJvamVjdCBhY3R1YWwgdXNhZ2UgZG9lcyBuZWVkIHRvIGtu
b3cgY3VycmVudCB2YWx1ZQ0KKGluIG1BKSBpbiBwcm9jZWR1cmUgb2YgZmluZGluZyB0aGUgYmVz
dCBkcml2aW5nIHNldHRpbmcuDQpUaGUgc3RlcHMgaW4gdGhlIHByb2NlZHVyZSBpcyBsaWtlIGFz
IGZvbGxvdzoNCg0KMS4gc2V0IGRyaXZpbmcgc2V0dGluZyBmaWVsZCBpbiBzZXR0aW5nIHJlZ2lz
dGVyIGFzIDAsIG1lYXN1cmUgd2F2ZWZvcm0sDQogICBwZXJmb3JtIHRlc3QsIGFuZCBldGMuDQoy
LiBzZXQgZHJpdmluZyBzZXR0aW5nIGZpZWxkIGluIHNldHRpbmcgcmVnaXN0ZXIgYXMgMSwgbWVh
c3VyZSB3YXZlZm9ybSwNCiAgIHBlcmZvcm0gdGVzdCwgYW5kIGV0Yy4NCi4uLg0Kbi4gc2V0IGRy
aXZpbmcgc2V0dGluZyBmaWVsZCBpbiBzZXR0aW5nIHJlZ2lzdGVyIGFzIG4tMSwgbWVhc3VyZQ0K
ICAgd2F2ZWZvcm0sIHBlcmZvcm0gdGVzdCwgYW5kIGV0Yy4NCkNoZWNrIHRoZSByZXN1bHRzIG9m
IHN0ZXBzIDF+biBhbmQgYWRvcHQgdGhlIHNldHRpbmcgdGhhdCBnZXQgYmVzdCByZXN1bHQuDQoN
ClRoaXMgcHJvY2VkdXJlIGRvZXMgbmVlZCB0byBrbm93IHRoZSBtYXBwaW5nIGJldHdlZW4gY3Vy
cmVudCB0byByZWdpc3Rlcg0KdmFsdWUuDQpUaGVyZWZvcmUsIHNldHRpbmcgZHJpdmluZyB3aXRo
b3V0IG1hcHBpbmcgY3VycmVudCBpcyBtb3JlIHByYWN0aWNhbCBmb3INCk1lZGlhVGVrJ3Mgc21h
cnRwaG9uZSB1c2FnZS4NCg0KQ2hhbmdlLUlkOiBJOGJkNmEyY2VjYzBhZjY1MDkyMzcwNDU4OWI1
YjkwMDk3YjBmZjc3ZQ0KLS0tDQogZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL3BpbmN0cmwtbXQ2
NzY1LmMgICAgICAgIHwgIDQgKystLQ0KIGRyaXZlcnMvcGluY3RybC9tZWRpYXRlay9waW5jdHJs
LW10ay1jb21tb24tdjIuYyB8IDEyICsrKysrKysrKysrKw0KIGRyaXZlcnMvcGluY3RybC9tZWRp
YXRlay9waW5jdHJsLW10ay1jb21tb24tdjIuaCB8ICA1ICsrKysrDQogMyBmaWxlcyBjaGFuZ2Vk
LCAxOSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9waW5jdHJsL21lZGlhdGVrL3BpbmN0cmwtbXQ2NzY1LmMgYi9kcml2ZXJzL3BpbmN0cmwvbWVk
aWF0ZWsvcGluY3RybC1tdDY3NjUuYw0KaW5kZXggMzI0NTFlOC4uMTIxMjI2NCAxMDA2NDQNCi0t
LSBhL2RyaXZlcnMvcGluY3RybC9tZWRpYXRlay9waW5jdHJsLW10Njc2NS5jDQorKysgYi9kcml2
ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvcGluY3RybC1tdDY3NjUuYw0KQEAgLTEwNzcsOCArMTA3Nyw4
IEBADQogCS5iaWFzX2Rpc2FibGVfZ2V0ID0gbXRrX3BpbmNvbmZfYmlhc19kaXNhYmxlX2dldCwN
CiAJLmJpYXNfc2V0ID0gbXRrX3BpbmNvbmZfYmlhc19zZXQsDQogCS5iaWFzX2dldCA9IG10a19w
aW5jb25mX2JpYXNfZ2V0LA0KLQkuZHJpdmVfc2V0ID0gbXRrX3BpbmNvbmZfZHJpdmVfc2V0X3Jl
djEsDQotCS5kcml2ZV9nZXQgPSBtdGtfcGluY29uZl9kcml2ZV9nZXRfcmV2MSwNCisJLmRyaXZl
X3NldCA9IG10a19waW5jb25mX2RyaXZlX3NldF9yYXcsDQorCS5kcml2ZV9nZXQgPSBtdGtfcGlu
Y29uZl9kcml2ZV9nZXRfcmF3LA0KIAkuYWR2X3B1bGxfZ2V0ID0gbXRrX3BpbmNvbmZfYWR2X3B1
bGxfZ2V0LA0KIAkuYWR2X3B1bGxfc2V0ID0gbXRrX3BpbmNvbmZfYWR2X3B1bGxfc2V0LA0KIH07
DQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL3BpbmN0cmwtbXRrLWNvbW1v
bi12Mi5jIGIvZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL3BpbmN0cmwtbXRrLWNvbW1vbi12Mi5j
DQppbmRleCBkNjNlMDVlLi4yMjQ3ZWFlIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9waW5jdHJsL21l
ZGlhdGVrL3BpbmN0cmwtbXRrLWNvbW1vbi12Mi5jDQorKysgYi9kcml2ZXJzL3BpbmN0cmwvbWVk
aWF0ZWsvcGluY3RybC1tdGstY29tbW9uLXYyLmMNCkBAIC02MDgsNiArNjA4LDE4IEBAIGludCBt
dGtfcGluY29uZl9kcml2ZV9nZXRfcmV2MShzdHJ1Y3QgbXRrX3BpbmN0cmwgKmh3LA0KIAlyZXR1
cm4gMDsNCiB9DQogDQoraW50IG10a19waW5jb25mX2RyaXZlX3NldF9yYXcoc3RydWN0IG10a19w
aW5jdHJsICpodywNCisJCQkgICAgICAgY29uc3Qgc3RydWN0IG10a19waW5fZGVzYyAqZGVzYywg
dTMyIGFyZykNCit7DQorCXJldHVybiBtdGtfaHdfc2V0X3ZhbHVlKGh3LCBkZXNjLCBQSU5DVFJM
X1BJTl9SRUdfRFJWLCBhcmcpOw0KK30NCisNCitpbnQgbXRrX3BpbmNvbmZfZHJpdmVfZ2V0X3Jh
dyhzdHJ1Y3QgbXRrX3BpbmN0cmwgKmh3LA0KKwkJCSAgICAgICBjb25zdCBzdHJ1Y3QgbXRrX3Bp
bl9kZXNjICpkZXNjLCBpbnQgKnZhbCkNCit7DQorCXJldHVybiBtdGtfaHdfZ2V0X3ZhbHVlKGh3
LCBkZXNjLCBQSU5DVFJMX1BJTl9SRUdfRFJWLCB2YWwpOw0KK30NCisNCiBpbnQgbXRrX3BpbmNv
bmZfYWR2X3B1bGxfc2V0KHN0cnVjdCBtdGtfcGluY3RybCAqaHcsDQogCQkJICAgICBjb25zdCBz
dHJ1Y3QgbXRrX3Bpbl9kZXNjICpkZXNjLCBib29sIHB1bGx1cCwNCiAJCQkgICAgIHUzMiBhcmcp
DQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL3BpbmN0cmwtbXRrLWNvbW1v
bi12Mi5oIGIvZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL3BpbmN0cmwtbXRrLWNvbW1vbi12Mi5o
DQppbmRleCAxYjdkYTQyLi43NWQwZTA3IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9waW5jdHJsL21l
ZGlhdGVrL3BpbmN0cmwtbXRrLWNvbW1vbi12Mi5oDQorKysgYi9kcml2ZXJzL3BpbmN0cmwvbWVk
aWF0ZWsvcGluY3RybC1tdGstY29tbW9uLXYyLmgNCkBAIC0yODgsNiArMjg4LDExIEBAIGludCBt
dGtfcGluY29uZl9kcml2ZV9zZXRfcmV2MShzdHJ1Y3QgbXRrX3BpbmN0cmwgKmh3LA0KIGludCBt
dGtfcGluY29uZl9kcml2ZV9nZXRfcmV2MShzdHJ1Y3QgbXRrX3BpbmN0cmwgKmh3LA0KIAkJCSAg
ICAgICBjb25zdCBzdHJ1Y3QgbXRrX3Bpbl9kZXNjICpkZXNjLCBpbnQgKnZhbCk7DQogDQoraW50
IG10a19waW5jb25mX2RyaXZlX3NldF9yYXcoc3RydWN0IG10a19waW5jdHJsICpodywNCisJCQkg
ICAgICAgY29uc3Qgc3RydWN0IG10a19waW5fZGVzYyAqZGVzYywgdTMyIGFyZyk7DQoraW50IG10
a19waW5jb25mX2RyaXZlX2dldF9yYXcoc3RydWN0IG10a19waW5jdHJsICpodywNCisJCQkgICAg
ICAgY29uc3Qgc3RydWN0IG10a19waW5fZGVzYyAqZGVzYywgaW50ICp2YWwpOw0KKw0KIGludCBt
dGtfcGluY29uZl9hZHZfcHVsbF9zZXQoc3RydWN0IG10a19waW5jdHJsICpodywNCiAJCQkgICAg
IGNvbnN0IHN0cnVjdCBtdGtfcGluX2Rlc2MgKmRlc2MsIGJvb2wgcHVsbHVwLA0KIAkJCSAgICAg
dTMyIGFyZyk7DQotLSANCjEuOC4xLjEuZGlydHkNCg==

