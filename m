Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BD652480BF
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Aug 2020 10:36:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726341AbgHRIgW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Aug 2020 04:36:22 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:24052 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726145AbgHRIgV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Aug 2020 04:36:21 -0400
X-UUID: 56fe74ee8da5410e9e41e283d0d89019-20200818
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=yCWYxl8u4fmCuo9QoLsyo+ItSwrT/KvrNuPZDJcZcvE=;
        b=M+iK1nK5dCfreb7yQg13VIzB5qFYzftSe76jUIJXqdWuCL0Qpp4KkDoa8VigQfnCXpoDp65J+7JBMx1jkvLLIltkCEWqUnY+M4ck7UYJFDCXkBFcMS4G34nrhrerPdZvhTHiWGiAkCyjecw38LK6pgtmuUqFqb2pZrguufmtlmI=;
X-UUID: 56fe74ee8da5410e9e41e283d0d89019-20200818
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
        (envelope-from <light.hsieh@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 372831850; Tue, 18 Aug 2020 16:36:19 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 18 Aug 2020 16:36:16 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 18 Aug 2020 16:36:17 +0800
From:   <light.hsieh@mediatek.com>
To:     <linus.walleij@linaro.org>
CC:     <linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <sean.wang@kernel.org>,
        <kuohong.wang@mediatek.com>, Light Hsieh <light.hsieh@mediatek.com>
Subject: [PATCH v1 2/2] pinctrl: mediatek: make MediaTek MT6765 pinctrl driver support race-free register access
Date:   Tue, 18 Aug 2020 16:36:16 +0800
Message-ID: <1597739776-15944-2-git-send-email-light.hsieh@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1597739776-15944-1-git-send-email-light.hsieh@mediatek.com>
References: <1597739776-15944-1-git-send-email-light.hsieh@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

RnJvbTogTGlnaHQgSHNpZWggPGxpZ2h0LmhzaWVoQG1lZGlhdGVrLmNvbT4NCg0KVGhpcyBwYXRj
aCBtYWtlIE1lZGlhVGVrIE1UNjc2NSBwaW5jdHJsIGRyaXZlciBzdXBwb3J0IHJhY2UtZnJlZSBy
ZWdpc3RlciBhY2Nlc3MNCg0KU2lnbmVkLW9mZi1ieTogTGlnaHQgSHNpZWggPGxpZ2h0LmhzaWVo
QG1lZGlhdGVrLmNvbT4NCi0tLQ0KIGRyaXZlcnMvcGluY3RybC9tZWRpYXRlay9waW5jdHJsLW10
Njc2NS5jIHwgMiArKw0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykNCg0KZGlmZiAt
LWdpdCBhL2RyaXZlcnMvcGluY3RybC9tZWRpYXRlay9waW5jdHJsLW10Njc2NS5jIGIvZHJpdmVy
cy9waW5jdHJsL21lZGlhdGVrL3BpbmN0cmwtbXQ2NzY1LmMNCmluZGV4IDJjNTlkMzkuLmYzM2Mz
NzEgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvcGluY3RybC1tdDY3NjUu
Yw0KKysrIGIvZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL3BpbmN0cmwtbXQ2NzY1LmMNCkBAIC0x
MDcxLDYgKzEwNzEsOCBAQA0KIAkubmdycHMgPSBBUlJBWV9TSVpFKG10a19waW5zX210Njc2NSks
DQogCS5laW50X2h3ID0gJm10Njc2NV9laW50X2h3LA0KIAkuZ3Bpb19tID0gMCwNCisJLnJhY2Vf
ZnJlZV9hY2Nlc3MgPSB0cnVlLA0KKwkubXdyX2ZpZWxkX3dpZHRoID0gNCwNCiAJLmJhc2VfbmFt
ZXMgPSBtdDY3NjVfcGluY3RybF9yZWdpc3Rlcl9iYXNlX25hbWVzLA0KIAkubmJhc2VfbmFtZXMg
PSBBUlJBWV9TSVpFKG10Njc2NV9waW5jdHJsX3JlZ2lzdGVyX2Jhc2VfbmFtZXMpLA0KIAkuYmlh
c19zZXRfY29tYm8gPSBtdGtfcGluY29uZl9iaWFzX3NldF9jb21ibywNCi0tIA0KMS44LjEuMS5k
aXJ0eQ0K

