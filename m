Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EA0E228E6B
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Jul 2020 05:10:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731918AbgGVDKG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Jul 2020 23:10:06 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:40202 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1731846AbgGVDKE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Jul 2020 23:10:04 -0400
X-UUID: 379cd92399f143e0ae3f53da5b26cedd-20200722
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=gYjjWtbM06UrnIUXAoV37Admxh7IQJxjUUwdhGjMeJg=;
        b=hiyF7EPc/GYvjYG4Xyos52/VB9YE9bU/nwP4LvkYLiPjqcH9fUEs4YtWHBXQX/9BljyoXfsR3uRV1Pm/z6WJ/XyEfSNRiYO7a1ZzXD1g6o3Js1vrZNtZcq96yi31m+x6J+z3g8HejTUUYtEKj+3ht4C1BsQ6GbrT8zCcz8WKUMo=;
X-UUID: 379cd92399f143e0ae3f53da5b26cedd-20200722
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw01.mediatek.com
        (envelope-from <hanks.chen@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1439621916; Wed, 22 Jul 2020 11:10:01 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
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
Subject: [PATCH v2 2/2] clk: mediatek: remove UART3 clock support
Date:   Wed, 22 Jul 2020 11:09:57 +0800
Message-ID: <1595387397-13110-3-git-send-email-hanks.chen@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1595387397-13110-1-git-send-email-hanks.chen@mediatek.com>
References: <1595387397-13110-1-git-send-email-hanks.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: 716ADB503DD77DC1833F55A87B5C4DDD780824AAED33BBDB982B89D486A7B68C2000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Q0xLX0lORlJBX1VBUlQzIGlzIGEgZHVtbXkgY2xrIGludGVyZmFjZSwNCml0IGhhcyBubyBlZmZl
Y3Qgb24gdGhlIG9wZXJhdGlvbiBvZiB0aGUgcmVhZC93cml0ZSBpbnN0cnVjdGlvbi4NCg0KU2ln
bmVkLW9mZi1ieTogSGFua3MgQ2hlbiA8aGFua3MuY2hlbkBtZWRpYXRlay5jb20+DQotLS0NCiBk
cml2ZXJzL2Nsay9tZWRpYXRlay9jbGstbXQ2Nzc5LmMgfCAyIC0tDQogMSBmaWxlIGNoYW5nZWQs
IDIgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsay9tZWRpYXRlay9jbGst
bXQ2Nzc5LmMgYi9kcml2ZXJzL2Nsay9tZWRpYXRlay9jbGstbXQ2Nzc5LmMNCmluZGV4IDk3NjZj
Y2NmNTg0NC4uNzVmMjIzNTQ4NmJlIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9jbGsvbWVkaWF0ZWsv
Y2xrLW10Njc3OS5jDQorKysgYi9kcml2ZXJzL2Nsay9tZWRpYXRlay9jbGstbXQ2Nzc5LmMNCkBA
IC05MjMsOCArOTIzLDYgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfZ2F0ZSBpbmZyYV9jbGtz
W10gPSB7DQogCQkgICAgInVhcnRfc2VsIiwgMjMpLA0KIAlHQVRFX0lORlJBMChDTEtfSU5GUkFf
VUFSVDIsICJpbmZyYV91YXJ0MiIsDQogCQkgICAgInVhcnRfc2VsIiwgMjQpLA0KLQlHQVRFX0lO
RlJBMChDTEtfSU5GUkFfVUFSVDMsICJpbmZyYV91YXJ0MyIsDQotCQkgICAgInVhcnRfc2VsIiwg
MjUpLA0KIAlHQVRFX0lORlJBMChDTEtfSU5GUkFfR0NFXzI2TSwgImluZnJhX2djZV8yNm0iLA0K
IAkJICAgICJheGlfc2VsIiwgMjcpLA0KIAlHQVRFX0lORlJBMChDTEtfSU5GUkFfQ1FfRE1BX0ZQ
QywgImluZnJhX2NxZG1hX2ZwYyIsDQotLSANCjIuMTguMA0K

