Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DDD8F1A0827
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Apr 2020 09:22:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727756AbgDGHWZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Apr 2020 03:22:25 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:56687 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726591AbgDGHWZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Apr 2020 03:22:25 -0400
X-UUID: d7f55375fe254678a864b23b132f236f-20200407
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=utm8widddof+A3OuVYBrYQZC1E2LozvtM6pEaLDQE04=;
        b=l+Tkv/u3YSCBtrGh7uPYiTdVmdda1Tyk8GNp7RAOmm2qARCJg+1S7wUC2itLV9TVy/Do5edBEtXIrlxmpNUkMhUdbizVtajpzTjH9AyqCDoegeNz6QK98lTKJl60J02neBfUK09/P8UGthsUErGdtk6dvj7+fvtjIPwlcWkdmWA=;
X-UUID: d7f55375fe254678a864b23b132f236f-20200407
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
        (envelope-from <light.hsieh@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 718477797; Tue, 07 Apr 2020 15:22:19 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 7 Apr 2020 15:22:15 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 7 Apr 2020 15:22:15 +0800
From:   <light.hsieh@mediatek.com>
To:     <linus.walleij@linaro.org>
CC:     <linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <sean.wang@kernel.org>,
        <kuohong.wang@mediatek.com>, Light Hsieh <light.hsieh@mediatek.com>
Subject: [PATCH v6 2/2] pinctrl: mediatek: make MediaTek MT6765 pinctrl ready for buiding loadable module
Date:   Tue, 7 Apr 2020 15:22:10 +0800
Message-ID: <1586244130-21523-3-git-send-email-light.hsieh@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1586244130-21523-1-git-send-email-light.hsieh@mediatek.com>
References: <1586244130-21523-1-git-send-email-light.hsieh@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: AFE7326EF84B9D724EA3663D065E6C8B4AF86494C553AB547ADC88E30E0CF6152000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

RnJvbTogTGlnaHQgSHNpZWggPGxpZ2h0LmhzaWVoQG1lZGlhdGVrLmNvbT4NCg0KVGhpcyBwYXRj
aCBtYWtlIHBpbmN0cmwtbXQ2NzY1IHJlYWR5IGZvciBidWlsZGluZyBhcyBsb2FkYWJsZSBtb2R1
bGUuDQoNCkNoYW5nZS1JZDogSTcyMzFlZjFlZjMwZTkzNWZjMDhlMDQ5YjJjOGNiYWI2YTE5YzY2
ZjUNClNpZ25lZC1vZmYtYnk6IExpZ2h0IEhzaWVoIDxsaWdodC5oc2llaEBtZWRpYXRlay5jb20+
DQotLS0NCiBkcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvS2NvbmZpZyAgICAgICAgICB8IDIgKy0N
CiBkcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvcGluY3RybC1tdDY3NjUuYyB8IDQgKysrKw0KIDIg
ZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQoNCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvS2NvbmZpZyBiL2RyaXZlcnMvcGluY3RybC9t
ZWRpYXRlay9LY29uZmlnDQppbmRleCA1NTFhYzcxLi5mMzJkMzY0IDEwMDY0NA0KLS0tIGEvZHJp
dmVycy9waW5jdHJsL21lZGlhdGVrL0tjb25maWcNCisrKyBiL2RyaXZlcnMvcGluY3RybC9tZWRp
YXRlay9LY29uZmlnDQpAQCAtODcsNyArODcsNyBAQCBjb25maWcgUElOQ1RSTF9NVDI3MTINCiAJ
c2VsZWN0IFBJTkNUUkxfTVRLDQogDQogY29uZmlnIFBJTkNUUkxfTVQ2NzY1DQotCWJvb2wgIk1l
ZGlhdGVrIE1UNjc2NSBwaW4gY29udHJvbCINCisJdHJpc3RhdGUgIk1lZGlhdGVrIE1UNjc2NSBw
aW4gY29udHJvbCINCiAJZGVwZW5kcyBvbiBPRg0KIAlkZXBlbmRzIG9uIEFSTTY0IHx8IENPTVBJ
TEVfVEVTVA0KIAlkZWZhdWx0IEFSTTY0ICYmIEFSQ0hfTUVESUFURUsNCmRpZmYgLS1naXQgYS9k
cml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvcGluY3RybC1tdDY3NjUuYyBiL2RyaXZlcnMvcGluY3Ry
bC9tZWRpYXRlay9waW5jdHJsLW10Njc2NS5jDQppbmRleCA5MDVkYWU4Yy4uMmM1OWQzOSAxMDA2
NDQNCi0tLSBhL2RyaXZlcnMvcGluY3RybC9tZWRpYXRlay9waW5jdHJsLW10Njc2NS5jDQorKysg
Yi9kcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvcGluY3RybC1tdDY3NjUuYw0KQEAgLTYsNiArNiw3
IEBADQogICoNCiAgKi8NCiANCisjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+DQogI2luY2x1ZGUg
InBpbmN0cmwtbXRrLW10Njc2NS5oIg0KICNpbmNsdWRlICJwaW5jdHJsLXBhcmlzLmgiDQogDQpA
QCAtMTEwMywzICsxMTA0LDYgQEAgc3RhdGljIGludCBfX2luaXQgbXQ2NzY1X3BpbmN0cmxfaW5p
dCh2b2lkKQ0KIAlyZXR1cm4gcGxhdGZvcm1fZHJpdmVyX3JlZ2lzdGVyKCZtdDY3NjVfcGluY3Ry
bF9kcml2ZXIpOw0KIH0NCiBhcmNoX2luaXRjYWxsKG10Njc2NV9waW5jdHJsX2luaXQpOw0KKw0K
K01PRFVMRV9MSUNFTlNFKCJHUEwgdjIiKTsNCitNT0RVTEVfREVTQ1JJUFRJT04oIk1lZGlhVGVr
IE1UNjc2NSBQaW5jdHJsIERyaXZlciIpOw0KLS0gDQoxLjguMS4xLmRpcnR5DQo=

