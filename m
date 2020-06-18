Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EBFA1FF08E
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2020 13:34:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729503AbgFRLeK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 18 Jun 2020 07:34:10 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:27882 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726919AbgFRLeJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 18 Jun 2020 07:34:09 -0400
X-UUID: d56c247a03904728a842a33ed83a1a43-20200618
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=jOW7/ZlqTBzww6L1JbZKHV6k0YOMNioqgiPWE3AJk84=;
        b=am6+kJakZrPQ6WJaQBAbqTvL2lGRXXYnUwZhTmTlImtG9uIQ6Z1ZAuJwBWzKBWH1RD+3MBuq8Yi0Camj8iId4XFAgJunnI035/+2Un1FA1PlYeA+ptCyuiT+M0lNijDxaVNRdgdkTsLfVA5CWdcYKbugfF1jB8ig+c/whbxU25U=;
X-UUID: d56c247a03904728a842a33ed83a1a43-20200618
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
        (envelope-from <hanks.chen@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 48611443; Thu, 18 Jun 2020 19:34:04 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 18 Jun 2020 19:34:01 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 18 Jun 2020 19:34:01 +0800
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
        <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <wsd_upstream@mediatek.com>, CC Hwang <cc.hwang@mediatek.com>,
        Loda Chou <loda.chou@mediatek.com>
Subject: [PATCH v6] Add basic SoC Support for Mediatek MT6779 SoC
Date:   Thu, 18 Jun 2020 19:33:31 +0800
Message-ID: <1592480018-3340-1-git-send-email-hanks.chen@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

VGhpcyBwYXRjaCBhZGQgYmFzaWMgU29DIFN1cHBvcnQgZm9yIE1lZGlhdGVrIE1UNjc3OSBTb0MN
Cg0KQ2hhbmdlIHNpbmNlIHY2Og0KQ29tbWl0ICJkdC1iaW5kaW5nczogcGluY3RybDogYWRkIGJp
bmRpbmdzIGZvciBNZWRpYVRlayINCi0tIGZpeCBmb3JtYXQgb2YgYmluZGluZ3MgYW5kIGFkZCBp
bnRlcnJ1cHQgZGVmaW5pdGlvbi4NCkNvbW1pdCAicGluY3RybDogbWVkaWF0ZWs6IHVwZGF0ZSBw
aW5tdXggZGVmaW5pdGlvbnMgZm9yIg0KLS0gdXNlIHRoZSBzdGFuZGFyZCBpbmNsdWRlIHBhdGgN
CkNvbW1pdCAicGluY3RybDogbWVkaWF0ZWs6IGF2b2lkIHZpcnR1YWwgZ3BpbyB0cnlpbmcgdG8g
c2V0Ig0KLS0gcmVtb3ZlIHVubmVjZXNzYXJ5IGVycm9yIGhhbmRsZXINCkNvbW1pdCAicGluY3Ry
bDogbWVkaWF0ZWs6IGFkZCBwaW5jdHJsIHN1cHBvcnQgZm9yIE1UNjc3OSBTb0MiDQotLSBhZGQg
c29tZSB1c2VmdWwgaGVscCB0ZXh0IGluIGtjb25maWcNCkNvbW1pdCAiY2xrOiBtZWRpYXRlazog
YWRkIFVBUlQwIGNsb2NrIHN1cHBvcnQiDQotLSBhZGQgVUFSVDAgY2xvY2sgc3VwcG9ydA0KQ29t
bWl0ICJhcm02NDogZHRzOiBhZGQgZHRzIG5vZGVzIGZvciBNVDY3NzkiDQotLSBhZGQgImJhdWQi
IGFuZCAiYnVzIiBjbG9ja3MgZm9yIHVhcnQNCi0tIGFkZCBuZXcgYXBwcm9hY2ggZm9yIG1tc3lz
DQoNCg0KQ2hhbmdlIHNpbmNlIHY1Og0KMS4gcmVtb3ZlIHVubmVjZXNzYXJ5IHN0cmluZyBpbiBj
b21taXQgbWVzc2FnZQ0KDQoNCkNoYW5nZSBzaW5jZSB2NDoNCjEuIGZpeCBmb3JtYXQgb2YgcGlu
Y3RybCBiaW5kaW5ncw0KDQoNCkNoYW5nZSBzaW5jZSB2MzoNCjEuIGFkZCBiaW5kaW5ncyBmb3Ig
Im1lZGlhdGVrLG10Njc3OS1waW5jdHJsIg0KMi4gYWRkIHNvbWUgY29tbWVudHMgaW50byB0aGUg
Y29kZSAoZS5nLiB2aXJ0dWFsIGdwaW8gLi4uKQ0KMy4gYWRkIEFja2VkLWJ5IHRhZ3MNCjQuIGFk
ZCBwbXUgbm9kZSBpbnRvIGR0cw0KNS4gc3VwcG9ydCBwcGkgcGFydGl0aW9uIGFuZCBmaXggYmFz
ZSBhZGRyZXNzIGluIGdpYyBub2RlIG9mIGR0cw0KDQoNCkNoYW5nZSBzaW5jZSB2MjoNCjEuIGFk
ZCBSZXZpZXdlZC1ieSB0YWdzDQoyLiBmaXggY2hlY2twYXRjaCB3YXJuaW5ncyB3aXRoIHN0cmlj
dCBsZXZlbA0KDQoNCkNoYW5nZSBzaW5jZSB2MToNCmZpcnN0IHBhdGNoc2V0DQoNCg0KQW5keSBU
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
ICAgICAgICB8ICAyNjEgKysrDQogZHJpdmVycy9jbGsvbWVkaWF0ZWsvY2xrLW10Njc3OS5jICAg
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
YW5nZWQsIDQ2NjEgaW5zZXJ0aW9ucygrKQ==

