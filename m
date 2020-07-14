Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3D2721EC98
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2020 11:20:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726935AbgGNJUS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Jul 2020 05:20:18 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:33230 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726431AbgGNJUR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Jul 2020 05:20:17 -0400
X-UUID: 806de7b976f94250945a44d82e6a5b6e-20200714
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=ahmJ+iCRVTKXFtRtyDWGXYImsIg7jin0Qq9Vh0vVaIQ=;
        b=pW76jng8pKScS9zz5dKU9N9TvGWQJtl+ZLwz3LCWdeUToEXeVUAM6BUa4oMzlEiSmKC7Iel/E1AyiTQKaqpTGhP3LFj9X49qcBNifQXAmfP0G3KZrv6CCGId7bRuknStfu/3Iv46CupJHnr1O85bl0nBHC2dRwmjRMDarcCRMEo=;
X-UUID: 806de7b976f94250945a44d82e6a5b6e-20200714
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
        (envelope-from <hanks.chen@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1961975607; Tue, 14 Jul 2020 17:20:14 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 14 Jul 2020 17:20:08 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 14 Jul 2020 17:20:08 +0800
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
        Hanks Chen <hanks.chen@mediatek.com>,
        Mars Cheng <mars.cheng@mediatek.com>
Subject: [PATCH v8 3/7] pinctrl: mediatek: avoid virtual gpio trying to set reg
Date:   Tue, 14 Jul 2020 17:19:58 +0800
Message-ID: <1594718402-20813-4-git-send-email-hanks.chen@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1594718402-20813-1-git-send-email-hanks.chen@mediatek.com>
References: <1594718402-20813-1-git-send-email-hanks.chen@mediatek.com>
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
Ynk6IE1hcnMgQ2hlbmcgPG1hcnMuY2hlbmdAbWVkaWF0ZWsuY29tPg0KU2lnbmVkLW9mZi1ieTog
SGFua3MgQ2hlbiA8aGFua3MuY2hlbkBtZWRpYXRlay5jb20+DQotLS0NCiAuLi4vcGluY3RybC9t
ZWRpYXRlay9waW5jdHJsLW10ay1jb21tb24tdjIuYyAgfCAyNSArKysrKysrKysrKysrKysrKysr
DQogLi4uL3BpbmN0cmwvbWVkaWF0ZWsvcGluY3RybC1tdGstY29tbW9uLXYyLmggIHwgIDEgKw0K
IGRyaXZlcnMvcGluY3RybC9tZWRpYXRlay9waW5jdHJsLXBhcmlzLmMgICAgICB8ICA3ICsrKysr
Kw0KIDMgZmlsZXMgY2hhbmdlZCwgMzMgaW5zZXJ0aW9ucygrKQ0KDQpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9waW5jdHJsL21lZGlhdGVrL3BpbmN0cmwtbXRrLWNvbW1vbi12Mi5jIGIvZHJpdmVycy9w
aW5jdHJsL21lZGlhdGVrL3BpbmN0cmwtbXRrLWNvbW1vbi12Mi5jDQppbmRleCBiNzdiMThmZTVh
ZGMuLmM1M2UyYzM5MWUzMiAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvcGluY3RybC9tZWRpYXRlay9w
aW5jdHJsLW10ay1jb21tb24tdjIuYw0KKysrIGIvZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL3Bp
bmN0cmwtbXRrLWNvbW1vbi12Mi5jDQpAQCAtMjQzLDYgKzI0MywyOCBAQCBzdGF0aWMgaW50IG10
a194dF9maW5kX2VpbnRfbnVtKHN0cnVjdCBtdGtfcGluY3RybCAqaHcsIHVuc2lnbmVkIGxvbmcg
ZWludF9uKQ0KIAlyZXR1cm4gRUlOVF9OQTsNCiB9DQogDQorLyoNCisgKiBWaXJ0dWFsIEdQSU8g
b25seSB1c2VkIGluc2lkZSBTT0MgYW5kIG5vdCBiZWluZyBleHBvcnRlZCB0byBvdXRzaWRlIFNP
Qy4NCisgKiBTb21lIG1vZHVsZXMgdXNlIHZpcnR1YWwgR1BJTyBhcyBlaW50IChlLmcuIHBtaWYg
b3IgdXNiKS4NCisgKiBJbiBNVEsgcGxhdGZvcm0sIGV4dGVybmFsIGludGVycnVwdCAoRUlOVCkg
YW5kIEdQSU8gaXMgMS0xIG1hcHBpbmcNCisgKiBhbmQgd2UgY2FuIHNldCBHUElPIGFzIGVpbnQu
DQorICogQnV0IHNvbWUgbW9kdWxlcyB1c2Ugc3BlY2lmaWMgZWludCB3aGljaCBkb2Vzbid0IGhh
dmUgcmVhbCBHUElPIHBpbi4NCisgKiBTbyB3ZSB1c2UgdmlydHVhbCBHUElPIHRvIG1hcCBpdC4N
CisgKi8NCisNCitib29sIG10a19pc192aXJ0X2dwaW8oc3RydWN0IG10a19waW5jdHJsICpodywg
dW5zaWduZWQgaW50IGdwaW9fbikNCit7DQorCWNvbnN0IHN0cnVjdCBtdGtfcGluX2Rlc2MgKmRl
c2M7DQorCWJvb2wgdmlydF9ncGlvID0gZmFsc2U7DQorDQorCWRlc2MgPSAoY29uc3Qgc3RydWN0
IG10a19waW5fZGVzYyAqKSZody0+c29jLT5waW5zW2dwaW9fbl07DQorDQorCWlmIChkZXNjLT5m
dW5jcyAmJiAhZGVzYy0+ZnVuY3NbZGVzYy0+ZWludC5laW50X21dLm5hbWUpDQorCQl2aXJ0X2dw
aW8gPSB0cnVlOw0KKw0KKwlyZXR1cm4gdmlydF9ncGlvOw0KK30NCisNCiBzdGF0aWMgaW50IG10
a194dF9nZXRfZ3Bpb19uKHZvaWQgKmRhdGEsIHVuc2lnbmVkIGxvbmcgZWludF9uLA0KIAkJCSAg
ICAgdW5zaWduZWQgaW50ICpncGlvX24sDQogCQkJICAgICBzdHJ1Y3QgZ3Bpb19jaGlwICoqZ3Bp
b19jaGlwKQ0KQEAgLTI5NSw2ICszMTcsOSBAQCBzdGF0aWMgaW50IG10a194dF9zZXRfZ3Bpb19h
c19laW50KHZvaWQgKmRhdGEsIHVuc2lnbmVkIGxvbmcgZWludF9uKQ0KIAlpZiAoZXJyKQ0KIAkJ
cmV0dXJuIGVycjsNCiANCisJaWYgKG10a19pc192aXJ0X2dwaW8oaHcsIGdwaW9fbikpDQorCQly
ZXR1cm4gMDsNCisNCiAJZGVzYyA9IChjb25zdCBzdHJ1Y3QgbXRrX3Bpbl9kZXNjICopJmh3LT5z
b2MtPnBpbnNbZ3Bpb19uXTsNCiANCiAJZXJyID0gbXRrX2h3X3NldF92YWx1ZShodywgZGVzYywg
UElOQ1RSTF9QSU5fUkVHX01PREUsDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9waW5jdHJsL21lZGlh
dGVrL3BpbmN0cmwtbXRrLWNvbW1vbi12Mi5oIGIvZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL3Bp
bmN0cmwtbXRrLWNvbW1vbi12Mi5oDQppbmRleCAyN2RmMDg3MzYzOTYuLmJkMDc5ZjRmYjFkNiAx
MDA2NDQNCi0tLSBhL2RyaXZlcnMvcGluY3RybC9tZWRpYXRlay9waW5jdHJsLW10ay1jb21tb24t
djIuaA0KKysrIGIvZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL3BpbmN0cmwtbXRrLWNvbW1vbi12
Mi5oDQpAQCAtMzE1LDQgKzMxNSw1IEBAIGludCBtdGtfcGluY29uZl9hZHZfZHJpdmVfc2V0KHN0
cnVjdCBtdGtfcGluY3RybCAqaHcsDQogaW50IG10a19waW5jb25mX2Fkdl9kcml2ZV9nZXQoc3Ry
dWN0IG10a19waW5jdHJsICpodywNCiAJCQkgICAgICBjb25zdCBzdHJ1Y3QgbXRrX3Bpbl9kZXNj
ICpkZXNjLCB1MzIgKnZhbCk7DQogDQorYm9vbCBtdGtfaXNfdmlydF9ncGlvKHN0cnVjdCBtdGtf
cGluY3RybCAqaHcsIHVuc2lnbmVkIGludCBncGlvX24pOw0KICNlbmRpZiAvKiBfX1BJTkNUUkxf
TVRLX0NPTU1PTl9WMl9IICovDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9waW5jdHJsL21lZGlhdGVr
L3BpbmN0cmwtcGFyaXMuYyBiL2RyaXZlcnMvcGluY3RybC9tZWRpYXRlay9waW5jdHJsLXBhcmlz
LmMNCmluZGV4IDkwYTQzMmJmOWZlZC4uYTIzYzE4MjUxOTY1IDEwMDY0NA0KLS0tIGEvZHJpdmVy
cy9waW5jdHJsL21lZGlhdGVrL3BpbmN0cmwtcGFyaXMuYw0KKysrIGIvZHJpdmVycy9waW5jdHJs
L21lZGlhdGVrL3BpbmN0cmwtcGFyaXMuYw0KQEAgLTc2OSw2ICs3NjksMTMgQEAgc3RhdGljIGlu
dCBtdGtfZ3Bpb19nZXRfZGlyZWN0aW9uKHN0cnVjdCBncGlvX2NoaXAgKmNoaXAsIHVuc2lnbmVk
IGludCBncGlvKQ0KIAlpZiAoZ3BpbyA+PSBody0+c29jLT5ucGlucykNCiAJCXJldHVybiAtRUlO
VkFMOw0KIA0KKwkvKg0KKwkgKiAiVmlydHVhbCIgR1BJT3MgYXJlIGFsd2F5cyBhbmQgb25seSB1
c2VkIGZvciBpbnRlcnJ1cHRzDQorCSAqIFNpbmNlIHRoZXkgYXJlIG9ubHkgdXNlZCBmb3IgaW50
ZXJydXB0cywgdGhleSBhcmUgYWx3YXlzIGlucHV0cw0KKwkgKi8NCisJaWYgKG10a19pc192aXJ0
X2dwaW8oaHcsIGdwaW8pKQ0KKwkJcmV0dXJuIDE7DQorDQogCWRlc2MgPSAoY29uc3Qgc3RydWN0
IG10a19waW5fZGVzYyAqKSZody0+c29jLT5waW5zW2dwaW9dOw0KIA0KIAllcnIgPSBtdGtfaHdf
Z2V0X3ZhbHVlKGh3LCBkZXNjLCBQSU5DVFJMX1BJTl9SRUdfRElSLCAmdmFsdWUpOw0KLS0gDQoy
LjE4LjANCg==

