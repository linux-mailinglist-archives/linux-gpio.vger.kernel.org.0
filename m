Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C56691FF091
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2020 13:34:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729520AbgFRLeS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 18 Jun 2020 07:34:18 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:12679 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728384AbgFRLeK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 18 Jun 2020 07:34:10 -0400
X-UUID: e8324952f5f2477db85f4bb68b3382ee-20200618
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=B71l7gQY32AVSPj0Iz+n3QYxFS0Q7pqS5cd7ybjbLfI=;
        b=pHIIJTxF+ujBhphha1txOcO4GzJ8KtLNRU+9vtVMd0VNDgd7fwGuRfa9IxX8+yQmdcCghHVt4fxWByjTBoNV3ZV1OM8Fmr2xmRKVdO3iMqzMwgV5AaERlkrcuaF9gP8YZ8nH6HTAQQ2dB3FzcERFnxaY9ABOcqAhIIvm+0VgU7w=;
X-UUID: e8324952f5f2477db85f4bb68b3382ee-20200618
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw01.mediatek.com
        (envelope-from <hanks.chen@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 144068772; Thu, 18 Jun 2020 19:34:05 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 18 Jun 2020 19:34:02 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 18 Jun 2020 19:34:02 +0800
From:   Hanks Chen <hanks.chen@mediatek.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "Michael Turquette" <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "Sean Wang" <sean.wang@kernel.org>
CC:     mtk01761 <wendell.lin@mediatek.com>,
        Andy Teng <andy.teng@mediatek.com>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <wsd_upstream@mediatek.com>, CC Hwang <cc.hwang@mediatek.com>,
        Loda Chou <loda.chou@mediatek.com>,
        Hanks Chen <hanks.chen@mediatek.com>,
        Mars Cheng <mars.cheng@mediatek.com>
Subject: [PATCH v6 5/7] pinctrl: mediatek: add mt6779 eint support
Date:   Thu, 18 Jun 2020 19:33:36 +0800
Message-ID: <1592480018-3340-6-git-send-email-hanks.chen@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1592480018-3340-1-git-send-email-hanks.chen@mediatek.com>
References: <1592480018-3340-1-git-send-email-hanks.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: 8C82BBF0C2C048DF0D06905D2C1624E4734FF640109C428B357B14E8BF7619632000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

YWRkIGRyaXZlciBzZXR0aW5nIHRvIHN1cHBvcnQgbXQ2Nzc5IGVpbnQNCg0KQWNrZWQtYnk6IFNl
YW4gV2FuZyA8c2Vhbi53YW5nQGtlcm5lbC5vcmc+DQpTaWduZWQtb2ZmLWJ5OiBIYW5rcyBDaGVu
IDxoYW5rcy5jaGVuQG1lZGlhdGVrLmNvbT4NClNpZ25lZC1vZmYtYnk6IE1hcnMgQ2hlbmcgPG1h
cnMuY2hlbmdAbWVkaWF0ZWsuY29tPg0KLS0tDQogZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL3Bp
bmN0cmwtbXQ2Nzc5LmMgfCAgICA4ICsrKysrKysrDQogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0
aW9ucygrKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL3BpbmN0cmwt
bXQ2Nzc5LmMgYi9kcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvcGluY3RybC1tdDY3NzkuYw0KaW5k
ZXggMTQ1YmYyMi4uMzI4MjI2MCAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvcGluY3RybC9tZWRpYXRl
ay9waW5jdHJsLW10Njc3OS5jDQorKysgYi9kcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvcGluY3Ry
bC1tdDY3NzkuYw0KQEAgLTczMSwxMSArNzMxLDE5IEBADQogCSJpb2NmZ19ydCIsICJpb2NmZ19s
dCIsICJpb2NmZ190bCIsDQogfTsNCiANCitzdGF0aWMgY29uc3Qgc3RydWN0IG10a19laW50X2h3
IG10Njc3OV9laW50X2h3ID0gew0KKwkucG9ydF9tYXNrID0gNywNCisJLnBvcnRzICAgICA9IDYs
DQorCS5hcF9udW0gICAgPSAxOTUsDQorCS5kYl9jbnQgICAgPSAxMywNCit9Ow0KKw0KIHN0YXRp
YyBjb25zdCBzdHJ1Y3QgbXRrX3Bpbl9zb2MgbXQ2Nzc5X2RhdGEgPSB7DQogCS5yZWdfY2FsID0g
bXQ2Nzc5X3JlZ19jYWxzLA0KIAkucGlucyA9IG10a19waW5zX210Njc3OSwNCiAJLm5waW5zID0g
QVJSQVlfU0laRShtdGtfcGluc19tdDY3NzkpLA0KIAkubmdycHMgPSBBUlJBWV9TSVpFKG10a19w
aW5zX210Njc3OSksDQorCS5laW50X2h3ID0gJm10Njc3OV9laW50X2h3LA0KIAkuZ3Bpb19tID0g
MCwNCiAJLmllc19wcmVzZW50ID0gdHJ1ZSwNCiAJLmJhc2VfbmFtZXMgPSBtdDY3NzlfcGluY3Ry
bF9yZWdpc3Rlcl9iYXNlX25hbWVzLA0KLS0gDQoxLjcuOS41DQo=

