Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA6FC2123CF
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jul 2020 14:57:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729171AbgGBM5g (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 2 Jul 2020 08:57:36 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:25527 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729156AbgGBM5f (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 2 Jul 2020 08:57:35 -0400
X-UUID: d419ae8e9f8945ceb4ba8e4647896bd6-20200702
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=YB+9zxWr1SZn4+nmoPCVhMAb/vsVIK15B4knW0qFWYo=;
        b=LSSgzceNhM7dZiGo3GG0yPW5i0a0LFbKSpJyTFSsgdUUVzzXYVnutpd2yStJeyq7ifPzUnBdiACceEqoda6575QJOMo4ka/ccjOuoUEqDfg7BicNAt4Z2AJpGTpO8kXk9nV65f67A1nW7zeRarNBfDAb529j6+m+7+YFX1fTyzI=;
X-UUID: d419ae8e9f8945ceb4ba8e4647896bd6-20200702
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
        (envelope-from <hanks.chen@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 355899449; Thu, 02 Jul 2020 20:57:29 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
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
        Loda Chou <loda.chou@mediatek.com>,
        Hanks Chen <hanks.chen@mediatek.com>
Subject: [PATCH v7 0/7] Add basic SoC Support for Mediatek MT6779 SoC
Date:   Thu, 2 Jul 2020 20:57:03 +0800
Message-ID: <1593694630-26604-2-git-send-email-hanks.chen@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1593694630-26604-1-git-send-email-hanks.chen@mediatek.com>
References: <1593694630-26604-1-git-send-email-hanks.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: 8F35ED938E898B4723F13C044E06D7B8C50A1962E39CA73B5B597D54FEA7DA782000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

KioqIEJMVVJCIEhFUkUgKioqDQoNCkFuZHkgVGVuZyAoMSk6DQogIGR0LWJpbmRpbmdzOiBwaW5j
dHJsOiBhZGQgYmluZGluZ3MgZm9yIE1lZGlhVGVrIE1UNjc3OSBTb0MNCg0KSGFua3MgQ2hlbiAo
Nik6DQogIHBpbmN0cmw6IG1lZGlhdGVrOiB1cGRhdGUgcGlubXV4IGRlZmluaXRpb25zIGZvciBt
dDY3NzkNCiAgcGluY3RybDogbWVkaWF0ZWs6IGF2b2lkIHZpcnR1YWwgZ3BpbyB0cnlpbmcgdG8g
c2V0IHJlZw0KICBwaW5jdHJsOiBtZWRpYXRlazogYWRkIHBpbmN0cmwgc3VwcG9ydCBmb3IgTVQ2
Nzc5IFNvQw0KICBwaW5jdHJsOiBtZWRpYXRlazogYWRkIG10Njc3OSBlaW50IHN1cHBvcnQNCiAg
Y2xrOiBtZWRpYXRlazogYWRkIFVBUlQwIGNsb2NrIHN1cHBvcnQNCiAgYXJtNjQ6IGR0czogYWRk
IGR0cyBub2RlcyBmb3IgTVQ2Nzc5DQoNCiAuLi4vYmluZGluZ3MvcGluY3RybC9tZWRpYXRlayxt
dDY3NzktcGluY3RybC55YW1sICB8ICAyMTAgKysNCiBhcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlh
dGVrL01ha2VmaWxlICAgICAgICAgICAgICB8ICAgIDEgKw0KIGFyY2gvYXJtNjQvYm9vdC9kdHMv
bWVkaWF0ZWsvbXQ2Nzc5LWV2Yi5kdHMgICAgICAgIHwgICAzMSArDQogYXJjaC9hcm02NC9ib290
L2R0cy9tZWRpYXRlay9tdDY3NzkuZHRzaSAgICAgICAgICAgfCAgMjcxICsrKw0KIGRyaXZlcnMv
Y2xrL21lZGlhdGVrL2Nsay1tdDY3NzkuYyAgICAgICAgICAgICAgICAgIHwgICAgMiArDQogZHJp
dmVycy9waW5jdHJsL21lZGlhdGVrL0tjb25maWcgICAgICAgICAgICAgICAgICAgfCAgIDEyICsN
CiBkcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvTWFrZWZpbGUgICAgICAgICAgICAgICAgICB8ICAg
IDEgKw0KIGRyaXZlcnMvcGluY3RybC9tZWRpYXRlay9waW5jdHJsLW10Njc3OS5jICAgICAgICAg
IHwgIDc4MyArKysrKysrKw0KIGRyaXZlcnMvcGluY3RybC9tZWRpYXRlay9waW5jdHJsLW10ay1j
b21tb24tdjIuYyAgIHwgICAyNSArDQogZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL3BpbmN0cmwt
bXRrLWNvbW1vbi12Mi5oICAgfCAgICAxICsNCiBkcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvcGlu
Y3RybC1tdGstbXQ2Nzc5LmggICAgICB8IDIwODUgKysrKysrKysrKysrKysrKysrKysNCiBkcml2
ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvcGluY3RybC1wYXJpcy5jICAgICAgICAgICB8ICAgIDcgKw0K
IGluY2x1ZGUvZHQtYmluZGluZ3MvcGluY3RybC9tdDY3NzktcGluZnVuYy5oICAgICAgIHwgMTI0
MiArKysrKysrKysrKysNCiAxMyBmaWxlcyBjaGFuZ2VkLCA0NjcxIGluc2VydGlvbnMoKykNCiBj
cmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0
cmwvbWVkaWF0ZWssbXQ2Nzc5LXBpbmN0cmwueWFtbA0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNo
L2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210Njc3OS1ldmIuZHRzDQogY3JlYXRlIG1vZGUgMTAw
NjQ0IGFyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ2Nzc5LmR0c2kNCiBjcmVhdGUgbW9k
ZSAxMDA2NDQgZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL3BpbmN0cmwtbXQ2Nzc5LmMNCiBjcmVh
dGUgbW9kZSAxMDA2NDQgZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL3BpbmN0cmwtbXRrLW10Njc3
OS5oDQogY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvZHQtYmluZGluZ3MvcGluY3RybC9tdDY3
NzktcGluZnVuYy5oDQoNCi0tIA0KMS43LjkuNQ0K

