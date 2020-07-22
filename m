Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33794228E6D
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Jul 2020 05:10:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731857AbgGVDKK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Jul 2020 23:10:10 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:33737 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1731846AbgGVDKJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Jul 2020 23:10:09 -0400
X-UUID: a571b0127cc947e7bfe8ef47e4bdab3b-20200722
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=UCdWr5LacAICSYEsyImGK0yGxPx4v01rG3yvP5bnIFE=;
        b=AS/nqx36T8nCrO+CVu93+4st2+27gkaI/jhu/QmOgtwF9pWYHB66+oSmD27FxPbzhuFhgyjJIUmcv/RB6vp61XcLWr5NgEquN09hm6KVkKAD0AJy4sB7f90Wb52JvBOcGdlTrBIRhnpLHYGMfHjEbgSSdd1KZUmjRe3VDtDhgQk=;
X-UUID: a571b0127cc947e7bfe8ef47e4bdab3b-20200722
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw01.mediatek.com
        (envelope-from <hanks.chen@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1629029067; Wed, 22 Jul 2020 11:10:06 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 22 Jul 2020 11:09:58 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 22 Jul 2020 11:09:58 +0800
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
Subject: [PATCH v2 1/2] dt-bindings: clock: remove UART3 clock support
Date:   Wed, 22 Jul 2020 11:09:56 +0800
Message-ID: <1595387397-13110-2-git-send-email-hanks.chen@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1595387397-13110-1-git-send-email-hanks.chen@mediatek.com>
References: <1595387397-13110-1-git-send-email-hanks.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

cmVtb3ZlIHRoZSByZWR1bmRhbnQgY2xrIGludGVyZmFjZSBvZiB1YXJ0Lg0KDQpTaWduZWQtb2Zm
LWJ5OiBIYW5rcyBDaGVuIDxoYW5rcy5jaGVuQG1lZGlhdGVrLmNvbT4NCi0tLQ0KIGluY2x1ZGUv
ZHQtYmluZGluZ3MvY2xvY2svbXQ2Nzc5LWNsay5oIHwgMSAtDQogMSBmaWxlIGNoYW5nZWQsIDEg
ZGVsZXRpb24oLSkNCg0KZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHQtYmluZGluZ3MvY2xvY2svbXQ2
Nzc5LWNsay5oIGIvaW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9jay9tdDY3NzktY2xrLmgNCmluZGV4
IGIwODMxMzlhZmJkMi4uMmI1ZjIzNTRkN2ViIDEwMDY0NA0KLS0tIGEvaW5jbHVkZS9kdC1iaW5k
aW5ncy9jbG9jay9tdDY3NzktY2xrLmgNCisrKyBiL2luY2x1ZGUvZHQtYmluZGluZ3MvY2xvY2sv
bXQ2Nzc5LWNsay5oDQpAQCAtMjI5LDcgKzIyOSw2IEBADQogI2RlZmluZSBDTEtfSU5GUkFfVUFS
VDAJCQkyMQ0KICNkZWZpbmUgQ0xLX0lORlJBX1VBUlQxCQkJMjINCiAjZGVmaW5lIENMS19JTkZS
QV9VQVJUMgkJCTIzDQotI2RlZmluZSBDTEtfSU5GUkFfVUFSVDMJCQkyNA0KICNkZWZpbmUgQ0xL
X0lORlJBX0dDRV8yNk0JCTI1DQogI2RlZmluZSBDTEtfSU5GUkFfQ1FfRE1BX0ZQQwkJMjYNCiAj
ZGVmaW5lIENMS19JTkZSQV9CVElGCQkJMjcNCi0tIA0KMi4xOC4wDQo=

