Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80B3B227846
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Jul 2020 07:40:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727809AbgGUFkr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Jul 2020 01:40:47 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:57861 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726003AbgGUFkq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Jul 2020 01:40:46 -0400
X-UUID: f0d81703528c40ddae55945906f6c069-20200721
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=r1JvQq55o9JWsO0xHx5gj1UaxvorN44u2V1IJpLE4Ow=;
        b=JD2UIFk+9YfH90ji/NS7zQ+OZJ4vVQZ7AWlqJF8KrZ1qgLliII4J5Om1zY9vIzNJFA6mfEgGIrFMl8/VQ5OBTip28qi1zicLyoWgwFrnxJV90FKUVHzEhYE/PlZvHx5QqS02+sNLS8WR5SNB+HqVUQW6xScH+A3ralSObw3CLPA=;
X-UUID: f0d81703528c40ddae55945906f6c069-20200721
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
        (envelope-from <hanks.chen@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 203766420; Tue, 21 Jul 2020 13:40:44 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 21 Jul 2020 13:40:35 +0800
Received: from mtkslt209.mediatek.inc (10.21.15.96) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 21 Jul 2020 13:40:35 +0800
From:   Hanks Chen <hanks.chen@mediatek.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
CC:     YueHaibing <yuehaibing@huawei.com>,
        mtk01761 <wendell.lin@mediatek.com>,
        CC Hwang <cc.hwang@mediatek.com>, <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <wsd_upstream@mediatek.com>,
        Hanks Chen <hanks.chen@mediatek.com>
Subject: [PATCH 2/2] clk: mediatek: remove UART3 clock support
Date:   Tue, 21 Jul 2020 13:40:33 +0800
Message-ID: <20200721054033.18520-3-hanks.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200721054033.18520-1-hanks.chen@mediatek.com>
References: <20200721054033.18520-1-hanks.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: 260778E1BAA8E2DC087EAC720C4C06B45F5F973202C578C7CC33AA0E0F17F9CE2000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Q0xLX0lORlJBX1VBUlQzIGlzIGEgZHVtbXkgY2xrIGludGVyZmFjZSwNCml0IGhhcyBubyBlZmZl
Y3Qgb24gdGhlIG9wZXJhdGlvbiBvZiB0aGUgcmVhZC93cml0ZSBpbnN0cnVjdGlvbi4NCg0KRml4
ZXM6IDcxMDc3NGUwNDg2MSAoImNsazogbWVkaWF0ZWs6IEFkZCBNVDY3NzkgY2xvY2sgc3VwcG9y
dCIpDQpTaWduZWQtb2ZmLWJ5OiBIYW5rcyBDaGVuIDxoYW5rcy5jaGVuQG1lZGlhdGVrLmNvbT4N
Ci0tLQ0KIGRyaXZlcnMvY2xrL21lZGlhdGVrL2Nsay1tdDY3NzkuYyB8IDIgLS0NCiAxIGZpbGUg
Y2hhbmdlZCwgMiBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xrL21lZGlh
dGVrL2Nsay1tdDY3NzkuYyBiL2RyaXZlcnMvY2xrL21lZGlhdGVrL2Nsay1tdDY3NzkuYw0KaW5k
ZXggOTc2NmNjY2Y1ODQ0Li43NWYyMjM1NDg2YmUgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2Nsay9t
ZWRpYXRlay9jbGstbXQ2Nzc5LmMNCisrKyBiL2RyaXZlcnMvY2xrL21lZGlhdGVrL2Nsay1tdDY3
NzkuYw0KQEAgLTkyMyw4ICs5MjMsNiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG10a19nYXRlIGlu
ZnJhX2Nsa3NbXSA9IHsNCiAJCSAgICAidWFydF9zZWwiLCAyMyksDQogCUdBVEVfSU5GUkEwKENM
S19JTkZSQV9VQVJUMiwgImluZnJhX3VhcnQyIiwNCiAJCSAgICAidWFydF9zZWwiLCAyNCksDQot
CUdBVEVfSU5GUkEwKENMS19JTkZSQV9VQVJUMywgImluZnJhX3VhcnQzIiwNCi0JCSAgICAidWFy
dF9zZWwiLCAyNSksDQogCUdBVEVfSU5GUkEwKENMS19JTkZSQV9HQ0VfMjZNLCAiaW5mcmFfZ2Nl
XzI2bSIsDQogCQkgICAgImF4aV9zZWwiLCAyNyksDQogCUdBVEVfSU5GUkEwKENMS19JTkZSQV9D
UV9ETUFfRlBDLCAiaW5mcmFfY3FkbWFfZnBjIiwNCi0tIA0KMi4xOC4wDQo=

