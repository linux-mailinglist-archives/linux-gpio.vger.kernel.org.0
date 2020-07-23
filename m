Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F5D522AD7E
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Jul 2020 13:20:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728506AbgGWLUH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Jul 2020 07:20:07 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:24007 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725846AbgGWLUH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Jul 2020 07:20:07 -0400
X-UUID: bfe8f31e29cc43578e8dd475510cf803-20200723
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=tV3sW+yzooZrTwqq74INKJCg3NXuaZoZaAi68qo1jlY=;
        b=HpZLUikKVKDtqKX7XNgLNybVWUFBEVj7Luvk9zyQDqmZCNsZx+ridF+zcaD9eA8FSROoyhlB0IwrHbzRcFcMVa/PANalHgCh3sKorybNXPXDhmVWMl8CoDoo8JLgW/h/Ok1i0IAi2xxBWjcrbRw71iBfLPNGowI0QgjI7HOo07k=;
X-UUID: bfe8f31e29cc43578e8dd475510cf803-20200723
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
        (envelope-from <hanks.chen@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 616192484; Thu, 23 Jul 2020 19:20:02 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Jul 2020 19:19:58 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 23 Jul 2020 19:19:58 +0800
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
Subject: [PATCH v9 0/7] Add basic SoC Support for Mediatek MT6779 SoC
Date:   Thu, 23 Jul 2020 19:19:50 +0800
Message-ID: <1595503197-15246-1-git-send-email-hanks.chen@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: 2A791F3F0692A7DBE5E718F5B2112D29A2EB4192CD2A0C165DBA8F8BF7F98E542000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Q2hhbmdlIHNpbmNlIHY5Og0KQ29tbWl0ICJkdC1iaW5kaW5nczogcGluY3RybDogYWRkIGJpbmRp
bmdzIGZvciBNZWRpYVRlayBNVDY3NzkgU29DIg0KLS0gcmVtb3ZlIGRyaXZpbmcgZGVzY2lwcnRp
b24gYW5kIHJldXNlIHRoZSBnZW5lcmljIHNjaGVtYXMuDQpDb21taXQgInBpbmN0cmw6IG1lZGlh
dGVrOiBhZGQgcGluY3RybCBzdXBwb3J0IGZvciBNVDY3NzkgU29DIg0KLS0gZml4IGJ1aWxkIGVy
cm9yIHRvIHN1cHBvcnQga28uDQotLSBmb2xsb3cgdGhlIEFQSXMgYXMgYmVsb3cuDQogICBodHRw
czovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51
eC5naXQvY29tbWl0L2RyaXZlcnMvcGluY3RybC9tZWRpYXRlaz9oPXY1LjgtcmM2JmlkPWNhZmUx
OWRiNzc1MTI2OWJmNmI0ZGQyMTQ4Y2JmYTlmYmU5MWQ2NTENCiAgIGh0dHBzOi8vZ2l0Lmtlcm5l
bC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC9jb21taXQv
ZHJpdmVycy9waW5jdHJsL21lZGlhdGVrP2g9djUuOC1yYzYmaWQ9NWY3NTVlMWYxZWZlNWNhM2I0
NzViMTQxNjllNmU4NWJmMTQxMWJiNQ0KQ29tbWl0ICJhcm02NDogZHRzOiBhZGQgZHRzIG5vZGVz
IGZvciBNVDY3NzkiDQotLSByZW1vdmUgdGhlIGNsayBpbnRlcmZhY2Ugb2YgVUFSVDMgaW4gYW5v
dGhlciBtYWlsIHRocmVhZC4NCiAgIGh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDIwLzcvMjEvMTQ0
NA0KDQoNCkNoYW5nZSBzaW5jZSB2ODoNCkNvbW1pdCAiZHQtYmluZGluZ3M6IHBpbmN0cmw6IGFk
ZCBiaW5kaW5ncyBmb3IgTWVkaWFUZWsiDQotLSB1cGRhdGUgdGhlIGZvcm1hdA0KQ29tbWl0ICJh
cm02NDogZHRzOiBhZGQgZHRzIG5vZGVzIGZvciBNVDY3NzkiDQotLSBmaXggdGhlIHR5cG8gaW4g
dWFydCBub2RlDQoNCg0KQ2hhbmdlIHNpbmNlIHY3Og0KQ29tbWl0ICJkdC1iaW5kaW5nczogcGlu
Y3RybDogYWRkIGJpbmRpbmdzIGZvciBNZWRpYVRlayINCi0tIGZpeCB0eXBvIGFuZCBjaGFuZ2Ug
b3JkZXIgb2YgcGF0Y2gNCkNvbW1pdCAiY2xrOiBtZWRpYXRlazogYWRkIFVBUlQwIGNsb2NrIHN1
cHBvcnQiDQotLSBhZGQgZml4ZXMgdGFnIGFuZCByZWFsIG5hbWUNCkNvbW1pdCAiYXJtNjQ6IGR0
czogYWRkIGR0cyBub2RlcyBmb3IgTVQ2Nzc5Ig0KLS0gZXhwb3NlIGFsbCB0aHJlZSBVQVJUcyBp
biB0aGUgZHRzaQ0KDQoNCkNoYW5nZSBzaW5jZSB2NjoNCkNvbW1pdCAiZHQtYmluZGluZ3M6IHBp
bmN0cmw6IGFkZCBiaW5kaW5ncyBmb3IgTWVkaWFUZWsiDQotLSBmaXggZm9ybWF0IG9mIGJpbmRp
bmdzIGFuZCBhZGQgaW50ZXJydXB0IGRlZmluaXRpb24uDQpDb21taXQgInBpbmN0cmw6IG1lZGlh
dGVrOiB1cGRhdGUgcGlubXV4IGRlZmluaXRpb25zIGZvciINCi0tIHVzZSB0aGUgc3RhbmRhcmQg
aW5jbHVkZSBwYXRoDQpDb21taXQgInBpbmN0cmw6IG1lZGlhdGVrOiBhdm9pZCB2aXJ0dWFsIGdw
aW8gdHJ5aW5nIHRvIHNldCINCi0tIHJlbW92ZSB1bm5lY2Vzc2FyeSBlcnJvciBoYW5kbGVyDQpD
b21taXQgInBpbmN0cmw6IG1lZGlhdGVrOiBhZGQgcGluY3RybCBzdXBwb3J0IGZvciBNVDY3Nzkg
U29DIg0KLS0gYWRkIHNvbWUgdXNlZnVsIGhlbHAgdGV4dCBpbiBrY29uZmlnDQpDb21taXQgImNs
azogbWVkaWF0ZWs6IGFkZCBVQVJUMCBjbG9jayBzdXBwb3J0Ig0KLS0gYWRkIFVBUlQwIGNsb2Nr
IHN1cHBvcnQNCkNvbW1pdCAiYXJtNjQ6IGR0czogYWRkIGR0cyBub2RlcyBmb3IgTVQ2Nzc5Ig0K
LS0gYWRkICJiYXVkIiBhbmQgImJ1cyIgY2xvY2tzIGZvciB1YXJ0DQotLSBhZGQgbmV3IGFwcHJv
YWNoIGZvciBtbXN5cw0KDQoNCkNoYW5nZSBzaW5jZSB2NToNCjEuIHJlbW92ZSB1bm5lY2Vzc2Fy
eSBzdHJpbmcgaW4gY29tbWl0IG1lc3NhZ2UNCg0KDQpDaGFuZ2Ugc2luY2UgdjQ6DQoxLiBmaXgg
Zm9ybWF0IG9mIHBpbmN0cmwgYmluZGluZ3MNCg0KDQpDaGFuZ2Ugc2luY2UgdjM6DQoxLiBhZGQg
YmluZGluZ3MgZm9yICJtZWRpYXRlayxtdDY3NzktcGluY3RybCINCjIuIGFkZCBzb21lIGNvbW1l
bnRzIGludG8gdGhlIGNvZGUgKGUuZy4gdmlydHVhbCBncGlvIC4uLikNCjMuIGFkZCBBY2tlZC1i
eSB0YWdzDQo0LiBhZGQgcG11IG5vZGUgaW50byBkdHMNCjUuIHN1cHBvcnQgcHBpIHBhcnRpdGlv
biBhbmQgZml4IGJhc2UgYWRkcmVzcyBpbiBnaWMgbm9kZSBvZiBkdHMNCg0KDQpDaGFuZ2Ugc2lu
Y2UgdjI6DQoxLiBhZGQgUmV2aWV3ZWQtYnkgdGFncw0KMi4gZml4IGNoZWNrcGF0Y2ggd2Fybmlu
Z3Mgd2l0aCBzdHJpY3QgbGV2ZWwNCg0KDQpDaGFuZ2Ugc2luY2UgdjE6DQpmaXJzdCBwYXRjaHNl
dA0KDQoNCkFuZHkgVGVuZyAoMSk6DQogIGR0LWJpbmRpbmdzOiBwaW5jdHJsOiBhZGQgYmluZGlu
Z3MgZm9yIE1lZGlhVGVrIE1UNjc3OSBTb0MNCg0KSGFua3MgQ2hlbiAoNik6DQogIHBpbmN0cmw6
IG1lZGlhdGVrOiB1cGRhdGUgcGlubXV4IGRlZmluaXRpb25zIGZvciBtdDY3NzkNCiAgcGluY3Ry
bDogbWVkaWF0ZWs6IGF2b2lkIHZpcnR1YWwgZ3BpbyB0cnlpbmcgdG8gc2V0IHJlZw0KICBwaW5j
dHJsOiBtZWRpYXRlazogYWRkIHBpbmN0cmwgc3VwcG9ydCBmb3IgTVQ2Nzc5IFNvQw0KICBwaW5j
dHJsOiBtZWRpYXRlazogYWRkIG10Njc3OSBlaW50IHN1cHBvcnQNCiAgYXJtNjQ6IGR0czogYWRk
IGR0cyBub2RlcyBmb3IgTVQ2Nzc5DQogIGNsazogbWVkaWF0ZWs6IGFkZCBVQVJUMCBjbG9jayBz
dXBwb3J0DQoNCiAuLi4vcGluY3RybC9tZWRpYXRlayxtdDY3NzktcGluY3RybC55YW1sICAgICAg
fCAgMTk3ICsrDQogYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9NYWtlZmlsZSAgICAgICAg
IHwgICAgMSArDQogYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDY3NzktZXZiLmR0cyAg
IHwgICAzMSArDQogYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDY3NzkuZHRzaSAgICAg
IHwgIDI3MSArKysNCiBkcml2ZXJzL2Nsay9tZWRpYXRlay9jbGstbXQ2Nzc5LmMgICAgICAgICAg
ICAgfCAgICAyICsNCiBkcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvS2NvbmZpZyAgICAgICAgICAg
ICAgfCAgIDEyICsNCiBkcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvTWFrZWZpbGUgICAgICAgICAg
ICAgfCAgICAxICsNCiBkcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvcGluY3RybC1tdDY3NzkuYyAg
ICAgfCAgNzg1ICsrKysrKysNCiAuLi4vcGluY3RybC9tZWRpYXRlay9waW5jdHJsLW10ay1jb21t
b24tdjIuYyAgfCAgIDI1ICsNCiAuLi4vcGluY3RybC9tZWRpYXRlay9waW5jdHJsLW10ay1jb21t
b24tdjIuaCAgfCAgICAxICsNCiBkcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvcGluY3RybC1tdGst
bXQ2Nzc5LmggfCAyMDg1ICsrKysrKysrKysrKysrKysrDQogZHJpdmVycy9waW5jdHJsL21lZGlh
dGVrL3BpbmN0cmwtcGFyaXMuYyAgICAgIHwgICAgNyArDQogaW5jbHVkZS9kdC1iaW5kaW5ncy9w
aW5jdHJsL210Njc3OS1waW5mdW5jLmggIHwgMTI0MiArKysrKysrKysrDQogMTMgZmlsZXMgY2hh
bmdlZCwgNDY2MCBpbnNlcnRpb25zKCspDQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9waW5jdHJsL21lZGlhdGVrLG10Njc3OS1waW5jdHJsLnlh
bWwNCiBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDY3
NzktZXZiLmR0cw0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlh
dGVrL210Njc3OS5kdHNpDQogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvcGluY3RybC9tZWRp
YXRlay9waW5jdHJsLW10Njc3OS5jDQogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvcGluY3Ry
bC9tZWRpYXRlay9waW5jdHJsLW10ay1tdDY3NzkuaA0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNs
dWRlL2R0LWJpbmRpbmdzL3BpbmN0cmwvbXQ2Nzc5LXBpbmZ1bmMuaA0KDQotLSANCjIuMTguMA0K

