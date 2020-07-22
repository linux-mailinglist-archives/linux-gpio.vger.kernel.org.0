Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1D4F228E69
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Jul 2020 05:10:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731856AbgGVDKE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Jul 2020 23:10:04 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:56286 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1731781AbgGVDKD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Jul 2020 23:10:03 -0400
X-UUID: 3e375033be3c4bcb98231b81ba86caf4-20200722
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=FfnplIb03F5mygWVhrAncd7mBRDTjO+wl6Oht14jAw4=;
        b=kcVmrFQu/+/n8u8hWJa9yO2e1afSIphZSTY/2NLmphm1rwLkzcAG/1N/Zl3iTpNUuMYbv8NvOdr528WkNQiwKT4Bk1xwl2QXye6QOLFGDKBMMVu23Kk/EyJCSvbqX6OL82CTnQcjCo1P+alBYE+zkpzAk/pS/rwxUdrl//e2DKU=;
X-UUID: 3e375033be3c4bcb98231b81ba86caf4-20200722
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw02.mediatek.com
        (envelope-from <hanks.chen@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1478180731; Wed, 22 Jul 2020 11:10:00 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
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
Subject: [PATCH v2 0/2] Remove MT6779 UART3 clock support
Date:   Wed, 22 Jul 2020 11:09:55 +0800
Message-ID: <1595387397-13110-1-git-send-email-hanks.chen@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: 24DA662D4C732F673DA55CE5622ACF3B05E818798C543EB8C5849691F46B03292000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

cmVtb3ZlIHRoZSByZWR1bmRhbnQgY2xrIGludGVyZmFjZSBvZiB1YXJ0Lg0KQ0xLX0lORlJBX1VB
UlQzIGlzIGEgZHVtbXkgY2xrIGludGVyZmFjZSwNCml0IGhhcyBubyBlZmZlY3Qgb24gdGhlIG9w
ZXJhdGlvbiBvZiB0aGUgcmVhZC93cml0ZSBpbnN0cnVjdGlvbi4NCg0KQ2hhbmdlIHNpbmNlIHYy
Og0KQ29tbWl0ICJkdC1iaW5kaW5nczogY2xvY2s6IHJlbW92ZSBVQVJUMyBjbG9jayBzdXBwb3J0
Ig0KLS0gcmVtb3ZlIEZpeGVzIHRhZw0KQ29tbWl0ICJjbGs6IG1lZGlhdGVrOiByZW1vdmUgVUFS
VDMgY2xvY2sgc3VwcG9ydCINCi0tIHJlbW92ZSBGaXhlcyB0YWcNCg0KSGFua3MgQ2hlbiAoMik6
DQogIGR0LWJpbmRpbmdzOiBjbG9jazogcmVtb3ZlIFVBUlQzIGNsb2NrIHN1cHBvcnQNCiAgY2xr
OiBtZWRpYXRlazogcmVtb3ZlIFVBUlQzIGNsb2NrIHN1cHBvcnQNCg0KIGRyaXZlcnMvY2xrL21l
ZGlhdGVrL2Nsay1tdDY3NzkuYyAgICAgIHwgMiAtLQ0KIGluY2x1ZGUvZHQtYmluZGluZ3MvY2xv
Y2svbXQ2Nzc5LWNsay5oIHwgMSAtDQogMiBmaWxlcyBjaGFuZ2VkLCAzIGRlbGV0aW9ucygtKQ0K
DQotLSANCjIuMTguMA0K

