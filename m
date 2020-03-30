Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3019A197B6D
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2020 14:01:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730007AbgC3MBF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 30 Mar 2020 08:01:05 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:11759 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729669AbgC3MBF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Mar 2020 08:01:05 -0400
X-UUID: 96ff805310634a11adf74684f0d434c7-20200330
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Kiqp2ZjN5cJpdx9vGYZmzVbMbWNtHznGsl1vNvxEzyU=;
        b=U47aYvLPHqj6cL+Y+Xvjmi/XM4YHXmU3pHACfsijZkn2cdt6pPUDmB5G4UoKGqtrqJpMKpCLlotRahuOUe9DU9ZU04wFZsa5FxrX2soyNqhukJGctowftWIdXSXn0maAKL03aoolwInIF6s7ztzo/8K2e0Jx+gytaKgxrxIo/d8=;
X-UUID: 96ff805310634a11adf74684f0d434c7-20200330
Received: from mtkcas09.mediatek.inc [(172.21.101.178)] by mailgw01.mediatek.com
        (envelope-from <light.hsieh@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1956840093; Mon, 30 Mar 2020 20:00:51 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 30 Mar 2020 20:00:46 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 30 Mar 2020 20:00:48 +0800
From:   <light.hsieh@mediatek.com>
To:     <linus.walleij@linaro.org>
CC:     <linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <sean.wang@kernel.org>,
        <kuohong.wang@mediatek.com>, Light Hsieh <light.hsieh@mediatek.com>
Subject: [PATCH v5 2/2] pinctrl: mediatek: make MediaTek MT6765 pinctrl ready for buiding loadable module
Date:   Mon, 30 Mar 2020 20:00:48 +0800
Message-ID: <1585569648-14017-3-git-send-email-light.hsieh@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1585569648-14017-1-git-send-email-light.hsieh@mediatek.com>
References: <1585569648-14017-1-git-send-email-light.hsieh@mediatek.com>
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
bGUuDQoNClNpZ25lZC1vZmYtYnk6IExpZ2h0IEhzaWVoIDxsaWdodC5oc2llaEBtZWRpYXRlay5j
b20+DQpSZXZpZXdlZC1ieTogTWF0dGhpYXMgQnJ1Z2dlciA8bWF0dGhpYXMuYmdnQGdtYWlsLmNv
bT4NCi0tLQ0KIGRyaXZlcnMvcGluY3RybC9tZWRpYXRlay9LY29uZmlnICAgICAgICAgIHwgMiAr
LQ0KIGRyaXZlcnMvcGluY3RybC9tZWRpYXRlay9waW5jdHJsLW10Njc2NS5jIHwgNCArKysrDQog
MiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCg0KZGlmZiAt
LWdpdCBhL2RyaXZlcnMvcGluY3RybC9tZWRpYXRlay9LY29uZmlnIGIvZHJpdmVycy9waW5jdHJs
L21lZGlhdGVrL0tjb25maWcNCmluZGV4IDU1MWFjNzEuLmYzMmQzNjQgMTAwNjQ0DQotLS0gYS9k
cml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvS2NvbmZpZw0KKysrIGIvZHJpdmVycy9waW5jdHJsL21l
ZGlhdGVrL0tjb25maWcNCkBAIC04Nyw3ICs4Nyw3IEBAIGNvbmZpZyBQSU5DVFJMX01UMjcxMg0K
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

