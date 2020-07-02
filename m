Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FDDF2123F3
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jul 2020 14:58:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729160AbgGBM5f (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 2 Jul 2020 08:57:35 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:25527 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729138AbgGBM5e (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 2 Jul 2020 08:57:34 -0400
X-UUID: a6fb716cc0c04651bb1e9720c6a3a636-20200702
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=raRNsu9byZBHDzYCxjWLVEnVGhHYBvlatRQc7UZLxyk=;
        b=fy66L3N/6DTq4U43NK+Ji4tZaKWux739rJ1Dx3nry5hf9Ts4aX0C0+eVBfDHQUS5wRhKhxa8J24A2Ytntx80IJjSB4keR5dbg6yBl8tdq4SBKWZjkTSvVL20MNimrpE+TdTc9LqH41dsZHdCCKUQ8YltQ728DBlEdqOyf2TF4l4=;
X-UUID: a6fb716cc0c04651bb1e9720c6a3a636-20200702
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
        (envelope-from <hanks.chen@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1094941873; Thu, 02 Jul 2020 20:57:29 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 2 Jul 2020 20:57:24 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 2 Jul 2020 20:57:26 +0800
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
Subject: [PATCH v7 6/7] clk: mediatek: add UART0 clock support
Date:   Thu, 2 Jul 2020 20:57:09 +0800
Message-ID: <1593694630-26604-8-git-send-email-hanks.chen@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1593694630-26604-1-git-send-email-hanks.chen@mediatek.com>
References: <1593694630-26604-1-git-send-email-hanks.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: 5913775F9D7C5787756D71C66F43D079A3B204BE6CE65BC875C068193B96F5CF2000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

QWRkIE1UNjc3OSBVQVJUMCBjbG9jayBzdXBwb3J0Lg0KDQpGaXhlczogNzEwNzc0ZTA0ODYxICgi
Y2xrOiBtZWRpYXRlazogQWRkIE1UNjc3OSBjbG9jayBzdXBwb3J0IikNClNpZ25lZC1vZmYtYnk6
IFdlbmRlbGwgTGluIDx3ZW5kZWxsLmxpbkBtZWRpYXRlay5jb20+DQpTaWduZWQtb2ZmLWJ5OiBI
YW5rcyBDaGVuIDxoYW5rcy5jaGVuQG1lZGlhdGVrLmNvbT4NCi0tLQ0KIGRyaXZlcnMvY2xrL21l
ZGlhdGVrL2Nsay1tdDY3NzkuYyB8ICAgIDIgKysNCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsay9tZWRpYXRlay9jbGstbXQ2Nzc5LmMg
Yi9kcml2ZXJzL2Nsay9tZWRpYXRlay9jbGstbXQ2Nzc5LmMNCmluZGV4IDk3NjZjY2MuLjZlMGQz
YTEgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2Nsay9tZWRpYXRlay9jbGstbXQ2Nzc5LmMNCisrKyBi
L2RyaXZlcnMvY2xrL21lZGlhdGVrL2Nsay1tdDY3NzkuYw0KQEAgLTkxOSw2ICs5MTksOCBAQA0K
IAkJICAgICJwd21fc2VsIiwgMTkpLA0KIAlHQVRFX0lORlJBMChDTEtfSU5GUkFfUFdNLCAiaW5m
cmFfcHdtIiwNCiAJCSAgICAicHdtX3NlbCIsIDIxKSwNCisJR0FURV9JTkZSQTAoQ0xLX0lORlJB
X1VBUlQwLCAiaW5mcmFfdWFydDAiLA0KKwkJICAgICJ1YXJ0X3NlbCIsIDIyKSwNCiAJR0FURV9J
TkZSQTAoQ0xLX0lORlJBX1VBUlQxLCAiaW5mcmFfdWFydDEiLA0KIAkJICAgICJ1YXJ0X3NlbCIs
IDIzKSwNCiAJR0FURV9JTkZSQTAoQ0xLX0lORlJBX1VBUlQyLCAiaW5mcmFfdWFydDIiLA0KLS0g
DQoxLjcuOS41DQo=

