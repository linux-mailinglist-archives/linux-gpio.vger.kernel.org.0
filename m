Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C7DA245A3A
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Aug 2020 02:18:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726597AbgHQASW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 16 Aug 2020 20:18:22 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:50947 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726165AbgHQASV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 16 Aug 2020 20:18:21 -0400
X-UUID: 01126bc963ff426d8b17113c6c33c77c-20200817
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=1S+vYeTE7vu8toawaEc6xhSra2zzhzuKWQJjR/BQbsg=;
        b=td2cgV+pOkmYb9/beDcFY+zTPmR7NsU/df4SnAUl6RmGZCP0fea54+vTeZvaZ5HXW6HtJQZlavbdPZLE245gqtQatSQL08M6X7qQivW1biboYakYg4QqYfGXW7Z17WxTJk0q0PsniQcpZSsp1iZf6eAYdgEMls9Mzpu+NUy3Jlo=;
X-UUID: 01126bc963ff426d8b17113c6c33c77c-20200817
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw01.mediatek.com
        (envelope-from <zhiyong.tao@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 138724; Mon, 17 Aug 2020 08:18:09 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 17 Aug 2020 08:18:08 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 17 Aug 2020 08:18:06 +0800
From:   Zhiyong Tao <zhiyong.tao@mediatek.com>
To:     <robh+dt@kernel.org>, <linus.walleij@linaro.org>,
        <mark.rutland@arm.com>, <matthias.bgg@gmail.com>,
        <sean.wang@kernel.org>
CC:     <srv_heupstream@mediatek.com>, <zhiyong.tao@mediatek.com>,
        <hui.liu@mediatek.com>, <eddie.huang@mediatek.com>,
        <chuanjia.liu@mediatek.com>, <biao.huang@mediatek.com>,
        <hongzhou.yang@mediatek.com>, <erin.lo@mediatek.com>,
        <sean.wang@mediatek.com>, <sj.huang@mediatek.com>,
        <seiya.wang@mediatek.com>, <jg_poxu@mediatek.com>,
        <sin_jieyang@mediatek.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>
Subject: [PATCH v4 0/3] Mediatek pinctrl patch on mt8192
Date:   Mon, 17 Aug 2020 08:16:59 +0800
Message-ID: <20200817001702.1646-1-zhiyong.tao@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

VGhpcyBzZXJpZXMgaW5jbHVkZXMgMyBwYXRjaGVzOg0KMS5hZGQgcGluY3RybCBmaWxlIG9uIG10
ODE5Mi4NCjIuYWRkIHBpbmN0cmwgYmluZGluZyBkb2N1bWVudCBvbiBtdDgxOTIuDQozLmFkZCBw
aW5jdHJsIGRyaXZlciBvbiBNVDgxOTIuDQoNCkNoYW5nZXMgaW4gcGF0Y2ggdjQ6DQoxKXJlbW92
ZSBleGVjdXRlIHBlcm1pc3Npb24gb2YgJ3BpbmN0cmwtbXQ4MTkyLnlhbWwnLg0KMiljaGFuZ2Ug
JyRyZWY6ICJwaW5tdXgtbm9kZS55YW1sIicgdW5kZXIgJ15waW5zJy4NCjMpYWRkIGEgcGluIG5v
ZGUgc2FtcGxlIGluICdleGFtcGxlcycuDQoNCkNoYW5nZXMgaW4gcGF0Y2ggdjM6DQoxKWZpeCBy
dW5uaW5nICdtYWtlIGR0X2JpbmRpbmdfY2hlY2snIGVycm9ycy4NCjIpY2hhbmdlICdub2RlJyB0
byAncGluY29udHJvbGxlcicuDQozKWFkZCBhbiBhY3R1YWwgZXhhbXBsZS4NCjQpY2hhbmdlIHJl
ZiBhcyAncGlubXV4LW5vZGUueWFtbCcuDQo1KXJlbW92ZSAnR0VORVJJQ19QSU5DT05GSUcnLg0K
NilhZGQgJ2FkZHRpb25hbFByb3BlcnRpZXM6IGZhbHNlJy4NCg0KQ2hhbmdlcyBpbiBwYXRjaCB2
MjoNCjEpY2hhbmdlIG1haW50YWluZXJzIG5hbWUgaW4gcGluY3RybC1tdDgxOTIueWFtbC4NCjIp
cmVtb3ZlIHVudXNlZCBkZXNjcmlwdGlvbiBmb3IgInJlZy1uYW1lcyIuDQozKWNoYW5nZSAnc3Vi
bm9kZSBmb3JtYXQ6JyB3aGljaCBpcyBub3QgYSBjaGlsZCBuYW1lIHRvICJecGlucyIuDQo0KWFk
ZCAoJ3wnKSBhZnRlciAiZGVzY3JpcHRpb246Ii4NCjUpcmVtb3ZlICJpMmMwX3BpbnNfYTogaTJj
MCIgYW5kICJpMmMwX3BpbnNfYTogaTJjMSIuDQo2KWFkZCBwcm9wZXJ0aWVzIGZvciBwaW4gY29u
ZmlndXJhdGlvbiBub2Rlcy4NCg0KWmhpeW9uZyBUYW8gKDMpOg0KICBkdC1iaW5kaW5nczogcGlu
Y3RybDogbXQ4MTkyOiBhZGQgcGluY3RybCBmaWxlDQogIGR0LWJpbmRpbmdzOiBwaW5jdHJsOiBt
dDgxOTI6IGFkZCBiaW5kaW5nIGRvY3VtZW50DQogIHBpbmN0cmw6IGFkZCBwaW5jdHJsIGRyaXZl
ciBvbiBtdDgxOTINCg0KIC4uLi9iaW5kaW5ncy9waW5jdHJsL3BpbmN0cmwtbXQ4MTkyLnlhbWwg
ICAgICB8ICAxNTUgKysNCiBkcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvS2NvbmZpZyAgICAgICAg
ICAgICAgfCAgICA3ICsNCiBkcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvTWFrZWZpbGUgICAgICAg
ICAgICAgfCAgICAxICsNCiBkcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvcGluY3RybC1tdDgxOTIu
YyAgICAgfCAxNDA5ICsrKysrKysrKysNCiBkcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvcGluY3Ry
bC1tdGstbXQ4MTkyLmggfCAyMjc1ICsrKysrKysrKysrKysrKysrDQogaW5jbHVkZS9kdC1iaW5k
aW5ncy9waW5jdHJsL210ODE5Mi1waW5mdW5jLmggIHwgMTM0NCArKysrKysrKysrDQogNiBmaWxl
cyBjaGFuZ2VkLCA1MTkxIGluc2VydGlvbnMoKykNCiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwvcGluY3RybC1tdDgxOTIueWFtbA0K
IGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvcGluY3RybC1tdDgx
OTIuYw0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvcGluY3Ry
bC1tdGstbXQ4MTkyLmgNCiBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9kdC1iaW5kaW5ncy9w
aW5jdHJsL210ODE5Mi1waW5mdW5jLmgNCg0KLS0NCjIuMjUuMQ0KDQo=

