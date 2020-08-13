Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD4E224392E
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Aug 2020 13:14:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726694AbgHMLOb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 13 Aug 2020 07:14:31 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:2831 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726568AbgHMLO3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 13 Aug 2020 07:14:29 -0400
X-UUID: 5e35a78db22944ffbaf6613ebd1cd735-20200813
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=+eK+7a9oUt+gCi+OClb3sCo/w04UAPvGt6ggiOIBy5Y=;
        b=VnEuwXkh79pfUlcx6QEk2FIj88mSm5hdziv6mkeygQiB9bXlCyXME1pJMWX5Bqj7+lvioWeZoJTzQ4jV2u9qfnpBL21qZd6omRiraFQt9+UYUIRLnKRUkFIHlP3m1c8OBRltSC2z+R/A/tvSMfdEo8s7yFOBDC4IyLKBdbbs9XU=;
X-UUID: 5e35a78db22944ffbaf6613ebd1cd735-20200813
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by mailgw01.mediatek.com
        (envelope-from <hanks.chen@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1151618276; Thu, 13 Aug 2020 19:14:25 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 13 Aug 2020 19:14:22 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 13 Aug 2020 19:14:23 +0800
From:   Hanks Chen <hanks.chen@mediatek.com>
To:     Sean Wang <sean.wang@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
CC:     <linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, CC Hwang <cc.hwang@mediatek.com>,
        sin_jieyang <sin_jieyang@mediatek.com>,
        Hanks Chen <hanks.chen@mediatek.com>
Subject: [PATCH] pinctrl: mediatek: check mtk_is_virt_gpio input parameter
Date:   Thu, 13 Aug 2020 19:14:20 +0800
Message-ID: <1597317260-24348-1-git-send-email-hanks.chen@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Y2hlY2sgbXRrX2lzX3ZpcnRfZ3BpbyBpbnB1dCBwYXJhbWV0ZXIsDQp2aXJ0dWFsIGdwaW8gbmVl
ZCB0byBzdXBwb3J0IGVpbnQgbW9kZS4NCg0KYWRkIGVycm9yIGhhbmRsZXIgZm9yIHRoZSBrbyBj
YXNlDQp0byBmaXggdGhpcyBib290IGZhaWw6DQpwYyA6IG10a19pc192aXJ0X2dwaW8rMHgyMC8w
eDM4IFtwaW5jdHJsX210a19jb21tb25fdjJdDQpsciA6IG10a19ncGlvX2dldF9kaXJlY3Rpb24r
MHg0NC8weGIwIFtwaW5jdHJsX3BhcmlzXQ0KDQpGaXhlczogZWRkNTQ2NDY1MDAyICgicGluY3Ry
bDogbWVkaWF0ZWs6IGF2b2lkIHZpcnR1YWwgZ3BpbyB0cnlpbmcgdG8gc2V0IHJlZyIpDQpTaW5n
ZWQtb2ZmLWJ5OiBzaW5famlleWFuZyA8c2luX2ppZXlhbmdAbWVkaWF0ZWsuY29tPg0KU2lnbmVk
LW9mZi1ieTogSGFua3MgQ2hlbiA8aGFua3MuY2hlbkBtZWRpYXRlay5jb20+DQotLS0NCiBkcml2
ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvcGluY3RybC1tdGstY29tbW9uLXYyLmMgfCA0ICsrKysNCiAx
IGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL3Bp
bmN0cmwvbWVkaWF0ZWsvcGluY3RybC1tdGstY29tbW9uLXYyLmMgYi9kcml2ZXJzL3BpbmN0cmwv
bWVkaWF0ZWsvcGluY3RybC1tdGstY29tbW9uLXYyLmMNCmluZGV4IGM1M2UyYzM5MWUzMi4uMjdh
YjljNTEyYWUxIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL3BpbmN0cmwt
bXRrLWNvbW1vbi12Mi5jDQorKysgYi9kcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvcGluY3RybC1t
dGstY29tbW9uLXYyLmMNCkBAIC0yNTksNiArMjU5LDEwIEBAIGJvb2wgbXRrX2lzX3ZpcnRfZ3Bp
byhzdHJ1Y3QgbXRrX3BpbmN0cmwgKmh3LCB1bnNpZ25lZCBpbnQgZ3Bpb19uKQ0KIA0KIAlkZXNj
ID0gKGNvbnN0IHN0cnVjdCBtdGtfcGluX2Rlc2MgKikmaHctPnNvYy0+cGluc1tncGlvX25dOw0K
IA0KKwkvKiBpZiB0aGUgR1BJTyBpcyBub3Qgc3VwcG9ydGVkIGZvciBlaW50IG1vZGUgKi8NCisJ
aWYgKGRlc2MtPmVpbnQuZWludF9tID09IEVJTlRfTkEpDQorCQlyZXR1cm4gdmlydF9ncGlvOw0K
Kw0KIAlpZiAoZGVzYy0+ZnVuY3MgJiYgIWRlc2MtPmZ1bmNzW2Rlc2MtPmVpbnQuZWludF9tXS5u
YW1lKQ0KIAkJdmlydF9ncGlvID0gdHJ1ZTsNCiANCi0tIA0KMi4xOC4wDQo=

