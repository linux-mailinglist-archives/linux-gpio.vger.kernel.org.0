Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19D831FF093
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2020 13:34:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729513AbgFRLeR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 18 Jun 2020 07:34:17 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:51063 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728048AbgFRLeJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 18 Jun 2020 07:34:09 -0400
X-UUID: a94d3c64965642309da38fbdceb20e6d-20200618
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=x+yhsVMil1EiA17Zrkn38qhTWyswuL0rzxglJr9tsjs=;
        b=PrQaosCsZeCJZl2fPa+JeyC6d+L5mMAI+dJfg1g2qPIOXYo19aR7rScmT0GG5UaajWPRcCh7vhIF1ESCY54En6kxpaMXNRzZ3c80uZi/i+ldha4abDDYTIJ0WzLxZuG9u8AWBSgLeDMD7IAciourQWaEV7N3kLG2dcxqeWVsjCY=;
X-UUID: a94d3c64965642309da38fbdceb20e6d-20200618
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw01.mediatek.com
        (envelope-from <hanks.chen@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 676282247; Thu, 18 Jun 2020 19:34:06 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 18 Jun 2020 19:34:01 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 18 Jun 2020 19:34:02 +0800
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
        <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <wsd_upstream@mediatek.com>, CC Hwang <cc.hwang@mediatek.com>,
        Loda Chou <loda.chou@mediatek.com>,
        Hanks Chen <hanks.chen@mediatek.com>
Subject: [PATCH v6 6/7] clk: mediatek: add UART0 clock support
Date:   Thu, 18 Jun 2020 19:33:37 +0800
Message-ID: <1592480018-3340-7-git-send-email-hanks.chen@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1592480018-3340-1-git-send-email-hanks.chen@mediatek.com>
References: <1592480018-3340-1-git-send-email-hanks.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: FB95E0EE193F82EDDAB6AE7DE289638071D94AEE1E98FE6F6EB8A722D1B67CE12000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

QWRkIE1UNjc3OSBVQVJUMCBjbG9jayBzdXBwb3J0Lg0KDQpTaWduZWQtb2ZmLWJ5OiBIYW5rcyBD
aGVuIDxoYW5rcy5jaGVuQG1lZGlhdGVrLmNvbT4NClNpZ25lZC1vZmYtYnk6IG10azAxNzYxIDx3
ZW5kZWxsLmxpbkBtZWRpYXRlay5jb20+DQotLS0NCiBkcml2ZXJzL2Nsay9tZWRpYXRlay9jbGst
bXQ2Nzc5LmMgfCAgICAyICsrDQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQ0KDQpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9jbGsvbWVkaWF0ZWsvY2xrLW10Njc3OS5jIGIvZHJpdmVycy9j
bGsvbWVkaWF0ZWsvY2xrLW10Njc3OS5jDQppbmRleCA5NzY2Y2NjLi42ZTBkM2ExIDEwMDY0NA0K
LS0tIGEvZHJpdmVycy9jbGsvbWVkaWF0ZWsvY2xrLW10Njc3OS5jDQorKysgYi9kcml2ZXJzL2Ns
ay9tZWRpYXRlay9jbGstbXQ2Nzc5LmMNCkBAIC05MTksNiArOTE5LDggQEANCiAJCSAgICAicHdt
X3NlbCIsIDE5KSwNCiAJR0FURV9JTkZSQTAoQ0xLX0lORlJBX1BXTSwgImluZnJhX3B3bSIsDQog
CQkgICAgInB3bV9zZWwiLCAyMSksDQorCUdBVEVfSU5GUkEwKENMS19JTkZSQV9VQVJUMCwgImlu
ZnJhX3VhcnQwIiwNCisJCSAgICAidWFydF9zZWwiLCAyMiksDQogCUdBVEVfSU5GUkEwKENMS19J
TkZSQV9VQVJUMSwgImluZnJhX3VhcnQxIiwNCiAJCSAgICAidWFydF9zZWwiLCAyMyksDQogCUdB
VEVfSU5GUkEwKENMS19JTkZSQV9VQVJUMiwgImluZnJhX3VhcnQyIiwNCi0tIA0KMS43LjkuNQ0K

