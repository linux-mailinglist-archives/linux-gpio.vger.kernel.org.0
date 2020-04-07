Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4DE31A1682
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Apr 2020 22:08:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727354AbgDGUI3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Apr 2020 16:08:29 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:18590 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727349AbgDGUI2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Apr 2020 16:08:28 -0400
X-UUID: 8471fe2b636049fa9f36b0f8e3fb0568-20200408
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=WqSU90W8BDFuk3y8S58rG8mKm4Tc9B0etHGPGZwhauc=;
        b=nOG4bn7wd9ovUAiygI3NOcRDlNPX4dyIje0Ejhh7to6mIDLlGPokoulHf3O8vtXTXD0TFea5396/BcXjzuTAKZqQs8ij26LJawAhhrEZerH6FeOckd1y78Tgb3vxG6AAyiL7SZGoQVNMweKFzPeE9v2kuO0S/+POqIC2ekw08+o=;
X-UUID: 8471fe2b636049fa9f36b0f8e3fb0568-20200408
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw01.mediatek.com
        (envelope-from <sean.wang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 360376222; Wed, 08 Apr 2020 04:08:23 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 8 Apr 2020 04:08:17 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 8 Apr 2020 04:08:18 +0800
From:   <sean.wang@mediatek.com>
To:     <linus.walleij@linaro.org>, <linux-mediatek@lists.infradead.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Light Hsieh <light.hsieh@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH v7 2/2] pinctrl: mediatek: make MediaTek MT6765 pinctrl ready for buiding loadable module
Date:   Wed, 8 Apr 2020 04:08:17 +0800
Message-ID: <42100afe6f97d28447c153bea6b54ea556cf95ca.1586289920.git.sean.wang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <9feeb04805e5a406fe22a92e3f280abda39ddda4.1586289920.git.sean.wang@mediatek.com>
References: <9feeb04805e5a406fe22a92e3f280abda39ddda4.1586289920.git.sean.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

RnJvbTogTGlnaHQgSHNpZWggPGxpZ2h0LmhzaWVoQG1lZGlhdGVrLmNvbT4NCg0KVGhpcyBwYXRj
aCBtYWtlIHBpbmN0cmwtbXQ2NzY1IHJlYWR5IGZvciBidWlsZGluZyBhcyBsb2FkYWJsZSBtb2R1
bGUuDQoNClNpZ25lZC1vZmYtYnk6IFNlYW4gV2FuZyA8c2Vhbi53YW5nQG1lZGlhdGVrLmNvbT4N
ClNpZ25lZC1vZmYtYnk6IExpZ2h0IEhzaWVoIDxsaWdodC5oc2llaEBtZWRpYXRlay5jb20+DQot
LS0NCnY2LT52NzogcmVtb3ZlIGNoYW5nZS1pZA0KLS0tDQogZHJpdmVycy9waW5jdHJsL21lZGlh
dGVrL0tjb25maWcgICAgICAgICAgfCAyICstDQogZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL3Bp
bmN0cmwtbXQ2NzY1LmMgfCA0ICsrKysNCiAyIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9waW5jdHJsL21lZGlhdGVr
L0tjb25maWcgYi9kcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvS2NvbmZpZw0KaW5kZXggNTUxYWM3
MTZiMTBjLi5mMzJkMzY0NGM1MDkgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL3BpbmN0cmwvbWVkaWF0
ZWsvS2NvbmZpZw0KKysrIGIvZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL0tjb25maWcNCkBAIC04
Nyw3ICs4Nyw3IEBAIGNvbmZpZyBQSU5DVFJMX01UMjcxMg0KIAlzZWxlY3QgUElOQ1RSTF9NVEsN
CiANCiBjb25maWcgUElOQ1RSTF9NVDY3NjUNCi0JYm9vbCAiTWVkaWF0ZWsgTVQ2NzY1IHBpbiBj
b250cm9sIg0KKwl0cmlzdGF0ZSAiTWVkaWF0ZWsgTVQ2NzY1IHBpbiBjb250cm9sIg0KIAlkZXBl
bmRzIG9uIE9GDQogCWRlcGVuZHMgb24gQVJNNjQgfHwgQ09NUElMRV9URVNUDQogCWRlZmF1bHQg
QVJNNjQgJiYgQVJDSF9NRURJQVRFSw0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGluY3RybC9tZWRp
YXRlay9waW5jdHJsLW10Njc2NS5jIGIvZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL3BpbmN0cmwt
bXQ2NzY1LmMNCmluZGV4IDkwNWRhZThjM2ZkOC4uMmM1OWQzOTM2MjU2IDEwMDY0NA0KLS0tIGEv
ZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL3BpbmN0cmwtbXQ2NzY1LmMNCisrKyBiL2RyaXZlcnMv
cGluY3RybC9tZWRpYXRlay9waW5jdHJsLW10Njc2NS5jDQpAQCAtNiw2ICs2LDcgQEANCiAgKg0K
ICAqLw0KIA0KKyNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4NCiAjaW5jbHVkZSAicGluY3RybC1t
dGstbXQ2NzY1LmgiDQogI2luY2x1ZGUgInBpbmN0cmwtcGFyaXMuaCINCiANCkBAIC0xMTAzLDMg
KzExMDQsNiBAQCBzdGF0aWMgaW50IF9faW5pdCBtdDY3NjVfcGluY3RybF9pbml0KHZvaWQpDQog
CXJldHVybiBwbGF0Zm9ybV9kcml2ZXJfcmVnaXN0ZXIoJm10Njc2NV9waW5jdHJsX2RyaXZlcik7
DQogfQ0KIGFyY2hfaW5pdGNhbGwobXQ2NzY1X3BpbmN0cmxfaW5pdCk7DQorDQorTU9EVUxFX0xJ
Q0VOU0UoIkdQTCB2MiIpOw0KK01PRFVMRV9ERVNDUklQVElPTigiTWVkaWFUZWsgTVQ2NzY1IFBp
bmN0cmwgRHJpdmVyIik7DQotLSANCjIuMjUuMQ0K

