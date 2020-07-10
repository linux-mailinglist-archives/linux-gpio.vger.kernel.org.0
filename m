Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BFED21B019
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2020 09:28:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726288AbgGJH2K (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 10 Jul 2020 03:28:10 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:2210 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725851AbgGJH2K (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 10 Jul 2020 03:28:10 -0400
X-UUID: 0e6bc4382b20431e90a4d40b6f04524c-20200710
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Kck5qu3yKPdlKefd7jPiCK9z60HEzMZy05drle8P5fI=;
        b=aJ95BNTeouiRE1P/SMVcsBcsMJC6B6+AFmJUTp30RqfkK7JZ0xoLiQZG8eqKAhH7WIjiq9Be23cEuGfImUtIFDQsEYkKgNqHN98FlnCZ8kQINK672JNH1Tw9OsHnIDG37DPkH/rAVSFrp8JNfUDbZ2YaVjqWejitRc+Uf+93xFI=;
X-UUID: 0e6bc4382b20431e90a4d40b6f04524c-20200710
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by mailgw02.mediatek.com
        (envelope-from <zhiyong.tao@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1017993438; Fri, 10 Jul 2020 15:28:05 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 10 Jul 2020 15:28:03 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 10 Jul 2020 15:28:02 +0800
From:   Zhiyong Tao <zhiyong.tao@mediatek.com>
To:     <robh+dt@kernel.org>, <linus.walleij@linaro.org>,
        <mark.rutland@arm.com>, <matthias.bgg@gmail.com>,
        <sean.wang@kernel.org>
CC:     <srv_heupstream@mediatek.com>, <zhiyong.tao@mediatek.com>,
        <hui.liu@mediatek.com>, <eddie.huang@mediatek.com>,
        <chuanjia.liu@mediatek.com>, <biao.huang@mediatek.com>,
        <hongzhou.yang@mediatek.com>, <erin.lo@mediatek.com>,
        <sean.wang@mediatek.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>
Subject: [PATCH 0/3] Mediatek pinctrl patch on mt8192 
Date:   Fri, 10 Jul 2020 15:27:14 +0800
Message-ID: <20200710072717.3056-1-zhiyong.tao@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: 3CB678FE8CE4C5D6230117BC5AACDE25C13BDDFBBE0F779C8812E6E4463C13942000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

VGhpcyBzZXJpZXMgaW5jbHVkZXMgMyBwYXRjaGVzOg0KMS5hZGQgcGluY3RybCBmaWxlIG9uIG10
ODE5Mi4NCjIuYWRkIHBpbmN0cmwgYmluZGluZyBkb2N1bWVudCBvbiBtdDgxOTIuDQozLmFkZCBw
aW5jdHJsIGRyaXZlciBvbiBNVDgxOTIuDQoNClpoaXlvbmcgVGFvICgzKToNCiAgZHQtYmluZGlu
Z3M6IHBpbmN0cmw6IG10ODE5MjogYWRkIHBpbmN0cmwgZmlsZQ0KICBkdC1iaW5kaW5nczogcGlu
Y3RybDogbXQ4MTkyOiBhZGQgYmluZGluZyBkb2N1bWVudA0KICBwaW5jdHJsOiBhZGQgcGluY3Ry
bCBkcml2ZXIgb24gbXQ4MTkyDQoNCiAuLi4vYmluZGluZ3MvcGluY3RybC9waW5jdHJsLW10ODE5
Mi55YW1sICAgICAgfCAgMTcwICsrDQogZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL0tjb25maWcg
ICAgICAgICAgICAgIHwgICAgNyArDQogZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL01ha2VmaWxl
ICAgICAgICAgICAgIHwgICAgMSArDQogZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL3BpbmN0cmwt
bXQ4MTkyLmMgICAgIHwgMTQ1MyArKysrKysrKysrKw0KIGRyaXZlcnMvcGluY3RybC9tZWRpYXRl
ay9waW5jdHJsLW10ay1tdDgxOTIuaCB8IDIyMjggKysrKysrKysrKysrKysrKysNCiBpbmNsdWRl
L2R0LWJpbmRpbmdzL3BpbmN0cmwvbXQ4MTkyLXBpbmZ1bmMuaCAgfCAxMzQ0ICsrKysrKysrKysN
CiA2IGZpbGVzIGNoYW5nZWQsIDUyMDMgaW5zZXJ0aW9ucygrKQ0KIGNyZWF0ZSBtb2RlIDEwMDY0
NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGluY3RybC9waW5jdHJsLW10ODE5
Mi55YW1sDQogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvcGluY3RybC9tZWRpYXRlay9waW5j
dHJsLW10ODE5Mi5jDQogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvcGluY3RybC9tZWRpYXRl
ay9waW5jdHJsLW10ay1tdDgxOTIuaA0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2R0LWJp
bmRpbmdzL3BpbmN0cmwvbXQ4MTkyLXBpbmZ1bmMuaA0KDQotLQ0KMi4yNS4xDQoNCg==

