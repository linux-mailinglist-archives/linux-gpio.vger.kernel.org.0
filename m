Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 660E3233319
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Jul 2020 15:30:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729058AbgG3Nag (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Jul 2020 09:30:36 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:25906 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728124AbgG3Nae (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 30 Jul 2020 09:30:34 -0400
X-UUID: c8dae66ebcd645ba941e32ea58e8e169-20200730
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=TSeOd8gyodenG/vPhw7uxDULq97nWDx64WTQyTn+JuI=;
        b=udcNLhePQ2FL2Lo8aKNkjRlZvwMA0gfUw5QkbU2pCv1y2/8zhV9Rv43CXu/GQMNSHSys3MoLmFZ6WAoCg+cmx7gq1pZrC2ezO1NPtNxLMXHzD1TgCdyjb0x6ywA5eH+KoSkU/WHKTLNoFhHWDsNzS8H7xHYq/b7SRiOJyDDjwSE=;
X-UUID: c8dae66ebcd645ba941e32ea58e8e169-20200730
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
        (envelope-from <hanks.chen@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1812942239; Thu, 30 Jul 2020 21:30:26 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 30 Jul 2020 21:30:15 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 30 Jul 2020 21:30:15 +0800
From:   Hanks Chen <hanks.chen@mediatek.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
CC:     mtk01761 <wendell.lin@mediatek.com>,
        YueHaibing <yuehaibing@huawei.com>,
        Andy Teng <andy.teng@mediatek.com>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        CC Hwang <cc.hwang@mediatek.com>,
        Loda Chou <loda.chou@mediatek.com>,
        Hanks Chen <hanks.chen@mediatek.com>
Subject: [PATCH v10 0/3] Add basic SoC Support for Mediatek MT6779 SoC
Date:   Thu, 30 Jul 2020 21:30:13 +0800
Message-ID: <1596115816-11758-1-git-send-email-hanks.chen@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DQpDaGFuZ2Ugc2luY2UgdjEwOg0KQ29tbWl0ICJkdC1iaW5kaW5nczogcGluY3RybDogYWRkIGJp
bmRpbmdzIGZvciBNZWRpYVRlayBNVDY3NzkgU29DIg0KLS0gcmVtb3ZlIHRoZSBwYXRjaGVzIHdo
aWNoIHdlcmUgYXBwbGllZCB0byBsaW51eC1uZXh0DQpodHRwczovL2dpdC5rZXJuZWwub3JnL3B1
Yi9zY20vbGludXgva2VybmVsL2dpdC9uZXh0L2xpbnV4LW5leHQuZ2l0L2NvbW1pdC8/aWQ9YjA3
YjYxNjIxNDg1N2M5ZGIwMWUyODA3Y2RlMmY2YmJhODAxOWZjMw0KLS0gZm9sbG93IHRoZSBsYXRl
c3QgJ2R0LXNjaGVtYScgYW5kIGZpeCB0aGUgZHRzIHNhbXBsZQ0KDQoNCkNoYW5nZSBzaW5jZSB2
OToNCkNvbW1pdCAiZHQtYmluZGluZ3M6IHBpbmN0cmw6IGFkZCBiaW5kaW5ncyBmb3IgTWVkaWFU
ZWsgTVQ2Nzc5IFNvQyINCi0tIHJlbW92ZSBkcml2aW5nIGRlc2NpcHJ0aW9uIGFuZCByZXVzZSB0
aGUgZ2VuZXJpYyBzY2hlbWFzLg0KQ29tbWl0ICJwaW5jdHJsOiBtZWRpYXRlazogYWRkIHBpbmN0
cmwgc3VwcG9ydCBmb3IgTVQ2Nzc5IFNvQyINCi0tIGZpeCBidWlsZCBlcnJvciB0byBzdXBwb3J0
IGtvLg0KLS0gZm9sbG93IHRoZSBBUElzIGFzIGJlbG93Lg0KQ29tbWl0ICJhcm02NDogZHRzOiBh
ZGQgZHRzIG5vZGVzIGZvciBNVDY3NzkiDQotLSByZW1vdmUgdGhlIGNsayBpbnRlcmZhY2Ugb2Yg
VUFSVDMgaW4gYW5vdGhlciBtYWlsIHRocmVhZC4NCiAgIGh0dHBzOi8vbGttbC5vcmcvbGttbC8y
MDIwLzcvMjEvMTQ0NA0KDQoNCkNoYW5nZSBzaW5jZSB2ODoNCkNvbW1pdCAiZHQtYmluZGluZ3M6
IHBpbmN0cmw6IGFkZCBiaW5kaW5ncyBmb3IgTWVkaWFUZWsiDQotLSB1cGRhdGUgdGhlIGZvcm1h
dA0KQ29tbWl0ICJhcm02NDogZHRzOiBhZGQgZHRzIG5vZGVzIGZvciBNVDY3NzkiDQotLSBmaXgg
dGhlIHR5cG8gaW4gdWFydCBub2RlDQoNCg0KQ2hhbmdlIHNpbmNlIHY3Og0KQ29tbWl0ICJkdC1i
aW5kaW5nczogcGluY3RybDogYWRkIGJpbmRpbmdzIGZvciBNZWRpYVRlayINCi0tIGZpeCB0eXBv
IGFuZCBjaGFuZ2Ugb3JkZXIgb2YgcGF0Y2gNCkNvbW1pdCAiY2xrOiBtZWRpYXRlazogYWRkIFVB
UlQwIGNsb2NrIHN1cHBvcnQiDQotLSBhZGQgZml4ZXMgdGFnIGFuZCByZWFsIG5hbWUNCkNvbW1p
dCAiYXJtNjQ6IGR0czogYWRkIGR0cyBub2RlcyBmb3IgTVQ2Nzc5Ig0KLS0gZXhwb3NlIGFsbCB0
aHJlZSBVQVJUcyBpbiB0aGUgZHRzaQ0KDQoNCkNoYW5nZSBzaW5jZSB2NjoNCkNvbW1pdCAiZHQt
YmluZGluZ3M6IHBpbmN0cmw6IGFkZCBiaW5kaW5ncyBmb3IgTWVkaWFUZWsiDQotLSBmaXggZm9y
bWF0IG9mIGJpbmRpbmdzIGFuZCBhZGQgaW50ZXJydXB0IGRlZmluaXRpb24uDQpDb21taXQgInBp
bmN0cmw6IG1lZGlhdGVrOiB1cGRhdGUgcGlubXV4IGRlZmluaXRpb25zIGZvciINCi0tIHVzZSB0
aGUgc3RhbmRhcmQgaW5jbHVkZSBwYXRoDQpDb21taXQgInBpbmN0cmw6IG1lZGlhdGVrOiBhdm9p
ZCB2aXJ0dWFsIGdwaW8gdHJ5aW5nIHRvIHNldCINCi0tIHJlbW92ZSB1bm5lY2Vzc2FyeSBlcnJv
ciBoYW5kbGVyDQpDb21taXQgInBpbmN0cmw6IG1lZGlhdGVrOiBhZGQgcGluY3RybCBzdXBwb3J0
IGZvciBNVDY3NzkgU29DIg0KLS0gYWRkIHNvbWUgdXNlZnVsIGhlbHAgdGV4dCBpbiBrY29uZmln
DQpDb21taXQgImNsazogbWVkaWF0ZWs6IGFkZCBVQVJUMCBjbG9jayBzdXBwb3J0Ig0KLS0gYWRk
IFVBUlQwIGNsb2NrIHN1cHBvcnQNCkNvbW1pdCAiYXJtNjQ6IGR0czogYWRkIGR0cyBub2RlcyBm
b3IgTVQ2Nzc5Ig0KLS0gYWRkICJiYXVkIiBhbmQgImJ1cyIgY2xvY2tzIGZvciB1YXJ0DQotLSBh
ZGQgbmV3IGFwcHJvYWNoIGZvciBtbXN5cw0KDQoNCkNoYW5nZSBzaW5jZSB2NToNCjEuIHJlbW92
ZSB1bm5lY2Vzc2FyeSBzdHJpbmcgaW4gY29tbWl0IG1lc3NhZ2UNCg0KDQpDaGFuZ2Ugc2luY2Ug
djQ6DQoxLiBmaXggZm9ybWF0IG9mIHBpbmN0cmwgYmluZGluZ3MNCg0KDQpDaGFuZ2Ugc2luY2Ug
djM6DQoxLiBhZGQgYmluZGluZ3MgZm9yICJtZWRpYXRlayxtdDY3NzktcGluY3RybCINCjIuIGFk
ZCBzb21lIGNvbW1lbnRzIGludG8gdGhlIGNvZGUgKGUuZy4gdmlydHVhbCBncGlvIC4uLikNCjMu
IGFkZCBBY2tlZC1ieSB0YWdzDQo0LiBhZGQgcG11IG5vZGUgaW50byBkdHMNCjUuIHN1cHBvcnQg
cHBpIHBhcnRpdGlvbiBhbmQgZml4IGJhc2UgYWRkcmVzcyBpbiBnaWMgbm9kZSBvZiBkdHMNCg0K
DQpDaGFuZ2Ugc2luY2UgdjI6DQoxLiBhZGQgUmV2aWV3ZWQtYnkgdGFncw0KMi4gZml4IGNoZWNr
cGF0Y2ggd2FybmluZ3Mgd2l0aCBzdHJpY3QgbGV2ZWwNCg0KDQpDaGFuZ2Ugc2luY2UgdjE6DQpm
aXJzdCBwYXRjaHNldA0KDQoNCkFuZHkgVGVuZyAoMSk6DQogIGR0LWJpbmRpbmdzOiBwaW5jdHJs
OiBhZGQgYmluZGluZ3MgZm9yIE1lZGlhVGVrIE1UNjc3OSBTb0MNCg0KSGFua3MgQ2hlbiAoMik6
DQogIGFybTY0OiBkdHM6IGFkZCBkdHMgbm9kZXMgZm9yIE1UNjc3OQ0KICBjbGs6IG1lZGlhdGVr
OiBhZGQgVUFSVDAgY2xvY2sgc3VwcG9ydA0KDQogLi4uL3BpbmN0cmwvbWVkaWF0ZWssbXQ2Nzc5
LXBpbmN0cmwueWFtbCAgICAgIHwgMjAyICsrKysrKysrKysrKysNCiBhcmNoL2FybTY0L2Jvb3Qv
ZHRzL21lZGlhdGVrL01ha2VmaWxlICAgICAgICAgfCAgIDEgKw0KIGFyY2gvYXJtNjQvYm9vdC9k
dHMvbWVkaWF0ZWsvbXQ2Nzc5LWV2Yi5kdHMgICB8ICAzMSArKw0KIGFyY2gvYXJtNjQvYm9vdC9k
dHMvbWVkaWF0ZWsvbXQ2Nzc5LmR0c2kgICAgICB8IDI3MSArKysrKysrKysrKysrKysrKysNCiBk
cml2ZXJzL2Nsay9tZWRpYXRlay9jbGstbXQ2Nzc5LmMgICAgICAgICAgICAgfCAgIDIgKw0KIDUg
ZmlsZXMgY2hhbmdlZCwgNTA3IGluc2VydGlvbnMoKykNCiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwvbWVkaWF0ZWssbXQ2Nzc5LXBp
bmN0cmwueWFtbA0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlh
dGVrL210Njc3OS1ldmIuZHRzDQogY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJtNjQvYm9vdC9k
dHMvbWVkaWF0ZWsvbXQ2Nzc5LmR0c2kNCg0KLS0gDQoyLjE4LjANCg==

