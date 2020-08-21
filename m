Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3F7D24CD4D
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Aug 2020 07:38:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725968AbgHUFis (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 Aug 2020 01:38:48 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:37738 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725908AbgHUFis (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Aug 2020 01:38:48 -0400
X-UUID: 0618d1d1f11b45cf98e9d0dbab0534b4-20200821
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=plhV+IOc33r8xOeQyemErFzpqgMxm8+GRbRdLCyz3ks=;
        b=IYw1w3cHBysJPBszx3dvF2/yJxCYQdmpJFKN1dWkojOl1xoSyQRDsVqX2GtXBJUumI8TIaYL7OGb8Q538W3wUFWubFrf32uFHlYylX1J2XM0aFk+fkcxr9ZdiTpwaNKL+FgxXzk8yJq728ENE/fPa1uDbehJASrm+zzh5P5kwNo=;
X-UUID: 0618d1d1f11b45cf98e9d0dbab0534b4-20200821
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by mailgw02.mediatek.com
        (envelope-from <light.hsieh@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1114795160; Fri, 21 Aug 2020 13:38:45 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 21 Aug 2020 13:38:38 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 21 Aug 2020 13:38:38 +0800
From:   <light.hsieh@mediatek.com>
To:     <linus.walleij@linaro.org>
CC:     <linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <sean.wang@kernel.org>,
        <kuohong.wang@mediatek.com>, Light Hsieh <light.hsieh@mediatek.com>
Subject: [PATCH v1 1/1] pinctrl: mediatek: remove log message in mtk_hw_pin_field_lookup
Date:   Fri, 21 Aug 2020 13:38:38 +0800
Message-ID: <1597988318-24944-1-git-send-email-light.hsieh@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: 888BF03EA216EF90D2412ABF7D47198C0C2C8BF5E24ACCF6310F5085B41C0D122000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

RnJvbTogTGlnaHQgSHNpZWggPGxpZ2h0LmhzaWVoQG1lZGlhdGVrLmNvbT4NCg0KT3JpZ2luYWxs
eSwgbXRrX2h3X3Bpbl9maWVsZF9sb29rdXAoKSBwcmludCBsb2cgbWVzc2FnZSBpbiAyDQpjb25k
aXRpb25zOg0KMS4gd2hlbiBzb2MgZG9lcyBub3Qgc3VwcG9ydCB0YXJnZXQgcHJvcGVydHkNCjIu
IHdoZW4gdGFyZ2V0IHBpbiBkb2VzIG5vdCBzdXBwb3J0IHRhcmdldCBwcm9wZXJ0eQ0KDQpOb3cs
IG10a19od19waW5fZmllbGRfbG9va3VwKCkgZG9lcyBub3QgcHJpbnQgbG9nIG1lc3NhZ2UgYWNj
b3JkaW5nDQp0byB0aGUgZm9sbG93aW5nIHJhdGlvbmFsZToNCjEuIFVzZXJzIG9mIHBpbmN0cmwg
aGF2ZSB0aGUgZHV0eSB0byBwYXNzIGNvcnJlY3QgcGFyYW1ldGVycyBhbmQNCiAgIGNoZWNrIHJl
dHVybiB2YWxlLiBBZnRlciBjaGVja2luZyByZXR1cm4gdmFsdWUsIHRoZSB1c2VycyBjYW4NCiAg
IGRldGVybWluZSBpZiBsb2cgbWVzc2FnZSBzaGFsbCBiZSBwcmludGVkIGFjY29yZGluZyB0byB1
c2VycycNCiAgIHNjZW5hcmlvLg0KMi4gUHJldmVudCBtZXNzYWdlIGZsb29kaW5nIHdoZW4gYSBi
YWQgdXNlciBjb250aW5vdXNseSBwYXNzIGJhZA0KICAgcGFyYW1ldGVycyB0byBwaW5jdHJsLg0K
DQpTaWduZWQtb2ZmLWJ5OiBMaWdodCBIc2llaCA8bGlnaHQuaHNpZWhAbWVkaWF0ZWsuY29tPg0K
LS0tDQogZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL3BpbmN0cmwtbXRrLWNvbW1vbi12Mi5jIHwg
MTIgKysrLS0tLS0tLS0tDQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgOSBkZWxl
dGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGluY3RybC9tZWRpYXRlay9waW5jdHJs
LW10ay1jb21tb24tdjIuYyBiL2RyaXZlcnMvcGluY3RybC9tZWRpYXRlay9waW5jdHJsLW10ay1j
b21tb24tdjIuYw0KaW5kZXggMmYzZGZiNS4uMTYxZDRlYiAxMDA2NDQNCi0tLSBhL2RyaXZlcnMv
cGluY3RybC9tZWRpYXRlay9waW5jdHJsLW10ay1jb21tb24tdjIuYw0KKysrIGIvZHJpdmVycy9w
aW5jdHJsL21lZGlhdGVrL3BpbmN0cmwtbXRrLWNvbW1vbi12Mi5jDQpAQCAtNzQsMTMgKzc0LDEw
IEBAIHN0YXRpYyBpbnQgbXRrX2h3X3Bpbl9maWVsZF9sb29rdXAoc3RydWN0IG10a19waW5jdHJs
ICpodywNCiAJYm9vbCBmb3VuZCA9IGZhbHNlOw0KIAl1MzIgYml0czsNCiANCi0JaWYgKGh3LT5z
b2MtPnJlZ19jYWwgJiYgaHctPnNvYy0+cmVnX2NhbFtmaWVsZF0ucmFuZ2UpIHsNCisJaWYgKGh3
LT5zb2MtPnJlZ19jYWwgJiYgaHctPnNvYy0+cmVnX2NhbFtmaWVsZF0ucmFuZ2UpDQogCQlyYyA9
ICZody0+c29jLT5yZWdfY2FsW2ZpZWxkXTsNCi0JfSBlbHNlIHsNCi0JCWRldl9kYmcoaHctPmRl
diwNCi0JCQkiTm90IHN1cHBvcnQgZmllbGQgJWQgZm9yIHRoaXMgc29jXG4iLCBmaWVsZCk7DQor
CWVsc2UNCiAJCXJldHVybiAtRU5PVFNVUFA7DQotCX0NCiANCiAJZW5kID0gcmMtPm5yYW5nZXMg
LSAxOw0KIA0KQEAgLTk4LDExICs5NSw4IEBAIHN0YXRpYyBpbnQgbXRrX2h3X3Bpbl9maWVsZF9s
b29rdXAoc3RydWN0IG10a19waW5jdHJsICpodywNCiAJCQlzdGFydCA9IGNoZWNrICsgMTsNCiAJ
fQ0KIA0KLQlpZiAoIWZvdW5kKSB7DQotCQlkZXZfZGJnKGh3LT5kZXYsICJOb3Qgc3VwcG9ydCBm
aWVsZCAlZCBmb3IgcGluID0gJWQgKCVzKVxuIiwNCi0JCQlmaWVsZCwgZGVzYy0+bnVtYmVyLCBk
ZXNjLT5uYW1lKTsNCisJaWYgKCFmb3VuZCkNCiAJCXJldHVybiAtRU5PVFNVUFA7DQotCX0NCiAN
CiAJYyA9IHJjLT5yYW5nZSArIGNoZWNrOw0KIA0KLS0gDQoxLjguMS4xLmRpcnR5DQo=

