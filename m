Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E52082123CD
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jul 2020 14:57:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729145AbgGBM5e (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 2 Jul 2020 08:57:34 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:12151 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728808AbgGBM5d (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 2 Jul 2020 08:57:33 -0400
X-UUID: 79e9559f200e403d84a9f2ffb42512cd-20200702
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=/zH3iq1bV2xvDMi7F1wC6Ch4ase0kq8bBV/+bzoKaoU=;
        b=fCv/6lGQepTqEQAkWFPo9SwjyIKwMlRsqNb3xWDJ+J61e+XgfZG5D8sdyBEJOqOl6VBCh+I8suq6FSMOsahJ2uYmAdY/5Q1dBD8geeOKBTk9dy6TITH684/hU20CVfYEEs72Q4nPtHfbDnMEvTFPpstXNkc8vidG6ht5ouj9MZ0=;
X-UUID: 79e9559f200e403d84a9f2ffb42512cd-20200702
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw02.mediatek.com
        (envelope-from <hanks.chen@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 830739910; Thu, 02 Jul 2020 20:57:29 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 2 Jul 2020 20:57:23 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 2 Jul 2020 20:57:24 +0800
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
        Loda Chou <loda.chou@mediatek.com>
Subject: [PATCH v7] Add basic SoC Support for Mediatek MT6779 SoC
Date:   Thu, 2 Jul 2020 20:57:02 +0800
Message-ID: <1593694630-26604-1-git-send-email-hanks.chen@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: 26FFF916AD9C35D5FEFA6F99E4FAC199B2141851A2C141B5EF3E6F3ADA52476E2000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Q2hhbmdlIHNpbmNlIHY3Og0KQ29tbWl0ICJkdC1iaW5kaW5nczogcGluY3RybDogYWRkIGJpbmRp
bmdzIGZvciBNZWRpYVRlayINCi0tIGZpeCB0eXBvIGFuZCBjaGFuZ2Ugb3JkZXIgb2YgcGF0Y2gN
CkNvbW1pdCAiY2xrOiBtZWRpYXRlazogYWRkIFVBUlQwIGNsb2NrIHN1cHBvcnQiDQotLSBhZGQg
Zml4ZXMgdGFnIGFuZCByZWFsIG5hbWUNCkNvbW1pdCAiYXJtNjQ6IGR0czogYWRkIGR0cyBub2Rl
cyBmb3IgTVQ2Nzc5Ig0KLS0gZXhwb3NlIGFsbCB0aHJlZSBVQVJUcyBpbiB0aGUgZHRzaQ0KDQoN
CkNoYW5nZSBzaW5jZSB2NjoNCkNvbW1pdCAiZHQtYmluZGluZ3M6IHBpbmN0cmw6IGFkZCBiaW5k
aW5ncyBmb3IgTWVkaWFUZWsiDQotLSBmaXggZm9ybWF0IG9mIGJpbmRpbmdzIGFuZCBhZGQgaW50
ZXJydXB0IGRlZmluaXRpb24uDQpDb21taXQgInBpbmN0cmw6IG1lZGlhdGVrOiB1cGRhdGUgcGlu
bXV4IGRlZmluaXRpb25zIGZvciINCi0tIHVzZSB0aGUgc3RhbmRhcmQgaW5jbHVkZSBwYXRoDQpD
b21taXQgInBpbmN0cmw6IG1lZGlhdGVrOiBhdm9pZCB2aXJ0dWFsIGdwaW8gdHJ5aW5nIHRvIHNl
dCINCi0tIHJlbW92ZSB1bm5lY2Vzc2FyeSBlcnJvciBoYW5kbGVyDQpDb21taXQgInBpbmN0cmw6
IG1lZGlhdGVrOiBhZGQgcGluY3RybCBzdXBwb3J0IGZvciBNVDY3NzkgU29DIg0KLS0gYWRkIHNv
bWUgdXNlZnVsIGhlbHAgdGV4dCBpbiBrY29uZmlnDQpDb21taXQgImNsazogbWVkaWF0ZWs6IGFk
ZCBVQVJUMCBjbG9jayBzdXBwb3J0Ig0KLS0gYWRkIFVBUlQwIGNsb2NrIHN1cHBvcnQNCkNvbW1p
dCAiYXJtNjQ6IGR0czogYWRkIGR0cyBub2RlcyBmb3IgTVQ2Nzc5Ig0KLS0gYWRkICJiYXVkIiBh
bmQgImJ1cyIgY2xvY2tzIGZvciB1YXJ0DQotLSBhZGQgbmV3IGFwcHJvYWNoIGZvciBtbXN5cw0K
DQoNCkNoYW5nZSBzaW5jZSB2NToNCjEuIHJlbW92ZSB1bm5lY2Vzc2FyeSBzdHJpbmcgaW4gY29t
bWl0IG1lc3NhZ2UNCg0KDQpDaGFuZ2Ugc2luY2UgdjQ6DQoxLiBmaXggZm9ybWF0IG9mIHBpbmN0
cmwgYmluZGluZ3MNCg0KDQpDaGFuZ2Ugc2luY2UgdjM6DQoxLiBhZGQgYmluZGluZ3MgZm9yICJt
ZWRpYXRlayxtdDY3NzktcGluY3RybCINCjIuIGFkZCBzb21lIGNvbW1lbnRzIGludG8gdGhlIGNv
ZGUgKGUuZy4gdmlydHVhbCBncGlvIC4uLikNCjMuIGFkZCBBY2tlZC1ieSB0YWdzDQo0LiBhZGQg
cG11IG5vZGUgaW50byBkdHMNCjUuIHN1cHBvcnQgcHBpIHBhcnRpdGlvbiBhbmQgZml4IGJhc2Ug
YWRkcmVzcyBpbiBnaWMgbm9kZSBvZiBkdHMNCg0KDQpDaGFuZ2Ugc2luY2UgdjI6DQoxLiBhZGQg
UmV2aWV3ZWQtYnkgdGFncw0KMi4gZml4IGNoZWNrcGF0Y2ggd2FybmluZ3Mgd2l0aCBzdHJpY3Qg
bGV2ZWwNCg0KDQpDaGFuZ2Ugc2luY2UgdjE6DQpmaXJzdCBwYXRjaHNldA0KDQoNCg0KQW5keSBU
ZW5nICgxKToNCiAgZHQtYmluZGluZ3M6IHBpbmN0cmw6IGFkZCBiaW5kaW5ncyBmb3IgTWVkaWFU
ZWsgTVQ2Nzc5IFNvQw0KDQpIYW5rcyBDaGVuICg2KToNCiAgcGluY3RybDogbWVkaWF0ZWs6IHVw
ZGF0ZSBwaW5tdXggZGVmaW5pdGlvbnMgZm9yIG10Njc3OQ0KICBwaW5jdHJsOiBtZWRpYXRlazog
YXZvaWQgdmlydHVhbCBncGlvIHRyeWluZyB0byBzZXQgcmVnDQogIHBpbmN0cmw6IG1lZGlhdGVr
OiBhZGQgcGluY3RybCBzdXBwb3J0IGZvciBNVDY3NzkgU29DDQogIHBpbmN0cmw6IG1lZGlhdGVr
OiBhZGQgbXQ2Nzc5IGVpbnQgc3VwcG9ydA0KICBjbGs6IG1lZGlhdGVrOiBhZGQgVUFSVDAgY2xv
Y2sgc3VwcG9ydA0KICBhcm02NDogZHRzOiBhZGQgZHRzIG5vZGVzIGZvciBNVDY3NzkNCg0KIC4u
Li9iaW5kaW5ncy9waW5jdHJsL21lZGlhdGVrLG10Njc3OS1waW5jdHJsLnlhbWwgIHwgIDIxMCAr
Kw0KIGFyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvTWFrZWZpbGUgICAgICAgICAgICAgIHwg
ICAgMSArDQogYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDY3NzktZXZiLmR0cyAgICAg
ICAgfCAgIDMxICsNCiBhcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210Njc3OS5kdHNpICAg
ICAgICAgICB8ICAyNzEgKysrDQogZHJpdmVycy9jbGsvbWVkaWF0ZWsvY2xrLW10Njc3OS5jICAg
ICAgICAgICAgICAgICAgfCAgICAyICsNCiBkcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvS2NvbmZp
ZyAgICAgICAgICAgICAgICAgICB8ICAgMTIgKw0KIGRyaXZlcnMvcGluY3RybC9tZWRpYXRlay9N
YWtlZmlsZSAgICAgICAgICAgICAgICAgIHwgICAgMSArDQogZHJpdmVycy9waW5jdHJsL21lZGlh
dGVrL3BpbmN0cmwtbXQ2Nzc5LmMgICAgICAgICAgfCAgNzgzICsrKysrKysrDQogZHJpdmVycy9w
aW5jdHJsL21lZGlhdGVrL3BpbmN0cmwtbXRrLWNvbW1vbi12Mi5jICAgfCAgIDI1ICsNCiBkcml2
ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvcGluY3RybC1tdGstY29tbW9uLXYyLmggICB8ICAgIDEgKw0K
IGRyaXZlcnMvcGluY3RybC9tZWRpYXRlay9waW5jdHJsLW10ay1tdDY3NzkuaCAgICAgIHwgMjA4
NSArKysrKysrKysrKysrKysrKysrKw0KIGRyaXZlcnMvcGluY3RybC9tZWRpYXRlay9waW5jdHJs
LXBhcmlzLmMgICAgICAgICAgIHwgICAgNyArDQogaW5jbHVkZS9kdC1iaW5kaW5ncy9waW5jdHJs
L210Njc3OS1waW5mdW5jLmggICAgICAgfCAxMjQyICsrKysrKysrKysrKw0KIDEzIGZpbGVzIGNo
YW5nZWQsIDQ2NzEgaW5zZXJ0aW9ucygrKQ0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGluY3RybC9tZWRpYXRlayxtdDY3NzktcGluY3RybC55
YW1sDQogY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ2
Nzc5LWV2Yi5kdHMNCiBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9hcm02NC9ib290L2R0cy9tZWRp
YXRlay9tdDY3NzkuZHRzaQ0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3BpbmN0cmwvbWVk
aWF0ZWsvcGluY3RybC1tdDY3NzkuYw0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3BpbmN0
cmwvbWVkaWF0ZWsvcGluY3RybC1tdGstbXQ2Nzc5LmgNCiBjcmVhdGUgbW9kZSAxMDA2NDQgaW5j
bHVkZS9kdC1iaW5kaW5ncy9waW5jdHJsL210Njc3OS1waW5mdW5jLmg=

