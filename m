Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6CA991622F6
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Feb 2020 10:03:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726193AbgBRJDu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Feb 2020 04:03:50 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:35298 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726262AbgBRJDt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Feb 2020 04:03:49 -0500
X-UUID: a4a37b1308e64430b496325a371776c2-20200218
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=DlP7gUEz9Ia/vWeuqmvg0SYWOZO+KenZYp1SrtwqqiI=;
        b=iPYhH+mgq9a4ecXMskMpW2j6W0iOSnEnQii/E0EDRx+FE4+1ZlZrLqiLGo7vfoXjH5TlD+cQJtL4UrzjZbwsxEG88BD4J6JIIr9SVGB0wTv1QlepfkNxVpzzrW812Pk++2o1veOusGMl+K4vUhro1nS+NTFcVGqdY0iOuQ9dnHw=;
X-UUID: a4a37b1308e64430b496325a371776c2-20200218
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by mailgw02.mediatek.com
        (envelope-from <light.hsieh@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1828405535; Tue, 18 Feb 2020 17:03:43 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 18 Feb 2020 17:01:08 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 18 Feb 2020 17:01:35 +0800
From:   <light.hsieh@mediatek.com>
To:     <linus.walleij@linaro.org>
CC:     <linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <sean.wang@kernel.org>,
        <kuohong.wang@mediatek.com>, Light Hsieh <light.hsieh@mediatek.com>
Subject: [PATCH v1 2/2] pinctrl: make MediaTek MT6765 pinctrl ready for buidling loadable module
Date:   Tue, 18 Feb 2020 17:03:34 +0800
Message-ID: <1582016614-20728-2-git-send-email-light.hsieh@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1582016614-20728-1-git-send-email-light.hsieh@mediatek.com>
References: <1582016614-20728-1-git-send-email-light.hsieh@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: 18E68612A0FB098274AA7C089CD8263AC2969399CECD05502CBF99E6E5D9818A2000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

RnJvbTogTGlnaHQgSHNpZWggPGxpZ2h0LmhzaWVoQG1lZGlhdGVrLmNvbT4NCg0KVGhpcyBwYXRj
aCBtYWtlIHBpbmN0cmwtbXQ2NzY1IHJlYWR5IGZvciBidWlsZGluZyBhcw0KbG9hZGFibGUgbW9k
dWxlLg0KDQpTaWduZWQtb2ZmLWJ5OiBMaWdodCBIc2llaCA8bGlnaHQuaHNpZWhAbWVkaWF0ZWsu
Y29tPg0KLS0tDQogZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL0tjb25maWcgICAgICAgICAgfCAy
ICstDQogZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL3BpbmN0cmwtbXQ2NzY1LmMgfCA0ICsrKysN
CiAyIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KDQpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL0tjb25maWcgYi9kcml2ZXJzL3BpbmN0
cmwvbWVkaWF0ZWsvS2NvbmZpZw0KaW5kZXggNGNkMTEwOS4uYzY0NWZkYiAxMDA2NDQNCi0tLSBh
L2RyaXZlcnMvcGluY3RybC9tZWRpYXRlay9LY29uZmlnDQorKysgYi9kcml2ZXJzL3BpbmN0cmwv
bWVkaWF0ZWsvS2NvbmZpZw0KQEAgLTg5LDcgKzg5LDcgQEAgY29uZmlnIFBJTkNUUkxfTVQyNzEy
DQogCXNlbGVjdCBQSU5DVFJMX01USw0KIA0KIGNvbmZpZyBQSU5DVFJMX01UNjc2NQ0KLQlib29s
ICJNZWRpYXRlayBNVDY3NjUgcGluIGNvbnRyb2wiDQorCXRyaXN0YXRlICJNZWRpYXRlayBNVDY3
NjUgcGluIGNvbnRyb2wiDQogCWRlcGVuZHMgb24gT0YNCiAJZGVwZW5kcyBvbiBBUk02NCB8fCBD
T01QSUxFX1RFU1QNCiAJZGVmYXVsdCBBUk02NCAmJiBBUkNIX01FRElBVEVLDQpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL3BpbmN0cmwtbXQ2NzY1LmMgYi9kcml2ZXJzL3Bp
bmN0cmwvbWVkaWF0ZWsvcGluY3RybC1tdDY3NjUuYw0KaW5kZXggOTA1ZGFlOGMuLjJjNTlkMzkg
MTAwNjQ0DQotLS0gYS9kcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvcGluY3RybC1tdDY3NjUuYw0K
KysrIGIvZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL3BpbmN0cmwtbXQ2NzY1LmMNCkBAIC02LDYg
KzYsNyBAQA0KICAqDQogICovDQogDQorI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPg0KICNpbmNs
dWRlICJwaW5jdHJsLW10ay1tdDY3NjUuaCINCiAjaW5jbHVkZSAicGluY3RybC1wYXJpcy5oIg0K
IA0KQEAgLTExMDMsMyArMTEwNCw2IEBAIHN0YXRpYyBpbnQgX19pbml0IG10Njc2NV9waW5jdHJs
X2luaXQodm9pZCkNCiAJcmV0dXJuIHBsYXRmb3JtX2RyaXZlcl9yZWdpc3RlcigmbXQ2NzY1X3Bp
bmN0cmxfZHJpdmVyKTsNCiB9DQogYXJjaF9pbml0Y2FsbChtdDY3NjVfcGluY3RybF9pbml0KTsN
CisNCitNT0RVTEVfTElDRU5TRSgiR1BMIHYyIik7DQorTU9EVUxFX0RFU0NSSVBUSU9OKCJNZWRp
YVRlayBNVDY3NjUgUGluY3RybCBEcml2ZXIiKTsNCi0tIA0KMS44LjEuMS5kaXJ0eQ0K

