Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32A7121EC8E
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2020 11:20:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726715AbgGNJUN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Jul 2020 05:20:13 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:50856 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726252AbgGNJUN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Jul 2020 05:20:13 -0400
X-UUID: 2395ce963e20419fa66fd91bea3fe785-20200714
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=pVHcUgsl7i22itF43NRR1WIUq3RppLuJkV8eA74tsH0=;
        b=WXXSvwISq5Bc4Unv7dd62vBr4ifmJEjq5v/1KvyZ2UPkzea8F9IP4MqEJ3qD9o9IN06nlhXYbaHi0ZVLLw82E+e8VLmz1iFcDx31UkgGacZxMH6utAOx6dFX5rKsoMd2hrX3biS92YUzVQPHM9a8y7+TSI0B56pycdNfl5bxB1Y=;
X-UUID: 2395ce963e20419fa66fd91bea3fe785-20200714
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
        (envelope-from <hanks.chen@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 482093953; Tue, 14 Jul 2020 17:20:11 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 14 Jul 2020 17:20:08 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 14 Jul 2020 17:20:08 +0800
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
        Hanks Chen <hanks.chen@mediatek.com>,
        Mars Cheng <mars.cheng@mediatek.com>
Subject: [PATCH v8 5/7] pinctrl: mediatek: add mt6779 eint support
Date:   Tue, 14 Jul 2020 17:20:00 +0800
Message-ID: <1594718402-20813-6-git-send-email-hanks.chen@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1594718402-20813-1-git-send-email-hanks.chen@mediatek.com>
References: <1594718402-20813-1-git-send-email-hanks.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

YWRkIGRyaXZlciBzZXR0aW5nIHRvIHN1cHBvcnQgbXQ2Nzc5IGVpbnQNCg0KQWNrZWQtYnk6IFNl
YW4gV2FuZyA8c2Vhbi53YW5nQGtlcm5lbC5vcmc+DQpTaWduZWQtb2ZmLWJ5OiBNYXJzIENoZW5n
IDxtYXJzLmNoZW5nQG1lZGlhdGVrLmNvbT4NClNpZ25lZC1vZmYtYnk6IEhhbmtzIENoZW4gPGhh
bmtzLmNoZW5AbWVkaWF0ZWsuY29tPg0KLS0tDQogZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL3Bp
bmN0cmwtbXQ2Nzc5LmMgfCA4ICsrKysrKysrDQogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9u
cygrKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL3BpbmN0cmwtbXQ2
Nzc5LmMgYi9kcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvcGluY3RybC1tdDY3NzkuYw0KaW5kZXgg
MTQ1YmYyMjk0Y2UxLi4zMjgyMjYwM2ExZGYgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL3BpbmN0cmwv
bWVkaWF0ZWsvcGluY3RybC1tdDY3NzkuYw0KKysrIGIvZHJpdmVycy9waW5jdHJsL21lZGlhdGVr
L3BpbmN0cmwtbXQ2Nzc5LmMNCkBAIC03MzEsMTEgKzczMSwxOSBAQCBzdGF0aWMgY29uc3QgY2hh
ciAqIGNvbnN0IG10Njc3OV9waW5jdHJsX3JlZ2lzdGVyX2Jhc2VfbmFtZXNbXSA9IHsNCiAJImlv
Y2ZnX3J0IiwgImlvY2ZnX2x0IiwgImlvY2ZnX3RsIiwNCiB9Ow0KIA0KK3N0YXRpYyBjb25zdCBz
dHJ1Y3QgbXRrX2VpbnRfaHcgbXQ2Nzc5X2VpbnRfaHcgPSB7DQorCS5wb3J0X21hc2sgPSA3LA0K
KwkucG9ydHMgICAgID0gNiwNCisJLmFwX251bSAgICA9IDE5NSwNCisJLmRiX2NudCAgICA9IDEz
LA0KK307DQorDQogc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfcGluX3NvYyBtdDY3NzlfZGF0YSA9
IHsNCiAJLnJlZ19jYWwgPSBtdDY3NzlfcmVnX2NhbHMsDQogCS5waW5zID0gbXRrX3BpbnNfbXQ2
Nzc5LA0KIAkubnBpbnMgPSBBUlJBWV9TSVpFKG10a19waW5zX210Njc3OSksDQogCS5uZ3JwcyA9
IEFSUkFZX1NJWkUobXRrX3BpbnNfbXQ2Nzc5KSwNCisJLmVpbnRfaHcgPSAmbXQ2Nzc5X2VpbnRf
aHcsDQogCS5ncGlvX20gPSAwLA0KIAkuaWVzX3ByZXNlbnQgPSB0cnVlLA0KIAkuYmFzZV9uYW1l
cyA9IG10Njc3OV9waW5jdHJsX3JlZ2lzdGVyX2Jhc2VfbmFtZXMsDQotLSANCjIuMTguMA0K

