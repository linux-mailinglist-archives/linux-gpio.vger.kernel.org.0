Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C7D523E84D
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Aug 2020 09:50:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726382AbgHGHt4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 7 Aug 2020 03:49:56 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:7672 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726212AbgHGHt4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 7 Aug 2020 03:49:56 -0400
X-UUID: df0436bc88ff42e28b4051d03d8a78b4-20200807
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=yywh14HheHRN5nISdZsajtXKtu3fLmwV6Xvu2YjSk6E=;
        b=OKQ95xJdohYz9ZaBvKU29/Va33HmHprd7NS0am77anLOgqMnsuV+/oBoeHFvH95B7V74d8QJuV+VsQBKzBTc7HDLkt6DxMU308qbgK0DvL4QP+5AS44ipM0dvFaH3JjejqY6UfyC2A33ytACTfghRPRkGakbTIJan/UotuQedYo=;
X-UUID: df0436bc88ff42e28b4051d03d8a78b4-20200807
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw02.mediatek.com
        (envelope-from <zhiyong.tao@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1530630414; Fri, 07 Aug 2020 15:49:52 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 7 Aug 2020 15:49:49 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 7 Aug 2020 15:49:48 +0800
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
Subject: [PATCH v3 0/3] Mediatek pinctrl patch on mt8192 
Date:   Fri, 7 Aug 2020 15:49:02 +0800
Message-ID: <20200807074905.23468-1-zhiyong.tao@mediatek.com>
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
aW5jdHJsIGRyaXZlciBvbiBNVDgxOTIuDQoNCkNoYW5nZXMgaW4gcGF0Y2ggdjM6DQoxKWZpeCBy
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
ICAgICB8ICAxOTUgKysNCiBkcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvS2NvbmZpZyAgICAgICAg
ICAgICAgfCAgICA3ICsNCiBkcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvTWFrZWZpbGUgICAgICAg
ICAgICAgfCAgICAxICsNCiBkcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvcGluY3RybC1tdDgxOTIu
YyAgICAgfCAxNDA4ICsrKysrKysrKysNCiBkcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvcGluY3Ry
bC1tdGstbXQ4MTkyLmggfCAyMjc1ICsrKysrKysrKysrKysrKysrDQogaW5jbHVkZS9kdC1iaW5k
aW5ncy9waW5jdHJsL210ODE5Mi1waW5mdW5jLmggIHwgMTM0NCArKysrKysrKysrDQogNiBmaWxl
cyBjaGFuZ2VkLCA1MjMwIGluc2VydGlvbnMoKykNCiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwvcGluY3RybC1tdDgxOTIueWFtbA0K
IGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvcGluY3RybC1tdDgx
OTIuYw0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvcGluY3Ry
bC1tdGstbXQ4MTkyLmgNCiBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9kdC1iaW5kaW5ncy9w
aW5jdHJsL210ODE5Mi1waW5mdW5jLmgNCg0KLS0NCjIuMjUuMQ0KDQo=

