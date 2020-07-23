Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED92F22AD8B
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Jul 2020 13:20:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728638AbgGWLUY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Jul 2020 07:20:24 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:24007 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728602AbgGWLUY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Jul 2020 07:20:24 -0400
X-UUID: 2bf3361baf4f4e6398c017c69039c58c-20200723
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=bItawRI4WETjkWbsEIQmhgb5ptmHRsFuKCwxFVOHsUs=;
        b=Rd+j3lAlkdDkLp20SinOHqVdyIv79jAuZi3tjVWWARyhNmpQnEVR3tZQXqU71YHmnDiYWySL5lEa+DbciPqDQhPnO9aJoY+3en/ZATlx6KlcSz5TF9akdDa1wJXif7tsdSlNauSbO44MlSk8MU+XELAI3Yg7eQ2NW9C5uDhtoCg=;
X-UUID: 2bf3361baf4f4e6398c017c69039c58c-20200723
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw01.mediatek.com
        (envelope-from <hanks.chen@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 179125836; Thu, 23 Jul 2020 19:20:08 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Jul 2020 19:19:59 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 23 Jul 2020 19:20:00 +0800
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
Subject: [PATCH v9 7/7] clk: mediatek: add UART0 clock support
Date:   Thu, 23 Jul 2020 19:19:57 +0800
Message-ID: <1595503197-15246-8-git-send-email-hanks.chen@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1595503197-15246-1-git-send-email-hanks.chen@mediatek.com>
References: <1595503197-15246-1-git-send-email-hanks.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

QWRkIE1UNjc3OSBVQVJUMCBjbG9jayBzdXBwb3J0Lg0KDQpGaXhlczogNzEwNzc0ZTA0ODYxICgi
Y2xrOiBtZWRpYXRlazogQWRkIE1UNjc3OSBjbG9jayBzdXBwb3J0IikNClNpZ25lZC1vZmYtYnk6
IFdlbmRlbGwgTGluIDx3ZW5kZWxsLmxpbkBtZWRpYXRlay5jb20+DQpTaWduZWQtb2ZmLWJ5OiBI
YW5rcyBDaGVuIDxoYW5rcy5jaGVuQG1lZGlhdGVrLmNvbT4NClJldmlld2VkLWJ5OiBNYXR0aGlh
cyBCcnVnZ2VyIDxtYXR0aGlhcy5iZ2dAZ21haWwuY29tPg0KLS0tDQogZHJpdmVycy9jbGsvbWVk
aWF0ZWsvY2xrLW10Njc3OS5jIHwgMiArKw0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KykNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xrL21lZGlhdGVrL2Nsay1tdDY3NzkuYyBiL2Ry
aXZlcnMvY2xrL21lZGlhdGVrL2Nsay1tdDY3NzkuYw0KaW5kZXggOTc2NmNjY2Y1ODQ0Li42ZTBk
M2ExNjY3MjkgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2Nsay9tZWRpYXRlay9jbGstbXQ2Nzc5LmMN
CisrKyBiL2RyaXZlcnMvY2xrL21lZGlhdGVrL2Nsay1tdDY3NzkuYw0KQEAgLTkxOSw2ICs5MTks
OCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG10a19nYXRlIGluZnJhX2Nsa3NbXSA9IHsNCiAJCSAg
ICAicHdtX3NlbCIsIDE5KSwNCiAJR0FURV9JTkZSQTAoQ0xLX0lORlJBX1BXTSwgImluZnJhX3B3
bSIsDQogCQkgICAgInB3bV9zZWwiLCAyMSksDQorCUdBVEVfSU5GUkEwKENMS19JTkZSQV9VQVJU
MCwgImluZnJhX3VhcnQwIiwNCisJCSAgICAidWFydF9zZWwiLCAyMiksDQogCUdBVEVfSU5GUkEw
KENMS19JTkZSQV9VQVJUMSwgImluZnJhX3VhcnQxIiwNCiAJCSAgICAidWFydF9zZWwiLCAyMyks
DQogCUdBVEVfSU5GUkEwKENMS19JTkZSQV9VQVJUMiwgImluZnJhX3VhcnQyIiwNCi0tIA0KMi4x
OC4wDQo=

