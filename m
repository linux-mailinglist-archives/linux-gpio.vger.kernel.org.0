Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F57124BD33
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Aug 2020 15:01:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729741AbgHTM6V (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Aug 2020 08:58:21 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:54186 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729061AbgHTJks (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Aug 2020 05:40:48 -0400
X-UUID: 1984987cbc4d4ab59f1cffc95a1863c6-20200820
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=PEJq9o5rjHt9Tgt/ghXvLxkCSShvH3PLy1g95tCOzfo=;
        b=u4kmujXaQXvIQTsiNtWhYp1Ir+63ck6qM6hUbYor08fTrvamxwsGwbRChhAqFPiLrA3xaTpNnbvg32Cg13H6mcCd2Sj711agi0uo1EFrzigGdJdgjUoNngR2Cj32wiXN3MUHrkEPJa3rJEvgTrgPTrBkHmKmq51H/c4Z4ZEzPE0=;
X-UUID: 1984987cbc4d4ab59f1cffc95a1863c6-20200820
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw02.mediatek.com
        (envelope-from <light.hsieh@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1248855608; Thu, 20 Aug 2020 17:40:43 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 20 Aug 2020 17:40:39 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 20 Aug 2020 17:40:40 +0800
From:   <light.hsieh@mediatek.com>
To:     <linus.walleij@linaro.org>
CC:     <linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <sean.wang@kernel.org>,
        <kuohong.wang@mediatek.com>, Light Hsieh <light.hsieh@mediatek.com>
Subject: [PATCH v1 1/1] pinctrl: mediatek: refine mtk_pmx_get_funcs_cnt()
Date:   Thu, 20 Aug 2020 17:40:39 +0800
Message-ID: <1597916439-26376-1-git-send-email-light.hsieh@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: 89E841128ED7E0737F0C5C3B513376298F38FFC82A08151051B83A73D1B33ED22000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

RnJvbTogTGlnaHQgSHNpZWggPGxpZ2h0LmhzaWVoQG1lZGlhdGVrLmNvbT4NCg0KUmVmaW5lIGlt
cGxlbWVudGF0aW9uIG9mIG10a19wbXhfZ2V0X2Z1bmNzX2NudCgpLg0KVGhlIG9yaWdpbmFsIGlt
cGxlbWVudGF0aW9uIGFsd2F5cyByZXR1cm4gQVJSQVlfU0laRShtdGtfZ3Bpb19mdW5jdGlvbnMp
DQp3aGljaCBpcyAxNi4NCg0KSG93ZXZlciwgTVQ2NzY1L01UNjc3OSBvbmx5IHN1cHBvcnQgOCBm
dW5jdGlvbnMgcGVyIEdQSU8gcGluLiBTbyByZXR1cm5pbmcNCjE2IGlzIGltcHJvcGVyLiBUaGUg
bmV3IGltcGxlbWVudGF0aW9uIGNoZWNrIG1lbWJlciBuZnVuY3Mgb2Ygc3RydWN0DQptdGtfcGlu
X3NvYyBmb3IgYSBwbGF0Zm9ybS4gSWYgbmZ1bmNzIGlzIG5vdCB6ZXJvLCByZXR1cm4gbmZ1bmNz
Lg0KSWYgbmZ1bmNzIGlzIHplcm8sIGZhbGxiYWNrIHRvIG9yaWdpbmFsIGltcGxlbWVudGF0aW9u
IGJ5IHJldHVybmluZw0KQVJSQVlfU0laRShtdGtfZ3Bpb19mdW5jdGlvbnMpLg0KDQpTaWduZWQt
b2ZmLWJ5OiBMaWdodCBIc2llaCA8bGlnaHQuaHNpZWhAbWVkaWF0ZWsuY29tPg0KLS0tDQogZHJp
dmVycy9waW5jdHJsL21lZGlhdGVrL3BpbmN0cmwtbXQ2NzY1LmMgfCAxICsNCiBkcml2ZXJzL3Bp
bmN0cmwvbWVkaWF0ZWsvcGluY3RybC1tdDY3NzkuYyB8IDEgKw0KIGRyaXZlcnMvcGluY3RybC9t
ZWRpYXRlay9waW5jdHJsLXBhcmlzLmMgIHwgNCArKysrDQogMyBmaWxlcyBjaGFuZ2VkLCA2IGlu
c2VydGlvbnMoKykNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGluY3RybC9tZWRpYXRlay9waW5j
dHJsLW10Njc2NS5jIGIvZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL3BpbmN0cmwtbXQ2NzY1LmMN
CmluZGV4IDJjNTlkMzkuLjhkOWYzZWEgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL3BpbmN0cmwvbWVk
aWF0ZWsvcGluY3RybC1tdDY3NjUuYw0KKysrIGIvZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL3Bp
bmN0cmwtbXQ2NzY1LmMNCkBAIC0xMDY5LDYgKzEwNjksNyBAQA0KIAkucGlucyA9IG10a19waW5z
X210Njc2NSwNCiAJLm5waW5zID0gQVJSQVlfU0laRShtdGtfcGluc19tdDY3NjUpLA0KIAkubmdy
cHMgPSBBUlJBWV9TSVpFKG10a19waW5zX210Njc2NSksDQorCS5uZnVuY3MgPSA4LA0KIAkuZWlu
dF9odyA9ICZtdDY3NjVfZWludF9odywNCiAJLmdwaW9fbSA9IDAsDQogCS5iYXNlX25hbWVzID0g
bXQ2NzY1X3BpbmN0cmxfcmVnaXN0ZXJfYmFzZV9uYW1lcywNCmRpZmYgLS1naXQgYS9kcml2ZXJz
L3BpbmN0cmwvbWVkaWF0ZWsvcGluY3RybC1tdDY3NzkuYyBiL2RyaXZlcnMvcGluY3RybC9tZWRp
YXRlay9waW5jdHJsLW10Njc3OS5jDQppbmRleCBiYjA4NTFjLi4xZjI2YWRiIDEwMDY0NA0KLS0t
IGEvZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL3BpbmN0cmwtbXQ2Nzc5LmMNCisrKyBiL2RyaXZl
cnMvcGluY3RybC9tZWRpYXRlay9waW5jdHJsLW10Njc3OS5jDQpAQCAtNzQ0LDYgKzc0NCw3IEBA
DQogCS5waW5zID0gbXRrX3BpbnNfbXQ2Nzc5LA0KIAkubnBpbnMgPSBBUlJBWV9TSVpFKG10a19w
aW5zX210Njc3OSksDQogCS5uZ3JwcyA9IEFSUkFZX1NJWkUobXRrX3BpbnNfbXQ2Nzc5KSwNCisJ
Lm5mdW5jcyA9IDgsDQogCS5laW50X2h3ID0gJm10Njc3OV9laW50X2h3LA0KIAkuZ3Bpb19tID0g
MCwNCiAJLmllc19wcmVzZW50ID0gdHJ1ZSwNCmRpZmYgLS1naXQgYS9kcml2ZXJzL3BpbmN0cmwv
bWVkaWF0ZWsvcGluY3RybC1wYXJpcy5jIGIvZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL3BpbmN0
cmwtcGFyaXMuYw0KaW5kZXggYTIzYzE4Mi4uOTZmOWY4NiAxMDA2NDQNCi0tLSBhL2RyaXZlcnMv
cGluY3RybC9tZWRpYXRlay9waW5jdHJsLXBhcmlzLmMNCisrKyBiL2RyaXZlcnMvcGluY3RybC9t
ZWRpYXRlay9waW5jdHJsLXBhcmlzLmMNCkBAIC02NTcsNiArNjU3LDEwIEBAIHN0YXRpYyB2b2lk
IG10a19wY3RybF9kYmdfc2hvdyhzdHJ1Y3QgcGluY3RybF9kZXYgKnBjdGxkZXYsIHN0cnVjdCBz
ZXFfZmlsZSAqcywNCiANCiBzdGF0aWMgaW50IG10a19wbXhfZ2V0X2Z1bmNzX2NudChzdHJ1Y3Qg
cGluY3RybF9kZXYgKnBjdGxkZXYpDQogew0KKwlzdHJ1Y3QgbXRrX3BpbmN0cmwgKmh3ID0gcGlu
Y3RybF9kZXZfZ2V0X2RydmRhdGEocGN0bGRldik7DQorIA0KKwlpZiAoaHctPnNvYy0+bmZ1bmNz
KQ0KKwkJcmV0dXJuIChpbnQpaHctPnNvYy0+bmZ1bmNzOw0KIAlyZXR1cm4gQVJSQVlfU0laRSht
dGtfZ3Bpb19mdW5jdGlvbnMpOw0KIH0NCiANCi0tIA0KMS44LjEuMS5kaXJ0eQ0K

