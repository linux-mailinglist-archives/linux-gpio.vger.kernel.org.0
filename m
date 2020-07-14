Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD81F21EC22
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2020 11:05:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726894AbgGNJEu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Jul 2020 05:04:50 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:57139 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726801AbgGNJEt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Jul 2020 05:04:49 -0400
X-UUID: 0eec8e902a7a4aaa9281468b903c5f0a-20200714
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=gg/UxrARz1LjEmbIn/dsLyHmNcLosv+d6Ng22kKepIs=;
        b=ZoP53Kci5eKwvUDN4BxhBNBw4kQ/iALBEdurBHkxQozBg8KZEsBbFScWIIbU99fWSo+pp1NyHqQex7HfPD68N1dsYg9j9YHcOP/Y6s4f+H9idWkPS4NlVmnYKX7uL9DgxNPrCfmGwCqmklF9l6TGdNNacs6wztRBXQCEn0Hb5Kc=;
X-UUID: 0eec8e902a7a4aaa9281468b903c5f0a-20200714
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw01.mediatek.com
        (envelope-from <hanks.chen@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1945067045; Tue, 14 Jul 2020 17:04:43 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 14 Jul 2020 17:04:40 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 14 Jul 2020 17:04:41 +0800
From:   Hanks Chen <hanks.chen@mediatek.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sean Wang <sean.wang@kernel.org>
CC:     mtk01761 <wendell.lin@mediatek.com>,
        Andy Teng <andy.teng@mediatek.com>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <wsd_upstream@mediatek.com>,
        CC Hwang <cc.hwang@mediatek.com>,
        Loda Chou <loda.chou@mediatek.com>,
        Hanks Chen <hanks.chen@mediatek.com>
Subject: [PATCH 0/7] Add basic SoC Support for Mediatek MT6779 SoC
Date:   Tue, 14 Jul 2020 17:04:32 +0800
Message-ID: <1594717479-8160-1-git-send-email-hanks.chen@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DQpDaGFuZ2Ugc2luY2Ugdjg6DQpDb21taXQgImR0LWJpbmRpbmdzOiBwaW5jdHJsOiBhZGQgYmlu
ZGluZ3MgZm9yIE1lZGlhVGVrIg0KLS0gdXBkYXRlIHRoZSBmb3JtYXQNCkNvbW1pdCAiYXJtNjQ6
IGR0czogYWRkIGR0cyBub2RlcyBmb3IgTVQ2Nzc5Ig0KLS0gZml4IHRoZSB0eXBvIGluIHVhcnQg
bm9kZQ0KDQoNCkNoYW5nZSBzaW5jZSB2NzoNCkNvbW1pdCAiZHQtYmluZGluZ3M6IHBpbmN0cmw6
IGFkZCBiaW5kaW5ncyBmb3IgTWVkaWFUZWsiDQotLSBmaXggdHlwbyBhbmQgY2hhbmdlIG9yZGVy
IG9mIHBhdGNoDQpDb21taXQgImNsazogbWVkaWF0ZWs6IGFkZCBVQVJUMCBjbG9jayBzdXBwb3J0
Ig0KLS0gYWRkIGZpeGVzIHRhZyBhbmQgcmVhbCBuYW1lDQpDb21taXQgImFybTY0OiBkdHM6IGFk
ZCBkdHMgbm9kZXMgZm9yIE1UNjc3OSINCi0tIGV4cG9zZSBhbGwgdGhyZWUgVUFSVHMgaW4gdGhl
IGR0c2kNCg0KDQpDaGFuZ2Ugc2luY2UgdjY6DQpDb21taXQgImR0LWJpbmRpbmdzOiBwaW5jdHJs
OiBhZGQgYmluZGluZ3MgZm9yIE1lZGlhVGVrIg0KLS0gZml4IGZvcm1hdCBvZiBiaW5kaW5ncyBh
bmQgYWRkIGludGVycnVwdCBkZWZpbml0aW9uLg0KQ29tbWl0ICJwaW5jdHJsOiBtZWRpYXRlazog
dXBkYXRlIHBpbm11eCBkZWZpbml0aW9ucyBmb3IiDQotLSB1c2UgdGhlIHN0YW5kYXJkIGluY2x1
ZGUgcGF0aA0KQ29tbWl0ICJwaW5jdHJsOiBtZWRpYXRlazogYXZvaWQgdmlydHVhbCBncGlvIHRy
eWluZyB0byBzZXQiDQotLSByZW1vdmUgdW5uZWNlc3NhcnkgZXJyb3IgaGFuZGxlcg0KQ29tbWl0
ICJwaW5jdHJsOiBtZWRpYXRlazogYWRkIHBpbmN0cmwgc3VwcG9ydCBmb3IgTVQ2Nzc5IFNvQyIN
Ci0tIGFkZCBzb21lIHVzZWZ1bCBoZWxwIHRleHQgaW4ga2NvbmZpZw0KQ29tbWl0ICJjbGs6IG1l
ZGlhdGVrOiBhZGQgVUFSVDAgY2xvY2sgc3VwcG9ydCINCi0tIGFkZCBVQVJUMCBjbG9jayBzdXBw
b3J0DQpDb21taXQgImFybTY0OiBkdHM6IGFkZCBkdHMgbm9kZXMgZm9yIE1UNjc3OSINCi0tIGFk
ZCAiYmF1ZCIgYW5kICJidXMiIGNsb2NrcyBmb3IgdWFydA0KLS0gYWRkIG5ldyBhcHByb2FjaCBm
b3IgbW1zeXMNCg0KDQpDaGFuZ2Ugc2luY2UgdjU6DQoxLiByZW1vdmUgdW5uZWNlc3Nhcnkgc3Ry
aW5nIGluIGNvbW1pdCBtZXNzYWdlDQoNCg0KQ2hhbmdlIHNpbmNlIHY0Og0KMS4gZml4IGZvcm1h
dCBvZiBwaW5jdHJsIGJpbmRpbmdzDQoNCg0KQ2hhbmdlIHNpbmNlIHYzOg0KMS4gYWRkIGJpbmRp
bmdzIGZvciAibWVkaWF0ZWssbXQ2Nzc5LXBpbmN0cmwiDQoyLiBhZGQgc29tZSBjb21tZW50cyBp
bnRvIHRoZSBjb2RlIChlLmcuIHZpcnR1YWwgZ3BpbyAuLi4pDQozLiBhZGQgQWNrZWQtYnkgdGFn
cw0KNC4gYWRkIHBtdSBub2RlIGludG8gZHRzDQo1LiBzdXBwb3J0IHBwaSBwYXJ0aXRpb24gYW5k
IGZpeCBiYXNlIGFkZHJlc3MgaW4gZ2ljIG5vZGUgb2YgZHRzDQoNCg0KQ2hhbmdlIHNpbmNlIHYy
Og0KMS4gYWRkIFJldmlld2VkLWJ5IHRhZ3MNCjIuIGZpeCBjaGVja3BhdGNoIHdhcm5pbmdzIHdp
dGggc3RyaWN0IGxldmVsDQoNCg0KQ2hhbmdlIHNpbmNlIHYxOg0KZmlyc3QgcGF0Y2hzZXQNCg0K
QW5keSBUZW5nICgxKToNCiAgZHQtYmluZGluZ3M6IHBpbmN0cmw6IGFkZCBiaW5kaW5ncyBmb3Ig
TWVkaWFUZWsgTVQ2Nzc5IFNvQw0KDQpIYW5rcyBDaGVuICg2KToNCiAgcGluY3RybDogbWVkaWF0
ZWs6IHVwZGF0ZSBwaW5tdXggZGVmaW5pdGlvbnMgZm9yIG10Njc3OQ0KICBwaW5jdHJsOiBtZWRp
YXRlazogYXZvaWQgdmlydHVhbCBncGlvIHRyeWluZyB0byBzZXQgcmVnDQogIHBpbmN0cmw6IG1l
ZGlhdGVrOiBhZGQgcGluY3RybCBzdXBwb3J0IGZvciBNVDY3NzkgU29DDQogIHBpbmN0cmw6IG1l
ZGlhdGVrOiBhZGQgbXQ2Nzc5IGVpbnQgc3VwcG9ydA0KICBhcm02NDogZHRzOiBhZGQgZHRzIG5v
ZGVzIGZvciBNVDY3NzkNCiAgY2xrOiBtZWRpYXRlazogYWRkIFVBUlQwIGNsb2NrIHN1cHBvcnQN
Cg0KIC4uLi9iaW5kaW5ncy9waW5jdHJsL21lZGlhdGVrLG10Njc3OS1waW5jdHJsLnlhbWwgIHwg
IDIwMyArKw0KIGFyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvTWFrZWZpbGUgICAgICAgICAg
ICAgIHwgICAgMSArDQogYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDY3NzktZXZiLmR0
cyAgICAgICAgfCAgIDMxICsNCiBhcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210Njc3OS5k
dHNpICAgICAgICAgICB8ICAyNzEgKysrDQogZHJpdmVycy9jbGsvbWVkaWF0ZWsvY2xrLW10Njc3
OS5jICAgICAgICAgICAgICAgICAgfCAgICAyICsNCiBkcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsv
S2NvbmZpZyAgICAgICAgICAgICAgICAgICB8ICAgMTIgKw0KIGRyaXZlcnMvcGluY3RybC9tZWRp
YXRlay9NYWtlZmlsZSAgICAgICAgICAgICAgICAgIHwgICAgMSArDQogZHJpdmVycy9waW5jdHJs
L21lZGlhdGVrL3BpbmN0cmwtbXQ2Nzc5LmMgICAgICAgICAgfCAgNzgzICsrKysrKysrDQogZHJp
dmVycy9waW5jdHJsL21lZGlhdGVrL3BpbmN0cmwtbXRrLWNvbW1vbi12Mi5jICAgfCAgIDI1ICsN
CiBkcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvcGluY3RybC1tdGstY29tbW9uLXYyLmggICB8ICAg
IDEgKw0KIGRyaXZlcnMvcGluY3RybC9tZWRpYXRlay9waW5jdHJsLW10ay1tdDY3NzkuaCAgICAg
IHwgMjA4NSArKysrKysrKysrKysrKysrKysrKw0KIGRyaXZlcnMvcGluY3RybC9tZWRpYXRlay9w
aW5jdHJsLXBhcmlzLmMgICAgICAgICAgIHwgICAgNyArDQogaW5jbHVkZS9kdC1iaW5kaW5ncy9w
aW5jdHJsL210Njc3OS1waW5mdW5jLmggICAgICAgfCAxMjQyICsrKysrKysrKysrKw0KIDEzIGZp
bGVzIGNoYW5nZWQsIDQ2NjQgaW5zZXJ0aW9ucygrKQ0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGluY3RybC9tZWRpYXRlayxtdDY3NzktcGlu
Y3RybC55YW1sDQogY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0
ZWsvbXQ2Nzc5LWV2Yi5kdHMNCiBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9hcm02NC9ib290L2R0
cy9tZWRpYXRlay9tdDY3NzkuZHRzaQ0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3BpbmN0
cmwvbWVkaWF0ZWsvcGluY3RybC1tdDY3NzkuYw0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJz
L3BpbmN0cmwvbWVkaWF0ZWsvcGluY3RybC1tdGstbXQ2Nzc5LmgNCiBjcmVhdGUgbW9kZSAxMDA2
NDQgaW5jbHVkZS9kdC1iaW5kaW5ncy9waW5jdHJsL210Njc3OS1waW5mdW5jLmgNCg0KLS0gDQox
LjcuOS41DQo=

