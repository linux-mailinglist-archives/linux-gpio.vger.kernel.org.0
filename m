Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDCB422AD8E
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Jul 2020 13:22:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728539AbgGWLUH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Jul 2020 07:20:07 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:37873 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727769AbgGWLUH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Jul 2020 07:20:07 -0400
X-UUID: a60ed0f0ddbd4722a29382f602a7be42-20200723
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=IAYQHxickWHe2ZE7HNcFpZYh+SYPG0KsSHSyyPGPmIU=;
        b=GQs477h5fAfcpLX+GOk9Ghm5B7mto9ZocWKzkMXRMztroT1zT0RdTP2rWgyz7xQHI9f+DZTBdglq4LTx5VlLAChx4bH+RWMFTbFeb4JNkR/v2wLvFwr/yCIsSQNGOcxIcdrXMSXeiFszXFXtsNh8J/SUIBRrBVz6Qb89kGQO9SA=;
X-UUID: a60ed0f0ddbd4722a29382f602a7be42-20200723
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
        (envelope-from <hanks.chen@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1786912797; Thu, 23 Jul 2020 19:20:02 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Jul 2020 19:19:58 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 23 Jul 2020 19:19:59 +0800
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
Subject: [PATCH v9 3/7] pinctrl: mediatek: avoid virtual gpio trying to set reg
Date:   Thu, 23 Jul 2020 19:19:53 +0800
Message-ID: <1595503197-15246-4-git-send-email-hanks.chen@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1595503197-15246-1-git-send-email-hanks.chen@mediatek.com>
References: <1595503197-15246-1-git-send-email-hanks.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: 1E47C6615EB965B77944190983D9BF6B97ABBFC08EB39DA51C9A6004CB1D90A02000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Zm9yIHZpcnR1YWwgZ3Bpb3MsIHRoZXkgc2hvdWxkIG5vdCBkbyByZWcgc2V0dGluZyBhbmQNCnNo
b3VsZCBiZWhhdmUgYXMgZXhwZWN0ZWQgZm9yIGVpbnQgZnVuY3Rpb24uDQoNCkFja2VkLWJ5OiBT
ZWFuIFdhbmcgPHNlYW4ud2FuZ0BrZXJuZWwub3JnPg0KU2lnbmVkLW9mZi1ieTogTWFycyBDaGVu
ZyA8bWFycy5jaGVuZ0BtZWRpYXRlay5jb20+DQpTaWduZWQtb2ZmLWJ5OiBIYW5rcyBDaGVuIDxo
YW5rcy5jaGVuQG1lZGlhdGVrLmNvbT4NCi0tLQ0KIC4uLi9waW5jdHJsL21lZGlhdGVrL3BpbmN0
cmwtbXRrLWNvbW1vbi12Mi5jICB8IDI1ICsrKysrKysrKysrKysrKysrKysNCiAuLi4vcGluY3Ry
bC9tZWRpYXRlay9waW5jdHJsLW10ay1jb21tb24tdjIuaCAgfCAgMSArDQogZHJpdmVycy9waW5j
dHJsL21lZGlhdGVrL3BpbmN0cmwtcGFyaXMuYyAgICAgIHwgIDcgKysrKysrDQogMyBmaWxlcyBj
aGFuZ2VkLCAzMyBpbnNlcnRpb25zKCspDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL3BpbmN0cmwv
bWVkaWF0ZWsvcGluY3RybC1tdGstY29tbW9uLXYyLmMgYi9kcml2ZXJzL3BpbmN0cmwvbWVkaWF0
ZWsvcGluY3RybC1tdGstY29tbW9uLXYyLmMNCmluZGV4IGI3N2IxOGZlNWFkYy4uYzUzZTJjMzkx
ZTMyIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL3BpbmN0cmwtbXRrLWNv
bW1vbi12Mi5jDQorKysgYi9kcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvcGluY3RybC1tdGstY29t
bW9uLXYyLmMNCkBAIC0yNDMsNiArMjQzLDI4IEBAIHN0YXRpYyBpbnQgbXRrX3h0X2ZpbmRfZWlu
dF9udW0oc3RydWN0IG10a19waW5jdHJsICpodywgdW5zaWduZWQgbG9uZyBlaW50X24pDQogCXJl
dHVybiBFSU5UX05BOw0KIH0NCiANCisvKg0KKyAqIFZpcnR1YWwgR1BJTyBvbmx5IHVzZWQgaW5z
aWRlIFNPQyBhbmQgbm90IGJlaW5nIGV4cG9ydGVkIHRvIG91dHNpZGUgU09DLg0KKyAqIFNvbWUg
bW9kdWxlcyB1c2UgdmlydHVhbCBHUElPIGFzIGVpbnQgKGUuZy4gcG1pZiBvciB1c2IpLg0KKyAq
IEluIE1USyBwbGF0Zm9ybSwgZXh0ZXJuYWwgaW50ZXJydXB0IChFSU5UKSBhbmQgR1BJTyBpcyAx
LTEgbWFwcGluZw0KKyAqIGFuZCB3ZSBjYW4gc2V0IEdQSU8gYXMgZWludC4NCisgKiBCdXQgc29t
ZSBtb2R1bGVzIHVzZSBzcGVjaWZpYyBlaW50IHdoaWNoIGRvZXNuJ3QgaGF2ZSByZWFsIEdQSU8g
cGluLg0KKyAqIFNvIHdlIHVzZSB2aXJ0dWFsIEdQSU8gdG8gbWFwIGl0Lg0KKyAqLw0KKw0KK2Jv
b2wgbXRrX2lzX3ZpcnRfZ3BpbyhzdHJ1Y3QgbXRrX3BpbmN0cmwgKmh3LCB1bnNpZ25lZCBpbnQg
Z3Bpb19uKQ0KK3sNCisJY29uc3Qgc3RydWN0IG10a19waW5fZGVzYyAqZGVzYzsNCisJYm9vbCB2
aXJ0X2dwaW8gPSBmYWxzZTsNCisNCisJZGVzYyA9IChjb25zdCBzdHJ1Y3QgbXRrX3Bpbl9kZXNj
ICopJmh3LT5zb2MtPnBpbnNbZ3Bpb19uXTsNCisNCisJaWYgKGRlc2MtPmZ1bmNzICYmICFkZXNj
LT5mdW5jc1tkZXNjLT5laW50LmVpbnRfbV0ubmFtZSkNCisJCXZpcnRfZ3BpbyA9IHRydWU7DQor
DQorCXJldHVybiB2aXJ0X2dwaW87DQorfQ0KKw0KIHN0YXRpYyBpbnQgbXRrX3h0X2dldF9ncGlv
X24odm9pZCAqZGF0YSwgdW5zaWduZWQgbG9uZyBlaW50X24sDQogCQkJICAgICB1bnNpZ25lZCBp
bnQgKmdwaW9fbiwNCiAJCQkgICAgIHN0cnVjdCBncGlvX2NoaXAgKipncGlvX2NoaXApDQpAQCAt
Mjk1LDYgKzMxNyw5IEBAIHN0YXRpYyBpbnQgbXRrX3h0X3NldF9ncGlvX2FzX2VpbnQodm9pZCAq
ZGF0YSwgdW5zaWduZWQgbG9uZyBlaW50X24pDQogCWlmIChlcnIpDQogCQlyZXR1cm4gZXJyOw0K
IA0KKwlpZiAobXRrX2lzX3ZpcnRfZ3BpbyhodywgZ3Bpb19uKSkNCisJCXJldHVybiAwOw0KKw0K
IAlkZXNjID0gKGNvbnN0IHN0cnVjdCBtdGtfcGluX2Rlc2MgKikmaHctPnNvYy0+cGluc1tncGlv
X25dOw0KIA0KIAllcnIgPSBtdGtfaHdfc2V0X3ZhbHVlKGh3LCBkZXNjLCBQSU5DVFJMX1BJTl9S
RUdfTU9ERSwNCmRpZmYgLS1naXQgYS9kcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvcGluY3RybC1t
dGstY29tbW9uLXYyLmggYi9kcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvcGluY3RybC1tdGstY29t
bW9uLXYyLmgNCmluZGV4IDI3ZGYwODczNjM5Ni4uYmQwNzlmNGZiMWQ2IDEwMDY0NA0KLS0tIGEv
ZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL3BpbmN0cmwtbXRrLWNvbW1vbi12Mi5oDQorKysgYi9k
cml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvcGluY3RybC1tdGstY29tbW9uLXYyLmgNCkBAIC0zMTUs
NCArMzE1LDUgQEAgaW50IG10a19waW5jb25mX2Fkdl9kcml2ZV9zZXQoc3RydWN0IG10a19waW5j
dHJsICpodywNCiBpbnQgbXRrX3BpbmNvbmZfYWR2X2RyaXZlX2dldChzdHJ1Y3QgbXRrX3BpbmN0
cmwgKmh3LA0KIAkJCSAgICAgIGNvbnN0IHN0cnVjdCBtdGtfcGluX2Rlc2MgKmRlc2MsIHUzMiAq
dmFsKTsNCiANCitib29sIG10a19pc192aXJ0X2dwaW8oc3RydWN0IG10a19waW5jdHJsICpodywg
dW5zaWduZWQgaW50IGdwaW9fbik7DQogI2VuZGlmIC8qIF9fUElOQ1RSTF9NVEtfQ09NTU9OX1Yy
X0ggKi8NCmRpZmYgLS1naXQgYS9kcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvcGluY3RybC1wYXJp
cy5jIGIvZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL3BpbmN0cmwtcGFyaXMuYw0KaW5kZXggOTBh
NDMyYmY5ZmVkLi5hMjNjMTgyNTE5NjUgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL3BpbmN0cmwvbWVk
aWF0ZWsvcGluY3RybC1wYXJpcy5jDQorKysgYi9kcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvcGlu
Y3RybC1wYXJpcy5jDQpAQCAtNzY5LDYgKzc2OSwxMyBAQCBzdGF0aWMgaW50IG10a19ncGlvX2dl
dF9kaXJlY3Rpb24oc3RydWN0IGdwaW9fY2hpcCAqY2hpcCwgdW5zaWduZWQgaW50IGdwaW8pDQog
CWlmIChncGlvID49IGh3LT5zb2MtPm5waW5zKQ0KIAkJcmV0dXJuIC1FSU5WQUw7DQogDQorCS8q
DQorCSAqICJWaXJ0dWFsIiBHUElPcyBhcmUgYWx3YXlzIGFuZCBvbmx5IHVzZWQgZm9yIGludGVy
cnVwdHMNCisJICogU2luY2UgdGhleSBhcmUgb25seSB1c2VkIGZvciBpbnRlcnJ1cHRzLCB0aGV5
IGFyZSBhbHdheXMgaW5wdXRzDQorCSAqLw0KKwlpZiAobXRrX2lzX3ZpcnRfZ3BpbyhodywgZ3Bp
bykpDQorCQlyZXR1cm4gMTsNCisNCiAJZGVzYyA9IChjb25zdCBzdHJ1Y3QgbXRrX3Bpbl9kZXNj
ICopJmh3LT5zb2MtPnBpbnNbZ3Bpb107DQogDQogCWVyciA9IG10a19od19nZXRfdmFsdWUoaHcs
IGRlc2MsIFBJTkNUUkxfUElOX1JFR19ESVIsICZ2YWx1ZSk7DQotLSANCjIuMTguMA0K

