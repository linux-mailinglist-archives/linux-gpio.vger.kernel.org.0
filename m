Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DED06235063
	for <lists+linux-gpio@lfdr.de>; Sat,  1 Aug 2020 06:33:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725801AbgHAEdo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 1 Aug 2020 00:33:44 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:22047 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725601AbgHAEdo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 1 Aug 2020 00:33:44 -0400
X-UUID: 3ccb1420bc4d473cbce0582b0181a449-20200801
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=VSXHzuVe7TyPrG7V1dalxToyvgZ0VM2OicojizCUcAM=;
        b=bkvMTwgRrP94DoVh4i+wuu9QvGZCkPx5NrjE2GXcbY71+vAERFZTOuUz2wofZuc9D9cxg4wZPMBlfA0U9A9nEBPvNQKsnBJTx6CNmWgxF2cyuoFaAzlslghEpglP8uO+nShUl1bLrGFFRV9fO+yz8GxsHFcPdeZ/wGDRsnHXHvM=;
X-UUID: 3ccb1420bc4d473cbce0582b0181a449-20200801
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw01.mediatek.com
        (envelope-from <zhiyong.tao@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 548145483; Sat, 01 Aug 2020 12:33:39 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 1 Aug 2020 12:33:36 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 1 Aug 2020 12:33:36 +0800
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
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>
Subject: [PATCH v2 0/3] Mediatek pinctrl patch on mt8192 
Date:   Sat, 1 Aug 2020 12:33:00 +0800
Message-ID: <20200801043303.32149-1-zhiyong.tao@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: B470880E776B38862319ED4C7CBD9BC1D5990EA650C3814ADCD0175DDF9A736D2000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

VGhpcyBzZXJpZXMgaW5jbHVkZXMgMyBwYXRjaGVzOg0KMS5hZGQgcGluY3RybCBmaWxlIG9uIG10
ODE5Mi4NCjIuYWRkIHBpbmN0cmwgYmluZGluZyBkb2N1bWVudCBvbiBtdDgxOTIuDQozLmFkZCBw
aW5jdHJsIGRyaXZlciBvbiBNVDgxOTIuDQoNCkNoYW5nZXMgaW4gcGF0Y2ggdjI6DQoxKWNoYW5n
ZSBtYWludGFpbmVycyBuYW1lIGluIHBpbmN0cmwtbXQ4MTkyLnlhbWwuDQoyKXJlbW92ZSB1bnVz
ZWQgZGVzY3JpcHRpb24gZm9yICJyZWctbmFtZXMiLg0KMyljaGFuZ2UgJ3N1Ym5vZGUgZm9ybWF0
Oicgd2hpY2ggaXMgbm90IGEgY2hpbGQgbmFtZSB0byAiXnBpbnMiLg0KNClhZGQgKCd8JykgYWZ0
ZXIgImRlc2NyaXB0aW9uOiIuDQo1KXJlbW92ZSAiaTJjMF9waW5zX2E6IGkyYzAiIGFuZCAiaTJj
MF9waW5zX2E6IGkyYzEiLg0KNilhZGQgcHJvcGVydGllcyBmb3IgcGluIGNvbmZpZ3VyYXRpb24g
bm9kZXMuDQoNClpoaXlvbmcgVGFvICgzKToNCiAgZHQtYmluZGluZ3M6IHBpbmN0cmw6IG10ODE5
MjogYWRkIHBpbmN0cmwgZmlsZQ0KICBkdC1iaW5kaW5nczogcGluY3RybDogbXQ4MTkyOiBhZGQg
YmluZGluZyBkb2N1bWVudA0KICBwaW5jdHJsOiBhZGQgcGluY3RybCBkcml2ZXIgb24gbXQ4MTky
DQoNCiAuLi4vYmluZGluZ3MvcGluY3RybC9waW5jdHJsLW10ODE5Mi55YW1sICAgICAgfCAgMTUx
ICsrDQogZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL0tjb25maWcgICAgICAgICAgICAgIHwgICAg
NyArDQogZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL01ha2VmaWxlICAgICAgICAgICAgIHwgICAg
MSArDQogZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL3BpbmN0cmwtbXQ4MTkyLmMgICAgIHwgMTQ1
MyArKysrKysrKysrKw0KIGRyaXZlcnMvcGluY3RybC9tZWRpYXRlay9waW5jdHJsLW10ay1tdDgx
OTIuaCB8IDIyMjggKysrKysrKysrKysrKysrKysNCiBpbmNsdWRlL2R0LWJpbmRpbmdzL3BpbmN0
cmwvbXQ4MTkyLXBpbmZ1bmMuaCAgfCAxMzQ0ICsrKysrKysrKysNCiA2IGZpbGVzIGNoYW5nZWQs
IDUxODQgaW5zZXJ0aW9ucygrKQ0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvcGluY3RybC9waW5jdHJsLW10ODE5Mi55YW1sDQogY3JlYXRlIG1v
ZGUgMTAwNjQ0IGRyaXZlcnMvcGluY3RybC9tZWRpYXRlay9waW5jdHJsLW10ODE5Mi5jDQogY3Jl
YXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvcGluY3RybC9tZWRpYXRlay9waW5jdHJsLW10ay1tdDgx
OTIuaA0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2R0LWJpbmRpbmdzL3BpbmN0cmwvbXQ4
MTkyLXBpbmZ1bmMuaA0KDQotLQ0KMi4xOC4wDQoNCg==

