Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D008144C0D
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Jan 2020 07:54:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729075AbgAVGxf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Jan 2020 01:53:35 -0500
Received: from mailgw01.mediatek.com ([210.61.82.183]:59883 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725943AbgAVGxX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Jan 2020 01:53:23 -0500
X-UUID: 1f616583f71844a0896fea33dd6be950-20200122
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=KYKiD5j0ZkuE2k7CXv0OEhneTSIarHmN4pmbVSrJZz8=;
        b=eghCJLxeziOYKvwI4vWWwkGf2rnRVXpNblJVhYYadSKHYCGcvg/zemHUZAWD7gAUVu8CCRgf6Nrwl1JScQDBzD3UZG7pkYzrdQi//cs7/f3ilsF/z1zSIkd3xT8iPT8CF06Ldc/x7M32fUl3GMZ2NAjY6mXgYAlyL/J00rOqxYs=;
X-UUID: 1f616583f71844a0896fea33dd6be950-20200122
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw01.mediatek.com
        (envelope-from <light.hsieh@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 510908576; Wed, 22 Jan 2020 14:53:18 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 22 Jan 2020 14:52:13 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 22 Jan 2020 14:51:58 +0800
From:   <light.hsieh@mediatek.com>
To:     <linus.walleij@linaro.org>
CC:     <linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <sean.wang@kernel.org>,
        <kuohong.wang@mediatek.com>, Light Hsieh <light.hsieh@mediatek.com>
Subject: [PATCH v8 4/6] pinctrl: mediatek: Refine mtk_pinconf_get()
Date:   Wed, 22 Jan 2020 14:53:12 +0800
Message-ID: <1579675994-7001-4-git-send-email-light.hsieh@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1579675994-7001-1-git-send-email-light.hsieh@mediatek.com>
References: <1579675994-7001-1-git-send-email-light.hsieh@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: E6CD82C4D7810ABB8729827AAB2874B5D67870C461F194C83EDB7B24F76FD18F2000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

RnJvbTogTGlnaHQgSHNpZWggPGxpZ2h0LmhzaWVoQG1lZGlhdGVrLmNvbT4NCg0KQ29ycmVjdCBj
YXNlcyBmb3IgUElOX0NPTkZJR19TTEVXX1JBVEUsIFBJTl9DT05GSUdfSU5QVVRfU0NITUlUVF9F
TkFCTEUsDQphbmQgUElOX0NPTkZJR19PVVRQVVRfRU5BQkxFIC0NClVzZSB2YXJpYWJsZSByZXQg
dG8gcmVjZWl2ZSB2YWx1ZSBpbiBtdGtfaHdfZ2V0X3ZhbHVlKCkgKGluc3RlYWQgb2YNCnZhcmlh
YmxlIHZhbCkgc2luY2UgcGluY29uZl90b19jb25maWdfcGFja2VkKCkgYXQgZW5kIG9mIHRoaXMg
ZnVuY3Rpb24NCnVzZSB2YXJpYWJsZSByZXQgdG8gcGFjayBjb25maWcgdmFsdWUuDQoNClNpZ25l
ZC1vZmYtYnk6IExpZ2h0IEhzaWVoIDxsaWdodC5oc2llaEBtZWRpYXRlay5jb20+DQotLS0NCiBk
cml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvcGluY3RybC1wYXJpcy5jIHwgNDAgKysrKysrKysrKysr
LS0tLS0tLS0tLS0tLS0tLS0tLS0NCiAxIGZpbGUgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwg
MjUgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsv
cGluY3RybC1wYXJpcy5jIGIvZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL3BpbmN0cmwtcGFyaXMu
Yw0KaW5kZXggMmYwNzUwMC4uZDA5YTcyNiAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvcGluY3RybC9t
ZWRpYXRlay9waW5jdHJsLXBhcmlzLmMNCisrKyBiL2RyaXZlcnMvcGluY3RybC9tZWRpYXRlay9w
aW5jdHJsLXBhcmlzLmMNCkBAIC03OCw3ICs3OCw3IEBAIHN0YXRpYyBpbnQgbXRrX3BpbmNvbmZf
Z2V0KHN0cnVjdCBwaW5jdHJsX2RldiAqcGN0bGRldiwNCiB7DQogCXN0cnVjdCBtdGtfcGluY3Ry
bCAqaHcgPSBwaW5jdHJsX2Rldl9nZXRfZHJ2ZGF0YShwY3RsZGV2KTsNCiAJdTMyIHBhcmFtID0g
cGluY29uZl90b19jb25maWdfcGFyYW0oKmNvbmZpZyk7DQotCWludCB2YWwsIHZhbDIsIGVyciwg
cmVnLCByZXQgPSAxOw0KKwlpbnQgZXJyLCByZWcsIHJldCA9IDE7DQogCWNvbnN0IHN0cnVjdCBt
dGtfcGluX2Rlc2MgKmRlc2M7DQogDQogCWlmIChwaW4gPj0gaHctPnNvYy0+bnBpbnMpIHsNCkBA
IC0xMDcsMTcgKzEwNywxMSBAQCBzdGF0aWMgaW50IG10a19waW5jb25mX2dldChzdHJ1Y3QgcGlu
Y3RybF9kZXYgKnBjdGxkZXYsDQogCQkJZXJyID0gLUVOT1RTVVBQOw0KIAkJYnJlYWs7DQogCWNh
c2UgUElOX0NPTkZJR19TTEVXX1JBVEU6DQotCQllcnIgPSBtdGtfaHdfZ2V0X3ZhbHVlKGh3LCBk
ZXNjLCBQSU5DVFJMX1BJTl9SRUdfU1IsICZ2YWwpOw0KLQkJaWYgKGVycikNCi0JCQlyZXR1cm4g
ZXJyOw0KLQ0KLQkJaWYgKCF2YWwpDQotCQkJcmV0dXJuIC1FSU5WQUw7DQotDQorCQllcnIgPSBt
dGtfaHdfZ2V0X3ZhbHVlKGh3LCBkZXNjLCBQSU5DVFJMX1BJTl9SRUdfU1IsICZyZXQpOw0KIAkJ
YnJlYWs7DQogCWNhc2UgUElOX0NPTkZJR19JTlBVVF9FTkFCTEU6DQogCWNhc2UgUElOX0NPTkZJ
R19PVVRQVVRfRU5BQkxFOg0KLQkJZXJyID0gbXRrX2h3X2dldF92YWx1ZShodywgZGVzYywgUElO
Q1RSTF9QSU5fUkVHX0RJUiwgJnZhbCk7DQorCQllcnIgPSBtdGtfaHdfZ2V0X3ZhbHVlKGh3LCBk
ZXNjLCBQSU5DVFJMX1BJTl9SRUdfRElSLCAmcmV0KTsNCiAJCWlmIChlcnIpDQogCQkJZ290byBv
dXQ7DQogCQkvKiAgICAgQ09ORklHICAgICBDdXJyZW50IGRpcmVjdGlvbiByZXR1cm4gdmFsdWUN
CkBAIC0xMjgsMjAgKzEyMiwyMiBAQCBzdGF0aWMgaW50IG10a19waW5jb25mX2dldChzdHJ1Y3Qg
cGluY3RybF9kZXYgKnBjdGxkZXYsDQogCQkgKiAgICAgICAgICAgICAgICAgICAgIGlucHV0ICAg
ICAgICAxICg9IHJldmVyc2UgSFcgdmFsdWUpDQogCQkgKi8NCiAJCWlmIChwYXJhbSA9PSBQSU5f
Q09ORklHX0lOUFVUX0VOQUJMRSkNCi0JCQl2YWwgPSAhdmFsOw0KKwkJCXJldCA9ICFyZXQ7DQog
DQogCQlicmVhazsNCiAJY2FzZSBQSU5fQ09ORklHX0lOUFVUX1NDSE1JVFRfRU5BQkxFOg0KLQkJ
ZXJyID0gbXRrX2h3X2dldF92YWx1ZShodywgZGVzYywgUElOQ1RSTF9QSU5fUkVHX0RJUiwgJnZh
bCk7DQorCQllcnIgPSBtdGtfaHdfZ2V0X3ZhbHVlKGh3LCBkZXNjLCBQSU5DVFJMX1BJTl9SRUdf
RElSLCAmcmV0KTsNCiAJCWlmIChlcnIpDQotCQkJcmV0dXJuIGVycjsNCi0NCi0JCWVyciA9IG10
a19od19nZXRfdmFsdWUoaHcsIGRlc2MsIFBJTkNUUkxfUElOX1JFR19TTVQsICZ2YWwyKTsNCi0J
CWlmIChlcnIpDQotCQkJcmV0dXJuIGVycjsNCisJCQlnb3RvIG91dDsNCisJCS8qIHJldHVybiBl
cnJvciB3aGVuIGluIG91dHB1dCBtb2RlDQorCQkgKiBiZWNhdXNlIHNjaG1pdHQgdHJpZ2dlciBv
bmx5IHdvcmsgaW4gaW5wdXQgbW9kZQ0KKwkJICovDQorCQlpZiAocmV0KSB7DQorCQkJZXJyID0g
LUVJTlZBTDsNCisJCQlnb3RvIG91dDsNCisJCX0NCiANCi0JCWlmICh2YWwgfHwgIXZhbDIpDQot
CQkJcmV0dXJuIC1FSU5WQUw7DQorCQllcnIgPSBtdGtfaHdfZ2V0X3ZhbHVlKGh3LCBkZXNjLCBQ
SU5DVFJMX1BJTl9SRUdfU01ULCAmcmV0KTsNCiANCiAJCWJyZWFrOw0KIAljYXNlIFBJTl9DT05G
SUdfRFJJVkVfU1RSRU5HVEg6DQpAQCAtMTU0LDEzICsxNTAsNyBAQCBzdGF0aWMgaW50IG10a19w
aW5jb25mX2dldChzdHJ1Y3QgcGluY3RybF9kZXYgKnBjdGxkZXYsDQogCWNhc2UgTVRLX1BJTl9D
T05GSUdfUkRTRUw6DQogCQlyZWcgPSAocGFyYW0gPT0gTVRLX1BJTl9DT05GSUdfVERTRUwpID8N
CiAJCSAgICAgICBQSU5DVFJMX1BJTl9SRUdfVERTRUwgOiBQSU5DVFJMX1BJTl9SRUdfUkRTRUw7
DQotDQotCQllcnIgPSBtdGtfaHdfZ2V0X3ZhbHVlKGh3LCBkZXNjLCByZWcsICZ2YWwpOw0KLQkJ
aWYgKGVycikNCi0JCQlyZXR1cm4gZXJyOw0KLQ0KLQkJcmV0ID0gdmFsOw0KLQ0KKwkJZXJyID0g
bXRrX2h3X2dldF92YWx1ZShodywgZGVzYywgcmVnLCAmcmV0KTsNCiAJCWJyZWFrOw0KIAljYXNl
IE1US19QSU5fQ09ORklHX1BVX0FEVjoNCiAJY2FzZSBNVEtfUElOX0NPTkZJR19QRF9BRFY6DQot
LSANCjEuOC4xLjEuZGlydHkNCg==

