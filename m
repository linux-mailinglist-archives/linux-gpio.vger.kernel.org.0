Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC336164295
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Feb 2020 11:51:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726682AbgBSKv7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 Feb 2020 05:51:59 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:3927 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726469AbgBSKv6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 Feb 2020 05:51:58 -0500
X-UUID: 3877b925f684492badae9ed1ceb8d9af-20200219
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=B5BznUHUuKJwe4ePhTxbIRuKxxbW9yIzrNyklbjyAaU=;
        b=jYRl4DEL62MamkR/5Xkut9+1PlWz10ux/CE5h4TUQ3XvZq/PW2BNiAmatQpQ+Zb5gawezi+lBycTHIgZhsoSsTF41qwJdIQRXv1w7PfPhA/bpuO6G0npSSKBo5jPfyIaODKNORMG1J7ay2m5k2iUMy5AsQACikszKiFUKN0BA08=;
X-UUID: 3877b925f684492badae9ed1ceb8d9af-20200219
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by mailgw02.mediatek.com
        (envelope-from <light.hsieh@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1946344153; Wed, 19 Feb 2020 18:51:54 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 19 Feb 2020 18:51:08 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 19 Feb 2020 18:51:18 +0800
From:   <light.hsieh@mediatek.com>
To:     <linus.walleij@linaro.org>
CC:     <linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <sean.wang@kernel.org>,
        <kuohong.wang@mediatek.com>, Light Hsieh <light.hsieh@mediatek.com>
Subject: [RESEND PATCH v2 2/2] pinctrl: make MediaTek MT6765 pinctrl ready for buidling loadable module
Date:   Wed, 19 Feb 2020 18:51:22 +0800
Message-ID: <1582109482-13625-2-git-send-email-light.hsieh@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1582109482-13625-1-git-send-email-light.hsieh@mediatek.com>
References: <1582109482-13625-1-git-send-email-light.hsieh@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: A089DB8D829F8D46621F838D0090F255D1F6D9A56457DBACE20C27AC1C623EBF2000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

RnJvbTogTGlnaHQgSHNpZWggPGxpZ2h0LmhzaWVoQG1lZGlhdGVrLmNvbT4NCg0KVGhpcyBwYXRj
aCBtYWtlIHBpbmN0cmwtbXQ2NzY1IHJlYWR5IGZvciBidWlsZGluZyBhcyBsb2FkYWJsZSBtb2R1
bGUuDQoNClNpZ25lZC1vZmYtYnk6IExpZ2h0IEhzaWVoIDxsaWdodC5oc2llaEBtZWRpYXRlay5j
b20+DQpSZXZpZXdlZC1ieTogTWF0dGhpYXMgQnJ1Z2dlciA8bWF0dGhpYXMuYmdnQGdtYWlsLmNv
bT4NCi0tLQ0KIGRyaXZlcnMvcGluY3RybC9tZWRpYXRlay9LY29uZmlnICAgICAgICAgIHwgMiAr
LQ0KIGRyaXZlcnMvcGluY3RybC9tZWRpYXRlay9waW5jdHJsLW10Njc2NS5jIHwgNCArKysrDQog
MiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCg0KZGlmZiAt
LWdpdCBhL2RyaXZlcnMvcGluY3RybC9tZWRpYXRlay9LY29uZmlnIGIvZHJpdmVycy9waW5jdHJs
L21lZGlhdGVrL0tjb25maWcNCmluZGV4IDRjZDExMDkuLmM2NDVmZGIgMTAwNjQ0DQotLS0gYS9k
cml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvS2NvbmZpZw0KKysrIGIvZHJpdmVycy9waW5jdHJsL21l
ZGlhdGVrL0tjb25maWcNCkBAIC04OSw3ICs4OSw3IEBAIGNvbmZpZyBQSU5DVFJMX01UMjcxMg0K
IAlzZWxlY3QgUElOQ1RSTF9NVEsNCiANCiBjb25maWcgUElOQ1RSTF9NVDY3NjUNCi0JYm9vbCAi
TWVkaWF0ZWsgTVQ2NzY1IHBpbiBjb250cm9sIg0KKwl0cmlzdGF0ZSAiTWVkaWF0ZWsgTVQ2NzY1
IHBpbiBjb250cm9sIg0KIAlkZXBlbmRzIG9uIE9GDQogCWRlcGVuZHMgb24gQVJNNjQgfHwgQ09N
UElMRV9URVNUDQogCWRlZmF1bHQgQVJNNjQgJiYgQVJDSF9NRURJQVRFSw0KZGlmZiAtLWdpdCBh
L2RyaXZlcnMvcGluY3RybC9tZWRpYXRlay9waW5jdHJsLW10Njc2NS5jIGIvZHJpdmVycy9waW5j
dHJsL21lZGlhdGVrL3BpbmN0cmwtbXQ2NzY1LmMNCmluZGV4IDkwNWRhZThjLi4yYzU5ZDM5IDEw
MDY0NA0KLS0tIGEvZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL3BpbmN0cmwtbXQ2NzY1LmMNCisr
KyBiL2RyaXZlcnMvcGluY3RybC9tZWRpYXRlay9waW5jdHJsLW10Njc2NS5jDQpAQCAtNiw2ICs2
LDcgQEANCiAgKg0KICAqLw0KIA0KKyNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4NCiAjaW5jbHVk
ZSAicGluY3RybC1tdGstbXQ2NzY1LmgiDQogI2luY2x1ZGUgInBpbmN0cmwtcGFyaXMuaCINCiAN
CkBAIC0xMTAzLDMgKzExMDQsNiBAQCBzdGF0aWMgaW50IF9faW5pdCBtdDY3NjVfcGluY3RybF9p
bml0KHZvaWQpDQogCXJldHVybiBwbGF0Zm9ybV9kcml2ZXJfcmVnaXN0ZXIoJm10Njc2NV9waW5j
dHJsX2RyaXZlcik7DQogfQ0KIGFyY2hfaW5pdGNhbGwobXQ2NzY1X3BpbmN0cmxfaW5pdCk7DQor
DQorTU9EVUxFX0xJQ0VOU0UoIkdQTCB2MiIpOw0KK01PRFVMRV9ERVNDUklQVElPTigiTWVkaWFU
ZWsgTVQ2NzY1IFBpbmN0cmwgRHJpdmVyIik7DQotLSANCjEuOC4xLjEuZGlydHkNCg==

