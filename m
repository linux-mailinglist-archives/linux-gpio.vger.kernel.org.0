Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA434227844
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Jul 2020 07:40:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726236AbgGUFkn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Jul 2020 01:40:43 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:39456 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726003AbgGUFkn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Jul 2020 01:40:43 -0400
X-UUID: 5c25f18cb1154ab5a3694406921d8717-20200721
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=UYXb9TARtCORQ6Fp7X/Vs8nh9l+XsjGPKgRDOMIH2E0=;
        b=q9Np3P+Q3XCqTl8lvcAIPF7aPpa37ruvhYUwixwL2+a4aLdY3NxniN+uvTy0zCVzqvOaNBgCBFuu2bU0Ryy4LcGAxnVYzuAnCiyONuP9bh/Mw8D4MU2ch8AJQmOeyBbdHarvOC2VakEw9hu2FA6vkrFSTUlRoCWR9cj1Avi44SQ=;
X-UUID: 5c25f18cb1154ab5a3694406921d8717-20200721
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
        (envelope-from <hanks.chen@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 615147389; Tue, 21 Jul 2020 13:40:38 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
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
Subject: [PATCH 0/2] Remove MT6779 UART3 clock support
Date:   Tue, 21 Jul 2020 13:40:31 +0800
Message-ID: <20200721054033.18520-1-hanks.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: 61CC5E73BF7A47824A55A376016D14F5207F5182A89FA7554CA6AFB7DC8110262000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

cmVtb3ZlIHRoZSByZWR1bmRhbnQgY2xrIGludGVyZmFjZSBvZiB1YXJ0Lg0KQ0xLX0lORlJBX1VB
UlQzIGlzIGEgZHVtbXkgY2xrIGludGVyZmFjZSwNCml0IGhhcyBubyBlZmZlY3Qgb24gdGhlIG9w
ZXJhdGlvbiBvZiB0aGUgcmVhZC93cml0ZSBpbnN0cnVjdGlvbi4NCg0KSGFua3MgQ2hlbiAoMik6
DQogIGR0LWJpbmRpbmdzOiBjbG9jazogcmVtb3ZlIFVBUlQzIGNsb2NrIHN1cHBvcnQNCiAgY2xr
OiBtZWRpYXRlazogcmVtb3ZlIFVBUlQzIGNsb2NrIHN1cHBvcnQNCg0KIGRyaXZlcnMvY2xrL21l
ZGlhdGVrL2Nsay1tdDY3NzkuYyAgICAgIHwgMiAtLQ0KIGluY2x1ZGUvZHQtYmluZGluZ3MvY2xv
Y2svbXQ2Nzc5LWNsay5oIHwgMSAtDQogMiBmaWxlcyBjaGFuZ2VkLCAzIGRlbGV0aW9ucygtKQ0K
DQotLSANCjIuMTguMA0K

