Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7CD81FF0AF
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2020 13:35:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729506AbgFRLet (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 18 Jun 2020 07:34:49 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:21807 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728261AbgFRLeL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 18 Jun 2020 07:34:11 -0400
X-UUID: 727a8d93be484cf38b0cce88d0ec8727-20200618
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=hw1Pb8jVQk9FC4VBMjRDMJKfMp8kJn7O5WM3f/NAK3Y=;
        b=I9pzrWDeR3L1ilz8GlkAFVNlwhrc38UXhd9YtRESy9AfoWZOPapGnwkhGd0bbZ6P1vJ1j1Jp9Tm1srnjv1NoF6Kiw0q3v/HJSDojKY81TuCXVEDJwWB+ariMDb8y73PedUnpFIySOhK5Ke9r17xJaZRfBYLgApTKg4AJH2dxAtI=;
X-UUID: 727a8d93be484cf38b0cce88d0ec8727-20200618
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw02.mediatek.com
        (envelope-from <hanks.chen@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 218966080; Thu, 18 Jun 2020 19:34:05 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 18 Jun 2020 19:34:02 +0800
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
        Hanks Chen <hanks.chen@mediatek.com>,
        Mars Cheng <mars.cheng@mediatek.com>
Subject: [PATCH v6 3/7] pinctrl: mediatek: avoid virtual gpio trying to set reg
Date:   Thu, 18 Jun 2020 19:33:34 +0800
Message-ID: <1592480018-3340-4-git-send-email-hanks.chen@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1592480018-3340-1-git-send-email-hanks.chen@mediatek.com>
References: <1592480018-3340-1-git-send-email-hanks.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Zm9yIHZpcnR1YWwgZ3Bpb3MsIHRoZXkgc2hvdWxkIG5vdCBkbyByZWcgc2V0dGluZyBhbmQNCnNo
b3VsZCBiZWhhdmUgYXMgZXhwZWN0ZWQgZm9yIGVpbnQgZnVuY3Rpb24uDQoNClNpZ25lZC1vZmYt
Ynk6IEhhbmtzIENoZW4gPGhhbmtzLmNoZW5AbWVkaWF0ZWsuY29tPg0KU2lnbmVkLW9mZi1ieTog
TWFycyBDaGVuZyA8bWFycy5jaGVuZ0BtZWRpYXRlay5jb20+DQotLS0NCiBkcml2ZXJzL3BpbmN0
cmwvbWVkaWF0ZWsvcGluY3RybC1tdGstY29tbW9uLXYyLmMgfCAgIDI1ICsrKysrKysrKysrKysr
KysrKysrKysNCiBkcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvcGluY3RybC1tdGstY29tbW9uLXYy
LmggfCAgICAxICsNCiBkcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvcGluY3RybC1wYXJpcy5jICAg
ICAgICAgfCAgICA3ICsrKysrKw0KIDMgZmlsZXMgY2hhbmdlZCwgMzMgaW5zZXJ0aW9ucygrKQ0K
DQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL3BpbmN0cmwtbXRrLWNvbW1v
bi12Mi5jIGIvZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL3BpbmN0cmwtbXRrLWNvbW1vbi12Mi5j
DQppbmRleCBiNzdiMThmLi5jNTNlMmMzIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9waW5jdHJsL21l
ZGlhdGVrL3BpbmN0cmwtbXRrLWNvbW1vbi12Mi5jDQorKysgYi9kcml2ZXJzL3BpbmN0cmwvbWVk
aWF0ZWsvcGluY3RybC1tdGstY29tbW9uLXYyLmMNCkBAIC0yNDMsNiArMjQzLDI4IEBAIHN0YXRp
YyBpbnQgbXRrX3h0X2ZpbmRfZWludF9udW0oc3RydWN0IG10a19waW5jdHJsICpodywgdW5zaWdu
ZWQgbG9uZyBlaW50X24pDQogCXJldHVybiBFSU5UX05BOw0KIH0NCiANCisvKg0KKyAqIFZpcnR1
YWwgR1BJTyBvbmx5IHVzZWQgaW5zaWRlIFNPQyBhbmQgbm90IGJlaW5nIGV4cG9ydGVkIHRvIG91
dHNpZGUgU09DLg0KKyAqIFNvbWUgbW9kdWxlcyB1c2UgdmlydHVhbCBHUElPIGFzIGVpbnQgKGUu
Zy4gcG1pZiBvciB1c2IpLg0KKyAqIEluIE1USyBwbGF0Zm9ybSwgZXh0ZXJuYWwgaW50ZXJydXB0
IChFSU5UKSBhbmQgR1BJTyBpcyAxLTEgbWFwcGluZw0KKyAqIGFuZCB3ZSBjYW4gc2V0IEdQSU8g
YXMgZWludC4NCisgKiBCdXQgc29tZSBtb2R1bGVzIHVzZSBzcGVjaWZpYyBlaW50IHdoaWNoIGRv
ZXNuJ3QgaGF2ZSByZWFsIEdQSU8gcGluLg0KKyAqIFNvIHdlIHVzZSB2aXJ0dWFsIEdQSU8gdG8g
bWFwIGl0Lg0KKyAqLw0KKw0KK2Jvb2wgbXRrX2lzX3ZpcnRfZ3BpbyhzdHJ1Y3QgbXRrX3BpbmN0
cmwgKmh3LCB1bnNpZ25lZCBpbnQgZ3Bpb19uKQ0KK3sNCisJY29uc3Qgc3RydWN0IG10a19waW5f
ZGVzYyAqZGVzYzsNCisJYm9vbCB2aXJ0X2dwaW8gPSBmYWxzZTsNCisNCisJZGVzYyA9IChjb25z
dCBzdHJ1Y3QgbXRrX3Bpbl9kZXNjICopJmh3LT5zb2MtPnBpbnNbZ3Bpb19uXTsNCisNCisJaWYg
KGRlc2MtPmZ1bmNzICYmICFkZXNjLT5mdW5jc1tkZXNjLT5laW50LmVpbnRfbV0ubmFtZSkNCisJ
CXZpcnRfZ3BpbyA9IHRydWU7DQorDQorCXJldHVybiB2aXJ0X2dwaW87DQorfQ0KKw0KIHN0YXRp
YyBpbnQgbXRrX3h0X2dldF9ncGlvX24odm9pZCAqZGF0YSwgdW5zaWduZWQgbG9uZyBlaW50X24s
DQogCQkJICAgICB1bnNpZ25lZCBpbnQgKmdwaW9fbiwNCiAJCQkgICAgIHN0cnVjdCBncGlvX2No
aXAgKipncGlvX2NoaXApDQpAQCAtMjk1LDYgKzMxNyw5IEBAIHN0YXRpYyBpbnQgbXRrX3h0X3Nl
dF9ncGlvX2FzX2VpbnQodm9pZCAqZGF0YSwgdW5zaWduZWQgbG9uZyBlaW50X24pDQogCWlmIChl
cnIpDQogCQlyZXR1cm4gZXJyOw0KIA0KKwlpZiAobXRrX2lzX3ZpcnRfZ3BpbyhodywgZ3Bpb19u
KSkNCisJCXJldHVybiAwOw0KKw0KIAlkZXNjID0gKGNvbnN0IHN0cnVjdCBtdGtfcGluX2Rlc2Mg
KikmaHctPnNvYy0+cGluc1tncGlvX25dOw0KIA0KIAllcnIgPSBtdGtfaHdfc2V0X3ZhbHVlKGh3
LCBkZXNjLCBQSU5DVFJMX1BJTl9SRUdfTU9ERSwNCmRpZmYgLS1naXQgYS9kcml2ZXJzL3BpbmN0
cmwvbWVkaWF0ZWsvcGluY3RybC1tdGstY29tbW9uLXYyLmggYi9kcml2ZXJzL3BpbmN0cmwvbWVk
aWF0ZWsvcGluY3RybC1tdGstY29tbW9uLXYyLmgNCmluZGV4IDI3ZGYwODcuLmJkMDc5ZjRmIDEw
MDY0NA0KLS0tIGEvZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL3BpbmN0cmwtbXRrLWNvbW1vbi12
Mi5oDQorKysgYi9kcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvcGluY3RybC1tdGstY29tbW9uLXYy
LmgNCkBAIC0zMTUsNCArMzE1LDUgQEAgaW50IG10a19waW5jb25mX2Fkdl9kcml2ZV9zZXQoc3Ry
dWN0IG10a19waW5jdHJsICpodywNCiBpbnQgbXRrX3BpbmNvbmZfYWR2X2RyaXZlX2dldChzdHJ1
Y3QgbXRrX3BpbmN0cmwgKmh3LA0KIAkJCSAgICAgIGNvbnN0IHN0cnVjdCBtdGtfcGluX2Rlc2Mg
KmRlc2MsIHUzMiAqdmFsKTsNCiANCitib29sIG10a19pc192aXJ0X2dwaW8oc3RydWN0IG10a19w
aW5jdHJsICpodywgdW5zaWduZWQgaW50IGdwaW9fbik7DQogI2VuZGlmIC8qIF9fUElOQ1RSTF9N
VEtfQ09NTU9OX1YyX0ggKi8NCmRpZmYgLS1naXQgYS9kcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsv
cGluY3RybC1wYXJpcy5jIGIvZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL3BpbmN0cmwtcGFyaXMu
Yw0KaW5kZXggOTBhNDMyYi4uYTIzYzE4MiAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvcGluY3RybC9t
ZWRpYXRlay9waW5jdHJsLXBhcmlzLmMNCisrKyBiL2RyaXZlcnMvcGluY3RybC9tZWRpYXRlay9w
aW5jdHJsLXBhcmlzLmMNCkBAIC03NjksNiArNzY5LDEzIEBAIHN0YXRpYyBpbnQgbXRrX2dwaW9f
Z2V0X2RpcmVjdGlvbihzdHJ1Y3QgZ3Bpb19jaGlwICpjaGlwLCB1bnNpZ25lZCBpbnQgZ3BpbykN
CiAJaWYgKGdwaW8gPj0gaHctPnNvYy0+bnBpbnMpDQogCQlyZXR1cm4gLUVJTlZBTDsNCiANCisJ
LyoNCisJICogIlZpcnR1YWwiIEdQSU9zIGFyZSBhbHdheXMgYW5kIG9ubHkgdXNlZCBmb3IgaW50
ZXJydXB0cw0KKwkgKiBTaW5jZSB0aGV5IGFyZSBvbmx5IHVzZWQgZm9yIGludGVycnVwdHMsIHRo
ZXkgYXJlIGFsd2F5cyBpbnB1dHMNCisJICovDQorCWlmIChtdGtfaXNfdmlydF9ncGlvKGh3LCBn
cGlvKSkNCisJCXJldHVybiAxOw0KKw0KIAlkZXNjID0gKGNvbnN0IHN0cnVjdCBtdGtfcGluX2Rl
c2MgKikmaHctPnNvYy0+cGluc1tncGlvXTsNCiANCiAJZXJyID0gbXRrX2h3X2dldF92YWx1ZSho
dywgZGVzYywgUElOQ1RSTF9QSU5fUkVHX0RJUiwgJnZhbHVlKTsNCi0tIA0KMS43LjkuNQ0K

