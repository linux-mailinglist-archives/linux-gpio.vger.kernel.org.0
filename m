Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D5521A0C00
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Apr 2020 12:35:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726399AbgDGKeI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Apr 2020 06:34:08 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:55774 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725883AbgDGKeI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Apr 2020 06:34:08 -0400
X-UUID: 2233c811ea4e409d8c69df4e9c5cd9c5-20200407
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=U7bhIT1JvAQHWLnbsB2M7H1M+ae2V6iijCaIfBoNAEI=;
        b=VPZpQME+GTmR+o8NmnOaoeoannp+cAsN1CWIFe43j0oBMGM8H17PaMutDRSstli8iDH8WyjzI2hy+GjwXvV0DB3QPJcOTO5NtYHgmvqmYR1IrNkGKeEufxzWRNKOrIst1SWNU6b1MC40onhnMNiLfzPIacsnAkiS/P4o7lHSSbI=;
X-UUID: 2233c811ea4e409d8c69df4e9c5cd9c5-20200407
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
        (envelope-from <light.hsieh@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1444174613; Tue, 07 Apr 2020 18:34:03 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 7 Apr 2020 18:33:55 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 7 Apr 2020 18:33:54 +0800
From:   <light.hsieh@mediatek.com>
To:     <linus.walleij@linaro.org>
CC:     <linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <sean.wang@kernel.org>,
        <kuohong.wang@mediatek.com>, Light Hsieh <light.hsieh@mediatek.com>
Subject: [PATCH v1 1/1] pinctrl: mediatek: remove shadow variable declaration
Date:   Tue, 7 Apr 2020 18:33:52 +0800
Message-ID: <1586255632-27528-1-git-send-email-light.hsieh@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: CF188DB9EF1EEE1AE35E194814B165E19A38ABD073617FEDCC722BBA2F3A0F3A2000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

RnJvbTogTGlnaHQgSHNpZWggPGxpZ2h0LmhzaWVoQG1lZGlhdGVrLmNvbT4NCg0KUmVtb3ZlIHNo
YWRvdyBkZWNsYXJhdGlvbiBvZiB2YXJpYWJsZSAncHVsbHVwJyBpbiBtdGtfcGluY29uZl9nZXQo
KQ0KDQpTaWduZWQtb2ZmLWJ5OiBMaWdodCBIc2llaCA8bGlnaHQuaHNpZWhAbWVkaWF0ZWsuY29t
Pg0KLS0tDQogZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL3BpbmN0cmwtcGFyaXMuYyB8IDIgLS0N
CiAxIGZpbGUgY2hhbmdlZCwgMiBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMv
cGluY3RybC9tZWRpYXRlay9waW5jdHJsLXBhcmlzLmMgYi9kcml2ZXJzL3BpbmN0cmwvbWVkaWF0
ZWsvcGluY3RybC1wYXJpcy5jDQppbmRleCA4M2JmMjljLi44Zjc1MTE1IDEwMDY0NA0KLS0tIGEv
ZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL3BpbmN0cmwtcGFyaXMuYw0KKysrIGIvZHJpdmVycy9w
aW5jdHJsL21lZGlhdGVrL3BpbmN0cmwtcGFyaXMuYw0KQEAgLTE2NCw4ICsxNjQsNiBAQCBzdGF0
aWMgaW50IG10a19waW5jb25mX2dldChzdHJ1Y3QgcGluY3RybF9kZXYgKnBjdGxkZXYsDQogCWNh
c2UgTVRLX1BJTl9DT05GSUdfUFVfQURWOg0KIAljYXNlIE1US19QSU5fQ09ORklHX1BEX0FEVjoN
CiAJCWlmIChody0+c29jLT5hZHZfcHVsbF9nZXQpIHsNCi0JCQlib29sIHB1bGx1cDsNCi0NCiAJ
CQlwdWxsdXAgPSBwYXJhbSA9PSBNVEtfUElOX0NPTkZJR19QVV9BRFY7DQogCQkJZXJyID0gaHct
PnNvYy0+YWR2X3B1bGxfZ2V0KGh3LCBkZXNjLCBwdWxsdXAsICZyZXQpOw0KIAkJfSBlbHNlDQot
LSANCjEuOC4xLjEuZGlydHkNCg==

